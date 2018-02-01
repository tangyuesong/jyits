program JCPT;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uMainThread in '..\uMainThread.pas',
  uCommon in '..\uCommon.pas',
  uLogger in '..\..\Common\uLogger.pas',
  uSQLHelper in '..\..\Common\uSQLHelper.pas',
  uQTZHelper in '..\uQTZHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
