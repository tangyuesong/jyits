unit uBllThread;

interface

uses
  System.Classes, SysUtils, ActiveX, HttpApp, JSON, uCommon, IdHttp,
  FireDAC.Stan.Param, Data.DB;

type
  TBllThread = class(TThread)
  private
    FIn: TIn;
    function HttpGet(url: string): string;
    procedure SaveResult(json: string);
  protected
    procedure Execute; override;
  public
    constructor Create(AIn: TIn); overload;
  end;

implementation

{ TBllThread }

constructor TBllThread.Create(AIn: TIn);
begin
  FIn := AIn;
  FreeOnTerminate := true;
  inherited Create(false);
end;

procedure TBllThread.Execute;
var
  url, response: string;
begin
  ActiveX.CoInitialize(nil);
  CoInitializeEx(Nil, COINIT_MULTITHREADED);
  url := QTZHost+FIn.CMD + '?' + FIn.BODY;
  if FIn.LBLOB <> '' then
    url := url + FIn.LBLOB;
  response := HttpGet(url);
  SaveResult(response);
end;

function TBllThread.HttpGet(url: string): string;
var
  http: TIdHttp;
begin
  result := '';
  http := TIdHttp.Create(nil);
  try
    result := http.Get(url);
  except
    on e: exception do
    begin
      logger.Error(e.Message + url);
    end;
  end;
  http.Free;
end;

procedure TBllThread.SaveResult(json: string);
var
  sql: string;
  stream: TStringStream;
  params: TFDParams;
begin
  if json = '' then
    json := '{"head":{"code":"0","message":"no data"}';
  params := TFDParams.Create;
  params.Add('id', FIn.SYSID);
  if json.Length < 4000 then
  begin
    sql := 'insert into T_OUT(SYSID,BODY)VALUES(:id,:text)';
    params.Add('text', json);
  end
  else begin
    logger.Info('BLOB');
    stream := TStringStream.Create(json);
    stream.Position := 0;
    params.Add('text', '').LoadFromStream(stream, TFieldType.ftBlob);
    stream.Free;
    SQL := 'insert into T_OUT(sysid, text)VALUES(:id,:text)';
  end;
  SQLHelper.ExecuteSql1(SQL, params);
  params.Free;
end;

end.
