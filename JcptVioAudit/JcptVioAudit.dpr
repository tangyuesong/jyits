program JcptVioAudit;

uses
  Vcl.Forms,
  uCommon in 'uCommon.pas',
  uAudit in 'uAudit.pas' {frmAudit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAudit, frmAudit);
  Application.Run;
end.
