unit UInterface;

interface

uses
  Winapi.Windows, System.SysUtils, Winapi.Messages, vcl.forms, System.IOUtils,
  System.Variants, System.Types, vcl.Dialogs, System.StrUtils, System.Classes,
  System.JSON, uTypes, IdFTP, IdFTPCommon, IdGlobal, IdHTTP, IdTCPClient,
  FireDAC.Comp.Client, Generics.Collections, uGlobal, uCommon, DateUtils,
  MessageDigest_5;

type
  Tmypint = class
  private
    class function getPasstoJSON(list: Tlist<TPass>): string;
    class procedure SaveToSolr(list: Tlist<TPass>); static;
    class procedure SaveToHDP(list: Tlist<TPass>); static;
    class procedure SaveToDB(list: Tlist<TPass>); static;
    //class procedure SaveToK08(list: Tlist<TPass>); static;
    class function SaveToDFS(passList: TList<TPass>): boolean;
    class procedure FtpUpload(list: Tlist<TPass>; ftp: TFtpConfig); static;
  public
    class function getSpeedtoWFXW(hpzl: string; iclsd, ixzsd: Integer): string;
    class function WriteVehicleInfo(pass: TPass;  device: TDevice): Boolean; overload;
    class function WriteHoleService(value: TPass): Boolean; static;
    class procedure SaveVio(list: Tlist<TPass>);
    class procedure DoAlarm(pass: TPass); static;
    class procedure CheckFalseHPHM(pass: TPass); static;
    class procedure SavePass(passList: TList<TPass>); static;
    class procedure SendSMS(sj, content: string); static;
  end;

implementation

{ Tmypint }
uses
  Web.HTTPApp, UTrans, uHoleService;

class procedure Tmypint.SavePass(passList: TList<TPass>);
begin
  SaveToDB(passList);
  SaveToDFS(passList);
  SaveToSolr(passList);
  SaveToHDP(passList);
  //SaveToK08(passList);
end;

class function Tmypint.SaveToDFS(passList: TList<TPass>): boolean;
var
  stream: TStream;
  bytes: TBytes;
  http: TIdHTTP;
  json: string;
begin
  if DFSHost <> '' then
  begin
    json := Tmypint.GetPasstoJSON(passList);
    result := true;
    stream := TMemoryStream.Create;
    bytes := TEncoding.UTF8.GetBytes(json);
    stream.WriteBuffer(bytes, Length(bytes));
    http := TIdHTTP.Create(nil);
    try
      http.Post('http://' + DFSHost + '/INSERTPASSREC', stream);
    except
      on e: exception do
      begin
        logger.Error('[HttpPost]' + 'http://' + DFSHost + '. ' + e.Message);
        result := false;
      end;
    end;
    http.Free;
    stream.Free;
  end
  else
    logger.Warn('DFSHost is null');
end;

class procedure Tmypint.CheckFalseHPHM(pass: TPass);
var
  sql: string;
begin
  if (FZJG = '') or (FZJG = '无') then
  begin
    //logger.Warn('FZJG is null: ' + pass.HPHM + ' ' + pass.HPZL);
    exit;
  end;
  if pass.hpzl <> '02' then
    exit;
  if not pass.hphm.StartsWith(FZJG) then
    exit;
  if pass.hphm.Contains('学') or pass.hphm.Contains('警') or pass.hphm.Contains('#') then
    exit;
  if (gVehDic.Count = 0) or (gVehDic.ContainsKey(pass.hpzl + pass.hphm)) then
    exit;

  SQL := 'if not exists(select 1 from T_KK_ALARM where hphm=''' + pass.hphm +
    ''' and hpzl=''' + pass.hpzl + ''')' +
    'insert into T_KK_ALARM(HPHM,HPZL,BZ,VIOURL,BKJG,BKR,GXSJ,BKLX,BKXH,BKZL,ZT,CJJG,kdbh)'
    + 'values(''' + pass.hphm + ''',''' + pass.hpzl + ''',''假套牌'',''' +
    pass.FWQDZ + pass.tp1 + ''',''' + pass.CJJG + ''',''后台录入'','''
    + pass.gcsj + ''',''03'',''' + FormatDateTime('yyyymmddhhmmsszzz', now) +
    ''',''自动布控'',''0'',''' + pass.CJJG + ''','''+pass.kdbh+''')';
  sqlhelper.ExecuteSql(SQL);
end;

class procedure Tmypint.DoAlarm(pass: TPass);
  procedure DoJTP;       // 假套牌车辆预警
  var
    alarm: TAlarm;
    s, hhmm: string;
  begin
    if gDicAlarmJTP.ContainsKey(pass.HPHM + pass.HPZL) then
    begin
      alarm := gDicAlarmJTP[pass.HPHM + pass.HPZL];
      hhmm := FormatDatetime('hhmm', now);
      if (alarm.smsBeginTime < hhmm) and (alarm.smsEndTime > hhmm)
        and ((alarm.KDBH='') or alarm.KDBH.Contains(pass.KDBH)) then
      begin
        s := '【假套牌】' + pass.hphm + gDicHPZL[pass.hpzl] + #13#10 + alarm.CLPP;
        if alarm.CSYS <> '' then
           s := s + ' ' + alarm.CSYS;
        s := s + #13#10 + pass.gcsj + #13#10 + gDicDevice[pass.kdbh].SBDDMC + #13#10 + alarm.BZ;
        if SMSUrl = '' then
          uCommon.AddSMS('【缉查布控】', alarm.SJHM, s)
        else
          Tmypint.SendSMS(alarm.SJHM, s);
      end;
    end;
  end;
  procedure DoSDCL;        // 涉毒车辆预警
  var
    sdcl: TAlarm;
    key, s, hhmm: string;
  begin
    for sdcl in gListAlarmSDCL do
    begin
      key := pass.HPHM + pass.HPZL;
      if sdcl.KDBH.Contains(pass.kdbh)
        and ((sdcl.HPHM = '') or pass.HPHM.Contains(sdcl.HPHM))    // 发证机关
        and ((sdcl.HPZL = '') or (pass.HPZL = sdcl.HPZL))
        and ((sdcl.BKLX = '') or (gDicAlarm.ContainsKey(key) and (gDicAlarm[key].BKLX = sdcl.BKLX)))
      then
      begin
        hhmm := FormatDatetime('hhmm', now);
        if (sdcl.smsBeginTime < hhmm) and (sdcl.smsEndTime > hhmm) then
        begin
          s := '【特定区域】' + pass.hphm + gDicHPZL[pass.hpzl]
            + #13#10 + pass.gcsj + #13#10 + gDicDevice[pass.kdbh].SBDDMC + #13#10 + sdcl.BZ;
          if SMSUrl = '' then
            uCommon.AddSMS('【缉查布控】', sdcl.SJHM, s)
          else
            Tmypint.SendSMS(sdcl.SJHM, s);
        end;
      end;
    end;
  end;
  procedure DoAlarm;
  var
    hhmm, bz, sql: string;
    alarm: TAlarm;
  begin
    hhmm := FormatDatetime('hhmm', now);
    if gDicAlarm.ContainsKey(pass.hphm + pass.hpzl) then
    begin
      alarm := gDicAlarm[pass.hphm + pass.hpzl];
      if (alarm.SJHM <> '') and (alarm.smsBeginTime < hhmm) and (alarm.smsEndTime > hhmm) then
      begin
        if now - vartodatetime(pass.gcsj) < OneMinute * 3 then
        begin
          bz := #13#10'号牌号码' + pass.hphm + gDicHPZL[pass.hpzl]
            + #13#10 + pass.gcsj + #13#10 + gDicDevice[pass.kdbh].SBDDMC
            + #13#10 + alarm.BZ;
          if SMSUrl = '' then
            uCommon.AddSMS('【缉查布控】', alarm.SJHM, BZ)
          else
            Tmypint.SendSMS(alarm.SJHM, bz);
        end;
      end;

      sql := 'insert into T_KK_ALARMRESULT(bz,bkzl,wfcs,gcxh,gcsj,hphm,hpzl,cd,clsd,viourl,kdbh,bklx)values('
        + BZ.QuotedString + ','
        + alarm.bkzl.QuotedString + ','
        + alarm.wfcs.QuotedString + ','
        + pass.GCXH.QuotedString + ','
        + pass.GCSJ.QuotedString + ','
        + pass.hphm.QuotedString+ ','
        + pass.hpzl.QuotedString + ','
        + pass.cdbh + ','
        + pass.CLSD.QuotedString + ','
        + (pass.FWQDZ + pass.tp1).QuotedString + ','
        + pass.kdbh.QuotedString  + ','
        + alarm.BKLX.QuotedString + ')';
      sqlhelper.ExecuteSql(SQL);
    end;
  end;
begin
  DoJTP;
  DoSDCL;
  DoAlarm;
end;

class function Tmypint.getPasstoJSON(list: Tlist<TPass>): string;
var
  ja: TJSONArray;
  tmppass: TPass;
begin
  // 生成json
  ja := TJSONArray.Create;
  for tmppass in list do
  begin
    ja.Add(TJSONObject.Create.AddPair(TJSONString.Create('CJJG'),
      TJSONString.Create(tmppass.cjjg)).AddPair(TJSONString.Create('GCXH'),
      TJSONString.Create(tmppass.gcxh)).AddPair(TJSONString.Create('KKSOURE'),
      TJSONString.Create(tmppass.kksource)).AddPair(TJSONString.Create('KDBH'),
      TJSONString.Create(tmppass.kdbh)).AddPair(TJSONString.Create('FXBH'),
      TJSONString.Create(tmppass.fxbh)).AddPair(TJSONString.Create('CDBH'),
      TJSONString.Create(tmppass.cdbh)).AddPair(TJSONString.Create('CDLX'),
      TJSONString.Create(tmppass.cdlx)).AddPair(TJSONString.Create('HPZL'),
      TJSONString.Create(tmppass.hpzl)).AddPair(TJSONString.Create('GCSJ'),
      TJSONString.Create(tmppass.gcsj)).AddPair(TJSONString.Create('CLSD'),
      TJSONString.Create(tmppass.clsd)).AddPair(TJSONString.Create('HPYS'),
      TJSONString.Create(tmppass.hpys)).AddPair(TJSONString.Create('CLLX'),
      TJSONString.Create(tmppass.cllx)).AddPair(TJSONString.Create('HPHM'),
      TJSONString.Create(tmppass.hphm)).AddPair(TJSONString.Create('CWHPHM'),
      TJSONString.Create(tmppass.cwhphm)).AddPair(TJSONString.Create('CWHPYS'),
      TJSONString.Create(tmppass.cwhpys)).AddPair(TJSONString.Create('HPYZ'),
      TJSONString.Create(tmppass.hpyz)).AddPair(TJSONString.Create('YRKSJ'),
      TJSONString.Create(tmppass.yrksj)).AddPair(TJSONString.Create('CSYS'),
      TJSONString.Create(tmppass.csys)).AddPair(TJSONString.Create('CLXS'),
      TJSONString.Create(tmppass.clxs)).AddPair(TJSONString.Create('CLPP'),
      TJSONString.Create(tmppass.clpp)).AddPair(TJSONString.Create('CLWX'),
      TJSONString.Create(tmppass.clwx)).AddPair(TJSONString.Create('XSZT'),
      TJSONString.Create(tmppass.xszt)).AddPair(TJSONString.Create('WFBJ'),
      TJSONString.Create(tmppass.WFXW)).AddPair(TJSONString.Create('FWQDZ'),
      TJSONString.Create(tmppass.fwqdz)).AddPair(TJSONString.Create('TP1'),
      TJSONString.Create(tmppass.tp1)).AddPair(TJSONString.Create('TP2'),
      TJSONString.Create(tmppass.tp2)).AddPair(TJSONString.Create('TP3'),
      TJSONString.Create(tmppass.tp3)).AddPair(TJSONString.Create('TZTP'),
      TJSONString.Create(tmppass.tztp)).AddPair(TJSONString.Create('DRTP1'),
      TJSONString.Create(tmppass.drtp1)).AddPair(TJSONString.Create('DRTP2'),
      TJSONString.Create(tmppass.drtp2)).AddPair(TJSONString.Create('RKSJ'),
      TJSONString.Create(tmppass.rksj)).AddPair(TJSONString.Create('FSBZ'),
      TJSONString.Create(tmppass.fsbz))
      .AddPair(TJSONString.Create('ALARM_TYPE'),
      TJSONString.Create(tmppass.alarm_type))
      .AddPair(TJSONString.Create('ALARM_SRC'),
      TJSONString.Create(tmppass.alarm_src))
      .AddPair(TJSONString.Create('ALARM_SRC_ID'),
      TJSONString.Create(tmppass.alarm_src_id))
      .AddPair(TJSONString.Create('FLAG'), TJSONString.Create(tmppass.flag))
      .AddPair(TJSONString.Create('GXSJ'), TJSONString.Create(tmppass.gxsj))
      .AddPair(TJSONString.Create('LDBH'), TJSONString.Create(tmppass.ldbh))
      .AddPair(TJSONString.Create('LKBH'), TJSONString.Create(tmppass.lkbh))
      .AddPair(TJSONString.Create('SER01'), TJSONString.Create(tmppass.ser01))
      .AddPair(TJSONString.Create('SER02'), TJSONString.Create(tmppass.ser02))
      .AddPair(TJSONString.Create('SER03'), TJSONString.Create(tmppass.ser03))
      .AddPair(TJSONString.Create('SER04'), TJSONString.Create(tmppass.ser04))
      .AddPair(TJSONString.Create('SER05'), TJSONString.Create(tmppass.ser05))
      .AddPair(TJSONString.Create('SER06'), TJSONString.Create(tmppass.ser06))
      .AddPair(TJSONString.Create('SER07'), TJSONString.Create(tmppass.ser07))
      .AddPair(TJSONString.Create('SER08'), TJSONString.Create(tmppass.ser08))
      .AddPair(TJSONString.Create('SER09'), TJSONString.Create(tmppass.ser09)));
  end;

  Result := ja.ToString;
  // list.Clear;
  ja.Free;
end;
{
class procedure TMypint.SaveToK08(list: Tlist<TPass>);
begin
  if K08Url <> '' then
  begin
    TK08.SaveToK08(list);
  end;
end;
}
class procedure Tmypint.SaveToSolr(list: Tlist<TPass>);
begin
  if solrFtp.host = '' then
  begin
    logger.Warn('SolrFtp is null');
    exit;
  end;
  FtpUpload(list, solrFtp);
end;

class procedure Tmypint.SaveToHDP(list: Tlist<TPass>);
begin
  if hdpFtp.host = '' then
  begin
    logger.Warn('HDP Ftp Host is null');
    exit;
  end;
  FtpUpload(list, hdpFtp);
end;

class procedure Tmypint.FtpUpload(list: Tlist<TPass>; ftp: TFtpConfig);
var
  sl: TStrings;
  pass: TPass;
  filename: string;
  idftp: TIdFtp;
begin
  filename := 'A' + FormatDateTime('YYMMDDHHMMSSZZZ', now)+'.txt';
  sl := TStringList.Create;
  for pass in list do
  begin
    sl.Add(pass.ToString);
  end;
  try
    sl.SaveToFile(ExtractFilePath(ParamStr(0)) + filename);
  except
    on e:exception do
    begin
      logger.Error('[FtpUpload]' + e.Message + filename);
      sl.Free;
      exit;
    end;
  end;
  sl.Free;

  idFtp := TIdFtp.Create(nil);
  idFtp.Host := ftp.host;
  idFtp.Port := strtointdef(ftp.port, 21);
  idFtp.Username := ftp.user;
  idFtp.Password := ftp.pwd;
  try
    idFtp.Connect;
    idFtp.Put(ExtractFilePath(ParamStr(0)) + filename, ftp.Path + '/' + filename);
  except
    on e:exception do
      logger.Error('[FtpUpload]' + e.Message);
  end;
  idFtp.Free;

  Deletefile(ExtractFilePath(ParamStr(0)) + filename);
end;

class function Tmypint.getSpeedtoWFXW(hpzl: string;
  iclsd, ixzsd: Integer): string;
begin
  { 只有识别出车辆类型才能进一步完善超速代码分类 }
  result := '0';
  if ixzsd < 40 then exit;
  if hpzl = '01' then
  begin
    if (iclsd - ixzsd) / ixzsd >= 0.1 then
    begin
      if ((iclsd - ixzsd) / ixzsd >= 0.1) and ((iclsd - ixzsd) / ixzsd < 0.2)
      then
        Result := '1352A';
      if ((iclsd - ixzsd) / ixzsd >= 0.2) and ((iclsd - ixzsd) / ixzsd < 0.5)
      then
        Result := '1636';
      if ((iclsd - ixzsd) / ixzsd >= 0.5) and ((iclsd - ixzsd) / ixzsd < 1) then
        Result := '1721A';
      if (iclsd - ixzsd) / ixzsd >= 1 then
        Result := '1721B';
    end
  end
  else
  begin
    if (iclsd - ixzsd) / ixzsd >= 0.1 then
    begin
      if ((iclsd - ixzsd) / ixzsd >= 0.1) and ((iclsd - ixzsd) / ixzsd < 0.2)
      then
        Result := '1352A';
      if ((iclsd - ixzsd) / ixzsd >= 0.2) and ((iclsd - ixzsd) / ixzsd < 0.5)
      then
        Result := '1636';
      if ((iclsd - ixzsd) / ixzsd >= 0.5) and ((iclsd - ixzsd) / ixzsd < 1) then
        Result := '1721A';
      if (iclsd - ixzsd) / ixzsd >= 1 then
        Result := '1721B';
    end;
  end;
end;

class function Tmypint.WriteVehicleInfo(pass: TPass; device: TDevice): Boolean;
var
  url, r: string;
  ret: int64;
begin
  //if (not gOpenedDevice.ContainsKey(device.SBBH))or                         // 该设备不上报
  //  (gOpenedDevice[device.SBBH] and (not pass.HPHM.StartsWith(FZJG))) then  // 该设备只上报本地车
  // exit;
  if pass.HPHM.Length < 6 then exit;
  if uTrans.TransXLH <> '' then
  begin
    ret := TTrans.WriteVehicleInfo(
      device.BABH,
      device.BAFX,
      strtointdef(pass.cdbh, 1),
      pass.hphm,
      pass.hpzl,
      FormatDateTime('yyyy-mm-dd hh:mm:ss', vartodatetime(pass.gcsj)),
      strtointdef(pass.clsd, 0),
      device.XZSD,
      '1',
      5,
      pass.HPYS,
      '',
      '',
      '',
      '',
      '',
      '',
      pass.CSYS,
      pass.FWQDZ,
      pass.tp1,
      pass.tp2,
      pass.tp3,
      '');
    result := ret > 0;
    logger.Debug('[WriteVehicleInfo]:' + ret.ToString + ' ' + device.SBBH);
  end;
end;

class function Tmypint.WriteHoleService(value: TPass): Boolean;
var
  ret, WSResult: string;
  hole: HoleService;
  driverWayId, carType: string;
  jkxlh, m_info: string;
begin
  Result := true;
  try
    hole := GetHoleService(false, '', nil);
    driverWayId := value.kdbh.Substring(value.kdbh.Length-1);
    WSResult := hole.InitTrans('445191000152500500', '445191B0AE', driverWayId, '');

    if WSResult.Contains('<code>1</code>') then
    begin
      if value.hpzl = '01' then
        carType := '1'
      else
        carType := '0';
      ret := hole.WriteVehicleInfo('445191000152500500',
        '445191B0AE',
        driverWayId,
        '00',
        value.hpzl,
        FormatDateTime('yyyy-mm-dd hh:mm:ss', vartodatetime(value.gcsj)),
        value.clsd.ToInt64,
        value.hpys,
        carType,
        value.hphm,
        value.hphm,
        value.hpys,
        '3',
        '',
        100,
        value.clpp,   // 车辆品牌
        '',
        '0',
        '0',
        value.fwqdz+value.tp1,
        '',
        '',
        '',
        '',
        '',
        '0');
      //if not ret.Contains('<code>1</code>') then
        logger.Debug('hole.WriteVehicleInfo: ' + ret);
    end
    else
      logger.Warn('hole.InitTrans failed:' + WSResult);
  except
    ON e: Exception do
    begin
      logger.Error('hole.WriteVehicleInfo: ' + e.Message);
    end;
  end;
end;

class procedure Tmypint.SaveVio(list: Tlist<TPass>);
  procedure exec(sql: TStrings);
  var
    s: string;
  begin
    s := sql.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'INSERT INTO T_vio_temp (WFSJ,CJJG,HPHM,HPZL,WFDD,WFXW,CD,XZSD,SJSD,CSYS,CLPP,ZGXS,ZDXS,FWQDZ,PHOTOFILE1,PHOTOFILE2,PHOTOFILE3,bj)VALUES' + s;
    SQLHelper.ExecuteSql(s);
    sql.Clear;
    logger.Info('SaveVio OK: ' + sql.Count.ToString);
  end;
var
  sql: TStrings;
  vio: TPass;
  s: string;
begin
  sql := TStringList.Create;
  for vio in list do
  begin
    sql.Add('('''
      + vio.gcsj + ''','''
      + vio.cjjg + ''','''
      + vio.hphm + ''','''
      + vio.hpzl + ''','''
      + vio.KDBH + ''','''
      + vio.WFXW + ''','''
      + vio.CDBH + ''','''
      + inttostr(gDicDevice[vio.kdbh].XZSD) + ''','''
      + vio.clsd + ''','''
      + vio.csys + ''','''
      + vio.clpp + ''',''0'',''0'','''
      + vio.FWQDZ + ''','''
      + vio.tp1 + ''','''
      + vio.tp2 + ''','''
      + vio.tp3 + ''',''0''),');
    if sql.Count = 999 then
    begin
      exec(sql);
    end;
  end;
  if sql.Count > 0 then
  begin
    exec(sql);
  end;
  sql.Free;
end;

class procedure Tmypint.SaveToDB(list: Tlist<TPass>);
var
  pass: TPass;
  sql: TStrings;
  s: string;
begin
  sql := TStringList.Create;
  for pass in list do
  begin
    sql.Add('(' +
      pass.cjjg.QuotedString + ',' +
      pass.gcxh.QuotedString + ',' +
      pass.kksource.QuotedString + ',' +
      pass.kdbh.QuotedString + ',' +
      pass.fxbh.QuotedString + ',' +
      pass.cdbh.QuotedString + ',' +
      pass.hpzl.QuotedString + ',' +
      pass.gcsj.QuotedString + ',' +
      pass.clsd.QuotedString + ',' +
      pass.csys.QuotedString + ',' +
      pass.hphm.QuotedString + ',' +
      pass.fwqdz.QuotedString + ',' +
      pass.tp1.QuotedString + ',' +
      pass.tp2.QuotedString + ',' +
      pass.tp3.QuotedString + ',' +
      pass.WFXW.QuotedString + ',' +
      pass.rksj.QuotedString + ',' +
      pass.ser01.QuotedString + ',' +
      pass.ser02.QuotedString + ',' +
      pass.ser03.QuotedString + ',' +
      pass.ser04.QuotedString + ',' +
      pass.ser05.QuotedString + ',' +
      pass.ldbh.QuotedString + ',' +
      pass.lkbh.QuotedString + '),');
    if sql.Count = 999 then
    begin
      s := sql.Text;
      s := copy(s, 1, length(s) - 3); // 回车换行
      s := 'insert into T_KK_VEH_PASSREC(CJJG,GCXH,KKSOURCE,KDBH,FXBH,CDBH,HPZL,GCSJ,CLSD,CSYS,HPHM,FWQDZ,TP1,TP2,TP3,WFBJ,RKSJ,SER01,SER02,SER03,SER04,SER05,LDBH,LKBH)values' + s;
      SQLHelper.ExecuteSql(s);
      logger.Info('SavePassRec OK: ' + sql.Count.ToString);
      sql.Clear;
    end;
  end;
  if sql.Count > 0 then
  begin
    s := sql.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'insert into T_KK_VEH_PASSREC(CJJG,GCXH,KKSOURCE,KDBH,FXBH,CDBH,HPZL,GCSJ,CLSD,CSYS,HPHM,FWQDZ,TP1,TP2,TP3,WFBJ,RKSJ,SER01,SER02,SER03,SER04,SER05,LDBH,LKBH)values' + s;
    SQLHelper.ExecuteSql(s);
    logger.Info('SavePassRec OK: ' + sql.Count.ToString);
  end;
  sql.Free;
end;

class procedure Tmypint.SendSMS(sj, content: string);
  function GetToken: string;
  var
    md5: IMD5;
    s: string;
  begin
    s := formatdatetime('yymmdd', now) + '*echotech';
    md5 := GetMD5;
    md5.Init;
    md5.Update(TByteDynArray(RawByteString(s)), length(s));
    result := md5.AsString.ToLower;
  end;
var
  token, url: string;
  http: TIdHttp;
  stream: TStream;
begin
  if smsUrl <> '' then
  begin
    logger.Info('[SMS]' + sj + content);
    token := getToken;
    url := Format(smsUrl, [token, sj.Replace(';', ','), HTTPEncode(content)]);
    http := TIdHttp.Create(nil);
    http.ConnectTimeout := 2000;
    http.ReadTimeout := 2000;
    stream := TMemoryStream.Create;
    try
      http.Post(url, stream);
    except
      on e: exception do
      begin
        logger.Error('[SendSMS]' + e.Message);
      end;
    end;
    http.Free;
    stream.Free;
  end;
end;

end.
