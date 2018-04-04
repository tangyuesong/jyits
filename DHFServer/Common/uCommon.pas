unit uCommon;

interface

uses
  SysUtils, IOUtils, Generics.Collections, IniFiles, DB, Classes, IdHTTP,
  uGlobal, uLogger, uTypes, uSQLHelper, uPassList, uTrans, uTmri;

procedure LoadDevice;
procedure LoadAlarm;
procedure LoadAlarmJTP;
procedure LoadAlarmSDCL;
procedure LoadHBC;
procedure LoadMainDic;
procedure LoadVeh;
procedure LoadOpenedDevice;
procedure UpdateDeviceGXSJ(sbbh: string; gxsj: double);
procedure AddSMS(sn, sj, msg: string);
procedure SQLError(const SQL, Description: string);
procedure Initialize;
procedure Finalizat;

implementation


procedure UpdateDeviceGXSJ(sbbh: string; gxsj: double);
var
  sql: string;
begin
  sql := 'update s_device set gxsj=''' + datetimetostr(gxsj) +
    ''' where sbbh=''' + sbbh + '''';
  SQLHelper.ExecuteSql(sql);

  gDicDevice[sbbh].gxsj := gxsj;
end;

procedure LoadHBC;
var
  tmp: TDictionary<string, boolean>;
begin
  tmp := TDictionary<string, boolean>.Create;
  with SQLHelper.Query('select distinct hphm+hpzl from t_hbc where bj=1') do
  begin
    while not EOF do
    begin
      tmp.Add(Fields[0].AsString, true);
      Next;
    end;
    Free;
  end;
  if gOldHBC <> nil then
    gOldHBC.Free;
  gOldHBC := gDicHBC;
  gDicHBC := tmp;
end;

procedure LoadAlarm;
var
  tmp: TDictionary<string, TAlarm>;
  item: TAlarm;
  key: string;
begin
  tmp := TDictionary<string, TAlarm>.Create;
  with SQLHelper.Query('select * from T_KK_ALARM where zt=1') do
  begin
    while not EOF do
    begin
      item.HPHM := FieldByName('HPHM').AsString;
      item.HPZL := FieldByName('HPZL').AsString;
      item.SJHM := FieldByName('SJHM').AsString;
      item.BKLX := FieldByName('BKLX').AsString;
      item.BKZL := FieldByName('BKZL').AsString;
      item.WFCS := FieldByName('WFCS').AsString;
      item.smsBeginTime := FieldByName('smsTimeBegin').AsString;
      item.smsEndTime := FieldByName('smsTimeEnd').AsString;
      item.BZ := FieldByName('BZ').AsString;
      key := item.HPHM + item.HPZL;
      if not tmp.ContainsKey(key) then
        tmp.Add(key, item)
      else begin
        item.SJHM := tmp[key].SJHM + ',' + item.SJHM;
        tmp.AddOrSetValue(key, item);
      end;
      Next;
    end;
    Free;
  end;
  if gOldAlarm <> nil then   // 释放旧的
    gOldAlarm.Free;
  gOldAlarm := gDicAlarm;  // gDicAlarm可能还在被使用，所以不能马上Free
  gDicAlarm := tmp;
end;

procedure LoadAlarmJTP;
var
  s, sjhm: string;
  tmp: TDictionary<string, TAlarm>;
  item: TAlarm;
begin
  s := 'select distinct a.hphm,a.hpzl,b.sjhm,b.smsTimeBegin,b.smsTimeEnd,b.CLPP,b.CSYS,b.KDBH,b.BZ '
     + 'from T_KK_ALARM a inner join T_KK_ALARM_JTP b '
     + 'on ((a.CLPP like ''%'' + b.CLPP + ''%'') or(a.hpzl=b.hpzl) '
     + 'or(b.FZJG like  ''%'' + left(a.HPHM,1) + ''%'' and b.FZJG like ''%'' + substring(a.HPHM,2,1)+''%''))'
     + 'left join T_KK_ALARM_JTP_Except c on a.HPHM=c.HPHM and a.HPZL=c.HPZL '
     + 'where a.zt=1 and b.zt=1 and (a.BKLX=''02'' or a.BKLX=''03'') and c.HPHM is null';
  tmp := TDictionary<string, TAlarm>.Create;
  logger.Info('[LoadAlarmJTP]' + s);
  with SQLHelper.Query(s) do
  begin
    while not EOF do
    begin
      item.HPHM := FieldByName('HPHM').AsString;
      item.HPZL := FieldByName('HPZL').AsString;
      item.SJHM := FieldByName('SJHM').AsString;
      item.CLPP := FieldByName('CLPP').AsString;
      item.CSYS := FieldByName('CSYS').AsString;
      item.KDBH := FieldByName('KDBH').AsString;
      item.smsBeginTime := FieldByName('smsTimeBegin').AsString;
      item.smsEndTime := FieldByName('smsTimeEnd').AsString;
      item.BZ := FieldByName('BZ').AsString;
      s := item.HPHM + item.HPZL;
      if not tmp.ContainsKey(s) then
        tmp.Add(s, item)
      else begin
        item.SJHM := tmp[s].SJHM + ',' + item.SJHM;
        tmp.AddOrSetValue(s, item);
      end;
      Next;
    end;
    Free;
  end;
  if gOldAlarmJTP <> nil then   // 释放旧的
    gOldAlarmJTP.Free;
  gOldAlarmJTP := gDicAlarmJTP;  // gDicAlarmJTP可能还在被使用，所以不能马上Free
  gDicAlarmJTP := tmp;
end;

procedure LoadAlarmSDCL;
var
  s, fzjg, sf, sjhm: string;
  tmp: TList<TAlarm>;
  item: TAlarm;
begin
  s := 'select * from T_KK_ALARM_SDCL';
  tmp := TList<TAlarm>.Create;
  with SQLHelper.Query(s) do
  begin
    while not EOF do
    begin
      fzjg := FieldByName('FZJG').AsString;
      sf := copy(fzjg, 1, 1);
      fzjg := copy(fzjg, 2, 26);
      for s in fzjg.Split([',']) do
      begin
        item.HPHM := sf + s;
        item.HPZL := FieldByName('HPZL').AsString;
        item.KDBH := FieldByName('KDBH').AsString;
        item.SJHM := FieldByName('SJHM').AsString;
        item.BKLX := FieldByName('BKLX').AsString;
        item.smsBeginTime := FieldByName('smsTimeBegin').AsString;
        item.smsEndTime := FieldByName('smsTimeEnd').AsString;
        item.BZ := FieldByName('BZ').AsString;
        tmp.Add(item);
        logger.Info('[LoadAlarmSDCL]' + item.HPHM);
      end;

      Next;
    end;
    Free;
  end;
  if gOldAlarmSDCL <> nil then   // 释放旧的
    gOldAlarmSDCL.Free;
  gOldAlarmSDCL := gListAlarmSDCL;  // gDicAlarmJTP可能还在被使用，所以不能马上Free
  gListAlarmSDCL := tmp;
end;

procedure LoadOpenedDevice;
var
  tmp: TDictionary<string, boolean>;
  s, sbbh: string;
  local: boolean;
begin
  tmp := TDictionary<string, boolean>.Create;
  with SQLHelper.Query('select distinct sbbh,local from s_jcbk_device where closeTime is null ') do
  begin
    while not EOF do
    begin
      s := Fields[0].AsString;
      local := Fields[1].AsInteger = 1;
      for sbbh in s.Split([',']) do
      begin
        if tmp.ContainsKey(sbbh) then
        begin
          if local and (not tmp[sbbh]) then
            tmp[sbbh] := local;
        end
        else
          tmp.Add(sbbh, local);
      end;
      Next;
    end;
    Free;
  end;
  if gOldOpenedDevice <> nil then
    gOldOpenedDevice.Free;
  gOldOpenedDevice := gOpenedDevice;
  gOpenedDevice := tmp;
end;

procedure ClearDevice(dic: TDictionary<string, TDevice>);
var
  dev: TDevice;
begin
  for dev in dic.Values do
    dev.Free;
  dic.Clear;
end;

procedure LoadDevice;
var
  sql: string;
  dev: TDevice;  
  tmpDic: TDictionary<string, TDevice>;
begin
  tmpDic := TDictionary<string, TDevice>.Create;
  sql := 'select * from s_device where qyzt=1';
  with SQLHelper.Query(sql) do
  begin
    while not eof do
    begin
      dev := TDevice.Create;
      dev.sbbh := FieldByName('SBBH').AsString;
      dev.FXBH := FieldByName('FXBH').AsString;
      dev.BABH := FieldByName('JCPTBABH').AsString;
      dev.BAFX := FieldByName('JCPTBAFX').AsString;
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
      dev.HBCZB := FieldByName('HBCZB').AsString = '1';
      dev.XXZB := FieldByName('XXZB').AsBoolean;
      dev.DCXXZB := FieldByName('DCXXZB').AsBoolean;
      dev.YSXZB := FieldByName('YSXZB').AsBoolean;
      dev.XSZB := FieldByName('XSZB').AsBoolean;
      dev.ID := FieldByName('ID').AsString;
      dev.Changed := false;
      tmpDic.Add(dev.sbbh, dev);
      next;
    end;
    Free;
  end;
  if tmpDic.Count > 1 then
  begin
    if gOldDevice <> nil then
    begin
      ClearDevice(gOldDevice);
      gOldDevice.Free;
    end;
    gOldDevice := gDicDevice;
    gDicDevice := tmpDic;
  end;
end;

procedure LoadVeh;
var
  sql: string;
begin
  gVehDic.Clear;
  sql := 'select distinct hpzl,hphm from T_VIO_VEHICLE where fzjg=''' + FZJG + '''';
  with SQLHelper.Query(sql) do
  begin
    while not EOF do
    begin
      gVehDic.Add(Fields[0].AsString + Fields[1].AsString, true);
      Next;
    end;
    Free;
  end;
end;

procedure LoadPicturePathMap;
var
  sql: string;
  item: TKKPictureConfig;
begin
  gPicturePathMap.Clear;
  sql := 'select KDBH,LocalPath,Url from T_KK_PictureConfig';
  with SQLHelper.Query(sql) do
  begin
    while not EOF do
    begin
      item.KDBH := Fields[0].AsString;
      item.LocalPath := Fields[1].AsString;
      item.Url := Fields[2].AsString;
      if not item.LocalPath.EndsWith('\') then
        item.LocalPath := item.LocalPath + '\';
      if not item.Url.EndsWith('/') then
        item.Url := item.Url + '/';
      gPicturePathMap.Add(item.KDBH, item);
      Next;
    end;
    Free;
  end;
end;

procedure LoadMainDic;
begin
  gDicHPZL.Add('01', '大型汽车');
  gDicHPZL.Add('02', '小型汽车');
  gDicHPZL.Add('03', '使馆汽车');
  gDicHPZL.Add('04', '领馆汽车');
  gDicHPZL.Add('05', '境外汽车');
  gDicHPZL.Add('06', '外籍汽车');
  gDicHPZL.Add('07', '普通摩托车');
  gDicHPZL.Add('08', '轻便摩托车');
  gDicHPZL.Add('09', '使馆摩托车');
  gDicHPZL.Add('10', '领馆摩托车');
  gDicHPZL.Add('11', '境外摩托车');
  gDicHPZL.Add('12', '外籍摩托车');
  gDicHPZL.Add('13', '低速车');
  gDicHPZL.Add('14', '拖拉机');
  gDicHPZL.Add('15', '挂车');
  gDicHPZL.Add('16', '教练汽车');
  gDicHPZL.Add('17', '教练摩托车');
  gDicHPZL.Add('18', '试验汽车');
  gDicHPZL.Add('19', '试验摩托车');
  gDicHPZL.Add('20', '临时入境汽车');
  gDicHPZL.Add('21', '临时入境摩托车');
  gDicHPZL.Add('22', '临时行驶车');
  gDicHPZL.Add('23', '警用汽车');
  gDicHPZL.Add('24', '警用摩托');
  gDicHPZL.Add('25', '原农机号牌');
  gDicHPZL.Add('26', '香港出入境车');
  gDicHPZL.Add('27', '澳门出入境车');
  gDicHPZL.Add('44', '无号牌');
  gDicHPZL.Add('99', '其它');
end;

procedure SQLError(const SQL, Description: string);
begin
  logger.Error(Description + #13#10 + SQL);
end;

procedure AddSMS(sn, sj, msg: string);
begin
  if borderDBHelper <> nil then
  begin
    logger.Info('SMS' + sj + msg);
    borderDBHelper.ExecuteSql('insert into [borderdb].[dbo].[T_OUT] (sn,body,msg) values (' +
      sn.QuotedString + ',' + sj.QuotedString + ',' + msg.QuotedString + ')');
  end;
end;

procedure Initialize;
var
  appPath, logPath: string;
  ini: TIniFile;
  host, db, user, pwd: string;
begin
  appPath := TPath.GetDirectoryName(ParamStr(0));
  logPath := TPath.Combine(appPath, 'log');
  if not TDirectory.Exists(logPath) then
    TDirectory.CreateDirectory(logPath);
  logPath := TPath.Combine(logPath, 'dhf.log');
  logger := TLogger.Create(logPath);
  logger.MaxBackupIndex := 99;
  logger.Info('Application Initialize');

  ini:= TIniFile.Create(TPath.Combine(appPath, 'Config.ini'));
  host:= ini.ReadString('DB', 'server', '');
  db:= ini.ReadString('DB', 'dbname', 'yjitsdb');
  user:= ini.ReadString('DB', 'user', 'vioadmin');
  pwd:= ini.ReadString('DB', 'pwd', 'lgm1224,./');
  sqlhelper := TSQLHelper.Create(host, db, user, pwd);
  sqlhelper.OnError := SqlError;

  host:= ini.ReadString('BorderDB', 'server', ''); // 10.43.235.222,1133
  if host <> '' then
  begin
    db:= ini.ReadString('BorderDB', 'dbname', 'borderdb');
    user:= ini.ReadString('BorderDB', 'user', 'zasms');
    pwd:= ini.ReadString('BorderDB', 'pwd', 'zasms');
    borderDBHelper := TSQLHelper.Create(host, db, user, pwd);
    borderDBHelper.OnError := SqlError;
  end;

  solrFtp.host := ini.ReadString('solr', 'host', '');
  solrFtp.port := ini.ReadString('solr', 'port', '21');
  solrFtp.user := ini.ReadString('solr', 'user', 'solr');
  solrFtp.pwd := ini.ReadString('solr', 'pwd', 'solr');
  solrFtp.path := ini.ReadString('solr', 'path', '');

  hdpFtp.host := ini.ReadString('hdp', 'host', '');
  hdpFtp.port := ini.ReadString('hdp', 'port', '21');
  hdpFtp.user := ini.ReadString('hdp', 'user', 'root');
  hdpFtp.pwd := ini.ReadString('hdp', 'pwd', 'lgm1224,./!@#');
  hdpFtp.path := ini.ReadString('hdp', 'path', 'data');

  TransXLH := ini.ReadString('trans', 'xlh', '');
  TransWSDL := ini.ReadString('trans', 'wsdl', '');

  TmriXLH := ini.ReadString('tmri', 'xlh', '');
  TmriWSDL := ini.ReadString('tmri', 'wsdl', '');

  DFSHost := ini.ReadString('sys', 'DFSHost', '');  //仓库 localhost:8089
  FZJG := ini.ReadString('sys', 'fzjg', '无');      // 发证机关，用于识别假套牌
  SMSUrl := ini.ReadString('sys', 'SMSUrl', '');    //'http://10.46.137.83:8081/SMS/Send?token=%s&mobiles=%s&content=%s'
  kk := ini.ReadInteger('sys', 'kk', 0) = 1;
  dj := ini.ReadInteger('sys', 'dj', 0) = 1;
  idchina := ini.ReadInteger('sys', 'idchina', 0) = 1;
  hik := ini.ReadInteger('sys', 'hik', 0) = 1;
  logger.Level := ini.ReadInteger('sys', 'LogLevel', 0);

  reload := ini.ReadInteger('sys', 'reload', 0) = 1;
  gHeartbeatUrl := ini.ReadString('sys', 'Heartbeat', '');
  if not gHeartbeatUrl.EndsWith('/') then
    gHeartbeatUrl := gHeartbeatUrl + '/';
  //gDeviceStatusMobile := ini.ReadString('sys', 'DeviceStatusMobile', '');
  //gCJJG := ini.ReadString('sys', 'CJJG', '');

  //K08Url := ini.ReadString('K08', 'K08Url', '');    //http://10.43.255.16:8080/kms/services/ws/falconOperateData?wsdl
  //DFUrl := ini.ReadString('K08', 'DFUrl', '');      //刀锋 http://10.43.255.20:18010
  //DFUser := ini.ReadString('K08', 'DFUser', 'admin');
  //DFPwd := ini.ReadString('K08', 'DFPwd', 'Hik12345');

  DCXXZP := ini.ReadString('sys', 'DCXXZP', ''); // 大车限行抓拍设备编号
  gDLMUrl := ini.ReadString('sys', 'DLMUrl', 'http://10.46.177.136:8888/Download?');
  gAsynchronous := ini.ReadInteger('sys', 'Asyn', 0) = 1;

  ini.Free;
  gDicDevice := nil;
  gDicHBC := nil;
  gDicAlarm := nil;
  gDicAlarmJTP := nil;
  gListAlarmSDCL := nil;

  gOldDevice := nil;
  gOldHBC := nil;
  gOldALARM := nil;
  gOldALARMJTP := nil;
  gOldALARMSDCL := nil;
  gOldOpenedDevice := nil;

  gUnknowDevice := TDictionary<string, boolean>.Create;
  gVehDic := TDictionary<string, boolean>.Create;
  gDicHPZL := TDictionary<string, string>.Create;
  gPicturePathMap := TDictionary<string, TKKPictureConfig>.Create;
  PassList := TPassList.Create;
  LoadDevice;
  LoadMainDic;
  LoadAlarm;
  LoadAlarmJTP;
  LoadAlarmSDCL;
  loadHBC;
  LoadOpenedDevice;
  //LoadVeh;
  LoadPicturePathMap;
end;

procedure Finalizat;
begin
  PassList.Free;

  gDicALARM.Free;
  gDicALARMJTP.Free;
  gDicHBC.Free;
  gOpenedDevice.Free;
  ClearDevice(gDicDevice);
  gDicDevice.Free;
  gDicHPZL.Free;
  sqlHelper.Free;
  gUnknowDevice.Free;
  if borderDBHelper <> nil then
    borderDBHelper.Free;
  logger.Info('Application Finalizat');
  logger.Free;
end;

end.

