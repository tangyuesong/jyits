unit uCommon;

interface

uses
  uEntity, uJsonUtils, uRequestItf, SysUtils, FireDAC.Comp.Client, System.Rtti,
  Data.DB, ImageEnView, idftp, idhttp, idFtpCommon, ADODB, IdGlobal, Classes,
  uDictionary, uSetup, uGlobal, ULookUpDataSource, Winapi.Winsock, Windows,
  CxGrid, cxGridExportLink, Variants, ComObj, System.Generics.Collections,
  System.DateUtils, uLogger, uRegisterFrame, System.IOUtils, uUserPower,
  Vcl.Graphics;

type
  TCommon = Class
  private
    class function FtpGetFile(AHost, AUser, APwd, ASourceFile,
      ADestFile: string; APort: Integer; RetrieveTime: Integer = 3): boolean;
  public
    class procedure AppInitialization();
    class procedure AppFinalization();
    class procedure InitSetup();
    class function GetDrvInfo(sfzhm: String): TDrvInfo;
    class function GetVehinfo(hphm, hpzl, dabh: String): TVehInfo;
    class function GetClientAddr: string;
    class procedure ExportGridtoData(SExt, sPath: string; CxGrid: Tcxgrid);
    class procedure showVideo(input: string; idx, w, h: Integer;
      imgview: TImageEnView);
    class function Getpic(img: TImageEnView; fn: string): boolean; overload;
    class function Getpic(picSer, picfn, savefn: String): boolean; overload;
    class function Getpic(picSer, picfn: String): TMemoryStream; overload;
    class function FtpPutFile(AHost, AUser, Apw, ASourceFile, ADestFile: string;
      APort: Integer): boolean; static;
    class function FtpDelFile(AHost, AUser, Apw, AFilename: string;
      APort: Integer): boolean;
    class procedure Import(sourceFile: string; ATable: TFDMemTable);
    class function ImportExcel(fileName: string; ATable: TFDMemTable;
      extFields: string = ''): string; static;
    class function GetLocalVeh(hphm, hpzl: string): TVehInfo;
    class function GetVioByVeh(hphm, hpzl: string; clbj: String = '0';
      xh: string = ''): TList<TVioInfoSrl>;
    class function GetVio(jdsbh, wfbh, jszh, dabh, jkbj: String)
      : TList<TVioClass>;
    class function GetVioPicinfo(xh: String): string; static;
    class function GetDatetimeFormat: TFormatSettings;
    class function StringToDT(s: String): TDatetime;
    class function GetXZQH(dwdm: String): string;
    class procedure WriteUserHabit(moduleName: String);
    class function GetPictureSize(picfn: string): Integer;
    class function GetPicVehInfo(url: String): TDFVehInfo;
    class function GetHPYS(hpzl: string): TColor; static;
    class function GetJYW(wsbh: string): string; static;
    class function IsJpgFile(fileName: String): boolean; static;
  end;

  TEditStatus = (esNew, esModify, esApprove, escancel);
  TQZTXX = (esRY, esSP, esSB);

implementation

uses
  dxFrame, dxFrames, Soap.EncdDecd;

class function TCommon.GetPicVehInfo(url: String): TDFVehInfo;
var
  s: String;
  ls: TList<TDFVehInfo>;
  veh: TDFVehInfo;
begin
  s := TRequestItf.DbQuery('AnalysisOnePic', 'url=' + EncodeString(url));
  if s <> '' then
  begin
    ls := TJsonUtils.JsonToRecordList<TDFVehInfo>(s);
    if ls.Count > 0 then
      Result := ls[0];
    for veh in ls do
    begin
      if veh.PlateNum = '车牌' then
        continue
      else
      begin
        Result := veh;
        break;
      end;
    end;
  end;
end;

class function TCommon.GetPictureSize(picfn: string): Integer;
var
  FileHandle: Integer;
begin
  Result := 0;
  try
    FileHandle := FileOpen(picfn, 0);
    Result := GetFileSize(FileHandle, nil);
    FileClose(FileHandle);
  except
    on e: exception do
      logger.Error('GetPictureSize: ' + e.Message + picfn);
  end;
end;

class function TCommon.StringToDT(s: String): TDatetime;
var
  y, m, d, h, n, ss: word;
begin
  try
    s := Trim(s);
    if pos('.', s) > 0 then
      s := copy(s, 1, pos('.', s) - 1);

    if pos('/', s) > 1 then
    begin
      y := StrToInt(copy(s, 1, pos('/', s) - 1));
      s := Trim(copy(s, pos('/', s) + 1, Length(s)));
      m := StrToInt(copy(s, 1, pos('/', s) - 1));
      s := Trim(copy(s, pos('/', s) + 1, Length(s)));
    end
    else if pos('-', s) > 1 then
    begin
      y := StrToInt(copy(s, 1, pos('-', s) - 1));
      s := Trim(copy(s, pos('-', s) + 1, Length(s)));
      m := StrToInt(copy(s, 1, pos('-', s) - 1));
      s := Trim(copy(s, pos('-', s) + 1, Length(s)));
    end;
    d := StrToInt(copy(s, 1, pos(' ', s) - 1));
    s := Trim(copy(s, pos(' ', s) + 1, Length(s)));
    h := StrToInt(copy(s, 1, pos(':', s) - 1));
    s := Trim(copy(s, pos(':', s) + 1, Length(s)));
    n := StrToInt(copy(s, 1, pos(':', s) - 1));
    ss := StrToInt(Trim(copy(s, pos(':', s) + 1, Length(s))));

    Result := EncodeDateTime(y, m, d, h, n, ss, 0);
  except
    Result := EncodeDateTime(1900, 1, 1, 1, 1, 1, 0);
  end;
end;

class procedure TCommon.WriteUserHabit(moduleName: String);
begin
  TRequestItf.DbQuery('WriteUserHabit', 'YHBH=' + gUser.yhbh + '&MODULE=' +
    moduleName);
end;

class function TCommon.GetDatetimeFormat: TFormatSettings;
begin
  Result.DateSeparator := '/';
  Result.TimeSeparator := ':';
  Result.ShortDateFormat := 'yyyy/mm/dd';
  Result.ShortTimeFormat := 'hh:nn:ss';
end;

class function TCommon.GetVio(jdsbh, wfbh, jszh, dabh, jkbj: String)
  : TList<TVioClass>;
var
  WSResult: String;
  i, j: Integer;
  code, rownum, s, param: String;
begin
  Result := TList<TVioClass>.Create;
  if jdsbh <> '' then
    param := 'jdsbh=' + jdsbh;
  if wfbh <> '' then
    param := 'wfbh=' + wfbh;
  if jszh <> '' then
    param := 'jszh=' + jszh;
  if dabh <> '' then
    param := 'dabh=' + dabh;
  if jkbj <> '' then
    param := param + '&jkbj=' + jkbj;
  WSResult := TRequestItf.RmQuery('GetVioInfoByDrv', param);
  WSResult := StringReplace(WSResult, '', '', [rfReplaceAll]);
  // 解决六合一系统中非法字符问题
  TJsonUtils.DecodeRmResultHead(WSResult, code, rownum);
  if (code <> '1') or (rownum = '0') then
    exit;

  if pos('"body":{', WSResult) > 0 then
    WSResult := copy(WSResult, pos('"body":{', WSResult) + 8, Length(WSResult))
  else
    exit;

  for i := 0 to StrToInt(rownum) - 1 do
  begin
    if (pos('{', WSResult) > 0) and (pos('"}', WSResult) > 0) then
    begin
      s := copy(WSResult, pos('{', WSResult) + 1, pos('"}', WSResult) - pos('{',
        WSResult));
      WSResult := copy(WSResult, pos('"}', WSResult) + 2, Length(WSResult));
    end
    else
      break;

    s := s.Replace('{', '(').Replace('}', ')');

    s := '[{' + s + '}]';
    Result.Add(TJsonUtils.JsonToRecord<TVioClass>(s));
  end;
end;

class function TCommon.GetVioByVeh(hphm, hpzl, clbj, xh: String)
  : TList<TVioInfoSrl>;
var
  i: Integer;
  s, viostr, param, code, rownum: string;
  vio: TVioInfoSrl;
begin
  Result := nil;
  if hphm <> '' then
  begin
    param := 'hphm=' + hphm + '&hpzl=' + hpzl;
  end;
  if xh <> '' then
    param := 'xh=' + xh;
  if clbj <> '' then
    param := param + '&clbj=' + clbj;
  s := TRequestItf.RmQuery('GetVioInfoByVeh', param);
  TJsonUtils.DecodeRmResultHead(s, code, rownum);
  if (code <> '1') or (rownum = '0') then
    exit;

  if pos('"body":{', s) > 0 then
    s := copy(s, pos('"body":{', s) + 8, Length(s))
  else
    exit;

  Result := TList<TVioInfoSrl>.Create;

  for i := 0 to StrToInt(rownum) - 1 do
  begin
    if (pos('{', s) > 0) and (pos('}', s) > 0) then
    begin
      viostr := copy(s, pos('{', s) + 1, pos('}', s) - pos('{', s) - 1);
      s := copy(s, pos('}', s) + 1, Length(s));
    end
    else
      break;

    viostr := '[{' + viostr + '}]';
    vio := TJsonUtils.JsonToRecord<TVioInfoSrl>(viostr);
    Result.Add(vio);
  end;
end;

class function TCommon.GetXZQH(dwdm: String): string;
begin
  if TLZDictionary.gDicDept.ContainsKey(dwdm) then
  begin
    if TLZDictionary.gDicDept[dwdm].DWJB = '2' then
      Result := copy(dwdm, 1, 2)
    else if TLZDictionary.gDicDept[dwdm].DWJB = '3' then
      Result := copy(dwdm, 1, 4)
    else if TLZDictionary.gDicDept[dwdm].DWJB = '4' then
      Result := copy(dwdm, 1, 6)
    else if TLZDictionary.gDicDept[dwdm].DWJB = '5' then
      Result := dwdm;
  end
  else
    Result := dwdm;
end;

class function TCommon.FtpPutFile(AHost, AUser, Apw, ASourceFile,
  ADestFile: string; APort: Integer): boolean;
  function ChangeDir(ftp: TIdFTP; ADir: string): boolean;
  begin
    Result := false;
    try
      ftp.ChangeDir(ADir);
      Result := True;
    except
      on e: exception do
      begin
        // if e.message.contains('No such file or directory') then // DONE: 待确认
        begin
          ftp.MakeDir(ADir);
          ftp.ChangeDir(ADir);
          Result := True;
        end;
      end;
    end;
  end;

var
  ftp: TIdFTP;
  ss: TArray<string>;
  i, n: Integer;
begin
  // 创建Ftp
  try
    ftp := TIdFTP.Create(nil);
    ftp.ConnectTimeout := 3000;
    ftp.ReadTimeout := 3000;
    ftp.host := AHost;
    ftp.port := APort;
    ftp.Username := AUser;
    ftp.Password := Apw;
    ftp.Connect;
    // ShowMessage(ftplist.port);
    ftp.TransferType := ftBinary;
    ftp.IOHandler.DefStringEncoding := IndyTextEncoding(tencoding.Default);

    ss := ADestFile.Split(['/']);
    n := Length(ss);
    for i := 0 to n - 2 do
    begin
      ChangeDir(ftp, ss[i]);
    end;
    ftp.Passive := True; // 这里分为主动和被动
    ftp.Noop;
    ftp.Put(ASourceFile, ss[n - 1], false);
    ftp.Free;
    Result := True;
  except
    Result := false;
  end;
end;

class function TCommon.FtpDelFile(AHost, AUser, Apw, AFilename: string;
  APort: Integer): boolean;
var
  ftp: TIdFTP;
  n: Integer;
begin
  Result := false;
  try
    ftp := TIdFTP.Create(nil);
    ftp.ConnectTimeout := 3000;
    ftp.ReadTimeout := 3000;
    ftp.host := AHost;
    ftp.port := APort;
    ftp.Username := AUser;
    ftp.Password := Apw;
    ftp.Connect;
    n := 0;
    while n < 3 do
    begin
      if ftp.Connected then
      begin
        try
          ftp.Delete(AFilename);
          Result := True;
          break;
        except
        end;
      end;
      Inc(n);
      Sleep(1000);
    end;
    ftp.Disconnect;
    ftp.Free;
  except
    Result := false;
  end;
end;

class function TCommon.FtpGetFile(AHost, AUser, APwd, ASourceFile,
  ADestFile: string; APort: Integer; RetrieveTime: Integer = 3): boolean;
var
  BytesToTransfer, BytesTransfered: Int64;
  stream: TStream;
  i: Integer;
  ftp: TIdFTP;
begin
  Result := false;
  ftp := TIdFTP.Create(nil);
  ftp.ConnectTimeout := 3000;
  ftp.ReadTimeout := 3000;

  ftp.host := AHost;
  ftp.Username := AUser;
  ftp.Password := APwd;
  ftp.port := APort;

  ftp.TransferType := ftBinary;

  i := 0;

  if FileExists(ADestFile) then
  begin
    Sleep(3000);
    stream := TFileStream.Create(ADestFile, fmOpenWrite)
  end
  else
    stream := TFileStream.Create(ADestFile, fmCreate);

  while i < RetrieveTime do
  begin
    if not ftp.Connected then
    begin
      try
        ftp.Connect;
        ftp.Get(ASourceFile, stream);
        Result := True;
        break;
      except
        on e: exception do
        begin
          Inc(i);
          stream.Position := 0;
          Sleep(5000);
          continue;
        end;
      end;
    end;
  end;
  stream.Free;
  ftp.Free;
  Result := FileExists(ADestFile);
end;

class function TCommon.Getpic(picSer, picfn, savefn: String): boolean;
var
  ms: TMemoryStream;
  host, port, user, pw, path, urlcn, url: string;
  idhttp: TIdHTTP;
  idftp1: TIdFTP;
begin
  Result := false;
  url := picSer + picfn;
  if FileExists(savefn) then
    deletefile(PWideChar(savefn));

  if UpperCase(copy(url, 1, 3)) = 'FTP' then
  begin
    try
      path := copy(url, pos('@', url) + 1, Length(url) - pos('@', url) + 1);
      path := copy(path, pos('/', path), Length(path));
      host := copy(url, pos('@', url) + 1, Length(url) - pos('@', url) + 1);
      host := copy(host, 1, pos('/', host) - 1);
      if pos(':', host) > 0 then
      begin
        port := copy(host, pos(':', host) + 1, 100);
        host := copy(host, 1, pos(':', host) - 1);
      end
      else
        port := '21';
      user := copy(url, 7, Length(url) - 6);
      user := copy(user, 1, pos(':', user) - 1);
      pw := copy(url, 7, Length(url) - 6);
      pw := copy(pw, pos(':', pw) + 1, Length(pw) - pos(':', pw) + 1);
      pw := copy(pw, 1, pos('@', pw) - 1);
      Result := FtpGetFile(host, user, pw, path, savefn, StrToIntDef(port, 21));
    except
      FreeAndNil(idftp1);
      FreeAndNil(ms);

    end;
  end
  else if UpperCase(copy(url, 1, 4)) = 'HTTP' then
  begin
    try
      try
        ms := TMemoryStream.Create;
        ms.Position := 0;
        idhttp := TIdHTTP.Create(nil);
        idhttp.HandleRedirects := True; // 必须支持重定向否则可能出错
        idhttp.ConnectTimeout := 3000; // 超过这个时间则不再访问
        idhttp.ReadTimeout := 3000; //
        urlcn := idhttp.url.URLEncode(url);
        idhttp.Get(urlcn, ms);
        if ms.Size > 0 then
        begin
          ms.SaveToFile(savefn);
          Result := True;
        end;
      finally
        FreeAndNil(idhttp);
        FreeAndNil(ms);
      end;
    except

    end;
  end;
  TThread.Sleep(50);
end;

class function TCommon.Getpic(img: TImageEnView; fn: string): boolean;
begin
  try
    if FileExists(gSetup.DirSave + '\' + fn) then
      deletefile(PWideChar(gSetup.DirSave + '\' + fn));
    img.IO.DShowParams.GetSample(img.IEBitmap);
    img.IO.SaveToFileJpeg(gSetup.DirSave + '\' + fn);
    img.Update;
    Result := True;
    if TCommon.GetPictureSize(gSetup.DirSave + '\' + fn) < 50 * 1024 then
    begin
      deletefile(PWideChar(gSetup.DirSave + '\' + fn));
      Result := false;
    end;
  except
    Result := True;
  end;
end;

class function TCommon.Getpic(picSer, picfn: String): TMemoryStream;
var
  host, port, user, pw, path, urlcn, url: string;
  idhttp: TIdHTTP;
  idftp1: TIdFTP;
  savefn: String;
begin
  Result := TMemoryStream.Create;
  url := picSer + picfn;

  if UpperCase(copy(url, 1, 3)) = 'FTP' then
  begin
    try
      savefn := gSetup.DirSave + formatDatetime('yyyymmddhhnnsszzz', Now());
      path := copy(url, pos('@', url) + 1, Length(url) - pos('@', url) + 1);
      path := copy(path, pos('/', path), Length(path));
      host := copy(url, pos('@', url) + 1, Length(url) - pos('@', url) + 1);
      host := copy(host, 1, pos('/', host) - 1);
      if pos(':', host) > 0 then
      begin
        port := copy(host, pos(':', host) + 1, 100);
        host := copy(host, 1, pos(':', host) - 1);
      end
      else
        port := '21';
      user := copy(url, 7, Length(url) - 6);
      user := copy(user, 1, pos(':', user) - 1);
      pw := copy(url, 7, Length(url) - 6);
      pw := copy(pw, pos(':', pw) + 1, Length(pw) - pos(':', pw) + 1);
      pw := copy(pw, 1, pos('@', pw) - 1);
      if FtpGetFile(host, user, pw, path, savefn, StrToIntDef(port, 21)) then
      begin
        Result.Position := 0;
        Result.LoadFromFile(savefn);
      end;
    except
      FreeAndNil(idftp1);
    end;
  end
  else if UpperCase(copy(url, 1, 4)) = 'HTTP' then
  begin
    try
      Result.Position := 0;
      idhttp := TIdHTTP.Create(nil);
      idhttp.HandleRedirects := True; // 必须支持重定向否则可能出错
      idhttp.ConnectTimeout := 3000; // 超过这个时间则不再访问
      idhttp.ReadTimeout := 3000; //
      urlcn := idhttp.url.URLEncode(url);
      idhttp.Get(urlcn, Result);
    finally
      FreeAndNil(idhttp);
    end;
  end;
  TThread.Sleep(50);
end;

class procedure TCommon.ExportGridtoData(SExt, sPath: string; CxGrid: Tcxgrid);
begin
  if ExtractFileExt(SExt) = '.xls' then
    ExportGridToExcel(sPath, CxGrid, True, True);
  if ExtractFileExt(SExt) = '.html' then
    ExportGridToHTML(sPath, CxGrid, True, True);
  if ExtractFileExt(SExt) = '.xml' then
    ExportGridToXML(sPath, CxGrid, True, True);
  if ExtractFileExt(SExt) = '.csv' then
    ExportGridToCSV(sPath, CxGrid, True, True);
  if ExtractFileExt(SExt) = '.txt' then
    ExportGridToText(sPath, CxGrid, True, True);
  if ExtractFileExt(SExt) = '.xlsx' then
    ExportGridToXLSX(sPath, CxGrid, True, True);
end;

class function TCommon.GetClientAddr: string;
var
  wVersionRequested: word;
  wsaData: TWSAData;
  p: PHostEnt;
  s: array [0 .. 128] of ansichar;
  p2: pansichar;
  OutPut: array [0 .. 100] of ansichar;
begin
  wVersionRequested := MAKEWORD(1, 1);
  WSAStartup(wVersionRequested, wsaData);

  GetHostName(@s, 128);
  p := GetHostByName(s);

  p2 := iNet_ntoa((PInAddr(p^.h_addr_list^))^);
  StrPCopy(OutPut, Format('%s', [p2]));
  WSACleanup;
  Result := OutPut;
end;

class function TCommon.GetDrvInfo(sfzhm: String): TDrvInfo;
var
  s, head, code, rownum: string;
begin
  s := TRequestItf.RmQuery('GetDrvInfo', 'SFZMHM=' + sfzhm);
  TJsonUtils.DecodeRmResultHead(s, code, rownum);

  if (code <> '1') or (rownum = '0') then
  begin
    exit;
  end;

  if pos('"body":{', s) > 0 then
  begin
    s := copy(s, pos('"body":{', s) + 8, Length(s));
    s := copy(s, pos('{', s), Length(s));
    s := copy(s, 1, pos('}', s));
  end
  else
    exit;
  s := '[' + s + ']';
  Result := TJsonUtils.JsonToRecord<TDrvInfo>(s);
end;

class function TCommon.GetVioPicinfo(xh: String): string;
  function SaveToFile(base64Str: string): string;
  var
    bytes: TBytes;
    ms: TFileStream;
    tmpFile: string;
  begin
    inherited;
    Result := '';
    if base64Str <> '' then
    begin
      tmpFile := gSetup.DirSave + 'tmpFile.jpg';
      try
        bytes := DecodeBase64(base64Str);
        ms := TFileStream.Create(tmpFile, fmCreate);
        ms.Write(bytes, Length(bytes));
        ms.Free;
        Result := tmpFile;
      finally

      end;
    end;
  end;

var
  s, head, code, rownum: string;
begin
  Result := '';
  s := TRequestItf.RmQuery('GetVioPicinfo', 'xh=' + xh);
  TJsonUtils.DecodeRmResultHead(s, code, rownum);

  if (code <> '1') or (rownum = '0') then
  begin
    exit;
  end;

  if pos('"zpstr1":"', s) > 0 then
  begin
    s := copy(s, pos('"zpstr1":"', s) + 10, Length(s));
    s := copy(s, 1, pos('"', s));
    Result := SaveToFile(s);
  end;
end;

class function TCommon.GetLocalVeh(hphm, hpzl: string): TVehInfo;
var
  json: string;
begin
  if hpzl <> '' then
    json := TRequestItf.DbQuery('GetT_VIO_VEHICLE',
      'hphm=' + hphm + '&hpzl=' + hpzl)
  else
    json := TRequestItf.DbQuery('GetT_VIO_VEHICLE', 'hphm=' + hphm);
  Result := TJsonUtils.JsonToRecord<TVehInfo>(json);
end;

class function TCommon.GetVehinfo(hphm, hpzl, dabh: String): TVehInfo;
var
  veh: TVehInfo;
  s, code, rownum: string;
  r: TVehInfo;
begin
  Result := r;
  if (Length(hphm) < 6) or (Length(hpzl) < 2) then
    exit;

  s := TRequestItf.RmQuery('GetVehInfo', 'HPHM=' + hphm + '&HPZL=' + hpzl +
    '&DABH=' + dabh);
  TJsonUtils.DecodeRmResultHead(s, code, rownum);

  if (code <> '1') or (rownum = '0') then
  begin

    exit;
  end;

  if pos('"body":{', s) > 0 then
  begin
    s := copy(s, pos('"body":{', s) + 8, Length(s));
    s := copy(s, pos('{', s), Length(s));
    s := copy(s, 1, pos('}', s));
  end
  else
    exit;

  s := '[' + s + ']';

  Result := TJsonUtils.JsonToRecord<TVehInfo>(s);
  Result.code := code;
  Result.rownum := rownum;

  if Trim(Result.zsxxdz) = '' then
    Result.zsxxdz := '空';
  if Trim(Result.zzxxdz) = '' then
    Result.zzxxdz := '空';

  if (Result.zsxxdz = '空') or (Result.zzxxdz = '空') then
  begin
    veh := TJsonUtils.JsonToRecord<TVehInfo>
      (TRequestItf.DbQuery('GetT_VIO_VEHICLE',
      'hphm=' + hphm + '&hpzl=' + hpzl));
    if Length(veh.zsxxdz) > 0 then
    begin
      Result.zsxxdz := veh.zsxxdz;
      Result.zzxxdz := veh.zsxxdz;
    end;
  end;
end;

class function TCommon.GetHPYS(hpzl: string): TColor;
begin
  if hpzl = '02' then
    Result := clblue
  else if hpzl = '06' then
    Result := clGray
  else if (hpzl = '23') or (hpzl = '24') then
    Result := clWhite
  else
    Result := clWebOrange;
end;

class function TCommon.GetJYW(wsbh: string): string;
var
  i, k, n: Integer;
begin
  Result := '';
  if wsbh.Length = 15 then
  begin
    n := 0;
    for i := 8 to 15 do
    begin
      k := StrToIntDef(wsbh[i], -1);
      if k = -1 then
        exit;
      n := n + k;
    end;
    n := n mod 8;
    Result := n.ToString;
  end;
end;

class procedure TCommon.showVideo(input: string; idx, w, h: Integer;
  imgview: TImageEnView);
begin
  if (not imgview.IO.DShowParams.Connected) then
  begin

    imgview.IO.DShowParams.SetVideoInput(idx, StrToIntDef(input, 0),
      // set this parameter if you have more than one camera with same name
      w, // capture width
      h, // capture height
      '' // format
      );
    // enable frame grabbing
    imgview.IO.DShowParams.EnableSampleGrabber := True;
    // connect to the video input
    imgview.IO.DShowParams.Connect;
  end;
  imgview.IO.DShowParams.Run;
end;

class procedure TCommon.Import(sourceFile: string; ATable: TFDMemTable);
  procedure ADODataSetToMemTable(ds: TADODataSet; ATable: TFDMemTable);
  var
    f: TField;
  begin
    for f in ds.Fields do
    begin
      ATable.FieldDefs.Add(f.FieldName, f.DataType, f.DataSize, false);
    end;
    while not ds.Eof do
    begin
      for f in ds.Fields do
      begin
        ATable.FieldByName(f.FieldName).Value := f.Value;
      end;

      ds.Next;
    end;
  end;

var
  con: TADOConnection;
  ds: TADODataSet;
  ext: string;
  semc: TStrings;
begin
  con := TADOConnection.Create(nil);
  ds := TADODataSet.Create(nil);
  ds.Connection := con;
  ds.DisableControls;
  ext := ExtractFileExt(sourceFile).ToLower;
  if (ext = '.txt') or (ext = '.csv') then
  begin
    ds.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Mode=Share Deny None;' +
      'Extended Properties=text;' + 'Persist Security Info=False;Data Source=' +
      ExtractFilePath(sourceFile);
    con.Connected := True;
    ds.CommandText := 'select * from ' + extractfilename(sourceFile);
    ds.open;
  end
  else if (ext = '.xls') or (ext = '.xlsx') then
  begin
    semc := TStringList.Create;
    con.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;Extended Properties=Excel 8.0;' +
      'Persist Security Info=True;Data Source=' + sourceFile;
    con.GetTableNames(semc, false);
    ds.CommandText := 'select * from [' + semc[0] + ']';
    ds.open;
    semc.Free;
  end
  else if (ext = '.mdb') then
  begin
    semc := TStringList.Create;
    con.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;' +
      'Data Source=' + sourceFile;
    con.Connected := True;
    con.GetTableNames(semc, false);
    ds.CommandText := 'select * from [' + semc[0] + ']';
    ds.open;
    semc.Free;
  end
  else
  begin
    exit;
  end;
  ADODataSetToMemTable(ds, ATable);
end;

class function TCommon.ImportExcel(fileName: string; ATable: TFDMemTable;
  extFields: string = ''): string;
var
  MsExcel, WBook, WSheet: OLEVARIANT;
  row, col, i, j, colTrue: Integer;
  s, Fields: string;
begin
  Result := '';
  try
    MsExcel := CreateOleObject('Excel.Application');
    WBook := MsExcel.Application;
    WBook.workbooks.open(fileName);
    WBook.Visible := false;
    WSheet := WBook.worksheets[1];
    row := WSheet.UsedRange.Rows.Count; // 行
    col := WSheet.UsedRange.columns.Count; // 列
    ATable.Close;
    ATable.FieldDefs.Clear;
    ATable.DisableControls;
    for i := 1 to col do
    begin
      s := WSheet.Cells[1, i];
      if s <> '' then
      begin
        ATable.FieldDefs.Add(s, ftString, 255, false);
        Fields := Fields + ',' + s;
        colTrue := i;
      end
      else
      begin
        break;
      end;
    end;
    if extFields <> '' then
    begin
      for s in extFields.Split([',']) do
      begin
        ATable.FieldDefs.Add(s, ftString, 255, false);
      end;
      Fields := Fields + ',' + s;
    end;
    ATable.open;
    for i := 2 to row do
    begin
      s := WSheet.Cells[i, 1];
      if s = '' then
        break;
      ATable.Append;
      ATable.Edit;
      for j := 1 to colTrue do
      begin
        s := WSheet.Cells[i, j];
        ATable.Fields[j - 1].Value := s;
      end;
      ATable.Post;
    end;
    WBook.workbooks.Close;
    ATable.First;
    ATable.EnableControls;
    Result := Fields.Substring(1);
  except
    on e: exception do
      gLogger.Error('[TCommon.ImportExcel]' + e.Message);
  end;
end;

class procedure TCommon.InitSetup;
begin
  gHaveK08 := TRequestItf.DbQuery('GetS_AppSetup', 'KeyName=K08&Value=1') <> '';
end;

class procedure TCommon.AppInitialization;
begin
  gLogger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'its.log');
  gSetup := TLZsetup.SysSetup;
  gClientIP := TCommon.GetClientAddr;
  TRegisterFrame.RegisterFrames();
  if not DirectoryExists(gSetup.DirSave) then
    ForceDirectories(gSetup.DirSave);
  gUserPower := TUserPower.Create;
end;

class procedure TCommon.AppFinalization;
begin
  if gLogger <> nil then
    gLogger.Free;
  if gUserPower <> nil then
    gUserPower.Free;
  if DirectoryExists(gSetup.DirSave) then
    TDirectory.Delete(gSetup.DirSave, True);
end;

class function TCommon.IsJpgFile(fileName: String): boolean;
const
  RightBuf: array [0 .. 3] of Byte = ($FF, $D8, $FF, $D9);
var
  Buf: array [0 .. 3] of Byte;
begin
  FillChar(Buf, 4, 0);
  with TFileStream.Create(fileName, 0) do
  begin
    Position := 0;
    ReadBuffer(Buf[0], 2);
    Position := Size - 2;
    ReadBuffer(Buf[2], 2);
    Free;
  end;
  Result := CompareMem(@RightBuf[0], @Buf[0], 4);
end;

end.
