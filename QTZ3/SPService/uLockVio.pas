unit uLockVio;

interface

uses
  System.SysUtils, Classes, uCommon, IdCustomHTTPServer, StrUtils, uGlobal,
  idHttp, Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Graphics, uTmri, IdFtp, IdFTPCommon, IdGlobal,
  ADODB, uTokenManager, System.NetEncoding;

type
  TLockVio = Record
    sysid: string;
    flag: string; // 0Ϊ��ʡ����������Ҫ���ˣ�����Ϊʡ�⳵����Ҫ��������һƽ̨����
    xh: string; // ���
    cjjg: string; // �ɼ�����
    clfl: string; // ��������
    hpzl: string; // ��������
    hphm: string; // ���ƺ���
    jdcsyr: string; // ������������
    syxz: string; // ʹ������
    fdjh: string; // ��������,ע��Ҫ���˷Ƿ��ַ�
    clsbdh: string; // ����ʶ����ţ�ע��Ҫ���˷Ƿ��ַ�
    csys: string; // ������ɫ
    clpp: string; // ����Ʒ��
    jtfs: string; // ��ͨ��ʽ
    fzjg: string; // ��֤����
    zsxzqh: string; // ס����������
    zsxxdz: string; // ס����ϸ��ַ
    dh: string; // �绰
    lxfs: string; // ��ϵ��ʽ
    tzsh: string; // ֪ͨ���
    tzrq: string; // ֪ͨ����
    cjfs: string; // �ɼ���ʽ    7Ϊ�������
    wfsj: string; // Υ��ʱ��
    sj: String;
    xzqh: string; // ��������
    wfdd: string; // Υ���ص�
    lddm: string; // ·�κ���
    ddms: string; // �ص�����
    wfdz: string; // Υ����ַ
    wfxw: string; // Υ����Ϊ
    scz: string; // ʵ��ֵ
    bzz: string; // ��׼ֵ
    zqmj: string; // ִ����
    spdz: string; // ��Ƶ��ַ
    sbbh: string; // �豸���
    FWQDZ: string; // ��������ַ
    xp1: string;
    xp2: string;
    xp3: string;
    lhywfdd: string; // ����һΥ���ص�
    zpstr1: String; // ͼƬ1
    zpstr2: String; // ͼƬ2
    zpstr3: String; // ͼƬ3
    scms: string;
    tpzl: String;
    tpw: String;
    tph: String;
    LHY_WFDD_1: String;
    LHY_DDMS_1: String;
    LHY_LDDM_1: String;
  end;

  TLockVioUtils = Class
  private
    class function GetLockVio(ASystemID: String): TLockVio;
    class procedure UpdateVioState(id, zt, bz: String; sxh: String = '');
    class function IsReVio(hphm, hpzl, wfsj, cjjg: String): Boolean;
    class function Is1344Tzc(hphm, hpzl, wfsj, wfdz: String): Boolean;
    class function DownloadVioPic(var vio: TLockVio): Boolean;
    class function GetPic(picServer, picfile, sfilename: string): Boolean;
    class procedure AnalysisVioUploadResult(json: String; var code: String;
      var msg: String);
  public
    class function BitmapToString(lj: string): WideString;
    class function GetVioUploadStr(vio: TLockVio): String;
    class function IsWhite(hphm, hpzl, cjjg, wfsj: String): Boolean;
    class procedure LockVio(AId, TokenKey: String;
      AResponseInfo: TIdHTTPResponseInfo);
    class function WriteVio(vioid, TokenKey, vioStr, flag: String;
      AResponseInfo: TIdHTTPResponseInfo): String;
  end;

implementation

class function TLockVioUtils.Is1344Tzc(hphm, hpzl, wfsj, wfdz: String): Boolean;
var
  s: String;
  ct: String;
begin
  Result := False;
  // ���Υ����Ϊ��1344�������У�,æʱ��ץ����ʱ��������ץ
  ct := RightStr(wfsj, 5);
  ct := ct.Replace(':', '');

  if (ct >= '0730') and (ct < '0900') then
    exit;
  if (ct >= '1100') and (ct < '1230') then
    exit;
  if (ct >= '1700') and (ct < '1900') then
    exit;

  wfdz := ',' + wfdz + ',';
  s := ' select 1 from ' + cDBName + '.dbo.t_ntzlist where hphm = ' +
    hphm.QuotedString + ' and hpzl = ' + hpzl.QuotedString + ' and jssj > ' +
    wfsj.QuotedString + ' and charindex(' + wfdz.QuotedString +
    ', '',''+sbbh+'','') > 0';
  with gSQLHelper.Query(s) do
  begin
    Result := not EOF;
    Free;
  end;
end;

class function TLockVioUtils.IsReVio(hphm, hpzl, wfsj, cjjg: String): Boolean;
var
  s: String;
  dt: TDateTime;
begin
  dt := TCommon.StringToDT(wfsj);
  s := ' where hphm=' + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString +
    ' and zt=''8'' and cjjg=' + cjjg.QuotedString + ' and wfsj>''' +
    formatDatetime('yyyy/mm/dd', dt - 1) + ' 23:50:01'' and wfsj<''' +
    formatDatetime('yyyy/mm/dd', dt + 1) + ' 00:10:59''';
  Result := gSQLHelper.ExistsRecord(cDBName + '.dbo.T_VIO_HIS', s);
end;

class function TLockVioUtils.IsWhite(hphm, hpzl, cjjg, wfsj: String): Boolean;
var
  s: String;
  qy: TADOQuery;
begin
  Result := False;
  s := ' select 1 from ' + cDBName +
    '.dbo.T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm=' +
    hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString + ' and dwdm=' +
    cjjg.QuotedString + ' and YXSJ<' + wfsj.QuotedString + ' and JSSJ>' +
    wfsj.QuotedString;
  s := s + ' union all ';
  s := s + ' select 1 from ' + cDBName +
    '.dbo.T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm=' +
    hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString + ' and dwdm=left(''' +
    cjjg + ''', 6)+''000000'' and YXSJ<' + wfsj.QuotedString + ' and JSSJ>' +
    wfsj.QuotedString;
  s := s + ' union all ';
  s := s + ' select 1 from ' + cDBName +
    '.dbo.T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm=' +
    hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString + ' and dwdm=left(''' +
    cjjg + ''', 4)+''00000000'' and YXSJ<' + wfsj.QuotedString + ' and JSSJ>' +
    wfsj.QuotedString;
  Result := gSQLHelper.ExistsRecord(s);

  if Result then
    exit;

  // CZ ������
  qy := TADOQuery.Create(nil);
  qy.ConnectionString :=
    'Provider=SQLOLEDB.1;Password=cagajcajak;Persist Security Info=True;User ID=tp;Initial Catalog=vio;Data Source=10.43.255.5';
  qy.SQL.Text := ' select 1 from T_BLACKLIST where hphm = ' + hphm.QuotedString
    + ' and hpzl = ' + hpzl.QuotedString + ' and jssj > ' + wfsj.QuotedString;
  try
    qy.Open;
    Result := qy.RecordCount > 0;
  except
  end;
  qy.Free;
end;

class procedure TLockVioUtils.LockVio(AId, TokenKey: String;
  AResponseInfo: TIdHTTPResponseInfo);
var
  vio: TLockVio;
  json: String;
begin
  vio := GetLockVio(AId);
  if vio.sysid = '' then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('Υ����¼��Υ���豸������');
    exit;
  end;

  if LeftStr(vio.hphm, 2) = '��O' then
  begin
    UpdateVioState(AId, 'B', '');
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
    exit;
  end;

  if IsWhite(vio.hphm, vio.hpzl, vio.cjjg, vio.sj) then
  begin
    UpdateVioState(AId, 'B', '');
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
    exit;
  end;

  if (vio.wfxw = '1344') and Is1344Tzc(vio.hphm, vio.hpzl, vio.wfsj, vio.wfdz)
  then
  begin
    UpdateVioState(AId, 'B', '');
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
    exit;
  end;

  if IsReVio(vio.hphm, vio.hpzl, vio.sj, vio.cjjg) then
  begin
    UpdateVioState(AId, '11', '������¼���ظ�');
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('�ϴ�ʧ��[������¼���ظ�]');
    exit;
  end;

  if not DownloadVioPic(vio) then
  begin
    UpdateVioState(AId, '6', '�ϴ�ʧ��[ͼƬ����ʧ��]');
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('�ϴ�ʧ��[ͼƬ����ʧ��]');
    exit;
  end;

  json := GetVioUploadStr(vio);
  WriteVio(AId, TokenKey, json, vio.flag, AResponseInfo);
  {
    if vio.flag = '0' then
    json := TTmri.WriteVioSurveil(json)
    else
    json := TTmri.WriteVioSurveil1(json);
  }

end;

class function TLockVioUtils.WriteVio(vioid, TokenKey, vioStr, flag: String;
  AResponseInfo: TIdHTTPResponseInfo): String;
var
  s, code, msg: string;
  token: TToken;
  tmriParam: TTmriParam;
begin
  Result := '';
  token := gTokenManager.GetToken(TokenKey);

  if flag = '0' then
    tmriParam := TCommon.GetTmriParam('04C52', token)
  else
    tmriParam := TCommon.GetTmriParam('04C53', token);
  s := TTmri.Write(tmriParam, vioStr);
  glogger.Info(s);

  AnalysisVioUploadResult(s, code, msg);
  if code = '1' then
  begin
    if vioid <> '' then
      UpdateVioState(vioid, '8', '', msg);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
      ('"' + msg + '"');
    Result := msg;
  end
  else
  begin
    if vioid <> '' then
      UpdateVioState(vioid, '6', msg, '');
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(msg);
  end;
end;

class procedure TLockVioUtils.UpdateVioState(id, zt, bz, sxh: String);
var
  s: String;
begin
  s := 'update ' + cDBName + '.dbo.T_VIO_HIS set sxh=' + sxh.QuotedString +
    ',zt=' + zt.QuotedString + ',bz=' + bz.QuotedString + ',GXSJ=' +
    formatDatetime('yyyy/mm/dd hh:nn:ss', now).QuotedString + ' where Systemid='
    + id.QuotedString;
  gSQLHelper.ExecuteSql(s);
end;

class procedure TLockVioUtils.AnalysisVioUploadResult(json: String;
  var code, msg: String);
begin
  code := TCommon.GetJsonNode('code', json);
  msg := TCommon.GetJsonNode('msg', json);
  if msg = '' then
    msg := TCommon.GetJsonNode('msg1', json);
end;

class function TLockVioUtils.BitmapToString(lj: string): WideString;
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

class function TLockVioUtils.DownloadVioPic(var vio: TLockVio): Boolean;
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

class function TLockVioUtils.GetLockVio(ASystemID: String): TLockVio;
var
  s, fzjg, wfxw: String;
begin
  Result.sysid := '';
  s := ' select a.*, b.LHY_WFDD, b.SBDDMC, b.LHY_XZQH, b.LHY_DDMS, b.LHY_LDDM, b.LHY_SBBH, b.LHY_CJFS, b.LHY_JPGQ, b.LHY_JPGW, b.LHY_JPGH, b.xzsd as device_xzsd, '
    + ' c.LHY_WFDD as LHY_WFDD_1, c.LHY_DDMS as LHY_DDMS_1, c.LHY_LDDM as LHY_LDDM_1'
    + ' from ' + cDBName + '.dbo.t_vio_his a with(nolock) ' + ' inner join ' +
    cDBName + '.dbo.S_DEVICE b on a.WFDD = b.SBBH' + ' left join ' + cDBName +
    '.dbo.S_DEVICE c on b.QSSBBH = c.SBBH' + ' where a.SYSTEMID = ' +
    ASystemID.QuotedString;

  with gSQLHelper.Query(s) do
  begin
    if not EOF then
    begin
      Result.sysid := ASystemID;
      Result.cjjg := Trim(FieldByName('cjjg').AsString);
      Result.clfl := '3';
      Result.hphm := Trim(FieldByName('hphm').AsString);
      Result.hpzl := Trim(FieldByName('hpzl').AsString);
      if Length(Trim(FieldByName('syr').AsString)) <= 1 then
        Result.jdcsyr := '��'
      else
        Result.jdcsyr := Trim(FieldByName('syr').AsString);
      Result.syxz := Trim(FieldByName('syxz').AsString);
      Result.fdjh := Trim(FieldByName('fdjh').AsString);
      Result.clsbdh := Trim(FieldByName('clsbdh').AsString);
      Result.csys := Trim(FieldByName('csys').AsString);
      Result.clpp := Trim(FieldByName('clpp1').AsString);
      Result.jtfs := Trim(FieldByName('cllx').AsString);

      fzjg := copy(Trim(FieldByName('hphm').AsString), 1, 1);
      if fzjg = '��' then
        fzjg := '��A'
      else if fzjg = '��' then
        fzjg := '��A'
      else if fzjg = '��' then
        fzjg := '��A'
      else if fzjg = '��' then
        fzjg := '��A'
      else
        fzjg := copy(Trim(FieldByName('hphm').AsString), 1, 2);

      Result.fzjg := fzjg;
      Result.zsxzqh := Trim(FieldByName('zsxzqh').AsString);
      Result.zsxxdz := Trim(FieldByName('zsxxdz').AsString);
      Result.dh := Trim(FieldByName('lxdh').AsString);
      Result.lxfs := '';
      Result.sj := '';
      Result.wfsj := formatDatetime('yyyy-mm-dd hh:mm',
        FieldByName('WFSJ').ASDATETIME);

      wfxw := Trim(FieldByName('WFXW').AsString);
      if wfxw = '1352' then
        wfxw := '1352A';
      if wfxw = '1302' then
        wfxw := '1625';

      Result.wfxw := wfxw;
      Result.zqmj := '';
      Result.spdz := FieldByName('VIDEOFILE').AsString;
      Result.FWQDZ := FieldByName('FWQDZ').AsString;
      Result.xp1 := FieldByName('PHOTOFILE1').AsString;
      Result.xp2 := FieldByName('PHOTOFILE2').AsString;
      Result.xp3 := FieldByName('PHOTOFILE3').AsString;
      Result.bzz := Trim(FieldByName('XZSD').AsString);
      Result.scz := Trim(FieldByName('SJSD').AsString);
      if Length(Trim(FieldByName('zsxxdz').AsString)) > 3 then
        Result.flag := '0'
      else
        Result.flag := '';

      Result.wfdd := Trim(FieldByName('LHY_WFDD').AsString);
      Result.wfdz := Trim(FieldByName('SBDDMC').AsString);
      Result.xzqh := Trim(FieldByName('LHY_XZQH').AsString);
      Result.ddms := Trim(FieldByName('LHY_DDMS').AsString);
      Result.lddm := Trim(FieldByName('LHY_LDDM').AsString);
      Result.sbbh := Trim(FieldByName('LHY_SBBH').AsString);
      Result.cjfs := Trim(FieldByName('LHY_CJFS').AsString);
      Result.tpzl := FieldByName('LHY_JPGQ').AsString;
      Result.tpw := FieldByName('LHY_JPGW').AsString;
      Result.tph := FieldByName('LHY_JPGH').AsString;
      // Result.bzz := FieldByName('Device_xzsd').AsString;
      // �������
      Result.LHY_WFDD_1 := FieldByName('LHY_WFDD_1').AsString;
      Result.LHY_DDMS_1 := FieldByName('LHY_DDMS_1').AsString;
      Result.LHY_LDDM_1 := FieldByName('LHY_LDDM_1').AsString;
    end;
    Free;
  end;
end;

class function TLockVioUtils.GetPic(picServer, picfile,
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
      // FTP ��������ַ
      host := copy(url, Pos('@', url) + 1, Length(url) - Pos('@', url) + 1);
      host := copy(host, 1, Pos(':', host) - 1);
      // FTP�˿�
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
      // FTP�û���
      user := copy(url, 7, Length(url) - 6);
      user := copy(user, 1, Pos(':', user) - 1);
      // FTP����
      pw := copy(url, 7, Length(url) - 6);
      pw := copy(pw, Pos(':', pw) + 1, Length(pw) - Pos(':', pw) + 1);
      pw := copy(pw, 1, Pos('@', pw) - 1);
      idftp1 := TIdFTP.Create(nil);
      idftp1.ConnectTimeout := 3000;
      idftp1.ReadTimeout := 3000;
      idftp1.host := host;
      idftp1.port := iport;
      idftp1.Username := user;
      idftp1.Password := pw;
      idftp1.Connect;
      idftp1.TransferType := ftBinary;
      idftp1.IOHandler.DefStringEncoding := IndyTextEncoding(tencoding.Default);
      idftp1.Passive := True; // �����Ϊ�����ͱ���
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
      idHttp.HandleRedirects := True; // ����֧���ض��������ܳ���
      idHttp.ConnectTimeout := 3000; // �������ʱ�����ٷ���
      idHttp.ReadTimeout := 3000; //
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

class function TLockVioUtils.GetVioUploadStr(vio: TLockVio): String;
begin
  Result := '{"xh":"' + vio.xh + '",' + '"cjjg":"' + vio.cjjg + '",' +
    '"clfl":"' + vio.clfl + '",' + '"hpzl":"' + vio.hpzl + '",' + '"hphm":"' +
    vio.hphm + '",' + '"jdcsyr":"' + vio.jdcsyr + '",' + '"syxz":"' + vio.syxz +
    '",' + '"fdjh":"' + vio.fdjh + '",' + '"clsbdh":"' + vio.clsbdh + '",' +
    '"csys":"' + vio.csys + '",' + '"clpp":"' + vio.clpp + '",' + '"jtfs":"' +
    vio.jtfs + '",' + '"fzjg":"' + vio.fzjg + '",' + '"zsxzqh":"' + vio.zsxzqh +
    '",' + '"zsxxdz":"' + vio.zsxxdz + '",' + '"dh":"' + vio.dh + '",' +
    '"lxfs":"' + vio.lxfs + '",' + '"tzsh":"' + vio.tzsh + '",' + '"tzrq":"' +
    vio.tzrq + '",' + '"cjfs":"' + vio.cjfs + '",' + '"wfsj":"' + vio.wfsj +
    '",' + '"xzqh":"' + vio.xzqh + '",' + '"wfdd":"' + vio.wfdd + '",' +
    '"lddm":"' + vio.lddm + '",' + '"ddms":"' + vio.ddms + '",' + '"wfdz":"' +
    vio.wfdz + '",';
  if vio.cjfs = '7' then
  begin
    Result := Result + '"wfsj1":"' + vio.wfsj + '",' + '"wfdd1":"' +
      vio.LHY_WFDD_1 + '",' + '"lddm1":"' + vio.LHY_LDDM_1 + '",' + '"ddms1":"'
      + vio.LHY_DDMS_1 + '",';
  end;
  Result := Result + '"wfxw":"' + vio.wfxw + '",' + '"scz":"' + vio.scz + '",' +
    '"bzz":"' + vio.bzz + '",' + '"zqmj":"' + vio.zqmj + '",' +
    '"spdz":"http://10.43.255.10/test/test.avi",' + '"sbbh":"' + vio.sbbh + '",'
    + '"zpstr1":"' + vio.zpstr1 + '",' + '"zpstr2":"' + vio.zpstr2 + '",' +
    '"zpstr3":"' + vio.zpstr3 + '"}';
end;

end.
