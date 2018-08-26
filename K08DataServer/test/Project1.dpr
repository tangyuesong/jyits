program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uDecodeHikResult in '..\uDecodeHikResult.pas',
  uHik in '..\uHik.pas',
  uSaveK08Thread in '..\uSaveK08Thread.pas',
  uCommon in '..\Common\uCommon.pas',
  uEntity in '..\Common\uEntity.pas',
  uGlobal in '..\Common\uGlobal.pas',
  uLogger in '..\Common\uLogger.pas',
  uSQLHelper in '..\Common\uSQLHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
