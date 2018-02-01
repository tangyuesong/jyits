unit uRmService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IniFiles, IdContext, uLogger, HTTPApp, uTmri, uRmweb,
  uRminf, uTrans, ActiveX, IdURI, IdHttp, StrUtils,
  IdSSLOpenSSL, uTokenManager, uGlobal, uCommon, QJson;

type

  TRmService = class
  private
    class function ParamsToJson(params: TStrings; exceptName: string = '')
      : string; static;
    class procedure DoGetVehInfo(token: TToken; params: TStrings;
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
    class procedure SaveForceVio(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
  public
    class function GetVehinfo(token: TToken; hphm, hpzl: String): String;
    class procedure DoRM(action, tokenKey: String; params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
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

class procedure TRmService.DoGetVehInfo(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  json := GetVehinfo(token, params.Values['HPHM'], params.Values['HPZL']);
  if json = '' then
  begin
    json := '[]';
  end;
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
  gLogger.Info(json);
  json := TTmri.Write(tmriParam, json);
  result := json;
  gLogger.Info(json);
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
  wsbh, wslb, num, json, sjson: string;
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
    params.Add('JKID=02C06');
    sjson := DoQeury(token, params);
    json := TCommon.GetJsonNode('DrvPerson', sjson);
    if json = '' then
    begin
      gLogger.Info(sjson);
      json := '[]';
    end;
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  end
  else if action = Uppercase('GetVioInfoByDrv') then
  begin
    params.Add('JKID=04C01');
    sjson := DoQeury(token, params);
    json := TCommon.GetJsonNode('violation', sjson);
    if json = '' then
    begin
      gLogger.Info(sjson);
      json := '[]';
    end
    else
      json := TCommon.AddWfxwmc(json);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  end
  else if action = Uppercase('GetVioPicinfo') then
  begin
    GetVioPic(token, params, AResponseInfo);
  end
  else if action = Uppercase('GetVioInfoByVeh') then
  begin
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
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
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
    wslb := params.Values['wslb'];
    num := params.Values['num'];
    wsbh := gWSManager.Apply(token.Login, wslb, strtointdef(num, 0));
    wsbh := '{"wsbh":"' + wsbh + '"}';
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(wsbh);
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
  else if action = 'SAVEFORCEVIO' then
  begin
    SaveForceVio(token, params, AResponseInfo);
  end;
  ActiveX.CoUninitialize;
end;

class function TRmService.GetVehinfo(token: TToken; hphm, hpzl: String): String;
var
  sf: string;
  params: TStrings;
begin
  params := TStringList.Create;
  try
    sf := copy(hphm, 1, 1);
    params.Add('hphm=' + copy(hphm, 2, 100));
    params.Add('hpzl=' + hpzl);
    if sf = '粤' then
    begin
      params.Add('JKID=01C21');
    end
    else
    begin
      params.Add('sf=' + sf);
      params.Add('JKID=01C49');
    end;
    result := DoQeury(token, params);
    result := TCommon.GetJsonNode('veh', result);
    TCommon.SaveVehInfo(result);
  except
  end;
  params.Free;
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

class procedure TRmService.SaveForceVio(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, code: String;
  tmriParam: TTmriParam;
begin
  params.Add('JKID=04C55');
  json := DoWrite(token, params);
  code := TCommon.GetJsonNode('code', json);
  if code = '1' then
  begin
    TCommon.WriteForceVio(params.Values['dsr'], params.Values['wfsj'],
      params.Values['pzbh'], token.User.YHXM);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
  end
  else
  begin
    gLogger.Info(json);
    code := TCommon.GetJsonNode('msg', json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
  end;
end;

class procedure TRmService.SaveSimpleVio(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, code: String;
  tmriParam: TTmriParam;
begin
  params.Add('JKID=04C54');
  json := DoWrite(token, params);
  code := TCommon.GetJsonNode('code', json);
  if code = '1' then
  begin
    TCommon.WriteSimpleVio(params.Values['dsr'], params.Values['wfsj'],
      params.Values['jdsbh'], token.User.YHXM);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
  end
  else
  begin
    gLogger.Info(json);
    code := TCommon.GetJsonNode('msg', json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
  end;
end;

end.
