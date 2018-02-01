unit uFrameSPDR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxImage, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Udictionary, System.IOUtils, uGlobal,
  System.Types, DateUtils,
  Vcl.Imaging.jpeg, ImageenView, QBAES, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxProgressBar,
  uRequestItf, uCommon, cxRadioGroup, acPNG, System.Actions, Vcl.ActnList,
  cxEditRepositoryItems, uEntity, HYIEDefs, uJsonUtils;

type
  TframeSPDR = class(TdxFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    btnSave: TcxButton;
    imgInfo: TcxImage;
    edtDir: TsDirectoryEdit;
    cxGrid1: TcxGrid;
    GridView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cbbWfdd: TcxComboBox;
    cbbWfxw: TcxComboBox;
    dxLayoutGroup3: TdxLayoutGroup;
    GridViewColumn1: TcxGridDBColumn;
    tbPic: TFDMemTable;
    DataSource1: TDataSource;
    liPb: TdxLayoutItem;
    pb: TcxProgressBar;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem8: TdxLayoutItem;
    rbOne: TcxRadioButton;
    rbMore: TcxRadioButton;
    cxdtrpstry1: TcxEditRepository;
    cxdtrpstry1HyperLinkItem1: TcxEditRepositoryHyperLinkItem;
    cxdtrpstry1SparklineItem1: TcxEditRepositorySparklineItem;
    cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem;
    actlst1: TActionList;
    actnew: TAction;
    actedit: TAction;
    actdelete: TAction;
    actView: TAction;
    GridViewColumn2: TcxGridDBColumn;
    tb: TFDMemTable;
    procedure AfterConstruction; override;
    procedure edtDirAfterDialog(Sender: TObject; var Name: string;
      var Action: Boolean);
    procedure tbPicAfterScroll(DataSet: TDataSet);
    procedure btnSaveClick(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
  private
    FIsRunUpload: Boolean;
    FPicTmpPath1: String;
    FPicTmpPath2: String;
    FPicPath: string;
    function MergePic(picfn1, picfn2: string; q: Integer; sl: Integer;
      fwm: string): string;
    function AddText(ImageEnView1: TImageEnView; txt: string): Boolean;
    procedure FillDataTable();
    function Comjpg(sPath, tPath: string): Boolean;
    function GetNewSize(width, height: Integer): TSize;
    procedure BmpToJpg(bmpPic, jpgPic: String);
    procedure CompJpgs();
    procedure BmpToJpgs(path: String);
    procedure MergePics();
    procedure DecodeWfInfo(picName: String; var wfsj: String; var wfdd: String);
    procedure CreateTmpPath();
    function GetSystemID(bj, tpxh: String): String;
  public
    { Public declarations }
  end;

var
  frameSPDR: TframeSPDR;

implementation

{$R *.dfm}
{ TframeSPDR }

{ TframeSPDR }

procedure TframeSPDR.AfterConstruction;
begin
  inherited;
  FPicTmpPath1 := gSetup.DirSave + 'sptemp_1'; // bmp to jpg
  FPicTmpPath2 := gSetup.DirSave + 'sptemp_2'; // 合成
  FPicPath := gSetup.DirSave + 'sptemp_3'; // 压缩
  TLZDictionary.BindComboboxWFXW(cbbWfxw, True);
  // TLZDictionary.BindComboboxDEVEx(cbbWfdd, True);
end;

procedure TframeSPDR.BmpToJpg(bmpPic, jpgPic: String);
var
  bmp: TBitmap;
  jpg: TJpegImage;
begin
  bmp := TBitmap.Create;
  jpg := TJpegImage.Create;
  bmp.LoadFromFile(bmpPic);
  jpg.Assign(bmp);
  jpg.SaveToFile(jpgPic);
  bmp.Free;
  jpg.Free;
end;

procedure TframeSPDR.BmpToJpgs(path: String);
var
  pics: TStringdynArray;
  fn, ext, fName: string;
begin
  inherited;
  pics := TDirectory.GetFiles(path, '*.*', TSearchOption.soAllDirectories);
  for fn in pics do
  begin
    fName := ExtractFileName(fn);
    ext := UpperCase(ExtractFileExt(fn).Substring(1));
    if ext = 'JPG' then
      CopyFile(PWideChar(fn), PWideChar(FPicTmpPath1 + '\' + fName), True)
    else if ext = 'BMP' then
      BmpToJpg(fn, FPicTmpPath1 + '\' + copy(fName, 1,
        Length(fName) - 4) + '.jpg')
    else
      continue;
  end;
end;

procedure TframeSPDR.btnSaveClick(Sender: TObject);
var
  picfn, Param, wfdd, wfxw, wfsj, sysid: string;
  dir, fwqdz, ftpfn: string;
  i: Integer;
  dfVehInfo: TDFVehInfo;
begin
  inherited;

  if not tbPic.Active or tbPic.Eof then
    exit;

  if Length(Trim(edtDir.Text)) = 0 then
  begin
    Application.MessageBox('选择图片路径不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  // if Length(Trim(cbbWfdd.Text)) = 0 then
  // begin
  // Application.MessageBox('违法地点不能为空', '错误', MB_OK + MB_ICONSTOP);
  // Exit;
  // end;
  if Length(Trim(cbbWfxw.Text)) = 0 then
  begin
    Application.MessageBox('违法行为不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;

  btnSave.Enabled := False;
  FIsRunUpload := True;
  liPb.Visible := True;
  i := 0;
  tbPic.DisableControls;
  tbPic.First;

  // if pos(':', Trim(cbbWfdd.Text)) > 1 then
  // wfdd := copy(Trim(cbbWfdd.Text), 1, pos(':', Trim(cbbWfdd.Text)) - 1)
  // else
  // wfdd := Trim(cbbWfdd.Text);

  if pos(':', Trim(cbbWfxw.Text)) > 1 then
    wfxw := copy(Trim(cbbWfxw.Text), 1, pos(':', Trim(cbbWfxw.Text)) - 1)
  else
    wfxw := Trim(cbbWfxw.Text);

  dir := '/clientvio/' + FormatDatetime('yyyymm/dd', Now()) + '/';
  fwqdz := 'http://' + gSetup.ftphost + ':8090' + dir;

  while not tbPic.Eof do
  begin
    Application.ProcessMessages;
    picfn := tbPic.FieldByName('fn').AsString;
    DecodeWfInfo(picfn, wfsj, wfdd);
    if wfsj = '' then
      wfsj := FormatDatetime('yyyy/mm/dd hh:nn:ss', Now());
    if wfdd = '' then
      wfdd := '民警抓拍';

    sysid := GetSystemID('0', picfn);
    if sysid <> '' then
      TRequestItf.DbQuery('ModifyT_VIO_TEMP', 'SYSTEMID=' + sysid + '&bj=4');

    ftpfn := FormatDatetime('yyyymmddhhmmsszzz', Now) + '_1.jpg';
    if TCommon.FtpPutFile(gSetup.ftphost, gSetup.ftpuser, gSetup.FtpPwd,
      FPicPath + '\' + picfn, dir + ftpfn, gSetup.ftpport) then
    begin
      Param := 'CJJG=' + gUser.DWDM + '&WFDD=' + wfdd + '&WFXW=' + wfxw +
        '&WFSJ=' + wfsj + '&FWQDZ=' + fwqdz + '&PHOTOFILE1=' + ftpfn + '&tpxh='
        + picfn + '&bj=0&HPZL=02';
      {
        if gHaveK08 then
        begin
        dfVehInfo := TCommon.GetPicVehInfo(fwqdz + ftpfn);
        if dfVehInfo.nTagID <> '' then
        begin
        Param := Param + '&HPHM=' + dfVehInfo.PlateNum;
        Param := Param + '&HPZL=02';
        end;
        end;
      }
      TRequestItf.DbQuery('AddT_VIO_TEMP', Param);
    end;
    inc(i);
    pb.Position := i * 100 / tbPic.RecordCount;
    tbPic.Next;
  end;
  tbPic.EnableControls;
  tbPic.Close;
  Application.MessageBox('导入成功', '提示', MB_OK + MB_ICONINFORMATION);
  liPb.Visible := False;
  btnSave.Enabled := True;
  edtDir.Text := '';
  cbbWfdd.Text := '';
  cbbWfxw.Text := '';
end;

function TframeSPDR.GetSystemID(bj, tpxh: String): String;
var
  s: String;
begin
  Result := '';
  s := TRequestItf.DbQuery('GetT_VIO_TEMP', 'bj=' + bj + '&tpxh=' + tpxh);
  if s <> '' then
  begin
    TJsonUtils.JSONToDataSet(s, tb, '');
    if not tb.Eof then
      Result := tb.FieldByName('SYSTEMID').AsString;
  end;
end;

procedure TframeSPDR.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if tbPic.IsEmpty then
  begin
    Application.MessageBox('没有数据可以删除', '提示', MB_OK + MB_ICONSTOP);
    exit;
  end;

  if Application.MessageBox('是否要删除该数据', '提示', MB_OKCANCEL + MB_ICONINFORMATION)
    = IDOK then
  begin
    tbPic.Delete;
  end;

end;

function TframeSPDR.AddText(ImageEnView1: TImageEnView; txt: string): Boolean;
var
  LogFont: TLogFont;
begin
  Result := True;
  with ImageEnView1.Bitmap.Canvas do
  begin
    Font.Name := 'Times New Roman';
    Font.height := 65;
    Font.Color := clYellow;
    Winapi.Windows.GetObject(Font.Handle, SizeOf(TLogFont), @LogFont);
    LogFont.lfQuality := 3;
    Font.Handle := CreateFontIndirect(LogFont);
    Brush.Style := bsClear;
    TextOut(100, 100, txt);
  end
end;

function TframeSPDR.MergePic(picfn1, picfn2: string; q: Integer; sl: Integer;
  fwm: string): string;
var
  jpg1: TJpegImage;
  img, imgtemp: TImageEnView;
  iwidth, iheight: Integer;
begin
  Result := FPicTmpPath2 + '\' + ExtractFileName(picfn1);
  if sl = 1 then
    CopyFile(PWideChar(picfn1), PWideChar(Result), True)
  else if sl = 2 then
  begin
    try
      jpg1 := TJpegImage.Create;
      jpg1.LoadFromFile(picfn1);
      iwidth := jpg1.width;
      iheight := jpg1.height;
      // if (iwidth > 5000) or (iheight > 5000) then
      // begin
      // jpg1.Free;
      // Result := '';
      // exit;
      // end;

      img := TImageEnView.Create(nil);
      img.IO.LoadFromFileJpeg(picfn1);
      img.Bitmap.height := iheight * 2;
      img.Bitmap.width := iwidth;
      img.IO.Bitmap.Canvas.Draw(0, 0, img.Bitmap);
      imgtemp := TImageEnView.Create(nil);
      imgtemp.IO.LoadFromFileJpeg(picfn2);
      img.IO.Bitmap.Canvas.Draw(0, iheight + 1, imgtemp.Bitmap);
      // AddText(img, fwm);
      img.IO.SaveToFileJpeg(Result);
    finally
      FreeAndNil(jpg1);
      FreeAndNil(imgtemp);
      FreeAndNil(img);
    end;
  end;
end;

procedure TframeSPDR.MergePics;
var
  pics: TStringdynArray;
  fn, jpg1, jpg2: string;
begin
  inherited;
  pics := TDirectory.GetFiles(FPicTmpPath1, '*.*',
    TSearchOption.soAllDirectories);
  for fn in pics do
  begin
    if rbOne.Checked then
    begin
      MergePic(fn, '', 100, 1, '');
    end
    else
    begin
      if jpg1 = '' then
        jpg1 := fn
      else
        jpg2 := fn;
      if (jpg1 <> '') and (jpg2 <> '') then
      begin
        MergePic(jpg1, jpg2, 100, 2, '');
        jpg1 := '';
        jpg2 := '';
      end;
    end;
  end;
end;

procedure TframeSPDR.edtDirAfterDialog(Sender: TObject; var Name: string;
  var Action: Boolean);
var
  pics: TStringdynArray;
  fn, jpg1, jpg2, pic, ext, fName: string;
begin
  inherited;
  if not Action then
    exit;
  ShowFrameWait;
  CreateTmpPath;
  FIsRunUpload := False;
  BmpToJpgs(Name);
  MergePics();
  CompJpgs;
  FillDataTable();
  FreeFrameWait;
end;

procedure TframeSPDR.FillDataTable;
var
  pics: TStringdynArray;
  fn, ext: string;
begin
  tbPic.AfterScroll := nil;
  tbPic.Close;
  tbPic.FieldDefs.Clear;
  tbPic.FieldDefs.Add('fn', ftString, 100, False);
  tbPic.CreateDataSet;
  tbPic.DisableControls;
  pics := TDirectory.GetFiles(FPicPath, '*.*', TSearchOption.soAllDirectories);
  for fn in pics do
  begin
    ext := UpperCase(ExtractFileExt(fn).Substring(1));
    if ext <> 'JPG' then
      continue;
    tbPic.Append;
    tbPic.Fields[0].AsString := ExtractFileName(fn);
    tbPic.Post;
  end;
  tbPic.First;
  tbPic.AfterScroll := tbPicAfterScroll;
  tbPic.EnableControls;
end;

procedure TframeSPDR.tbPicAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not FIsRunUpload then
  begin
    if tbPic.Active and not tbPic.Eof then
      imgInfo.Picture.LoadFromFile(FPicPath + '\' + tbPic.Fields[0].AsString);
  end;
end;

function TframeSPDR.Comjpg(sPath, tPath: string): Boolean;
var
  imgtemp: TImageEnView;
  newSize: TSize;
  ms: TMemoryStream;
begin
  Result := False;
  ms := TMemoryStream.Create;
  ms.LoadFromFile(sPath);
  if ms.Size > 1024 * 1024 * 2 then
  begin
    imgtemp := TImageEnView.Create(nil);
    try
      if imgtemp.IO.LoadFromFileJpeg(sPath) then
      begin
        newSize := GetNewSize(imgtemp.IO.Params.width,
          imgtemp.IO.Params.height);
        if newSize.width < imgtemp.IO.Params.width then
        begin
          imgtemp.Proc.ClearAllRedo;
          imgtemp.Proc.Resample(newSize.width, newSize.height,
            TResampleFilter(0));
          imgtemp.Invalidate;
          imgtemp.Bitmap.Modified := True;
          imgtemp.IO.Params.width := imgtemp.IEBitmap.width;
          imgtemp.IO.Params.height := imgtemp.IEBitmap.height;
          imgtemp.Update;
        end;
        imgtemp.IO.SaveToFileJpeg(tPath);
        Sleep(50);
        Result := True;
      end;
    except
    end;
    FreeAndNil(imgtemp);
  end
  else
    CopyFile(PWideChar(sPath), PWideChar(tPath), True);
  ms.Free;
end;

procedure TframeSPDR.CompJpgs;
var
  pics: TStringdynArray;
  fn, compFile: string;
begin
  pics := TDirectory.GetFiles(FPicTmpPath2, '*.*',
    TSearchOption.soAllDirectories);

  for fn in pics do
  begin
    compFile := FPicPath + '\' + ExtractFileName(fn);
    Comjpg(fn, compFile);
  end;
end;

procedure TframeSPDR.CreateTmpPath;
begin
  if DirectoryExists(FPicTmpPath1) then
    TDirectory.Delete(FPicTmpPath1, True);
  if not DirectoryExists(FPicTmpPath1) then
    ForceDirectories(FPicTmpPath1);

  if DirectoryExists(FPicTmpPath2) then
    TDirectory.Delete(FPicTmpPath2, True);
  if not DirectoryExists(FPicTmpPath2) then
    ForceDirectories(FPicTmpPath2);

  if DirectoryExists(FPicPath) then
    TDirectory.Delete(FPicPath, True);
  if not DirectoryExists(FPicPath) then
    ForceDirectories(FPicPath);
end;

procedure TframeSPDR.DecodeWfInfo(picName: String; var wfsj: String;
  var wfdd: String);
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
        if TLZDictionary.gDicDev[1].ContainsKey(tmp) then
          wfdd := tmp;
      end;
    end;
  end;
end;

function TframeSPDR.GetNewSize(width, height: Integer): TSize;
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

end.
