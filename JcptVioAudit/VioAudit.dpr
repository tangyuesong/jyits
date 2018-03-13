program VioAudit;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uSQLHelper in 'uSQLHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
