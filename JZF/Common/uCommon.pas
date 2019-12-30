unit uCommon;

interface

uses
  SysUtils, Classes, IniFiles, uGlobal, Rtti, uSQLHelper, uLogger, ADODB,
  System.JSON, Winapi.WinSock, Winapi.Windows, QJson,
  Data.DB, System.Generics.Collections, DateUtils;

type

  TCommon = Class
  private
    class function ReadConfig(): Boolean;
    class function GetClientAddr: string;
  public
    class procedure ProgramInit;
    class procedure ProgramDestroy;
    class function RecordListToJSON<T>(list: TList<T>): string; static;
    class function RecordToJSON<T>(rec: Pointer): string; static;
    class function StringToDT(s: String): TDatetime;
    class function FindJson(AItemName: String; AJSON: TQJson): TQJson; static;
    class function GetJsonNode(ANode, AJSON: String): String; static;
  end;

procedure SQLError(const SQL, Description: string);

implementation

class function TCommon.GetClientAddr: string;
var
  wVersionRequested: word;
  wsaData: TWSAData;
  p: PHostEnt;
  s: array [0 .. 128] of ansichar;
  p2: pansichar;
  OutPut: array [0 .. 100] of ansichar;
begin
  wVersionRequested := MAKEWORD(1, 1);
  WSAStartup(wVersionRequested, wsaData);

  GetHostName(@s, 128);
  p := GetHostByName(s);

  p2 := iNet_ntoa((PInAddr(p^.h_addr_list^))^);
  StrPCopy(OutPut, Format('%s', [p2]));
  WSACleanup;
  Result := OutPut;
end;

class function TCommon.GetJsonNode(ANode, AJSON: String): String;
var
  item, JSON: TQJson;
begin
  Result := '';
  JSON := TQJson.Create;
  try
    JSON.Parse(AJSON);
    item := FindJson(ANode, JSON);
    if item <> nil then
      Result := item.ToString;
  except
    on e: Exception do
    begin
      Result := AJSON;
      gLogger.Error('[TCommon.GetJsonNode]' + e.Message + AJSON);
    end;
  end;
  JSON.Free;
end;

class function TCommon.FindJson(AItemName: String; AJSON: TQJson): TQJson;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to AJSON.Count - 1 do
  begin
    if UpperCase(AJSON.Items[i].Name) = UpperCase(AItemName) then
      Result := AJSON.Items[i]
    else
      Result := FindJson(AItemName, AJSON.Items[i]);
    if Result <> nil then
      break;
  end;
end;

class function TCommon.ReadConfig(): Boolean;
var
  ts: TStrings;
  i: Integer;
begin
  ts := TStringList.Create;
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Config.ini') do
  begin
    gConfig.DBServer := ReadString('DB', 'Server', '.');
    gConfig.DBPort := ReadInteger('DB', 'Port', 1043);
    gConfig.DBUser := ReadString('DB', 'User', 'vioadmin');
    gConfig.DBPwd := ReadString('DB', 'Pwd', 'lgm1224,./');
    gConfig.DBName := ReadString('DB', 'Name', 'YjItsDB');
    gConfig.DBNamePass := ReadString('DB', 'NamePass', 'PassDB');
    gConfig.QTZDB := ReadString('QTZ', 'DBURL', 'http://127.0.0.1:20086');
    gConfig.QTZRM := ReadString('QTZ', 'RMURL', 'http://127.0.0.1:20088');

    gJQOraConfig.DBServer := ReadString('JQ', 'Server', '');
    gJQOraConfig.DBPort := ReadInteger('JQ', 'Port', 1521);
    gJQOraConfig.DBUser := ReadString('JQ', 'User', 'dcc_query');
    gJQOraConfig.DBPwd := ReadString('JQ', 'Pwd', 'dcc_query');
    gJQOraConfig.DBName := ReadString('JQ', 'Name', 'orajzyyk');

    gUploadVio := ReadInteger('PROJECT', 'UploadVio', 0) = 1;
    gJZF := ReadInteger('PROJECT', 'JZF', 0) = 1;
    gJQ := ReadInteger('PROJECT', 'JQ', 0) = 1;
    gHBC := ReadInteger('PROJECT', 'HBC', 0) = 1;
    gWNJ := ReadInteger('PROJECT', 'WNJ', 0) = 1;
    gKKALARM := ReadInteger('PROJECT', 'KKALARM', 0) = 1;
    gJTP := ReadInteger('PROJECT', 'JTP', 0) = 1;
    gJinXing := ReadInteger('PROJECT', 'JinXing', 0) = 1;

    gSumSpot := ReadInteger('PROJECT', 'SPOT', 0) = 1;
    gSumZdwf := ReadInteger('PROJECT', 'ZDWF', 0) = 1;

    JTPRunning := false;

    gUploadTempVio := ReadInteger('PROJECT', 'UPLOADTEMPVIO', 0) = 1;

    gZBDX := ReadInteger('PROJECT', 'ZBDX', 0) = 1;
    gZBDXTime := ReadString('PROJECT', 'ZBDXTime', '2000');

    gHikConfig.K08SearchURL := ReadString('Hik', 'K08SearchURL',
      'http://10.43.255.16:8080/kms/services/ws/vehicleSearch');
    gHikConfig.K08SaveUrl := ReadString('Hik', 'K08SaveUrl',
      'http://10.43.255.16:8080/kms/services/ws/falconOperateData?wsdl');
    gHikConfig.DFUrl := ReadString('Hik', 'DFUrl', 'http://10.43.255.20:18010');
    gHikConfig.DFUser := ReadString('Hik', 'DFUser', 'admin');
    gHikConfig.DFPwd := ReadString('Hik', 'DFPwd', 'Hik12345');

    gHeartbeatUrl := ReadString('Heartbeat', 'Url', 'http://127.0.0.1:20090/');
    gHeartbeatInterval := ReadInteger('Heartbeat', 'Interval', 3);

    if Copy(gHeartbeatUrl, Length(gHeartbeatUrl), 1) <> '/' then
      gHeartbeatUrl := gHeartbeatUrl + '/';

    gUploadHisCfg.ACTIVATE := ReadString('UPLOADHIS', 'ACTIVATE', '0') = '1';
    gUploadHisCfg.DAY := ReadInteger('UPLOADHIS', 'DAY', 0);
    gUploadHisCfg.TIME := ReadInteger('UPLOADHIS', 'TIME', 0);
    gUploadHisCfg.WFXW := ReadString('UPLOADHIS', 'WFXW', '');

    // gDeviceMonitorSJHM := ReadString('DeviceMonitor', 'SJHM', '');

    ReadSectionValues('DeviceMonitor', ts);
    for i := 0 to ts.Count - 1 do
    begin
      if not gDeviceMonitorSJHM.ContainsKey(ts.Names[i]) then
        gDeviceMonitorSJHM.Add(ts.Names[i], ts.ValueFromIndex[i]);
    end;
    Free;
  end;
  ts.Free;
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

class function TCommon.StringToDT(s: String): TDatetime;
var
  y, m, d, h, n, ss: word;
begin
  try
    s := Trim(s);
    if pos('.', s) > 0 then
      s := Copy(s, 1, pos('.', s) - 1);

    if pos('/', s) > 1 then
    begin
      y := StrToInt(Copy(s, 1, pos('/', s) - 1));
      s := Trim(Copy(s, pos('/', s) + 1, Length(s)));
      m := StrToInt(Copy(s, 1, pos('/', s) - 1));
      s := Trim(Copy(s, pos('/', s) + 1, Length(s)));
    end
    else if pos('-', s) > 1 then
    begin
      y := StrToInt(Copy(s, 1, pos('-', s) - 1));
      s := Trim(Copy(s, pos('-', s) + 1, Length(s)));
      m := StrToInt(Copy(s, 1, pos('-', s) - 1));
      s := Trim(Copy(s, pos('-', s) + 1, Length(s)));
    end;
    d := StrToInt(Copy(s, 1, pos(' ', s) - 1));
    s := Trim(Copy(s, pos(' ', s) + 1, Length(s)));
    h := StrToInt(Copy(s, 1, pos(':', s) - 1));
    s := Trim(Copy(s, pos(':', s) + 1, Length(s)));
    n := StrToInt(Copy(s, 1, pos(':', s) - 1));
    ss := StrToInt(Trim(Copy(s, pos(':', s) + 1, Length(s))));

    Result := EncodeDateTime(y, m, d, h, n, ss, 0);
  except
    Result := EncodeDateTime(1900, 1, 1, 1, 1, 1, 0);
  end;
end;

procedure SQLError(const SQL, Description: string);
begin
  gLogger.Error(Description + #13#10 + SQL);
end;

class procedure TCommon.ProgramInit;
begin
  gDeviceMonitorSJHM := TDictionary<String, String>.Create;
  ReadConfig();
  gSQLHelper := TSQLHelper.Create;
  gSQLHelper.DBServer := gConfig.DBServer;
  gSQLHelper.DBName := gConfig.DBName;
  gSQLHelper.DBUser := gConfig.DBUser;
  gSQLHelper.DBPwd := gConfig.DBPwd;
  gSQLHelper.OnError := SQLError;
  gLogger := TLogger.Create(ExtractFilePath(Paramstr(0)) + 'log\JZF.log');
  gAppIP := GetClientAddr;
end;

class procedure TCommon.ProgramDestroy;
begin
  gDeviceMonitorSJHM.Free;
  gSQLHelper.Free;
  gLogger.Free;
end;

end.
