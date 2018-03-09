unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Vcl.ExtCtrls, uGlobal, uCommon, uSaveK08Thread, Generics.Collections;

type
  TItsK08DataService = class(TService)
    Timer1: TTimer;
    IdHTTP1: TIdHTTP;
    procedure Timer1Timer(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    procedure CreateThread();
    procedure DestroyThread();
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

procedure TItsK08DataService.CreateThread;
var
  i: Integer;
  thread: TSaveK08Thread;
begin
  gThreadList := TList<TSaveK08Thread>.Create;
  for i := 0 to gJobNum - 1 do
  begin
    thread := TSaveK08Thread.Create(false);
    gThreadList.Add(thread);
  end;
end;

procedure TItsK08DataService.DestroyThread;
var
  i: Integer;
begin
  for i := gThreadList.Count - 1 downto 0 do
    gThreadList[i].Terminate;
  gThreadList.Free;
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
  CreateThread;
  gLogger.Info('Service Started');
end;

procedure TItsK08DataService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  DestroyThread;
  Timer1.Enabled := false;
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

end.
