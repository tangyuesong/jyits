unit MyImage;

interface

uses
  Winapi.Windows, System.SysUtils, Winapi.Messages, vcl.forms, System.IOUtils,
  System.Types, vcl.Dialogs, System.StrUtils, System.Classes, System.JSON,
  IdFTP, IdFTPCommon, IdGlobal, IdHTTP, IdTCPClient, uTypes;

type
  TmyImage = class
  public
    class procedure MakeFileList(Path, FileExt, szlx: string; ReadNum: Integer);
    // function MakeFileList(Path,FileExt:string;ReadNum,ilist:Integer):TStringList;
    class function GetpicCount(Path, FileExt: string): Integer;
    class function picsize(picfn: string; ics: Integer): Boolean;
    class function comjpg(picfn, savefn: string;
      iWidth, iHeight: Integer): Boolean;
    class function picdata(field: string; value: string): string;
    class function putpic(pass: TPass; path: string): Boolean;
    class procedure rltpic(const ASource: TStream; Apath: string);
    class function FileInUse(AName: string): Boolean;
    class Function GetPic(picSer, picfn, savefn: string): Boolean;
  end;

implementation

uses imageenview, imageenio, HYIEDefs;

class Function TmyImage.GetPic(picSer, picfn, savefn: string): Boolean;
var
  ms: TMemoryStream;
  host: string;
  port: string;
  user: string;
  pw: string;
  Path: string;
  iport: Integer;
  urlcn: string;
  url: String;
  IdHTTP: TIdHTTP;
  idftp1: TIdFTP;
begin
  Result := False;
  url := picSer + picfn;
  // 判断图片是否存在

  if fileexists(savefn) then
    deletefile(PWideChar(savefn));
  if UpperCase(Copy(url, 1, 3)) = 'FTP' then
  begin
    try
      Path := Copy(url, Pos('@', url) + 1, Length(url) - Pos('@', url) + 1);
      Path := Copy(Path, Pos('/', Path) + 1, Length(Path) - Pos('/', Path) + 1);
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
      idftp1.Get(Path, ms);
      FreeAndNil(idftp1);
      ms.SaveToFile(savefn);
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
    try
      // idhttp.Request.UserAgent := 'Mozilla/5.0 (compatible; MSIE 6.1; Windows NT 6.1; Maxthon)';
      try
        ms := TMemoryStream.Create;
        ms.Position := 0;
        IdHTTP := TIdHTTP.Create(nil);
        IdHTTP.HandleRedirects := True; // 必须支持重定向否则可能出错
        IdHTTP.ConnectTimeout := 3000; // 超过这个时间则不再访问
        IdHTTP.ReadTimeout := 3000; //
        urlcn := IdHTTP.url.URLEncode(url);

        IdHTTP.Get(urlcn, ms);

        ms.SaveToFile(savefn);
        Sleep(50);
      finally
        FreeAndNil(IdHTTP);
        FreeAndNil(ms);

      end;
      Result := True;
    except

      Result := False;
    end;
  end;
  TThread.Sleep(50);
end;

class function TmyImage.FileInUse(AName: string): Boolean;
var
  OldWow64RedirectionValue: LongBool;
  function DisableWowRedirection: Boolean;
  type
    TWow64DisableWow64FsRedirection = function(var Wow64FsEnableRedirection
      : LongBool): LongBool; StdCall;
  var
    hHandle: THandle;
    Wow64DisableWow64FsRedirection: TWow64DisableWow64FsRedirection;
  begin
    Result := True;
    try
      hHandle := GetModuleHandle('kernel32.dll');
      @Wow64DisableWow64FsRedirection := GetProcAddress(hHandle,
        'Wow64DisableWow64FsRedirection');
      if ((hHandle <> 0) and (@Wow64DisableWow64FsRedirection <> nil)) then
        Wow64DisableWow64FsRedirection(OldWow64RedirectionValue);
    except
      Result := False;
    end;
  end;

  function RevertWowRedirection: Boolean;
  type
    TWow64RevertWow64FsRedirection = function(var Wow64RevertWow64FsRedirection
      : LongBool): LongBool; StdCall;
  var
    hHandle: THandle;
    Wow64RevertWow64FsRedirection: TWow64RevertWow64FsRedirection;
  begin
    Result := True;
    try
      hHandle := GetModuleHandle('kernel32.dll');
      @Wow64RevertWow64FsRedirection := GetProcAddress(hHandle,
        'Wow64RevertWow64FsRedirection');
      if ((hHandle <> 0) and (@Wow64RevertWow64FsRedirection <> nil)) then
        Wow64RevertWow64FsRedirection(OldWow64RedirectionValue);
    except
      Result := False;
    end;
  end;

var
  hFileRes: HFILE;

begin
  Result := False;

  if not fileexists(AName) then
    exit;
  hFileRes := CreateFile(PChar(AName), GENERIC_READ or GENERIC_WRITE, 0, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);

  Result := hFileRes = INVALID_HANDLE_VALUE;

  if not Result then
    CloseHandle(hFileRes);

end;

// 图片压缩
class function TmyImage.comjpg(picfn, savefn: string;
  iWidth, iHeight: Integer): Boolean;
var
  imgtemp: TImageEnView;
begin
  try
    Result := False;

    imgtemp := TImageEnView.Create(nil);
    imgtemp.IO.LoadFromFileJpeg(picfn);

    if (iWidth > 0) and (iHeight > 0) then
    begin
      with imgtemp do
      begin
        Proc.ClearAllRedo;
        Proc.Resample(iWidth, iHeight, TResampleFilter(0));
        Invalidate;
        Bitmap.Modified := True;
        IO.Params.Width := IEBitmap.Width;
        IO.Params.Height := IEBitmap.Height;
        Update;
      end;
    end;

    imgtemp.IO.SaveToFileJpeg(savefn);
    FreeAndNil(imgtemp);
    Sleep(50);

    Result := True;
  except
    if Assigned(imgtemp) then
      FreeAndNil(imgtemp);
    Result := False;
  end;
end;

// 返回字段字符串
class function TmyImage.picdata(field, value: string): string;
var
  sfield: Tstrings;
  svalue: Tstrings;
  i: Integer;
  JSON: TJSONObject;
  jsonstr: string;
  sgcsj: string;
begin
  // 创建字符集
  sfield := TStringList.Create;
  svalue := TStringList.Create;
  // 过滤
  sfield.Delimiter := '_';
  svalue.Delimiter := '_';
  // 分割字段
  sfield.DelimitedText := field;
  svalue.DelimitedText := value;

  JSON := TJSONObject.Create;
  for i := 0 to sfield.Count - 1 do
  begin
    if UpperCase(sfield[i]) = 'GCSJ' then
    begin
      sgcsj := Copy(svalue[i], 1, 4) + '-' + Copy(svalue[i], 5, 2) + '-' +
        Copy(svalue[i], 7, 2) + '  ' + Copy(svalue[i], 9, 2) + ':' +
        Copy(svalue[i], 11, 2) + ':' + Copy(svalue[i], 13, 2);
      JSON.AddPair(sfield[i], sgcsj);
    end
    else
      JSON.AddPair(sfield[i], svalue[i]);
  end;
  jsonstr := JSON.ToString;

  Result := jsonstr;
  sfield.Free;
  svalue.Free;
  FreeAndNil(JSON);
end;

class function TmyImage.picsize(picfn: string; ics: Integer): Boolean;
var
  FileHandle: Integer;
begin
  Result := False;
  FileHandle := FileOpen(picfn, 0);
  if GetFileSize(FileHandle, nil) > ics then
    Result := True;
  FileClose(FileHandle);
end;

class function TmyImage.putpic(pass: TPass; path: string): Boolean;
begin
  Result := False;
  try
    if not TDirectory.Exists(path) then
      TDirectory.CreateDirectory(path);

    GetPic(pass.fwqdz, pass.tp1, path + '\' + pass.gcxh + '_1.jpg');

    if Trim(pass.tp2) <> '' then
      GetPic(pass.fwqdz, pass.tp2, path + '\' + pass.gcxh + '_2.jpg');
    if Trim(pass.tp3) <> '' then
      GetPic(pass.fwqdz, pass.tp3, path + '\' + pass.gcxh + '_3.jpg');

    Result := True;
  except
    on e: Exception do
    begin

    end;
  end;
end;

class procedure TmyImage.rltpic(const ASource: TStream; Apath: string);
begin
  //
end;

// 加载读取图片路径
class function TmyImage.GetpicCount(Path, FileExt: string): Integer;
var
  files: TStringDynArray;
  str: string;
  i: Integer;
begin
  i := 0;
  files := TDirectory.GetFiles(Path, FileExt, TSearchOption.soAllDirectories);
  for str in files do
  begin
    if (Copy(str, Length(str) - 4, 1) = '1') and (Length(Trim(str)) > 0) then
    begin
      Inc(i);

    end
  end;
  Result := i;
end;

class procedure TmyImage.MakeFileList(Path, FileExt, szlx: string;
  ReadNum: Integer);
var
  files: TStringDynArray;
  str: string;
  i: Integer;
  jpgfn: string;
begin
  i := 0;
  files := TDirectory.GetFiles(Path, FileExt, TSearchOption.soAllDirectories);
  try

    for str in files do
    begin

      if i < ReadNum then
      begin
        if (Copy(str, Length(str) - 4, 1) = '1') and (Length(Trim(str)) > 0)
        then
        begin

          begin
            { with FrmPicServer.fdmdata do begin
              Append;
              FieldByName('picfn').Value:=str;
              FieldByName('szlx').Value:=szlx;
              Post;
              end; }
          end;

          Inc(i);

        end
        else
        begin
          jpgfn := Copy(str, 1, Length(str) - 5) + '1.jpg';
          if not fileexists(jpgfn) then
            deletefile(PWideChar(str));
        end;

      end
      else
      begin
        Break;
      end;

    end;
  finally
    // FrmPicServer.fdmdata.EnableControls;
  end;

  // FrmPicServer.DecThrdpic(i);
end;

end.
