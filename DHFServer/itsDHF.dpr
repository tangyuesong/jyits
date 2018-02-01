program itsDHF;

uses
  Vcl.SvcMgr,
  uSvcMain in 'uSvcMain.pas' {ITSDHFSvc: TService},
  MyImage in 'Task\MyImage.pas',
  uBaseThread in 'Task\uBaseThread.pas',
  uDJThread in 'Task\uDJThread.pas',
  UInterface in 'Task\UInterface.pas',
  uKKThread in 'Task\uKKThread.pas',
  uPassCounter in 'Task\uPassCounter.pas',
  uTaskManager in 'Task\uTaskManager.pas',
  uVio1344Thread in 'Task\uVio1344Thread.pas',
  MessageDigest_5 in 'Common\MessageDigest_5.pas',
  uCommon in 'Common\uCommon.pas',
  uGlobal in 'Common\uGlobal.pas',
  uImageOps in 'Common\uImageOps.pas',
  uLogger in 'Common\uLogger.pas',
  uPassList in 'Common\uPassList.pas',
  uSQLHelper in 'Common\uSQLHelper.pas',
  uTypes in 'Common\uTypes.pas',
  Trans1 in 'Trans\Trans1.pas',
  uTrans in 'Trans\uTrans.pas',
  uIdChinaPassThread in 'Task\uIdChinaPassThread.pas',
  uIdChinaVioThread in 'Task\uIdChinaVioThread.pas',
  TmriOutAccess in 'Tmri\TmriOutAccess.pas',
  uTmri in 'Tmri\uTmri.pas',
  uHoleService in 'Task\uHoleService.pas',
  uHikThread in 'Task\uHikThread.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TITSDHFSvc, ITSDHFSvc);
  Application.Run;
end.
