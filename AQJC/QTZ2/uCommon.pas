unit uCommon;

interface

uses
  SysUtils, Classes, IniFiles, uGlobal, Rtti, uSQLHelper, uLogger, ADODB,
  System.JSON, FireDAC.Comp.Client, uTokenManager, uJKDefine, uWSManager,
  Data.DB, uEntity, System.Generics.Collections, System.NetEncoding, QJson,
  idHttp, IDURI, System.DateUtils, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, uTmri;

type

  TCommon = Class
  private
    class var FDicDevice: TDictionary<string, TDevice>;
    class function ReadConfig(): Boolean;
    class procedure InitHttpServer();
    class procedure InitAction();
    class procedure InitK08Hpzl();
    class procedure InitK08Clpp();
    class procedure InitK08Csys();
    class procedure InitDevice();
    class function ReadAppSetup(key, value: String): Boolean;
    Class function CreateTableColumns(AJv: TJSONValue;
      ATable: TFDMemTable): Boolean;
    class procedure InitLHY_JK; static;
    class procedure InitUser; static;
    class function GetDevice(): TDictionary<string, TDevice>; static;
  public
    class property DicDevice: TDictionary<string, TDevice> read GetDevice;
    class function QueryToJsonString(ASql: String): String;
    class function JsonToObject(T: TClass; JSON: String): TObject;
    class function RecordListToJSON<T>(list: TList<T>): string; static;
    class function RecordToJSON<T>(rec: Pointer): string; static;
    class procedure ProgramInit;
    class procedure ProgramDestroy;
    Class function JSONToDataSet(AJSON: String; ATable: TFDMemTable;
      AIndexField: String = ''; AIsCreateCol: Boolean = True;
      Options: TIndexOptions = [ixDescending]): Boolean;
    class function Base64ToFile(ABase64Str, AFileName: String): Boolean; static;
    class function GetJsonNode(ANode, AJSON: String): String;
    class function FindJson(AItemName: String; AJSON: TQJson): TQJson;
    class function PicUrl2Str(AUrl: String): WideString;
    class function StringToDT(s: String): TDatetime;
    class function GetTmriParam(jkid: string; token: TToken): TTmriParam;
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
    end
    else
    begin
      Result := EncodeDateTime(1900, 1, 1, 1, 1, 1, 0);
      exit;
    end;
    d := StrToInt(Copy(s, 1, pos(' ', s) - 1));
    s := Trim(Copy(s, pos(' ', s) + 1, Length(s)));
    h := StrToInt(Copy(s, 1, pos(':', s) - 1));
    s := Trim(Copy(s, pos(':', s) + 1, Length(s)));
    n := StrToInt(Copy(s, 1, pos(':', s) - 1));
    ss := StrToInt(Trim(Copy(s, pos(':', s) + 1, Length(s))));

    Result := EncodeDateTime(y, m, d, h, n, ss, 0);
  except
    Result := EncodeDateTime(1899, 12, 31, 0, 0, 0, 0);
  end;
end;

class function TCommon.Base64ToFile(ABase64Str, AFileName: String): Boolean;
var
  bytes: TBytes;
  ms: TMemoryStream;
begin
  Result := True;
  ms := TMemoryStream.Create;
  try
    bytes := TBase64Encoding.Base64.DecodeStringToBytes(ABase64Str);
    ms.WriteBuffer(bytes, Length(bytes));
    ms.SaveToFile(AFileName);
  except
    Result := false;
  end;
  ms.Free;
end;

class function TCommon.QueryToJsonString(ASql: String): String;
var
  obj: String;
  i: Integer;
begin
  Result := '';
  with gSQLHelper.Query(ASql) do
  begin
    // First;
    while not Eof do
    begin
      obj := '';
      for i := 0 to FieldCount - 1 do
      begin
        // if (not Fields[i].IsNull) and (Fields[i].AsString <> '') then
        begin
          if fields[i].DataType = TFieldType.ftDatetime then
            obj := obj + '"' + fields[i].FieldName + '":"' +
              Formatdatetime('yyyy/mm/dd hh:mm:ss', fields[i].AsDateTime) + '",'
          else
            obj := obj + '"' + fields[i].FieldName + '":"' + fields[i]
              .AsString + '",';
        end;
      end;
      if obj <> '' then
      begin
        obj := '{' + Copy(obj, 1, Length(obj) - 1) + '}';
        Result := Result + obj + ',';
      end;
      Next;
    end;
    Free;
  end;

  if Result <> '' then
    Result := '[' + Copy(Result, 1, Length(Result) - 1) + ']';
end;

class procedure TCommon.InitDevice;
var
  hikid: String;
begin
  gDevKDBH := TDictionary<String, String>.Create;
  gDevID := TDictionary<String, String>.Create;
  gHikID := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select SBBH, ID, HikID from S_Device ') do
  begin
    while not Eof do
    begin
      gDevKDBH.Add(FieldByName('SBBH').AsString, FieldByName('ID').AsString);
      gDevID.Add(FieldByName('ID').AsString, FieldByName('SBBH').AsString);
      hikid := FieldByName('HikID').AsString;
      if (hikid <> '') and (not gHikID.ContainsKey(hikid)) then
        gHikID.Add(hikid, FieldByName('SBBH').AsString);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitUser;
var
  item: TUser;
begin
  gUserDic := TDictionary<String, TUser>.Create;
  with gSQLHelper.Query('select * from S_User') do
  begin
    while not Eof do
    begin
      item.DWDM := FieldByName('DWDM').AsString;
      item.yhbh := FieldByName('YHBH').AsString;
      item.YHXM := FieldByName('YHXM').AsString;

      gUserDic.Add(item.yhbh, item);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitHttpServer();
var
  http: THttpServer;
begin
  gHttpDic := TDictionary<String, THttpServer>.Create;
  with gSQLHelper.Query('select * from S_QTZ_Server where Activate = 1') do
  begin
    while not Eof do
    begin
      http.SystemID := FieldByName('SystemID').AsString;
      http.HttpName := FieldByName('ServerName').AsString;
      http.Port := FieldByName('Port').AsInteger;
      gHttpDic.Add(http.HttpName, http);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitK08Clpp;
begin
  gK08Clpp := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select * from D_K08_CLPP ') do
  begin
    while not Eof do
    begin
      gK08Clpp.Add(FieldByName('vehiclelogo').AsString + '-' +
        FieldByName('Vehiclesublogo').AsString, FieldByName('MC').AsString);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitK08Hpzl;
begin
  gK08Hpzl := TDictionary<String, TStrings>.Create;
  gHpzl := TDictionary<String, String>.Create;
  with gSQLHelper.Query
    ('select * from D_K08 where FLBH=''HPZL'' order by MineKey ') do
  begin
    while not Eof do
    begin
      if not gK08Hpzl.ContainsKey(FieldByName('MineKey').AsString) then
        gK08Hpzl.Add(FieldByName('MineKey').AsString, TStringList.Create);
      gK08Hpzl[FieldByName('MineKey').AsString].Add(FieldByName('DM').AsString);
      gHpzl.Add(FieldByName('DM').AsString, FieldByName('MineKey').AsString);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitK08Csys;
begin
  gK08Csys := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select * from D_K08 where FLBH=''CSYS'' ') do
  begin
    while not Eof do
    begin
      gK08Csys.Add(FieldByName('DM').AsString, FieldByName('MC').AsString);
      Next;
    end;
    Free;
  end;
end;

class function TCommon.JSONToDataSet(AJSON: String; ATable: TFDMemTable;
  AIndexField: String; AIsCreateCol: Boolean; Options: TIndexOptions): Boolean;
var
  ja: TJSONArray;
  jv: TJSONValue;
  ji: TJSONValue;
  colName: String;
begin
  Result := false;
  if ATable = nil then
    exit;
  ATable.Close;
  if AJSON = '' then
    exit;

  try
    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      ATable.DisableControls;
      if AIsCreateCol then
      begin
        if ja.Count > 0 then
        begin
          if not CreateTableColumns(ja.Items[0], ATable) then
            exit;
          if AIndexField <> '' then
          begin
            ATable.IndexDefs.Clear;
            ATable.IndexDefs.Add('index', AIndexField, Options);
            ATable.IndexName := 'index';
          end;
        end;
        ATable.CreateDataSet();
      end
      else
        ATable.Open;
      for jv in ja do
      begin
        ATable.append;
        for ji in TJSONArray(jv) do
        begin
          colName := TJSONPair(ji).JsonString.value;
          if ATable.FieldDefs.IndexOf(colName) >= 0 then
            ATable.FieldByName(colName).AsString := TJSONPair(ji)
              .JsonValue.value;
        end;
        ATable.Post;
      end;
      Result := True;
      ATable.First;
      ATable.EnableControls;
    end;
  except
  end;
end;

class function TCommon.JsonToObject(T: TClass; JSON: String): TObject;
var
  FRTTICtx: TRTTIContext;
  rType: TRttiType;
  rField: TRTTIField;
  obj: TObject;
  ja: TJSONArray;
  jv: TJSONValue;
  ji: TJSONValue;
begin
  try
    rType := FRTTICtx.GetType(T);
    obj := T.Create;

    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      for jv in ja do
      begin
        for ji in TJSONArray(jv) do
        begin
          rField := rType.GetField(TJSONPair(ji).JsonString.value);
          {
            case rField.FieldType.TypeKind of
            TTypeKind.tkString, TTypeKind.tkWString, TTypeKind.tkLString,
            TTypeKind.tkUString, TTypeKind.tkFloat, TTypeKind.tkInteger,
            TTypeKind.tkInt64, TTypeKind.tkChar, TTypeKind.tkWChar,
            TTypeKind.tkEnumeration:
          }
          if rField = nil then
            continue;
          rField.SetValue(obj,
            TValue.From<string>(TJSONPair(ji).JsonValue.value));
        end;
      end;
    end;
    Result := obj as T;
  except
    Result := nil;
  end;
end;

class function TCommon.CreateTableColumns(AJv: TJSONValue;
  ATable: TFDMemTable): Boolean;
var
  ji: TJSONValue;
begin
  Result := True;
  try
    ATable.FieldDefs.Clear;
    for ji in TJSONArray(AJv) do
    begin
      if ATable.FieldDefs.IndexOf(TJSONPair(ji).JsonString.value) < 0 then
        ATable.FieldDefs.Add(TJSONPair(ji).JsonString.value, ftString,
          255, false);
    end;
  except
    Result := false;
  end;
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

class function TCommon.GetDevice: TDictionary<string, TDevice>;
var
  dev: TDevice;
begin
  try
    if FDicDevice = nil then
    begin
      FDicDevice := TDictionary<String, TDevice>.Create;
      with gSQLHelper.Query('select * from S_Device where QYZT=''1'' ') do
      begin
        while not Eof do
        begin
          dev.SystemID := FieldByName('SYSTEMID').AsString;
          dev.SBBH := FieldByName('SBBH').AsString;
          dev.JCPTBABH := FieldByName('JCPTBABH').AsString;
          dev.JCPTBAFX := FieldByName('JCPTBAFX').AsString;
          dev.LKBH := FieldByName('LKBH').AsString;
          dev.LKMC := FieldByName('LKMC').AsString;
          dev.FXBH := FieldByName('FXBH').AsString;
          dev.FXMC := FieldByName('FXMC').AsString;
          dev.CJJG := FieldByName('CJJG').AsString;
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
          dev.JDYXQ := FieldByName('JDYXQ').AsString;
          dev.QYRQ := FieldByName('QYRQ').AsString;
          if FieldByName('XZSD').AsString <> '' then
            dev.XZSD := FieldByName('XZSD').AsInteger;
          if FieldByName('DCXZSD').AsString <> '' then
            dev.DCXZSD := FieldByName('DCXZSD').AsInteger;
          dev.QSSBBH := FieldByName('QSSBBH').AsString;
          dev.sblx := FieldByName('SBLX').AsString;
          dev.LDBH := FieldByName('LDBH').AsString;
          dev.LHY_XZQH := FieldByName('LHY_XZQH').AsString;
          dev.LHY_WFDD := FieldByName('LHY_WFDD').AsString;
          dev.LHY_SBBH := FieldByName('LHY_SBBH').AsString;
          dev.LHY_LDDM := FieldByName('LHY_LDDM').AsString;
          dev.LHY_DDMS := FieldByName('LHY_DDMS').AsString;
          dev.LHY_CJFS := FieldByName('LHY_CJFS').AsString;
          dev.LHY_JPGH := FieldByName('LHY_JPGH').AsString;
          dev.LHY_JPGW := FieldByName('LHY_JPGW').AsString;
          dev.LHY_JPGQ := FieldByName('LHY_JPGQ').AsString;
          dev.QYZT := FieldByName('QYZT').AsBoolean;
          dev.ZJZT := FieldByName('ZJZT').AsBoolean;
          dev.SCJCPT := FieldByName('SCJCPT').AsBoolean;
          dev.TPGS := FieldByName('TPGS').AsString;
          dev.wfxw := FieldByName('WFXW').AsString;
          dev.bz := FieldByName('BZ').AsString;
          dev.gxsj := FieldByName('GXSJ').AsString;
          dev.TPXZ := FieldByName('TPXZ').AsBoolean;
          dev.XSZB := FieldByName('XYSB').AsBoolean;
          dev.AQDSB := FieldByName('AQDSB').AsBoolean;
          dev.HBCZB := FieldByName('HBCZB').AsInteger;
          dev.XXZB := FieldByName('XXZB').AsBoolean;
          dev.DCXXZB := FieldByName('DCXXZB').AsBoolean;
          dev.YSXZB := FieldByName('YSXZB').AsBoolean;
          dev.CZDW := FieldByName('CZDW').AsString;
          dev.AddSY := FieldByName('AddSY').AsBoolean;
          dev.ID := FieldByName('ID').AsString;
          dev.AutoUpload := FieldByName('AutoUpload').AsBoolean;
          dev.UploadJCPT := FieldByName('UploadJCPT').AsBoolean;
          if not FDicDevice.ContainsKey(dev.SBBH) then
            FDicDevice.Add(dev.SBBH, dev);
          Next;
        end;
        gLogger.Info('device count :' + FDicDevice.Count.ToString);
        Free;
      end;
    end;
    Result := FDicDevice;
  except
    on e: exception do
      gLogger.Error(e.Message);

  end;
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
    on e: exception do
      gLogger.Error(e.Message);
  end;
  JSON.Free;
end;

class function TCommon.GetTmriParam(jkid: string; token: TToken): TTmriParam;
begin
  Result.jkid := jkid;
  Result.dwmc := '';
  Result.YHXM := '';
  try
    Result.yhbz := token.Login;
    if gUserDic.ContainsKey(token.Login) then
      Result.dwjgdm := gUserDic[token.Login].DWDM
    else
      Result.dwjgdm := '440000000000';
    Result.zdbs := token.IP;
  except
    Result.yhbz := 'sa';
    Result.dwjgdm := '440000000000';
    Result.zdbs := '127.0.0.1';
  end;
end;

class procedure TCommon.InitAction();
var
  action: TAction;
begin
  gActionDic := TDictionary<String, TAction>.Create;
  with gSQLHelper.Query('select * from S_QTZ_Action where Activate = 1') do
  begin
    while not Eof do
    begin
      action.SystemID := FieldByName('SystemID').AsString;
      action.ActionType := UpperCase(FieldByName('ActionType').AsString);
      action.action := FieldByName('Action').AsString;
      action.TableName := FieldByName('TableName').AsString;
      action.SQL := FieldByName('SQL').AsString;
      gActionDic.Add(UpperCase(action.action), action);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitLHY_JK();
var
  jk: TJK;
begin
  JKDic := TDictionary<String, TJK>.Create;
  with gSQLHelper.Query('select * from S_JKGL where QYZT = 1') do
  begin
    while not Eof do
    begin
      jk.jkid := FieldByName('JKID').AsString;
      jk.JDID := FieldByName('JDID').AsString;
      jk.XLH := FieldByName('XLH').AsString;
      jk.WSDL := FieldByName('WSDL').AsString;
      jk.CJSQBH := FieldByName('CJSQBH').AsString;

      JKDic.Add(jk.jkid, jk);

      Next;
    end;
    Free;
  end;
end;

class function TCommon.ReadAppSetup(key, value: String): Boolean;
begin
  with gSQLHelper.Query('select 1 from S_AppSetup where KeyName=' +
    key.QuotedString + ' and value=' + value.QuotedString) do
  begin
    Result := RecordCount > 0;
    Free;
  end;
end;

class function TCommon.ReadConfig(): Boolean;
begin
  with TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini') do
  begin
    gConfig.DBServer := ReadString('DB', 'Server', '.');
    gConfig.DBPort := ReadInteger('DB', 'Port', 1433);
    gConfig.DBUser := ReadString('DB', 'User', 'vioadmin');
    gConfig.DBPwd := ReadString('DB', 'Pwd', 'lgm1224,./');
    gConfig.DBName := ReadString('DB', 'Name', 'YjItsDB');

    gConfig.SolrLocalPort := ReadInteger('solr', 'Port', 10087);
    gConfig.SolrHome := ReadString('solr', 'home',
      'http://10.43.255.66:8983/solr/traffic/');
    gConfig.SolrHome1 := ReadString('solr', 'home1',
      'http://10.43.255.66:8983/solr/traffic1/');

    gConfig.HikConfig.LYUrl := ReadString('Hik', 'LYUrl', '');
    gConfig.HikConfig.LYUser := ReadString('Hik', 'LYUser', '');
    gConfig.HikConfig.LYPwd := ReadString('Hik', 'LYPwd', '');
    gConfig.HikConfig.LYHttpConverter :=
      ReadString('Hik', 'LYHttpConverter', '');
    gConfig.HikConfig.K08SearchURL := ReadString('Hik', 'K08SearchURL',
      'http://10.43.255.16:8080/kms/services/ws/vehicleSearch');
    gConfig.HikConfig.K08SaveUrl := ReadString('Hik', 'K08SaveUrl',
      'http://10.43.255.16:8080/kms/services/ws/falconOperateData?wsdl');
    gConfig.HikConfig.DFUrl := ReadString('Hik', 'DFUrl',
      'http://10.43.255.20:18010');
    gConfig.HikConfig.DFUser := ReadString('Hik', 'DFUser', 'admin');
    gConfig.HikConfig.DFPwd := ReadString('Hik', 'DFPwd', 'Hik12345');

    gConfig.HikConfig.PicAnalysis := ReadString('Hik', 'PicAnalysis', '');
    gConfig.HikConfig.CarFace := ReadString('Hik', 'CarFace', '');

    gConfig.SMSUrl := ReadString('SMS', 'SMSUrl', '');

    gHeartbeatUrl := ReadString('Heartbeat', 'Url', 'http://127.0.0.1:20090/');
    gHeartbeatInterval := ReadInteger('Heartbeat', 'Interval', 3);

    if Copy(gHeartbeatUrl, Length(gHeartbeatUrl), 1) <> '/' then
      gHeartbeatUrl := gHeartbeatUrl + '/';

    if (gConfig.HikConfig.LYUrl <> '') and
      (Copy(gConfig.HikConfig.LYUrl, Length(gConfig.HikConfig.LYUrl), 1) = '/')
    then
      gConfig.HikConfig.LYUrl := Copy(gConfig.HikConfig.LYUrl, 1,
        Length(gConfig.HikConfig.LYUrl) - 1);

    if (gConfig.HikConfig.LYHttpConverter <> '') and
      (Copy(gConfig.HikConfig.LYHttpConverter,
      Length(gConfig.HikConfig.LYHttpConverter), 1) = '/') then
      gConfig.HikConfig.LYHttpConverter :=
        Copy(gConfig.HikConfig.LYHttpConverter, 1,
        Length(gConfig.HikConfig.LYHttpConverter) - 1);
    Free;
  end;

  gServiceIp := TStringList.Create;
  if FileExists(ExtractFilePath(ParamStr(0)) + 'IP.ini') then
    gServiceIp.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'IP.ini');
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

procedure SQLError(const SQL, Description: string);
begin
  gLogger.Error(Description + #13#10 + SQL);
end;

class procedure TCommon.ProgramInit;
begin
  ReadConfig();
  gLogger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'log\QTZ.log');
  gLogger.MaxBackupIndex := 100;
  gSQLHelper := TSQLHelper.Create;
  gSQLHelper.DBServer := gConfig.DBServer;
  gSQLHelper.DBName := gConfig.DBName;
  gSQLHelper.DBUser := gConfig.DBUser;
  gSQLHelper.DBPwd := gConfig.DBPwd;
  gSQLHelper.OnError := SQLError;
  TCommon.InitHttpServer;
  TCommon.InitAction;
  gHaveK08 := ReadAppSetup('K08', '1');
  if gHaveK08 then
  begin
    InitK08Hpzl();
    InitK08Clpp();
    InitK08Csys();
  end;
  InitDevice();
  InitUser;
  InitLHY_JK;
  gTokenManager := TTokenManager.Create;
  gWSManager := TWSManager.Create;
  gSaUsers := TStringList.Create;
  gSaUsers.Add('sa');
  gSaUsers.Add('su');
end;

class function TCommon.PicUrl2Str(AUrl: String): WideString;
var
  ms: TMemoryStream;
  ss: TStringStream;
  http: TNetHTTPClient;
begin
  Result := '';
  ms := TMemoryStream.Create;
  ss := TStringStream.Create;
  http := TNetHTTPClient.Create(nil);
  try
    http.Get(AUrl, ms);
    TBase64Encoding.Base64.Encode(ms, ss);
    Result := ss.DataString;
  except
    on e: exception do
      gLogger.Error(e.Message + ' ' + AUrl);
  end;
  FreeAndNil(http);
  FreeAndNil(ms);
  FreeAndNil(ss);
  if Length(Result) < 50000 then
  begin
    gLogger.Error('图片大小小于50K');
    Result := '';
  end;
end;

class procedure TCommon.ProgramDestroy;
begin
  gSQLHelper.Free;
  gLogger.Free;
  gHttpDic.Free;
  gActionDic.Free;
  gK08Hpzl.Free;
  gK08Clpp.Free;
  gK08Csys.Free;
  gDevKDBH.Free;
  gDevID.Free;
  gHikID.Free;
  gHpzl.Free;
  gTokenManager.Free;
  gWSManager.Free;
  gSaUsers.Free;
  JKDic.Free;
  gUserDic.Free;
  gServiceIp.Free;
end;

end.
