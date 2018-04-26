unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, HTTPAPP, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, IOUtils, IdContext,
  IdCustomHTTPServer, IdBaseComponent, IdComponent, IdCustomTCPServer,
  IdHTTPServer, System.Threading, System.Generics.Collections, uLogger,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TParam = Record
    Url: string;
    Path: string;
  end;

  TForm1 = class(TForm)
    IdHTTPServer1: TIdHTTPServer;
    Button1: TButton;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FQueue: TQueue<TParam>;
    FCount: integer;
    FTotal: integer;
    FIPMap: TDictionary<string, string>;
    function ConvertUrl(url: string): string;
    function DownLoad: boolean;
    function LoadIpMap: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  n: integer;
begin
  idHttpServer1.Active := false;
  n := 0;
  while FCount > 0 do
  begin
    logger.Info('Wait to download, request count: ' + FQueue.Count.ToString);
    Sleep(2000);
    Inc(n);
    if n > 10 then
    begin
      logger.Warn('Force stop');
      break;
    end;
  end;
  FIpMap.Free;
  logger.Info('DLM stoped');
  logger.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
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
  FCount := 0;
  FTotal := 0;
  if LoadIpMap then
  begin
    try
      FQueue := TQueue<TParam>.Create;
      IdHTTPServer1.Active := True;
      timer1.Enabled := true;
      TThreadPool.Current.SetMinWorkerThreads(16);

      logger.Info('DLM start ok');
    except
      on e: Exception do
      begin
        logger.Error(e.Message);
      end;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
  function HttpGet(url: string): boolean;
  var
    http: TNetHttpClient;
  begin
    result := false;
    http := TNetHttpClient.Create(nil);
    try
      http.Get(url);
      result := true;
      logger.Debug('[TKKThread.HttpGet]' + url);
    except
      on e: exception do
      begin
        logger.Error('[TKKThread.HttpGet]' +  e.Message);
        http.Free;
      end;
    end;
    http.Free;
  end;
  function HttpSend(fwqdz, tp1, tp2, tp3, path: string): boolean;
  var
    url: string;
  begin
    url := 'http://localhost:8888/Download?' + 'src=' + fwqdz + tp1 + '&tgt=' + path + tp1;
    result := HttpGet(url);
  end;
var
  path: string;
begin
  if HttpSend('http://10.43.240.97:88/data5/zc/120000840321/20180419/14/',
    '5950765-129776874874754-2-1.jpg', '','', 'd:\aaaa') then
  begin

  end;
end;

function TForm1.ConvertUrl(url: string): string;
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

function TForm1.DownLoad: boolean;
var
  http: TNetHttpClient;
  stream: TMemoryStream;
  s: string;
  param: TParam;
begin
  result := false;

  http := TNetHttpClient.Create(nil);
  stream := TMemoryStream.Create;
  try
    param := FQueue.Dequeue;
    s := TPath.GetDirectoryName(param.Path);
    if not TDirectory.Exists(s) then
      TDirectory.CreateDirectory(s);

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
      logger.Error(e.Message + param.url + #9 + param.Path);
  end;
  stream.Free;
  http.Free;
  Dec(FCount);
end;

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  action, ip, newUrl: string;
  Params: TStringList;
  i: integer;
  param: TParam;
begin
  try
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
      Inc(FTotal);
      newUrl := ConvertUrl(param.url);
      if newUrl <> '' then
      begin
        param.Url := newUrl;
        FQueue.Enqueue(param);
        Inc(FCount);
        TTask.Create(procedure
          begin
            DownLoad;
          end
        ).Start;
        AResponseInfo.ContentText := '1: ' + param.url;
      end
      else begin
        AResponseInfo.ContentText := '2: ' + param.url;
        logger.Warn('Url invalid£º' + param.url);
      end;
    end
    else begin
      AResponseInfo.ContentText := '3: ' + param.url;
      logger.Warn('invalid request: ' + action + ' ' + param.url + ' ' + param.path);
    end;
  except
    on e: exception do
      logger.Error(e.Message + ARequestInfo.UnparsedParams);
  end;
end;

function TForm1.LoadIpMap: boolean;
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

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  logger.Info('ToDo/Done: ' + FCount.ToString + '/' + FTotal.ToString);
end;

end.
