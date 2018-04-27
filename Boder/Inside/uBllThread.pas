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
  logger.Debug(FIn.CMD + ' 1');
  CoInitializeEx(Nil, COINIT_MULTITHREADED);
  url := QTZHost+FIn.CMD + '?' + FIn.BODY;
  if FIn.LBLOB <> '' then
    url := url + FIn.LBLOB;
  response := HttpGet(url);
  logger.Debug(FIn.CMD + ' 2');
  SaveResult(response);
  logger.Debug(FIn.CMD + ' 3');
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
  param: TFDParam;
begin
  if json = '' then
    json := '{"head":{"code":"0","message":"no data"}';
  //if json.Length < 4000 then
  //begin
  //  sql := 'insert into T_OUT(SYSID,BODY)VALUES(''' + FIn.SYSID + ''',''' + json + ''')';
  //  SQLHelper.ExecuteSql(sql);
  //end
  //else begin
  stream := TStringStream.Create(json);
  params := TFDParams.Create;
  param := params.Add;
  stream.Position := 0;
  param.LoadFromStream(stream, TFieldType.ftBlob);
  SQL := 'insert into T_OUT(sysid, text)VALUES(''' + FIn.SYSID + ''',:text)';
  SQLHelper.ExecuteSql1(SQL, params);
  param.Free;
  params.Free;
  stream.Free;
  //end;
end;

end.
