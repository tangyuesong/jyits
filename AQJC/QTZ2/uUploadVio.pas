unit uUploadVio;

interface

uses
  System.SysUtils, Classes, uCommon, IdCustomHTTPServer, StrUtils, uGlobal,
  idHttp, Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, Vcl.ExtCtrls, System.Variants,
  Vcl.Imaging.pngimage, Vcl.Graphics, uTmri, IdFtp, IdFTPCommon, IdGlobal,
  ADODB, uTokenManager, System.NetEncoding, uRmInf, uEntity;

type

  TUploadVio = Class
  private
    function IsHave1340(vio: TLockVioClass): Boolean;
    function IsWNJ(token: TToken; hphm, hpzl: String): Boolean;
    function IsCZWhite(hphm, hpzl, wfsj: String): Boolean;
    procedure UpdateVioState(id, sxh, zt, bz: String);
    function IsReVio(hphm, hpzl, cjjg: String; wfsj: TDateTime): Boolean;
    function Is1344Tzc(hphm, hpzl, wfdz: String; wfsj: TDateTime): Boolean;
    function GetPicStr(vio: TLockVioClass): Boolean;
    function IsWhite(hphm, hpzl, cjjg, wfsj: String): Boolean;
    function GetVio(ASystemID: String): TLockVioClass;
    function GetJCPTVioStr(vio: TLockVioClass): String;
    function GetZHPTVioStr(vio: TLockVioClass): String;
    function UploadVio2JCPT(vio: TLockVioClass): String;
    function UploadVio2ZHPT(token: TToken; vio: TLockVioClass): String;
  public
    function UploadVio(token: TToken; AId: String): String;
  end;

implementation

uses
  uRmService;

function TUploadVio.GetVio(ASystemID: String): TLockVioClass;
var
  s, fzjg: String;
  device: TDevice;
begin
  Result := TLockVioClass.Create;
  s := ' select * from t_vio_his with(nolock) where SYSTEMID = ' +
    ASystemID.QuotedString;
  with gSQLHelper.Query(s) do
  begin
    if not Eof then
    begin
      Result.sysid := ASystemID;
      Result.cjjg := Trim(FieldByName('cjjg').AsString);
      Result.clfl := '3';
      Result.hphm := Trim(FieldByName('hphm').AsString);
      Result.hpzl := Trim(FieldByName('hpzl').AsString);
      if Length(Trim(FieldByName('syr').AsString)) <= 1 then
        Result.jdcsyr := '无'
      else
        Result.jdcsyr := Trim(FieldByName('syr').AsString);
      Result.syxz := Trim(FieldByName('syxz').AsString);
      Result.fdjh := Trim(FieldByName('fdjh').AsString);
      Result.clsbdh := Trim(FieldByName('clsbdh').AsString);
      Result.csys := Trim(FieldByName('csys').AsString);
      Result.clpp := Trim(FieldByName('clpp1').AsString);
      Result.jtfs := Trim(FieldByName('cllx').AsString);

      fzjg := copy(Trim(FieldByName('hphm').AsString), 1, 1);
      if fzjg = '京' then
        fzjg := '京A'
      else if fzjg = '津' then
        fzjg := '津A'
      else if fzjg = '沪' then
        fzjg := '沪A'
      else if fzjg = '渝' then
        fzjg := '渝A'
      else
        fzjg := copy(Trim(FieldByName('hphm').AsString), 1, 2);

      Result.fzjg := fzjg;
      Result.zsxzqh := Trim(FieldByName('zsxzqh').AsString);
      Result.zsxxdz := Trim(FieldByName('zsxxdz').AsString);
      Result.dh := Trim(FieldByName('lxdh').AsString);
      Result.wfsj := FieldByName('WFSJ').ASDATETIME;
      Result.wfxw := FieldByName('wfxw').AsString;
      Result.spdz := FieldByName('VIDEOFILE').AsString;
      Result.FWQDZ := FieldByName('FWQDZ').AsString;
      Result.xp1 := FieldByName('PHOTOFILE1').AsString;
      Result.xp2 := FieldByName('PHOTOFILE2').AsString;
      Result.xp3 := FieldByName('PHOTOFILE3').AsString;
      Result.bzz := Trim(FieldByName('XZSD').AsString);
      Result.scz := Trim(FieldByName('SJSD').AsString);
      Result.wfdd := Trim(FieldByName('WFDD').AsString);
      if TCommon.DicDevice.ContainsKey(Result.wfdd) then
      begin
        device := TCommon.DicDevice[Result.wfdd];
        Result.Device1 := device;
        {
          Result.wfdz := device.SBDDMC;
          Result.wfdd := device.LHY_WFDD;
          Result.xzqh := device.LHY_XZQH;
          Result.ddms := device.LHY_DDMS;
          Result.lddm := device.LHY_LDDM;
          Result.sbbh := device.LHY_SBBH;
          Result.cjfs := device.LHY_CJFS;
          Result.tpzl := device.LHY_JPGQ;
          Result.tpw := device.LHY_JPGW;
          Result.tph := device.LHY_JPGH;
          Result.bzz := IntToStr(device.XZSD);
        }
        if Result.Device1.LHY_CJFS = '7' then
        begin
          if TCommon.DicDevice.ContainsKey(device.qssbbh) then
          begin
            Result.Device2 := TCommon.DicDevice[device.qssbbh];
            {
              device := TCommon.DicDevice[device.qssbbh];
              // 区间测速
              Result.LHY_WFDD_1 := device.LHY_WFDD;
              Result.LHY_DDMS_1 := device.LHY_DDMS;
              Result.LHY_LDDM_1 := device.LHY_LDDM;
            }
          end;
        end;
      end
      else
        gLogger.Error('没找到违法地点:' + Result.wfdd);
    end
    else
      gLogger.Error('没找到记录:' + s);
    Free;
  end;
end;

function TUploadVio.Is1344Tzc(hphm, hpzl, wfdz: String;
  wfsj: TDateTime): Boolean;
var
  s: String;
  ct: String;
begin
  Result := False;
  // 如果违法行为是1344（闯禁行）,忙时都抓，闲时特批车不抓
  ct := FormatDateTime('hhnn', wfsj);
  if (ct >= '0730') and (ct < '0900') then
    exit;
  if (ct >= '1100') and (ct < '1230') then
    exit;
  if (ct >= '1700') and (ct < '1900') then
    exit;

  wfdz := ',' + wfdz + ',';
  s := ' select 1 from t_ntzlist where hphm = ' + hphm.QuotedString +
    ' and hpzl = ' + hpzl.QuotedString + ' and jssj > ' +
    FormatDateTime('yyyy-mm-dd hh:nn:ss', wfsj).QuotedString + ' and charindex('
    + wfdz.QuotedString + ', '',''+sbbh+'','') > 0';
  with gSQLHelper.Query(s) do
  begin
    Result := not Eof;
    Free;
  end;
end;

function TUploadVio.IsCZWhite(hphm, hpzl, wfsj: String): Boolean;
var
  qy: TADOQuery;
begin
  Result := False;
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

function TUploadVio.IsHave1340(vio: TLockVioClass): Boolean;
var
  s: String;
begin
  Result := False;
  s := ' select 1 from T_VIO_HIS where hphm = ' + vio.hphm.QuotedString +
    ' and hpzl = ' + vio.hpzl.QuotedString + ' and ZT=''8'' and wfsj > ''' +
    FormatDateTime('yyyy-mm-dd hh:nn:ss', vio.wfsj - 15) + '''';
  with gSQLHelper.Query(s) do
  begin
    Result := RecordCount > 0;
    Free;
  end;

end;

function TUploadVio.IsReVio(hphm, hpzl, cjjg: String; wfsj: TDateTime): Boolean;
var
  s: String;
begin
  s := ' where hphm=' + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString +
    ' and bj=''8'' and cjjg=' + cjjg.QuotedString + ' and wfsj>''' +
    FormatDateTime('yyyy/mm/dd', wfsj - 1) + ' 23:50:01'' and wfsj<''' +
    FormatDateTime('yyyy/mm/dd', wfsj + 1) + ' 00:10:59''';
  Result := gSQLHelper.ExistsRecord('T_VIO_TEMP', s);
end;

function TUploadVio.IsWhite(hphm, hpzl, cjjg, wfsj: String): Boolean;
var
  s: String;
begin
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

function TUploadVio.IsWNJ(token: TToken; hphm, hpzl: String): Boolean;
var
  vehStr: String;
  yxqz: String;
begin
  Result := True;
  try
    if RmService <> nil then
    begin
      vehStr := RmService.GetVehInfo(token, hphm, hpzl);
      if vehStr <> '' then
      begin
        yxqz := TCommon.GetJsonNode('YXQZ', vehStr);
        if VarToDateTime(yxqz) < Now - 180 then
          Result := False;
      end;
    end;
  except
    on e: exception do
      gLogger.Error(e.Message);
  end;
end;

function TUploadVio.GetPicStr(vio: TLockVioClass): Boolean;
var
  b: Boolean;
begin
  if Length(Trim(vio.xp1)) > 0 then
  begin
    vio.zpstr1 := TCommon.PicUrl2Str(vio.FWQDZ + vio.xp1);
    b := Length(vio.zpstr1) > 0;
  end
  else
    b := False;

  if b and (Length(vio.xp2) > 0) then
  begin
    vio.zpstr2 := TCommon.PicUrl2Str(vio.FWQDZ + vio.xp2);
    b := Length(vio.zpstr2) > 0;
  end;

  if b and (Length(vio.xp3) > 0) then
  begin
    vio.zpstr3 := TCommon.PicUrl2Str(vio.FWQDZ + vio.xp3);
    b := Length(vio.zpstr3) > 0;
  end;
  Result := b;
end;

function TUploadVio.UploadVio(token: TToken; AId: String): String;
var
  vio: TLockVioClass;
begin
  vio := GetVio(AId);
  if vio.Device1.SystemID = '' then
  begin
    Result := '违法记录或违法设备不存在';
    vio.Free;
    exit;
  end;

  if LeftStr(vio.hphm, 2) = '粤O' then
  begin
    UpdateVioState(AId, 'B', '8', '粤O');
    Result := '成功';
    vio.Free;
    exit;
  end;

  if IsWhite(vio.hphm, vio.hpzl, vio.cjjg, FormatDateTime('yyyy/mm/dd hh:nn:ss',
    vio.wfsj)) then
  begin
    UpdateVioState(AId, 'B', '8', 'B');
    Result := '成功';
    vio.Free;
    exit;
  end;

  if IsCZWhite(vio.hphm, vio.hpzl, FormatDateTime('yyyy/mm/dd hh:nn:ss',
    vio.wfsj)) then
  begin
    UpdateVioState(AId, 'B', '8', 'B');
    Result := '成功';
    vio.Free;
    exit;
  end;

  if (vio.wfxw = '1344') and Is1344Tzc(vio.hphm, vio.hpzl, vio.Device1.SBDDMC,
    vio.wfsj) then
  begin
    UpdateVioState(AId, 'B', '8', '泥头车特批');
    Result := '成功';
    vio.Free;
    exit;
  end;

  if IsReVio(vio.hphm, vio.hpzl, vio.cjjg, vio.wfsj) then
  begin
    UpdateVioState(AId, '', '11', '机动车录入重复');
    Result := '上传失败[机动车录入重复]';
    vio.Free;
    exit;
  end;

  if not GetPicStr(vio) then
  begin
    UpdateVioState(AId, '', '6', '图片下载失败');
    Result := '上传失败[图片下载失败]';
    vio.Free;
    exit;
  end;

  if vio.wfxw = '1340' then // 每月只抓两次次未年检
  begin
    if IsHave1340(vio) then
    begin
      UpdateVioState(AId, '', '6', '重复录入');
      Result := '上传失败[重复录入]';
      vio.Free;
      exit;
    end;
    if not IsWNJ(token, vio.hphm, vio.hpzl) then
    begin
      UpdateVioState(AId, '', '6', '未过年检期');
      Result := '上传失败[未过年检期]';
      vio.Free;
      exit;
    end;
  end;

  if vio.Device1.UploadJCPT then
    Result := UploadVio2JCPT(vio)
  else
    Result := UploadVio2ZHPT(token, vio);
  vio.Free;
end;

procedure TUploadVio.UpdateVioState(id, sxh, zt, bz: String);
var
  s: String;
begin
  s := 'update T_VIO_HIS set sxh= ' + sxh.QuotedString + ', zt=' +
    zt.QuotedString + ',bz=' + bz.QuotedString + ',GXSJ=' +
    FormatDateTime('yyyy/mm/dd hh:nn:ss', Now).QuotedString + ' where Systemid='
    + id.QuotedString;
  gSQLHelper.ExecuteSql(s);
end;

// UploadVio2ZHPT
function TUploadVio.UploadVio2ZHPT(token: TToken; vio: TLockVioClass): String;
var
  vioStr, s, code, sxh, zt, bz, msg, msg1: String;
  tp: TTmriParam;
begin
  try
    vioStr := GetZHPTVioStr(vio);
    if LeftStr(vio.hphm, 1) = '粤' then
      tp := TCommon.GetTmriParam('04C52', token)
    else
      tp := TCommon.GetTmriParam('04C53', token);
    s := TTmri.Write(tp, vioStr);
    // gLogger.Debug('[UploadVio]' + vioStr);
    gLogger.Info('[UploadVio] Result: ' + s);
    if s = '' then
    begin
      Result := '上传失败[网络故障]';
    end
    else
    begin
      code := TCommon.GetJsonNode('code', s);
      if code = '1' then
      begin
        zt := '8';
        bz := '';
        sxh := TCommon.GetJsonNode('msg', s);
        if sxh = '1' then
          sxh := TCommon.GetJsonNode('msg1', s);
        Result := '上传成功';
      end
      else
      begin
        zt := '6';
        msg := TCommon.GetJsonNode('msg', s);
        msg1 := TCommon.GetJsonNode('msg1', s);
        if Length(msg) < Length(msg1) then
          bz := msg1
        else
          bz := msg;
        sxh := '';
        Result := '上传失败[' + bz + ']';
        gLogger.Error(s);
      end;
      UpdateVioState(vio.sysid, sxh, zt, bz);
    end;
  except
    on e: exception do
      gLogger.Error('[UploadVio]' + e.Message);
  end;
end;

function TUploadVio.GetZHPTVioStr(vio: TLockVioClass): String;
var
  ts: TStrings;
begin
  Result := '{"xh":"' + vio.xh + '",' + '"cjjg":"' + vio.cjjg + '",' +
    '"clfl":"' + vio.clfl + '",' + '"hpzl":"' + vio.hpzl + '",' + '"hphm":"' +
    vio.hphm + '",' + '"jdcsyr":"' + vio.jdcsyr + '",' + '"syxz":"' + vio.syxz +
    '",' + '"fdjh":"' + vio.fdjh + '",' + '"clsbdh":"' + vio.clsbdh + '",' +
    '"csys":"' + vio.csys + '",' + '"clpp":"' + vio.clpp + '",' + '"jtfs":"' +
    vio.jtfs + '",' + '"fzjg":"' + vio.fzjg + '",' + '"zsxzqh":"' + vio.zsxzqh +
    '",' + '"zsxxdz":"' + vio.zsxxdz + '",' + '"dh":"' + vio.dh + '",' +
    '"lxfs":"' + vio.lxfs + '",' + '"tzsh":"' + vio.tzsh + '",' + '"tzrq":"' +
    vio.tzrq + '",' + '"cjfs":"' + vio.Device1.LHY_CJFS + '",' + '"wfsj":"' +
    FormatDateTime('yyyy-mm-dd hh:nn', vio.wfsj) + '",' + '"xzqh":"' +
    vio.Device1.LHY_XZQH + '",' + '"wfdd":"' + vio.Device1.LHY_WFDD + '",' +
    '"lddm":"' + vio.Device1.LHY_LDDM + '",' + '"ddms":"' + vio.Device1.LHY_DDMS
    + '",' + '"wfdz":"' + vio.Device1.SBDDMC + '",';
  if vio.Device1.LHY_CJFS = '7' then
  begin
    Result := Result + '"wfsj1":"' + FormatDateTime('yyyy-mm-dd hh:nn',
      vio.wfsj) + '",' + '"wfdd1":"' + vio.Device2.LHY_WFDD + '",' + '"lddm1":"'
      + vio.Device2.LHY_LDDM + '",' + '"ddms1":"' + vio.Device2.LHY_DDMS + '",';
  end;
  Result := Result + '"wfxw":"' + vio.wfxw + '",' + '"scz":"' + vio.scz + '",' +
    '"bzz":"' + vio.bzz + '",' + '"zqmj":"' + vio.zqmj + '",' +
    '"spdz":"http://10.43.255.10/test/test.avi",' + '"sbbh":"' +
    vio.Device1.LHY_SBBH + '",' + '"zpstr1":"' + vio.zpstr1 + '",' +
    '"zpstr2":"' + vio.zpstr2 + '",' + '"zpstr3":"' + vio.zpstr3 + '" }';
  {
    Result := '{"cjjg":"' + vio.cjjg + '",' + '"clfl":"' + vio.clfl + '",' +
    '"hpzl":"' + vio.hpzl + '",' + '"hphm":"' + vio.hphm + '","jtfs":"' +
    vio.jtfs + '",' + '"fzjg":"' + vio.fzjg + '","cjfs":"' +
    vio.Device1.LHY_CJFS + '",' + '"wfsj":"' +
    FormatDateTime('yyyy-mm-dd hh:nn', vio.wfsj) + '",' + '"xzqh":"' +
    vio.Device1.LHY_XZQH + '",' + '"wfdd":"' + vio.Device1.LHY_WFDD + '",' +
    '"lddm":"' + vio.Device1.LHY_LDDM + '",' + '"ddms":"' + vio.Device1.LHY_DDMS
    + '",' + '"wfdz":"' + vio.Device1.SBDDMC + '",';
    if vio.Device1.LHY_CJFS = '7' then
    begin
    Result := Result + '"wfsj1":"' + FormatDateTime('yyyy-mm-dd hh:nn',
    vio.wfsj) + '",' + '"wfdd1":"' + vio.Device2.LHY_WFDD + '",' + '"lddm1":"'
    + vio.Device2.LHY_LDDM + '",' + '"ddms1":"' + vio.Device2.LHY_DDMS + '",';
    end;
    Result := Result + '"wfxw":"' + vio.wfxw + '",' + '"scz":"' + vio.scz + '",' +
    '"bzz":"' + vio.bzz + '","sbbh":"' + vio.Device1.LHY_SBBH + '",' +
    '"zpstr1":"' + vio.zpstr1 + '",' + '"zpstr2":"' + vio.zpstr2 + '",' +
    '"zpstr3":"' + vio.zpstr3 + '" }// ';
  // ts:= TStringList.Create;
  // ts.Add(result);
  // ts.SaveToFile('d:\61.txt');
  // ts.Free;

end;

// UploadVio2JCPT
function TUploadVio.UploadVio2JCPT(vio: TLockVioClass): String;
var
  vioStr, s, code, bz, zt: String;
begin
  try
    vioStr := GetJCPTVioStr(vio);
    s := TRminf.surscreen(vioStr);
    // gLogger.Info('[UploadVio] Upload Result:' + s);
    if s = '' then
    begin
      Result := '上传失败[网络故障]';
    end
    else
    begin
      code := TCommon.GetJsonNode('code', s);
      if code = '1' then
      begin
        code := TCommon.GetJsonNode('value', s);
        bz := '';
        zt := '8';
        Result := '成功';
      end
      else
      begin
        zt := '6';
        code := '';
        if code = '0' then
        begin
          bz := TCommon.GetJsonNode('message', s);
          Result := bz;
        end
        else
          Result := '失败';
      end;
      UpdateVioState(vio.sysid, code, zt, bz);
    end;
  except
    on e: exception do
      gLogger.Error('[UploadVio]' + e.Message);
  end;
end;

function TUploadVio.GetJCPTVioStr(vio: TLockVioClass): String;
var
  zpsl: string;
begin
  Result := '{"sbbh":"' + vio.Device1.LHY_SBBH + '","hpzl":"' + vio.hpzl +
    '","hphm":"' + vio.hphm + '","wfsj":"' +
    FormatDateTime('yyyy-mm-dd hh:nn:ss', vio.wfsj) + '","wfxw":"' + vio.wfxw +
    '","scz":"' + vio.scz + '","wfdz":"' + vio.Device1.SBDDMC + '","xzqh":"' +
    vio.Device1.LHY_XZQH + '","wfdd":"' + vio.Device1.LHY_WFDD + '","lddm":"' +
    vio.Device1.LHY_LDDM + '","ddms":"' + vio.Device1.LHY_DDMS + '",';
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
