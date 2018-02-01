program itsMonitor;

uses
  Vcl.Forms,
  uFormMain in 'uFormMain.pas' {Form2},
  uLogCheck in 'uLogCheck.pas',
  MessageDigest_5 in '..\DHFServer\Common\MessageDigest_5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
