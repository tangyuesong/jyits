unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdContext, IdCustomHTTPServer, IniFiles,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdCustomTCPServer, IdHTTPServer,
  uCommon, uLogger, uSQLHelper, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, DateUtils, FireDAC.Phys.OracleDef,
  FireDAC.Phys.Oracle, FireDAC.Stan.Param, uEntity, IdHeaderList;

type
  TForm1 = class(TForm)
    IdHTTPServer1: TIdHTTPServer;
    Memo1: TMemo;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure FormCreate(Sender: TObject);
    procedure IdHTTPServer1CreatePostStream(AContext: TIdContext;
      AHeaders: TIdHeaderList; var VPostStream: TStream);
  private
    FOraConn: TFDConnection;
    FIPs: string;
    procedure ServiceStart;
    procedure ServiceStop;
    procedure SQLError(const SQL, Description: string);
    function CheckIP(ip: string): boolean;
    function GetResponse(sysid: string): TResponse;
    function InsertToDB(request: TRequest): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  function FormatResponse(msg: String): String;
  begin
    Result := '{"head":{"code":"0","message":"' + msg + '"}';
  end;
var
  ip, action, params, id: string;
  stream: TStream;
  response: TResponse;
  request: TRequest;
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
  request.POST_STREAM := ARequestInfo.PostStream;
  request.HTTP_METHOD := Ord(ARequestInfo.CommandType);
  request.IS_STREAM :=  request.PARAMS.ToUpper.Contains('ISSTREAM=1');
  request.PARAMS := request.PARAMS.replace('isstream=1','');

  logger.Info('[' + ip + ']' + request.DOCUMENT + request.PARAMS);
  if InsertToDB(request) then
  begin
    response := GetResponse(request.SYSID);
    AResponseInfo.ContentType := response.CONTENT_TYPE;
    AResponseInfo.CharSet := response.CharSet;
    AResponseInfo.CustomHeaders.Text := response.CustomHeaders;
    if response.CONTENT_STREAM <> nil then
      AResponseInfo.ContentStream := response.CONTENT_STREAM
    else if response.CONTENT_TEXT <> '' then
      AResponseInfo.ContentText := response.CONTENT_TEXT
    else
      AResponseInfo.ContentText := FormatResponse('Request Timeout(ERROR: 60511)');
  end
  else
    AResponseInfo.ContentText := FormatResponse('Request Failed(ERROR: 60512)');
end;

procedure TForm1.IdHTTPServer1CreatePostStream(AContext: TIdContext;
  AHeaders: TIdHeaderList; var VPostStream: TStream);
begin
VPostStream := TMemoryStream.Create;
end;

procedure TForm1.ServiceStart;
var
  ini: TIniFile;
  oraHost, oraPort, oraSID, oraUser, oraPwd: string;
begin
  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'border.log');
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  oraHost := ini.ReadString('ORA', 'Host', '');
  oraPort := ini.ReadString('ORA', 'Port', '');
  oraSID := ini.ReadString('ORA', 'SID', '');
  oraUser := ini.ReadString('ORA', 'User', '');
  oraPwd := ini.ReadString('ORA', 'Pwd', '');
  FOraConn := TFDConnection.Create(nil);
  FOraConn.FetchOptions.Mode := fmAll;
  FOraConn.Params.Add('DriverID=Ora');
  FOraConn.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [oraHost, oraPort, oraSID]));
  FOraConn.Params.Add(Format('User_Name=%s', [oraUser]));
  FOraConn.Params.Add(Format('Password=%s', [oraPwd]));
  FOraConn.Params.Add('CharacterSet=UTF8'); // ∑Ò‘Ú÷–Œƒ¬“¬Î
  FOraConn.LoginPrompt := false;
  SQLHelper := TSQLHelper.Create;
  SQLHelper.Connection := FOraConn;
  SQLHelper.OnError := self.SQLError;

  ClientTimeOut := ini.ReadInteger('sys', 'ClientTimeOut', 10) * OneSecond;
  FIPs := ini.ReadString('sys', 'IP', '');

  IdHTTPServer1.Bindings.Clear;
  IdHTTPServer1.DefaultPort := ini.ReadInteger('sys', 'Port', 18088);
  IdHTTPServer1.Bindings.Add;
  IdHTTPServer1.Active := True;

  ini.Free;
end;

procedure TForm1.ServiceStop;
begin
  IdHTTPServer1.Active := false;
  logger.Free;
end;

procedure TForm1.SQLError(const SQL, Description: string);
begin
  logger.Error(description + SQL);
end;

function TForm1.CheckIP(ip: string): boolean;
begin
  result := (FIPs = '') or FIPs.Contains(ip);
end;

function TForm1.InsertToDB(request: TRequest): boolean;
var
  SQL: string;
  params: TFDParams;
  stream: TStream;
begin
  params := TFDParams.Create;
  params.Add('SYSID', request.SYSID);
  params.Add('DOCUMENT', request.DOCUMENT);
  params.Add('HTTP_METHOD', request.HTTP_METHOD);
  if request.IS_STREAM then
    params.Add('IS_STREAM', 1)
  else
    params.Add('IS_STREAM', 0);
  if request.POST_STREAM = nil then
  begin
    if request.PARAMS.Length < 4000 then
    begin
      SQL := 'INSERT INTO T_REQUEST(SYSID,DOCUMENT,HTTP_METHOD,PARAMS,IS_STREAM)'
        + 'VALUES(:SYSID,:DOCUMENT,:HTTP_METHOD,:PARAMS,:IS_STREAM)';
      params.Add('PARAMS', request.PARAMS);
    end
    else begin
      SQL := 'INSERT INTO T_REQUEST(SYSID,DOCUMENT,HTTP_METHOD,PARAMS_BLOB,IS_STREAM)'
        + 'VALUES(:SYSID,:DOCUMENT,:HTTP_METHOD,:PARAMS_BLOB,:IS_STREAM)';
      stream := TStringStream.Create(request.PARAMS);
      stream.Position := 0;
      params.Add('PARAMS_BLOB', '').LoadFromStream(stream, TFieldType.ftBlob);
      stream.Free;
    end
  end
  else begin
    SQL := 'INSERT INTO T_REQUEST(SYSID,DOCUMENT,HTTP_METHOD,PARAMS,POST_STREAM,IS_STREAM)'
        + 'VALUES(:SYSID,:DOCUMENT,:HTTP_METHOD,:PARAMS,:POST_STREAM,:IS_STREAM)';
    params.Add('PARAMS', request.PARAMS);
    request.POST_STREAM.Position := 0;
    params.Add('POST_STREAM', '').LoadFromStream(request.POST_STREAM, TFieldType.ftBlob);
    //request.POST_STREAM.Free;
  end;
  result := SQLHelper.ExecuteSql1(SQL, params);
  params.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ServiceStart;
end;

function TForm1.GetResponse(sysid: string): TResponse;
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
    with SQLHelper.Query(SQL) do
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
      if (result.CONTENT_TEXT<>'') or (result.CONTENT_STREAM <> nil) then
        break;
    end;
  end;
end;

end.
