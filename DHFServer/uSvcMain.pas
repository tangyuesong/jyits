unit uSvcMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, uCommon, uTaskManager, uGlobal,
  FireDAC.Phys.OracleDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ExtCtrls, UInterface;

type
  TITSDHFSvc = class(TService)
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Timer1: TTimer;
    IdHTTP1: TIdHTTP;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure DoHeartbeat;
    //procedure CheckDeviceStatus;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ITSDHFSvc: TITSDHFSvc;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ITSDHFSvc.Controller(CtrlCode);
end;

function TITSDHFSvc.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TITSDHFSvc.ServiceStart(Sender: TService; var Started: Boolean);
begin
  uCommon.Initialize;
  TaskManager := TTaskManager.Create;
  TaskManager.CreateThreads;
  Timer1.Interval := 60000;
  Timer1.Enabled := True;
end;

procedure TITSDHFSvc.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  TaskManager.Free;
  uCommon.Finalizat;
end;

procedure TITSDHFSvc.Timer1Timer(Sender: TObject);
var
  nn: integer;
begin
  if gHeartbeatUrl<> '' then
    DoHeartbeat;
  LoadOpenedDevice;
  //TaskManager.CheckDeadThread;
  //CheckDeviceStatus;
  nn := strtoint(FormatDateTime('nn', now));
  if nn = 0 then  // 每小时更新
  begin
    logger.Info('reload data');
    if reload then
    begin
      TaskManager.SuspendThreads;
      LoadDevice;
      TaskManager.ResumeThreads;
    end;
    loadHBC;
    //LoadVeh;
    logger.Info('reload OK');
  end;
  if nn div 5 = 0 then
  begin
    logger.Info('LoadAlarm');
    LoadAlarm;
    LoadAlarmJTP;
    LoadAlarmSDCL;
    logger.Info('LoadAlarm OK');
  end;
end;

procedure TITSDHFSvc.DoHeartbeat;
var
  requestStream: TStringStream;
begin
  requestStream := TStringStream.Create('');
  requestStream.WriteString('ServiceName=ITSDHFSvc');
  try
    IdHTTP1.Post(gHeartbeatUrl + 'ServiceHeartbeat', requestStream);
  except
  end;
  requestStream.Free;
end;

{
procedure TITSDHFSvc.CheckDeviceStatus;
var
  msg: string;
begin
  msg := '';
  if gDeviceStatusMobile <> '' then
  begin
    with SQLHelper.Query('select SBDDMC from S_DEVICE where CJJG='''+gCJJG+''' and DATEDIFF(mi,gxsj, getdate())=30') do
    begin
      while not EOF do
      begin
        msg := msg + #13#10 + FieldByName('SBDDMC').AsString;
        Next;
      end;
      Free;
    end;
  end;
  if msg <> '' then
  begin
    msg := '[设备异常]:' + msg;
    SQLHelper.ExecuteSql('insert into s_message(msg)values(''' + msg +''')');
    if SMSUrl = '' then
      uCommon.AddSMS('[its]', gDeviceStatusMobile, msg)
    else
      Tmypint.SendSMS(gDeviceStatusMobile, msg);
  end;
end;
}
end.
