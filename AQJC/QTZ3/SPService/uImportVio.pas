unit uImportVio;

interface

uses
  IdCustomHTTPServer, uCommon, SysUtils, Vcl.Imaging.jpeg, ImageenView, Windows,
  Classes, hyieDefs, DateUtils, uGlobal, uEntity;

type

  TImportVio = Class
  private
    class function MergePic(tp1, tp2, saveTp: String): Boolean;
    class function Comjpg(sourceFile, targetFile: String): Boolean;
    class function GetNewSize(width, height: Integer): TSize;
    class procedure DecodeWfInfo(picName: String; var wfsj: String;
      var wfdd: String);
  public
    class procedure ImportVio(tokenKey, wfxw, pic1Name, pic1, pic2: String;
      AResponseInfo: TIdHTTPResponseInfo);
  end;

implementation

{ TImportVio }

class function TImportVio.Comjpg(sourceFile, targetFile: String): Boolean;
var
  imgView: TImageEnView;
  newSize: TSize;
  ms: TMemoryStream;
begin
  Result := True;
  ms := TMemoryStream.Create;
  ms.LoadFromFile(sourceFile);
  if ms.Size > 1024 * 1024 * 2 then
  begin
    imgView := TImageEnView.Create(nil);
    try
      if imgView.IO.LoadFromFileJpeg(sourceFile) then
      begin
        newSize := GetNewSize(imgView.IO.Params.width,
          imgView.IO.Params.height);
        if newSize.width < imgView.IO.Params.width then
        begin
          imgView.Proc.ClearAllRedo;
          imgView.Proc.Resample(newSize.width, newSize.height,
            TResampleFilter(0));
          imgView.Invalidate;
          imgView.Bitmap.Modified := True;
          imgView.IO.Params.width := imgView.IEBitmap.width;
          imgView.IO.Params.height := imgView.IEBitmap.height;
          imgView.Update;
        end;
        imgView.IO.SaveToFileJpeg(targetFile);
        Sleep(50);
      end;
    except
      Result := False;
    end;
    imgView.Free;
  end
  else
    CopyFile(PWideChar(sourceFile), PWideChar(targetFile), True);
  ms.Free;
end;

class procedure TImportVio.DecodeWfInfo(picName: String;
  var wfsj, wfdd: String);
var
  tmp: String;
  dt: TDateTime;
begin
  // 20170828090410_32696_123456003293696.jpg
  wfsj := '';
  wfdd := '';
  if pos('_', picName) > 0 then
  begin
    tmp := copy(picName, 1, pos('_', picName) - 1);
    if Length(tmp) <> 14 then
      exit;
    tmp := copy(tmp, 1, 4) + '-' + copy(tmp, 5, 2) + '-' + copy(tmp, 7, 2) + ' '
      + copy(tmp, 9, 2) + ':' + copy(tmp, 11, 2) + ':' + copy(tmp, 13, 2);
    dt := TCommon.StringToDT(tmp);
    if dt <> EncodeDateTime(1900, 1, 1, 1, 1, 1, 0) then
    begin
      wfsj := FormatDatetime('yyyy/mm/dd hh:nn:ss', dt);
      tmp := copy(picName, 16, Length(picName));
      if pos('_', tmp) > 0 then
      begin
        tmp := copy(tmp, pos('_', tmp) + 1, Length(tmp));
        if pos('.', tmp) > 0 then
          tmp := copy(tmp, 1, pos('.', tmp) - 1);
        if TCommon.DicDevice.ContainsKey(tmp) then
          wfdd := tmp;
      end;
    end;
  end;

  if wfsj = '' then
    wfsj := FormatDatetime('yyyy/mm/dd hh:nn:ss', Now());
  if wfdd = '' then
    wfdd := '民警抓拍';
end;

class function TImportVio.GetNewSize(width, height: Integer): TSize;
begin
  Result.width := width;
  Result.height := height;
  if width > height then
  begin
    if width > 2400 then
    begin
      Result.width := 2400;
      Result.height := round(height / width * 2400);
    end
    else if width > 1600 then
    begin
      Result.width := 1600;
      Result.height := round(height / width * 1600);
    end;
  end
  else
  begin
    if height > 2400 then
    begin
      Result.height := 2400;
      Result.width := round(width / height * 2400);
    end
    else if height > 1440 then
    begin
      Result.height := 1440;
      Result.width := round(width / height * 1440);
    end;
  end;
end;

class procedure TImportVio.ImportVio(tokenKey, wfxw, pic1Name, pic1,
  pic2: String; AResponseInfo: TIdHTTPResponseInfo);
var
  tp1, tp2, mergeTp, compTp: String;
  wfsj, wfdd, dir, fwqdz, s: String;
  b: Boolean;
begin
  b := True;
  if wfxw = '' then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('wfxw 为空');
    b := False;
  end;

  if b and (pic1 = '') then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('pic1 为空');
    b := False;
  end
  else if b and (pic1 <> '') then
  begin
    tp1 := ExtractFilePath(Paramstr(0)) + FormatDatetime('yyyymmddhhnnsszzz',
      Now()) + '1.jpg';
    if not TCommon.Base64ToFile(pic1, tp1) or not FileExists(tp1) then
    begin
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
        ('pic1保存为图片出错');
      b := False;
    end;
  end;

  mergeTp := ExtractFilePath(Paramstr(0)) + FormatDatetime('yyyymmddhhnnsszzz',
    Now()) + '3.jpg';

  if b and (pic2 <> '') then
  begin
    tp2 := ExtractFilePath(Paramstr(0)) + FormatDatetime('yyyymmddhhnnsszzz',
      Now()) + '2.jpg';
    if not TCommon.Base64ToFile(pic2, tp2) or not FileExists(tp2) then
    begin
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
        ('pic2保存为图片出错');
      b := False;
    end;
    if b and not MergePic(tp1, tp2, mergeTp) then
    begin
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('合并图片出错');
      b := False;
    end;
  end
  else if b then
    CopyFile(PWideChar(tp1), PWideChar(mergeTp), True);

  if b and not FileExists(mergeTp) then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('合并后图片不存在');
    b := False;
  end;

  compTp := FormatDatetime('yyyymmddhhnnsszzz', Now()) + '4.jpg';

  if b and (not Comjpg(mergeTp, ExtractFilePath(Paramstr(0)) + compTp) or
    not FileExists(ExtractFilePath(Paramstr(0)) + compTp)) then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('压缩图片失败');
    b := False;
  end;

  DecodeWfInfo(pic1Name, wfsj, wfdd);
  dir := 'clientvio/' + FormatDatetime('yyyymm-dd', Now()) + '/';
  fwqdz := gConfig.ImportVioHome + dir;

  if b and (pic1Name <> '') and gSQLHelper.ExistsRecord
    (CDBName + '.dbo.T_VIO_TEMP', 'bj=0 and tpxh=' + pic1Name.QuotedString) then
    gSQLHelper.ExecuteSql('update ' + CDBName +
      '.dbo.T_VIO_TEMP set bj=''4'' where bj=''0'' and tpxh=' +
      pic1Name.QuotedString);

  if b and TCommon.FtpPutFile(gConfig.ImportVioHost, gConfig.ImportVioUser,
    gConfig.ImportVioPassword, ExtractFilePath(Paramstr(0)) + compTp,
    '/' + dir + compTp, gConfig.ImportVioPort) then
  begin
    s := 'insert into ' + CDBName +
      '.dbo.T_VIO_TEMP(CJJG,WFDD,WFXW,WFSJ,FWQDZ,PHOTOFILE1,tpxh,bj,HPZL,CJR) values '
      + '(' + gTokenManager.GetToken(tokenKey).User.DWDM.QuotedString + ',' +
      wfdd.QuotedString + ',' + wfxw.QuotedString + ',' + wfsj.QuotedString +
      ',' + fwqdz.QuotedString + ',' + compTp.QuotedString + ',' +
      pic1Name.QuotedString + ',''0'',''02'',' + gTokenManager.GetToken
      (tokenKey).Login.QuotedString + ')';
    if gSQLHelper.ExecuteSql(s) then
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('数据保存失败');
  end
  else if b then
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('上传图片失败');

  TCommon.DelFile(tp1);
  TCommon.DelFile(tp2);
  TCommon.DelFile(mergeTp);
  TCommon.DelFile(ExtractFilePath(Paramstr(0)) + compTp);
end;

class function TImportVio.MergePic(tp1, tp2, saveTp: String): Boolean;
var
  jpg: TJpegImage;
  img1, img2: TImageEnView;
  w, h: Integer;
begin
  Result := True;
  try
    jpg := TJpegImage.Create;
    jpg.LoadFromFile(tp1);
    w := jpg.width;
    h := jpg.height;
    jpg.Free;

    img1 := TImageEnView.Create(nil);
    img1.IO.LoadFromFileJpeg(tp1);
    img1.Bitmap.height := h * 2;
    img1.Bitmap.width := w;
    img1.IO.Bitmap.Canvas.Draw(0, 0, img1.Bitmap);
    img2 := TImageEnView.Create(nil);
    img2.IO.LoadFromFileJpeg(tp2);
    img1.IO.Bitmap.Canvas.Draw(0, h + 1, img2.Bitmap);
    img1.IO.SaveToFileJpeg(saveTp);
    img1.Free;
    img2.Free;
  except
    Result := False;
  end;
end;

end.
