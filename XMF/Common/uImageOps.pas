unit uImageOps;

interface

uses
  Winapi.Windows, System.SysUtils, Winapi.Messages, vcl.forms, System.IOUtils,
  System.Types, vcl.Dialogs, System.StrUtils, System.Classes, System.JSON,
  uGlobal;

type
  TImageOps = class
  private
    class function GetNewSize(width, height: integer): TSize; static;
  public
    class function GetPictureSize(picfn: string): integer;
    class function GetFileTime(sFileName: string): TDateTime;
    class function Comjpg(sPath, tPath: string): Boolean;
  end;

implementation

uses
  imageenview, imageenio, HYIEDefs;

// Í¼Æ¬Ñ¹Ëõ
class function TImageOps.Comjpg(sPath, tPath: string): Boolean;
var
  imgtemp: TImageEnView;
  newSize: TSize;
begin
  Result := False;
  imgtemp := TImageEnView.Create(nil);
  try
    if imgtemp.IO.LoadFromFileJpeg(sPath) then
    begin
      newSize := GetNewSize(imgtemp.IO.Params.width, imgtemp.IO.Params.height);
      if newSize.width < imgtemp.IO.Params.width then
      begin
        imgtemp.Proc.ClearAllRedo;
        imgtemp.Proc.Resample(newSize.width, newSize.height,
          TResampleFilter(0));
        imgtemp.Invalidate;
        imgtemp.Bitmap.Modified := true;
        imgtemp.IO.Params.width := imgtemp.IEBitmap.width;
        imgtemp.IO.Params.height := imgtemp.IEBitmap.height;
        imgtemp.Update;
      end;

      imgtemp.IO.SaveToFileJpeg(tPath);
      Sleep(50);
      Result := true;
    end;
  except
    on e: exception do
      logger.Error('ComJPG:' + e.Message + sPath);
  end;
  FreeAndNil(imgtemp);
end;

class function TImageOps.GetNewSize(width, height: integer): TSize;
begin
  result.Width := width;
  result.Height := height;
  if width > height then
  begin
    if width > 2400 then
    begin
      result.Width := 2400;
      result.Height := round(height/width * 2400);
    end
    else if width > 1600 then
    begin
      result.Width := 1600;
      result.Height := round(height/width * 1600);
    end;
  end
  else begin
    if Height > 2400 then
    begin
      result.Height := 2400;
      result.width := round(width/height * 2400);
    end
    else if Height > 1440 then
    begin
      result.Height := 1440;
      result.width := round(width/height * 1440);
    end;
  end;
end;

class function TImageOps.GetPictureSize(picfn: string): integer;
var
  FileHandle: integer;
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

class function TImageOps.GetFileTime(sFileName: string): TDateTime;
var
  ffd: TWin32FindData;
  dft: DWord;
  lft, Time: TFileTime;
  H: THandle;
begin
  H := Winapi.Windows.FindFirstFile(PChar(sFileName), ffd);
  if (H <> INVALID_HANDLE_VALUE) then
  begin
    Time := ffd.ftLastWriteTime;
    // Time:=ffd.ftCreationTime;
    // Time:=ffd.ftLastAccessTime;
    Winapi.Windows.FindClose(H);
    FileTimeToLocalFileTime(Time, lft);
    FileTimeToDosDateTime(lft, LongRec(dft).Hi, LongRec(dft).Lo);
    Result := FileDateToDateTime(dft);
  end
  else
    Result := 0;
end;

end.
