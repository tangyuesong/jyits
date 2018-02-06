unit uCommon;

interface

uses
  SysUtils, Classes, IniFiles, uGlobal, Rtti, uSQLHelper, uLogger, ADODB,
  System.JSON, DateUtils, syncobjs, uEntity,
  Data.DB, System.Generics.Collections;

type

  TCommon = Class
  private
    class var cs: TCriticalSection;
    class function ReadConfig(): Boolean;
    class procedure LoadDevices();
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

    gStartTime := ReadString('Task', 'StartTime', FormatDateTime('yyyymmddhh',
      Now() - 1 / 24));
    gCJJG := ReadString('Task', 'CJJG', '4451');
    gTaskMi := ReadString('Task', 'Mi', '50');

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
  gDicDevice := TDictionary<string, TDevice>.Create;
  LoadDevices;
  if not DirectoryExists(ExtractFilePath(Paramstr(0)) + 'log') then
    ForceDirectories(ExtractFilePath(Paramstr(0)) + 'log');
  gLogger := TLogger.Create(ExtractFilePath(Paramstr(0)) + 'log\K08Data.log');
end;

class procedure TCommon.LoadDevices;
var
  s: string;
  dev: TDevice;
begin
  s := 'select * from s_device where qyzt=1 ';
  // and Left(CJJG,' + Length(gCJJG).ToString + ')=' + gCJJG.QuotedString;
  with gSQLHelper.Query(s) do
  begin
    while not Eof do
    begin
      if not gDicDevice.ContainsKey(FieldByName('SBBH').AsString) then
      begin
        dev := TDevice.Create;
        dev.sbbh := FieldByName('SBBH').AsString;
        dev.BABH := FieldByName('JCPTBABH').AsString;
        dev.FXBH := FieldByName('JCPTBAFX').AsString;
        dev.LKBH := FieldByName('LKBH').AsString;
        dev.LKMC := FieldByName('LKMC').AsString;
        dev.FXMC := FieldByName('FXMC').AsString;
        dev.cjjg := FieldByName('CJJG').AsString;
        dev.SBDDMC := FieldByName('SBDDMC').AsString;
        dev.SBJD := FieldByName('SBJD').AsString;
        dev.SBWD := FieldByName('SBWD').AsString;
        dev.SBIP := FieldByName('SBIP').AsString;
        dev.SBCJ := FieldByName('SBCJ').AsString;
        dev.CSLXR := FieldByName('CSLXR').AsString;
        dev.LXFS := FieldByName('LXFS').AsString;
        dev.QYSJ := FieldByName('QYSJ').AsString;
        dev.JDJG := FieldByName('JDJG').AsString;
        dev.JDBH := FieldByName('JDBH').AsString;
        dev.JDYXQ := FieldByName('JDYXQ').AsDateTime;
        dev.QYRQ := FieldByName('QYRQ').AsDateTime;
        dev.XZSD := FieldByName('XZSD').AsInteger;
        dev.DCXZSD := FieldByName('DCXZSD').AsInteger;
        dev.QSSBBH := FieldByName('QSSBBH').AsString;
        dev.SBLX := FieldByName('SBLX').AsString;
        dev.LDBH := FieldByName('LDBH').AsString;
        dev.LHY_XZQH := FieldByName('LHY_XZQH').AsString;
        dev.LHY_WFDD := FieldByName('LHY_WFDD').AsString;
        dev.LHY_SBBH := FieldByName('LHY_SBBH').AsString;
        dev.LHY_LDDM := FieldByName('LHY_LDDM').AsString;
        dev.LHY_DDMS := FieldByName('LHY_DDMS').AsString;
        dev.LHY_CJFS := FieldByName('LHY_CJFS').AsString;
        dev.LHY_JPGH := FieldByName('LHY_JPGH').AsInteger;
        dev.LHY_JPGW := FieldByName('LHY_JPGW').AsInteger;
        dev.LHY_JPGQ := FieldByName('LHY_JPGQ').AsString;
        dev.QYZT := FieldByName('QYZT').AsBoolean;
        dev.ZJZT := FieldByName('ZJZT').AsBoolean;
        dev.SCJCPT := FieldByName('SCJCPT').AsBoolean;
        dev.TPGS := FieldByName('TPGS').AsString;
        dev.WFXW := FieldByName('WFXW').AsString;
        dev.BZ := FieldByName('BZ').AsString;
        dev.gxsj := FieldByName('GXSJ').AsDateTime;
        dev.TPXZ := FieldByName('TPXZ').AsBoolean;
        dev.XYSB := FieldByName('XYSB').AsBoolean;
        dev.AQDSB := FieldByName('AQDSB').AsBoolean;
        dev.XYSB := FieldByName('XYSB').AsBoolean;
        dev.HBCZB := FieldByName('HBCZB').AsInteger = 2;
        dev.XXZB := FieldByName('XXZB').AsBoolean;
        dev.DCXXZB := FieldByName('DCXXZB').AsBoolean;
        dev.YSXZB := FieldByName('YSXZB').AsBoolean;
        dev.XSZB := FieldByName('XSZB').AsBoolean;
        dev.ID := FieldByName('ID').AsString;
        dev.Changed := false;

        gDicDevice.Add(dev.sbbh, dev);
      end;
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.ProgramDestroy;
begin
  gSQLHelper.Free;
  gLogger.Free;
  gDicDevice.Free;
  cs.Free;
end;

end.
