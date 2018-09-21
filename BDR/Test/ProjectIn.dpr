program ProjectIn;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  uLogger in '..\BDRC\uLogger.pas',
  uCommon in '..\BDRS\uCommon.pas',
  uBllThread in '..\BDRS\uBllThread.pas',
  uScanThread in '..\BDRS\uScanThread.pas',
  uEntity in '..\BDRC\uEntity.pas',
  uDM in '..\BDRC\uDM.pas' {DM: TDataModule},
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
