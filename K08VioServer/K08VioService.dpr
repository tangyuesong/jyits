program K08VioService;

uses
  Vcl.SvcMgr,
  uMain in 'uMain.pas' {ItsK08VioService: TService},
  uPilotsafebeltThread in 'uPilotsafebeltThread.pas',
  uCommon in 'Common\uCommon.pas',
  uGlobal in 'Common\uGlobal.pas',
  uLogger in 'Common\uLogger.pas',
  uSQLHelper in 'Common\uSQLHelper.pas',
  uHik in 'uHik.pas',
  uDecodeHikResult in 'uDecodeHikResult.pas',
  uEntity in 'uEntity.pas',
  qjson in 'Common\qjson.pas',
  qrbtree in 'Common\qrbtree.pas',
  QString in 'Common\QString.pas',
  u2To5NoEntry in 'u2To5NoEntry.pas',
  uNoEntryThread in 'uNoEntryThread.pas',
  uUPhoneThread in 'uUPhoneThread.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TItsK08VioService, ItsK08VioService);
  Application.Run;
end.
