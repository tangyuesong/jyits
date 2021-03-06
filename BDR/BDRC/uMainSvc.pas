unit uMainSvc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, Vcl.ExtCtrls,IniFiles, DateUtils, IdContext,
  IdCustomHTTPServer, IdBaseComponent, IdComponent, IdCustomTCPServer, IdHTTPServer,
  IdHeaderList, Generics.Collections, IOUtils, Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.OracleDef,
  FireDAC.Phys.Oracle, uOraHelper, uLogger, uCommon, uEntity;

type
  TBDRCSvc = class(TService)
    IdHTTPServer1: TIdHTTPServer;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  private
    FIPs: string;
    function InsertToDB(request: TRequest): boolean;
    function GetResponse(sysid: string): TResponse;
    function CheckIP(ip: string): boolean;
    procedure SQLError(const SQL, Description: string);
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  BDRCSvc: TBDRCSvc;

implementation

uses
  HttpApp, uDM;

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  BDRCSvc.Controller(CtrlCode);
end;

function TBDRCSvc.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TBDRCSvc.ServiceStart(Sender: TService; var Started: Boolean);
var
  ini: TIniFile;
begin
  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'border.log');
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  logger.Level := ini.ReadInteger('sys', 'logLevel', 2);
  Application.CreateForm(TDM, DM);
  DM.OnError := self.SQLError;

  ClientTimeOut := ini.ReadInteger('sys', 'ClientTimeOut', 10) * OneSecond;
  FIPs := ini.ReadString('sys', 'IP', '');

  IdHTTPServer1.Bindings.Clear;
  IdHTTPServer1.DefaultPort := ini.ReadInteger('sys', 'Port', 18088);
  IdHTTPServer1.Bindings.Add;
  IdHTTPServer1.Active := True;

  ini.Free;
  logger.Info('Service Start');
end;

procedure TBDRCSvc.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  IdHTTPServer1.Active := false;
  logger.Info('Service Stop');
  logger.Free;
end;

procedure TBDRCSvc.SQLError(const SQL, Description: string);
begin
  logger.Error(description + SQL);
end;

procedure TBDRCSvc.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  function FormatResponse(msg: String): String;
  begin
    Result := '{"head":{"code":"0","message":"' + msg + '"}';
  end;
  function RemoveStr(str, subStr: string): string;
  var
    i, j: integer;
  begin
    result := str;
    i := str.ToUpper.IndexOf(subStr.ToUpper);
    if i >= 0 then
    begin
      j := i + length(subStr);
      if str[i] = '&' then
        i := i - 1
      else if str[j + 1] = '&' then
        j := j + 1;

      result := str.Substring(0, i) + str.Substring(j);
    end;
  end;
var
  ip, s: string;
  response: TResponse;
  request: TRequest;
  i, j: integer;
begin
  ip := AContext.Connection.Socket.Binding.PeerIP;
  if not CheckIP(ip) then
  begin
    AResponseInfo.ContentText := FormatResponse('Invalid IP(ERROR: 60510)');
    logger.Warn('invalid ip: ' + ip);
    exit;
  end;

  request.SYSID := TGuid.NewGuid.ToString;
  request.DOCUMENT := ARequestInfo.Document.Substring(1);
  request.PARAMS := ARequestInfo.UnparsedParams;
  request.POST_STREAM := ARequestInfo.PostStream;         // IdHTTPServer1CommandGet结束后，ARequestInfo.PostStream会自动释放
  request.HTTP_METHOD := Ord(ARequestInfo.CommandType);
  request.Header := ARequestInfo.RawHeaders.Text;
  request.IS_STREAM :=  request.PARAMS.ToUpper.Contains('ISSTREAM=1');
  request.AppName := ARequestInfo.Params.Values['appName'];
  if request.AppName = '' then
    request.AppName := 'DSJ'
  else
    request.PARAMS := RemoveStr(request.PARAMS, 'appName=' + request.AppName);

  if request.IS_STREAM then
  begin
    request.PARAMS := RemoveStr(request.PARAMS, 'ISSTREAM=1');
  end;

  logger.Debug('[' + ip + ']' + request.DOCUMENT + request.PARAMS);
  if InsertToDB(request) then
  begin
    response := GetResponse(request.SYSID);
    AResponseInfo.ContentType := response.CONTENT_TYPE;
    AResponseInfo.CharSet := response.CharSet;
    AResponseInfo.CustomHeaders.Text := response.CustomHeaders;
    AResponseInfo.FreeContentStream := true;
    if response.CONTENT_STREAM <> nil then
      AResponseInfo.ContentStream := response.CONTENT_STREAM
    else if response.CONTENT_TEXT <> '' then
      AResponseInfo.ContentText := response.CONTENT_TEXT
    else
      AResponseInfo.ContentText := FormatResponse('Request Timeout(ERROR: 60511)');
  end
  else
    AResponseInfo.ContentText := FormatResponse('Request Failed(ERROR: 60512)');
  logger.Debug('[' + ip + ']' + AResponseInfo.ContentText);
end;

function TBDRCSvc.CheckIP(ip: string): boolean;
begin
  result := (FIPs = '') or FIPs.Contains(ip);
end;

function TBDRCSvc.InsertToDB(request: TRequest): boolean;
var
  SQL: string;
  params: TFDParams;
  stream: TStream;
begin
  params := TFDParams.Create;
  params.Add('SYSID', request.SYSID);
  params.Add('DOCUMENT', request.DOCUMENT);
  params.Add('HTTP_METHOD', request.HTTP_METHOD);
  params.Add('APP_NAME', request.AppName);
  params.Add('HEADER', request.Header);
  if request.IS_STREAM then
    params.Add('IS_STREAM', 1)
  else
    params.Add('IS_STREAM', 0);
  if request.POST_STREAM = nil then
  begin
    if request.PARAMS.Length < 4000 then
    begin
      SQL := 'INSERT INTO T_REQUEST(SYSID,DOCUMENT,HTTP_METHOD,HEADER,PARAMS,IS_STREAM,APP_NAME)'
        + 'VALUES(:SYSID,:DOCUMENT,:HTTP_METHOD,:HEADER,:PARAMS,:IS_STREAM,:APP_NAME)';
      params.Add('PARAMS', request.PARAMS);
    end
    else begin
      SQL := 'INSERT INTO T_REQUEST(SYSID,DOCUMENT,HTTP_METHOD,HEADER,PARAMS_BLOB,IS_STREAM,APP_NAME)'
        + 'VALUES(:SYSID,:DOCUMENT,:HTTP_METHOD,:HEADER,:PARAMS_BLOB,:IS_STREAM,:APP_NAME)';
      stream := TStringStream.Create(request.PARAMS);
      stream.Position := 0;
      params.Add('PARAMS_BLOB', '').LoadFromStream(stream, TFieldType.ftBlob);
      stream.Free;
    end
  end
  else begin
    SQL := 'INSERT INTO T_REQUEST(SYSID,DOCUMENT,HTTP_METHOD,HEADER,PARAMS,POST_STREAM,IS_STREAM,APP_NAME)'
        + 'VALUES(:SYSID,:DOCUMENT,:HTTP_METHOD,:HEADER,:PARAMS,:POST_STREAM,:IS_STREAM,:APP_NAME)';
    params.Add('PARAMS', request.PARAMS);
    request.POST_STREAM.Position := 0;
    params.Add('POST_STREAM', '').LoadFromStream(request.POST_STREAM, TFieldType.ftBlob);
  end;
  result := DM.ExecuteSql1(SQL, params);
  params.Free;
end;

function TBDRCSvc.GetResponse(sysid: string): TResponse;
var
  SQL: string;
  time: Double;
  stream: TStream;
begin
  result.CONTENT_TEXT := '';
  result.CONTENT_STREAM := nil;
  SQL := 'SELECT CONTENT_TEXT,CONTENT_TEXT_BLOB,CONTENT_STREAM,CONTENT_TYPE,CHARSET,CUSTOMHEADERS '
    + 'FROM T_RESPONSE WHERE SYSID=''' + sysid + '''';
  time := now;
  while now - time < ClientTimeOut do
  begin
    Sleep(100);
    with DM.Query(SQL) do
    begin
      if not EOF then
      begin
        if not Fields[0].IsNull then
          result.CONTENT_TEXT := Fields[0].AsString
        else if not Fields[1].IsNull then
        begin
          stream := TStringStream.Create;
          TBlobField(Fields[1]).SaveToStream(stream);
          result.CONTENT_TEXT := TStringStream(stream).DataString;
          stream.Free;
        end;
        if not Fields[2].IsNull then
        begin
          result.CONTENT_STREAM := TMemoryStream.Create;
          TBlobField(Fields[2]).SaveToStream(result.CONTENT_STREAM);
        end;

        result.CONTENT_TYPE := Fields[3].AsString;
        result.CharSet := Fields[4].AsString;
        result.CustomHeaders := Fields[5].AsString;
      end;

      Close;
      Connection.Close;
      Connection.Free;
      Free;
    end;
    if (result.CONTENT_TEXT<>'') or (result.CONTENT_STREAM <> nil) then
    begin
      DM.ExecuteSql('DELETE FROM T_RESPONSE WHERE SYSID=''' + sysid + '''');
      break;
    end;
  end;
end;

end.
