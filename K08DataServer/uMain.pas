unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Vcl.ExtCtrls, uGlobal, uCommon, uSaveK08Thread;

type
  TItsK08DataService = class(TService)
    Timer1: TTimer;
    IdHTTP1: TIdHTTP;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ItsK08DataService: TItsK08DataService;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ItsK08DataService.Controller(CtrlCode);
end;

function TItsK08DataService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TItsK08DataService.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  TCommon.ProgramInit;
  Timer1.Interval := gHeartbeatInterval * 60000;
  Timer1Timer(nil);
  Timer1.Enabled := True;
  Timer2Timer(nil);
  Timer2.Enabled := True;
  gLogger.Info('Service Started');
end;

procedure TItsK08DataService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  while gTaskRunning do
    Sleep(5000);
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  gLogger.Info('Service Stoped');
  TCommon.ProgramDestroy;
end;

procedure TItsK08DataService.Timer1Timer(Sender: TObject);
var
  response: TStringStream;
  requestStream: TStringStream;
begin
  response := TStringStream.Create('');
  requestStream := TStringStream.Create('');
  requestStream.WriteString('ServiceName=' + Self.Name);
  try
    IdHTTP1.Post(gHeartbeatUrl + 'ServiceHeartbeat', requestStream, response);
  except
  end;
  requestStream.Free;
  response.Free;
end;

procedure TItsK08DataService.Timer2Timer(Sender: TObject);
begin
  if FormatDateTime('NN', Now()) = '50' then
    TSaveK08Thread.Create(False);
end;

end.
