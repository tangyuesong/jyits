program OutsideBorderSvc;

uses
  Vcl.SvcMgr,
  uMainSvc in 'uMainSvc.pas' {BoderSvc: TService},
  uCommon in 'uCommon.pas',
  uLogger in 'uLogger.pas',
  uSQLHelper in 'uSQLHelper.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TBoderSvc, BoderSvc);
  Application.Run;
end.
