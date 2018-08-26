program ProjectIn;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  uLogger in '..\BDRC\uLogger.pas',
  uSQLHelper in '..\BDRC\uSQLHelper.pas',
  uCommon in '..\BDRS\uCommon.pas',
  uBllThread in '..\BDRS\uBllThread.pas',
  uScanThread in '..\BDRS\uScanThread.pas',
  uEntity in '..\BDRC\uEntity.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
