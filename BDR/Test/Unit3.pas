unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, uCommon, uLogger, IdHttp,
  FireDAC.Phys.OracleDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle,
  Vcl.StdCtrls, uScanThread, FireDAC.Stan.Option, FireDAC.Stan.Error, uDM, Generics.Collections,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDConnection1: TFDConnection;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    FScanThread: TScanThread;
    FOraConn: TFDConnection;
    procedure ServiceStart;
    procedure ServiceStop;
    procedure SQLError(const SQL, Description: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  http: TIdHttp;
  stream, stream1: TMemoryStream;
  sl: TStringList;     i: integer;
begin
  http := TIdHttp.Create(nil);
  http.ConnectTimeout := 30000;
  http.Request.CustomHeaders.Clear;
  http.Request.CustomHeaders.Add('Connection: keep-alive');
  http.Request.CustomHeaders.Add('Content-Length: 743554');
  http.Request.CustomHeaders.Add('Host: 10.43.255.8:18088');
  http.Request.CustomHeaders.Add('Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8');
  http.Request.CustomHeaders.Add('User-Agent: Mozilla/3.0 (compatible; Indy Library)');

  i := http.Request.CustomHeaders.IndexOfName('Content-Length');
  if i>=0 then
    http.Request.CustomHeaders.Delete(i);
  i := http.Request.CustomHeaders.IndexOfName('Host');
  if i>=0 then
    http.Request.CustomHeaders.Delete(i);

  http.HandleRedirects := true;
  try
    //sl:=TStringList.Create;
    //sl.LoadFromFile('d:\aa.dat');
    stream := TMemoryStream.Create;
    stream.LoadFromFile('d:\aa.dat');
    //sl.SaveToStream(stream,TEncoding.UTF8);
    stream1 := TMemoryStream.Create;
    http.Post('http://172.30.110.182:8187/traffic/ws/picAnalysis', STREAM, STREAM1);
    showmessage(stream1.Size.tostring);
  except
    on e: exception do
      showmessage(e.Message);
  end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //ServiceStop;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  //ServiceStart;
end;

procedure TForm3.ServiceStart;
var
  ini: TIniFile;
  strings: TStrings;
  s: string;
begin
  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'border.log');

  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  logger.Level := ini.ReadInteger('sys', 'logLevel', 2);
  logger.Info('logger.Level = ' + logger.Level.ToString);

  Application.CreateForm(TDM, DM);
  DM.OnError := self.SQLError;

  Apps := TDictionary<string, string>.Create;
  strings := TStringList.Create;
  ini.ReadSection('APP', strings);
  for s in strings do
  begin
    if not Apps.ContainsKey(s.ToUpper) then
      Apps.Add(s.ToUpper, ini.ReadString('APP', s, ''));
  end;
  strings.Free;

  ini.Free;

  FScanThread := TScanThread.Create;
  logger.Info('start');
end;

procedure TForm3.ServiceStop;
begin
  FScanThread.Stop;
  logger.Free;
end;

procedure TForm3.SQLError(const SQL, Description: string);
begin
  logger.Error(Description + SQL);
end;

end.
