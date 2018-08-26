unit uMainService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, uDBService, uRmService,
  uCommon, uGlobal, Vcl.ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TItsQTZServiceTest = class(TService)
    IdHTTP1: TIdHTTP;
    Timer1: TTimer;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ItsQTZServiceTest: TItsQTZServiceTest;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ItsQTZServiceTest.Controller(CtrlCode);
end;

function TItsQTZServiceTest.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TItsQTZServiceTest.ServiceStart(Sender: TService; var Started: Boolean);
begin
  TCommon.ProgramInit;
  DbService := TDbService.Create;
  RmService := TRmService.Create;
  Timer1.Interval := gHeartbeatInterval * 60000;
  Timer1Timer(nil);
  Timer1.Enabled := True;
  gLogger.logging('Service Started', 2);
end;

procedure TItsQTZServiceTest.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Timer1.Enabled := False;
  DbService.Free;
  RmService.Free;
  gLogger.logging('Service Stoped', 2);
  TCommon.ProgramDestroy;
end;

procedure TItsQTZServiceTest.Timer1Timer(Sender: TObject);
var
  response: TStringStream;
  requestStream: TStringStream;
begin
  response := TStringStream.Create('');
  requestStream := TStringStream.Create('');
  requestStream.WriteString('ServiceName=ItsQTZService');
  try
    IdHTTP1.Post(gHeartbeatUrl + 'ServiceHeartbeat', requestStream, response);
  except
  end;
  requestStream.Free;
  response.Free;
end;

end.
