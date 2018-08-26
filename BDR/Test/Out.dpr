program Out;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uCommon in '..\BDRC\uCommon.pas',
  uLogger in '..\BDRC\uLogger.pas',
  uSQLHelper in '..\BDRC\uSQLHelper.pas',
  uEntity in '..\BDRC\uEntity.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
