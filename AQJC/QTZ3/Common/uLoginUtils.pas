unit uLoginUtils;

interface

uses
  UEntity, SysUtils, Classes, uTokenManager, uGlobal, uCommon, DateUtils, QBAes,
  Math, System.Generics.Collections;

type
  TLoginManager = Class
  private
    class var FRetryUsers: TDictionary<string, integer>;
    class var FRetryDevices: TDictionary<string, integer>;
    class function GetUserInfo(userid, pwd, ip, deviceid: String;
      var msg: String; isWxLogin: Boolean): TUser;
    class function GetZHPTUserDevice(yhbh: String): TZHPTUserDevice;
    class function GetRetryUsers: TDictionary<string, integer>; static;
    class function GetRetryDevices: TDictionary<string, integer>; static;
    class procedure SaveRetry(userid, deviceid, ip: String);
    class function CheckUserStatus(userid: String): Boolean;
    class function CheckDeviceStatus(deviceid: String): Boolean;
  public
    class function Login(ip: String; params: TStrings; var valid: String;
      isWxLogin: Boolean = False): String;
    class procedure SaveSecurityLog(stype, title, level, yhbh, ip,
      descript: String);
    class property RetryUsers: TDictionary<string, integer> read GetRetryUsers;
    class property RetryDevices: TDictionary<string, integer>
      read GetRetryUsers;
  End;

implementation

{ TLoginManager }

class function TLoginManager.CheckDeviceStatus(deviceid: String): Boolean;
begin
  Result := True;
  with gSQLHelper.Query
    ('select status, locktime from S_Device_PDA where deviceid = ' +
    deviceid.QuotedString) do
  begin
    if not Eof then
    begin
      if not Fields[0].AsBoolean then
      begin
        if DateUtils.MinutesBetween(Fields[1].AsDateTime, now) <
          TCommon.PolicySetting.LockTime then
          Result := False
        else
          gSQLHelper.Query('delete from S_Device_PDA where deviceid = ' +
            deviceid.QuotedString);
      end;
    end;
    Free;
  end;
end;

class function TLoginManager.CheckUserStatus(userid: String): Boolean;
begin
  Result := True;
  with gSQLHelper.Query('select zt, locktime from ' + cDBName +
    '.dbo.S_User where yhbh = ' + userid.QuotedString) do
  begin
    if not Eof then
    begin
      if not Fields[0].AsBoolean then
      begin
        if DateUtils.MinutesBetween(Fields[1].AsDateTime, now) <
          TCommon.PolicySetting.LockTime then
          Result := False
        else
          gSQLHelper.Query('update ' + cDBName +
            '.dbo.S_User set zt = 1 where yhbh = ' + userid.QuotedString);
      end;
    end;
    Free;
  end;
end;

class function TLoginManager.GetRetryDevices: TDictionary<string, integer>;
begin
  if FRetryDevices = nil then
    FRetryDevices := TDictionary<string, integer>.Create;
  Result := FRetryDevices;
end;

class function TLoginManager.GetRetryUsers: TDictionary<string, integer>;
begin
  if FRetryUsers = nil then
    FRetryUsers := TDictionary<string, integer>.Create;
  Result := FRetryUsers;
end;

class function TLoginManager.GetUserInfo(userid, pwd, ip, deviceid: String;
  var msg: String; isWxLogin: Boolean): TUser;
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
        if DateUtils.SecondsBetween(now,
          TCommon.GetRealDatetime(StrToInt64Def(s, 0))) < 60 then
          Result := True;
      end;
    end;
  end;

begin
  hhnnss := Formatdatetime('hhnnss', now);
  msg := '';
  // with gSQLHelper.Query('select * from ' + cDBName + '.dbo.S_USER where YHBH = '
  // + userid.QuotedString + ' and mm = ' + pwd.QuotedString) do
  with gSQLHelper.Query('select * from ' + cDBName + '.dbo.S_USER where YHBH = '
    + userid.QuotedString) do
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
        if FieldByName('IsMJ').AsBoolean then
          Result.MJ := '1'
        else
          Result.MJ := '0';
        Result.ValidDay :=
          IntToStr(Ceil(FieldByName('ValidDate').AsDateTime - now));
        Result.PasswordValidDay :=
          IntToStr(Ceil(FieldByName('PasswordValidDate').AsDateTime - now));
        if FieldByName('ValidDate').AsDateTime < now then
          msg := '用户已超过有效期'
        else if FieldByName('PasswordValidDate').AsDateTime < now then
          msg := '密码已超过有效期'
        else if (hhnnss < FieldByName('LoginTimeBegin').AsString) or
          (hhnnss > FieldByName('LoginTimeEnd').AsString) then
          msg := '该时间段不允许登录'
        else if (ip < FieldByName('IPKS').AsString) or
          (hhnnss > FieldByName('IPJS').AsString) then
          msg := '该IP不允许登录'
        else if DateUtils.DaysBetween(FieldByName('lastLoginTime').AsDateTime,
          now) >= TCommon.PolicySetting.UnUseDays then
        begin
          msg := '超过' + IntToStr(TCommon.PolicySetting.UnUseDays) +
            '天未使用,账号被锁定';
          SaveSecurityLog('1', '超过' + IntToStr(TCommon.PolicySetting.UnUseDays)
            + '天未使用', '1', userid, ip, userid);
        end
        else
        begin
          gSQLHelper.ExecuteSql
            ('update s_user set lastLoginTime = getdate() where yhbh=' +
            userid.QuotedString);
          if RetryUsers.ContainsKey(userid) then
            RetryUsers.Remove(userid);
          if RetryDevices.ContainsKey(deviceid) then
            RetryDevices.Remove(deviceid);
        end;
      end
      else
      begin
        SaveRetry(userid, deviceid, ip);
        msg := '密码错误';
      end;
    end
    else
      msg := '用户不存在';
    Free;
  end;
  if msg = '' then
  begin
    with gSQLHelper.Query
      ('select top 1 gxsj from S_QTZ_LOG where action = ''/login'' and param=' +
      userid.QuotedString + ' and valid = 1 order by gxsj desc') do
    begin
      if not Eof then
        Result.LastLoginTime := Formatdatetime('yyyy-mm-dd hh:nn:ss',
          Fields[0].AsDateTime);
      Free;
    end;
    with gSQLHelper.Query('select top 1 gxsj from S_QTZ_LOG where yhbh=' +
      userid.QuotedString + ' and valid = 0 order by gxsj desc') do
    begin
      if not Eof then
        Result.LastTokenError := Formatdatetime('yyyy-mm-dd hh:nn:ss',
          Fields[0].AsDateTime);
      Free;
    end;
  end;
end;

class function TLoginManager.GetZHPTUserDevice(yhbh: String): TZHPTUserDevice;
begin
  with gSQLHelper.Query('select * from S_ZHPT_UserDevice where yhbh = ' +
    yhbh.QuotedString) do
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

class function TLoginManager.Login(ip: String; params: TStrings;
  var valid: String; isWxLogin: Boolean): String;
var
  yhbh, pwd, deviceid: String;
  User: TUser;
  token: TToken;
  ud: TZHPTUserDevice;
  msg: String;
  isSa: Boolean;
begin
  valid := '0';
  yhbh := params.Values['user'];
  pwd := params.Values['pwd'];
  deviceid := params.Values['id'];

  if yhbh = '' then
  begin
    Result := TCommon.AssembleFailedHttpResult('用户id不能为空');
    exit;
  end
  else if deviceid = '' then
  begin
    Result := TCommon.AssembleFailedHttpResult('设备id不能为空');
    exit;
  end;

  if (TCommon.SaUsers.IndexOf(yhbh) >= 0) and (pwd = cSaPwd) then
  begin
    Result := TCommon.AssembleSuccessHttpResult
      ('{"token":"' + gTokenManager.NewToken(yhbh, ip).key + '"}');
    valid := '1';
    exit;
  end;

  if not CheckUserStatus(yhbh) then
  begin
    Result := TCommon.AssembleFailedHttpResult('该用户已被锁定');
    exit;
  end;

  if not CheckDeviceStatus(deviceid) then
  begin
    Result := TCommon.AssembleFailedHttpResult('该设备已被锁定');
    exit;
  end;

  // pwd := String(AesEncrypt(AnsiString(yhbh + pwd), AnsiString(cUserKey)));
  User := GetUserInfo(yhbh, pwd, ip, deviceid, msg, isWxLogin);
  if msg = '' then
  begin
    token := gTokenManager.NewToken(yhbh, ip);
    token.User := User;
    Result := '{"token":"' + token.key + '","systemid":"' + token.User.SystemID
      + '","dwdm":"' + token.User.dwdm + '"';
    if TCommon.Depts.ContainsKey(token.User.dwdm) then
    begin
      Result := Result + ',"dwmc":"' + TCommon.Depts[token.User.dwdm].dwmc +
        '","clbgcdz":"' + TCommon.Depts[token.User.dwdm].CLBGCDZ.Replace(',',
        '","') + '"';
    end
    else
      Result := Result + ',"dwmc":""';
    Result := Result + ',"yhbh":"' + token.User.yhbh + '","yhxm":"' +
      token.User.yhxm + '","zw":"' + token.User.ZW + '","sjhm":"' +
      token.User.SJHM + '","sh":"' + token.User.SH + '","fh":"' + token.User.FH
      + '","manager":"' + token.User.Manager + '","role":"' + token.User.role +
      '","mj":"' + token.User.MJ + '","lastlogintime":"' +
      token.User.LastLoginTime + '","lasttokenerror":"' +
      token.User.LastTokenError + '","validday":"' + token.User.ValidDay +
      '","passwordvalidday":"' + token.User.PasswordValidDay + '"';
    ud := GetZHPTUserDevice(token.User.yhbh);
    Result := Result + ',"zhpt_zfjly":"' + ud.zfjly + '","zhpt_yj":"' + ud.yj +
      '","zhpt_bkq":"' + ud.bkq + '","zhpt_tq":"' + ud.tq + '"}';
    Result := TCommon.AssembleSuccessHttpResult(Result);
    valid := '1';
  end
  else
    Result := TCommon.AssembleFailedHttpResult(msg);
end;

class procedure TLoginManager.SaveRetry(userid, deviceid, ip: String);
begin
  if RetryUsers.ContainsKey(userid) then
    RetryUsers[userid] := RetryUsers[userid] + 1
  else
    RetryUsers.Add(userid, 1);

  if RetryDevices.ContainsKey(deviceid) then
    RetryDevices[deviceid] := RetryDevices[deviceid] + 1
  else
    RetryDevices.Add(deviceid, 1);

  if RetryUsers[userid] >= TCommon.PolicySetting.LoginErrorUser then
  begin
    gSQLHelper.ExecuteSql('update ' + cDBName +
      '.dbo.s_user set zt=0, lockTime = Getdate() where yhbh = ' +
      userid.QuotedString);
    SaveSecurityLog('1', '超过同一用户最大登录重试次数', '1', userid, ip, userid);
  end;

  if RetryDevices[deviceid] >= TCommon.PolicySetting.LoginErrorTerminal then
  begin
    gSQLHelper.ExecuteSql('delete from S_Device_PDA where deviceid = ' +
      deviceid.QuotedString);
    gSQLHelper.ExecuteSql('insert into S_Device_PDA(deviceid,status) values (' +
      deviceid.QuotedString + ',0)');
    SaveSecurityLog('1', '超过同一终端最大登录重试次数', '1', userid, ip, deviceid);
  end;
end;

class procedure TLoginManager.SaveSecurityLog(stype, title, level, yhbh, ip,
  descript: String);
begin
  stype := AesEncrypt(stype, AnsiString(cUserKey));
  title := AesEncrypt(title, AnsiString(cUserKey));
  level := AesEncrypt(level, AnsiString(cUserKey));
  yhbh := AesEncrypt(yhbh, AnsiString(cUserKey));
  ip := AesEncrypt(ip, AnsiString(cUserKey));
  descript := AesEncrypt(descript, AnsiString(cUserKey));
  gSQLHelper.ExecuteSql('insert into ' + cDBName +
    '.dbo.S_SecurityAudit_Log(type,title,level,yhbh,ip,descript) values (' +
    stype.QuotedString + ',' + title.QuotedString + ',' + level.QuotedString +
    ',' + yhbh.QuotedString + ',' + ip.QuotedString + ',' +
    descript.QuotedString + ')');
end;

end.
