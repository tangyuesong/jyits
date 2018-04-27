unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, uCommon, uGlobal,
  uPilotsafebeltThread, IdBaseComponent, IdComponent, uNoEntryThread,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ExtCtrls, u2To5NoEntry;

type
  TItsK08VioService = class(TService)
    Timer1: TTimer;
    IdHTTP1: TIdHTTP;
    Timer2: TTimer;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ItsK08VioService: TItsK08VioService;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ItsK08VioService.Controller(CtrlCode);
end;

function TItsK08VioService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TItsK08VioService.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  TCommon.ProgramInit;
  if gThreadConfig.PilotsafebeltThreadRun then
    TPilotsafebeltThread.Create;
  if gThreadConfig.NoEntryThreadRun then
    TNoEntryThread.Create;
  Timer1.Interval := gHeartbeatInterval * 60000;
  Timer1Timer(nil);
  Timer1.Enabled := True;
  Timer2.Enabled := gThreadConfig.LC25NoEntryThreadRun;
  gLogger.Info('Service Started');
end;

procedure TItsK08VioService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Timer1.Enabled := False;
  gLogger.Info('Service Stoped');
  TCommon.ProgramDestroy;
end;

procedure TItsK08VioService.Timer1Timer(Sender: TObject);
var
  response: TStringStream;
  requestStream: TStringStream;
begin
  response := TStringStream.Create('');
  requestStream := TStringStream.Create('');
  requestStream.WriteString('ServiceName=ItsK08VioService');
  try
    IdHTTP1.Post(gHeartbeatUrl + 'ServiceHeartbeat', requestStream, response);
  except
  end;
  requestStream.Free;
  response.Free;
end;

procedure TItsK08VioService.Timer2Timer(Sender: TObject);
begin
  if FormatDatetime('hhnn', Now()) = '1125' then
    T2To5NoEntry.Create(False);
end;

end.
