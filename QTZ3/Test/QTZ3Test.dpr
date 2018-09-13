program QTZ3Test;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  qjson in '..\Common\qjson.pas',
  qrbtree in '..\Common\qrbtree.pas',
  QString in '..\Common\QString.pas',
  uCommon in '..\Common\uCommon.pas',
  uEntity in '..\Common\uEntity.pas',
  uGlobal in '..\Common\uGlobal.pas',
  uLogger in '..\Common\uLogger.pas',
  uSQLHelper in '..\Common\uSQLHelper.pas',
  uTokenManager in '..\Common\uTokenManager.pas',
  uDBService in '..\DBService\uDBService.pas',
  uDecodeHikResult in '..\Hik\uDecodeHikResult.pas',
  uHik in '..\Hik\uHik.pas',
  uRmService in '..\RMService\uRmService.pas',
  uRmInf in '..\RMService\impl\uRmInf.pas',
  uRmWeb in '..\RMService\impl\uRmWeb.pas',
  uTmri in '..\RMService\impl\uTmri.pas',
  uTrans in '..\RMService\impl\uTrans.pas',
  uXmlAndJSON in '..\RMService\impl\uXmlAndJSON.pas',
  RmOutAccessInf in '..\RMService\intf\RmOutAccessInf.pas',
  RmOutAccessWeb in '..\RMService\intf\RmOutAccessWeb.pas',
  TmriOutAccess in '..\RMService\intf\TmriOutAccess.pas',
  Trans1 in '..\RMService\intf\Trans1.pas',
  MessageDigest_5 in '..\SPService\MessageDigest_5.pas',
  uAnalysisPic in '..\SPService\uAnalysisPic.pas',
  uLockVio in '..\SPService\uLockVio.pas',
  uSMS in '..\SPService\uSMS.pas',
  uSolr in '..\SPService\uSolr.pas',
  uSPService in '..\SPService\uSPService.pas',
  uVehPass in '..\SPService\uVehPass.pas',
  ElAES in '..\Common\ElAES.pas',
  QBAes in '..\Common\QBAes.pas',
  uImportVio in '..\SPService\uImportVio.pas',
  uWSManager in '..\RMService\uWSManager.pas',
  TmriOutNewAccess in '..\RMService\intf\TmriOutNewAccess.pas',
  uJKDefine in '..\RMService\impl\uJKDefine.pas',
  uSurveilVio in '..\SPService\uSurveilVio.pas',
  uExamService in '..\ExamService\uExamService.pas',
  uHikDSJ in '..\Hik\uHikDSJ.pas',
  uHikJZF in '..\Hik\uHikJZF.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
