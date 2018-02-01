unit uLogCheck;

interface

uses
  Windows, SysUtils, Classes, IOUtils, Types, Generics.Collections, DateUtils;

type
  TLogCheckResult = (
    CR_OK = 0,
    CR_FILE_NOT_EXISTS = 1,
    CR_FILE_IS_EMPTY = 2,
    CR_TIMEOUT = 3,
    CR_THREAD_MISS = 4,
    CR_ERROR = 5
  );

  TLogRecord = record
    Time: double;
    ThreadID: string;
    Level: string;
    Text: string;
    class function StrToLogRecord(s: string): TLogRecord; static;
  end;

  TLogCheck = class
  private
    FThreadIds: string;
    FTimeOut: integer;
    FLogFile: string;
    FAppName: string;
    FID: integer;
    function ReadLogFile: TStrings;
  public
    function Check: TLogCheckResult;
    function GetThreads: string;
    property AppName: string read FAppName write FAppName;
    property LogFile: string read FLogFile write FLogFile;
    property ThreadIds: string read FThreadIds write FThreadIds;
    property TimeOut: integer read FTimeOut write FTimeOut;
    property ID: integer read FID write FID;
  end;
implementation

{ TLogCheck }

function TLogCheck.GetThreads: string;
var
  I: Integer;
  log: TLogRecord;
  ss: TStrings;
  threadids, names, nameStr: string;
begin
  threadids := '';
  names := '';
  ss := ReadLogFile;
  for I := ss.Count - 1 downto 0 do
  begin
    log := TLogRecord.StrToLogRecord(ss[i]);
    if log.Time > 0 then
    begin
      if log.Text.Contains('start') or log.Text.Contains('Start') then
      begin
        nameStr := log.Text.ToLower.Replace('start', '');
        if not names.Contains(nameStr) then
        begin
          names := names + ',' + nameStr;
          threadids := threadids + ',' + log.ThreadID;
        end;
      end;
    end;
  end;
  result := threadids + ' ' + names;
end;

function TLogCheck.ReadLogFile: TStrings;
var
  h: THandle;
  stream: TStream;
begin
  h := CreateFile(pchar(LogFile), GENERIC_READ, FILE_SHARE_READ + FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Stream := TFileStream.Create(h);
  result := TStringList.Create;
  result.LoadFromStream(Stream);
  Stream.Free;
end;

function TLogCheck.Check: TLogCheckResult;
var
  log: TLogRecord;
  dic: TDictionary<string, double>;
  i, threadCount, errCount: integer;
  sl: TStrings;
begin
  if not TFile.Exists(LogFile) then
    exit(CR_FILE_NOT_EXISTS);
  sl := ReadLogFile;
  if sl.Count <20 then
  begin
    sl.Free;
    exit(CR_FILE_IS_EMPTY);
  end;

  dic := TDictionary<string, double>.Create;
  threadCount := Length(ThreadIDs.Split([',']));
  errCount := 0;
  i := sl.Count - 1;
  while i>=0 do
  begin
    log := TLogRecord.StrToLogRecord(sl[i]);
    if log.Time > 0 then
    begin
      if log.Level = 'ERROR' then
      begin
        Inc(errCount);
        if (errCount > 5) and (errCount*100/(sl.Count - i)>10) then
        begin
          dic.Free;
          sl.Free;
          exit(CR_ERROR);
        end;
      end;
      if (not dic.ContainsKey(log.ThreadID))and(ThreadIDs.Contains(log.ThreadID)) then
      begin
        if now - log.Time > OneMinute * TimeOut then
        begin
          dic.Free;
          sl.Free;
          exit(CR_TIMEOUT);
        end;
        dic.Add(log.ThreadID, log.Time);
        if dic.Count = threadCount then
        begin
          dic.Free;
          sl.Free;
          exit(CR_OK);
        end;
      end;
    end;
    i := i - 1;
  end;
  dic.Free;
  sl.Free;
  exit(CR_THREAD_MISS);
end;

{ TLogRecord }

class function TLogRecord.StrToLogRecord(s: string): TLogRecord;
var
  AFormatSettings: TFormatSettings;
  t: string;
begin
  result.Time := 0;
  if Length(s) < 37 then exit;
  AFormatSettings.DateSeparator := '-';
  AFormatSettings.TimeSeparator := ':';
  AFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  AFormatSettings.LongDateFormat := 'yyyy-mm-dd';
  AFormatSettings.ShortTimeFormat := 'hh:nn:ss';
  AFormatSettings.LongTimeFormat := 'hh:nn:ss,zzz';
  t := '20' + Copy(s, 1, 21);
  result.Time := StrToDateTimeDef(t, 0, AFormatSettings);
  if result.Time > 0 then
  begin
    result.ThreadID := trim(Copy(s, 24, 5));
    result.Level := copy(s, 32, 5);
    result.Text := copy(s, 39, 100);
  end;

end;

end.
