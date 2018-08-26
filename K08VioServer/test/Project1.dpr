program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uPilotsafebeltThread in '..\uPilotsafebeltThread.pas',
  uCommon in '..\Common\uCommon.pas',
  uGlobal in '..\Common\uGlobal.pas',
  uLogger in '..\Common\uLogger.pas',
  uSQLHelper in '..\Common\uSQLHelper.pas',
  uDecodeHikResult in '..\uDecodeHikResult.pas',
  uHik in '..\uHik.pas',
  uEntity in '..\uEntity.pas',
  qjson in '..\Common\qjson.pas',
  qrbtree in '..\Common\qrbtree.pas',
  QString in '..\Common\QString.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
