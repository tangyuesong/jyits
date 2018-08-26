unit itfUploadVioToJCPT;

interface

uses
  System.SysUtils, Classes, uCommon, IdCustomHTTPServer, StrUtils, uGlobal,
  idHttp, Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Graphics, uTmri, IdFtp, IdFTPCommon, IdGlobal,
  ADODB, uTokenManager, System.NetEncoding, uRmInf, uEntity;

type

  TLockVio2JCPT = Class
  private
    class function GetLockVio(ASystemID: String): TLockVioClass;
    class procedure UpdateVioState(id, zt, bz: String);
    class function IsReVio(hphm, hpzl, wfsj, cjjg: String): Boolean;
    class function Is1344Tzc(hphm, hpzl, wfsj, wfdz: String): Boolean;
    class function DownloadVioPic(vio: TLockVioClass): Boolean;
    class function GetPic(picServer, picfile, sfilename: string): Boolean;
    class function BitmapToString(lj: string): WideString;
    class procedure AnalysisVioUploadResult(json: String; var code: String;
      var msg: String);
    class function IsWhite(hphm, hpzl, cjjg, wfsj: String): Boolean;
    class function GetVioUploadStr(vio: TLockVioClass): String;
  public
    class function UploadVio(AId: String): String;
  end;

implementation

class function TLockVio2JCPT.Is1344Tzc(hphm, hpzl, wfsj, wfdz: String): Boolean;
var
  s: String;
  ct: String;
begin
  Result := False;
  // 如果违法行为是1344（闯禁行）,忙时都抓，闲时特批车不抓
  ct := RightStr(wfsj, 5);
  ct := ct.Replace(':', '');

  if (ct >= '0730') and (ct < '0900') then
    exit;
  if (ct >= '1100') and (ct < '1230') then
    exit;
  if (ct >= '1700') and (ct < '1900') then
    exit;

  wfdz := ',' + wfdz + ',';
  s := ' select 1 from t_ntzlist where hphm = ' + hphm.QuotedString +
    ' and hpzl = ' + hpzl.QuotedString + ' and jssj > ' + wfsj.QuotedString +
    ' and charindex(' + wfdz.QuotedString + ', '',''+sbbh+'','') > 0';
  with gSQLHelper.Query(s) do
  begin
    Result := not EOF;
    Free;
  end;
end;

class function TLockVio2JCPT.IsReVio(hphm, hpzl, wfsj, cjjg: String): Boolean;
var
  s: String;
  dt: TDateTime;
begin
  dt := TCommon.StringToDT(wfsj);
  s := ' where hphm=' + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString +
    ' and bj=''8'' and cjjg=' + cjjg.QuotedString + ' and wfsj>''' +
    formatDatetime('yyyy/mm/dd', dt - 1) + ' 23:50:01'' and wfsj<''' +
    formatDatetime('yyyy/mm/dd', dt + 1) + ' 00:10:59''';
  Result := gSQLHelper.ExistsRecord('T_VIO_TEMP', s);
end;

class function TLockVio2JCPT.IsWhite(hphm, hpzl, cjjg, wfsj: String): Boolean;
var
  s: String;
  qy: TADOQuery;
begin
  Result := False;
  s := ' select 1 from T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm='
    + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString + ' and dwdm=' +
    cjjg.QuotedString + ' and YXSJ<' + wfsj.QuotedString + ' and JSSJ>' +
    wfsj.QuotedString;
  s := s + ' union all ';
  s := s + ' select 1 from T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm='
    + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString + ' and dwdm=left('''
    + cjjg + ''', 6)+''000000'' and YXSJ<' + wfsj.QuotedString + ' and JSSJ>' +
    wfsj.QuotedString;
  s := s + ' union all ';
  s := s + ' select 1 from T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm='
    + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString + ' and dwdm=left('''
    + cjjg + ''', 4)+''00000000'' and YXSJ<' + wfsj.QuotedString + ' and JSSJ>'
    + wfsj.QuotedString;
  Result := gSQLHelper.ExistsRecord(s);
end;

class function TLockVio2JCPT.UploadVio(AId: String): String;
var
  vio: TLockVioClass;
  json, code, msg: String;
begin
  vio := GetLockVio(AId);
  if vio.wfdd = '' then
  begin
    Result := '违法记录或违法设备不存在';
    vio.Free;
    exit;
  end;

  if LeftStr(vio.hphm, 2) = '粤O' then
  begin
    UpdateVioState(AId, 'B', '粤O');
    Result := '成功';
    vio.Free;
    exit;
  end;

  if IsWhite(vio.hphm, vio.hpzl, vio.cjjg, vio.wfsj) then
  begin
    UpdateVioState(AId, 'B', 'B');
    Result := '成功';
    vio.Free;
    exit;
  end;

  if (vio.wfxw = '1344') and Is1344Tzc(vio.hphm, vio.hpzl, vio.wfsj, vio.wfdz)
  then
  begin
    UpdateVioState(AId, 'B', '');
    Result := '成功';
    vio.Free;
    exit;
  end;

  if IsReVio(vio.hphm, vio.hpzl, vio.wfsj, vio.cjjg) then
  begin
    UpdateVioState(AId, '11', '机动车录入重复');
    Result := '上传失败[机动车录入重复]';
    vio.Free;
    exit;
  end;

  if not DownloadVioPic(vio) then
  begin
    UpdateVioState(AId, '6', '上传失败[图片下载失败]');
    Result := '上传失败[图片下载失败]';
    vio.Free;
    exit;
  end;

  json := GetVioUploadStr(vio);
  json := TRminf.surscreen(json);
  AnalysisVioUploadResult(json, code, msg);
  if code = '1' then
  begin

    UpdateVioState(AId, '8', '成功');
    Result := '成功';
  end
  else
  begin
    UpdateVioState(AId, '6', msg);
    Result := msg;
  end;
end;

class procedure TLockVio2JCPT.UpdateVioState(id, zt, bz: String);
var
  s: String;
begin
  s := 'update T_VIO_HIS set bj=' + zt.QuotedString + ',bz=' + bz.QuotedString
    + ',GXSJ=' + formatDatetime('yyyy/mm/dd hh:nn:ss', now).QuotedString +
    ' where Systemid=' + id.QuotedString;
  gSQLHelper.ExecuteSql(s);
end;

class procedure TLockVio2JCPT.AnalysisVioUploadResult(json: String;
  var code, msg: String);
begin
  code := TCommon.GetJsonNode('code', json);
  msg := TCommon.GetJsonNode('message', json);
end;

class function TLockVio2JCPT.BitmapToString(lj: string): WideString;
var
  ms: TMemoryStream;
  ss: TStringStream;
begin
  Result := '';
  try
    ms := TMemoryStream.Create;
    ms.LoadFromFile(lj);
    ss := TStringStream.Create;
    ms.Position := 0;
    TBase64Encoding.Base64.Encode(ms, ss);
    Result := ss.DataString;
  finally
    ms.Free;
    ss.Free;
  end;
end;

class function TLockVio2JCPT.DownloadVioPic(vio: TLockVioClass): Boolean;
var
  f: String;
begin
  Result := False;
  if Length(Trim(vio.xp1)) > 0 then
  begin
    f := extractfilepath(paramstr(0)) + vio.sysid;
    if Pos('.', f) <= 0 then
      f := f + '.jpg';
    if not GetPic(vio.FWQDZ, vio.xp1, f) then
      exit;
    vio.zpstr1 := BitmapToString(f);
    deletefile(f);
  end
  else
    exit;

  if Length(vio.xp2) > 0 then
  begin
    f := extractfilepath(paramstr(0)) + vio.sysid;
    if Pos('.', f) <= 0 then
      f := f + '.jpg';
    if not GetPic(vio.FWQDZ, vio.xp2, f) then
      exit;
    vio.zpstr2 := BitmapToString(f);
    deletefile(f);
  end;

  if Length(vio.xp3) > 0 then
  begin
    f := extractfilepath(paramstr(0)) + vio.sysid;
    if Pos('.', f) <= 0 then
      f := f + '.jpg';
    if GetPic(vio.FWQDZ, vio.xp3, f) then
      exit;
    vio.zpstr3 := BitmapToString(f);
    deletefile(f);
  end;
  Result := True;
end;

class function TLockVio2JCPT.GetLockVio(ASystemID: String): TLockVioClass;
var
  wfdd: String;
  device: TDevice;
begin
  Result := TLockVioClass.Create;
  with gSQLHelper.Query
    (' select * from T_VIO_HIS with(nolock) where SYSTEMID = ' +
    ASystemID.QuotedString) do
  begin
    if not EOF then
    begin
      Result.sysid := ASystemID;
      Result.hphm := Trim(FieldByName('hphm').AsString);
      Result.hpzl := Trim(FieldByName('hpzl').AsString);
      Result.wfsj := formatDatetime('yyyy-mm-dd hh:mm:ss',
        FieldByName('WFSJ').ASDATETIME);
      Result.wfxw := Trim(FieldByName('WFXW').AsString);
      Result.scz := Trim(FieldByName('SJSD').AsString);
      Result.FWQDZ := FieldByName('FWQDZ').AsString;
      Result.xp1 := FieldByName('PHOTOFILE1').AsString;
      Result.xp2 := FieldByName('PHOTOFILE2').AsString;
      Result.xp3 := FieldByName('PHOTOFILE3').AsString;
      Result.cjjg := FieldByName('CJJG').AsString;
      wfdd := Trim(FieldByName('wfdd').AsString);
      if TCommon.DicDevice.ContainsKey(wfdd) then
      begin
        device := TCommon.DicDevice[wfdd];
        Result.bzz := device.XZSD.ToString;
        Result.wfdd := device.LHY_WFDD;
        Result.wfdz := device.SBDDMC;
        Result.xzqh := device.LHY_XZQH;;
        Result.ddms := device.LHY_DDMS;
        Result.lddm := device.LHY_LDDM;
        Result.sbbh := device.LHY_SBBH;
        Result.cjfs := device.LHY_CJFS;
        Result.tpzl := device.LHY_JPGQ;
        Result.tpw := device.LHY_JPGW;
        Result.tph := device.LHY_JPGH;
        Result.zqmj := '';
      end;
    end;
    Free;
  end;
end;

class function TLockVio2JCPT.GetPic(picServer, picfile,
  sfilename: string): Boolean;
var
  ms: TMemoryStream;
  host, port, user, pw, path, urlcn, url: string;
  iport: Integer;
  idHttp: TIdHTTP;
  idftp1: TIdFTP;
begin
  Result := False;
  url := picServer + picfile;

  if fileexists(sfilename) then
    deletefile(sfilename);
  if UpperCase(copy(url, 1, 3)) = 'FTP' then
  begin
    try
      path := copy(url, Pos('@', url) + 1, Length(url) - Pos('@', url) + 1);
      path := copy(path, Pos('/', path) + 1, Length(path) - Pos('/', path) + 1);
      // FTP 服务器地址
      host := copy(url, Pos('@', url) + 1, Length(url) - Pos('@', url) + 1);
      host := copy(host, 1, Pos(':', host) - 1);
      // FTP端口
      port := copy(url, Pos('@', url) + 1, Length(url) - Pos('@', url) + 1);
      if Pos(':', port) > 0 then
      begin
        port := copy(port, Pos(':', port) + 1, Length(port) - Pos(':',
          port) + 1);
        port := copy(port, 1, Pos('/', port) - 1);
      end
      else
      begin
        port := '21';
      end;

      iport := StrToInt(port);
      // FTP用户名
      user := copy(url, 7, Length(url) - 6);
      user := copy(user, 1, Pos(':', user) - 1);
      // FTP密码
      pw := copy(url, 7, Length(url) - 6);
      pw := copy(pw, Pos(':', pw) + 1, Length(pw) - Pos(':', pw) + 1);
      pw := copy(pw, 1, Pos('@', pw) - 1);
      idftp1 := TIdFTP.Create(nil);
      idftp1.ConnectTimeout := 30000;
      idftp1.ReadTimeout := 30000;
      idftp1.host := host;
      idftp1.port := iport;
      idftp1.Username := user;
      idftp1.Password := pw;
      idftp1.Connect;
      idftp1.TransferType := ftBinary;
      idftp1.IOHandler.DefStringEncoding := IndyTextEncoding(tencoding.Default);
      idftp1.Passive := True; // 这里分为主动和被动
      idftp1.Noop;
      ms := TMemoryStream.Create;
      idftp1.Get(path, ms);
      FreeAndNil(idftp1);
      ms.SaveToFile(sfilename);
      ms.Free;
      Result := True;
    except
      FreeAndNil(idftp1);
      FreeAndNil(ms);
      Result := False;
    end;
  end;
  if UpperCase(copy(url, 1, 4)) = 'HTTP' then
  begin
    ms := TMemoryStream.Create;
    idHttp := TIdHTTP.Create(nil);
    try
      idHttp.HandleRedirects := True; // 必须支持重定向否则可能出错
      idHttp.ConnectTimeout := 30000; // 超过这个时间则不再访问
      idHttp.ReadTimeout := 30000; //
      urlcn := idHttp.url.URLEncode(url);
      idHttp.Get(urlcn, ms);
      ms.SaveToFile(sfilename);
      Result := True;
    except
      on e: exception do
        glogger.Error(e.Message);
    end;
    idHttp.Free;
    ms.Free;
  end;
end;

class function TLockVio2JCPT.GetVioUploadStr(vio: TLockVioClass): String;
var
  zpsl: string;
begin
  Result := '{"sbbh":"' + vio.sbbh + '","hpzl":"' + vio.hpzl + '","hphm":"' +
    vio.hphm + '","wfsj":"' + vio.wfsj + '","wfxw":"' + vio.wfxw + '","scz":"' +
    vio.scz + '","wfdz":"' + vio.wfdz + '","xzqh":"' + vio.xzqh + '","wfdd":"' +
    vio.wfdd + '","lddm":"' + vio.lddm + '","ddms":"' + vio.ddms + '",';
  zpsl := '1';
  if vio.zpstr1 <> '' then
    Result := Result + '"zpstr1":"' + vio.zpstr1 + '",';
  if vio.zpstr2 <> '' then
  begin
    Result := Result + '"zpstr2":"' + vio.zpstr2 + '",';
    zpsl := '2';
  end;
  if (zpsl = '2') and (vio.zpstr3 <> '') then
  begin
    Result := Result + '"zpstr3:"' + vio.zpstr3 + '",';
    zpsl := '3';
  end;

  Result := Result + '"zpsl":"' + zpsl + '"}';
end;

end.
