unit uSPService;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, IdCustomHTTPServer, uSMS, EncdDecd,
  uImportVio, uRmService, qjson, uSurveilVio, uHikDSJ, uHikHumanFace,
  Generics.Collections, StrUtils, uTokenManager, ActiveX, uExamService,
  uHuiZhouKaoHe, uHumanFace;

type
  TSPService = Class
  private
    class function GetCCLZRQ(token: TToken; Params: TStrings): String;
    class function GetWFJFS(cclzrq: TDateTime; token: TToken;
      Params: TStrings): Integer;
    class function GetActions(): String; static;
    class function GetZhptCode(xtlb, dmlb, dmz: String): String;
    class function GetSGZR(Params: TStrings): String;
    class function GetTJJG(Params: TStrings): String;
    class procedure GetLocalDrvInfo(token: TToken; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure GetLocalVehInfo(token: TToken; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure GetJFS(token: TToken; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure GetWfXwByVeh(token: TToken; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class function UploadSpotPic(token: TToken; Params: TStrings): String;
  public
    class property Actions: String read GetActions;
    class procedure DoSP(action, tokenKey: String; Params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
  end;

implementation

class function TSPService.GetActions: String;
begin
  Result := ',GETPASSLIST,SENDSMS,ANALYSISONEPIC,IMPORTVIO,GETLOCALVEHINFO,' +
    'GETLOCALDRVINFO,SAVESURVEILVIO,GETSGZR,GETTJJG,GETJFS,GETEXAMDATA,GETWFXWBYVEH,'
    + 'UPLOADSPOTPIC,VEHCHECK,ADDGPS,GETHUMANFACECOMPARE,GETALGORITHM,GETREPOSITORIES,';
end;

class function TSPService.GetCCLZRQ(token: TToken; Params: TStrings): String;
var
  json: String;
begin
  Result := '-1';
  json := TCommon.QueryDrvInfo(Params.Values['SFZMHM'], Params.Values['DABH']);
  if (json = '') or (json = '-1') then
    json := TRmService.GetDrvInfo(token, Params);
  if (json = '') or (json = '-1') then
    exit;
  Result := TCommon.GetJsonNode('cclzrq', json) + ' 00:00:00';
end;

class function TSPService.GetWFJFS(cclzrq: TDateTime; token: TToken;
  Params: TStrings): Integer;
var
  vioStr: String;
  qjson, jsonItem: TQJson;
  i, wfjfs: Integer;
  jfrq, jfks, jfjs, wfsj: TDateTime;
begin
  Result := 0;
  jfrq := TCommon.StringToDT(FormatDateTime('yyyy', Now()) + '-' +
    FormatDateTime('mm-dd', cclzrq) + ' 00:00:00');
  if jfrq > Now() then
  begin
    jfks := jfrq - 365;
    jfjs := jfrq;
  end
  else
  begin
    jfks := jfrq;
    jfjs := jfrq + 365;
  end;

  vioStr := TRmService.GetVioInfoByDrv(token, Params);
  qjson := TQJson.Create;
  try
    qjson.Parse(vioStr);
    for i := 0 to qjson.Count - 1 do
    begin
      jsonItem := qjson.Items[i];
      wfsj := TCommon.StringToDT(TCommon.GetJsonNode('wfsj',
        jsonItem.ToString));
      wfjfs := StrToIntDef(TCommon.GetJsonNode('wfjfs', jsonItem.ToString), 0);
      // gLogger.Info(jsonItem.ToString);
      if (wfsj > jfks) and (wfsj < jfjs) then
        Result := Result + wfjfs;
    end;
  except
    on e: exception do
      gLogger.Error(e.Message);
  end;
  qjson.Free;
end;

class procedure TSPService.GetWfXwByVeh(token: TToken; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  hphm, hpzl, wslb, json, clzt, qzcslx, wfxwmc, je, jf, tmpClzt, s: String;
  ts, wfxwList: TStrings;
  c: Integer;
  i: Integer;
begin
  hphm := Params.Values['hphm'];
  hpzl := Params.Values['hpzl'];
  wslb := Params.Values['wslb'];
  s := '';

  wfxwList := TStringList.Create;

  json := TRmService.GetVehinfo(token, hphm, hpzl);
  if json = '' then
  begin
    if TCommon.DicSpotWfxw.ContainsKey('JP') then
      wfxwList.Add(TCommon.DicSpotWfxw['JP']);
  end
  else if json <> '-1' then
  begin
    clzt := TCommon.GetJsonNode('zt', json);
    if TCommon.DicSpotWfxw.ContainsKey(clzt) then
      wfxwList.Add(TCommon.DicSpotWfxw[clzt])
    else
    begin
      if clzt.Contains('G') then
      begin
        ts := TStringList.Create;
        ts.Add('hphm=' + hphm);
        ts.Add('hpzl=' + hpzl);
        ts.Add('clbj=0');
        c := TRmService.DoGetVioCount(token, ts);
        if c >= 10 then
          tmpClzt := 'G2'
        else if c >= 3 then
          tmpClzt := 'G1';
        if TCommon.DicSpotWfxw.ContainsKey(tmpClzt) then
          wfxwList.Add(TCommon.DicSpotWfxw[tmpClzt]);
        ts.Free;
      end;
      if clzt.Contains('Q') then
      begin
        if wslb = '6' then
          tmpClzt := 'Q1'
        else
          tmpClzt := 'Q2';
        if TCommon.DicSpotWfxw.ContainsKey(tmpClzt) then
          wfxwList.Add(TCommon.DicSpotWfxw[tmpClzt]);
      end;
    end;
  end;
  for i := 0 to wfxwList.Count - 1 do
  begin
    with gSQLHelper.Query('select wfxwmc, je, jf, qzcslx from ' + CDBName +
      '.dbo.T_VIO_ILLECODE where wfxwdm=' + wfxwList[i].QuotedString) do
    begin
      if not Eof then
      begin
        wfxwmc := Fields[0].AsString;
        je := Fields[1].AsString;
        jf := Fields[2].AsString;
        qzcslx := Fields[3].AsString;
        s := s + ',{"wfxwdm":"' + wfxwList[i] + '","wfxwmc":"' + wfxwmc +
          '","je":"' + je + '","jf":"' + jf + '","qzcslx":"' + qzcslx + '"}';
      end;
      Free;
    end;
  end;
  wfxwList.Free;

  if s <> '' then
    s := '[' + s.Substring(1) + ']';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
end;

class procedure TSPService.GetJFS(token: TToken; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  sfzmhm: String;
  cclzrq: TDateTime;
  jfs: Integer;
begin
  sfzmhm := Params.Values['sfzmhm'];
  if sfzmhm = '' then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('sfzmhm is not found');
    exit;
  end;
  cclzrq := TCommon.StringToDT(GetCCLZRQ(token, Params));
  if cclzrq < 2 then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('Query error');
    exit;
  end;
  Params.Clear;
  Params.Add('jszh=' + sfzmhm);
  jfs := 12 - GetWFJFS(cclzrq, token, Params);
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
    ('"' + IntToStr(jfs) + '"');
end;

class procedure TSPService.GetLocalDrvInfo(token: TToken; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: String;
begin
  json := TCommon.QueryDrvInfo(Params.Values['SFZMHM'], Params.Values['DABH']);
  if (json = '') or (json = '-1') then
    json := TRmService.GetDrvInfo(token, Params);
  if (json = '') or (json = '-1') then
    json := '{}';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
end;

class procedure TSPService.GetLocalVehInfo(token: TToken; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  hphm, hpzl, json: String;
begin
  hphm := Params.Values['hphm'];
  hpzl := Params.Values['hpzl'];
  json := TCommon.QueryVehInfo(hphm, hpzl);
  if (json = '-1') or (json = '') then
    json := TRmService.GetVehinfo(token, hphm, hpzl);
  if (json = '-1') or (json = '') then
    json := '{}';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
end;

class function TSPService.GetZhptCode(xtlb, dmlb, dmz: String): String;
begin
  Result := gSQLHelper.GetSinge('select DMSM1 from ' + CDBName +
    '.dbo.T_VIO_CODE where xtlb=' + xtlb.QuotedString + ' and dmlb=' +
    dmlb.QuotedString + ' and dmz = ' + dmz.QuotedString);
end;

class function TSPService.UploadSpotPic(token: TToken;
  Params: TStrings): String;
var
  pic, tp, dir: String;
begin
  Result := '';
  pic := Params.Values['pic'];
  tp := token.Login + FormatDateTime('yyyymmddhhnnsszzz', Now()) + '.jpg';
  if not TCommon.Base64ToFile(pic, ExtractFilePath(Paramstr(0)) + tp) or
    not FileExists(ExtractFilePath(Paramstr(0)) + tp) then
  begin
    Result := TCommon.AssembleFailedHttpResult('base64字符串有误');
    exit;
  end;

  dir := 'clientvio/' + FormatDateTime('yyyymm-dd', Now()) + '/';

  if TCommon.FtpPutFile(gConfig.ImportVioHost, gConfig.ImportVioUser,
    gConfig.ImportVioPassword, ExtractFilePath(Paramstr(0)) + tp,
    '/' + dir + tp, gConfig.ImportVioPort) then
    Result := TCommon.AssembleSuccessHttpResult
      ('{"url":"' + gConfig.ImportVioHome + dir + tp + '"}')
  else
    Result := TCommon.AssembleFailedHttpResult('上传失败');
  DeleteFile(ExtractFilePath(Paramstr(0)) + tp);
end;

class procedure TSPService.DoSP(action, tokenKey: String; Params: TStrings;
  isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
var
  s, msg, page, pageSize, passtime: String;
  token: TToken;
  kssj, jssj: Int64;
  i: Integer;
  param: TDictionary<string, String>;
begin
  ActiveX.CoInitialize(nil);
  token := gTokenManager.GetToken(tokenKey);
  if action = UpperCase('GetPassList') then
  begin
    param := TDictionary<string, String>.Create;
    for i := 0 to Params.Count - 1 do
    begin
      if UpperCase(Params.Names[i]) = 'CURRENTPAGE' then
      begin
        page := Params.ValueFromIndex[i];
        page := IntToStr(StrToIntDef(page, 0) + 1);
      end
      else if UpperCase(Params.Names[i]) = 'PAGESIZE' then
        pageSize := Params.ValueFromIndex[i]
      else if UpperCase(Params.Names[i]) = 'KSSJ' then
        kssj := StrToInt64Def(Params.ValueFromIndex[i], -346789)
      else if UpperCase(Params.Names[i]) = 'JSSJ' then
        jssj := StrToInt64Def(Params.ValueFromIndex[i], -346789)
      else if Trim(Params.Names[i]) <> '' then
        param.Add(Trim(Params.Names[i]), Params.ValueFromIndex[i]);
    end;
    if (kssj <> -346789) and (jssj <> -346789) then
    begin
      passtime := FormatDateTime('yyyy-mm-dd hh:nn:ss',
        TCommon.GetRealDatetime(kssj)) + ',' +
        FormatDateTime('yyyy-mm-dd hh:nn:ss', TCommon.GetRealDatetime(jssj));
      param.Add('passtime', passtime);
    end;
    s := THIKDSJ.moreLikeThis(param, page, pageSize);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
    param.Free;
  end
  else if action = UpperCase('SendSMS') then
  begin
    if TSMS.SendSMS(Params.Values['sn'], Params.Values['sjhm'],
      Params.Values['content']) then
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('error');
  end
  else if action = UpperCase('ImportVio') then
  begin
    TImportVio.ImportVio(tokenKey, Params.Values['wfxw'],
      Params.Values['pic1Name'], Params.Values['pic1'], Params.Values['pic2'],
      AResponseInfo);
  end
  else if action = UpperCase('GetLocalVehInfo') then
  begin
    GetLocalVehInfo(token, Params, AResponseInfo);
  end
  else if action = 'GETLOCALDRVINFO' then
  begin
    GetLocalDrvInfo(token, Params, AResponseInfo);
  end
  else if action = 'SAVESURVEILVIO' then
  begin
    TSurveilVio.SaveSurveilVio(tokenKey, Params, AResponseInfo);
  end
  else if action = 'GETSGZR' then
  begin
    s := GetSGZR(Params);
    if s = '' then
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('error')
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
        ('"' + s + '"');
  end
  else if action = 'GETTJJG' then
  begin
    s := GetTJJG(Params);
    if s = '' then
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('error')
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
        ('"' + s + '"');
  end
  else if action = 'GETJFS' then
  begin
    GetJFS(token, Params, AResponseInfo);
  end
  else if action = 'GETWFXWBYVEH' then
    GetWfXwByVeh(token, Params, AResponseInfo)
  else if action = UpperCase('GetExamData') then
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
      (TExamService.GetExamData)
  else if action = 'UPLOADSPOTPIC' then
    AResponseInfo.ContentText := UploadSpotPic(token, Params)
  else if action = 'VEHCHECK' then
  begin
    TRmService.DoRM(action, tokenKey, Params, isExport, AResponseInfo);
    if AResponseInfo.ContentText.Contains('"code":"1"') then
    begin
      s := 'update yjitsdb.dbo.serv_veh_check set sfd=''' + Params.Values['SFD']
        + '''' + ' where hphm=''' + Params.Values['HPHM'] + ''' and ' +
        ' HPZL=''' + Params.Values['HPZL'] +
        ''' and gxsj>dateadd(mi, -20, getdate())';
      gSQLHelper.ExecuteSql(s);
    end;
  end
  else if action = 'GETHUMANFACECOMPARE' then
  begin
    s := THumanFace.GetHumanFaceCompare(Params, msg);
    if msg <> '' then
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(msg)
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
  end
  else if action = 'GETALGORITHM' then
  begin
    s := THumanFace.GetAlgorithm(Params, msg);
    if msg <> '' then
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(msg)
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
  end
  else if action = 'GETREPOSITORIES' then
  begin
    s := THumanFace.GetRepositories(Params, msg);
    if msg <> '' then
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(msg)
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
  end
  else if action = 'ADDGPS' then
    THuiZhouKaoHe.AddGPS(tokenKey, Params, AResponseInfo);

  ActiveX.CoUninitialize;
end;

class function TSPService.GetSGZR(Params: TStrings): String;
var
  json, item: TQJson;
  ryxx: String;
  i, j: Integer;
  ryDic: TDictionary<Integer, TStrings>;
  ryInfo: TStrings;
begin
  Result := '';
  ryxx := Params.Values['ryxx'];
  if ryxx = '' then
    exit;
  json := TQJson.Create;
  ryDic := TDictionary<Integer, TStrings>.Create;
  try
    json.Parse(ryxx);
    for i := 0 to json.Count - 1 do
    begin
      ryInfo := TStringList.Create;
      item := json.Items[i];
      for j := 0 to item.Count - 1 do
        ryInfo.Add(item.Items[j].Name + '=' + item.Items[j].value);
      ryDic.Add(i, ryInfo);
    end;
    if ryDic.Count > 0 then
    begin
      Result := Params.Values['sgfssj'] + ',在' + Params.Values['sgdd'] + ',发生' +
        Params.Values['sgxt'];
      if RightStr(Params.Values['sgxt'], 2) <> '事故' then
        Result := Result + '事故。';
      if StrToIntDef(Params.Values['ssrs'], 0) > 0 then
        Result := Result + '致受伤' + Params.Values['ssrs'] + '人,';
      Result := Result + '直接财产损失' + Params.Values['zjccss'] + '元。';

      for i := 0 to ryDic.Keys.Count - 1 do
      begin
        Result := Result + '当事人' + (i + 1).ToString + ':' + ryDic[i].Values
          ['xm'] + '(' + ryDic[i].Values['xb'] + ',' + ryDic[i].Values
          ['nl'] + '岁';
        if ryDic[i].Values['jszh'] <> '' then
          Result := Result + ',驾驶证号' + ryDic[i].Values['jszh'];
        if (LeftStr(ryDic[i].Values['jtfs'], 2) = '驾驶') or
          (LeftStr(ryDic[i].Values['jtfs'], 2) = '乘') or
          (LeftStr(ryDic[i].Values['jtfs'], 2) = '步行') then
          Result := Result + '),' + ryDic[i].Values['jtfs']
        else
          Result := Result + '),驾驶' + ryDic[i].Values['jtfs'];
        if ryDic[i].Values['hphm'] <> '' then
          Result := Result + ',车牌号' + ryDic[i].Values['hphm'];
        Result := Result + '。';
      end;

      for i := 0 to ryDic.Keys.Count - 1 do
        Result := Result + '当事人' + ryDic[i].Values['xm'] + '负' + ryDic[i].Values
          ['zr'] + '责任;';
      Result := copy(Result, 1, Length(Result) - 1) + '。';
    end;
  except
    on e: exception do
    begin
      gLogger.Error(e.Message);
      Result := '';
    end;
  end;
  json.Free;
  for ryInfo in ryDic.Values do
    ryInfo.Free;
  ryDic.Free;
end;

class function TSPService.GetTJJG(Params: TStrings): String;
var
  code: String;
begin
  code := Params.Values['jafs'];
  if code = '1' then
    Result := '经双方共同请求调整达成一致：赔偿元，就此结案。'
  else if code = '2' then
    Result := '因当事人不同意调解，根据《道路交通事故处理程序规定》第三十八条第三款，不适用调解。'
  else if code = '3' then
    Result := '因当事人对事故认定有异，根据《道路交通事故处理程序规定》第三十八条第一款，不适用调解。'
  else if code = '4' then
    Result := '因当事人拒绝在”交通事故事实及责任“栏签字，根据《道路交通事故处理程序规定》第三十八条第二款，不适用调解。'
  else
    Result := '';
end;

end.
