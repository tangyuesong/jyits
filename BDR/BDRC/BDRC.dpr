program BDRC;

uses
  Vcl.SvcMgr,
  uMainSvc in 'uMainSvc.pas' {BDRCSvc: TService},
  uCommon in 'uCommon.pas',
  uLogger in 'uLogger.pas',
  uEntity in 'uEntity.pas',
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TBDRCSvc, BDRCSvc);
  Application.Run;
end.
