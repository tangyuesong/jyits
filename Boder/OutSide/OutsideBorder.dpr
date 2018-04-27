program OutsideBorder;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmain},
  uCommon in 'uCommon.pas',
  uSQLHelper in 'uSQLHelper.pas',
  uLogger in 'uLogger.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfrmain, frmain);
  Application.Run;
end.
