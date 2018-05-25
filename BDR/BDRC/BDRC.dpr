program BDRC;

uses
  Vcl.SvcMgr,
  uMainSvc in 'uMainSvc.pas' {BDRCSvc: TService},
  uCommon in 'uCommon.pas',
  uLogger in 'uLogger.pas',
  uSQLHelper in 'uSQLHelper.pas',
  uEntity in 'uEntity.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TBDRCSvc, BDRCSvc);
  Application.Run;
end.
