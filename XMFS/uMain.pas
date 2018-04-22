unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, IniFiles, uLogger, SyncObjs, IOUtils,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer, DateUtils,
  IdHTTPServer, IdContext, Types;

type
  TItsXmfsService = class(TService)
    IdHTTPServerIn: TIdHTTPServer;
    IdHTTPServerOut: TIdHTTPServer;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure IdHTTPServerInCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure IdHTTPServerOutCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  private
    cs: TCriticalSection;
    logger: TLogger;
    FLastGetPassTime: Double;
    FDataStream: TMemoryStream;
    ipList: string;
    procedure CacheToFile;
    function GetHis: TMemoryStream;
    function CheckIP(ip: string): boolean;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ItsXmfsService: TItsXmfsService;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ItsXmfsService.Controller(CtrlCode);
end;

function TItsXmfsService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TItsXmfsService.CacheToFile;
var
  filename: string;
begin
  filename := ExtractFilePath(ParamStr(0)) + 'data';
  if not TDirectory.Exists(filename) then
    TDirectory.CreateDirectory(filename);
  filename := filename + '\' + TGuid.NewGuid.ToString;
  FDataStream.SaveToFile(filename);
  FDataStream.Clear;
  logger.Warn('Cache to file: ' + filename);
end;

function TItsXmfsService.GetHis: TMemoryStream;
var
  path: string;
  files: TStringDynArray;
begin
  result := nil;
  path := ExtractFilePath(ParamStr(0)) + 'data';
  if TDirectory.Exists(path) then
  begin
    files := TDirectory.GetFiles(path);
    if Length(files) > 0 then
    begin
      result := TMemoryStream.Create;
      result.LoadFromFile(files[0]);
      TFile.Delete(files[0]);
    end;
  end;
end;

procedure TItsXmfsService.IdHTTPServerInCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  action, ip: string;
  stream: TMemoryStream;
  b: boolean;
begin
  action := ARequestInfo.Document.Substring(1);
  ip := AContext.Connection.Socket.Binding.PeerIP;
  logger.logging('[' + ip + ']' + action, 2);
  b := CheckIP(ip);
  if b and (UpperCase(action) = 'POSTPASS') then
  begin
    cs.Enter;
    try
      stream := ARequestInfo.PostStream as TMemoryStream;
      FDataStream.Seek(0, TSeekOrigin.soEnd);
      FDataStream.WriteBuffer(stream.Memory^, stream.Size);
      if (FDataStream.Size > 1024 * 1024 * 16) or (Now - FLastGetPassTime > 10 * OneMinute ) then
      begin
        CacheToFile;
        FLastGetPassTime := now;
      end;
      cs.Leave;
      AResponseInfo.ContentText := 'OK';
    except
      on e: Exception do
      begin
        cs.Leave;
        logger.Error(e.Message);
      end;
    end;
  end
  else begin
	logger.Warn('Invalid IP Or Action！')
  end;
end;

procedure TItsXmfsService.IdHTTPServerOutCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  action, ip: string;
  tmp: TMemoryStream;
  b: boolean;
begin
  action := ARequestInfo.Document.Substring(1);
  ip := AContext.Connection.Socket.Binding.PeerIP;
  logger.logging('[' + ip + ']' + action, 2);
  b := CheckIP(ip);
  if b and (UpperCase(action) = 'GETPASS') then
  begin
    FLastGetPassTime := now;
    if FDataStream.Size > 0 then
    begin
      cs.Enter;
      tmp := FDataStream;
      FDataStream := TMemoryStream.Create;
      cs.Leave;
      try
        AResponseInfo.ContentStream := tmp;
      except
        on e: Exception do
          logger.Error(e.Message);
      end;
    end;
  end
  else if b and (UpperCase(action) = 'GETPASSHIS') then
  begin
    tmp := GetHis;
    if tmp <> nil then
      AResponseInfo.ContentStream := tmp;
  end
  else begin
	logger.Warn('Invalid IP Or Action！')
  end;
end;

procedure TItsXmfsService.ServiceStart(Sender: TService; var Started: Boolean);
var
  ini: TIniFile;
  path: string;
begin
  path := ExtractFilePath(ParamStr(0));
  if not DirectoryExists(path + 'log') then CreateDir(path + 'log');
  logger := TLogger.Create(path + 'log\XMFS.log');
  ini := TIniFile.Create(path + 'config.ini');
  ipList := ini.ReadString('sys','ip','127.0.0.1');
  IdHTTPServerIn.DefaultPort := ini.ReadInteger('HTTP', 'PORT_IN', 8008);
  IdHTTPServerOut.DefaultPort := ini.ReadInteger('HTTP', 'PORT_Out', 8009);
  ini.Free;
  FDataStream := TMemoryStream.Create;
  FLastGetPassTime := now;
  cs := TCriticalSection.Create;

  try
    IdHTTPServerIn.Active := True;
    IdHTTPServerOut.Active := True;
    logger.logging('XMFS start ok', 2);
  except
    on e: Exception do
    begin
      logger.logging(e.Message, 4);
      Started := false;
    end;
  end;
end;

procedure TItsXmfsService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  idHttpServerIn.Active := false;
  if FDataStream.Size > 0 then
  begin
    Sleep(10000);
  end;
  idHttpServerOut.Active := false;
  if FDataStream.Size > 0 then
  begin
    CacheToFile;
  end;
  FDataStream.Free;
  cs.Free;
  logger.Info('XMFS stoped');
  logger.Free;
end;

function TItsXmfsService.CheckIP(ip: string): boolean;
begin
  result := ipList.Contains(ip);
end;

end.
