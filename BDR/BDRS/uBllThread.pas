unit uBllThread;

interface

uses
  System.Classes, SysUtils, ActiveX, HttpApp, JSON, IdHttp, IdCustomHTTPServer,
  FireDAC.Stan.Param, Data.DB, uCommon, uEntity, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TBllThread = class(TThread)
  private
    FRequest: TRequest;
    procedure SaveResult(response: TResponse);
    function DoAction: TResponse;
    function DoAction1: TResponse;
  protected
    procedure Execute; override;
  public
    constructor Create(ARequest: TRequest); overload;
  end;

implementation

{ TBllThread }

constructor TBllThread.Create(ARequest: TRequest);
begin
  FRequest := ARequest;
  FreeOnTerminate := true;
  inherited Create(false);
end;

procedure TBllThread.Execute;
var
  response: TResponse;
begin
  ActiveX.CoInitialize(nil);
  CoInitializeEx(Nil, COINIT_MULTITHREADED);
  response := DoAction;
  if response.ERROR_MESSAGE.Contains('10054') then
    response := DoAction;
  if Assigned(FRequest.POST_STREAM) then
    FRequest.POST_STREAM.Free;
  SaveResult(response);
end;

function TBllThread.DoAction1: TResponse;
var
  url: string;
  http: TNetHTTPClient;
  ss: TStringStream;
  res: IHTTPResponse;
begin
  result.CONTENT_TEXT := '';
  result.CONTENT_STREAM := nil;
  result.ERROR_Message := '';
  if not Apps.ContainsKey(FRequest.AppName) then
  begin
    logger.Error('Invalid AppName: ' + FRequest.AppName);
    result.CONTENT_TEXT := 'Invalid AppName';
    exit;
  end;
  if FRequest.IS_STREAM then
    result.CONTENT_STREAM := TMemoryStream.Create;

  url := Apps[FRequest.AppName] +FRequest.DOCUMENT;
  if FRequest.PARAMS <> '' then
    url := url + '?' + FRequest.PARAMS;
  http:= TNetHTTPClient.Create(nil);
  http.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
  http.Accept := 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
  try
    if FRequest.HTTP_METHOD = Ord(hcGET) then
    begin
      if FRequest.IS_STREAM then
        res := http.Get(url, result.CONTENT_STREAM)
      else begin
        res := http.Get(url);
        result.CONTENT_TEXT := res.ContentAsString;
      end;
    end
    else begin
      if FRequest.IS_STREAM then
      begin
        res := http.Post(url, FRequest.POST_STREAM, result.CONTENT_STREAM);
      end
      else begin
        res := http.Post(url, FRequest.POST_STREAM);
        result.CONTENT_TEXT := res.ContentAsString;
      end;
    end;
    result.CONTENT_TYPE := res.MimeType;
    result.CharSet := res.ContentCharSet;
  except
    on e: exception do
    begin
      logger.Error(e.Message + url);
      result.ERROR_Message := e.Message;
      result.CONTENT_STREAM.Free;
      result.CONTENT_STREAM := nil;
    end;
  end;
  http.Free;
  if Assigned(FRequest.POST_STREAM) then
    FRequest.POST_STREAM.Free;
end;

function TBllThread.DoAction: TResponse;
var
  url: string;
  http: TIdHttp;
begin
  result.CONTENT_TEXT := '';
  result.CONTENT_STREAM := nil;
  result.ERROR_Message := '';
  if not Apps.ContainsKey(FRequest.AppName) then
  begin
    logger.Error('Invalid AppName: ' + FRequest.AppName);
    result.CONTENT_TEXT := 'Invalid AppName';
    exit;
  end;
  if FRequest.IS_STREAM then
    result.CONTENT_STREAM := TMemoryStream.Create;

  url := Apps[FRequest.AppName] +FRequest.DOCUMENT;
  if FRequest.PARAMS <> '' then
    url := url + '?' + FRequest.PARAMS;
  http := TIdHttp.Create(nil);
  http.HandleRedirects := true;
  try
    if FRequest.HTTP_METHOD = Ord(hcGET) then
    begin
      if FRequest.IS_STREAM then
        http.Get(url, result.CONTENT_STREAM)
      else
        result.CONTENT_TEXT := http.Get(url);
    end
    else begin
      if FRequest.IS_STREAM then
        http.Post(url, FRequest.POST_STREAM, result.CONTENT_STREAM)
      else
        result.CONTENT_TEXT := http.Post(url, FRequest.POST_STREAM);
    end;
    result.CONTENT_TYPE := http.Response.ContentType;
    result.CharSet := http.Response.CharSet;
    result.CustomHeaders := http.Response.CustomHeaders.Text;
  except
    on e: exception do
    begin
      logger.Error(e.Message + url);
      result.ERROR_Message := e.Message;
      result.CONTENT_STREAM.Free;
      result.CONTENT_STREAM := nil;
    end;
  end;
  http.Free;
end;

procedure TBllThread.SaveResult(response: TResponse);
var
  sql: string;
  stream: TStringStream;
  params: TFDParams;
begin
  if (response.CONTENT_TEXT = '') and (response.CONTENT_STREAM = nil) then
    response.CONTENT_TEXT := '{"head":{"code":"0","message":"Request Failed(ERROR: 50510)"}';

  params := TFDParams.Create;
  params.Add('SYSID', FRequest.SYSID);
  params.Add('CONTENT_TYPE', response.CONTENT_TYPE);
  params.Add('CHARSET', response.CHARSET);
  params.Add('CUSTOMHEADERS', response.CUSTOMHEADERS);

  if response.CONTENT_TEXT.Length < 4000 then
  begin
    sql := 'INSERT INTO T_RESPONSE(SYSID,CONTENT_TYPE,CHARSET,CUSTOMHEADERS,CONTENT_TEXT,CONTENT_STREAM)'
      + 'VALUES(:SYSID,:CONTENT_TYPE,:CHARSET,:CUSTOMHEADERS,:TEXT,:CONTENT_STREAM)';
    params.Add('TEXT', response.CONTENT_TEXT);
  end
  else begin
    sql := 'INSERT INTO T_RESPONSE(SYSID,CONTENT_TYPE,CHARSET,CUSTOMHEADERS,CONTENT_TEXT_BLOB,CONTENT_STREAM)'
      +'VALUES(:SYSID,:CONTENT_TYPE,:CHARSET,:CUSTOMHEADERS,:TEXT,:CONTENT_STREAM)';
    stream := TStringStream.Create(response.CONTENT_TEXT);
    stream.Position := 0;
    params.Add('TEXT', '').LoadFromStream(stream, TFieldType.ftBlob);
    stream.Free;
  end;
  if response.CONTENT_STREAM <> nil then
  begin
    response.CONTENT_STREAM.Position := 0;
    params.Add('CONTENT_STREAM', '').LoadFromStream(response.CONTENT_STREAM, TFieldType.ftBlob);
    response.CONTENT_STREAM.Free;
  end
  else
    params.Add('CONTENT_STREAM', '');

  SQLHelper.ExecuteSql1(SQL, params);
  params.Free;
end;

end.
