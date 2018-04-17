unit uSvcMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, uCommon, uTaskManager, IOUtils,
  Vcl.ExtCtrls, uPassList;

type
  TItsXMFService = class(TService)
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
  ItsXMFService: TItsXMFService;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ItsXMFService.Controller(CtrlCode);
end;

function TItsXMFService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TItsXMFService.ServiceStart(Sender: TService; var Started: Boolean);
begin
  TaskManager := TTaskManager.Create;
  if uCommon.Initialize then
  begin
    TaskManager.CreateThreads;
  end;
end;

procedure TItsXMFService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  TaskManager.Free;
  uCommon.Finalizat;
end;

procedure TItsXMFService.Timer1Timer(Sender: TObject);
begin
  PassList.PostHis;
end;

end.
