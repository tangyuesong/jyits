program HBCecqr;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {Form13},
  QBAes in 'QBAes.pas',
  Itrffweb1 in 'Itrffweb1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
