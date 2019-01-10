program QTZ3Service;

uses
  Vcl.SvcMgr,
  uServiceMain in 'uServiceMain.pas' {ItsQTZ3Service: TService},
  uCommon in 'Common\uCommon.pas',
  uEntity in 'Common\uEntity.pas',
  uGlobal in 'Common\uGlobal.pas',
  uLogger in 'Common\uLogger.pas',
  uSQLHelper in 'Common\uSQLHelper.pas',
  uTokenManager in 'Common\uTokenManager.pas',
  uRmService in 'RMService\uRmService.pas',
  uRmInf in 'RMService\impl\uRmInf.pas',
  uRmWeb in 'RMService\impl\uRmWeb.pas',
  uTmri in 'RMService\impl\uTmri.pas',
  uTrans in 'RMService\impl\uTrans.pas',
  uXmlAndJSON in 'RMService\impl\uXmlAndJSON.pas',
  RmOutAccessInf in 'RMService\intf\RmOutAccessInf.pas',
  RmOutAccessWeb in 'RMService\intf\RmOutAccessWeb.pas',
  TmriOutAccess in 'RMService\intf\TmriOutAccess.pas',
  Trans1 in 'RMService\intf\Trans1.pas',
  uDBService in 'DBService\uDBService.pas',
  uDecodeHikResult in 'Hik\uDecodeHikResult.pas',
  uSolr in 'SPService\uSolr.pas',
  uSPService in 'SPService\uSPService.pas',
  qjson in 'Common\qjson.pas',
  QString in 'Common\QString.pas',
  qrbtree in 'Common\qrbtree.pas',
  MessageDigest_5 in 'SPService\MessageDigest_5.pas',
  uSMS in 'SPService\uSMS.pas',
  QBAes in 'Common\QBAes.pas',
  ElAES in 'Common\ElAES.pas',
  uImportVio in 'SPService\uImportVio.pas',
  uWSManager in 'RMService\uWSManager.pas',
  TmriOutNewAccess in 'RMService\intf\TmriOutNewAccess.pas',
  uJKDefine in 'RMService\impl\uJKDefine.pas',
  uSurveilVio in 'SPService\uSurveilVio.pas',
  uExamService in 'ExamService\uExamService.pas',
  uHikJZF in 'Hik\uHikJZF.pas',
  uHikDSJ in 'Hik\uHikDSJ.pas',
  uHuiZhouKaoHe in 'SPService\uHuiZhouKaoHe.pas',
  LatLngHelper in 'Common\LatLngHelper.pas',
  uTmri_huizhou in 'RMService\impl\uTmri_huizhou.pas',
  uTmriType in 'RMService\impl\uTmriType.pas',
  Ehlservice in 'RMService\intf\Ehlservice.pas',
  uHikHumanFace in 'Hik\uHikHumanFace.pas',
  uOraHelper in 'Common\uOraHelper.pas';

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
  Application.CreateForm(TItsQTZ3Service, ItsQTZ3Service);
  Application.Run;

end.
