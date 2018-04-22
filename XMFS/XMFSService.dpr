program XMFSService;

uses
  Vcl.SvcMgr,
  uMain in 'uMain.pas' {ItsXmfsService: TService},
  uLogger in '..\XMF\Common\uLogger.pas';

{$R *.RES}

begin
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TItsXmfsService, ItsXmfsService);
  Application.Run;
end.
