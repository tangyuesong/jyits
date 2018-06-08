program BDRS;

uses
  Vcl.SvcMgr,
  uMainSvc in 'uMainSvc.pas' {BDRSSvc: TService},
  uCommon in 'uCommon.pas',
  uScanThread in 'uScanThread.pas',
  uLogger in '..\BDRC\uLogger.pas',
  uBllThread in 'uBllThread.pas',
  uEntity in '..\BDRC\uEntity.pas',
  uDM in '..\BDRC\uDM.pas' {DM: TDataModule};

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TBDRSSvc, BDRSSvc);
  Application.Run;
end.
