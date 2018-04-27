program InsideBorderSvc;

uses
  Vcl.SvcMgr,
  uMainSvc in 'uMainSvc.pas' {BorderInsideSvc: TService},
  uCommon in 'uCommon.pas',
  uScanThread in 'uScanThread.pas',
  uLogger in '..\OutSide\uLogger.pas',
  uSQLHelper in '..\OutSide\uSQLHelper.pas',
  uBllThread in 'uBllThread.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TBorderInsideSvc, BorderInsideSvc);
  Application.Run;
end.
