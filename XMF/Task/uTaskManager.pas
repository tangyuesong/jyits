unit uTaskManager;

interface

uses
  SysUtils, IOUtils, Classes, Generics.Collections, IniFiles,
  uBaseThread, uTypes, uGlobal;

type
  TTaskManager = class
  private
    FThreadList: TList<TBaseThread>;
    function LoadDJThreadConfig: TList<TDJThreadConfig>;
    procedure CreateDJThread;
  public
    constructor Create;
    destructor Destroy; override;
    procedure CreateThreads;
    procedure ClearThreads;
    procedure SuspendThreads;
    procedure ResumeThreads;
  end;

var
  TaskManager: TTaskManager;

implementation
uses
  uDJThread;

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

function TTaskManager.LoadDJThreadConfig: TList<TDJThreadConfig>;
var
  ASetup: TDJThreadConfig;
  ini: TIniFile;
  sections: TStringList;
  item: string;
begin
  result := TList<TDJThreadConfig>.Create;

  ini:= TIniFile.Create(TPath.Combine(ExtractFilePath(ParamStr(0)), 'Config.ini'));

  sections := TStringList.Create;
  ini.ReadSections(sections);
  for item in sections do
  begin
    if LowerCase(item).StartsWith('path_') then
    begin
      ASetup.BMDM := ini.ReadString(item, 'CJJG', '');
      ASetup.TPXZ := ini.ReadInteger(item, 'PictureSize', 1200000);
      ASetup.szfl := ini.ReadString(item, 'Manufacturer', '');
      ASetup.cqlj := ini.ReadString(item, 'SourcePath', '');
      ASetup.cqgz := ini.ReadString(item, 'Format', '');
      ASetup.sclj := ini.ReadString(item, 'TargetPath', '');
      ASetup.scurl := ini.ReadString(item, 'TargetUrl', '');
      ASetup.TargetUrlHik := ini.ReadString(item, 'TargetUrlHik', '');
      ASetup.KeyName := ini.ReadString(item, 'KeyName', '');
      ASetup.WFXW := ini.ReadString(item, 'WFXW', '');
      result.Add(ASetup);
    end;
  end;
  sections.Free;
  ini.Free;
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
  end;
  list.Free;
end;

procedure TTaskManager.CreateThreads;
begin
  CreateDJThread;
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
    Sleep(1000);
    allPaused := true;
    for item in FThreadList do
    begin
      allPaused := allPaused and item.Paused;
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
