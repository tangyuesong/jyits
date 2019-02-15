unit uServiceMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, IdTCPConnection,
  IdTCPClient, IdHTTP, Vcl.ExtCtrls, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, IdContext, IDURI,
  IdHeaderList, QJson, StrUtils, HttpApp, DateUtils, FireDAC.Phys.OracleDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle, uHikJZF;

type
  TItsQTZ3Service = class(TService)
    httpServer: TIdHTTPServer;
    Timer1: TTimer;
    httpClient: TIdHTTP;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure Timer1Timer(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure httpServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure httpServerCreatePostStream(AContext: TIdContext;
      AHeaders: TIdHeaderList; var VPostStream: TStream);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceBeforeInstall(Sender: TService);
    procedure ServiceBeforeUninstall(Sender: TService);
  private
    procedure DoHttpRequest(action, tokenKey: String; params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ItsQTZ3Service: TItsQTZ3Service;

implementation

uses
  uCommon, uGlobal, uRmService, uDbService, uSPService, uHuiZhouKaoHe;

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ItsQTZ3Service.Controller(CtrlCode);
end;

function TItsQTZ3Service.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TItsQTZ3Service.httpServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  action, token, valid: String;
  params: TStrings;
  i: integer;
  clientIP, s, yhbh: String;
  json: TQJson;
  isExport: Boolean;
begin
  action := UpperCase(ARequestInfo.Document);
  isExport := LeftStr(action, 8) = '/EXPORT/';
  while pos('/', action) > 0 do
    action := copy(action, pos('/', action) + 1, 100);
  clientIP := Trim(AContext.Connection.Socket.Binding.PeerIP);

  // s := ARequestInfo.UnparsedParams;
  s := TIDURI.URLDecode(ARequestInfo.UnparsedParams);

  AResponseInfo.ContentType := 'text/html';
  AResponseInfo.CharSet := 'utf-8';
  AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin', '*');
  AResponseInfo.ContentText := '';
  token := '';

  params := TStringList.Create;
  params.Delimiter := '&';
  params.StrictDelimiter := True;
  try
    if UpperCase(ARequestInfo.Command) = 'POST' then
    begin
      if (s = '') and (ARequestInfo.PostStream <> nil) then
        s := TIDURI.URLDecode(TStringStream(ARequestInfo.PostStream)
          .DataString);
      if s = '' then
      begin
        gLogger.Error('PostStream is nil');
        exit;
      end;
      json := TQJson.Create;
      try
        json.Parse(s);
        for i := 0 to json.Count - 1 do
          params.Add(json.Items[i].Name + '=' + json.Items[i].Value);
      except
        on e: Exception do
        begin
          gLogger.Error('[' + clientIP + ']' + ARequestInfo.Document + ' error '
            + e.Message);
          AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
            (e.Message);
          params.Free;
          json.Free;
          exit;
        end;
      end;
      json.Free;
    end
    else
      params.DelimitedText := s;

    for i := params.Count - 1 downto 0 do
    begin
      if UpperCase(params.Names[i]) = 'TOKEN' then
      begin
        // token := TIdURI.URLDecode(params.ValueFromIndex[i]);
        // token := HttpDecode(params.ValueFromIndex[i]);
        token := params.ValueFromIndex[i];
        params.Delete(i);
        continue;
      end;
      // if UpperCase(ARequestInfo.Command) <> 'POST' then
      // params[i] := HttpDecode(params[i]);
    end;

    if UpperCase(ARequestInfo.Command) = 'POST' then
      gLogger.Info('[' + clientIP + ']' + ARequestInfo.Document)
    else if (action = 'LOGIN') or (action = 'WXLOGIN') then // 不在日志中写密码
      gLogger.Info('[' + clientIP + ']' + ARequestInfo.Document + '?' +
        params.Values['user'])
    else
      gLogger.Info('[' + clientIP + ']' + ARequestInfo.Document + '?' +
        params.DelimitedText);

    if action = 'GETSERVERDATETIME' then
    begin
      AResponseInfo.ContentText :=
        IntToStr(DateUtils.MilliSecondsBetween(Now, 25569.3333333333));;
    end
    else if action = 'LOGIN' then
    begin
      AResponseInfo.ContentText := TCommon.Login(clientIP, params, valid);
    end
    else if action = 'WXLOGIN' then
    begin
      AResponseInfo.ContentText := TCommon.Login(clientIP, params, valid, True);
    end
    else
    begin
      if not gTokenManager.CheckToken(token, clientIP) then
      begin
        gLogger.Error('[' + clientIP + ']' + ARequestInfo.Document +
          ' invalid token');
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('invalid token');
        yhbh := '';
        valid := '0';
      end
      else
      begin
        yhbh := gTokenManager.GetToken(token).Login;
        DoHttpRequest(action, token, params, isExport, AResponseInfo);
        valid := '1';
      end;
    end;
  except
    on e: Exception do
    begin
      gLogger.Error('[' + clientIP + ']' + ARequestInfo.Document + ' error ' +
        e.Message);
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(e.Message);
    end;
  end;
  if (action = 'LOGIN') or (action = 'WXLOGIN') then
    TCommon.SaveQtzLog(token, yhbh, clientIP, ARequestInfo.Document,
      params.Values['user'], valid, AResponseInfo.ContentText,
      params.Values['id'])
  else if (TCommon.SaUsers.IndexOf(yhbh) < 0) then
  // 后台访问的日志太多，不用记录, post数据太长，去掉参数
  begin
    if UpperCase(ARequestInfo.Command) = 'POST' then
      s := ''
    else
      s := params.DelimitedText;
    TCommon.SaveQtzLog(token, yhbh, clientIP, ARequestInfo.Document, s, valid,
      AResponseInfo.ContentText);
  end;
  gLogger.Info('[' + clientIP + ']' + ARequestInfo.Document + ' OK');
  params.Free;
end;

procedure TItsQTZ3Service.httpServerCreatePostStream(AContext: TIdContext;
  AHeaders: TIdHeaderList; var VPostStream: TStream);
begin
  VPostStream := TStringStream.Create;
end;

procedure TItsQTZ3Service.DoHttpRequest(action, tokenKey: String;
  params: TStrings; isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
begin
  if TDBService.Actions.ContainsKey(action) then
    TDBService.DoDB(action, tokenKey, params, isExport, AResponseInfo)
  else if TSpService.Actions.Contains(',' + action + ',') then
    TSpService.DoSP(action, tokenKey, params, isExport, AResponseInfo)
  else if THikJZFService.Actions.Contains(',' + action + ',') then
    THikJZFService.DoJZF(action, tokenKey, params, AResponseInfo)
  else
    TRMService.DoRM(action, tokenKey, params, isExport, AResponseInfo);
  if (AResponseInfo.ContentText = '') and (AResponseInfo.ContentStream = nil)
  then
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('action is not exists');
end;

procedure TItsQTZ3Service.ServiceCreate(Sender: TObject);
begin
  // ReportMemoryLeaksOnShutdown := true;
end;

procedure TItsQTZ3Service.ServiceStart(Sender: TService; var Started: Boolean);
begin
  TCommon.ProgramInit;
  //THuiZhouKaoHe.Init;
  httpServer.Bindings.Clear;
  httpServer.DefaultPort := gConfig.HttpServerPort;
  httpServer.Active := True;
  Timer1.Interval := gConfig.HeartbeatInterval * 60000;
  Timer1Timer(nil);
  Timer1.Enabled := True;
  gLogger.logging('Service Started', 2);
end;

procedure TItsQTZ3Service.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Timer1.Enabled := False;
  gLogger.logging('Service Stoped', 2);
  TCommon.ProgramDestroy;
end;

procedure TItsQTZ3Service.Timer1Timer(Sender: TObject);
var
  response: TStringStream;
  requestStream: TStringStream;
begin
  response := TStringStream.Create('');
  requestStream := TStringStream.Create('');
  requestStream.WriteString('ServiceName=' + self.Name);
  try
    httpClient.Post(gConfig.HeartbeatUrl + 'ServiceHeartbeat', requestStream,
      response);
  except
  end;
  requestStream.Free;
  response.Free;
end;

procedure TItsQTZ3Service.ServiceBeforeInstall(Sender: TService);
begin
  self.Name := ServiceName;
  self.DisplayName := DisplayName;
end;

procedure TItsQTZ3Service.ServiceBeforeUninstall(Sender: TService);
begin
  self.Name := ServiceName;
end;

end.
