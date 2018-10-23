unit uSurveilVio;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, IdCustomHTTPServer, uRmService,
  uEntity, uLockVio, DateUtils, uRmInf, Windows, imageenview, Vcl.Imaging.jpeg,
  Graphics, QBAES;

type
  TSurveilVio = Class
  private
    class function GetZsxxdz(hphm, hpzl: String): String;
    class procedure SaveVio2DB(ip, code, wfdd, zt: String; vio: TLockVio;
      bz: String = '');
    class function FtpPic(base64Str: String): String;
    class function GetVioUploadStr(vio: TLockVio): String; static;
    class function IsReVio(hphm, hpzl, wfdd, wfxw: String;
      wfsj: TDateTime): Boolean;
    class function AddPicText(sourcePic, targetPic: String;
      vio: TLockVio): Boolean;
    class procedure AddSY(var vio: TLockVio);
  public
    class procedure SaveSurveilVio(tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
  end;

implementation

{ TSurveilVio }

class function TSurveilVio.AddPicText(sourcePic, targetPic: String;
  vio: TLockVio): Boolean;
var
  LogFont: TLogFont;
  img: TImageEnView;
  jpg: TJPEGImage;
  w: Integer;
begin
  Result := True;
  jpg := TJPEGImage.Create;
  jpg.LoadFromFile(sourcePic);
  w := jpg.Width;
  jpg.Free;
  if w > 1200 then
    w := 40
  else
    w := 20;
  img := TImageEnView.Create(nil);
  try
    img.IO.LoadFromFileJpeg(sourcePic);
    with img.Bitmap.Canvas do
    begin
      Font.Name := 'Times New Roman';
      Font.Height := w;
      Font.Color := clRed;
      Windows.GetObject(Font.Handle, SizeOf(TLogFont), @LogFont);
      LogFont.lfQuality := 3;
      Font.Handle := CreateFontIndirect(LogFont);
      Brush.Style := bsClear;
      TextOut(10, 10, '违法时间: ' + vio.wfsj + ' 号牌号码: ' + vio.hphm + ' 号牌种类: ' +
        vio.hpzl);
      TextOut(10, 10 + w * 1, '违法地点: ' + vio.wfdz);
      TextOut(10, 10 + w * 2, '违法代码: ' + vio.wfxw);
      TextOut(10, 10 + w * 3,
        '防伪码: ' + copy(string(AesEncrypt(AnsiString(sourcePic),
        AnsiString(cUserKey))), 1, 20));
    end;
    img.IO.SaveToFileJpeg(targetPic);
  except
    Result := False;
  end;
  img.Free;
end;

class procedure TSurveilVio.AddSY(var vio: TLockVio);
var
  tmpPic1, tmpPic2, Pic1, Pic2: String;
begin
  tmpPic1 := ExtractFilePath(Paramstr(0)) + 'tmp_' + vio.zqmj + '_' +
    formatDatetime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  tmpPic2 := ExtractFilePath(Paramstr(0)) + 'tmp_' + vio.zqmj + '_' +
    formatDatetime('yyyymmddhhnnsszzz', Now()) + '2.jpg';
  Pic1 := ExtractFilePath(Paramstr(0)) + vio.zqmj + '_' +
    formatDatetime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  Pic2 := ExtractFilePath(Paramstr(0)) + vio.zqmj + '_' +
    formatDatetime('yyyymmddhhnnsszzz', Now()) + '2.jpg';

  try
    TCommon.Base64ToFile(vio.zpstr1, tmpPic1);
    AddPicText(tmpPic1, Pic1, vio);
    vio.zpstr1 := TLockVioUtils.BitmapToString(Pic1);
  finally
    if FileExists(tmpPic1) then
      DeleteFile(PChar(tmpPic1));
    if FileExists(Pic1) then
      DeleteFile(PChar(Pic1));
  end;
  try
    TCommon.Base64ToFile(vio.zpstr2, tmpPic2);
    AddPicText(tmpPic2, Pic2, vio);
    vio.zpstr2 := TLockVioUtils.BitmapToString(Pic2);
  finally
    if FileExists(tmpPic2) then
      DeleteFile(PChar(tmpPic2));
    if FileExists(Pic2) then
      DeleteFile(PChar(Pic2));
  end;
end;

class function TSurveilVio.FtpPic(base64Str: String): String;
var
  tp: String;
begin
  tp := formatDatetime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  Result := gConfig.ImportVioHome + 'clientvio/' + formatDatetime('yyyymm-dd',
    Now()) + '/' + tp;
  try
    TCommon.Base64ToFile(base64Str, ExtractFilePath(Paramstr(0)) + tp);
    TCommon.FtpPutFile(gConfig.ImportVioHost, gConfig.ImportVioUser,
      gConfig.ImportVioPassword, ExtractFilePath(Paramstr(0)) + tp,
      '/clientvio/' + formatDatetime('yyyymm-dd', Now()) + '/' + tp,
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

class function TSurveilVio.IsReVio(hphm, hpzl, wfdd, wfxw: String;
  wfsj: TDateTime): Boolean;
var
  s: String;
begin
  s := ' where hphm=' + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString +
    ' and zt=''8'' and wfsj>''' + formatDatetime('yyyy/mm/dd', wfsj - 1) +
    ' 23:50:01'' and wfsj<''' + formatDatetime('yyyy/mm/dd', wfsj + 1) +
    ' 00:10:59'' and wfxw=' + wfxw.QuotedString + ' and wfdd=' +
    wfdd.QuotedString;
  Result := gSQLHelper.ExistsRecord(cDBName + '.dbo.T_VIO_HIS', s);
end;

class procedure TSurveilVio.SaveSurveilVio(tokenKey: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  hphm, hpzl, wfdd, json, wfxw, code, ip, cfzl, bz, msg, zt: String;
  wfsj: TDateTime;
  device: TDevice;
  vio: TLockVio;
begin
  hphm := params.Values['hphm'];
  hpzl := params.Values['hpzl'];
  wfdd := params.Values['wfdd'];
  wfsj := DateUtils.IncMilliSecond(25569.3333333333,
    StrToInt64Def(params.Values['wfsj'], -346789));
  cfzl := params.Values['cfzl'];
  wfxw := params.Values['wfxw'];

  gLogger.Info('[SaveSurveilVio] {"cfzl":"' + cfzl + '","wfdd":"' + wfdd +
    '","hpzl":"' + hpzl + '","hphm":"' + hphm + '","wfsj":"' +
    formatDatetime('yyyy-mm-dd hh:nn:ss', wfsj) + '","wfxw":"' + wfxw + '"}');

  if TCommon.DicDevice.ContainsKey(wfdd) then
    device := TCommon.DicDevice[wfdd]
  else
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('违法地点不存在');
    gLogger.Error('[SaveSurveilVio] 违法地点不存在');
    exit;
  end;

  if IsReVio(hphm, hpzl, wfdd, wfxw, wfsj) then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('重复录入');
    gLogger.Error('[SaveSurveilVio] 重复录入');
    exit;
  end;

  vio.cjjg := device.cjjg;
  vio.clfl := '3';
  vio.hphm := hphm;
  vio.hpzl := hpzl;
  vio.wfsj := formatDatetime('yyyy-mm-dd hh:nn:ss', wfsj);
  vio.wfxw := wfxw;
  vio.spdz := '';
  vio.zpstr1 := params.Values['pic1'];
  vio.zpstr2 := params.Values['pic2'];

  vio.bzz := device.XZSD.ToString;
  vio.scz := '0';

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

  zt := '8';
  // AddSY(vio);

  if TLockVioUtils.IsWhite(hphm, hpzl, vio.cjjg, vio.wfsj) then
  begin
    code := 'h' + formatDatetime('hhnnmmzzz', Now());
    bz := 'h';
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
      ('"' + code + '"');
  end
  else if cfzl = '1' then
  begin
    code := cfzl;
    bz := '警告';
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
      ('"' + code + '"');
  end
  else
  begin
    // json := TLockVioUtils.GetVioUploadStr(vio);
    // code := TLockVioUtils.WriteVio('', tokenKey, json, vio.flag, AResponseInfo);
    json := GetVioUploadStr(vio);
    json := TRminf.surscreen(json);
    gLogger.Info('[SaveSurveilVio]' + json);
    code := TCommon.GetJsonNode('code', json);
    if code = '1' then
    begin
      code := TCommon.GetJsonNode('value', json);
      bz := '';
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(code);
    end
    else
    begin
      zt := '6';
      if code = '0' then
        bz := TCommon.GetJsonNode('message', json)
      else
      begin
        code := '-1';
        bz := 'jcpt error';
      end;
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(bz);
    end;
  end;
  SaveVio2DB(ip, code, wfdd, zt, vio, bz);
end;

class function TSurveilVio.GetVioUploadStr(vio: TLockVio): String;
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

class procedure TSurveilVio.SaveVio2DB(ip, code, wfdd, zt: String;
  vio: TLockVio; bz: String);
var
  s, url1, url2, dir: String;
begin
  if bz = '' then
    bz := '现场违停抓拍'
  else
    bz := '现场违停抓拍,' + bz;
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
    vio.zsxxdz.QuotedString + ',''' + zt + ''',' + vio.zqmj.QuotedString + ',' +
    vio.zqmj.QuotedString + ',' + ip.QuotedString + ',' +
    bz.QuotedString + ') ';
  gSQLHelper.ExecuteSql(s);
end;

end.
