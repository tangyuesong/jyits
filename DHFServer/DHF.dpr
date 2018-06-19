program DHF;

uses
  Vcl.Forms,
  Unit9 in 'Unit9.pas' {Form9},
  uLogger in 'Common\uLogger.pas',
  uGlobal in 'Common\uGlobal.pas',
  uCommon in 'Common\uCommon.pas',
  uTypes in 'Common\uTypes.pas',
  uBaseThread in 'Task\uBaseThread.pas',
  uTaskManager in 'Task\uTaskManager.pas',
  uDJThread in 'Task\uDJThread.pas',
  uPassCounter in 'Task\uPassCounter.pas',
  UInterface in 'Task\UInterface.pas',
  uKKThread in 'Task\uKKThread.pas',
  MessageDigest_5 in 'Common\MessageDigest_5.pas',
  uPassList in 'Common\uPassList.pas',
  uVio1344Thread in 'Task\uVio1344Thread.pas',
  //uQTZHelper in 'Common\uQTZHelper.pas',
  Trans1 in 'Trans\Trans1.pas',
  uTrans in 'Trans\uTrans.pas',
  TmriOutAccess in 'Tmri\TmriOutAccess.pas',
  uTmri in 'Tmri\uTmri.pas',
  uHoleService in 'Task\uHoleService.pas',
  uHikThread in 'Task\uHikThread.pas',
  uIdChinaPassThread in 'Task\uIdChinaPassThread.pas',
  uIdChinaVioThread in 'Task\uIdChinaVioThread.pas',
  uImageOps in 'Common\uImageOps.pas',
  MyImage in 'Task\MyImage.pas',
  uSQLHelper in 'Common\uSQLHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
