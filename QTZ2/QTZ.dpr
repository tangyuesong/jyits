program QTZ;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
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
  uTokenManager in 'uTokenManager.pas',
  uJKDefine in 'rm\impl\uJKDefine.pas',
  TmriOutNewAccess in 'rm\intf\TmriOutNewAccess.pas',
  uWSManager in 'uWSManager.pas',
  TmriOutAccess1 in 'rm\intf\TmriOutAccess1.pas',
  VioSurveil in 'rm\intf\VioSurveil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
