unit uRmService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IniFiles, IdContext, uLogger, HTTPApp, uTmri, uRmweb,
  uRminf, uTrans, ActiveX, Soap.EncdDecd, IdURI, IdHttp,
  IdSSLOpenSSL, uTokenManager, uGlobal, uSpecialItf, ucommon;

type

  TRmService = class
  private
    IdHTTPServer1: TIdHTTPServer;
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure DoGetVehInfo(token: TToken; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure DoRminf(action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure DoRmweb(action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure DoWriteVehicleInfo(Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    function DoQeury(token: TToken; Params: TStrings): String;
    procedure DoWrite(token: TToken; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    function ParamsToJson(Params: TStrings; exceptName: string = ''): string;
  public
    constructor Create;
    destructor Destroy; override;
    function GetVehInfo(token: TToken; hphm, hpzl: String): String;
  end;

var
  RmService: TRmService;

implementation

constructor TRmService.Create;
var
  ini: TIniFile;
  port: integer;
  IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
begin
  inherited;
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
  port := ini.ReadInteger('Http', 'Port', 10088);
  ini.Free;

  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'log\rm.log');
  logger.Info('RM started');
  IdHTTPServer1 := TIdHTTPServer.Create(nil);
  IdHTTPServer1.OnCommandGet := self.IdHTTPServer1CommandGet;
  IdHTTPServer1.Bindings.Clear;
  IdHTTPServer1.DefaultPort := port;
  IdHTTPServer1.Active := True;
end;

destructor TRmService.Destroy;
begin
  inherited;
  IdHTTPServer1.Active := false;
  IdHTTPServer1.Free;
  logger.Info('RM stoped');
  logger.Free;
end;

function TRmService.ParamsToJson(Params: TStrings;
  exceptName: string = ''): string;
var
  first: Boolean;
  i: integer;
begin
  first := True;
  result := '{';
  exceptName := exceptName.ToLower;
  for i := 0 to Params.Count - 1 do
  begin
    if (not exceptName.Contains(',' + Params.Names[i].ToLower + ',')) and
      (Params.Names[i] <> '') and (Params.ValueFromIndex[i] <> '') then
    begin
      if first then
      begin
        result := result + '"' + Params.Names[i].ToLower + '":"' +
          Params.ValueFromIndex[i] + '"';
        first := false;
      end
      else
        result := result + ',"' + Params.Names[i].ToLower + '":"' +
          Params.ValueFromIndex[i] + '"';
    end;
  end;
  result := result + '}';
end;

procedure TRmService.DoGetVehInfo(token: TToken; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
begin
  AResponseInfo.ContentText := GetVehInfo(token, Params.Values['hphm'],
    Params.Values['hpzl']);
end;

procedure TRmService.DoWriteVehicleInfo(Params: TStrings;
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
    hphm := Params.Values['hphm'];
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
      logger.Error(e.Message);
  end;
end;

function TRmService.GetVehInfo(token: TToken; hphm, hpzl: String): String;
var
  sf: string;
  Params: TStrings;
begin
  result := '';
  Params := TStringList.Create;
  try
    sf := copy(hphm, 1, 1);
    Params.Add('hphm=' + copy(hphm, 2, 100));
    Params.Add('hpzl=' + hpzl);
    if sf = '粤' then
      Params.Add('JKID=01C21')
    else
    begin
      Params.Add('sf=' + sf);
      Params.Add('JKID=01C49');
    end;
    result := DoQeury(token, Params);
  except
    on e: Exception do
      gLogger.Error(e.Message);
  end;
  Params.Free;
end;

procedure TRmService.DoRmweb(action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  action := LowerCase(action);
  json := ParamsToJson(Params);

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

procedure TRmService.DoRminf(action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  action := LowerCase(action);
  json := ParamsToJson(Params);

  if Params.Values['zpstr1'] <> '' then
  begin
    TCommon.Base64ToFile(Params.Values['zpstr1'], 'd:\a.jpg');
    Params.SaveToFile('d:\b.txt');
  end;

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

function TRmService.DoQeury(token: TToken; Params: TStrings): String;
var
  json: string;
  tmriParam: TTmriParam;
begin
  tmriParam := TCommon.GetTmriParam(Params.Values['JKID'], token);
  json := ParamsToJson(Params, ',JKID,');
  json := TTmri.Query(tmriParam, json);
  result := json;
end;

procedure TRmService.DoWrite(token: TToken; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
  tmriParam: TTmriParam;
begin
  tmriParam := TCommon.GetTmriParam(Params.Values['JKID'], token);
  json := ParamsToJson(Params, ',JKID,');
  json := TTmri.Write(tmriParam, json);
  AResponseInfo.ContentText := json;
end;

procedure TRmService.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
const
  rmweb = ',QVEHBUS,QSTATION,QSTATIONRELATION,QSTATIONPERSON,FEEDBACK,FEEDBACKPIC,VEHCHECK,';
  rminf = ',SURSCREEN,SUREXAMINE,FLOWEQUIP,WEATHER,INCIDENT,INDUCEMENT,CAR,POLICE,PARK,';
var
  Params: TStrings;
  action, tokenStr, IP: string;
  wsbh, wslb, num: string;
  tmriParam: TTmriParam;
  token: TToken;
  i: integer;
begin
  ActiveX.CoInitialize(nil);
  action := UpperCase(ARequestInfo.Document.Substring(1));
  IP := Trim(AContext.Connection.Socket.Binding.PeerIP);
  tokenStr := '';

  if action <> UpperCase('WriteVehicleInfo') then // 太多无意义的日志
  begin
    logger.logging('[' + IP + ']' + action + '/' + ARequestInfo.Params.Text, 2);
  end;
  AResponseInfo.ContentType := 'text/html';
  AResponseInfo.CharSet := 'utf-8';

  Params := TStringList.Create;
  Params.Delimiter := '&';
  Params.DelimitedText := Utf8Decode(ARequestInfo.UnparsedParams);

  for i := Params.Count - 1 downto 0 do
  begin
    if UpperCase(Params.Names[i]) = 'TOKEN' then
    begin
      tokenStr := TIdURI.URLDecode(Params.ValueFromIndex[i]);
      Params.Delete(i);
      continue;
    end;
    Params[i] := TIdURI.URLDecode(Params[i]);
  end;

  if UpperCase(action) = UpperCase('Login') then
    AResponseInfo.ContentText := TSpecialItf.Login(IP, Params)
  else
  begin
    if gServiceIp.IndexOf(IP) >= 0 then
    begin
      token := gTokenManager.NewToken('sa', IP);
    end
    else
    begin
      if not gTokenManager.CheckToken(tokenStr, IP) then
      begin
        logger.logging('[' + IP + ']' + action + ' invalid token,' +
          tokenStr, 4);
        AResponseInfo.ContentText := 'invalid token';
        exit;
      end;
      token := gTokenManager.GetToken(tokenStr);
    end;

    if action = UpperCase('GetVehInfo') then
    begin
      DoGetVehInfo(token, Params, AResponseInfo);
    end
    else if action = UpperCase('GetDrvInfo') then
    begin
      Params.Add('JKID=02C06');
      AResponseInfo.ContentText := DoQeury(token, Params);
    end
    else if action = UpperCase('GetVioInfoByDrv') then
    begin
      Params.Add('JKID=04C01');
      AResponseInfo.ContentText := DoQeury(token, Params);
    end
    else if action = UpperCase('GetVioPicinfo') then
    begin
      Params.Add('JKID=04C04');
      AResponseInfo.ContentText := DoQeury(token, Params);
    end
    else if action = UpperCase('GetVioInfoByVeh') then
    begin
      Params.Add('JKID=04C03');
      AResponseInfo.ContentText := DoQeury(token, Params);
    end
    else if action = UpperCase('WriteVehicleInfo') then
    begin
      DoWriteVehicleInfo(Params, AResponseInfo);
    end
    // 六合一 查询
    else if action = 'QUERY' then
    begin
      AResponseInfo.ContentText := DoQeury(token, Params);
    end
    // 六合一 写入
    else if action = 'WRITE' then
    begin
      DoWrite(token, Params, AResponseInfo);
    end
    // 集中指挥平台 查询
    else if rmweb.Contains(action) then
    begin
      DoRmweb(action, Params, AResponseInfo);
    end
    // 集中指挥平台 写入
    else if rminf.Contains(action) then
    begin
      DoRminf(action, Params, AResponseInfo);
    end

    // 文书管理 begin
    else if action = 'APPLYWSBH' then
    begin
      wslb := ARequestInfo.Params.Values['wslb'];
      num := ARequestInfo.Params.Values['num'];
      AResponseInfo.ContentText := gWSManager.Apply(token.Login, wslb,
        strtointdef(num, 0));
    end
    else if action = 'SUBMITWSBH' then
    begin
      wsbh := ARequestInfo.Params.Values['wsbh'];
      if gWSManager.Submit(wsbh) then
        AResponseInfo.ContentText := 'true'
      else
        AResponseInfo.ContentText := 'false';
    end
    else if action = 'ROLLBACKWSBH' then
    begin
      wsbh := ARequestInfo.Params.Values['wsbh'];
      if gWSManager.Rollback(wsbh) then
        AResponseInfo.ContentText := 'true'
      else
        AResponseInfo.ContentText := 'false';
    end
    // 文书管理 end
    else
      AResponseInfo.ContentText := 'Hello Word!';
    if token.Login <> 'sa' then
      TSpecialItf.SaveQtzLog(tokenStr, token.Login, IP, action,
        Params.DelimitedText);
  end;
  if action <> UpperCase('WriteVehicleInfo') then // 太多无意义的日志
  begin
    logger.logging('[' + IP + ']' + action + ' OK', 2);
  end;
  Params.Free;
end;

end.
