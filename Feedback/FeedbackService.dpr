program FeedbackService;

uses
  Vcl.SvcMgr,
  uMain in 'uMain.pas' {ItsFeedbackService: TService},
  uMainThread in 'uMainThread.pas',
  uLogger in '..\Common\uLogger.pas',
  uSQLHelper in '..\Common\uSQLHelper.pas',
  uCommon in 'uCommon.pas',
  uQTZHelper in 'uQTZHelper.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TItsFeedbackService, ItsFeedbackService);
  Application.Run;
end.
