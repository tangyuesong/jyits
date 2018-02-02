unit uCommon;

interface

uses
  SysUtils, Classes, IniFiles, uGlobal, Rtti, uSQLHelper, uLogger, ADODB,
  System.JSON, DateUtils, syncobjs,
  Data.DB, System.Generics.Collections;

type

  TCommon = Class
  private
    class var cs: TCriticalSection;
    class function ReadConfig(): Boolean;
    class procedure LoadDevices();
    class procedure LoadHpzls();
  public
    class procedure ProgramInit;
    class procedure ProgramDestroy;
    class procedure SaveConfig(head, key, value: String);
    class function RecordListToJSON<T>(list: TList<T>): string; static;
    class function RecordToJSON<T>(rec: Pointer): string; static;
    class function StringToDT(s: String): TDatetime;
  end;

procedure SQLError(const SQL, Description: string);

implementation

class function TCommon.StringToDT(s: String): TDatetime;
var
  y, m, d, h, n, ss: word;
begin
  try
    s := Trim(s);
    if pos('.', s) > 0 then
      s := copy(s, 1, pos('.', s) - 1);

    if pos('/', s) > 1 then
    begin
      y := StrToInt(copy(s, 1, pos('/', s) - 1));
      s := Trim(copy(s, pos('/', s) + 1, Length(s)));
      m := StrToInt(copy(s, 1, pos('/', s) - 1));
      s := Trim(copy(s, pos('/', s) + 1, Length(s)));
    end
    else if pos('-', s) > 1 then
    begin
      y := StrToInt(copy(s, 1, pos('-', s) - 1));
      s := Trim(copy(s, pos('-', s) + 1, Length(s)));
      m := StrToInt(copy(s, 1, pos('-', s) - 1));
      s := Trim(copy(s, pos('-', s) + 1, Length(s)));
    end;
    d := StrToInt(copy(s, 1, pos(' ', s) - 1));
    s := Trim(copy(s, pos(' ', s) + 1, Length(s)));
    h := StrToInt(copy(s, 1, pos(':', s) - 1));
    s := Trim(copy(s, pos(':', s) + 1, Length(s)));
    n := StrToInt(copy(s, 1, pos(':', s) - 1));
    ss := StrToInt(Trim(copy(s, pos(':', s) + 1, Length(s))));

    Result := EncodeDateTime(y, m, d, h, n, ss, 0);
  except
    Result := EncodeDateTime(1901, 1, 1, 1, 1, 1, 0);
  end;
end;

class function TCommon.ReadConfig(): Boolean;
var
  dt: TDatetime;
begin
  Result := True;
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Config.ini') do
  begin
    gDBConfig.DBServer := ReadString('DB', 'Server', '.');
    gDBConfig.DBPort := ReadInteger('DB', 'Port', 1043);
    gDBConfig.DBUser := ReadString('DB', 'User', 'vioadmin');
    gDBConfig.DBPwd := ReadString('DB', 'Pwd', 'lgm1224,./');
    gDBConfig.DBName := ReadString('DB', 'Name', 'YjItsDB');

    gHikConfig.K08SearchURL := ReadString('Hik', 'K08SearchURL',
      'http://10.43.255.16:8080/kms/services/ws/vehicleSearch');
    gHikConfig.K08SaveUrl := ReadString('Hik', 'K08SaveUrl',
      'http://10.43.255.16:8080/kms/services/ws/falconOperateData?wsdl');
    gHikConfig.DFUrl := ReadString('Hik', 'DFUrl', 'http://10.43.255.20:18010');
    gHikConfig.DFUser := ReadString('Hik', 'DFUser', 'admin');
    gHikConfig.DFPwd := ReadString('Hik', 'DFPwd', 'Hik12345');

    gThreadConfig.PilotsafebeltThreadRun :=
      ReadString('Task', 'PilotsafebeltActive', '1') = '1';
    gThreadConfig.NoEntryThreadRun := ReadString('Task', 'NoEntryActive',
      '1') = '1';
    gThreadConfig.LC25NoEntryThreadRun :=
      ReadString('Task', 'LC25NoEntryActive', '1') = '1';
    gThreadConfig.PilotsafebeltStartTime :=
      ReadString('Task', 'PilotsafebeltStartTime', '2017-01-01T00:00:00.000Z');
    gThreadConfig.NoEntryStartTime := ReadString('Task', 'NoEntryStartTime',
      '2017-01-01T00:00:00.000Z');
    gThreadConfig.LC25NoEntryStartDate :=
      ReadString('Task', 'LC25NoEntryStartDate', '2017-01-01');

    gHeartbeatUrl := ReadString('Heartbeat', 'Url', 'http://127.0.0.1:20090/');
    gHeartbeatInterval := ReadInteger('Heartbeat', 'Interval', 3);

    if copy(gHeartbeatUrl, Length(gHeartbeatUrl), 1) <> '/' then
      gHeartbeatUrl := gHeartbeatUrl + '/';
    Free;
  end;
end;

class function TCommon.RecordListToJSON<T>(list: TList<T>): string;
var
  item: T;
  s: string;
begin
  for item in list do
  begin
    s := RecordToJSON<T>(@item);
    Result := Result + ',' + s;
  end;
  if Result <> '' then
  begin
    Result := Result.Substring(1);
    Result := '[' + Result + ']';
  end;
end;

class function TCommon.RecordToJSON<T>(rec: Pointer): string;
var
  rrt: TRttiRecordType;
  arr: TArray<TRTTIField>;
  Field: TRTTIField;
  FRTTICtx: TRTTIContext;
  s: string;
begin
  Result := '';
  rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
  arr := rrt.GetFields;
  for Field in arr do
  begin
    s := Field.GetValue(rec).ToString;
    if s <> '' then
      Result := Result + ',"' + Field.Name + '":"' + s + '"';
  end;
  Result := '{' + Result.Substring(1) + '}';
end;

class procedure TCommon.SaveConfig(head, key, value: String);
begin
  cs.Enter;
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Config.ini') do
  begin
    WriteString(head, key, value);
    Free;
  end;
  cs.Leave;
end;

procedure SQLError(const SQL, Description: string);
begin
  gLogger.Error(Description + #13#10 + SQL);
end;

class procedure TCommon.ProgramInit;
begin
  cs := TCriticalSection.Create;
  TCommon.ReadConfig();
  gSQLHelper := TSQLHelper.Create;
  gSQLHelper.DBServer := gDBConfig.DBServer;
  gSQLHelper.DBName := gDBConfig.DBName;
  gSQLHelper.DBUser := gDBConfig.DBUser;
  gSQLHelper.DBPwd := gDBConfig.DBPwd;
  gSQLHelper.OnError := SQLError;
  gDevList := TDictionary<string, TDevice>.Create;
  LoadDevices;
  gHpzlList := TDictionary<string, String>.Create;
  LoadHpzls;
  if not DirectoryExists(ExtractFilePath(Paramstr(0)) + 'log') then
    ForceDirectories(ExtractFilePath(Paramstr(0)) + 'log');
  gLogger := TLogger.Create(ExtractFilePath(Paramstr(0)) + 'log\K08Vio.log');
end;

class procedure TCommon.LoadDevices;
var
  dev: TDevice;
begin
  with gSQLHelper.Query('select * from S_Device where QYZT=''1'' ') do
  begin
    while not Eof do
    begin
      dev.ID := FieldByName('ID').AsString;
      dev.SBBH := FieldByName('SBBH').AsString;
      dev.CJJG := FieldByName('CJJG').AsString;
      gDevList.Add(dev.ID, dev);
      if FieldByName('AQDSB').AsBoolean then
        gThreadConfig.PilotsafebeltDev := gThreadConfig.PilotsafebeltDev +
          dev.ID + ' ';
      if FieldByName('DCXXZB').AsBoolean then
        gThreadConfig.NoEntryDev := gThreadConfig.NoEntryDev + dev.ID + ' ';
      if FieldByName('LC25ZB').AsBoolean then
        gThreadConfig.LC25NoEntryDev := gThreadConfig.LC25NoEntryDev +
          dev.ID + ' ';
      Next;
    end;
    Free;
  end;
  gThreadConfig.PilotsafebeltDev := Trim(gThreadConfig.PilotsafebeltDev);
  gThreadConfig.NoEntryDev := Trim(gThreadConfig.NoEntryDev);
  gThreadConfig.LC25NoEntryDev := Trim(gThreadConfig.LC25NoEntryDev);
end;

class procedure TCommon.LoadHpzls;
begin
  with gSQLHelper.Query('select * from D_K08 where FLBH=''HPZL'' ') do
  begin
    while not Eof do
    begin
      gHpzlList.Add(FieldByName('DM').AsString, FieldByName('MineKey')
        .AsString);
      Next;
    end;
    Free;
  end;

end;

class procedure TCommon.ProgramDestroy;
begin
  gSQLHelper.Free;
  gLogger.Free;
  gDevList.Free;
  gHpzlList.Free;
  cs.Free;
end;

end.
