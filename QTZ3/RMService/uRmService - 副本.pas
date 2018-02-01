unit uRmService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IniFiles, IdContext, HTTPApp, uTmri, uRmweb,
  uRminf, uTrans, ActiveX, Soap.EncdDecd, IdURI, IdHttp, QJson,
  IdSSLOpenSSL, uTokenManager, uGlobal, uCommon, StrUtils;

type
  TRmService = class
  private
    class procedure DoGetDrvInfo(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoGetVehInfo(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoGetVioInfoByDrv(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoGetVioPic(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoGetVioInfoByVeh(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoWriteVio(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoRminf(action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoRmweb(action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoWriteVehicleInfo(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoQeury(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoWrite(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class function ParamsToJson(UnparsedParams: string;
      exceptName: string = ''): string;
  public
    class procedure DoRM(action, tokenKey: String; Params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
    class procedure InitRM;
  end;

implementation

class procedure TRmService.InitRM;
begin
  with TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini') do
  begin
    uRminf.RminfXLH := ReadString('RmInf', 'XLH', '');
    uRminf.RminfWSDL := 'http://' + ReadString('RmInf', 'Host', '') + ':' +
      ReadString('RmInf', 'Port', '9080') + '/rminf/services/RmOutAccess?wsdl';

    uRmweb.RmwebXLH := ReadString('RmWeb', 'XLH', '');
    uRmweb.RmwebWSDL := 'http://' + ReadString('RmWeb', 'Host', '') + ':' +
      ReadString('RmWeb', 'Port', '9080') + '/rmweb/services/RmOutAccess?wsdl';

    uTmri.TmriXLH := ReadString('Tmri', 'XLH', '');
    uTmri.TmriWSDL := 'http://' + ReadString('Tmri', 'Host', '') + ':' +
      ReadString('Tmri', 'Port', '80') + '/trffweb/services/TmriOutAccess?wsdl';

    uTrans.TransXLH := ReadString('Trans', 'XLH', '');
    uTrans.TransWSDL := 'http://' + ReadString('Trans', 'Host', '') + ':' +
      ReadString('Trans', 'Port', '9080') + '/rminf/services/Trans?wsdl';

    Free;
  end;
end;

class function TRmService.ParamsToJson(UnparsedParams: string;
  exceptName: string = ''): string;
var
  Params: TStrings;
  first: Boolean;
  i: integer;
begin
  Params := TStringList.Create;
  Params.Delimiter := '&';
  Params.DelimitedText := UnparsedParams;
  for i := 0 to Params.Count - 1 do
    Params[i] := HttpDecode(Params[i]);
  first := True;
  result := '{';
  for i := 0 to Params.Count - 1 do
  begin
    if (not exceptName.Contains(',' + Params.Names[i].ToUpper + ',')) and
      (Params.Names[i] <> '') and (Params.ValueFromIndex[i] <> '') then
    begin
      if first then
        result := result + '"' + Params.Names[i] + '":"' +
          Params.ValueFromIndex[i] + '"'
      else
        result := result + ',"' + Params.Names[i] + '":"' +
          Params.ValueFromIndex[i] + '"';
    end;
  end;
  result := result + '}';
  Params.Free;
end;

class procedure TRmService.DoGetDrvInfo(Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  sfzhm, json: string;
begin
  try
    sfzhm := Params.Values['SFZHM'];
    json := TTmri.GetDrvInfo(sfzhm);
    json := TCommon.GetJsonNode('DrvPerson', json);
    if json = '' then
      json := '[]';
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  except
    on e: Exception do
    begin
      gLogger.Error(e.Message);
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(e.Message);
    end;
  end;
end;

class procedure TRmService.DoGetVehInfo(Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  sf, hphm, hpzl, dabh, json: string;
begin
  try
    hphm := Uppercase(Params.Values['HPHM']);
    hpzl := Params.Values['HPZL'];
    dabh := Params.Values['DABH'];

    sf := copy(hphm, 1, 1);
    if sf = '粤' then
      json := TTmri.GetVehInfo(sf, copy(hphm, 2, 100), hpzl, dabh)
    else
      json := TTmri.Q01C49(sf, hpzl, copy(hphm, 2, 100));

    json := TCommon.GetJsonNode('veh', json);
    if json = '' then
      json := '[]';
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  except
    on e: Exception do
    begin
      gLogger.Error(Params.DelimitedText + ': ' + e.Message);
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(e.Message);
    end;
  end;
end;

class procedure TRmService.DoGetVioInfoByVeh(Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  hphm, hpzl, xh, clbj, json: string;
begin
  try
    hphm := Uppercase(Params.Values['HPHM']);
    hpzl := Params.Values['HPZL'];
    xh := Params.Values['XH'];
    clbj := Params.Values['CLBJ'];
    json := TTmri.GetVioInfoByVeh(xh, hphm, hpzl, clbj);
    json := TCommon.GetJsonNode('viosurveil', json);
    if json = '' then
      json := '[]'
    else
      json := TCommon.AddWfxwmc(json);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  except
    on e: Exception do
    begin
      gLogger.Error(e.Message);
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(e.Message);
    end;
  end;
end;

class procedure TRmService.DoWriteVio(Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, flag: string;
begin
  json := Params.Values['vio'];
  flag := Params.Values['flag'];
  if flag = '0' then
    AResponseInfo.ContentText := TTmri.WriteVioSurveil(json)
  else
    AResponseInfo.ContentText := TTmri.WriteVioSurveil1(json);
end;

class procedure TRmService.DoGetVioInfoByDrv(Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  jdsbh: string;
  wfbh: string;
  jszh: string;
  dabh: string;
  jkbj: string;
  json: string;
begin
  try
    jdsbh := Params.Values['jdsbh'];
    wfbh := Params.Values['wfbh'];
    jszh := Params.Values['jszh'];
    dabh := Params.Values['dabh'];
    jkbj := Params.Values['jkbj'];
    json := TTmri.GetVioInfoByDrv(jdsbh, wfbh, jszh, dabh, jkbj);
    json := TCommon.GetJsonNode('violation', json);
    if json = '' then
      json := '[]'
    else
      json := TCommon.AddWfxwmc(json);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  except
    on e: Exception do
    begin
      gLogger.Error(e.Message);
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(e.Message);
    end;
  end;
end;

class procedure TRmService.DoGetVioPic(Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, xh, hphm, hpzl, wfsj: string;
  QJson: TQJson;
  i: integer;
  t: Int64;
  sj: TDatetime;
begin
  try
    xh := Params.Values['xh'];
    if xh = '' then
    begin
      hphm := Uppercase(Params.Values['HPHM']);
      hpzl := Params.Values['hpzl'];
      wfsj := Params.Values['wfsj'];
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

      json := TTmri.GetVioInfoByVeh('', hphm, hpzl, '');
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
      json := TTmri.GetVioPicinfo(xh);
      json := TCommon.GetJsonNode('viojdczp', json);
      if json = '' then
        json := '[]';
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

class procedure TRmService.DoWriteVehicleInfo(Params: TStrings;
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
    kkbh := Params.Values['kkbh'];
    fxlx := Params.Values['fxlx'];
    cdh := strtointdef(Params.Values['cdh'], 0);
    hphm := Uppercase(Params.Values['HPHM']);
    hpzl := Params.Values['hpzl'];
    gcsj := Params.Values['gcsj'];
    clsd := strtointdef(Params.Values['clsd'], 0);
    clxs := strtointdef(Params.Values['clxs'], 0);
    wfdm := Params.Values['wfdm'];
    cwkc := strtointdef(Params.Values['cwkc'], 0);
    hpys := Params.Values['hpys'];
    cllx := Params.Values['cllx'];
    fzhpzl := Params.Values['fzhpzl'];
    fzhphm := Params.Values['fzhphm'];
    fzhpys := Params.Values['fzhpys'];
    clpp := Params.Values['clpp'];
    clwx := Params.Values['clwx'];
    csys := Params.Values['csys'];
    tplj := Params.Values['tplj'];
    tp1 := Params.Values['tp1'];
    tp2 := Params.Values['tp2'];
    tp3 := Params.Values['tp3'];
    tztp := Params.Values['tztp'];

    rst := TTrans.WriteVehicleInfo(kkbh, fxlx, cdh, hphm, hpzl, gcsj, clsd,
      clxs, wfdm, cwkc, hpys, cllx, fzhpzl, fzhphm, fzhpys, clpp, clwx, csys,
      tplj, tp1, tp2, tp3, tztp);
    AResponseInfo.ContentText := rst.ToString();
  except
    on e: Exception do
      gLogger.Error(e.Message);
  end;
end;

class procedure TRmService.DoRmweb(action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  action := LowerCase(action);
  json := ParamsToJson(Params.DelimitedText);

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

class procedure TRmService.DoRminf(action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  action := LowerCase(action);
  json := ParamsToJson(Params.DelimitedText);

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

class procedure TRmService.DoQeury(Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  jkid, json: string;
begin
  jkid := Params.Values['JKID'];
  json := ParamsToJson(Params.DelimitedText, ',JKID,');
  json := TTmri.Query(jkid, json);
  AResponseInfo.ContentText := json;
end;

class procedure TRmService.DoWrite(Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  jkid, jdid, json: string;
begin
  jkid := Params.Values['JKID'];
  jdid := Params.Values['JDID'];
  json := ParamsToJson(Params.DelimitedText, ',JKID,JDID,');
  json := TTmri.Write(jkid, jdid, json);
  AResponseInfo.ContentText := json;
end;

class procedure TRmService.DoRM(action, tokenKey: String; Params: TStrings;
  isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
const
  rmweb = ',QVEHBUS,QSTATION,QSTATIONRELATION,QSTATIONPERSON,FEEDBACK,FEEDBACKPIC,VEHCHECK,';
  rminf = ',SURSCREEN,SUREXAMINE,FLOWEQUIP,WEATHER,INCIDENT,INDUCEMENT,CAR,POLICE,PARK,';
begin
  ActiveX.CoInitialize(nil);

  if action = Uppercase('GetVehInfo') then //
  begin
    DoGetVehInfo(Params, AResponseInfo);
  end
  else if action = Uppercase('GetDrvInfo') then //
  begin
    DoGetDrvInfo(Params, AResponseInfo);
  end
  else if action = Uppercase('GetVioInfoByDrv') then //
  begin
    DoGetVioInfoByDrv(Params, AResponseInfo);
  end
  else if action = Uppercase('GetVioPicinfo') then //
  begin
    DoGetVioPic(Params, AResponseInfo);
  end
  else if action = Uppercase('GetVioInfoByVeh') then //
  begin
    DoGetVioInfoByVeh(Params, AResponseInfo);
  end
  else if action = Uppercase('WriteVio') then
  begin
    DoWriteVio(Params, AResponseInfo);
  end
  else if action = Uppercase('WriteVehicleInfo') then
  begin
    DoWriteVehicleInfo(Params, AResponseInfo);
  end
  // 六合一 查询
  else if action = 'QUERY' then
  begin
    DoQeury(Params, AResponseInfo);
  end
  // 六合一 写入
  else if action = 'WRITE' then
  begin
    DoWrite(Params, AResponseInfo);
  end
  // 集中指挥平台 查询
  else if rmweb.Contains(',' + action + ',') then
  begin
    DoRmweb(action, Params, AResponseInfo);
  end
  // 集中指挥平台 写入
  else if rminf.Contains(',' + action + ',') then
  begin
    DoRminf(action, Params, AResponseInfo);
  end;
  ActiveX.CoUninitialize;
end;

end.
