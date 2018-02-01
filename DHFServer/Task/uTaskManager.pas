unit uTaskManager;

interface

uses
  SysUtils, IOUtils, Generics.Collections, DB, uBaseThread, uGlobal, uTypes,
  uCommon, uPassCounter;

type
  TTaskManager = class
  private
    FThreadList: TList<TBaseThread>;
    function LoadKKThreadConfig(KKStatus: string = '1'): TList<TKKThreadConfig>;
    function LoadDJThreadConfig: TList<TDJThreadConfig>;
    procedure CreateKKThread;
    procedure CreateDJThread;
    procedure CreateIdchinaThread;
    procedure CreateHikThread;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CreateThreads;
    procedure ClearThreads;
    procedure SuspendThreads;
    procedure ResumeThreads;
    function CheckDeadThread: boolean;
  end;

var
  TaskManager: TTaskManager;

implementation
uses
  uDJThread, uKKThread, uIdChinaPassThread, uIdChinaVioThread, uVio1344Thread,
  uHikThread;

constructor TTaskManager.Create;
begin
  FThreadList := TList<TBaseThread>.Create;
end;

destructor TTaskManager.Destroy;
begin
  ClearThreads;
  FThreadList.Free;
  inherited;
end;

function TTaskManager.LoadKKThreadConfig(KKStatus: string): TList<TKKThreadConfig>;
var
  config: TKKThreadConfig;
begin
  result := TList<TKKThreadConfig>.Create;
  with sqlhelper.Query('select * from T_KK_DBCONFIG where KKSTATUS=' + KKStatus) do
  begin
    while not eof do
    begin
      config.CJJG := FieldByName('CJJG').AsString;
      config.KKHost := FieldByName('KKHOST').AsString;
      config.KKPort := FieldByName('KKPORT').AsString;
      config.KKSID := FieldByName('KKSID').AsString;
      config.KKUserName := FieldByName('KKUSERNAME').AsString;
      config.KKPassword := FieldByName('KKPASSWORD').AsString;
      config.KKVEH_PASSREC := FieldByName('KKVEH_PASSREC').AsString;
      config.KKSOURCE := FieldByName('KKSOURCE').AsString;
      config.KKROWNUM := FieldByName('KKROWNUM').AsInteger;

      result.Add(config);
      Next;
    end;
    Free;
  end;
end;

function TTaskManager.LoadDJThreadConfig: TList<TDJThreadConfig>;
var
  ASetup: TDJThreadConfig;
begin
  result := TList<TDJThreadConfig>.Create;
  with sqlhelper.Query('select * from T_DJ_DBCONFIG where zt=1') do
  begin
    while not eof do
    begin
      ASetup.DBHost := FieldByName('DBHost').AsString;
      ASetup.DBPort := FieldByName('DBPort').AsString;
      ASetup.DBName := FieldByName('DBName').AsString;
      ASetup.DBUser := FieldByName('DBUser').AsString;
      ASetup.DBPwd := FieldByName('DBPwd').AsString;
      ASetup.KeyName := FieldByName('KEYNAME').AsString;
      result.Add(ASetup);

      Next;
    end;
    Free;
  end;
end;

procedure TTaskManager.CreateKKThread;
var
  list: TList<TKKThreadConfig>;
  config: TKKThreadConfig;
  thread: TKKThread;
begin
  vio1344Thread := TVio1344Thread.Create;
  list := LoadKKThreadConfig('1');
  for config in list do
  begin
    thread := TKKThread.Create(config);
    FThreadList.Add(thread);
  end;
  list.Free;
end;

procedure TTaskManager.CreateDJThread;
var
  list: TList<TDJThreadConfig>;
  config: TDJThreadConfig;
  thread: TDJThread;
begin
  list := LoadDJThreadConfig;
  for config in list do
  begin
    thread := TDJThread.Create(config);
    FThreadList.Add(thread);
    Sleep(5000);
  end;
  list.Free;
end;

procedure TTaskManager.CreateIdchinaThread;
var
  list: TList<TKKThreadConfig>;
  config: TKKThreadConfig;
  thread: TBaseThread;
begin
  list := LoadKKThreadConfig('2');
  for config in list do
  begin
    thread := TIdChinaPassThread.Create(config);
    FThreadList.Add(thread);
    Sleep(5000);
  end;
  list.Free;

  list := LoadKKThreadConfig('3');
  for config in list do
  begin
    thread := TIdChinaVioThread.Create(config);
    FThreadList.Add(thread);
    Sleep(5000);
  end;
  list.Free;
end;

procedure TTaskManager.CreateHikThread;
var
  list: TList<TKKThreadConfig>;
  config: TKKThreadConfig;
  thread: TBaseThread;
begin
  list := LoadKKThreadConfig('4');
  for config in list do
  begin
    thread := THikThread.Create(config);
    FThreadList.Add(thread);
    Sleep(5000);
  end;
  list.Free;
end;

procedure TTaskManager.CreateThreads;
begin
  if kk then
    CreateKKThread;
  if dj then
    CreateDJThread;
  if idchina then
    CreateIdchinaThread;
  if hik then
    CreateHikThread;
end;

function TTaskManager.CheckDeadThread: boolean;
var
  item: TBaseThread;
begin
  for item in FThreadList do
  begin
    if item.Status = tsDead then
    begin
      logger.Warn('Thread is Dead!!!  [' + item.ThreadID.ToString + ']'  + item.ClassName);
      FThreadList.Remove(item);
      item.FreeOnTerminate := true;
      item.Terminate;
      exit(false);
    end;
  end;
  exit(true);
end;

procedure TTaskManager.ClearThreads;
var
  item: TBaseThread;
  allFinished: boolean;
begin
  for item in FThreadList do
  begin
    item.Terminate;
  end;

  allFinished := false;
  while not allFinished do
  begin
    Sleep(1000);
    allFinished := true;
    for item in FThreadList do
    begin
      allFinished := allFinished and item.Finished;
    end;
  end;

  for item in FThreadList do
  begin
    item.Free;
  end;
  vio1344Thread.Stop;
  vio1344Thread.Terminate;
  FThreadList.Clear;
end;

procedure TTaskManager.SuspendThreads;
var
  item: TBaseThread;
  allPaused: boolean;
begin
  for item in FThreadList do
  begin
    item.Pause;
  end;

  allPaused := false;
  while not allPaused do
  begin
    Sleep(2000);
    allPaused := true;
    for item in FThreadList do
    begin
      allPaused := allPaused and ((item.Status = tsPaused)or(item.Status = tsDead));
      if not allPaused then
      begin
        logger.Info('wait for [' + item.ThreadID.ToString + ']' + item.ClassName);
      end;
    end;
  end;
end;

procedure TTaskManager.ResumeThreads;
var
  item: TBaseThread;
begin
  for item in FThreadList do
  begin
    item.GoOn;
  end;
end;

end.
