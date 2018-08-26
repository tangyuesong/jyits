unit itfUploadVioTo61;

interface

uses
  uGlobal, SysUtils, ADODB, System.Classes, IdHttp, IdFtp, IdFTPCommon,
  IdGlobal, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Imaging.pngimage, uEntity,
  Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg, Soap.EncdDecd, uCommon, StrUtils;

type
  TDealLockVioClass = Class
  private
    FLockVio: TLockVioClass;
    function IsCZWhite(hphm, hpzl, wfsj: String): Boolean;
    function BitmapToString(lj: string): WideString;
    function CheakTzcp1(hphm, hpzl, wfsj, wfdz: String): Boolean;
    function GetPic(picServer, picfile, sfilename: string): Boolean;
    function DownloadPic(): Boolean;
    function GetFlag(): String;
  public
    property VioFlag: String read GetFlag;
    function InitVio(vio: String): String;
    function GetVioUploadStr: String;
    destructor Destroy; override;
  end;

implementation

function TDealLockVioClass.GetFlag(): String;
begin
  Result := '';
  if FLockVio <> nil then
  begin
    if FLockVio.hphm.Substring(1) = '粤' then
      Result := '0'
    else
      Result := '1';
  end;
end;

function TDealLockVioClass.IsCZWhite(hphm, hpzl, wfsj: String): Boolean;
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

function TDealLockVioClass.CheakTzcp1(hphm, hpzl, wfsj, wfdz: String): Boolean;
var
  // qy: TADOQuery;
  s: String;
begin
  Result := False;
  {
    qy := TADOQuery.Create(nil);
    qy.ConnectionString :=
    'Provider=SQLOLEDB.1;Password=cagajcajak;Persist Security Info=True;User ID=tp;Initial Catalog=vio;Data Source=10.43.255.5';
    qy.SQL.Text := ' select 1 from t_ntzlist where hphm = ' + hphm.QuotedString +
    ' and hpzl = ' + hpzl.QuotedString + ' and jssj > ' + wfsj.QuotedString;
    try
    qy.Open;
    Result := qy.RecordCount > 0;
    except
    end;
    qy.Free;
  }
  wfdz := ',' + wfdz + ',';
  s := ' select 1 from t_ntzlist where hphm = ' + hphm.QuotedString +
    ' and hpzl = ' + hpzl.QuotedString + ' and jssj > ' + wfsj.QuotedString +
    ' and charindex(' + wfdz.QuotedString + ', '',''+sbbh+'','') > 0';
  with gSQLHelper.Query(s) do
  begin
    Result := RecordCount > 0;
    Free;
  end;

end;

function TDealLockVioClass.GetPic(picServer, picfile,
  sfilename: string): Boolean;
var
  ms: TMemoryStream;
  host, port, user, pw, path, urlcn, url: string;
  iport: Integer;
  IdHttp: TIdHTTP;
  idftp1: TIdFTP;
begin
  Result := False;
  url := picServer + picfile;

  if fileexists(sfilename) then
    deletefile(sfilename);
  if UpperCase(Copy(url, 1, 3)) = 'FTP' then
  begin
    try
      path := Copy(url, Pos('@', url) + 1, Length(url) - Pos('@', url) + 1);
      path := Copy(path, Pos('/', path) + 1, Length(path) - Pos('/', path) + 1);
      // FTP 服务器地址
      host := Copy(url, Pos('@', url) + 1, Length(url) - Pos('@', url) + 1);
      host := Copy(host, 1, Pos(':', host) - 1);
      // FTP端口
      port := Copy(url, Pos('@', url) + 1, Length(url) - Pos('@', url) + 1);
      if Pos(':', port) > 0 then
      begin
        port := Copy(port, Pos(':', port) + 1, Length(port) - Pos(':',
          port) + 1);
        port := Copy(port, 1, Pos('/', port) - 1);
      end
      else
      begin
        port := '21';
      end;

      iport := StrToInt(port);
      // FTP用户名
      user := Copy(url, 7, Length(url) - 6);
      user := Copy(user, 1, Pos(':', user) - 1);
      // FTP密码
      pw := Copy(url, 7, Length(url) - 6);
      pw := Copy(pw, Pos(':', pw) + 1, Length(pw) - Pos(':', pw) + 1);
      pw := Copy(pw, 1, Pos('@', pw) - 1);
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
  if UpperCase(Copy(url, 1, 4)) = 'HTTP' then
  begin
    ms := TMemoryStream.Create;
    IdHttp := TIdHTTP.Create(nil);
    try
      IdHttp.HandleRedirects := True; // 必须支持重定向否则可能出错
      IdHttp.ConnectTimeout := 30000; // 超过这个时间则不再访问
      IdHttp.ReadTimeout := 30000; //
      urlcn := IdHttp.url.URLEncode(url);
      IdHttp.Get(urlcn, ms);
      ms.SaveToFile(sfilename);
      Result := True;
    except
      on e: exception do
        gLogger.Error(e.Message);
    end;
    IdHttp.Free;
    ms.Free;
  end;
end;

function TDealLockVioClass.BitmapToString(lj: string): WideString;
var
  ms: TMemoryStream;
  ss: TStringStream;
  s: string;
  image1: TImage;
  bitmap1: TBitmap;
  PNG1: TPngImage;
  GIF1: TGIFImage;
  JPEG1: TJPEGImage;
begin
  try
    image1 := TImage.Create(nil);
    image1.Picture.LoadFromFile(lj);
    ms := TMemoryStream.Create;
    if (UpperCase(ExtractFileExt(lj)) = '.JPG') or
      (UpperCase(ExtractFileExt(lj)) = '.JPEG') then
    begin
      JPEG1 := TJPEGImage.Create;
      JPEG1.Assign(image1.Picture.Graphic);
      JPEG1.SaveToStream(ms);
      FreeAndNil(JPEG1);
    end
    else if (UpperCase(ExtractFileExt(lj)) = '.PNG') then
    begin
      PNG1 := TPngImage.Create;
      PNG1.Assign(image1.Picture.Graphic);
      PNG1.SaveToStream(ms);
      FreeAndNil(PNG1);
    end
    else if (UpperCase(ExtractFileExt(lj)) = '.GIF') then
    begin
      GIF1 := TGIFImage.Create;
      GIF1.Assign(image1.Picture.Graphic);
      GIF1.SaveToStream(ms);
      FreeAndNil(GIF1);
    end
    else if (UpperCase(ExtractFileExt(lj)) = '.BMP') then
    begin
      bitmap1 := TBitmap.Create;
      bitmap1.Assign(image1.Picture.Graphic);
      bitmap1.SaveToStream(ms);
      FreeAndNil(bitmap1);
    end;

    ss := TStringStream.Create('');
    ms.Position := 0;
    EncodeStream(ms, ss); // 将内存流编码为base64字符流
    s := ss.DataString;
    ms.Free;
    ss.Free;
    image1.Free;
    Result := s;
  except
    Result := '';
  end;
end;

function TDealLockVioClass.DownloadPic: Boolean;
var
  f: String;
begin
  Result := False;
  if Length(Trim(FLockVio.xp1)) > 0 then
  begin
    f := extractfilepath(paramstr(0)) + FLockVio.sysid;
    if Pos('.', f) <= 0 then
      f := f + '.jpg';
    if not GetPic(Trim(FLockVio.FWQDZ), Trim(FLockVio.xp1), f) then
    begin
      exit;
    end;
    FLockVio.zpstr1 := BitmapToString(f);
    deletefile(f);
  end
  else
  begin
    exit;
  end;

  if Length(Trim(FLockVio.xp2)) > 0 then
  begin
    f := extractfilepath(paramstr(0)) + FLockVio.sysid;
    if Pos('.', f) <= 0 then
      f := f + '.jpg';
    if not GetPic(Trim(FLockVio.FWQDZ), Trim(FLockVio.xp2), f) then
    begin
      exit;
    end;
    FLockVio.zpstr2 := BitmapToString(f);
    deletefile(f);
  end;

  if Length(Trim(FLockVio.xp3)) > 0 then
  begin
    f := extractfilepath(paramstr(0)) + FLockVio.sysid;
    if Pos('.', f) <= 0 then
      f := f + '.jpg';
    if GetPic(Trim(FLockVio.FWQDZ), Trim(FLockVio.xp3), f) then
    begin
      exit;
    end;
    FLockVio.zpstr3 := BitmapToString(extractfilepath(paramstr(0)) +
      FLockVio.xp3);
    deletefile(f);
  end;
  Result := True;
end;

destructor TDealLockVioClass.Destroy;
begin
  if FLockVio <> nil then
    FLockVio.Free;
  inherited;
end;

function TDealLockVioClass.GetVioUploadStr: String;
begin
  Result := '{"xh":"' + FLockVio.xh + '",' + '"cjjg":"' + FLockVio.cjjg + '",' +
    '"clfl":"' + FLockVio.clfl + '",' + '"hpzl":"' + FLockVio.hpzl + '",' +
    '"hphm":"' + FLockVio.hphm + '",' + '"jdcsyr":"' + FLockVio.jdcsyr + '",' +
    '"syxz":"' + FLockVio.syxz + '",' + '"fdjh":"' + FLockVio.fdjh + '",' +
    '"clsbdh":"' + FLockVio.clsbdh + '",' + '"csys":"' + FLockVio.csys + '",' +
    '"clpp":"' + FLockVio.clpp + '",' + '"jtfs":"' + FLockVio.jtfs + '",' +
    '"fzjg":"' + FLockVio.fzjg + '",' + '"zsxzqh":"' + FLockVio.zsxzqh + '",' +
    '"zsxxdz":"' + FLockVio.zsxxdz + '",' + '"dh":"' + FLockVio.dh + '",' +
    '"lxfs":"' + FLockVio.lxfs + '",' + '"tzsh":"' + FLockVio.tzsh + '",' +
    '"tzrq":"' + FLockVio.tzrq + '",' + '"cjfs":"' + FLockVio.cjfs + '",' +
    '"wfsj":"' + FLockVio.wfsj + '",' + '"xzqh":"' + FLockVio.xzqh + '",' +
    '"wfdd":"' + FLockVio.wfdd + '",' + '"lddm":"' + FLockVio.lddm + '",' +
    '"ddms":"' + FLockVio.ddms + '",' + '"wfdz":"' + FLockVio.wfdz + '",';
  if FLockVio.cjfs = '7' then
  begin
    Result := Result + '"wfsj1":"' + FLockVio.wfsj + '",' + '"wfdd1":"' +
      FLockVio.LHY_WFDD_1 + '",' + '"lddm1":"' + FLockVio.LHY_LDDM_1 + '",' +
      '"ddms1":"' + FLockVio.LHY_DDMS_1 + '",';
  end;
  Result := Result + '"wfxw":"' + FLockVio.wfxw + '",' + '"scz":"' +
    FLockVio.scz + '",' + '"bzz":"' + FLockVio.bzz + '",' + '"zqmj":"' +
    FLockVio.zqmj + '",' + '"spdz":"http://10.43.255.10/test/test.avi",' +
    '"sbbh":"' + FLockVio.sbbh + '",' + '"zpstr1":"' + FLockVio.zpstr1 + '",' +
    '"zpstr2":"' + FLockVio.zpstr2 + '",' + '"zpstr3":"' +
    FLockVio.zpstr3 + '"}';
end;

function TDealLockVioClass.InitVio(vio: String): String;
var
  ct: String;
begin
  Result := '';
  FLockVio := (TCommon.JsonToObject(TLockVioClass, vio) as TLockVioClass);
  if FLockVio = nil then
  begin
    Result := '{"head":{"code":"0", "msg1":"传入的json字符串有误"}}';
    exit;
  end;

  // 潮州 韩江大桥
  // if FLockVio.wfdd = '60682' then
  begin
    ct := RightStr(FLockVio.wfsj, 4);
    if (not((ct >= '1100') and (ct < '1230'))) and
      (not((ct >= '0730') and (ct < '0900'))) and
      (not((ct >= '1700') and (ct < '1900'))) then
      if CheakTzcp1(FLockVio.hphm, FLockVio.hpzl, FLockVio.wfsj, FLockVio.wfdz)
      then
      begin
        Result := '{"head":{"code":"1", "msg1":"上传成功B"}}';
        exit;
      end;
  end;

  try
    if IsCZWhite(FLockVio.hphm, FLockVio.hpzl, FLockVio.wfsj) then
    begin
      Result := '{"head":{"code":"1", "msg1":"上传成功B"}}';
      exit;
    end;

    if not DownloadPic then
    begin
      Result := '{"head":{"code":"0", "msg1":"上传失败[图片下载失败]"}}';
      exit;
    end;
  except
    on e: exception do
      Result := '{"head":{"code":"0", "msg1":"上传失败[' + e.Message + ']"}}';
  end;
end;

end.
