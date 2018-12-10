unit uSurveilVio;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, IdCustomHTTPServer, uRmService,
  DateUtils, uRmInf, Windows, imageenview, Vcl.Imaging.jpeg,
  Graphics, QBAES, System.Generics.Collections, ADODB, System.NetEncoding;

type
  TSurveil = Record
    sxh: String;
    hphm: String;
    hpzl: String;
    wfsj: TDatetime;
    xzqh: String;
    wfdd: String;
    lddm: String;
    ddms: String;
    wfdz: String;
    sbbh: String;
    wfxw: String;
    zqmj: String;
    fxjg: String;
    cfzl: String;
    zt: String;
    pic1Str: String;
    pic2Str: String;
    bz: String;
    wsbh: String;
  End;

  TSurveilVio = Class
  private
    class var FDicSBBH: TDictionary<string, string>;
    class function GetZsxxdz(hphm, hpzl: String): String;
    class procedure SaveVio2DB(vio: TSurveil);
    class function FtpPic(base64Str: String): String;
    class function GetVioUploadStr(vio: TSurveil): String; static;
    class function IsReVio(vio: TSurveil): Boolean;
    class function AddPicText(sourcePic, targetPic: String;
      vio: TSurveil): Boolean;
    class procedure AddSY(var vio: TSurveil);
    class function IsWhite(vio: TSurveil): Boolean;
    class function BitmapToString(lj: string): WideString;
    class function GetDicSBBH: TDictionary<string, string>; static;
    class property DicSBBH: TDictionary<string, string> read GetDicSBBH;
  public
    class procedure SaveSurveilVio(tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
  end;

implementation

{ TSurveilVio }

class function TSurveilVio.AddPicText(sourcePic, targetPic: String;
  vio: TSurveil): Boolean;
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
      TextOut(10, 10, '违法时间: ' + FormatDateTime('yyyy-mm-dd hh:nn:ss', vio.wfsj)
        + ' 号牌号码: ' + vio.hphm + ' 号牌种类: ' + vio.hpzl);
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

class procedure TSurveilVio.AddSY(var vio: TSurveil);
var
  tmpPic1, tmpPic2, pic1, pic2: String;
begin
  tmpPic1 := ExtractFilePath(Paramstr(0)) + 'tmp_' + vio.zqmj + '_' +
    FormatDateTime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  tmpPic2 := ExtractFilePath(Paramstr(0)) + 'tmp_' + vio.zqmj + '_' +
    FormatDateTime('yyyymmddhhnnsszzz', Now()) + '2.jpg';
  pic1 := ExtractFilePath(Paramstr(0)) + vio.zqmj + '_' +
    FormatDateTime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  pic2 := ExtractFilePath(Paramstr(0)) + vio.zqmj + '_' +
    FormatDateTime('yyyymmddhhnnsszzz', Now()) + '2.jpg';

  try
    TCommon.Base64ToFile(vio.pic1Str, tmpPic1);
    AddPicText(tmpPic1, pic1, vio);
    vio.pic1Str := BitmapToString(pic1);
  finally
    if FileExists(tmpPic1) then
      DeleteFile(PChar(tmpPic1));
    if FileExists(pic1) then
      DeleteFile(PChar(pic1));
  end;
  try
    TCommon.Base64ToFile(vio.pic2Str, tmpPic2);
    AddPicText(tmpPic2, pic2, vio);
    vio.pic2Str := BitmapToString(pic2);
  finally
    if FileExists(tmpPic2) then
      DeleteFile(PChar(tmpPic2));
    if FileExists(pic2) then
      DeleteFile(PChar(pic2));
  end;
end;

class function TSurveilVio.BitmapToString(lj: string): WideString;
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

class function TSurveilVio.FtpPic(base64Str: String): String;
var
  tp: String;
begin
  tp := FormatDateTime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  Result := gConfig.ImportVioHome + 'clientvio/' + FormatDateTime('yyyymm-dd',
    Now()) + '/' + tp;
  try
    TCommon.Base64ToFile(base64Str, ExtractFilePath(Paramstr(0)) + tp);
    TCommon.FtpPutFile(gConfig.ImportVioHost, gConfig.ImportVioUser,
      gConfig.ImportVioPassword, ExtractFilePath(Paramstr(0)) + tp,
      '/clientvio/' + FormatDateTime('yyyymm-dd', Now()) + '/' + tp,
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

class function TSurveilVio.IsReVio(vio: TSurveil): Boolean;
var
  s: String;
begin
  s := ' where hphm=' + vio.hphm.QuotedString + ' and hpzl=' +
    vio.hpzl.QuotedString + ' and zt=''1'' and wfsj>''' +
    FormatDateTime('yyyy/mm/dd', vio.wfsj - 1) + ' 23:50:01'' and wfsj<''' +
    FormatDateTime('yyyy/mm/dd', vio.wfsj + 1) + ' 00:10:59'' and wfxw=' +
    vio.wfxw.QuotedString + ' and wfdz=' + vio.wfdz.QuotedString;
  Result := gSQLHelper.ExistsRecord(cDBName + '.dbo.T_Spot_Surveil', s);
end;

class function TSurveilVio.IsWhite(vio: TSurveil): Boolean;
var
  s, wfsj: String;
  qy: TADOQuery;
begin
  Result := False;
  wfsj := FormatDateTime('yyyy-mm-dd hh:nn:ss', vio.wfsj);
  s := ' select 1 from ' + cDBName +
    '.dbo.T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm=' +
    vio.hphm.QuotedString + ' and hpzl=' + vio.hpzl.QuotedString + ' and dwdm='
    + vio.fxjg.QuotedString + ' and YXSJ<' + wfsj.QuotedString + ' and JSSJ>' +
    wfsj.QuotedString;
  s := s + ' union all ';
  s := s + ' select 1 from ' + cDBName +
    '.dbo.T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm=' +
    vio.hphm.QuotedString + ' and hpzl=' + vio.hpzl.QuotedString +
    ' and dwdm=left(''' + vio.fxjg + ''', 6)+''000000'' and YXSJ<' +
    wfsj.QuotedString + ' and JSSJ>' + wfsj.QuotedString;
  s := s + ' union all ';
  s := s + ' select 1 from ' + cDBName +
    '.dbo.T_VIO_WHILELIST where ZT=1 and powertype in (1,2) and hphm=' +
    vio.hphm.QuotedString + ' and hpzl=' + vio.hpzl.QuotedString +
    ' and dwdm=left(''' + vio.fxjg + ''', 4)+''00000000'' and YXSJ<' +
    wfsj.QuotedString + ' and JSSJ>' + wfsj.QuotedString;
  Result := gSQLHelper.ExistsRecord(s);

  if Result then
    exit;

  // CZ 白名单
  qy := TADOQuery.Create(nil);
  qy.ConnectionString :=
    'Provider=SQLOLEDB.1;Password=cagajcajak;Persist Security Info=True;User ID=tp;Initial Catalog=vio;Data Source=10.43.255.5';
  qy.SQL.Text := ' select 1 from T_BLACKLIST where hphm = ' +
    vio.hphm.QuotedString + ' and hpzl = ' + vio.hpzl.QuotedString +
    ' and jssj > ' + wfsj.QuotedString;
  try
    qy.Open;
    Result := qy.RecordCount > 0;
  except
  end;
  qy.Free;
end;

class procedure TSurveilVio.SaveSurveilVio(tokenKey: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, bz, ip, msg: String;
  vio: TSurveil;
begin
  vio.hphm := params.Values['hphm'];
  vio.hpzl := params.Values['hpzl'];
  vio.wfsj := DateUtils.IncMilliSecond(25569.3333333333,
    StrToInt64Def(params.Values['wfsj'], -346789));
  vio.cfzl := params.Values['cfzl'];
  vio.wfxw := params.Values['wfxw'];
  vio.xzqh := params.Values['xzqh'];
  vio.wfdd := params.Values['wfdd'];
  vio.lddm := params.Values['lddm'];
  vio.ddms := params.Values['ddms'];
  vio.wfdz := params.Values['wfdz'];
  vio.zqmj := gTokenManager.GetToken(tokenKey).Login;
  vio.fxjg := gTokenManager.GetToken(tokenKey).User.DWDM;
  vio.pic1Str := params.Values['pic1'];
  vio.pic2Str := params.Values['pic2'];
  vio.wsbh := params.Values['wsbh'];

  gLogger.Info('[SaveSurveilVio] {"cfzl":"' + vio.cfzl + '","wfdz":"' + vio.wfdz
    + '","hpzl":"' + vio.hpzl + '","hphm":"' + vio.hphm + '","wfsj":"' +
    FormatDateTime('yyyy-mm-dd hh:nn:ss', vio.wfsj) + '","wfxw":"' + vio.wfxw +
    '","zqmj":"' + vio.zqmj + '","fxjg":"' + vio.fxjg + '"}');

  if not DicSBBH.ContainsKey(vio.fxjg) then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('未配置违停设备编号');
    gLogger.Error('[SaveSurveilVio] 未配置违停设备编号');
    exit;
  end
  else
    vio.sbbh := DicSBBH[vio.fxjg];

  if IsReVio(vio) then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('重复录入');
    gLogger.Error('[SaveSurveilVio] 重复录入');
    exit;
  end;

  // AddSY(vio);     //前端加水印

  if IsWhite(vio) then
  begin
    vio.zt := '1';
    vio.sxh := 'h';
    vio.bz := 'h';
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('"1"');
  end
  else if vio.cfzl = '1' then
  begin
    vio.zt := '1';
    vio.sxh := '1';
    vio.bz := '警告';
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('"1"');
  end
  else
  begin
    json := GetVioUploadStr(vio);
    json := TRminf.surscreen(json);
    gLogger.Info('[SaveSurveilVio]' + json);
    vio.sxh := TCommon.GetJsonNode('code', json);
    if vio.sxh = '1' then
    begin
      vio.zt := '1';
      vio.sxh := TCommon.GetJsonNode('value', json);
      vio.bz := '成功';
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(vio.sxh);
    end
    else
    begin
      vio.zt := '0';
      if vio.sxh = '0' then
      begin
        bz := TCommon.GetJsonNode('message', json);
        vio.bz := bz;
      end
      else
      begin
        vio.sxh := '-1';
        bz := 'jcpt error';
        vio.bz := json;
      end;
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(bz);
    end;
  end;
  SaveVio2DB(vio);
end;

class function TSurveilVio.GetDicSBBH: TDictionary<string, string>;
begin
  if FDicSBBH = nil then
  begin
    FDicSBBH := TDictionary<string, string>.Create;
    with gSQLHelper.Query('select dwdm, sbbh from ' + cDBName +
      '.dbo.T_WT_SBBH') do
    begin
      while not Eof do
      begin
        FDicSBBH.Add(Fields[0].AsString, Fields[1].AsString);
        Next;
      end;
      Free;
    end;
  end;
  Result := FDicSBBH;
end;

class function TSurveilVio.GetVioUploadStr(vio: TSurveil): String;
var
  zpsl: string;
begin
  Result := '{"zqmj":"' + vio.zqmj + '","sbbh":"' + vio.sbbh + '","hpzl":"' +
    vio.hpzl + '","hphm":"' + vio.hphm + '","wfsj":"' +
    FormatDateTime('yyyy-mm-dd hh:nn:ss', vio.wfsj) + '","wfxw":"' + vio.wfxw +
    '","wfdz":"' + vio.wfdz + '","xzqh":"' + vio.xzqh + '","wfdd":"' + vio.wfdd
    + '","lddm":"' + vio.lddm + '","ddms":"' + vio.ddms + '",';
  zpsl := '1';
  if vio.pic1Str <> '' then
    Result := Result + '"zpstr1":"' + vio.pic1Str + '",';
  if vio.pic2Str <> '' then
  begin
    Result := Result + '"zpstr2":"' + vio.pic2Str + '",';
    zpsl := '2';
  end;
  Result := Result + '"zpsl":"' + zpsl + '"}';
end;

class procedure TSurveilVio.SaveVio2DB(vio: TSurveil);
var
  s, url1, url2: String;
begin
  url1 := FtpPic(vio.pic1Str);
  url2 := FtpPic(vio.pic2Str);
  s := 'insert into ' + cDBName +
    '.dbo.T_Spot_Surveil([SXH],[HPHM],[HPZL],[WFSJ],[XZQH],[WFDD],[LDDM],[DDMS],'
    + '[WFDZ],[SBBH],[WFXW],[ZQMJ],[FXJG],[PIC1],[PIC2],[CFZL],[ZT],[BZ],[WSBH]) values ('
    + vio.sxh.QuotedString + ',' + vio.hphm.QuotedString + ',' +
    vio.hpzl.QuotedString + ',''' + FormatDateTime('yyyy-mm-dd hh:nn:ss',
    vio.wfsj) + ''',' + vio.xzqh.QuotedString + ',' + vio.wfdd.QuotedString +
    ',' + vio.lddm.QuotedString + ',' + vio.ddms.QuotedString + ',' +
    vio.wfdz.QuotedString + ',' + vio.sbbh.QuotedString + ',' +
    vio.wfxw.QuotedString + ',' + vio.zqmj.QuotedString + ',' +
    vio.fxjg.QuotedString + ',' + url1.QuotedString + ',' + url2.QuotedString +
    ',' + vio.cfzl.QuotedString + ',' + vio.zt.QuotedString + ',' +
    vio.bz.QuotedString + ',' + vio.wsbh.QuotedString + ') ';
  gSQLHelper.ExecuteSql(s);
end;

end.
