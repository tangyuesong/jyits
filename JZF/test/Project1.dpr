program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  cLockVio in '..\UploadVio\cLockVio.pas',
  uUploadVio in '..\UploadVio\uUploadVio.pas',
  uCommon in '..\Common\uCommon.pas',
  uJsonUtils in '..\Common\uJsonUtils.pas',
  uRequestItf in '..\Common\uRequestItf.pas',
  uGlobal in '..\Common\uGlobal.pas',
  uLogger in '..\Common\uLogger.pas',
  uSQLHelper in '..\Common\uSQLHelper.pas',
  uHBCVioThread in '..\HBCVio\uHBCVioThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
