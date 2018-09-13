unit uRmService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IniFiles, IdContext, uLogger, HTTPApp, uTmri, uRmweb,
  uRminf, uTrans, ActiveX, IdURI, IdHttp, StrUtils, uLockVio, DateUtils,
  IdSSLOpenSSL, uTokenManager, uGlobal, uCommon, QJson, uWSManager, uJKDefine;

type

  TRmService = class
  private
    class function ParamsToJson(params: TStrings; exceptName: string = '')
      : string; static;
    class procedure DoGetVehInfo(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoGetDrvInfo(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoWriteVio(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoRminf(action: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoRmweb(action: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoWriteVehicleInfo(params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure GetVioPic(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo); static;
    class function DoQeury(token: TToken; params: TStrings): String;
    class function DoWrite(token: TToken; params: TStrings): String;
    class procedure GetViolationInfo(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure SaveSimpleVio(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure SaveDutySimple(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure SaveForceVio(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure WriteSG(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure ApplyWSBH(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class function IsReVio(params: TStrings; lx: Integer): Boolean;
    class function CheckForceInput(token: TToken; params: TStrings): String;
    class function GetZQMJ(oldZqmj: string): string; static;
    class function GetDwdm(zqmj: String): String;
    class procedure GetVioCount(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class function GetVioInfoByVeh(token: TToken; params: TStrings): String;
  public
    class function GetVehInfo(token: TToken; hphm, hpzl: String): String;
    class function GetDrvInfo(token: TToken; params: TStrings): String;
    class function GetVioInfoByDrv(token: TToken; params: TStrings): String;
    class procedure DoRM(action, tokenKey: String; params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
    class procedure CheckForceParam(params: TStrings);
  end;

var
  RmService: TRmService;

implementation

class function TRmService.ParamsToJson(params: TStrings;
  exceptName: string = ''): string;
var
  first: Boolean;
  i: Integer;
begin
  first := True;
  result := '{';
  exceptName := exceptName.ToLower;
  for i := 0 to params.Count - 1 do
  begin
    if (not exceptName.Contains(',' + params.Names[i].ToLower + ',')) and
      (params.Names[i] <> '') and (params.ValueFromIndex[i] <> '') then
    begin
      if first then
      begin
        result := result + '"' + params.Names[i].ToLower + '":"' +
          params.ValueFromIndex[i] + '"';
        first := false;
      end
      else
        result := result + ',"' + params.Names[i].ToLower + '":"' +
          params.ValueFromIndex[i] + '"';
    end;
  end;
  result := result + '}';
end;

class procedure TRmService.ApplyWSBH(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  wsbh, wslb, num, xzqh, wsbb: String;
begin
  wslb := params.Values['wslb'];
  num := params.Values['num'];
  xzqh := params.Values['xzqh'];
  if xzqh = '' then
    xzqh := LeftStr(token.User.DWDM, 6);
  if wslb = '9' then
  begin
    wsbh := gWSManager.ApplyQWSG(token.Login, xzqh, strtointdef(num, 0));
  end
  else
  begin
    if xzqh = '' then
      xzqh := LeftStr(token.User.DWDM, 6);
    if wslb = '6' then
    begin
      wslb := '1';
      wsbb := 'B';
    end
    else
      wsbb := 'D';
    wsbh := gWSManager.Apply(token.Login, xzqh, wsbb, wslb,
      strtointdef(num, 0));
  end;
  wsbh := '{"wsbh":"' + wsbh + '"}';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(wsbh);
end;

class procedure TRmService.DoGetDrvInfo(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: String;
begin
  json := GetDrvInfo(token, params);
  if (json = '-1') or (json = '') then // 查询6合1失败
    json := TCommon.QueryDrvInfo(params.Values['SFZMHM'],
      params.Values['DABH']);
  if (json = '-1') or (json = '') then
    json := '{}';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
end;

class procedure TRmService.DoGetVehInfo(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  json := GetVehInfo(token, params.Values['HPHM'], params.Values['HPZL']);
  if (json = '-1') or (json = '') then // 如果查询6合1失败，查询本地复制库
    json := TCommon.QueryVehInfo(params.Values['HPHM'], params.Values['HPZL']);
  if (json = '-1') or (json = '') then
    json := '{}';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
end;

class procedure TRmService.DoWriteVio(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, flag: string;
  tp: TTmriParam;
begin
  json := params.Values['vio'];
  flag := params.Values['flag'];
  if flag = '0' then
    tp := TCommon.GetTmriParam('04C52', token)
  else
    tp := TCommon.GetTmriParam('04C53', token);
  AResponseInfo.ContentText := TTmri.Write(tp, json);
end;

class procedure TRmService.DoWriteVehicleInfo(params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  kkbh: string;
  fxlx: string;
  cdh: Int64;
  hphm: string;
  hpzl: string;
  gcsj: string;
  clsd: Int64;
  clxs: Int64;
  wfdm: string;
  cwkc: Int64;
  hpys: string;
  cllx: string;
  fzhpzl: string;
  fzhphm: string;
  fzhpys: string;
  clpp: string;
  clwx: string;
  csys: string;
  tplj: string;
  tp1: string;
  tp2: string;
  tp3: string;
  tztp: string;
  rst: Int64;
begin
  try
    kkbh := params.Values['kkbh'];
    fxlx := params.Values['fxlx'];
    cdh := strtointdef(params.Values['cdh'], 0);
    hphm := params.Values['hphm'];
    hpzl := params.Values['hpzl'];
    gcsj := params.Values['gcsj'];
    clsd := strtointdef(params.Values['clsd'], 0);
    clxs := strtointdef(params.Values['clxs'], 0);
    wfdm := params.Values['wfdm'];
    cwkc := strtointdef(params.Values['cwkc'], 0);
    hpys := params.Values['hpys'];
    cllx := params.Values['cllx'];
    fzhpzl := params.Values['fzhpzl'];
    fzhphm := params.Values['fzhphm'];
    fzhpys := params.Values['fzhpys'];
    clpp := params.Values['clpp'];
    clwx := params.Values['clwx'];
    csys := params.Values['csys'];
    tplj := params.Values['tplj'];
    tp1 := params.Values['tp1'];
    tp2 := params.Values['tp2'];
    tp3 := params.Values['tp3'];
    tztp := params.Values['tztp'];

    rst := TTrans.WriteVehicleInfo(kkbh, fxlx, cdh, hphm, hpzl, gcsj, clsd,
      clxs, wfdm, cwkc, hpys, cllx, fzhpzl, fzhphm, fzhpys, clpp, clwx, csys,
      tplj, tp1, tp2, tp3, tztp);
    AResponseInfo.ContentText := rst.ToString();
  except
    on e: Exception do
      logger.Error(e.Message);
  end;
end;

class procedure TRmService.DoRmweb(action: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  action := LowerCase(action);
  json := ParamsToJson(params);

  if action = 'qvehbus' then
    json := TRmweb.qvehbus(json)
  else if action = 'qstation' then
    json := TRmweb.qstation(json)
  else if action = 'qstationrelation' then
    json := TRmweb.qstationrelation(json)
  else if action = 'qstationperson' then
    json := TRmweb.qstationperson(json)
  else if action = 'feedback' then
    json := TRmweb.feedback(json)
  else if action = 'feedbackpic' then
    json := TRmweb.feedbackpic(json)
  else if action = 'vehcheck' then
    json := TRmweb.vehcheck(json);
  AResponseInfo.ContentText := json;
end;

class procedure TRmService.DoRminf(action: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  action := LowerCase(action);
  json := ParamsToJson(params);

  if action = 'surscreen' then
    json := TRminf.surscreen(json)
  else if action = 'surexamine' then
    json := TRminf.surexamine(json)
  else if action = 'flowequip' then
    json := TRminf.flowequip(json)
  else if action = 'weather' then
    json := TRminf.weather(json)
  else if action = 'incident' then
    json := TRminf.incident(json)
  else if action = 'inducement' then
    json := TRminf.inducement(json)
  else if action = 'car' then
    json := TRminf.car(json)
  else if action = 'police' then
    json := TRminf.police(json)
  else if action = 'park' then
    json := TRminf.park(json);
  AResponseInfo.ContentText := json;
end;

class function TRmService.DoQeury(token: TToken; params: TStrings): String;
var
  json: string;
  tmriParam: TTmriParam;
begin
  tmriParam := TCommon.GetTmriParam(params.Values['JKID'], token);
  json := ParamsToJson(params, ',JKID,');
  json := TTmri.Query(tmriParam, json);
  result := json;
end;

class function TRmService.DoWrite(token: TToken; params: TStrings): String;
var
  json: string;
  tmriParam: TTmriParam;
begin
  tmriParam := TCommon.GetTmriParam(params.Values['JKID'], token);
  json := ParamsToJson(params, ',JKID,');
  gLogger.Info('[DoWrite]' + json);
  json := TTmri.Write(tmriParam, json);
  result := json;
end;

class procedure TRmService.GetVioPic(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, xh, hphm, hpzl, wfsj, sjson: string;
  QJson: TQJson;
  i: Integer;
  t: Int64;
  sj: TDatetime;
begin
  try
    xh := params.Values['xh'];
    if xh = '' then
    begin
      hphm := Uppercase(params.Values['HPHM']);
      hpzl := params.Values['hpzl'];
      wfsj := params.Values['wfsj'];
      if (hphm = '') or (hpzl = '') or (wfsj = '') then
      begin
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('parameter error');
        exit;
      end;
      t := StrToInt64Def(wfsj, 0);
      if t = 0 then
      begin
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('parameter error');
        exit;
      end
      else
        sj := TCommon.GetRealDatetime(t);

      params.Add('JKID=04C03');
      json := DoQeury(token, params);

      json := TCommon.GetJsonNode('viosurveil', json);
      QJson := TQJson.Create;
      QJson.Parse(json);
      for i := 0 to QJson.Count - 1 do
      begin
        if FormatDatetime('yyyy-mm-dd hh:nn', sj)
          = LeftStr(TCommon.GetJsonNode('wfsj', QJson.Items[i].ToString), 16)
        then
        begin
          xh := TCommon.GetJsonNode('xh', QJson.Items[i].ToString);
          break;
        end;
      end;
      QJson.Free;
    end;

    if xh <> '' then
    begin
      params.Clear;
      params.Add('xh=' + xh);
      params.Add('JKID=04C04');
      sjson := DoQeury(token, params);
      json := TCommon.GetJsonNode('viojdczp', sjson);
      if json = '' then
      begin
        gLogger.Info(sjson);
        json := '[]';
      end;
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
    end
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('[]');
  except
    on e: Exception do
    begin
      gLogger.Error(e.Message);
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(e.Message);
    end;
  end;
end;

class procedure TRmService.DoRM(action, tokenKey: String; params: TStrings;
  isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
const
  rmweb = ',QVEHBUS,QSTATION,QSTATIONRELATION,QSTATIONPERSON,FEEDBACK,FEEDBACKPIC,VEHCHECK,';
  rminf = ',SURSCREEN,SUREXAMINE,FLOWEQUIP,WEATHER,INCIDENT,INDUCEMENT,CAR,POLICE,PARK,';
var
  json, sjson, wsbh: string;
  token: TToken;
begin
  ActiveX.CoInitialize(nil);

  token := gTokenManager.GetToken(tokenKey);

  if action = Uppercase('GetVehInfo') then
  begin
    DoGetVehInfo(token, params, AResponseInfo);
  end
  else if action = Uppercase('GetDrvInfo') then
  begin
    DoGetDrvInfo(token, params, AResponseInfo);
  end
  else if action = Uppercase('GetVioInfoByDrv') then
  begin
    json := GetVioInfoByDrv(token, params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  end
  else if action = Uppercase('GetVioPicinfo') then
  begin
    GetVioPic(token, params, AResponseInfo);
  end
  else if action = Uppercase('GetVioInfoByVeh') then
  begin
    {
      params.Add('JKID=04C03');
      sjson := DoQeury(token, params);
      json := TCommon.GetJsonNode('viosurveil', sjson);
      if json = '' then
      begin
      gLogger.Info(sjson);
      json := '[]';
      end
      else
      json := TCommon.AddWfxwmc(json);
    }
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
      (GetVioInfoByVeh(token, params));
  end
  else if action = Uppercase('GetVioCount') then
  begin
    GetVioCount(token, params, AResponseInfo);
  end
  else if action = Uppercase('WriteVio') then
  begin
    DoWriteVio(token, params, AResponseInfo);
  end
  else if action = Uppercase('WriteVehicleInfo') then
  begin
    DoWriteVehicleInfo(params, AResponseInfo);
  end
  // 六合一 查询
  else if action = 'QUERY' then
  begin
    AResponseInfo.ContentText := DoQeury(token, params);
  end
  // 六合一 写入
  else if action = 'WRITE' then
  begin
    AResponseInfo.ContentText := DoWrite(token, params);
  end
  // 集中指挥平台 查询
  else if rmweb.Contains(action) then
  begin
    DoRmweb(action, params, AResponseInfo);
  end
  // 集中指挥平台 写入
  else if rminf.Contains(action) then
  begin
    DoRminf(action, params, AResponseInfo);
  end
  // 文书管理 begin
  else if action = 'APPLYWSBH' then
  begin
    ApplyWSBH(token, params, AResponseInfo);
  end
  else if action = 'SUBMITWSBH' then
  begin
    wsbh := params.Values['wsbh'];
    if gWSManager.Submit(wsbh) then
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('');
  end
  else if action = 'ROLLBACKWSBH' then
  begin
    wsbh := params.Values['wsbh'];
    if gWSManager.Rollback(wsbh) then
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('');
  end
  // 文书管理 end
  else if action = 'GETVIOLATIONINFO' then
  begin
    GetViolationInfo(token, params, AResponseInfo);
  end
  else if action = 'SAVESIMPLEVIO' then
  begin
    SaveSimpleVio(token, params, AResponseInfo);
  end
  else if action = 'SAVEDUTYSIMPLE' then
  begin
    SaveDutySimple(token, params, AResponseInfo);
  end
  else if action = 'WRITESG' then
  begin
    WriteSG(token, params, AResponseInfo);
  end
  else if action = 'SAVEFORCEVIO' then
  begin
    SaveForceVio(token, params, AResponseInfo);
  end;
  ActiveX.CoUninitialize;
end;

class function TRmService.GetDrvInfo(token: TToken; params: TStrings): String;
var
  json: String;
begin
  if JKDic.ContainsKey('02C26') then
  begin
    params.Add('JKID=02C26');
    json := DoQeury(token, params);
    result := TCommon.GetJsonNode('Drv', json);
  end
  else
  begin
    params.Add('JKID=02C06');
    json := DoQeury(token, params);
    result := TCommon.GetJsonNode('DrvPerson', json);
  end;
  if result = json then
    result := '-1'
  else
    TCommon.SaveDrvInfo(json);
end;

class function TRmService.GetDwdm(zqmj: String): String;
begin
  result := gSQLHelper.GetSinge('select dwdm from ' + cDBName +
    '.dbo.S_User where yhbh=''' + zqmj + '''');
end;

class function TRmService.GetVehInfo(token: TToken; hphm, hpzl: String): String;
var
  sf, json: string;
  params: TStrings;
begin
  params := TStringList.Create;
  sf := copy(hphm, 1, 1);
  params.Add('hphm=' + copy(hphm, 2, 100));
  params.Add('hpzl=' + hpzl);
  if sf = '粤' then
    params.Add('JKID=01C21')
  else
  begin
    params.Add('sf=' + sf);
    params.Add('JKID=01C49');
  end;
  json := DoQeury(token, params);
  result := TCommon.GetJsonNode('veh', json);
  if result = json then
    result := '-1'
  else
    TCommon.SaveVehInfo(result);
  params.Free;
end;

class procedure TRmService.GetVioCount(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  s, c: String;
  json: TQJson;
begin
  s := GetVioInfoByVeh(token, params);
  json := TQJson.Create;
  try
    json.Parse(s);
    c := json.Count.ToString;
  except
    c := '0';
  end;
  json.Free;
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
    ('{"count":"' + c + '"}');
end;

class function TRmService.GetVioInfoByDrv(token: TToken;
  params: TStrings): String;
var
  sjson: String;
begin
  params.Add('JKID=04C01');
  sjson := DoQeury(token, params);
  result := TCommon.GetJsonNode('violation', sjson);
  if result = '' then
  begin
    gLogger.Info(sjson);
    result := '[]';
  end
  else
    result := TCommon.AddWfxwmc(result);
end;

class function TRmService.GetVioInfoByVeh(token: TToken;
  params: TStrings): String;
var
  json: String;
begin
  params.Add('JKID=04C03');
  json := DoQeury(token, params);
  result := TCommon.GetJsonNode('viosurveil', json);
  if json = '' then
  begin
    gLogger.Info(json);
    json := '[]';
  end
  else
    json := TCommon.AddWfxwmc(result);
end;

class procedure TRmService.GetViolationInfo(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  jkid, wsbh, wslb, json, sjson, viotag: String;
  condition: TStrings;
begin
  wsbh := params.Values['wsbh'];
  wslb := params.Values['wslb'];
  if (wsbh = '') or (wslb = '') then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('parameter error');
    exit;
  end;
  if (wslb <> '3') and (wslb <> '6') then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('parameter error');
    exit;
  end;

  condition := TStringList.Create;
  if wslb = '6' then
  begin
    viotag := 'violation';
    condition.Add('JKID=04C01');
    condition.Add('jdsbh=' + wsbh);
  end
  else
  begin
    jkid := '04C02';
    viotag := 'vioforce';
    condition.Add('JKID=04C02');
    condition.Add('pzbh=' + wsbh);
  end;
  sjson := DoQeury(token, condition);
  json := TCommon.GetJsonNode(viotag, sjson);
  if json = '' then
  begin
    gLogger.Info(sjson);
    json := '[]';
  end;
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  condition.Free;
end;

class function TRmService.GetZQMJ(oldZqmj: string): string;
var
  newZqmj: string;
begin
  newZqmj := gSQLHelper.GetSinge('select ZQMJ2 from ' + cDBName +
    '.dbo.T_ZQMJ_MAP where ZQMJ1=''' + oldZqmj + '''');
  if newZqmj = '' then
    newZqmj := oldZqmj;
  result := newZqmj;
end;

class procedure TRmService.CheckForceParam(params: TStrings);
var
  wfxw1, wfxw2, wfxw3, wfxw4, wfxw5: String;
  n: Integer;
begin
  wfxw1 := params.Values['wfxw1'];
  wfxw2 := params.Values['wfxw2'];
  wfxw3 := params.Values['wfxw3'];
  wfxw4 := params.Values['wfxw4'];
  wfxw5 := params.Values['wfxw5'];
  // 去重
  if wfxw5 <> '' then
  begin
    if (wfxw5 = wfxw1) or (wfxw5 = wfxw2) or (wfxw5 = wfxw3) or (wfxw5 = wfxw4)
    then
      wfxw5 := '';
  end;
  if wfxw4 <> '' then
  begin
    if (wfxw4 = wfxw1) or (wfxw4 = wfxw2) or (wfxw4 = wfxw3) then
      wfxw4 := '';
  end;
  if wfxw3 <> '' then
  begin
    if (wfxw3 = wfxw1) or (wfxw3 = wfxw2) then
      wfxw3 := '';
  end;
  if (wfxw2 <> '') and (wfxw2 = wfxw1) then
    wfxw2 := '';

  // 挪动
  if wfxw1 = '' then
  begin
    if wfxw2 <> '' then
    begin
      wfxw1 := wfxw2;
      wfxw2 := '';
    end
    else if wfxw3 <> '' then
    begin
      wfxw1 := wfxw3;
      wfxw3 := '';
    end
    else if wfxw4 <> '' then
    begin
      wfxw1 := wfxw4;
      wfxw4 := '';
    end
    else if wfxw5 <> '' then
    begin
      wfxw1 := wfxw5;
      wfxw5 := '';
    end;
  end;

  if wfxw2 = '' then
  begin
    if wfxw3 <> '' then
    begin
      wfxw2 := wfxw3;
      wfxw3 := '';
    end
    else if wfxw4 <> '' then
    begin
      wfxw2 := wfxw4;
      wfxw4 := '';
    end
    else if wfxw5 <> '' then
    begin
      wfxw2 := wfxw5;
      wfxw5 := '';
    end;
  end;

  if wfxw3 = '' then
  begin
    if wfxw4 <> '' then
    begin
      wfxw3 := wfxw4;
      wfxw4 := '';
    end
    else if wfxw5 <> '' then
    begin
      wfxw3 := wfxw5;
      wfxw5 := '';
    end;
  end;

  if (wfxw4 = '') and (wfxw5 <> '') then
  begin
    wfxw4 := wfxw5;
    wfxw5 := '';
  end;

  //
  n := params.IndexOfName('wfxw1');
  if wfxw1 = '' then
  begin
    if n >= 0 then
    begin
      params.Delete(n);
      n := params.IndexOfName('scz1');
      if n >= 0 then
        params.Delete(n);
      n := params.IndexOfName('bzz1');
      if n >= 0 then
        params.Delete(n);
    end;
  end
  else
  begin
    if n >= 0 then
      params.Values['wfxw1'] := wfxw1
    else
    begin
      params.Add('wfxw1=' + wfxw1);
    end;
  end;

  n := params.IndexOfName('wfxw2');
  if wfxw2 = '' then
  begin
    if n >= 0 then
    begin
      params.Delete(n);
      n := params.IndexOfName('scz2');
      if n >= 0 then
        params.Delete(n);
      n := params.IndexOfName('bzz2');
      if n >= 0 then
        params.Delete(n);
    end;
  end
  else
  begin
    if n >= 0 then
      params.Values['wfxw2'] := wfxw2
    else
      params.Add('wfxw2=' + wfxw2);
  end;

  n := params.IndexOfName('wfxw3');
  if wfxw3 = '' then
  begin
    if n >= 0 then
    begin
      params.Delete(n);
      n := params.IndexOfName('scz3');
      if n >= 0 then
        params.Delete(n);
      n := params.IndexOfName('bzz3');
      if n >= 0 then
        params.Delete(n);
    end;
  end
  else
  begin
    if n >= 0 then
      params.Values['wfxw3'] := wfxw3
    else
      params.Add('wfxw3=' + wfxw3);
  end;

  n := params.IndexOfName('wfxw4');
  if wfxw4 = '' then
  begin
    if n >= 0 then
    begin
      params.Delete(n);
      n := params.IndexOfName('scz4');
      if n >= 0 then
        params.Delete(n);
      n := params.IndexOfName('bzz4');
      if n >= 0 then
        params.Delete(n);
    end;
  end
  else
  begin
    if n >= 0 then
      params.Values['wfxw4'] := wfxw4
    else
      params.Add('wfxw4=' + wfxw4);
  end;

  n := params.IndexOfName('wfxw5');
  if wfxw5 = '' then
  begin
    if n >= 0 then
    begin
      params.Delete(n);
      n := params.IndexOfName('scz5');
      if n >= 0 then
        params.Delete(n);
      n := params.IndexOfName('bzz5');
      if n >= 0 then
        params.Delete(n);
    end;
  end
  else
  begin
    if n >= 0 then
      params.Values['wfxw5'] := wfxw5
    else
      params.Add('wfxw5=' + wfxw5);
  end;
end;

class procedure TRmService.SaveForceVio(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, code, wfsj, pzbh, checkStr, oldMj, newMj, zqmj2: String;
  tmriParam: TTmriParam;
  n: Integer;
begin
  checkStr := CheckForceInput(token, params);
  if checkStr <> '' then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(checkStr);
    exit;
  end;
  CheckForceParam(params);
  oldMj := params.Values['zqmj'];
  newMj := GetZQMJ(oldMj);
  if oldMj <> newMj then
  begin
    params.Values['zqmj'] := newMj;
    params.Values['fxjg'] := GetDwdm(newMj);
  end;

  zqmj2 := params.Values['zqmj2'];
  n := params.IndexOfName('zqmj2');
  if n >= 0 then
    params.Delete(n);

  params.Add('JKID=04C55');
  json := DoWrite(token, params);
  gLogger.Info(json);
  code := TCommon.GetJsonNode('code', json);
  if code = '1' then
  begin
    if params.IndexOf('lrr') >= 0 then
      params.Values['lrr'] := token.Login
    else
      params.Add('lrr=' + token.Login);
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    params.Add('zt=1');
    params.Add('zqmj2=' + zqmj2);
    pzbh := params.Values['pzbh'];
    if RightStr(pzbh, 8) >= '30000000' then
      TWSManager.Submit(pzbh)
    else
    begin
      wfsj := params.Values['wfsj'];
      if DateUtils.MinutesBetween(TCommon.StringToDT(wfsj), Now()) > 10 then
        // 如果用手写单但10分钟内在pda上录入，也认为是非手写单
        TCommon.SaveSLWS(token.Login);
    end;
    TCommon.WriteForceVio(params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
  end
  else if code = '0' then
  begin
    code := TCommon.GetJsonNode('msg', json);
    if code = '' then
      code := TCommon.GetJsonNode('msg1', json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
  end
  else if code = '' then
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('6合1网络故障')
  else
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
end;

class procedure TRmService.SaveSimpleVio(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, code, zt, wfsj, jdsbh, zqmj2: String;
  tmriParam: TTmriParam;
  n: Integer;
begin
  if IsReVio(params, 1) then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('重复录入');
    exit;
  end;

  zqmj2 := params.Values['zqmj2'];
  n := params.IndexOfName('zqmj2');
  if n >= 0 then
    params.Delete(n);

  params.Add('JKID=04C54');
  json := DoWrite(token, params);
  gLogger.Info(json);
  code := TCommon.GetJsonNode('code', json);
  if code = '1' then
  begin
    if params.IndexOf('lrr') >= 0 then
      params.Values['lrr'] := token.Login
    else
      params.Add('lrr=' + token.Login);
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    params.Add('zt=1');
    params.Add('zqmj2=' + zqmj2);
    jdsbh := params.Values['jdsbh'];
    if RightStr(jdsbh, 8) >= '30000000' then
      TWSManager.Submit(jdsbh)
    else
    begin
      wfsj := params.Values['wfsj'];
      if DateUtils.MinutesBetween(TCommon.StringToDT(wfsj), Now()) > 10 then
        // 如果用手写单但10分钟内在pda上录入，也认为是非手写单
        TCommon.SaveSLWS(token.Login);
    end;

    TCommon.WriteSimpleVio(params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
  end
  else if code = '0' then
  begin
    gLogger.Info(json);
    code := TCommon.GetJsonNode('msg', json);
    if code = '' then
      code := TCommon.GetJsonNode('msg1', json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
  end
  else if code = '' then
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('6合1网络故障')
  else
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
end;

class procedure TRmService.WriteSG(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  ryInfo, wsbh: String;
  ts: TStrings;
begin
  wsbh := '445101520183000001';

  // gWSManager.Apply(token.Login, '445101', 'B', '1', 1);
  {
    params.Clear;
    params.Add('jdsbh=445100100601478');
    params.Add('ryfl=4');
    params.Add('jszh=440583198401123199');
    params.Add('fzjg=粤U');
    params.Add('zjcx=B2E');
    params.Add('hphm=粤U99858');
    params.Add('dsr=林广铭');
    params.Add('clfl=3');
    params.Add('hpzl=02');
    params.Add('jtfs=K33');
    params.Add('wfsj=2018-03-29 18:30:38');
    params.Add('xzqh=445101');
    params.Add('wfdd=60582');
    params.Add('lddm=1004');
    params.Add('wfdz=市区福安路口市区福安路口北往南');
    params.Add('wfxw=1090');
    params.Add('cfzl=1');
    params.Add('fkje=0');
    params.Add('jkfs=0');
    params.Add('jkbj=0');
    params.Add('sgdj=0');
    params.Add('jsjqbj=00');
    params.Add('zqmj=250414');
    params.Add('fxjg=445104005200');
    params.Add('dabh=445192129223');
    params.Add('dh=13509890999');
    params.Add('ddms=0');
  }
  // ryInfo := '$$445101$$1$$胡舒敏$$1$$342921198309063411$$35$$广州$$13570969818$$15$$1$$9009$$$$$$$$$$$$$$F1$$342921$$$$$$$$C1$$$$'
  // + '$$粤A$$5$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$11$$';

  ryInfo := '$$445101$$1$$林广铭$$1$$440583198401123199$$34$$广东省潮州市湘桥区奎元北路34号一梯702$$13509890999$$02$$1$$2004$$$$$$$$$$$$$$K3$$44058$$$$$$$$$$$$$$$$3$$粤U99858$$02$$$$$$$$$$大众汽车牌'
    + '$$SVW71810FJ$$$$$$$$$$$$$$$$1$$无$$$$$$11$$$$~~$$445101$$2$$小明$$$$336558899996$$无$$无$$无$$$$1$$$$$$$$$$$$$$$$A1$$33655$$$$$$$$$$$$$$$$4$$无$$$$$$$$$$$$无$$无$$$$$$$$$$$$$$$$无$$无$$$$$$11$$$$~~';

  // ts := TStringList.Create;
  // ts.LoadFromFile(ExtractFilePath(paramstr(0)) + 'sg.txt');
  // ryInfo := ts.Text;
  // ts.Free;

  { "lm":"260省道1001米","gls":"1","sgrdyy":"非机动车逆向行驶的","dllx":"10","glxzdj":"1","sszd":"445100000000","sgss":"2018-09-03 14:01,在260省道1001米,发生碰撞运动车辆事故。至受伤0人,直接财产损失0元。当事人1:林广铭(男,34岁,驾驶证号440583198401123199),驾驶小型客车,车牌号粤U99858。当事人2:小明(无,无岁,驾驶证号336558899996),步行,车牌号无。当事人林广铭负3责任;当事人小明负4责任。","zrtjjg":"经双方共同请求调整达成一致：赔偿元，就此结案。","jar2":"000932","jafs":"1","tjfs":"1" }

  params.Clear;
  // params.Add('sgbh=' + FormatDatetime('yyymmddhhnnsszzz', now()));
  params.Add('xzqh=445101');
  params.Add('sgfssj=2018-09-03 11:05');
  params.Add('lh=20260');
  params.Add('lm=260省道1001米');
  params.Add('gls=1');
  params.Add('ms=0');
  params.Add('sgdd=260省道1001米');
  params.Add('ssrs=0');
  params.Add('zjccss=0');
  params.Add('sgrdyy=9009');
  params.Add('tq=1');
  params.Add('dllx=22');
  params.Add('sgxt=11');
  params.Add('dcsg=21');
  params.Add('tjr=林广铭');
  params.Add('wsbh=' + wsbh);
  params.Add('cclrsj=2018-09-03 11:05:00');
  params.Add('sszd=445101000000');
  params.Add('glbm=445100000000');
  params.Add('sgss=测试数据');
  params.Add('zrtjjg=经双方共同请求调解达成一致：赔偿元，就是结案。');
  params.Add('jar1=陈焕林');
  params.Add('jar2=林广铭');
  params.Add('jbr=林广铭');
  params.Add('gxsj=2018-09-03 11:05:00');
  params.Add('jafs=1');
  params.Add('tjfs=1');
  params.Add('ryxx=' + ryInfo);
  params.Add('rylen=2');
  params.Add('cljsg=1');
  SaveDutySimple(token, params, AResponseInfo);

  // SaveSimpleVio(token, params, AResponseInfo);

end;

class procedure TRmService.SaveDutySimple(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  n: Integer;
  json, code, djbh, sgbh, wsbh: String;
  tmriParam: TTmriParam;
begin
  params.Add('JKID=03C52');
  json := DoWrite(token, params);
  code := TCommon.GetJsonNode('code', json);
  if code = '1' then
  begin
    djbh := TCommon.GetJsonNode('message', json);
    sgbh := TCommon.GetJsonNode('Message1', json);
    if params.IndexOf('djbh') >= 0 then
      params.Values['djbh'] := djbh
    else
      params.Add('djbh=' + djbh);
    if params.IndexOf('sgbh') >= 0 then
      params.Values['sgbh'] := djbh
    else
      params.Add('sgbh=' + sgbh);
    if params.IndexOf('lrr') >= 0 then
      params.Values['lrr'] := token.Login
    else
      params.Add('lrr=' + token.Login);
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    params.Add('zt=1');
    TCommon.WriteDutySimple(params);
    wsbh := params.Values['wsbh'];
    if wsbh <> '' then
      gWSManager.Submit(wsbh);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
      ('{"wsbh":"' + wsbh + '","sgbh":"' + sgbh + '"}');
  end
  else if code = '0' then
  begin
    gLogger.Info(json);
    code := TCommon.GetJsonNode('message', json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
  end
  else if code = '' then // 6合1问题,不能暂时缓存到数据库，因为要返回事故编号，用来开单
  begin
    gLogger.Info(json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(json);
    // AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
    {
      n := params.IndexOfName('JKID');
      if n >= 0 then
      params.Delete(n);
      params.Add('bz=write zhpt error:' + json);
      TCommon.WriteDutySimple(params);
    }
  end
  else
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
end;

class function TRmService.CheckForceInput(token: TToken;
  params: TStrings): String;
var
  ryfl, jszh, json: String;
  ts: TStrings;
begin
  result := '';
  if IsReVio(params, 2) then
  begin
    result := '重复录入';
  end
  else
  begin
    ryfl := params.Values['ryfl'];
    jszh := params.Values['jszh'];
    if ryfl = '9' then
    begin
      ts := TStringList.Create;
      ts.Add('sfzmhm=' + jszh);
      json := GetDrvInfo(token, ts);
      if (json <> '-1') and (json <> '') then
      begin
        result := '输入的驾驶证存在，人员分类不能选择[其他]';
        gLogger.Debug(result + ' ' + params.Text);
      end;
      ts.Free;
    end;
  end;
end;

class function TRmService.IsReVio(params: TStrings; lx: Integer): Boolean;
// 1 简易  2 强制
var
  s, zqmj, ryfl, jszh, hphm, hpzl, wfdd, wfsj, wfxw: String;
  tb: String;
begin
  result := false;
  zqmj := params.Values['zqmj'];
  ryfl := params.Values['ryfl'];
  jszh := params.Values['jszh'];
  hphm := params.Values['hphm'];
  hpzl := params.Values['hpzl'];
  wfdd := params.Values['wfdd'];
  wfsj := params.Values['wfsj'];
  wfxw := params.Values['wfxw'];

  s := ' where zqmj=' + zqmj.QuotedString + ' and ryfl=' + ryfl.QuotedString +
    ' and wfdd=' + wfdd.QuotedString + ' and abs(DATEDIFF(MI, ' +
    wfsj.QuotedString + ', wfsj)) <= 60 ';
  if wfxw <> '' then
    s := s + ' and wfxw = ' + wfxw.QuotedString;
  if ryfl = '4' then
  begin
    s := s + ' and jszh=' + jszh.QuotedString;
  end
  else if pos('无', jszh) <= 0 then
  begin
    s := s + ' and jszh=' + jszh.QuotedString;
  end
  else if (pos('无', hphm) <= 0) and (pos('无', hpzl) <= 0) then
    s := s + ' and hphm = ' + hphm.QuotedString + ' and hpzl=' +
      hpzl.QuotedString
  else
    exit;

  if lx = 1 then
    tb := cDBName + '.dbo.T_Spot_Violation'
  else
    tb := cDBName + '.dbo.T_Spot_Force';

  result := gSQLHelper.ExistsRecord(tb, s);
end;

end.
