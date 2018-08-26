unit uSpecialItf;

interface

uses
  System.SysUtils, Classes, DateUtils, uGlobal, uCommon, uSolr, uDBO, uEntity,
  uHik, FireDAC.Comp.Client, Generics.Collections, Soap.EncdDecd, Windows,
  uDecodeHikResult, uUploadVio, uTokenManager, Data.DB, ADODB, ActiveX;

type
  TSpecialItf = Class
  private
    class function GetSolrPassList(params: TStrings): string; static;
  public
    class function GetLockVio(ASystemID: String): String;
    class function GetPassList(params: TStrings): string; static;
    class function GetK08VehInfo(hphm, hpzl: String): String;
    class function GetK08PassList(kssj, jssj, hphm, hpzl, kdbh, clpp, csys,
      clpp1, aqd, aqd1, zyb, zyb1, gj, page, pageSize: string): String;
      overload;
    class function GetK08PassList(param: TDictionary<string, String>;
      page, pageSize: String): String; overload;
    class function AnalysisOnePic(Url: String): String;
    class function Login(ip: String; params: TStrings): String;
    class procedure SaveQtzLog(token, yhbh, ip, action, param: String);
    class function submitCarFaceCompareJob(params: TStrings): String;
    class function submitCarFaceJobByID(params: TStrings): String;
    class function CreateCarFaceCompareJob(params: TStrings): String;
    class function GetCarFaceJob(params: TStrings): String;
    class function getJobResultByTaskId(taskid: String): String;
    class function getJobFinalResultByTaskId(taskid: String): String;
    class function UploadVio(token: TToken; params: TStrings): String;
  end;

implementation

class function TSpecialItf.AnalysisOnePic(Url: String): String;
begin
  if gHaveK08 then
    Result := THik.DFAnalysisOnePic(Url)
  else
    Result := '';
end;

class function TSpecialItf.GetK08PassList(kssj, jssj, hphm, hpzl, kdbh, clpp,
  csys, clpp1, aqd, aqd1, zyb, zyb1, gj, page, pageSize: string): String;
begin
  // if gHaveK08 then
  // Result := THik.GetK08PassList(kssj, jssj, hphm, hpzl, kdbh, clpp, csys,
  // clpp1, aqd, aqd1, zyb, zyb1, gj, page, pageSize)
  // else
  Result := '';
end;

class function TSpecialItf.GetK08PassList(param: TDictionary<string, String>;
  page, pageSize: String): String;
begin
  if gHaveK08 then
  begin
    Result := THik.GetK08PassList(param, page, pageSize)
  end
  else
    Result := '';
end;

class function TSpecialItf.GetK08VehInfo(hphm, hpzl: String): String;
begin
  if gHaveK08 then
    Result := THik.GetK08VehInfo(hphm, hpzl)
  else
    Result := '';
end;

class function TSpecialItf.GetLockVio(ASystemID: String): String;
var
  s, fzjg, wfxw: String;
begin
  Result := '';
  s := ' select a.*, b.LHY_WFDD, b.SBDDMC, b.LHY_XZQH, b.LHY_DDMS, b.LHY_LDDM, b.LHY_SBBH, b.LHY_CJFS, b.LHY_JPGQ, b.LHY_JPGW, b.LHY_JPGH, b.xzsd as device_xzsd, '
    + ' c.LHY_WFDD as LHY_WFDD_1, c.LHY_DDMS as LHY_DDMS_1, c.LHY_LDDM as LHY_LDDM_1'
    + ' from t_vio_his a with(nolock) ' +
    ' inner join S_DEVICE b on a.WFDD = b.SBBH' +
    ' left join S_DEVICE c on b.QSSBBH = c.SBBH' + ' where a.SYSTEMID = ' +
    ASystemID.QuotedString;
  with gSQLHelper.Query(s) do
  begin
    if not Eof then
    begin
      Result := '[{"sysid":"' + ASystemID + '"';
      Result := Result + ',"xh":""';
      Result := Result + ',"cjjg":"' + Trim(FieldByName('cjjg').AsString) + '"';
      Result := Result + ',"clfl":"3"';
      Result := Result + ',"hphm":"' + Trim(FieldByName('hphm').AsString) + '"';
      Result := Result + ',"hpzl":"' + Trim(FieldByName('hpzl').AsString) + '"';
      if Length(Trim(FieldByName('syr').AsString)) <= 1 then
        Result := Result + ',"jdcsyr":"无"'
      else
        Result := Result + ',"jdcsyr":"' +
          Trim(FieldByName('syr').AsString) + '"';
      Result := Result + ',"syxz":"' + Trim(FieldByName('syxz').AsString) + '"';
      Result := Result + ',"fdjh":"' + Trim(FieldByName('fdjh').AsString) + '"';
      Result := Result + ',"clsbdh":"' +
        Trim(FieldByName('clsbdh').AsString) + '"';
      Result := Result + ',"csys":"' + Trim(FieldByName('csys').AsString) + '"';
      Result := Result + ',"clpp":"' +
        Trim(FieldByName('clpp1').AsString) + '"';
      Result := Result + ',"jtfs":"' + Trim(FieldByName('cllx').AsString) + '"';

      fzjg := copy(Trim(FieldByName('hphm').AsString), 1, 1);
      if fzjg = '京' then
        fzjg := '京A'
      else if fzjg = '津' then
        fzjg := '津A'
      else if fzjg = '沪' then
        fzjg := '沪A'
      else if fzjg = '渝' then
        fzjg := '渝A'
      else
        fzjg := copy(Trim(FieldByName('hphm').AsString), 1, 2);

      Result := Result + ',"fzjg":"' + fzjg + '"';
      Result := Result + ',"zsxzqh":"' +
        Trim(FieldByName('zsxzqh').AsString) + '"';
      Result := Result + ',"zsxxdz":"' +
        Trim(FieldByName('zsxxdz').AsString) + '"';
      Result := Result + ',"dh":"' + Trim(FieldByName('lxdh').AsString) + '"';
      Result := Result + ',"lxfs":""';
      Result := Result + ',"sj":"' + FormatDateTime('yyyy-mm-dd hh:nn:ss',
        FieldByName('WFSJ').ASDATETIME) + '"';
      Result := Result + ',"wfsj":"' + FormatDateTime('yyyy-mm-dd hh:nn',
        FieldByName('WFSJ').ASDATETIME) + '"';

      wfxw := Trim(FieldByName('WFXW').AsString);
      if wfxw = '1352' then
        wfxw := '1352A';
      if wfxw = '1302' then
        wfxw := '1625';

      Result := Result + ',"wfxw":"' + wfxw + '"';
      Result := Result + ',"zqmj":""';
      Result := Result + ',"spdz":"' + FieldByName('VIDEOFILE').AsString + '"';
      Result := Result + ',"FWQDZ":"' + FieldByName('FWQDZ').AsString + '"';
      Result := Result + ',"xp1":"' + FieldByName('PHOTOFILE1').AsString + '"';
      Result := Result + ',"xp2":"' + FieldByName('PHOTOFILE2').AsString + '"';
      Result := Result + ',"xp3":"' + FieldByName('PHOTOFILE3').AsString + '"';
      Result := Result + ',"bzz":"' + Trim(FieldByName('XZSD').AsString) + '"';
      Result := Result + ',"scz":"' + Trim(FieldByName('SJSD').AsString) + '"';
      if Length(Trim(FieldByName('zsxxdz').AsString)) > 3 then
        Result := Result + ',"flag":"0"'
      else
        Result := Result + ',"flag":""';

      Result := Result + ',"wfdd":"' +
        Trim(FieldByName('LHY_WFDD').AsString) + '"';
      Result := Result + ',"wfdz":"' +
        Trim(FieldByName('SBDDMC').AsString) + '"';
      Result := Result + ',"xzqh":"' +
        Trim(FieldByName('LHY_XZQH').AsString) + '"';
      Result := Result + ',"ddms":"' +
        Trim(FieldByName('LHY_DDMS').AsString) + '"';
      Result := Result + ',"lddm":"' +
        Trim(FieldByName('LHY_LDDM').AsString) + '"';
      Result := Result + ',"sbbh":"' +
        Trim(FieldByName('LHY_SBBH').AsString) + '"';
      Result := Result + ',"cjfs":"' +
        Trim(FieldByName('LHY_CJFS').AsString) + '"';
      Result := Result + ',"tpzl":"' + FieldByName('LHY_JPGQ').AsString + '"';
      Result := Result + ',"tpw":"' + FieldByName('LHY_JPGW').AsString + '"';
      Result := Result + ',"tph":"' + FieldByName('LHY_JPGH').AsString + '"';
      Result := Result + ',"bzz":"' + FieldByName('Device_xzsd').AsString + '"';
      // 区间测速
      Result := Result + ',"LHY_WFDD_1":"' + FieldByName('LHY_WFDD_1')
        .AsString + '"';
      Result := Result + ',"LHY_DDMS_1":"' + FieldByName('LHY_DDMS_1')
        .AsString + '"';
      Result := Result + ',"LHY_LDDM_1":"' + FieldByName('LHY_LDDM_1')
        .AsString + '"}]';
    end;
    Free;
  end;
end;

class function TSpecialItf.GetPassList(params: TStrings): string;
var
  s, k08s, clpp, csys, hphm, hpzl: string;
  i: Integer;
  tb: TFDMemTable;
  action: TAction;
  newParams: TStrings;
begin
  hphm := params.Values['hphm'];
  hpzl := params.Values['hpzl'];
  s := Format
    ('select 1 from T_VIO_WHILELIST where zt = 1 and hphm=''%s'' and hpzl=''%s''',
    [hphm, hpzl]);
  s := s + ' and (powertype=3 or powertype=1)';
  s := gSQLHelper.GetSinge(s);
  if s <> '' then
    exit('');

  Result := GetSolrPassList(params);
  // 获取车辆品牌和颜色
  // 影响前台查询速度
  {
    if gHaveK08 then
    begin
    tb := TFDMemTable.Create(nil);
    TCommon.JSONToDataSet(Result, tb);
    Result := '';
    while not tb.Eof do
    begin
    s := '';
    hphm := '';
    hpzl := '';
    clpp := '';
    csys := '';
    for i := 0 to tb.FieldCount - 1 do
    begin
    if Uppercase(tb.Fields[i].FieldName) = 'CLPP' then
    continue;
    if Uppercase(tb.Fields[i].FieldName) = 'CSYS' then
    continue;

    s := s + '"' + tb.Fields[i].FieldName + '":"' + tb.Fields[i]
    .AsString + '",';
    if Uppercase(tb.Fields[i].FieldName) = 'HPHM' then
    hphm := tb.Fields[i].AsString
    else if Uppercase(tb.Fields[i].FieldName) = 'HPZL' then
    hpzl := tb.Fields[i].AsString;
    end;
    if (hphm <> '') and (hpzl <> '') then
    begin
    k08s := GetK08VehInfo(hphm, hpzl);

    if k08s <> '' then
    begin
    if pos('"CLPP":"', k08s) > 0 then
    begin
    clpp := copy(k08s, pos('"CLPP":"', k08s) + 8, 100);
    clpp := copy(clpp, 1, pos('"', clpp) - 1);
    end;

    if pos('"CSYS":"', k08s) > 0 then
    begin
    csys := copy(k08s, pos('"CSYS":"', k08s) + 8, 100);
    csys := copy(csys, 1, pos('"', csys) - 1);
    end;
    end;
    end;
    s := '{' + s + '"CLPP":"' + clpp + '","CSYS":"' + csys + '" }// ';
  // Result := Result + ',' + s;
  // tb.Next;
  // end;
  // tb.Free;
  // Result := '[' + Result.Substring(1) + ']';
  // end;
  // }
end;

class function TSpecialItf.GetSolrPassList(params: TStrings): string;
  function DBGetPassList: string;
  var
    action: TAction;
    newParams: TStrings;
    i: Integer;
    s: string;
    rows, start: string;
  begin
    action.ActionType := 'Q';
    action.TableName := 'T_KK_VEH_PASSREC';
    newParams := TStringList.Create;
    newParams.AddStrings(params);
    for i := newParams.Count - 1 downto 0 do
    begin
      if newParams.Names[i].ToUpper.Contains('GCSJ') then
      begin
        s := newParams.ValueFromIndex[i];
        s := s.Substring(0, 4) + '-' + s.Substring(4, 2) + '-' +
          s.Substring(6, 2) + ' ' + s.Substring(8, 2) + ':' + s.Substring(10, 2)
          + ':' + s.Substring(12);
        newParams.ValueFromIndex[i] := s;
      end;
    end;

    Result := TDBO.Select(action, newParams);
    newParams.Free;
  end;
  function GetValue(s, start, stop: string): string;
  var
    iStart, iStop: Integer;
  begin
    Result := '';
    iStart := s.IndexOf(start) + start.Length;
    s := s.Substring(iStart);
    iStop := s.IndexOf(stop);
    if iStop > 0 then
      Result := s.Substring(0, iStop);
  end;

var
  twoHoursAgo, gcsj, begin_gcsj, end_gcsj: string;
  s, gcxh, pass, part1, part2: string;
  lines: TStrings;
  i, rows, start: Integer;
  haveRows: boolean;
  ss: TArray<string>;
begin
  Result := '';
  twoHoursAgo := FormatDateTime('yyyymmddhhmmss', now - OneHour * 2);
  gcsj := params.Values['gcsj'];
  if gcsj <> '' then
  begin
    if (gcsj > twoHoursAgo) then
      exit(DBGetPassList)
    else
      exit(TSolr.Query(params));
  end;

  begin_gcsj := params.Values['begin_gcsj'];
  end_gcsj := params.Values['end_gcsj'];
  if end_gcsj < twoHoursAgo then
    exit(TSolr.Query(params))
  else if begin_gcsj > twoHoursAgo then
    exit(DBGetPassList);

  part1 := DBGetPassList;
  if params.Values['rows'] <> '' then
  begin
    rows := strtointdef(params.Values['rows'], 30);
    haveRows := true;
  end;
  if haveRows and (part1 <> '') then
  begin
    ss := part1.Split(['SYSTEMID']);
    rows := rows - Length(ss) + 1;
    if rows > 0 then
    begin
      params.Values['rows'] := rows.ToString;
      end_gcsj := GetValue(ss[Length(ss) - 1], '"GCSJ":"', '"');
      params.Values['end_GCSJ'] := end_gcsj.Replace('-', '').Replace('/', '')
        .Replace(':', '').Replace(' ', '');
      params.Values['start'] := '0';
    end
    else
      exit(part1);
  end;

  lines := TSolr.GetPassList(params);
  for s in lines do
  begin
    pass := TSolr.GetPass(s);
    if not part1.Contains(pass.Substring(1)) then
      part2 := part2 + ',' + pass;
  end;
  lines.Free;
  if part1 <> '' then
  begin
    part1 := part1.Substring(0, part1.Length - 1);
    Result := part1 + part2 + ']';
  end
  else if part2 <> '' then
    Result := '[' + part2.Substring(1) + ']';
end;

class function TSpecialItf.submitCarFaceJobByID(params: TStrings): String;
var
  jobStr, kssj, jssj, systemid, s: String;
  stream: TStringStream;
  m, n: Integer;
  b: boolean;
begin
  kssj := params.Values['kssj'];
  jssj := params.Values['jssj'];
  systemid := params.Values['systemid'];
  with gSQLHelper.Query('select JobStream from T_CarFace_Job where Systemid = '
    + systemid.QuotedString) do
  begin
    if not Eof then
    begin
      b := true;
      stream := TStringStream.Create;
      TBlobField(Fields[0]).SaveToStream(stream);
      jobStr := stream.DataString;
      stream.Free;
      m := pos('<passTimeStart>', jobStr);
      n := pos('</passTimeStart>', jobStr);
      if (m > 0) and (n > m) then
      begin
        s := copy(jobStr, m, n - m + 16);
        jobStr := jobStr.Replace(s, '<passTimeStart>' + kssj +
          '</passTimeStart>');
      end
      else
        b := False;

      m := pos('<passTimeEnd>', jobStr);
      n := pos('</passTimeEnd>', jobStr);
      if b and (m > 0) and (n > m) then
      begin
        s := copy(jobStr, m, n - m + 14);
        jobStr := jobStr.Replace(s, '<passTimeEnd>' + jssj + '</passTimeEnd>');
      end
      else
        b := False;
      if b then
      begin
        params.Clear;
        params.Text := jobStr;
        jobStr := THik.Query(params);
        Result := TDecodeHikResult.DecodeJobStr(jobStr);
      end;
    end
    else
      Result := '';
    Free;
  end;
end;

class function TSpecialItf.Login(ip: String; params: TStrings): String;
var
  yhbh, mm: String;
begin
  Result := '0';
  yhbh := params.Values['user'];
  mm := params.Values['pwd'];
  if (gSaUsers.IndexOf(yhbh) >= 0) and (mm = cSaPwd) then
    Result := gTokenManager.NewToken(yhbh, ip).Key
  else
  begin
    with gSQLHelper.Query('select 1 from S_User where yhbh=' + yhbh.QuotedString
      + ' and mm=' + mm.QuotedString) do
    begin
      if RecordCount > 0 then
        Result := gTokenManager.NewToken(yhbh, ip).Key;
      Free;
    end;
  end;
end;

class procedure TSpecialItf.SaveQtzLog(token, yhbh, ip, action, param: String);
var
  s: String;
begin
  s := 'insert into S_QTZ_LOG(token, yhbh, ip, action, param) values (' +
    token.QuotedString + ',' + yhbh.QuotedString + ',' + ip.QuotedString + ',' +
    action.QuotedString + ',' + param.QuotedString + ')';
  gSQLHelper.ExecuteSql(s);
end;

class function TSpecialItf.CreateCarFaceCompareJob(params: TStrings): String;
var
  Url, PicStr, vehStr, jobStr, s: String;
  vehList: TList<TstPreProcRet>;
  b: boolean;
  veh: TstPreProcRet;
  selRect: TRect;
  modeInfo: TmodeInfo;
  modelCmpThreadhold, ROICmpThreadhold: String;
  jobParams: TStrings;
  stream: TStringStream;
  qy: TADOQuery;
begin
  ActiveX.CoInitialize(nil);
  Result := '0';
  Url := DecodeString(params.Values['pic']);
  selRect.Left := StrToInt(params.Values['X']);
  selRect.Top := StrToInt(params.Values['Y']);
  selRect.Width := StrToInt(params.Values['W']);
  selRect.Height := StrToInt(params.Values['H']);
  PicStr := TCommon.PicUrl2Str(Url);
  if PicStr = '' then
    exit;
  vehStr := THik.picAnalysis(PicStr);
  vehList := TDecodeHikResult.DecodeVehStr(vehStr);

  if vehList = nil then
    exit;
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
    end;
    modelCmpThreadhold := '0.9';
    ROICmpThreadhold := '';
  end;

  if b then
  begin
    modeInfo.modeRect := veh.stTagRect;
    modeInfo.hashData := veh.stTagModel;
    jobParams := THik.GetCarFaceJobParam(params.Values['kssj'],
      params.Values['jssj'], params.Values['kdbh'], PicStr, veh.stTagRect,
      selRect, modelCmpThreadhold, '', ROICmpThreadhold, '', '', '', '', '',
      modeInfo);
    qy := TADOQuery.Create(nil);
    qy.ConnectionString := gSQLHelper.ConnectionString;
    qy.SQL.Add
      (' insert into T_CarFace_Job (jobid,hphm,hpzl,sjhm,picStream,RectX,RectY,RectW,RectH,JobStream) ');
    qy.SQL.Add
      (' values (:jobid,:hphm,:hpzl,:sjhm,:picStream,:RectX,:RectY,:RectW,:RectH,:JobStream)');
    qy.Parameters.ParamByName('jobid').Value := params.Values['jobid'];
    qy.Parameters.ParamByName('hphm').Value := params.Values['hphm'];
    qy.Parameters.ParamByName('hpzl').Value := params.Values['hpzl'];
    qy.Parameters.ParamByName('sjhm').Value := params.Values['sjhm'];
    qy.Parameters.ParamByName('RectX').Value := params.Values['X'];
    qy.Parameters.ParamByName('RectY').Value := params.Values['Y'];
    qy.Parameters.ParamByName('RectW').Value := params.Values['W'];
    qy.Parameters.ParamByName('RectH').Value := params.Values['H'];

    stream := TStringStream.Create('');
    stream.WriteString(jobParams.Text);
    stream.Position := 0;
    qy.Parameters.ParamByName('JobStream').LoadFromStream(stream, ftblob);
    stream.Clear;
    stream.WriteString(PicStr);
    stream.Position := 0;
    qy.Parameters.ParamByName('picStream').LoadFromStream(stream, ftblob);
    if qy.ExecSQL > 0 then
    begin
      Result := '1';
      gSQLHelper.ExecuteSql
        ('update T_JcptJTP_Vehicle set Status = 1 where systemid=''' +
        params.Values['jobid'] + '''');
    end;

    jobParams.Free;
    stream.Free;
    qy.Free;
  end;
  vehList.Free;
  ActiveX.CoUninitialize;
end;

class function TSpecialItf.GetCarFaceJob(params: TStrings): String;
var
  stream: TStringStream;
  i: Integer;
  s: String;
begin
  Result := '';
  with gSQLHelper.Query
    ('select PicStream, RectX, RectY, RectW, RectH, SJHM from T_CarFace_Job where Systemid='''
    + params.Values['jobid'] + '''') do
  begin
    if not Eof then
    begin
      stream := TStringStream.Create;
      TBlobField(FieldByName('PicStream')).SaveToStream(stream);
      s := stream.DataString;
      stream.Free;
      Result := '{"pic":"' + s + '","rectx":"' + FieldByName('rectx').AsString +
        '","recty":"' + FieldByName('recty').AsString + '","rectw":"' +
        FieldByName('rectw').AsString + '","recth":"' + FieldByName('recth')
        .AsString + '","sjhm":"' + FieldByName('sjhm').AsString + '"}';
    end;
    Free;
  end;
end;

class function TSpecialItf.submitCarFaceCompareJob(params: TStrings): String;
var
  Url, PicStr, vehStr, jobStr: String;
  vehList: TList<TstPreProcRet>;
  b: boolean;
  veh: TstPreProcRet;
  selRect: TRect;
  modeInfo: TmodeInfo;
  modelCmpThreadhold, ROICmpThreadhold: String;
begin
  Result := '';
  Url := DecodeString(params.Values['pic']);
  selRect.Left := StrToInt(params.Values['X']);
  selRect.Top := StrToInt(params.Values['Y']);
  selRect.Width := StrToInt(params.Values['W']);
  selRect.Height := StrToInt(params.Values['H']);
  PicStr := TCommon.PicUrl2Str(Url);
  if PicStr = '' then
    exit;
  vehStr := THik.picAnalysis(PicStr);
  vehList := TDecodeHikResult.DecodeVehStr(vehStr);

  if vehList = nil then
    exit;
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
    end;
    modelCmpThreadhold := '0.9';
    ROICmpThreadhold := '';
  end;

  if b then
  begin
    modeInfo.modeRect := veh.stTagRect;
    modeInfo.hashData := veh.stTagModel;
    jobStr := THik.submitCarFaceCompareJob(params.Values['kssj'],
      params.Values['jssj'], params.Values['kdbh'], PicStr, veh.stTagRect,
      selRect, modelCmpThreadhold, '', ROICmpThreadhold, '', '', '', '', '',
      modeInfo);
    jobStr := TDecodeHikResult.DecodeJobStr(jobStr);
    if jobStr <> '' then
      Result := jobStr;
  end;
  vehList.Free;
end;

class function TSpecialItf.UploadVio(token: TToken; params: TStrings): String;
begin
  with TUploadVio.Create do
  begin
    Result := UploadVio(token, params.Values['systemid']);
    Free;
  end;
end;

class function TSpecialItf.getJobFinalResultByTaskId(taskid: String): String;
var
  passStr, s, clpp: String;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
begin
  Result := '';
  passStr := THik.getJobFinalResultByTaskId(taskid);
  vehList := TDecodeHikResult.DecodeCarFaceResult(passStr);

  if (vehList <> nil) and (vehList.Count > 0) then
  begin
    for veh in vehList do
    begin
      s := '"HPHM":"' + veh.plateno + '",';
      if gHpzl.ContainsKey(veh.vehicletype) then
        s := s + '"HPZL":"' + gHpzl[veh.vehicletype] + '"'
      else
        s := s + '"HPZL":"' + veh.vehicletype + '"';
      s := s + ',"GCSJ":"' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
        DateUtils.IncMilliSecond(25569.3333333333,
        StrToInt64(veh.PassTime))) + '",';

      if gHikID.ContainsKey(veh.crossingid) then
        s := s + '"KDBH":"' + gHikID[veh.crossingid] + '"'
      else if gDevID.ContainsKey(veh.crossingid) then
        s := s + '"KDBH":"' + gDevID[veh.crossingid] + '"'
      else
        s := s + '"KDBH":"' + veh.crossingid + '"';

      clpp := veh.vehiclelogo + '-' + veh.vehiclesublogo;
      if gK08Clpp.ContainsKey(clpp) then
        s := s + ',"CLPP":"' + gK08Clpp[clpp] + '"'
      else if gK08Clpp.ContainsKey(veh.vehiclelogo + '-0') then
        s := s + ',"CLPP":"' + gK08Clpp[veh.vehiclelogo + '-0'] + '"'
      else
        s := s + ',"CLPP":"' + clpp + '"';

      if gK08Csys.ContainsKey(veh.vehiclecolor) then
        s := s + ',"CSYS":"' + gK08Csys[veh.vehiclecolor] + '"'
      else
        s := s + ',"CSYS":"' + veh.vehiclecolor + '"';
      s := '{' + s + ',"CDBH":"' + veh.laneno + '","CLSD":"' + veh.vehiclespeed
        + '","FWQDZ":"","TP1":"http://10.43.255.8:18088' + veh.imagepath +
        '&appname=PIC&isstream=1"}';

      Result := Result + ',' + s;
    end;
    Result := '[' + Result.Substring(1) + ']';
    vehList.Free;
  end;
end;

class function TSpecialItf.getJobResultByTaskId(taskid: String): String;
begin
  Result := TDecodeHikResult.DecodeJobProgress
    (THik.getJobResultByTaskId(taskid));
end;

end.
