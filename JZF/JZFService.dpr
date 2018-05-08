program JZFService;

uses
  Vcl.SvcMgr,
  uMainService in 'uMainService.pas' {ItsJZFService: TService},
  uGlobal in 'Common\uGlobal.pas',
  uLogger in 'Common\uLogger.pas',
  uSQLHelper in 'Common\uSQLHelper.pas',
  uBetweenTaskThread in 'jzf\uBetweenTaskThread.pas',
  uCrashTaskThread in 'jzf\uCrashTaskThread.pas',
  uFollowTaskThread in 'jzf\uFollowTaskThread.pas',
  uPassRec in 'jzf\uPassRec.pas',
  uTaskThread in 'jzf\uTaskThread.pas',
  uCommon in 'Common\uCommon.pas',
  uEntity in 'Common\uEntity.pas',
  uKKAlarm in 'KKAlarm\uKKAlarm.pas',
  uDFS in 'Common\uDFS.pas',
  uHik in 'Hik\uHik.pas',
  uDecodeHikResult in 'Hik\uDecodeHikResult.pas',
  uZBDXThread in 'ZBDX\uZBDXThread.pas',
  uUploadVio in 'UploadVio\uUploadVio.pas',
  uJsonUtils in 'Common\uJsonUtils.pas',
  uRequestItf in 'Common\uRequestItf.pas',
  cLockVio in 'UploadVio\cLockVio.pas',
  uJQThread in 'JingQing\uJQThread.pas',
  uVioSBThread in 'VioSB\uVioSBThread.pas',
  uDeviceMonitorThread in 'DeviceMonitor\uDeviceMonitorThread.pas',
  uFirstEnterTaskThread in 'JZF\uFirstEnterTaskThread.pas',
  uDelExpiredVioThread in 'DelExpiredVio\uDelExpiredVioThread.pas',
  uHBCVioThread in 'HBCVio\uHBCVioThread.pas',
  uWNJVioThread in 'HBCVio\uWNJVioThread.pas',
  uJTPThread in 'JTP\uJTPThread.pas',
  qjson in 'Common\qjson.pas',
  qrbtree in 'Common\qrbtree.pas',
  QString in 'Common\QString.pas',
  uJinXingThread in 'HBCVio\uJinXingThread.pas',
  uUploadTempVio in 'UploadTempVio\uUploadTempVio.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TItsJZFService, ItsJZFService);
  Application.Run;

end.
