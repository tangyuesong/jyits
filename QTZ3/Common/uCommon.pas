unit uCommon;

interface

uses
  SysUtils, Classes, IniFiles, uGlobal, Rtti, uSQLHelper, uLogger, ADODB,
  System.JSON, FireDAC.Comp.Client, uTokenManager, QJson,
  Data.DB, uEntity, System.Generics.Collections, DateUtils, QBAES, IdFtp,
  IdFtpCommon, IdGlobal, System.Variants, httpApp, uJKDefine,
  uWSManager,
  StrUtils, System.NetEncoding, System.Math;

type

  TZHPTUserDevice = Record
    zfjly: String;
    yj: String;
    bkq: String;
    tq: String;
  End;

  TCommon = Class
  private
    class var FColDef: TDictionary<string, string>;
    class var FDicWfxw: TDictionary<string, string>;
    class var FDicSpotWfxw: TDictionary<string, string>;
    class var FDicHpzlMC: TDictionary<string, string>;
    class var FDicDevice: TDictionary<string, TDevice>;
    class var FSaUsers: TStrings;
    class var FBaseTime: TDatetime;
    class var FDepts: TDictionary<string, TDept>;
    class function ReadConfig(): Boolean;
    class procedure InitK08Hpzl();
    class procedure InitK08Clpp();
    class procedure InitK08Csys();
    class procedure InitDevice();
    class procedure InitPassDevice();
    class function AssembleHttpResult(code, msg, body: String;
      totalnum: String = '0'; currentpage: String = '1';
      pagesize: String = '1'): String;
    class function GetDevice(): TDictionary<string, TDevice>; static;
    class function GetHpzlmc(): TDictionary<string, string>; static;
    class procedure GetDBActionParams(Actions: TDictionary<String, TDBAction>);
    class procedure GetDBReturnGroups(Actions: TDictionary<String, TDBAction>);
    class function GetDepts(): TDictionary<string, TDept>; static;
    class function GetColDef(): TDictionary<string, string>; static;
    class function GetWfxw(): TDictionary<string, string>; static;
    class function GetUserInfo(userid, pwd, ip: String; var msg: String;
      isWxLogin: Boolean): TUser;
    class procedure InitLHY_JK; static;
    class function GetZHPTUserDevice(yhbh: String): TZHPTUserDevice;
    class function GetSpotWfxw(): TDictionary<string, String>; static;
  public
    class property DicHpzlMC: TDictionary<string, string> read GetHpzlmc;
    class property DicDevice: TDictionary<string, TDevice> read GetDevice;
    class property DicWfxw: TDictionary<string, string> read GetWfxw;
    class property ColDef: TDictionary<string, string> read GetColDef;
    class property SaUsers: TStrings read FSaUsers;
    class property Depts: TDictionary<string, TDept> read GetDepts;
    class property DicSpotWfxw: TDictionary<string, String> read GetSpotWfxw;
    class function QueryToJsonString(ASql: String; AGroups: TStrings;
      var ATotal: Integer): String;
    class function RecordListToJSON<T>(list: TList<T>): string; static;
    class function RecordToJSON<T>(rec: Pointer): string; static;
    class procedure GetServiceInfo; static;
    class procedure ProgramInit;
    class procedure ProgramDestroy;
    class function Login(ip: String; params: TStrings; var valid: String;
      isWxLogin: Boolean = False): String;
    class procedure SaveQtzLog(token, yhbh, ip, action, param, valid,
      msg: String; deviceId: String = '');
    class function GetK08Hpzl(): TDictionary<String, TStrings>;
    class function GetHpzl(): TDictionary<String, String>;
    class function GetK08Clpp(): TDictionary<String, String>;
    class function GetK08Csys(): TDictionary<String, String>;
    class function GetDevID(): TDictionary<String, String>;
    class function GetDBActions(): TDictionary<String, TDBAction>;
    class function AssembleSuccessHttpResult(body: String;
      totalnum: String = '0'; currentpage: String = '1';
      pagesize: String = '1'): String;
    class function AssembleFailedHttpResult(msg: String;
      code: String = '0'): String;
    class function GetJsonNode(ANode, AJSON: String): String;
    class function GetRealDatetime(AMilliSecond: Int64): TDatetime;
    class function StringToDT(s: String): TDatetime;
    class function GetXZQH(dwdm: String): String;
    class function Base64ToFile(ABase64Str, AFileName: String): Boolean;
    class function FileToBase64(AFileName: String): String;
    class function FtpPutFile(AHost, AUser, Apw, ASourceFile, ADestFile: string;
      APort: Integer): Boolean; static;
    class function QueryToStream(ASql: String): TStringStream; static;
    class function AddWfxwmc(AJSON: String): String;
    class procedure WriteForceVio(params: TStrings);
    class procedure WriteSimpleVio(params: TStrings);
    class procedure WriteDutySimple(params: TStrings);
    class function FindJson(AItemName: String; AJSON: TQJson): TQJson;
    class procedure SaveVehInfo(AJSON: String);
    class procedure SaveDrvInfo(AJSON: String);
    class function QueryDrvInfo(sfzmhm: String; dabh: String): String;
    class function QueryVehInfo(hphm, hpzl: String): String;
    class function DelFile(fileName: String): Boolean; static;
    class function JsonToRecord<T>(JSON: string): T; static;
    class function JsonToRecordList<T>(JSON: string): TList<T>; static;
    class procedure SaveSLWS(yhbh: String);
    class function FtpPic(base64Str: String): String; static;
  end;

procedure SQLError(const SQL, Description: string);

implementation

class function TCommon.DelFile(fileName: String): Boolean;
begin
  Result := True;
  try
    if FileExists(fileName) then
      DeleteFile(PWideChar(fileName));
  except
    Result := False;
  end;
end;

class function TCommon.QueryToStream(ASql: String): TStringStream;
var
  i: Integer;
  tsList: TStringList;
  s, c, col, value: string;
  qy: TADOQuery;
begin
  Result := TStringStream.Create;
  tsList := TStringList.Create;
  qy := gSQLHelper.Query(ASql);
  try
    s := '';
    for i := 0 to qy.FieldCount - 1 do
    begin
      col := UpperCase(qy.Fields[i].FieldName);
      c := col;
      if TCommon.ColDef.ContainsKey(col) then
        c := TCommon.ColDef[col];
      s := s + #9 + c;

      if col = 'HPZL' then
        s := s + #9 + '号牌名称'
      else if (col = 'SBBH') or (col = 'KDBH') or (col = 'WFDD') then
        s := s + #9 + '设备名称'
      else if (col = 'CZDW') or (col = 'DWDM') or (col = 'CJJG') then
        s := s + #9 + '单位名称';
    end;
    tsList.add(s.Substring(1));

    // qy.first;
    While Not qy.Eof do
    begin
      s := '';
      for i := 0 to qy.FieldCount - 1 do
      begin
        col := UpperCase(qy.Fields[i].FieldName);
        value := qy.Fields[i].AsString;
        s := s + #9 + value;

        if col = 'HPZL' then
        begin
          if DicHpzlMC.ContainsKey(value) then
            s := s + #9 + DicHpzlMC[value]
          else
            s := s + #9 + ' ';
        end
        else if (col = 'SBBH') or (col = 'KDBH') or (col = 'WFDD') then
        begin
          if DicDevice.ContainsKey(value) then
            s := s + #9 + DicDevice[value].SBDDMC
          else
            s := s + #9 + ' ';
        end
        else if (col = 'CZDW') or (col = 'DWDM') or (col = 'CJJG') then
        begin
          if Depts.ContainsKey(value) then
            s := s + #9 + Depts[value].dwmc
          else
            s := s + #9 + ' ';
        end;
      end;
      tsList.add(s.Substring(1));
      qy.Next;
    end;
    Result.WriteString(tsList.Text);
  except
    on e: Exception do
    begin
      gLogger.Error(e.Message);
      FreeAndNil(Result);
    end;
  end;
  qy.Free;
  tsList.Free;
end;

class function TCommon.QueryToJsonString(ASql: String; AGroups: TStrings;
  var ATotal: Integer): String;
var
  key, obj, col, value, s: String;
  i: Integer;
  JSON: TDictionary<String, TStrings>;
begin
  Result := '';
  JSON := TDictionary<String, TStrings>.Create;
  with gSQLHelper.Query(ASql) do
  begin
    if not Eof then
    begin
      ATotal := RecordCount;
      while not Eof do
      begin
        key := '';
        obj := '';
        for i := 0 to FieldCount - 1 do
        begin
          col := LowerCase(Fields[i].FieldName);
          if Fields[i].DataType = TFieldType.ftDatetime then
            value := Formatdatetime('yyyy/mm/dd hh:mm:ss', Fields[i].AsDateTime)
          else if Fields[i].DataType = TFieldType.ftBoolean then
          begin
            if Fields[i].AsBoolean then
              value := '1'
            else
              value := '0';
          end
          else
            value := Trim(Fields[i].AsString.Replace(char(9), ' ')
              .Replace(char(10), ' ').Replace(char(13), ' ').Replace('"', '')
              .Replace('\', ''));
          s := '"' + col + '":"' + value + '"';

          if (AGroups <> nil) and (AGroups.IndexOf(UpperCase(col)) >= 0) then
            key := key + s + ','
          else
            obj := obj + s + ',';

          if UpperCase(col) = 'HPZL' then
          begin
            if DicHpzlMC.ContainsKey(value) then
              s := '"hpzlmc":"' + DicHpzlMC[value] + '"'
            else
              s := '"hpzlmc":""';
            if (AGroups <> nil) and (AGroups.IndexOf('HPZL') >= 0) then
              key := key + s + ','
            else
              obj := obj + s + ',';
          end
          else if (UpperCase(col) = 'SBBH') or (UpperCase(col) = 'KDBH') or
            (UpperCase(col) = 'WFDD') then
          begin
            if DicDevice.ContainsKey(value) then
              s := '"sbddmc":"' + DicDevice[value].SBDDMC + '"'
            else
              s := '"sbddmc":""';
            if (AGroups <> nil) and ((AGroups.IndexOf('SBBH') >= 0) or
              (AGroups.IndexOf('KDBH') >= 0) or (AGroups.IndexOf('WFDD') >= 0))
            then
              key := key + s + ','
            else
              obj := obj + s + ',';
          end
          else if (UpperCase(col) = 'CZDW') or (UpperCase(col) = 'DWDM') or
            (UpperCase(col) = 'CJJG') then
          begin
            if Depts.ContainsKey(value) then
              s := '"dwmc":"' + Depts[value].dwmc + '"'
            else
              s := '"dwmc":""';
            if (AGroups <> nil) and ((AGroups.IndexOf('CZDW') >= 0) or
              (AGroups.IndexOf('DWDM') >= 0) or (AGroups.IndexOf('CJJG') >= 0))
            then
              key := key + s + ','
            else
              obj := obj + s + ',';
          end
        end;
        if key = '' then
          key := 'ALL,';
        key := copy(key, 1, length(key) - 1);
        obj := copy(obj, 1, length(obj) - 1);
        if not JSON.ContainsKey(key) then
          JSON.add(key, TStringList.Create);
        JSON[key].add(obj);
        Next;
      end;
    end;
    Free;
  end;

  for key in JSON.Keys do
  begin
    s := '';
    for i := 0 to JSON[key].Count - 1 do
      s := s + '{' + JSON[key][i] + '},';
    if key <> 'ALL' then
      s := '{' + key + ',"info":[' + copy(s, 1, length(s) - 1) + ']},';
    JSON[key].Free;
    Result := Result + s;
  end;

  if Result <> '' then
  begin
    Result := copy(Result, 1, length(Result) - 1);
    Result := '[' + Result + ']';
  end;
  JSON.Free;
end;

class function TCommon.GetDevID: TDictionary<String, String>;
begin
  Result := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select SBBH, ID from ' + gConfig.YJITSDB +
    '.dbo.S_Device where QYZT=''1'' ') do
  begin
    while not Eof do
    begin
      Result.add(FieldByName('ID').AsString, FieldByName('SBBH').AsString);
      Next;
    end;
    Free;
  end;
end;

class function TCommon.GetK08Clpp(): TDictionary<String, String>;
begin
  Result := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.D_K08_CLPP ') do
  begin
    while not Eof do
    begin
      Result.add(FieldByName('vehiclelogo').AsString + '-' +
        FieldByName('Vehiclesublogo').AsString, FieldByName('MC').AsString);
      Next;
    end;
    Free;
  end;
end;

class function TCommon.GetHpzl: TDictionary<String, String>;
begin
  Result := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.D_K08 where FLBH=''HPZL'' order by MineKey ') do
  begin
    while not Eof do
    begin
      Result.add(FieldByName('DM').AsString, FieldByName('MineKey').AsString);
      Next;
    end;
    Free;
  end;
end;

class function TCommon.GetK08Hpzl(): TDictionary<String, TStrings>;
begin
  Result := TDictionary<String, TStrings>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.D_K08 where FLBH=''HPZL'' order by MineKey ') do
  begin
    while not Eof do
    begin
      if not Result.ContainsKey(FieldByName('MineKey').AsString) then
        Result.add(FieldByName('MineKey').AsString, TStringList.Create);
      Result[FieldByName('MineKey').AsString].add(FieldByName('DM').AsString);
      Next;
    end;
    Free;
  end;
end;

class function TCommon.GetRealDatetime(AMilliSecond: Int64): TDatetime;
begin
  Result := DateUtils.IncMilliSecond(FBaseTime, AMilliSecond);
end;

class function TCommon.GetSpotWfxw: TDictionary<string, String>;
begin
  if FDicSpotWfxw = nil then
  begin
    FDicSpotWfxw := TDictionary<string, string>.Create;
    with gSQLHelper.Query('select CLZT, WFXW from ' + gConfig.YJITSDB +
      '.dbo.T_Spot_Wfxw') do
    begin
      while not Eof do
      begin
        if not FDicSpotWfxw.ContainsKey(Fields[0].AsString) then
          FDicSpotWfxw.add(Fields[0].AsString, Fields[1].AsString);
        Next;
      end;
      Free;
    end;
  end;
  Result := FDicSpotWfxw;
end;

class function TCommon.GetUserInfo(userid, pwd, ip: String; var msg: String;
  isWxLogin: Boolean): TUser;
var
  hhnnss, mm, m1, m2: String;
  dt: TDatetime;

  function CheckPwd(m1, m2: String): Boolean;
  var
    s, tmpUser: String;
  begin
    Result := False;
    if not isWxLogin and (m1 = m2) then
      Result := True
    else if isWxLogin then
    begin
      tmpUser := copy(m2, 1, length(userid));
      if userid = tmpUser then
      begin
        s := copy(m2, length(userid) + 1, length(m2));
        if DateUtils.SecondsBetween(Now,
          TCommon.GetRealDatetime(StrToInt64Def(s, 0))) < 60 then
          Result := True;
      end;
    end;
  end;

begin
  hhnnss := Formatdatetime('hhnnss', Now);
  msg := '';
  // with gSQLHelper.Query('select * from ' + gConfig.YJITSDB + '.dbo.S_USER where YHBH = '
  // + userid.QuotedString + ' and mm = ' + pwd.QuotedString) do
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.S_USER where YHBH = ' + userid.QuotedString) do
  begin
    if not Eof then
    begin
      mm := FieldByName('mm').AsString;
      m1 := Trim(AesDecrypt(AnsiString(mm), AnsiString(cUserKey)));
      m2 := Trim(AesDecrypt(AnsiString(pwd), AnsiString(cUserKey)));
      if CheckPwd(m1, m2) then
      begin
        Result.SystemID := FieldByName('SystemID').AsString;
        Result.dwdm := FieldByName('DWDM').AsString;
        Result.yhbh := FieldByName('yhbh').AsString;
        Result.ZW := FieldByName('ZW').AsString;
        Result.yhxm := FieldByName('YHXM').AsString;
        Result.XL := FieldByName('XL').AsString;
        Result.SJHM := FieldByName('SJHM').AsString;
        Result.SFZHM := FieldByName('SFZHM').AsString;
        Result.mm := FieldByName('MM').AsString;
        Result.IPKS := FieldByName('IPKS').AsString;
        Result.IPJS := FieldByName('IPJS').AsString;
        Result.MAC := FieldByName('MAC').AsString;
        // if FindField('GPSBH') <> nil then
        // Result.GPSBH := FieldByName('GPSBH').AsString
        // else
        Result.GPSBH := '';
        if FieldByName('FH').AsBoolean then
          Result.FH := '1'
        else
          Result.FH := '0';
        Result.zt := FieldByName('zt').AsString;
        Result.bz := FieldByName('bz').AsString;
        Result.QX := FieldByName('QX').AsString;
        Result.gxsj := FieldByName('gxsj').AsString;
        Result.lrr := FieldByName('lrr').AsString;
        if FieldByName('Manager').AsBoolean then
          Result.Manager := '1'
        else
          Result.Manager := '0';
        if FieldByName('SH').AsBoolean then
          Result.SH := '1'
        else
          Result.SH := '0';
        Result.role := FieldByName('role').AsString;
        Result.MJ := FieldByName('IsMJ').AsString;
        Result.ValidDay :=
          IntToStr(Ceil(FieldByName('ValidDate').AsDateTime - Now));
        Result.PasswordValidDay :=
          IntToStr(Ceil(FieldByName('PasswordValidDate').AsDateTime - Now));
        if FieldByName('ValidDate').AsDateTime < Now then
          msg := '用户已超过有效期'
        else if FieldByName('PasswordValidDate').AsDateTime < Now then
          msg := '密码已超过有效期'
        else if (hhnnss < FieldByName('LoginTimeBegin').AsString) or
          (hhnnss > FieldByName('LoginTimeEnd').AsString) then
          msg := '该时间段不允许登录'
        else if (ip < FieldByName('IPKS').AsString) or
          (hhnnss > FieldByName('IPJS').AsString) then
          msg := '该IP不允许登录';
      end
      else
        msg := '用户名或者密码错误';
    end
    else
      msg := '用户名或者密码错误';
    Free;
  end;
  if msg = '' then
  begin
    with gSQLHelper.Query('select top 1 gxsj from ' + gConfig.YDJWPT +
      '.dbo.S_QTZ_LOG where action = ''/login'' and param=' +
      userid.QuotedString + ' and valid = 1 order by gxsj desc') do
    begin
      if not Eof then
        Result.LastLoginTime := Formatdatetime('yyyy-mm-dd hh:nn:ss',
          Fields[0].AsDateTime);
      Free;
    end;
    with gSQLHelper.Query('select top 1 gxsj from ' + gConfig.YDJWPT +
      '.dbo.S_QTZ_LOG where yhbh=' + userid.QuotedString +
      ' and valid = 0 order by gxsj desc') do
    begin
      if not Eof then
        Result.LastTokenError := Formatdatetime('yyyy-mm-dd hh:nn:ss',
          Fields[0].AsDateTime);
      Free;
    end;
  end;
end;

class function TCommon.GetWfxw: TDictionary<string, string>;
begin
  if FDicWfxw = nil then
  begin
    FDicWfxw := TDictionary<string, string>.Create;
    with gSQLHelper.Query('select WFXWDM, WFXWMC from ' + gConfig.YJITSDB +
      '.dbo.T_VIO_ILLECODE') do
    begin
      while not Eof do
      begin
        if not FDicWfxw.ContainsKey(Fields[0].AsString) then
          FDicWfxw.add(Fields[0].AsString, Fields[1].AsString);
        Next;
      end;
      Free;
    end;

  end;
  Result := FDicWfxw;
end;

class function TCommon.GetXZQH(dwdm: String): String;
var
  dwjb: String;
begin
  Result := dwdm;
  if Depts.ContainsKey(dwdm) then
  begin
    dwjb := Depts[dwdm].dwjb;
    if dwjb = '2' then
      Result := copy(dwdm, 1, 2)
    else if dwjb = '3' then
      Result := copy(dwdm, 1, 4)
    else if dwjb = '4' then
      Result := copy(dwdm, 1, 6);
  end;
end;

class function TCommon.GetZHPTUserDevice(yhbh: String): TZHPTUserDevice;
begin
  with gSQLHelper.Query('select * from ' + gConfig.YDJWPT +
    '.dbo.S_ZHPT_UserDevice where yhbh = ' + yhbh.QuotedString) do
  begin
    if not Eof then
    begin
      Result.zfjly := FieldByName('zfjly').AsString;
      Result.yj := FieldByName('yj').AsString;
      Result.bkq := FieldByName('bkq').AsString;
      Result.tq := FieldByName('tq').AsString;
    end
    else
    begin
      Result.zfjly := '';
      Result.yj := '';
      Result.bkq := '';
      Result.tq := '';
    end;
    Free;
  end;
end;

class procedure TCommon.InitDevice;
var
  hikid: String;
begin
  gDevKDBH := TDictionary<String, String>.Create;
  gDevID := TDictionary<String, String>.Create;
  gHikID := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select SBBH, ID, HikID from ' + gConfig.YJITSDB +
    '.dbo.S_Device where QYZT=''1''') do
  begin
    while not Eof do
    begin
      if not gDevKDBH.ContainsKey(FieldByName('SBBH').AsString) then
        gDevKDBH.add(FieldByName('SBBH').AsString, FieldByName('ID').AsString);
      if not gDevID.ContainsKey(FieldByName('ID').AsString) then
        gDevID.add(FieldByName('ID').AsString, FieldByName('SBBH').AsString);
      hikid := FieldByName('HikID').AsString;
      if (hikid <> '') and (not gHikID.ContainsKey(hikid)) then
        gHikID.add(hikid, FieldByName('SBBH').AsString);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitK08Clpp;
begin
  gK08Clpp := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.D_K08_CLPP ') do
  begin
    while not Eof do
    begin
      if not gK08Clpp.ContainsKey(FieldByName('vehiclelogo').AsString + '-' +
        FieldByName('Vehiclesublogo').AsString) then
        gK08Clpp.add(FieldByName('vehiclelogo').AsString + '-' +
          FieldByName('Vehiclesublogo').AsString, FieldByName('MC').AsString);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitK08Csys;
begin
  gK08Csys := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.D_K08 where FLBH=''CSYS'' ') do
  begin
    while not Eof do
    begin
      if not gK08Csys.ContainsKey(FieldByName('DM').AsString) then
        gK08Csys.add(FieldByName('DM').AsString, FieldByName('MC').AsString);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitK08Hpzl;
begin
  gK08Hpzl := TDictionary<String, TStrings>.Create;
  gHpzl := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.D_K08 where FLBH=''HPZL'' order by MineKey ') do
  begin
    while not Eof do
    begin
      if not gK08Hpzl.ContainsKey(FieldByName('MineKey').AsString) then
        gK08Hpzl.add(FieldByName('MineKey').AsString, TStringList.Create);
      gK08Hpzl[FieldByName('MineKey').AsString].add(FieldByName('DM').AsString);
      if not gHpzl.ContainsKey(FieldByName('DM').AsString) then
        gHpzl.add(FieldByName('DM').AsString, FieldByName('MineKey').AsString);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitLHY_JK;
var
  jk: TJK;
begin
  JKDic := TDictionary<String, TJK>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.S_JKGL where QYZT = 1') do
  begin
    while not Eof do
    begin
      jk.jkid := FieldByName('JKID').AsString;
      jk.JDID := FieldByName('JDID').AsString;
      jk.XLH := FieldByName('XLH').AsString;
      jk.WSDL := FieldByName('WSDL').AsString;
      jk.CJSQBH := FieldByName('CJSQBH').AsString;
      JKDic.add(jk.jkid, jk);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.InitPassDevice;
var
  id: String;
begin
  gPassDevice := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select KDBH, SBDDMC from ' + gConfig.YJITSDB +
    '.dbo.S_Device_Pass where KDBH <> '''' and SBDDMC <> '''' ') do
  begin
    while not Eof do
    begin
      id := Fields[0].AsString;
      if not gPassDevice.ContainsKey(id) then
        gPassDevice.add(id, Fields[1].AsString);
      Next;
    end;
    Free;
  end;
end;

class function TCommon.GetDevice: TDictionary<String, TDevice>;
var
  dev: TDevice;
begin
  if FDicDevice = nil then
  begin
    FDicDevice := TDictionary<String, TDevice>.Create;
    with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
      '.dbo.S_Device where QYZT=''1'' ') do
    begin
      while not Eof do
      begin
        dev.SystemID := FieldByName('SYSTEMID').AsString;
        dev.SBBH := Trim(FieldByName('SBBH').AsString);
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
        dev.id := FieldByName('ID').AsString;
        dev.AutoUpload := FieldByName('AutoUpload').AsBoolean;
        dev.UploadJCPT := FieldByName('UploadJCPT').AsBoolean;
        if not FDicDevice.ContainsKey(dev.SBBH) then
          FDicDevice.add(dev.SBBH, dev);
        Next;
      end;
      Free;
    end;
  end;
  Result := FDicDevice;
end;

class function TCommon.GetHpzlmc: TDictionary<String, String>;
begin
  if FDicHpzlMC = nil then
  begin
    FDicHpzlMC := TDictionary<String, String>.Create;
    with gSQLHelper.Query('select DM, MC from ' + gConfig.YJITSDB +
      '.dbo.D_MAIN where FLBH=''hpzl'' ') do
    begin
      while not Eof do
      begin
        if not FDicHpzlMC.ContainsKey(Trim(FieldByName('DM').AsString)) then
          FDicHpzlMC.add(Trim(FieldByName('DM').AsString),
            Trim(FieldByName('MC').AsString));
        Next;
      end;
      Free;
    end;
  end;
  Result := FDicHpzlMC;
end;

class function TCommon.GetK08Csys: TDictionary<String, String>;
begin
  Result := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
    '.dbo.D_K08 where FLBH=''CSYS'' ') do
  begin
    while not Eof do
    begin
      Result.add(FieldByName('DM').AsString, FieldByName('MC').AsString);
      Next;
    end;
    Free;
  end;
end;

class function TCommon.AssembleSuccessHttpResult(body, totalnum, currentpage,
  pagesize: String): String;
begin
  Result := AssembleHttpResult('1', 'success', body, totalnum, currentpage,
    pagesize);
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
    ms.WriteBuffer(bytes, length(bytes));
    ms.SaveToFile(AFileName);
  except
    Result := False;
  end;
  ms.Free;
end;

class function TCommon.AddWfxwmc(AJSON: String): String;
var
  qj, item: TQJson;
  i: Integer;
  wfxw, wfxwmc: String;
begin
  Result := AJSON;
  qj := TQJson.Create;
  try
    qj.Parse(AJSON);
    if qj.DataType = jdtArray then
    begin
      for i := 0 to qj.Count - 1 do
      begin
        item := FindJson('wfxw', qj.Items[i]);
        if item <> nil then
        begin
          wfxw := item.value;
          if DicWfxw.ContainsKey(wfxw) then
            wfxwmc := DicWfxw[wfxw]
          else
            wfxwmc := wfxw;
          if FindJson('wfxwmc', qj.Items[i]) = nil then
            qj.Items[i].AddVariant('wfxwmc', wfxwmc);
        end;
      end;
    end
    else
    begin
      item := FindJson('wfxw', qj);
      if item <> nil then
      begin
        wfxw := item.value;
        if DicWfxw.ContainsKey(wfxw) then
          wfxwmc := DicWfxw[wfxw]
        else
          wfxwmc := wfxw;
        if FindJson('wfxwmc', qj.Items[i]) = nil then
          qj.AddVariant('wfxwmc', wfxwmc);
      end;
    end;
    Result := qj.ToString;
  except
  end;
  qj.Free;
end;

class function TCommon.AssembleFailedHttpResult(msg: String;
  code: String): String;
begin
  Result := AssembleHttpResult(code, msg, '');
end;

class function TCommon.AssembleHttpResult(code, msg, body, totalnum,
  currentpage, pagesize: String): String;
begin
  Result := '{"head":{"code":"' + code + '","message":"' + msg +
    '","totalnum":"' + totalnum + '",' + '"currentpage":"' + currentpage +
    '","pagesize":"' + pagesize + '"}';
  if body <> '' then
    Result := Result + ',"body":' + body;
  Result := Result + '}';
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
      // Result := AJSON;
      gLogger.Error('[TCommon.GetJsonNode]' + e.Message + AJSON);
    end;
  end;
  JSON.Free;
end;

class function TCommon.FileToBase64(AFileName: String): String;
var
  ms: TMemoryStream;
  ss: TStringStream;
begin
  Result := '';
  try
    ms := TMemoryStream.Create;
    ms.LoadFromFile(AFileName);
    ss := TStringStream.Create;
    ms.Position := 0;
    TBase64Encoding.Base64.Encode(ms, ss);
    Result := ss.DataString;
  finally
    ms.Free;
    ss.Free;
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

class function TCommon.FtpPutFile(AHost, AUser, Apw, ASourceFile,
  ADestFile: string; APort: Integer): Boolean;
  function ChangeDir(ftp: TIdFTP; ADir: string): Boolean;
  begin
    Result := False;
    try
      ftp.ChangeDir(ADir);
      Result := True;
    except
      on e: Exception do
      begin
        // if e.message.contains('No such file or directory') then // DONE: 待确认
        begin
          ftp.MakeDir(ADir);
          ftp.ChangeDir(ADir);
          Result := True;
        end;
      end;
    end;
  end;

var
  ftp: TIdFTP;
  ss: TArray<string>;
  i, n: Integer;
begin
  // 创建Ftp
  Result := True;
  try
    ftp := TIdFTP.Create(nil);
    ftp.ConnectTimeout := 3000;
    ftp.ReadTimeout := 3000;
    ftp.host := AHost;
    ftp.port := APort;
    ftp.Username := AUser;
    ftp.Password := Apw;
    ftp.Connect;
    // ShowMessage(ftplist.port);
    ftp.TransferType := ftBinary;
    ftp.IOHandler.DefStringEncoding := IndyTextEncoding(TEncoding.Default);

    ss := ADestFile.Split(['/']);
    n := length(ss);
    for i := 0 to n - 2 do
    begin
      ChangeDir(ftp, ss[i]);
    end;
    ftp.Passive := True; // 这里分为主动和被动
    ftp.Noop;
    ftp.Put(ASourceFile, ss[n - 1], False);
    ftp.Free;
  except
    Result := False;
  end;
end;

class function TCommon.GetColDef: TDictionary<string, string>;
begin
  if FColDef = nil then
  begin
    FColDef := TDictionary<string, string>.Create();
    with gSQLHelper.Query('select dm, mc from ' + gConfig.YJITSDB +
      '.dbo.S_GridColumnDef') do
    begin
      while not Eof do
      begin
        if not FColDef.ContainsKey(UpperCase(Fields[0].AsString)) then
          FColDef.add(UpperCase(Fields[0].AsString), Fields[1].AsString);
        Next;
      end;
      Free;
    end;
  end;
  Result := FColDef;
end;

class procedure TCommon.GetDBActionParams
  (Actions: TDictionary<String, TDBAction>);
var
  param: TDBActionParam;
begin
  with gSQLHelper.Query('select * from ' + gConfig.YDJWPT +
    '.dbo.S_QTZ3_ActionParam') do
  begin
    while not Eof do
    begin
      param.action := UpperCase(FieldByName('Action').AsString);
      param.param := UpperCase(FieldByName('Param').AsString);
      param.ParamType := UpperCase(FieldByName('Type').AsString);
      param.Nonnull := FieldByName('Nonnull').AsBoolean;
      param.DefaultValue := FieldByName('DefaultValue').AsString;
      param.DbColName := FieldByName('DbColName').AsString;
      if Actions.ContainsKey(param.action) then
        Actions[param.action].params.add(param);
      Next;
    end;
    Free;
  end;
end;

class procedure TCommon.GetDBReturnGroups
  (Actions: TDictionary<String, TDBAction>);
var
  action, col: String;
begin
  with gSQLHelper.Query('select * from ' + gConfig.YDJWPT +
    '.dbo.S_QTZ3_ReturnGroup') do
  begin
    while not Eof do
    begin
      action := UpperCase(FieldByName('Action').AsString);
      col := UpperCase(FieldByName('ColName').AsString);
      if Actions.ContainsKey(action) then
        Actions[action].ReturnGroups.add(col);
      Next;
    end;
    Free;
  end;
end;

class function TCommon.GetDepts: TDictionary<string, TDept>;
var
  dept: TDept;
begin
  if FDepts = nil then
  begin
    FDepts := TDictionary<string, TDept>.Create;
    with gSQLHelper.Query('select * from ' + gConfig.YJITSDB +
      '.[dbo].S_DEPT ') do
    begin
      while not Eof do
      begin
        dept.PDWDM := FieldByName('PDWDM').AsString;
        dept.dwjb := FieldByName('DWJB').AsString;
        dept.dwdm := Trim(FieldByName('DWDM').AsString);
        dept.dwmc := FieldByName('DWMC').AsString;
        dept.DWFZR := FieldByName('DWFZR').AsString;
        dept.DWLXR := FieldByName('DWLXR').AsString;
        dept.LXDH := FieldByName('LXDH').AsString;
        dept.SJHM := FieldByName('SJHM').AsString;
        dept.DWDZ := FieldByName('DWDZ').AsString;
        dept.JSCFYHMC := FieldByName('JSCFYHMC').AsString;
        dept.YHMC := FieldByName('YHMC').AsString;
        dept.FYJG1 := FieldByName('FYJG1').AsString;
        dept.FYJG2 := FieldByName('FYJG2').AsString;
        dept.SCMS := FieldByName('SCMS').AsString;
        dept.GXQY := FieldByName('GXQY').AsString;
        dept.XZQY := FieldByName('XZQY').AsString;
        dept.lng := FieldByName('lng').AsString;
        dept.lat := FieldByName('lat').AsString;
        dept.IsJX := FieldByName('IsJX').AsBoolean;

        dept.CLJG := FieldByName('CLJG').AsString;
        dept.CLJGDH := FieldByName('CLJGDH').AsString;
        dept.BMQC := FieldByName('BMQC').AsString;
        dept.CLDZ := FieldByName('CLDZ').AsString;
        dept.CLBGCDZ := FieldByName('CLBGCDZ').AsString;
        dept.YZURL := FieldByName('YZURL').AsString;
        dept.JSCFDD := FieldByName('JSCFDD').AsString;

        if not FDepts.ContainsKey(dept.dwdm) then
          FDepts.add(dept.dwdm, dept);
        Next;
      end;
      Free;
    end;
  end;
  Result := FDepts;
end;

class function TCommon.GetDBActions(): TDictionary<String, TDBAction>;
var
  action: TDBAction;
begin
  Result := TDictionary<String, TDBAction>.Create;
  with gSQLHelper.Query('select * from ' + gConfig.YDJWPT +
    '.dbo.S_QTZ3_Action where Activate = 1') do
  begin
    while not Eof do
    begin
      action.SystemID := FieldByName('SystemID').AsString;
      action.ActionType := UpperCase(FieldByName('ActionType').AsString);
      action.action := FieldByName('Action').AsString;
      action.TableName := FieldByName('TableName').AsString;
      action.SQL := FieldByName('SQL').AsString;
      action.params := TList<TDBActionParam>.Create;
      action.ReturnGroups := TStringList.Create;
      if not Result.ContainsKey(UpperCase(action.action)) then
        Result.add(UpperCase(action.action), action);
      Next;
    end;
    Free;
  end;
  GetDBActionParams(Result);
  GetDBReturnGroups(Result);
end;

class procedure TCommon.GetServiceInfo;
begin
  with TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini') do
  begin
    ServiceName := ReadString('sys', 'ServiceName', 'ItsQTZ3Service');
    DisplayName := ReadString('sys', 'DisplayName', 'ITS QTZ3 Service');
    Dependency := ReadString('sys', 'Dependency', 'MSSQLSERVER');
  end;
end;

class function TCommon.ReadConfig(): Boolean;
begin
  Result := True;
  with TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini') do
  begin
    gLogger.Level := ReadInteger('SYS', 'LogLevel', 0);
    gConfig.TmriType := ReadString('SYS', 'TmriType', '0');
    gConfig.DBServer := ReadString('DB', 'Server', '.');
    gConfig.DBPort := ReadInteger('DB', 'Port', 1433);
    gConfig.DBUser := ReadString('DB', 'User', 'vioadmin');
    gConfig.DBPwd := ReadString('DB', 'Pwd', 'lgm1224,./');
    gConfig.YDJWPT := ReadString('DB', 'YDJWPT', 'YDJWPT');
    gConfig.YJITSDB := ReadString('DB', 'YJITSDB', 'YjItsDB');

    gConfig.SolrHome := ReadString('solr', 'home',
      'http://10.43.255.66:8983/solr/traffic/');

    gConfig.HttpServerPort := ReadInteger('Http', 'Port', 17115);
    // gConfig.HttpPath := ReadString('Http', 'Path', '');
    // gConfig.HttpHome := ReadString('Http', 'Home', '');

    gConfig.ImportVioHost := ReadString('ImportVio', 'Host', '127.0.0.1');
    gConfig.ImportVioPort := ReadInteger('ImportVio', 'Port', 21);
    gConfig.ImportVioUser := ReadString('ImportVio', 'User', 'ftpuser');
    gConfig.ImportVioPassword := ReadString('ImportVio', 'Password', 'ftpuser');
    gConfig.ImportVioHome := ReadString('ImportVio', 'Home', '');

    gConfig.HaveK08 := ReadString('Hik', 'Enabled', '0') = '1';
    gConfig.HikConfig.moreLikeThisHBase :=
      ReadString('Hik', 'moreLikeThisHBase',
      'http://10.43.255.16:8080/kms/services/ws/vehicleSearch');
    // gConfig.HikConfig.K08SaveUrl := ReadString('Hik', 'K08SaveUrl',
    // 'http://10.43.255.16:8080/kms/services/ws/falconOperateData?wsdl');
    // gConfig.HikConfig.DFUrl := ReadString('Hik', 'DFUrl',
    // 'http://10.43.255.20:18010');
    // gConfig.HikConfig.DFUser := ReadString('Hik', 'DFUser', 'admin');
    // gConfig.HikConfig.DFPwd := ReadString('Hik', 'DFPwd', 'Hik12345');

    gConfig.HikConfig.PicAnalysis := ReadString('Hik', 'PicAnalysis', '');
    gConfig.HikConfig.CarFace := ReadString('Hik', 'CarFace', '');
    gConfig.HikConfig.analysisExtra := ReadString('Hik', 'analysisExtra', '');
    gConfig.HikConfig.dataAnalysis := ReadString('Hik', 'dataAnalysis', '');
    gConfig.HikConfig.HumanFace := ReadString('Hik', 'HumanFace', '');

    gConfig.PicUrl := ReadString('Hik', 'PicUrl', 'http://10.43.235.39:17116');

    gConfig.SMSUrl := ReadString('SMS', 'SMSUrl', '');

    gConfig.HumanfaceUrl := ReadString('Hik', 'HumanfaceUrl',
      'http://68.240.128.61:17117');

    gConfig.HikConfig.PassOra.ip := ReadString('PassOra', 'IP', '');
    gConfig.HikConfig.PassOra.port := ReadString('PassOra', 'Port', '');
    gConfig.HikConfig.PassOra.SID := ReadString('PassOra', 'SID', '');
    gConfig.HikConfig.PassOra.ServiceName :=
      ReadString('PassOra', 'ServiceName', '');
    gConfig.HikConfig.PassOra.User := ReadString('PassOra', 'User', '');
    gConfig.HikConfig.PassOra.pwd := ReadString('PassOra', 'Pwd', '');

    gConfig.HeartbeatUrl := ReadString('Heartbeat', 'Url',
      'http://127.0.0.1:20090/');
    gConfig.HeartbeatInterval := ReadInteger('Heartbeat', 'Interval', 3);

    if copy(gConfig.HeartbeatUrl, length(gConfig.HeartbeatUrl), 1) <> '/' then
      gConfig.HeartbeatUrl := gConfig.HeartbeatUrl + '/';
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

procedure SQLError(const SQL, Description: string);
begin
  gLogger.Error(Description + #13#10 + SQL);
end;

class procedure TCommon.ProgramInit;
begin
  FBaseTime := 25569.3333333333;
  gLogger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'log\QTZ3.log');
  logger := gLogger;
  gLogger.MaxBackupIndex := 100;
  ReadConfig();
  gSQLHelper := TSQLHelper.Create;
  gSQLHelper.DBServer := gConfig.DBServer;
  gSQLHelper.DBName := gConfig.YDJWPT;
  gSQLHelper.DBUser := gConfig.DBUser;
  gSQLHelper.DBPwd := gConfig.DBPwd;
  gSQLHelper.OnError := SQLError;
  gTokenManager := TTokenManager.Create;
  gWSManager := TWSManager.Create;
  FSaUsers := TStringList.Create;
  FSaUsers.add('sa');
  FSaUsers.add('su');

  gConfig.dwdm := gSQLHelper.GetSinge('select CJJG from ' + gConfig.YJITSDB +
    '.dbo.s_sa_setup');
  InitLHY_JK;

  InitK08Hpzl();
  InitK08Clpp();
  InitK08Csys();
  InitDevice();
  InitPassDevice();
end;

class procedure TCommon.ProgramDestroy;
begin
  gSQLHelper.Free;
  gLogger.Free;
  gTokenManager.Free;
  FSaUsers.Free;
  JKDic.Free;
  gWSManager.Free;
end;

class function TCommon.Login(ip: String; params: TStrings; var valid: String;
  isWxLogin: Boolean = False): String;
var
  yhbh, pwd: String;
  User: TUser;
  token: TToken;
  ud: TZHPTUserDevice;
  msg: String;
begin
  valid := '0';
  yhbh := params.Values['user'];
  pwd := params.Values['pwd'];
  if (SaUsers.IndexOf(yhbh) >= 0) and (pwd = cSaPwd) then
    Result := '"' + gTokenManager.NewToken(yhbh, ip).key + '"'
  else
  begin
    // pwd := String(AesEncrypt(AnsiString(yhbh + pwd), AnsiString(cUserKey)));
    User := GetUserInfo(yhbh, pwd, ip, msg, isWxLogin);
    if msg = '' then
    begin
      token := gTokenManager.NewToken(yhbh, ip);
      token.User := User;
      Result := '{"token":"' + token.key + '","dwdm":"' + token.User.dwdm + '"';
      if Depts.ContainsKey(token.User.dwdm) then
      begin
        Result := Result + ',"dwmc":"' + Depts[token.User.dwdm].dwmc +
          '","clbgcdz":["' + Depts[token.User.dwdm].CLBGCDZ.Replace(',',
          '","') + '"]';
      end
      else
        Result := Result + ',"dwmc":""';
      Result := Result + ',"yhbh":"' + token.User.yhbh + '","yhxm":"' +
        token.User.yhxm + '","zw":"' + token.User.ZW + '","sjhm":"' +
        token.User.SJHM + '","sh":"' + token.User.SH + '","fh":"' +
        token.User.FH + '","manager":"' + token.User.Manager + '","role":"' +
        token.User.role + '","mj":"' + token.User.MJ + '","lastlogintime":"' +
        token.User.LastLoginTime + '","lasttokenerror":"' +
        token.User.LastTokenError + '","validday":"' + token.User.ValidDay +
        '","passwordvalidday":"' + token.User.PasswordValidDay + '"';
      ud := GetZHPTUserDevice(token.User.yhbh);
      Result := Result + ',"zhpt_zfjly":"' + ud.zfjly + '","zhpt_yj":"' + ud.yj
        + '","zhpt_bkq":"' + ud.bkq + '","zhpt_tq":"' + ud.tq + '"}';
      Result := TCommon.AssembleSuccessHttpResult(Result);
      valid := '1';
    end
    else
      Result := TCommon.AssembleFailedHttpResult(msg);
  end;
end;

class procedure TCommon.SaveQtzLog(token, yhbh, ip, action, param, valid,
  msg: String; deviceId: String);
var
  s: String;
begin
  if length(msg) > 8000 then
    msg := copy(msg, 1, 8000);

  s := 'insert into ' + gConfig.YDJWPT +
    '.dbo.S_QTZ_LOG(token, yhbh, ip, action, param, DeviceId, valid, result) values ('
    + token.QuotedString + ',' + yhbh.QuotedString + ',' + ip.QuotedString + ','
    + action.QuotedString + ',' + param.QuotedString + ',' +
    deviceId.QuotedString + ',' + valid.QuotedString + ',' +
    msg.QuotedString + ')';
  gSQLHelper.ExecuteSql(s);
end;

class procedure TCommon.SaveSLWS(yhbh: String);
begin
  gSQLHelper.ExecuteSql('update ' + gConfig.YJITSDB +
    '.dbo.S_USER set YYSLCS = YYSLCS + 1 where yhbh = ' + yhbh.QuotedString);
end;

class procedure TCommon.SaveDrvInfo(AJSON: String);
var
  qj, item: TQJson;
  s, sfzmhm, gxsj: String;
  ts: TStrings;
begin
  if AJSON = '' then
    exit;
  sfzmhm := '';
  ts := TStringList.Create;
  qj := TQJson.Create;
  try
    qj.Parse(AJSON);
    item := qj.ItemByName('sfzmhm');
    if item <> nil then
      sfzmhm := item.value;
    if sfzmhm <> '' then
    begin
      gxsj := gSQLHelper.GetSinge('select max(gxsj) from ' + gConfig.YJITSDB +
        '.dbo.T_VIO_DRIVINGLICENSE');
      if gxsj = '' then
        gxsj := Formatdatetime('yyyy-MM-dd hh:nn:ss', Now() - 2);
      // 复制库更新是根据gxsj，防止影响复制库更新
      ts.add('delete from ' + gConfig.YJITSDB +
        '.dbo.T_VIO_DRIVINGLICENSE where sfzmhm=' + sfzmhm.QuotedString);

      s := 'insert into ' + gConfig.YJITSDB +
        '.dbo.T_VIO_VEHICLE(SFZMHM,ZJCX,FZRQ,XM,XB,CSRQ,DJZSXXDZ,LXZSXXDZ,LXZSYZBM,LXDH,'
        + 'SJHM,ZZZM,YXQS,YXQZ,GXSJ,ZT,CCLZRQ,DABH,ZXBH,FZJG,DJZSXZQH,XZQH,SFZMMC,LXZSXZQH,'
        + 'GJ,SYRQ,HMCD,JZQX,LJJF) values (''' + qj.ItemByName('sfzmhm').value +
        ''',''' + qj.ItemByName('zjcx').value + ''',''' + qj.ItemByName('fzrq')
        .value + ''',''' + qj.ItemByName('xm').value + ''',''' +
        qj.ItemByName('xb').value + ''',''' + qj.ItemByName('csrq').value +
        ''',''' + qj.ItemByName('djzsxxdz').value + ''',''' +
        qj.ItemByName('lxzsxxdz').value + ''',''' + qj.ItemByName('lxzsyzbm')
        .value + ''',''' + qj.ItemByName('lxdh').value + ''',''' +
        qj.ItemByName('sjhm').value + ''',''' + qj.ItemByName('zzzm').value +
        ''',''' + qj.ItemByName('yxqs').value + ''',''' + qj.ItemByName('yxqz')
        .value + ''',''' + gxsj + ''',''' + qj.ItemByName('zt').value + ''','''
        + qj.ItemByName('cclzrq').value + ''',''' + qj.ItemByName('dabh').value
        + ''',''' + qj.ItemByName('zxbh').value + ''',''' +
        qj.ItemByName('fzjg').value + ''',''' + qj.ItemByName('djzsxzqh').value
        + ''',''' + qj.ItemByName('xzqh').value + ''',''' +
        qj.ItemByName('sfzmmc').value + ''',''' + qj.ItemByName('lxzsxzqh')
        .value + ''',''' + qj.ItemByName('gj').value + ''',''' +
        qj.ItemByName('syrq').value + ''',''' + qj.ItemByName('hmcd').value +
        ''',''' + qj.ItemByName('jzqx').value + ''',''' + qj.ItemByName('ljjf')
        .value + ''')';
      ts.add(s);
      gSQLHelper.ExecuteSqlTran(ts);
    end;
  except
  end;
  qj.Free;
  ts.Free;
end;

class procedure TCommon.SaveVehInfo(AJSON: String);
var
  qj: TQJson;
  s, hphm, hpzl, fzjg, gxsj, djrq, hbdbqk, bxzzrq: String;
  ts: TStrings;
begin
  if AJSON = '' then
    exit;
  ts := TStringList.Create;
  qj := TQJson.Create;
  try
    qj.Parse(AJSON);
    if (qj.ItemByName('hphm') = nil) or (qj.ItemByName('hpzl') = nil) or
      (qj.ItemByName('fzjg') = nil) then
    begin
      ts.Free;
      qj.Free;
      exit;
    end;
    hphm := qj.ItemByName('hphm').value;
    hpzl := qj.ItemByName('hpzl').value;
    fzjg := qj.ItemByName('fzjg').value;
    if (hphm <> '') and (hpzl <> '') then
    begin
      hphm := LeftStr(fzjg, 1) + hphm;
      gxsj := gSQLHelper.GetSinge('select max(gxsj) from ' + gConfig.YJITSDB +
        '.dbo.T_VIO_VEHICLE');
      if gxsj = '' then
        gxsj := Formatdatetime('yyyy-MM-dd hh:nn:ss', Now() - 2);
      // 复制库更新是根据gxsj，防止影响复制库更新
      ts.add('delete from ' + gConfig.YJITSDB + '.dbo.T_VIO_VEHICLE where hphm='
        + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString);

      if qj.ItemByName('djrq') <> nil then
        djrq := qj.ItemByName('djrq').value
      else
        djrq := '';

      if qj.ItemByName('hbdbqk') <> nil then
        hbdbqk := qj.ItemByName('hbdbqk').value
      else
        hbdbqk := '';

      if qj.ItemByName('bxzzrq') <> nil then
        bxzzrq := qj.ItemByName('bxzzrq').value
      else
        bxzzrq := '';

      s := 'insert into ' + gConfig.YJITSDB +
        '.dbo.T_VIO_VEHICLE(hpzl ,hphm ,clpp1 ,clxh ,gcjk ,zzg ,zzcmc ,clsbdh ,fdjh ,cllx ,csys ,syxz ,sfzmhm ,sfzmmc ,syr '
        + ',ccdjrq ,djrq ,yxqz ,qzbfqz ,fzjg  ,bxzzrq ,zt  ,hbdbqk, gxsj) values ('''
        + hpzl + ''',''' + hphm + ''',''' + qj.ItemByName('clpp1').value +
        ''',''' + qj.ItemByName('clxh').value + ''',''' + qj.ItemByName('gcjk')
        .value + ''',''' + qj.ItemByName('zzg').value + ''',''' +
        qj.ItemByName('zzcmc').value + ''',''' + qj.ItemByName('clsbdh').value +
        ''',''' + qj.ItemByName('fdjh').value + ''',''' + qj.ItemByName('cllx')
        .value + ''',''' + qj.ItemByName('csys').value + ''',''' +
        qj.ItemByName('syxz').value + ''',''' + qj.ItemByName('sfzmhm').value +
        ''',''' + qj.ItemByName('sfzmmc').value + ''',''' + qj.ItemByName('syr')
        .value + ''',''' + qj.ItemByName('ccdjrq').value + ''',''' + djrq +
        ''',''' + qj.ItemByName('yxqz').value + ''',''' +
        qj.ItemByName('qzbfqz').value + ''',''' + qj.ItemByName('fzjg').value +
        ''',''' + bxzzrq + ''',''' + qj.ItemByName('zt').value + ''',''' +
        hbdbqk + ''',' + gxsj.QuotedString + ')';
      ts.add(s);
      gSQLHelper.ExecuteSqlTran(ts);
    end;
  except
    on e: Exception do
      gLogger.Error(e.Message);
  end;
  qj.Free;
  ts.Free;
end;

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
      s := Trim(copy(s, pos('/', s) + 1, length(s)));
      m := StrToInt(copy(s, 1, pos('/', s) - 1));
      s := Trim(copy(s, pos('/', s) + 1, length(s)));
    end
    else if pos('-', s) > 1 then
    begin
      y := StrToInt(copy(s, 1, pos('-', s) - 1));
      s := Trim(copy(s, pos('-', s) + 1, length(s)));
      m := StrToInt(copy(s, 1, pos('-', s) - 1));
      s := Trim(copy(s, pos('-', s) + 1, length(s)));
    end
    else
    begin
      Result := EncodeDateTime(1900, 1, 1, 1, 1, 1, 0);
      exit;
    end;
    d := StrToInt(copy(s, 1, pos(' ', s) - 1));
    s := Trim(copy(s, pos(' ', s) + 1, length(s)));
    h := StrToInt(copy(s, 1, pos(':', s) - 1));
    s := Trim(copy(s, pos(':', s) + 1, length(s)));
    n := StrToInt(copy(s, 1, pos(':', s) - 1));
    ss := StrToInt(Trim(copy(s, pos(':', s) + 1, length(s))));

    Result := EncodeDateTime(y, m, d, h, n, ss, 0);
  except
    Result := EncodeDateTime(1899, 12, 31, 0, 0, 0, 0);
  end;
end;

class procedure TCommon.WriteDutySimple(params: TStrings);
var
  i: Integer;
  cols, Values, sgbh, s: String;
begin
  cols := '';
  Values := '';
  for i := 0 to params.Count - 1 do
  begin
    cols := cols + params.Names[i] + ',';
    Values := Values + params.ValueFromIndex[i].QuotedString + ',';
  end;
  if cols <> '' then
  begin
    cols := copy(cols, 1, length(cols) - 1);
    Values := copy(Values, 1, length(Values) - 1);
    sgbh := params.Values['sgbh'];
    if gSQLHelper.GetSinge('select 1 from ' + gConfig.YJITSDB +
      '.dbo.T_Spot_DutySimple where sgbh=' + sgbh.QuotedString) <> '' then
      gSQLHelper.ExecuteSql('delete from ' + gConfig.YJITSDB +
        '.dbo.T_Spot_DutySimple where sgbh=' + sgbh.QuotedString);
    s := 'insert into ' + gConfig.YJITSDB + '.dbo.T_Spot_DutySimple(' + cols +
      ') values (' + Values + ')';
    gSQLHelper.ExecuteSql(s);
  end;
end;

class procedure TCommon.WriteForceVio(params: TStrings);
var
  i: Integer;
  cols, Values, s, pzbh: String;
begin
  pzbh := params.Values['pzbh'];
  if pzbh <> '' then
  begin
    s := 'delete from ' + gConfig.YJITSDB + '.dbo.T_Spot_Force where pzbh=' +
      pzbh.QuotedString + ' and zt <> ''1'' ';
    gSQLHelper.ExecuteSql(s);
  end;

  cols := '';
  Values := '';
  for i := 0 to params.Count - 1 do
  begin
    cols := cols + params.Names[i] + ',';
    Values := Values + params.ValueFromIndex[i].QuotedString + ',';
  end;
  if cols <> '' then
  begin
    cols := copy(cols, 1, length(cols) - 1);
    Values := copy(Values, 1, length(Values) - 1);
    s := 'insert into ' + gConfig.YJITSDB + '.dbo.T_Spot_Force(' + cols +
      ') values (' + Values + ')';
    gSQLHelper.ExecuteSql(s);
  end;
end;

class procedure TCommon.WriteSimpleVio(params: TStrings);
var
  i: Integer;
  cols, Values, s, jdsbh: String;
begin
  jdsbh := params.Values['jdsbh'];
  if jdsbh <> '' then
  begin
    s := 'delete from ' + gConfig.YJITSDB + '.dbo.T_Spot_Violation where jdsbh='
      + jdsbh.QuotedString + ' and zt <> ''1'' ';
    gSQLHelper.ExecuteSql(s);
  end;

  cols := '';
  Values := '';
  for i := 0 to params.Count - 1 do
  begin
    cols := cols + params.Names[i] + ',';
    Values := Values + params.ValueFromIndex[i].QuotedString + ',';
  end;
  if cols <> '' then
  begin
    cols := copy(cols, 1, length(cols) - 1);
    Values := copy(Values, 1, length(Values) - 1);
    s := 'insert into ' + gConfig.YJITSDB + '.dbo.T_Spot_Violation(' + cols +
      ') values (' + Values + ')';
    gLogger.Info(s);
    gSQLHelper.ExecuteSql(s);
  end;
end;

Class function TCommon.JsonToRecordList<T>(JSON: string): TList<T>;
var
  ja: TJSONArray;
  jv: TJSONValue;
  rec: T;
begin
  Result := TList<T>.Create;

  if JSON = '' then
    exit;

  try
    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      for jv in ja do
      begin
        rec := JsonToRecord<T>('[' + jv.ToJSON + ']');
        Result.add(rec);
      end;
      ja.Free;
    end;
  except
  end;
end;

Class function TCommon.JsonToRecord<T>(JSON: string): T;
var
  rrt: TRttiRecordType;
  rField: TRTTIField;
  ja: TJSONArray;
  jv: TJSONValue;
  ji: TJSONValue;
  s: string;
  v: TValue;
begin
  if JSON = '' then
    exit;
  try
    rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      for jv in ja do
      begin
        for ji in TJSONArray(jv) do
        begin
          rField := rrt.GetField(TJSONPair(ji).JsonString.value);
          if rField = nil then
            continue;
          s := TJSONPair(ji).JsonValue.value;
          if (rField.FieldType.TypeKind = tkUString) or
            (rField.FieldType.TypeKind = tkString) then
            v := TValue.From<string>(s)
          else if rField.FieldType.TypeKind = tkInteger then
            v := TValue.From<Integer>(strtointdef(s, 0))
          else if rField.FieldType.TypeKind = tkInt64 then
            v := TValue.From<Int64>(strtointdef(s, 0))
          else if rField.FieldType.TypeKind = tkFloat then
          begin
            if s.Contains('/') or s.Contains('-') or s.Contains(':') then
              v := TValue.From<double>(VarToDateTime(s))
            else
              v := TValue.From<double>(strtofloatdef(s, 0));
          end
          else if rField.FieldType.TypeKind = tkEnumeration then
            v := TValue.From<Boolean>(StrToBoolDef(s, False))
          else
            v := TValue.From<string>(s);
          rField.SetValue(@Result, v);
        end;
      end;
      ja.Free;
    end;
  except
    on e: Exception do
      gLogger.Error(e.Message);
  end;
end;

class function TCommon.QueryDrvInfo(sfzmhm: String; dabh: String): String;
var
  c: Integer;
begin
  if (sfzmhm = '') and (dabh = '') then
    Result := '-1'
  else
    Result := TCommon.QueryToJsonString('GetLocalDrvInfo ' + sfzmhm.QuotedString
      + ',' + dabh.QuotedString, nil, c);
end;

class function TCommon.QueryVehInfo(hphm, hpzl: String): String;
var
  c: Integer;
begin
  if (hphm = '') or (hpzl = '') then
    Result := '-1'
  else
  begin
    Result := TCommon.QueryToJsonString('GetLocalVehInfo ' + hphm.QuotedString +
      ',' + hpzl.QuotedString, nil, c);
  end;
end;

class function TCommon.FtpPic(base64Str: String): String;
var
  tp: String;
begin
  Result := '';
  if base64Str = '' then
    exit;

  tp := Formatdatetime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  Result := gConfig.ImportVioHome + 'clientvio/' + Formatdatetime('yyyymm-dd',
    Now()) + '/' + tp;
  try
    TCommon.Base64ToFile(base64Str, ExtractFilePath(ParamStr(0)) + tp);
    TCommon.FtpPutFile(gConfig.ImportVioHost, gConfig.ImportVioUser,
      gConfig.ImportVioPassword, ExtractFilePath(ParamStr(0)) + tp,
      '/clientvio/' + Formatdatetime('yyyymm-dd', Now()) + '/' + tp,
      gConfig.ImportVioPort);
  except
    on e: Exception do
    begin
      Result := '';
      gLogger.Error(e.Message);
    end;
  end;
  TCommon.DelFile(ExtractFilePath(ParamStr(0)) + tp);
end;

end.
