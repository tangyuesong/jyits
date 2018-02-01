unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, IniFiles, uMainThread, uLogger,
  FireDAC.Phys.OracleDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle,
  Vcl.ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TItsFeedbackService = class(TService)
    fdphysrcldrvrlnk1: TFDPhysOracleDriverLink;
    IdHTTP1: TIdHTTP;
    Timer1: TTimer;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    gHeartbeatUrl: String;
    FThread: TMainThread;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ItsFeedbackService: TItsFeedbackService;

implementation

uses uCommon;
{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ItsFeedbackService.Controller(CtrlCode);
end;

function TItsFeedbackService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TItsFeedbackService.ServiceStart(Sender: TService;
  var Started: Boolean);
var
  ini: TIniFile;
begin
  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'log\Feedback.log');
  logger.Info('Service Started');
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  oraConfig.Host := ini.ReadString('Ora', 'Host', '10.43.255.208');
  oraConfig.Port := ini.ReadString('Ora', 'Port', '1521');
  oraConfig.User := ini.ReadString('Ora', 'User_Name', 'rm');
  oraConfig.Password := ini.ReadString('Ora', 'Password', 'rm');
  oraConfig.DbName := ini.ReadString('Ora', 'SERVICE_NAME', 'jczhpt');

  sqlConfig.Host := ini.ReadString('Sql', 'Host', '10.43.255.22');
  sqlConfig.User := ini.ReadString('Sql', 'User_Name', 'vioadmin');
  sqlConfig.Password := ini.ReadString('Sql', 'Password', 'lgm1224,./');
  sqlConfig.DbName := ini.ReadString('Sql', 'SERVICE_NAME', 'yjitsdb');

  gQTZHelper.Home := ini.ReadString('QTZ', 'Home', 'http://10.43.255.8:20088');

  gHeartbeatUrl := ini.ReadString('Heartbeat', 'Url',
    'http://127.0.0.1:20090/');
  if not gHeartbeatUrl.EndsWith('/') then
    gHeartbeatUrl := gHeartbeatUrl + '/';

  Timer1.Interval := ini.ReadInteger('Heartbeat', 'Interval', 3) * 60000;
  Timer1.Enabled := True;
  Timer1Timer(nil);

  ini.Free;
  FThread := TMainThread.Create();
end;

procedure TItsFeedbackService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  FThread.Stop;
  Sleep(10000);
  logger.Info('Service Stoped');
  logger.Free;
end;

procedure TItsFeedbackService.Timer1Timer(Sender: TObject);
var
  response: TStringStream;
  requestStream: TStringStream;
begin
  response := TStringStream.Create('');
  requestStream := TStringStream.Create('');
  requestStream.WriteString('ServiceName=ItsFeedbackService');
  try
    IdHTTP1.Post(gHeartbeatUrl + 'ServiceHeartbeat', requestStream, response);
  except
  end;
  requestStream.Free;
  response.Free;
end;

end.
