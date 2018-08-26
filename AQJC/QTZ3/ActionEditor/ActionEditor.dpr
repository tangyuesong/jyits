program ActionEditor;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  qjson in 'qjson.pas',
  qrbtree in 'qrbtree.pas',
  QString in 'QString.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
