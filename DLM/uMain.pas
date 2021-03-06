unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, IniFiles, IOUtils, IdBaseComponent,
  IdComponent, IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, uLogger,
  IdContext, IdHTTP, Generics.Collections, HTTPAPP, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.Threading,
  System.Generics.Collections;

type
  TParam = Record
    Url: string;
    Path: string;
  end;

  TsvcDLM = class(TService)
    IdHTTPServer1: TIdHTTPServer;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  private
    FQueue: TQueue<TParam>;
    FCount: integer;
    FIPMap: TDictionary<string, string>;
    function DownLoad: boolean;
    function ConvertUrl(url: string): string;
    function LoadIpMap: boolean;
  public
    function GetServiceController: TServiceController; override;
  end;

var
  svcDLM: TsvcDLM;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  svcDLM.Controller(CtrlCode);
end;

function TsvcDLM.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

function TsvcDLM.ConvertUrl(url: string): string;
var
  ss: TArray<string>;
  ipPort: string;
begin
  result := '';
  ss := url.Split(['/']);
  if Length(ss)>=4 then
  begin
    ipPort := ss[2];
    if FIpMap.ContainsKey(ipPort) then
      result := url.Replace(ipPort, FIpMap[ipPort])
    else
      result := url;
  end;
end;

function TsvcDLM.DownLoad: boolean;
var
  http: TNetHttpClient;
  stream: TMemoryStream;
  s: string;
  param: TParam;
begin
  result := false;
  param := FQueue.Peek;
  s := TPath.GetDirectoryName(param.Path);
  if not TDirectory.Exists(s) then
    TDirectory.CreateDirectory(s);

  http := TNetHttpClient.Create(nil);
  stream := TMemoryStream.Create;
  try
    logger.Debug('DownLoad:' + param.url);
    http.Get(param.url, stream);
    logger.Debug('DownLoad OK: ' + stream.Size.ToString);
    if stream.Size > 100 * 1024 then
    begin;
      stream.SaveToFile(param.path);
      logger.Debug('SaveToFile OK: ' + param.path);
    end;
    result := true;
  except
    on e: exception do
      logger.Error(e.Message + param.url + param.path);
  end;
  stream.Free;
  http.Free;
  Dec(FCount);
end;

procedure TsvcDLM.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  action, ip, newUrl: string;
  Params: TStringList;
  i: integer;
  param: TParam;
begin
  Inc(FCount);
  if FCount mod 10 = 0 then
    logger.Info('RequestCount: ' + FCount.ToString);
  action := UpperCase(ARequestInfo.Document.Substring(1));
  ip := Trim(AContext.Connection.Socket.Binding.PeerIP);

  Params := TStringList.Create;
  Params.Delimiter := '&';
  Params.DelimitedText := ARequestInfo.UnparsedParams;
  for i := Params.Count - 1 downto 0 do
  begin
    Params[i] := HTTPDecode(Params[i]);
  end;
  param.Url := Params.Values['src'];
  param.Path := Params.Values['tgt'];
  Params.Free;
  if (action = 'DOWNLOAD') and (param.url.StartsWith('http')) and (param.path <> '') then
  begin
    newUrl := ConvertUrl(param.url);
    logger.Debug(newUrl + ' ' + param.url);
    if newUrl <> '' then
    begin
      param.Url := newUrl;
      FQueue.Enqueue(param);
      TTask.Create(procedure
        begin
          DownLoad;
        end
      ).Start;
      AResponseInfo.ContentText := '1: ' + param.url;
    end
    else begin
      AResponseInfo.ContentText := '2: ' + param.url;
      logger.Warn('Url invalid��' + param.url);
      Dec(FCount);
    end;
  end
  else begin
    AResponseInfo.ContentText := '3: ' + param.url;
    logger.Warn('invalid request: ' + action + ' ' + param.url + ' ' + param.path);
    Dec(FCount);
  end;
end;

function TsvcDLM.LoadIpMap: boolean;
var
  iniFile, s, key, value: string;
  ss: TArray<string>;
begin
  result := false;
  FIpMap := TDictionary<string, string>.Create;
  iniFile := TPath.GetDirectoryName(ParamStr(0)) + '\IPMAP.ini';
  if TFile.Exists(iniFile) then
  begin
    for s in TFile.ReadAllLines(iniFile) do
    begin
      ss := s.Split([#9]);
      if Length(ss) = 4 then
      begin
        key := ss[0] + ':' + ss[1];
        value := ss[2] + ':' + ss[3];
        if not FIpMap.ContainsKey(key) then
          FIpMap.Add(key, value)
        else begin
          logger.Warn('Duplicate Item: ' + key);
          exit;
        end;
      end
      else begin
        logger.Warn('Error Format: ' + s);
        exit;
      end;
    end;
    result := true;
  end;
end;

procedure TsvcDLM.ServiceStart(Sender: TService; var Started: Boolean);
var
  ini: TIniFile;
  path: string;
begin
  path := TPath.GetDirectoryName(ParamStr(0));
  if not TDirectory.Exists(path + '\log') then
    TDirectory.CreateDirectory(path + '\log');
  logger := TLogger.Create(path + '\log\DLM.log');
  ini := TIniFile.Create(path + '\config.ini');
  IdHTTPServer1.DefaultPort := ini.ReadInteger('sys', 'PORT', 8888);
  logger.Level := ini.ReadInteger('sys', 'LoggerLevel', 2);
  ini.Free;
  if LoadIpMap then
  begin
    try
      FQueue := TQueue<TParam>.Create;
      IdHTTPServer1.Active := True;
      TThreadPool.Current.SetMinWorkerThreads(16);
      logger.Info('DLM start ok');
    except
      on e: Exception do
      begin
        logger.Error(e.Message);
        Started := false;
      end;
    end;
  end;
end;

procedure TsvcDLM.ServiceStop(Sender: TService; var Stopped: Boolean);
var
  n: integer;
begin
  idHttpServer1.Active := false;
  n := 0;
  while FCount > 0 do
  begin
    logger.Info('Wait to download, request count: ' + FCount.ToString);
    Sleep(2000);
    Inc(n);
    if n > 10 then
    begin
      logger.Warn('Force stop');
      break;
    end;
  end;
  FIpMap.Free;
  logger.Info('XMFS stoped');
  logger.Free;
end;

end.
