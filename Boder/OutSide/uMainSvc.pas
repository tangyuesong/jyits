unit uMainSvc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, IniFiles, uLogger, uCommon, DateUtils,
  IdContext, IdCustomHTTPServer,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdHTTPServer, Vcl.ExtCtrls,
  Generics.Collections, IOUtils, Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.OracleDef,
  FireDAC.Phys.Oracle, uSQLHelper, IdHeaderList;

type
  TBoderSvc = class(TService)
    IdHTTPServer1: TIdHTTPServer;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure IdHTTPServer1CreatePostStream(AContext: TIdContext;
      AHeaders: TIdHeaderList; var VPostStream: TStream);
  private
    FOraConn: TFDConnection;
    FIPs: string;
    function InsertToDB(cmd, body: string; stream: TStream): string;
    function GetResponse(sysid: string): string;
    function CheckIP(ip: string): boolean;
    procedure SQLError(const SQL, Description: string);
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  BoderSvc: TBoderSvc;

implementation

uses
  HttpApp;

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  BoderSvc.Controller(CtrlCode);
end;

function TBoderSvc.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TBoderSvc.ServiceStart(Sender: TService; var Started: Boolean);
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
  logger.Level := ini.ReadInteger('sys', 'logLevel', 2);

  IdHTTPServer1.Bindings.Clear;
  IdHTTPServer1.DefaultPort := ini.ReadInteger('sys', 'Port', 18088);
  IdHTTPServer1.Bindings.Add;
  IdHTTPServer1.Active := True;

  ini.Free;
end;

procedure TBoderSvc.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  IdHTTPServer1.Active := false;
  logger.Free;
end;

procedure TBoderSvc.SQLError(const SQL, Description: string);
begin
  logger.Error(description + SQL);
end;

procedure TBoderSvc.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  function FormatResponse(msg: String): String;
  begin
    Result := '{"head":{"code":"0","message":"' + msg + '"}';
  end;
var
  ip, action, params, id, response: string;
  stream: TStream;
begin
  ip := AContext.Connection.Socket.Binding.PeerIP;
  if not CheckIP(ip) then
  begin
    AResponseInfo.ContentText := FormatResponse('Invalid IP(ERROR: 60510)');
    logger.Warn('invalid ip: ' + ip);
    exit;
  end;
  AResponseInfo.ContentType := 'text/html';
  AResponseInfo.CharSet := 'utf-8';
  AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin', '*');
  action := ARequestInfo.Document.Substring(1);
  params := ARequestInfo.UnparsedParams;
  stream := ARequestInfo.PostStream;
  logger.Info('[' + ip + ']' + action + params);
  id := InsertToDB(action, params, stream);
  if id <> '' then
  begin
    response := GetResponse(id);
    if response <> '' then
      AResponseInfo.ContentText := response
    else
      AResponseInfo.ContentText := FormatResponse('Request Timeout(ERROR: 60511)');
  end
  else
    AResponseInfo.ContentText := FormatResponse('Request Failed(ERROR: 60512)');
end;

procedure TBoderSvc.IdHTTPServer1CreatePostStream(AContext: TIdContext;
  AHeaders: TIdHeaderList; var VPostStream: TStream);
begin
  VPostStream := TMemoryStream.Create;
end;

function TBoderSvc.CheckIP(ip: string): boolean;
begin
  result := FIPs.Contains(ip);
end;

function TBoderSvc.InsertToDB(cmd, body: string; stream: TStream): string;
var
  SQL, sysid: string;
  params: TFDParams;
begin
  result := '';
  sysid := TGuid.NewGuid.ToString;
  params := TFDParams.Create;
  params.Add('id', sysid);
  params.Add('cmd', cmd);
  if (stream = nil)and(body.Length<4000) then
  begin
    SQL := 'insert into T_IN(sysid, cmd, body)VALUES(:id,:cmd,:body)';
    params.Add('body', body);
  end
  else begin
    if stream = nil then
    begin
      stream := TStringStream.Create(body);
    end;
    stream.Position := 0;
    params.Add('text', '').LoadFromStream(stream, TFieldType.ftBlob);
    stream.Free;
    SQL := 'insert into T_IN(sysid, cmd, text)VALUES(:id,:cmd,:text)';
    logger.Debug('BLOB');
  end;
  if SQLHelper.ExecuteSql1(SQL, params) then
    result := sysid;
  params.Free;
end;

function TBoderSvc.GetResponse(sysid: string): string;
var
  SQL: string;
  time: Double;
  stream: TStringStream;
begin
  result := '';
  SQL := 'select BODY, TEXT from T_OUT where SYSID=''' + sysid + '''';
  time := now;
  while now - time < ClientTimeOut do
  begin
    Sleep(100);
    with SQLHelper.Query(SQL) do
    begin
      if not EOF then
      begin
        if not Fields[0].IsNull then
          result := Fields[0].AsString
        else if not Fields[1].IsNull then
        begin
          stream := TStringStream.Create;
          TBlobField(Fields[1]).SaveToStream(stream);
          result := stream.DataString;
          stream.Free;
        end;

        break;
      end;
      Close;
      Connection.Close;
      Connection.Free;
      Free;
    end;
  end;
end;

end.
