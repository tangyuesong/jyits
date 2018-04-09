unit uSurveilVio;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, uHik, IdCustomHTTPServer, uRmService,
  uEntity, uLockVio, DateUtils;

type
  TSurveilVio = Class
  private
    class function GetZsxxdz(hphm, hpzl: String): String;
    class procedure SaveVio2DB(ip, code, wfdd: String; vio: TLockVio);
    class function FtpPic(base64Str: String): String;
  public
    class procedure SaveSurveilVio(tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
  end;

implementation

{ TSurveilVio }

class function TSurveilVio.FtpPic(base64Str: String): String;
var
  tp: String;
begin
  tp := formatdatetime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  Result := gConfig.ImportVioHome + 'clientvio/' + formatdatetime('yyyymm-dd',
    Now()) + '/' + tp;
  try
    TCommon.Base64ToFile(base64Str, ExtractFilePath(Paramstr(0)) + tp);
    TCommon.FtpPutFile(gConfig.ImportVioHost, gConfig.ImportVioUser,
      gConfig.ImportVioPassword, ExtractFilePath(Paramstr(0)) + tp,
      '/clientvio/' + formatdatetime('yyyymm-dd', Now()) + '/' + tp,
      gConfig.ImportVioPort);
  except
    on e: exception do
      gLogger.Error(e.Message);
  end;
  TCommon.DelFile(ExtractFilePath(Paramstr(0)) + tp);
end;

class function TSurveilVio.GetZsxxdz(hphm, hpzl: String): String;
begin
  Result := '';
  with gSQLHelper.Query('select ZSXXDZ from ' + cDBName +
    '.dbo.T_VIO_VEHICLE where HPHM=' + hphm.QuotedString + ' and hpzl=' +
    hpzl.QuotedString) do
  begin
    if RecordCount > 0 then
      Result := Fields[0].AsString;
    Free;
  end;
end;

class procedure TSurveilVio.SaveSurveilVio(tokenKey: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  hphm, hpzl, vehstr, wfdd, json, fzjg, wfxw, code, ip: String;
  wfsj: TDatetime;
  device: TDevice;
  vio: TLockVio;
  veh: TVehinfo;
begin
  hphm := params.Values['hphm'];
  hpzl := params.Values['hpzl'];
  wfdd := params.Values['wfdd'];
  wfsj := DateUtils.IncMilliSecond(25569.3333333333,
    StrToInt64Def(params.Values['wfsj'], -346789));

  if TCommon.DicDevice.ContainsKey(wfdd) then
    device := TCommon.DicDevice[wfdd]
  else
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('违法地点不存在');
    exit;
  end;
  vehstr := '[' + TRmService.GetVehinfo(gTokenManager.GetToken(tokenKey), hphm,
    hpzl) + ']';
  veh.hphm := '';
  veh := TCommon.JsonToRecord<TVehinfo>(vehstr);
  if veh.hphm = '' then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('获取车辆信息失败');
    exit;
  end;

  vio.cjjg := device.cjjg;
  vio.clfl := '3';
  vio.hphm := hphm;
  vio.hpzl := hpzl;
  if Length(veh.syr) <= 1 then
    vio.jdcsyr := '无'
  else
    vio.jdcsyr := veh.syr;
  vio.syxz := veh.syxz;
  vio.fdjh := veh.fdjh;
  vio.clsbdh := veh.clsbdh;
  vio.csys := veh.csys;
  vio.clpp := veh.clpp1;
  vio.jtfs := veh.cllx;

  fzjg := copy(hphm, 1, 1);
  if fzjg = '京' then
    fzjg := '京A'
  else if fzjg = '津' then
    fzjg := '津A'
  else if fzjg = '沪' then
    fzjg := '沪A'
  else if fzjg = '渝' then
    fzjg := '渝A'
  else
    fzjg := copy(hphm, 1, 2);

  vio.fzjg := fzjg;
  vio.zsxzqh := veh.zsxzqh;
  vio.zsxxdz := GetZsxxdz(hphm, hpzl);
  vio.dh := veh.lxdh;
  vio.wfsj := formatdatetime('yyyy-mm-dd hh:nn:ss', wfsj);

  wfxw := params.Values['wfxw'];
  if wfxw = '1352' then
    wfxw := '1352A';
  if wfxw = '1302' then
    wfxw := '1625';

  vio.wfxw := wfxw;
  vio.spdz := '';
  vio.zpstr1 := params.Values['pic1'];
  vio.zpstr2 := params.Values['pic2'];

  vio.bzz := device.XZSD.ToString;
  vio.scz := '0';
  if Length(veh.zsxxdz) > 3 then
    vio.flag := '0'
  else
    vio.flag := '';

  vio.wfdd := device.LHY_WFDD;
  vio.wfdz := device.SBDDMC;
  vio.xzqh := device.LHY_XZQH;;
  vio.ddms := device.LHY_DDMS;
  vio.lddm := device.LHY_LDDM;
  vio.sbbh := device.LHY_SBBH;
  vio.cjfs := device.LHY_CJFS;
  vio.tpzl := device.LHY_JPGQ;
  vio.tpw := device.LHY_JPGW;
  vio.tph := device.LHY_JPGH;
  vio.zqmj := gTokenManager.GetToken(tokenKey).Login;
  ip := gTokenManager.GetToken(tokenKey).ip;

  if TLockVioUtils.IsWhite(hphm, hpzl, vio.cjjg, vio.wfsj) then
  begin
    code := 'h' + formatdatetime('hhnnmmzzz', Now());
    TCommon.AssembleSuccessHttpResult('"' + code + '"');
  end
  else
  begin
    json := TLockVioUtils.GetVioUploadStr(vio);
    code := TLockVioUtils.WriteVio('', tokenKey, json, vio.flag, AResponseInfo);
  end;
  if code <> '' then
    SaveVio2DB(ip, code, wfdd, vio);
end;

class procedure TSurveilVio.SaveVio2DB(ip, code, wfdd: String; vio: TLockVio);
var
  s, url1, url2, dir: String;
begin
  url1 := FtpPic(vio.zpstr1);
  url2 := FtpPic(vio.zpstr2);

  s := 'insert into ' + cDBName +
    '.dbo.T_VIO_HIS([SXH],[CJJG],[HPHM],[HPZL],[SYXZ],[WFXW],[WFDD],[WFSJ],[XZSD],[SJSD],'
    + '[PHOTOFILE1],[PHOTOFILE2],[CSYS],[CLPP1],[CLLX],[CLSBDH],[FDJH],[SYR],' +
    '[ZSXZQH],[ZSXXDZ],[ZT],[CJMJ],[LRR],[IP],[BZ]) values (' +
    code.QuotedString + ',' + vio.cjjg.QuotedString + ',' +
    vio.hphm.QuotedString + ',' + vio.hpzl.QuotedString + ',' +
    vio.syxz.QuotedString + ',' + vio.wfxw.QuotedString + ',' +
    wfdd.QuotedString + ',' + vio.wfsj.QuotedString + ',' + vio.bzz.QuotedString
    + ',' + vio.scz.QuotedString + ',' + url1.QuotedString + ',' +
    url2.QuotedString + ',' + vio.csys.QuotedString + ',' +
    vio.clpp.QuotedString + ',' + vio.jtfs.QuotedString + ',' +
    vio.clsbdh.QuotedString + ',' + vio.fdjh.QuotedString + ',' +
    vio.jdcsyr.QuotedString + ',' + vio.zsxzqh.QuotedString + ',' +
    vio.zsxxdz.QuotedString + ',''8'',' + vio.zqmj.QuotedString + ',' +
    vio.zqmj.QuotedString + ',' + ip.QuotedString + ',''现场违停抓拍'') ';
  gSQLHelper.ExecuteSql(s);
end;

end.
