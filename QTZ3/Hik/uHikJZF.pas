unit uHikJZF;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, IdCustomHTTPServer, EncdDecd, uHikDSJ,
  qjson, uSurveilVio, Generics.Collections, StrUtils, uTokenManager, ActiveX,
  Windows, uDecodeHikResult, DateUtils;

type
  THikJZFService = Class
  private
    class function GetActions(): String; static;
    class function submitCarFaceCompareJob(params: TStrings;
      var msg: String): String;
    class function getJobResultByTaskId(taskid: String;
      var msg: String): String;
    class function getJobFinalResultByTaskId(taskid: String;
      var msg: String): String;
    class function footHoldsByTrackAndTime(params: TStrings): String;
    class function darkKnightAnalysis(params: TStrings): String;
    class function trackerAssociateAnalysis(params: TStrings): String;

  public
    class property Actions: String read GetActions;
    class procedure DoJZF(action, tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
  end;

implementation

class function THikJZFService.GetActions: String;
begin
  Result := ',SUBMITCARFACECOMPAREJOB,GETJOBRESULTBYTASKID,GETJOBFINALRESULTBYTASKID,'
    + 'FOOTHOLDSBYTRACKANDTIME,DARKKNIGHTANALYSIS,TRACKERASSOCIATEANALYSIS,';
end;

class function THikJZFService.getJobFinalResultByTaskId(taskid: String;
  var msg: String): String;
var
  passStr, s, clpp, hpzl, kdbh: String;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
begin
  Result := '';
  passStr := THikDSJ.getJobFinalResultByTaskId(taskid);
  vehList := TDecodeHikResult.DecodeCarFaceResult(passStr, msg);

  if (vehList <> nil) and (vehList.Count > 0) then
  begin
    for veh in vehList do
    begin
      s := '"hphm":"' + veh.plateno + '",';
      hpzl := veh.vehicletype;
      if gHpzl.ContainsKey(hpzl) then
        hpzl := gHpzl[hpzl];
      s := s + '"hpzl":"' + hpzl + '",';

      if TCommon.DicHpzlmc.ContainsKey(hpzl) then
        s := s + '"hpzlmc":"' + TCommon.DicHpzlmc[hpzl] + '",'
      else
        s := s + '"hpzlmc":"",';

      s := s + '"gcsj":"' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
        DateUtils.IncMilliSecond(25569.3333333333,
        StrToInt64(veh.PassTime))) + '",';

      kdbh := veh.crossingid;
      if gHikID.ContainsKey(kdbh) then
        kdbh := gHikID[veh.crossingid]
      else if gDevID.ContainsKey(kdbh) then
        kdbh := gDevID[veh.crossingid];
      s := s + '"kdbh":"' + kdbh + '",';

      if TCommon.DicDevice.ContainsKey(kdbh) then
        s := s + '"sbddmc":"' + TCommon.DicDevice[kdbh].SBDDMC + '",'
      else
        s := s + '"sbddmc":"",';

      clpp := veh.vehiclelogo + '-' + veh.vehiclesublogo;
      if gK08Clpp.ContainsKey(clpp) then
        clpp := gK08Clpp[clpp]
      else if gK08Clpp.ContainsKey(veh.vehiclelogo + '-0') then
        clpp := gK08Clpp[veh.vehiclelogo + '-0'];
      s := s + '"clpp":"' + clpp + '",';

      if gK08Csys.ContainsKey(veh.vehiclecolor) then
        s := s + '"csys":"' + gK08Csys[veh.vehiclecolor] + '",'
      else
        s := s + '"csys":"' + veh.vehiclecolor + '",';
      s := '{' + s + '"cdbh":"' + veh.laneno + '","clsd":"' + veh.vehiclespeed +
        '","fwqdz":"","tp1":"http://10.43.255.8:18088' + veh.imagepath +
        '&appname=PIC&isstream=1"}';

      Result := Result + ',' + s;
    end;
    Result := '[' + Result.Substring(1) + ']';
    vehList.Free;
  end;
end;

class function THikJZFService.getJobResultByTaskId(taskid: String;
  var msg: String): String;
begin
  Result := TDecodeHikResult.DecodeJobProgress
    (THikDSJ.getJobResultByTaskId(taskid), msg);
end;

class function THikJZFService.footHoldsByTrackAndTime(params: TStrings): String;
var
  kssj, jssj: TDateTime;
begin
  kssj := TCommon.GetRealDatetime(StrToInt64Def(params.Values['kssj'], 0));
  jssj := TCommon.GetRealDatetime(StrToInt64Def(params.Values['jssj'], 0));
  Result := THikDSJ.footHoldsByTrackAndTime(params.Values['hphm'],
    FormatDateTime('yyyy-mm-dd hh:nn:ss', kssj),
    FormatDateTime('yyyy-mm-dd hh:nn:ss', jssj), params.Values['pageSize'],
    params.Values['pageNo']);
end;

class function THikJZFService.submitCarFaceCompareJob(params: TStrings;
  var msg: String): String;
var
  Url, PicStr, vehStr, jobStr, s: String;
  vehList: TList<TstPreProcRet>;
  b: Boolean;
  veh: TstPreProcRet;
  selRect: TRect;
  modeInfo: TmodeInfo;
  modelCmpThreadhold, ROICmpThreadhold: String;
begin
  Result := '';

  // Url := DecodeString(params.Values['pic']);
  selRect.Left := StrToInt(params.Values['X']);
  selRect.Top := StrToInt(params.Values['Y']);
  selRect.Width := StrToInt(params.Values['W']);
  selRect.Height := StrToInt(params.Values['H']);
  // PicStr := TCommon.PicUrl2Str(Url);
  msg := '';

  PicStr := params.Values['pic'];
  TCommon.Base64ToFile(PicStr, 'd:\111.jpg');
  if PicStr = '' then
  begin
    gLogger.Error('[submitCarFaceCompareJob]未收到图片base64字符串');
    msg := '未收到图片base64字符串';
    exit;
  end;
  vehStr := THikDSJ.picAnalysis(PicStr);
  vehList := TDecodeHikResult.DecodeVehStr(vehStr);

  if vehList = nil then
  begin
    gLogger.Error('[submitCarFaceCompareJob]单张分析失败或者图片中未找到车辆');
    msg := '单张分析失败或者图片中未找到车辆';
    exit;
  end
  else
    gLogger.Error('[submitCarFaceCompareJob] veh count:' +
      vehList.Count.ToString);
  try
    b := False;
    if selRect.Width * selRect.Height > 0 then
    begin
      for veh in vehList do
      begin
        if (selRect.Left >= veh.stTagRect.Left) and
          (selRect.Top >= veh.stTagRect.Top) and
          (selRect.Left + selRect.Width <= veh.stTagRect.Left +
          veh.stTagRect.Width) and
          (selRect.Top + selRect.Height <= veh.stTagRect.Top +
          veh.stTagRect.Height) then
        begin
          b := true;
          break;
        end
        else
        begin
          gLogger.Info('veh.stTagRect.Left:' + veh.stTagRect.Left.ToString +
            ',selRect.Left:' + selRect.Left.ToString + ',veh.stTagRect.Top:' +
            veh.stTagRect.Top.ToString + ',selRect.Top:' + selRect.Top.ToString
            + ',veh.stTagRect.Left + veh.stTagRect.Width:' +
            inttostr(veh.stTagRect.Left + veh.stTagRect.Width) +
            'selRect.Left + selRect.Width:' + inttostr(selRect.Left +
            selRect.Width) + ',veh.stTagRect.Top + veh.stTagRect.Height:' +
            inttostr(veh.stTagRect.Top + veh.stTagRect.Height) +
            ',selRect.Top + selRect.Height:' +
            inttostr(selRect.Top + selRect.Height));
          msg := '所选特征区域在车身以外';
        end;
      end;
      modelCmpThreadhold := '0.1';
      ROICmpThreadhold := '0.7';
    end
    else
    begin
      if vehList.Count > 0 then
      begin
        veh := vehList[0];
        b := true;
      end
      else
      begin
        gLogger.Error('[submitCarFaceCompareJob]图片中未找到车辆');
        msg := '图片中未找到车辆'
      end;
      modelCmpThreadhold := '0.9';
      ROICmpThreadhold := '';
    end;

    if b then
    begin
      modeInfo.modeRect := veh.stTagRect;
      modeInfo.hashData := veh.stTagModel;
      s := THikDSJ.submitCarFaceCompareJob(params.Values['kssj'],
        params.Values['jssj'], params.Values['kdbh'], PicStr, veh.stTagRect,
        selRect, modelCmpThreadhold, '', ROICmpThreadhold, '', '', '', '', '',
        modeInfo);
      jobStr := TDecodeHikResult.DecodeJobStr(s, msg);
      if jobStr <> '' then
        Result := jobStr
      else
      begin
        gLogger.Error('[submitCarFaceCompareJob]Result:' + s);
        msg := s;
      end;
    end;
  except
    on e: exception do
    begin
      gLogger.Error(e.Message);
      msg := e.Message;
    end;
  end;
  vehList.Free;
end;

class function THikJZFService.trackerAssociateAnalysis
  (params: TStrings): String;
var
  kssj, jssj: TDateTime;
begin
  kssj := TCommon.GetRealDatetime(StrToInt64Def(params.Values['kssj'], 0));
  jssj := TCommon.GetRealDatetime(StrToInt64Def(params.Values['jssj'], 0));
  Result := THikDSJ.trackerAssociateAnalysis(params.Values['hphm'],
    FormatDateTime('yyyy-mm-dd hh:nn:ss', kssj),
    FormatDateTime('yyyy-mm-dd hh:nn:ss', jssj), params.Values['timeInterval'],
    params.Values['threshold'], params.Values['crosses'],
    params.Values['pageSize'], params.Values['pageNo']);
end;

class function THikJZFService.darkKnightAnalysis(params: TStrings): String;
begin
  Result := THikDSJ.darkKnightAnalysis(params.Values['kssj'],
    params.Values['jssj'], params.Values['crosses'], params.Values['pageSize'],
    params.Values['pageNo']);
end;

class procedure THikJZFService.DoJZF(action, tokenKey: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  kssj, jssj: Double;
  s, msg: String;
  token: TToken;
begin
  ActiveX.CoInitialize(nil);
  token := gTokenManager.GetToken(tokenKey);

  if action = UpperCase('submitCarFaceCompareJob') then
  begin
    msg := '';
    s := submitCarFaceCompareJob(params, msg);
    if msg <> '' then
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(msg)
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
        ('{"taskid":"' + s + '"}');
  end
  else if action = UpperCase('getJobResultByTaskId') then
  begin
    msg := '';
    s := getJobResultByTaskId(params.Values['taskid'], msg);
    if msg <> '' then
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(msg)
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
        ('{"progress":"' + s + '"}');
  end
  else if action = UpperCase('getJobFinalResultByTaskId') then
  begin
    msg := '';
    s := getJobFinalResultByTaskId(params.Values['taskid'], msg);
    if msg <> '' then
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(msg)
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
  end
  else if action = UpperCase('footHoldsByTrackAndTime') then
  begin
    s := footHoldsByTrackAndTime(params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
  end
  else if action = UpperCase('darkKnightAnalysis') then
  begin
    s := darkKnightAnalysis(params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
  end
  else if action = UpperCase('trackerAssociateAnalysis') then
  begin
    s := trackerAssociateAnalysis(params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s);
  end;

  ActiveX.CoUninitialize;
end;

end.
