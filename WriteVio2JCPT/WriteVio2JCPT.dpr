program WriteVio2JCPT;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uJCPT in 'uJCPT.pas',
  uJKDefine in 'impl\uJKDefine.pas',
  uRmInf in 'impl\uRmInf.pas',
  uRmWeb in 'impl\uRmWeb.pas',
  uTmri in 'impl\uTmri.pas',
  uTrans in 'impl\uTrans.pas',
  uXmlAndJSON in 'impl\uXmlAndJSON.pas',
  RmOutAccessInf in 'intf\RmOutAccessInf.pas',
  RmOutAccessWeb in 'intf\RmOutAccessWeb.pas',
  TmriOutAccess in 'intf\TmriOutAccess.pas',
  TmriOutNewAccess in 'intf\TmriOutNewAccess.pas',
  Trans1 in 'intf\Trans1.pas',
  uLogger in 'uLogger.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
