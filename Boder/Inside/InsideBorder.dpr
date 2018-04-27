program InsideBorder;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmain},
  uInterface in 'VioWsdl\uInterface.pas',
  uPublic in 'VioWsdl\uPublic.pas',
  uTmriOutAccess in 'VioWsdl\uTmriOutAccess.pas',
  itrffwebImpl in 'VioWsdl\itrffwebImpl.pas',
  uScanThread in 'uScanThread.pas',
  uCommon in 'uCommon.pas',
  uBllThread in 'uBllThread.pas',
  uSQLHelper in '..\OutSide\uSQLHelper.pas',
  uLogger in '..\OutSide\uLogger.pas',
  uCache in 'uCache.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmain, frmain);
  Application.Run;
end.
