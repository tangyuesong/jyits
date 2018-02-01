program QTZService;

uses
  Vcl.SvcMgr,
  uMainService in 'uMainService.pas' {ItsQTZService: TService},
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
  itfUploadVioTo61 in 'itfUploadVioTo61.pas',
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
  TmriOutAccess1 in 'rm\intf\TmriOutAccess1.pas';

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
  Application.CreateForm(TItsQTZService, ItsQTZService);
  Application.Run;
end.
