program QTZService;

uses
  Vcl.SvcMgr,
  uMainService in 'uMainService.pas' {ItsQTZServiceTest: TService},
  uCommon in 'uCommon.pas',
  uSQLHelper in 'uSQLHelper.pas',
  uLogger in 'uLogger.pas',
  uGlobal in 'uGlobal.pas',
  uEntity in 'uEntity.pas',
  uDBService in 'uDBService.pas',
  uSolr in 'uSolr.pas',
  uRmService in 'rm\uRmService.pas',
  uRmInf in 'rm\impl\uRmInf.pas',
  uRmWeb in 'rm\impl\uRmWeb.pas',
  uTmri in 'rm\impl\uTmri.pas',
  uTrans in 'rm\impl\uTrans.pas',
  uXmlAndJSON in 'rm\impl\uXmlAndJSON.pas',
  RmOutAccessInf in 'rm\intf\RmOutAccessInf.pas',
  RmOutAccessWeb in 'rm\intf\RmOutAccessWeb.pas',
  Trans1 in 'rm\intf\Trans1.pas',
  uSpecialItf in 'uSpecialItf.pas',
  uDBO in 'uDBO.pas',
  uSMS in 'uSMS.pas',
  uHik in 'uHik.pas',
  uDecodeHikResult in 'uDecodeHikResult.pas',
  MessageDigest_5 in 'MessageDigest_5.pas',
  uTokenManager in 'uTokenManager.pas',
  uJKDefine in 'rm\impl\uJKDefine.pas',
  uWSManager in 'uWSManager.pas',
  TmriOutNewAccess in 'rm\intf\TmriOutNewAccess.pas',
  uAnalysisExtra in 'hik\uAnalysisExtra.pas',
  uDataAnalysis in 'hik\uDataAnalysis.pas',
  uDataStatistics in 'hik\uDataStatistics.pas',
  uHikHBase in 'hik\uHikHBase.pas',
  uMoreLikeThisHBase in 'hik\uMoreLikeThisHBase.pas',
  uPolice in 'hik\uPolice.pas',
  uProfile in 'hik\uProfile.pas',
  uTrafficForecast in 'hik\uTrafficForecast.pas',
  qjson in 'qjson.pas',
  qrbtree in 'qrbtree.pas',
  QString in 'QString.pas',
  uUploadVio in 'uUploadVio.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TItsQTZServiceTest, ItsQTZServiceTest);
  Application.Run;

end.
