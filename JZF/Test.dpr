program Test;

uses
  Vcl.Forms,
  uTestForm in 'uTestForm.pas' {Form3},
  qjson in 'Common\qjson.pas',
  qrbtree in 'Common\qrbtree.pas',
  QString in 'Common\QString.pas',
  uCommon in 'Common\uCommon.pas',
  uEntity in 'Common\uEntity.pas',
  uGlobal in 'Common\uGlobal.pas',
  uJsonUtils in 'Common\uJsonUtils.pas',
  uLogger in 'Common\uLogger.pas',
  uRequestItf in 'Common\uRequestItf.pas',
  uSQLHelper in 'Common\uSQLHelper.pas',
  uDecodeHikResult in 'Hik\uDecodeHikResult.pas',
  uHik in 'Hik\uHik.pas',
  uJTPThread in 'JTP\uJTPThread.pas',
  Ehlservice in 'D:\ÏîÄ¿\»ÝÖÝ\Source\QTZ3\RMService\intf\Ehlservice.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
