unit uFrameVioShaiXuan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, dxCore,
  cxLookAndFeelPainters,
  cxContainer, cxEdit, cxClasses, StdCtrls, ExtCtrls, dxNavBar, cxGroupBox,
  dxNavBarBase, dxNavBarCollns, cxTrackBar, cxLabel, dxGalleryControl,
  dxGallery,
  dxGDIPlusClasses, cxImage, dxGDIPlusAPI, dxRatingControl, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinsdxNavBarPainter, dxCustomTileControl,
  dxSkinsdxNavBarAccordionViewPainter, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.Menus, System.ImageList, Vcl.ImgList,
  cxButtons,
  Vcl.ComCtrls, cxDateUtils, cxTextEdit, cxSpinEdit, cxTimeEdit, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxMemo, dxLayoutcxEditAdapters, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutControl, udm, dxLayoutLookAndFeels,
  cxSplitter, xtImage, dxSkinsdxBarPainter, dxBar, cxListView, dxFrame,
  dxDialogBase, uFrameSelectDev, uRequestItf, uJsonUtils, uColumnGenerator,
  uGlobal, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uCommon, uDictionary, uEntity, StrUtils, uVioThread,
  System.Generics.Collections, uFrameBz, hyieutils, iexBitmaps, hyiedefs,
  iesettings, iexRulers, System.Contnrs, imageenview, ieview, ievect,
  Vcl.Imaging.jpeg, EncdDecd, sfContnrs,
  uLookUpDataSource, uFrameWait, QBAES;

type
  TFrameVioShaiXuan = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    liButton: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem38: TdxLayoutItem;
    btnLoad: TcxButton;
    btnDelete: TcxButton;
    btnSave: TcxButton;
    cxImageList1: TcxImageList;
    dxLayoutItem5: TdxLayoutItem;
    fSelectDev: TFrameSelectDev;
    tbVio: TFDMemTable;
    livideo: TdxLayoutItem;
    liP1: TdxLayoutItem;
    liP3: TdxLayoutItem;
    liP2: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    btnBlue: TcxButton;
    btnGreen: TcxButton;
    btnP1: TcxButton;
    btnP2: TcxButton;
    btnP3: TcxButton;
    btnVideo: TcxButton;
    dxLayoutGroup12: TdxLayoutGroup;
    lgGrid: TdxLayoutGroup;
    lgImage: TdxLayoutGroup;
    liVioTb: TdxLayoutItem;
    cxGrid1: TcxGrid;
    tvDev: TcxGridDBTableView;
    tvDevColumn2: TcxGridDBColumn;
    tvDevColumn3: TcxGridDBColumn;
    tvDevColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSource1: TDataSource;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    imgviopic: TImageEnVect;
    img1: TImageEnView;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure btnLoadClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure fSelectDevtvDevCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tbVioAfterScroll(DataSet: TDataSet);
    procedure tbVioBeforeDelete(DataSet: TDataSet);
    procedure tbVioAfterDelete(DataSet: TDataSet);
    procedure Timer2Timer(Sender: TObject);
  private
    FFrameWait: TFrameWait;
    FFrameID: string;
    fdbool, FOK, fz: Boolean;
    FPicFile: string;
    isfms: Integer;
    FObj: TVio;
    FWfdd: String;
    FWfxw: String;
    FVioThread: TVioThread;
    FVioList: TList<TVio>;
    FSBBH: string;
    procedure FillControl();
    procedure InitDevTb();
    procedure InitControl();
    procedure ClearVioList;
    procedure UpdateDBVioStatus(systemid, bj: string; bz: string = ''; sxbj: String = '');
    procedure ShowVioPicture(picFile: string);
    procedure ObjDoned();
    procedure SetSBBH(const Value: string);
    procedure ShowFrameWait();
    procedure FreeFrameWait();
    procedure FillDevCommbox();
  public
    procedure LoadVioList();
    property FrameID: string read FFrameID write FFrameID;
    property SBBH: string read FSBBH write SetSBBH;
  end;

implementation

{$R *.dfm}

procedure TFrameVioShaiXuan.AfterConstruction;
begin
  inherited;
  imgviopic.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  FVioThread := TVioThread.Create;
  FVioList := TList<TVio>.Create;

  if TRequestItf.DbQuery('GetS_ModelActive_Config', 'CJJG=' + gUser.DWDM +
    '&MODEL=TFrameVioShaiXuan&CLOSED=1') <> '' then
  begin
    Application.MessageBox('您无权使用该功能,请与支队管理员联系', '信息', MB_OK);
    self.Enabled := False;
    exit;
  end;

  FillDevCommbox;
  if TLookUpDataSource.DataSource.ContainsKey('HPZL') then
    TColumnGenerator.LookupColumn(tvDev.Columns[1],
      TLookUpDataSource.DataSource['HPZL']);
  Timer1.Enabled := True;
end;

procedure TFrameVioShaiXuan.BeforeDestruction;
begin
  inherited;
  ClearVioList;
  FVioThread.Stop;
  Timer1.Enabled := False;
end;

procedure TFrameVioShaiXuan.ClearVioList;
var
  vio: TVio;
begin
  for vio in FVioList do
    vio.Deleted := True;
  FVioList.Clear;
end;

procedure TFrameVioShaiXuan.InitControl;
begin
  imgviopic.Clear;
end;

procedure TFrameVioShaiXuan.InitDevTb;
begin
  fSelectDev.tb.Close;
  fSelectDev.tb.FieldDefs.Clear;
  fSelectDev.tb.IndexDefs.Clear;
  fSelectDev.tb.FieldDefs.Add('bj', ftBoolean);
  fSelectDev.tb.FieldDefs.Add('WFDD', ftString, 100);
  fSelectDev.tb.FieldDefs.Add('SBDDMC', ftString, 100);
  fSelectDev.tb.FieldDefs.Add('WFXW', ftString, 100);
  fSelectDev.tb.FieldDefs.Add('C1', ftInteger);
end;

procedure TFrameVioShaiXuan.btnSaveClick(Sender: TObject);
var
  tmp: string;
  ts: TStrings;
begin
  FWfdd := '';
  FWfxw := '';
  tmp := '';
  ts := TStringList.Create;
  ts.Delimiter := ',';
  if not fSelectDev.tb.Active then
    exit;
  fSelectDev.tb.DisableControls;
  fSelectDev.tb.First;
  while not fSelectDev.tb.eof do
  begin
    tmp := tmp + fSelectDev.tb.FieldByName('WFDD').AsString + ',';
    if fSelectDev.tb.FieldByName('bj').AsBoolean then
    begin
      FWfdd := FWfdd + fSelectDev.tb.FieldByName('WFDD').AsString + ',';
      if ts.IndexOf(fSelectDev.tb.FieldByName('WFXW').AsString) < 0 then
        ts.Add(fSelectDev.tb.FieldByName('WFXW').AsString);
    end;
    fSelectDev.tb.Next;
  end;
  fSelectDev.tb.EnableControls;
  if FWfdd <> '' then
    FWfdd := copy(FWfdd, 1, Length(FWfdd) - 1)
  else
    FWfdd := copy(tmp, 1, Length(tmp) - 1);
  if ts.Count > 0 then
    FWfxw := ts.DelimitedText;
  ts.Free;
  btnExitClick(nil);
  LoadVioList();
end;

procedure TFrameVioShaiXuan.LoadVioList;
var
  Param, s: string;
  vio: TVio;
begin
  ShowFrameWait;
  tbVio.Close;
  FObj := nil;
  InitControl;
  ClearVioList;
  Param := 'count=30&cjjg=' + gUser.DWDM + '&ip=' + gClientIp + '&wfdd='
    + FWfdd + '&wfxw=' + FWfxw + '&sxbj=1';
  s := TRequestItf.DbQuery('GetLRTempVioList', Param);
  if s <> '' then
  begin
    tbVio.AfterScroll := nil;
    TJsonUtils.JSONToDataSet(s, tbVio, '');
    tbVio.First;
    while not tbVio.eof do
    begin
      vio := TVio.Create;
      vio.systemid := tbVio.FieldByName('SYSTEMID').AsString;
      vio.VioRecord.systemid := vio.systemid;
      vio.VioRecord.HPHM := tbVio.FieldByName('HPHM').AsString;
      vio.VioRecord.HPZL := tbVio.FieldByName('HPZL').AsString;
      vio.VioRecord.wfsj := TCommon.StringToDT(tbVio.FieldByName('wfsj')
        .AsString);
      vio.VioRecord.wfxw := tbVio.FieldByName('wfxw').AsString;
      vio.VioRecord.CD := tbVio.FieldByName('cd').AsString;
      vio.VioRecord.SJSD := tbVio.FieldByName('sjsd').AsInteger;
      vio.VioRecord.wfdd := tbVio.FieldByName('WFDD').AsString;
      vio.VioRecord.XZSD := tbVio.FieldByName('XZSD').AsInteger;
      vio.VioRecord.FWQDZ := tbVio.FieldByName('fwqdz').AsString;
      vio.VioRecord.PHOTOFILE1 := tbVio.FieldByName('PHOTOFILE1').AsString;
      vio.VioRecord.PHOTOFILE2 := tbVio.FieldByName('PHOTOFILE2').AsString;
      vio.VioRecord.PHOTOFILE3 := tbVio.FieldByName('PHOTOFILE3').AsString;
      vio.VioRecord.VIDEOFILE := tbVio.FieldByName('VIDEOFILE').AsString;
      vio.VioRecord.cjjg := tbVio.FieldByName('CJJG').AsString;
      vio.DoneVehInfo := true;
      FVioList.Add(vio);
      FVioThread.Add(vio);
      tbVio.Next;
    end;
    if tbVio.RecordCount > 0 then
    begin
      tbVio.First;
      tbVio.AfterScroll := tbVioAfterScroll;
      tbVioAfterScroll(nil);
    end;
  end
  else
    btnLoadClick(nil);
  FreeFrameWait;
end;

procedure TFrameVioShaiXuan.ObjDoned;
begin
  FObj.Doned := True;
  if not tbVio.eof then
    tbVio.Delete;
end;

procedure TFrameVioShaiXuan.FillControl;
var
  HPHM, FWQDZ, tp: string;
  i: Integer;
begin
  InitControl;

  if not FObj.Downloaded then
  begin
    FWQDZ := FObj.VioRecord.FWQDZ;
    tp := FObj.VioRecord.PHOTOFILE1;
    TCommon.GetPic(FWQDZ, tp, gSetup.DirSave + '\' + FObj.systemid + '_1.jpg');

    tp := FObj.VioRecord.PHOTOFILE2;
    if tp <> '' then
    begin
      TCommon.GetPic(FWQDZ, tp, gSetup.DirSave + '\' + FObj.systemid +
        '_2.jpg');
    end;

    tp := FObj.VioRecord.PHOTOFILE3;
    if tp <> '' then
    begin
      TCommon.GetPic(FWQDZ, tp, gSetup.DirSave + '\' + FObj.systemid +
        '_3.jpg');
    end;
    FObj.Downloaded := True;
  end;

  if FObj.Downloaded then
  begin
    liP1.Visible := FileExists(gSetup.DirSave + '\' + FObj.systemid + '_1.jpg');
    liP2.Visible := FileExists(gSetup.DirSave + '\' + FObj.systemid + '_2.jpg');
    liP3.Visible := FileExists(gSetup.DirSave + '\' + FObj.systemid + '_3.jpg');
    livideo.Visible := FileExists(gSetup.DirSave + '\' +
      FObj.VioRecord.VIDEOFILE);
    if liP1.Visible then
    begin
      ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_1.jpg');
      btnP1.Glyph := btnGreen.Glyph;
    end;
    Application.ProcessMessages;
  end;
end;

procedure TFrameVioShaiXuan.FillDevCommbox;
var
  s: string;
  str: TStringList;
begin
  str := TStringList.Create;
  str.Sort;
  str.Sorted := True;
  if TLZDictionary.gDicDept.ContainsKey(gUser.DWDM) and TLZDictionary.gDicDept
    [gUser.DWDM].IsJX then // 机巡中队可以录全大队的，机巡大队可以录全中队的，民警抓拍
  begin
    for s in TLZDictionary.gDicDev[1].Keys do
    begin
      if (TLZDictionary.gDicDev[1][s].sblx = '1') or
        (TLZDictionary.gDicDev[1][s].sblx = '2') then
        str.Add(TLZDictionary.gDicDev[1][s].SBDDMC);
    end;
  end
  else
  begin
    for s in TLZDictionary.gDicDev[1].Keys do
    begin
      if TLZDictionary.gDicDev[1][s].cjjg <> gUser.DWDM then
        continue;
      if (TLZDictionary.gDicDev[1][s].sblx = '1') or
        (TLZDictionary.gDicDev[1][s].sblx = '2') then
        str.Add(TLZDictionary.gDicDev[1][s].SBDDMC);
    end;
  end;
  str.Free;
end;

procedure TFrameVioShaiXuan.FreeFrameWait;
begin
  if Assigned(FFrameWait) then
    FFrameWait.Visible := False;
end;

procedure TFrameVioShaiXuan.fSelectDevtvDevCellClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  fSelectDev.tb.Edit;
  if fSelectDev.tb.FieldByName('bj').AsBoolean then
    fSelectDev.tb.FieldByName('bj').AsBoolean := False
  else
    fSelectDev.tb.FieldByName('bj').AsBoolean := True;
  fSelectDev.tb.Post;
end;

procedure TFrameVioShaiXuan.imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  rc: TRect;
  ww, hh: Integer;
begin
  if isfms = 1 then
  begin
    if fdbool then
    begin
      imgviopic.AutoFit := True;
      imgviopic.Proc.ClearAllRedo;
      imgviopic.Proc.SelCopyToClip();
      imgviopic.Proc.CropSel;
      imgviopic.DeSelect;
    end;
    fdbool := False;
    isfms := 3;
  end
  else
  begin
    if fz then
      exit;

    rc.left := X - 63;
    rc.top := Y - 50;
    rc.Right := X + 64;
    rc.Bottom := Y + 50;

    with imgviopic do
    begin
      rc.left := XScr2Bmp(rc.left);
      rc.Right := XScr2Bmp(rc.Right);
      rc.top := YScr2Bmp(rc.top);
      rc.Bottom := YScr2Bmp(rc.Bottom);
    end;

    ww := rc.Right - rc.left + 1;
    hh := rc.Bottom - rc.top + 1;
    img1.IEBitmap.Allocate(ww, hh, imgviopic.IEBitmap.PixelFormat);
    imgviopic.IEBitmap.CopyRectTo(img1.IEBitmap, rc.left, rc.top, 0, 0, ww, hh);

    img1.Update;
    img1.Fit;
    imgviopic.Paint;
  end;
end;

procedure TFrameVioShaiXuan.imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    fdbool := True;
    isfms := 1;
    fz := not fz;
  end
  else
  begin
    fz := False;
    isfms := 3;
    ShowVioPicture(FPicFile);
  end;
  btnSave.SetFocus;
end;

procedure TFrameVioShaiXuan.UpdateDBVioStatus(systemid, bj: string;
  bz: string = ''; sxbj: String = '');
var
  Param: string;
  cmd: PCmd;
begin
  Param := 'SYSTEMID=' + systemid + '&BJ=' + bj + '&LRR=' + gUser.YHBH +
    '&GXSJ=' + formatDatetime('yyyy/mm/dd hh:nn:ss', now());
  if bz <> '' then
    Param := Param + '&BZ=' + bz;
  if sxbj = '1' then
    Param := Param + '&ShaiXuanBiaoJi=1&lockip=0.0.0.0';
  TRequestItf.DbQuery('ModifyT_VIO_TEMP', Param);
end;

procedure TFrameVioShaiXuan.SetSBBH(const Value: string);
begin
  FSBBH := Value;
  FWfdd := FSBBH;
end;

procedure TFrameVioShaiXuan.btnExitClick(Sender: TObject);
begin
  fSelectDev.Visible := False;
  dxLayoutControl1Group_Root.Visible := True;
  Application.ProcessMessages;
end;

procedure TFrameVioShaiXuan.btnLoadClick(Sender: TObject);
var
  s: string;
begin
  dxLayoutControl1Group_Root.Visible := False;
  fSelectDev.top := 20;
  fSelectDev.left := (self.Width - fSelectDev.Width) div 2;
  fSelectDev.ColWfxw.Visible := True;
  InitDevTb;
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetTempVioTotal','CJJG=' + gUser.DWDM + '&IP=' + gClientIp+'&sxbj=1');
  TJsonUtils.JSONToDataSet(s, fSelectDev.tb, '', False);
  fSelectDev.Visible := True;
  if not fSelectDev.tb.Active then
  begin
    FreeFrameWait;
    exit;
  end;

  fSelectDev.tb.DisableControls;
  fSelectDev.tb.First;
  while not fSelectDev.tb.eof do
  begin
    if (fSelectDev.tb.FieldByName('WFDD').AsString <> '民警抓拍') and
      (not TLZDictionary.gDicDev[1].ContainsKey(fSelectDev.tb.FieldByName
      ('WFDD').AsString)) then
      fSelectDev.tb.Delete
    else if (fSelectDev.tb.FieldByName('WFDD').AsString = '民警抓拍') and
      (fSelectDev.tb.FieldByName('C1').AsString = '0') then
      fSelectDev.tb.Delete
    else
    begin
      fSelectDev.tb.Edit;
      fSelectDev.tb.FieldByName('bj').AsBoolean := False;
      fSelectDev.tb.Post;
      fSelectDev.tb.Next;
    end;
  end;
  fSelectDev.tb.First;
  fSelectDev.tb.EnableControls;
  FreeFrameWait;
end;

procedure TFrameVioShaiXuan.btnDeleteClick(Sender: TObject);
begin
  if FObj = nil then
    exit;
  UpdateDBVioStatus(FObj.VioRecord.systemid, '4', '', '1');
  ObjDoned;
end;

procedure TFrameVioShaiXuan.cxButton2Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  UpdateDBVioStatus(FObj.VioRecord.systemid, '0', '', '1');
  ObjDoned;
end;

procedure TFrameVioShaiXuan.ShowFrameWait;
begin
  if not Assigned(FFrameWait) then
  begin
    FFrameWait := TFrameWait.Create(self);
    FFrameWait.Parent := self;
    FFrameWait.top := (self.Height - FFrameWait.Height) div 2;
    FFrameWait.left := (self.Width - FFrameWait.Width) div 2;
  end;
  FFrameWait.Visible := True;
  Application.ProcessMessages;
end;

procedure TFrameVioShaiXuan.ShowVioPicture(picFile: string);
begin
  fz := False;
  FPicFile := picFile;
  imgviopic.AutoFit := True;
  if not FileExists(FPicFile) then
  begin
    imgviopic.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
    exit;
  end;

  with imgviopic.IO do
  begin
    NativePixelFormat := True;
    LoadFromFile(FPicFile);
  end;
  imgviopic.AutoFit := False;

  imgviopic.Select(0, 0, 0, 0, iespReplace);
  imgviopic.MouseInteract := [miSelect];
  imgviopic.SelectionOptions := [iesoMoveable, iesoCanScroll];
end;

procedure TFrameVioShaiXuan.tbVioAfterDelete(DataSet: TDataSet);
begin
  tbVio.AfterScroll := tbVioAfterScroll;
end;

procedure TFrameVioShaiXuan.tbVioAfterScroll(DataSet: TDataSet);
var
  i: Integer;
begin
  FObj := nil;
  if tbVio.RecordCount = 0 then
  begin
    LoadVioList();
    exit;
  end;

  for i := 0 to FVioList.Count - 1 do
  begin
    if not FVioList[i].Doned and
      (FVioList[i].systemid = tbVio.FieldByName('SystemID').AsString) then
    begin
      FObj := FVioList[i];
      break;
    end;
  end;
  if FObj <> nil then
    FillControl
  else
    LoadVioList();
end;

procedure TFrameVioShaiXuan.tbVioBeforeDelete(DataSet: TDataSet);
begin
  tbVio.AfterScroll := nil;
end;

procedure TFrameVioShaiXuan.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  btnLoadClick(nil);
end;

end.
