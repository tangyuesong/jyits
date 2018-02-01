unit uLogger;

interface

uses
  Classes, Windows, SysUtils, Messages, syncobjs;

type
  TLogger = class
  private
    FLogFileName: string;
    FLogStream: TStream;
    FMaxFileSize: integer;
    FMaxBackupIndex: integer;
    FLevel: integer;

    cs: TCriticalSection;
    procedure DoBackup;
    function FindFiles(path: String): TStrings;
    procedure ProcessMessages;
  public
    constructor Create(ALogFile: string);
    destructor Destroy; override;
    procedure logging(AMsg: string; ALevel: integer);
    procedure Debug(AMsg: string);
    procedure Error(AMsg: string);
    procedure Fatal(AMsg: string);
    procedure Info(AMsg: string);
    procedure Trace(AMsg: string);
    procedure Warn(AMsg: string);
    property MaxFileSize: integer read FMaxFileSize write FMaxFileSize;     // 日志文件大小
    property MaxBackupIndex: integer read FMaxBackupIndex write FMaxBackupIndex;  // 备份文件个数
    property Level: integer read FLevel write FLevel;
  end;
var
  logger: TLogger;
implementation

{ TLogger }

function TLogger.FindFiles(path: String): TStrings;
var
  sr:TSearchRec;
begin
  Result := TStringList.Create;

  if FindFirst(path, faAnyFile, sr)=0 then
  begin
    repeat
      if (sr.Attr and faDirectory) = 0 then
      begin
        Result.Add(sr.Name);
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TLogger.DoBackup;
var
  path, fullFilename, s: string;
  files: TStrings;
  i, j, m, n: integer;
begin
  FLogStream.Free;
  path := ExtractFilePath(FLogFileName);
  files := self.FindFiles(FLogFilename+'.*');
  // 排序
  for i := 0 to files.Count -  2 do
  begin
    for j := i + 1 to files.Count -  1 do
    begin
      s := ExtractFileExt(path + files[i]);
      n := strtointdef(copy(s, 2, length(s)), 0);
      s := ExtractFileExt(path + files[j]);
      m := strtointdef(copy(s, 2, length(s)), 0);
      if m > n then
      begin
        s := files[i];
        files[i] := files[j];
        files[j] := s;
      end;
    end;
  end;

  for i := 0 to files.Count-10 do
  begin
    DeleteFile(path + files[i]);
    files.Delete(0);
  end;

  for i := 0 to files.Count - 1 do
  begin
    fullFilename := path + files[i];
    s := ExtractFileExt(fullFilename);
    n := strtointdef(copy(s, 2, length(s)), 0);
    if (n = 0) and (fullFilename <> FLogFilename) then break;
    Renamefile(fullFilename, FLogFileName + '.' + inttostr(files.Count - i));
  end;
  files.Free;

  if not FileExists(FLogFileName) then
  begin
    FLogStream := TFileStream.Create(FLogFileName, fmCreate);
    FLogStream.Free;
  end;
  FLogStream := TFileStream.Create(FLogFileName, fmOpenReadWrite or fmShareDenyWrite);
end;

constructor TLogger.Create(ALogFile: string);
begin
  cs := TCriticalSection.Create;
  FLevel := 0;
  FMaxFileSize := 2;
  FMaxBackupIndex := 10;
  self.FLogFileName := ALogFile;
  if not FileExists(ALogFile) then
  begin
    ForceDirectories(ExtractFilePath(ALogFile));
    FLogStream := TFileStream.Create(ALogFile, fmCreate);
    FLogStream.Free;
  end;
  FLogStream := TFileStream.Create(ALogFile, fmOpenReadWrite or fmShareDenyWrite);
  FLogStream.Position := FLogStream.Size;
end;

destructor TLogger.Destroy;
begin
  FLogStream.Free;
  cs.Free;
  inherited;
end;

procedure TLogger.Trace(AMsg: string);
begin
  logging(AMsg, 0);
end;

procedure TLogger.Debug(AMsg: string);
begin
  logging(AMsg, 1);
end;

procedure TLogger.Info(AMsg: string);
begin
  logging(AMsg, 2);
end;

procedure TLogger.Warn(AMsg: string);
begin
  logging(AMsg, 3);
end;

procedure TLogger.Error(AMsg: string);
begin
  logging(AMsg, 4);
end;

procedure TLogger.Fatal(AMsg: string);
begin
  logging(AMsg, 5);
end;

procedure TLogger.logging(AMsg: string; ALevel: integer);
var
  s, sLevel, sThreadId: string;
  Buffer: TBytes;
begin
  if ALevel < FLevel then exit;

  case ALevel of
  0: sLevel := '[TRACE] ';
  1: sLevel := '[DEBUG] ';
  2: sLevel := '[INFO ] ';
  3: sLevel := '[WARN ] ';
  4: sLevel := '[ERROR] ';
  5: sLevel := '[FATAL] ';
  else sLevel := '[DEBUG] ';
  end;
  sThreadId := inttostr(GetCurrentThreadId);
  sThreadId := sThreadId + Copy('     ', Length(sThreadId) + 1, 10);
  sThreadId := ' [' + sThreadId + '] ';
  s := formatdatetime('yy-mm-dd hh:mm:ss,zzz', now) + sThreadId + sLevel + AMsg + #13#10;

  cs.Enter;

  if FLogStream.Size > FMaxFileSize * 1024 * 1024 then
    DoBackup;                          // 备份

  Buffer := TEncoding.ANSI.GetBytes(s);
  FLogStream.WriteBuffer(Buffer, Length(Buffer));

  cs.Leave;
end;

procedure TLogger.ProcessMessages;
var
  Msg: TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

end.
