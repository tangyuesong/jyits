program XMFService;

uses
  Vcl.SvcMgr,
  uSvcMain in 'uSvcMain.pas' {ItsXMFService: TService},
  uCommon in 'Common\uCommon.pas',
  uGlobal in 'Common\uGlobal.pas',
  uImageOps in 'Common\uImageOps.pas',
  uLogger in 'Common\uLogger.pas',
  uPassList in 'Common\uPassList.pas',
  uTypes in 'Common\uTypes.pas',
  MyImage in 'Task\MyImage.pas',
  uBaseThread in 'Task\uBaseThread.pas',
  uDJThread in 'Task\uDJThread.pas',
  uTaskManager in 'Task\uTaskManager.pas',
  uHik86Sender in 'Hik86\uHik86Sender.pas',
  uHik86 in 'Hik86\uHik86.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TItsXMFService, ItsXMFService);
  Application.Run;
end.
