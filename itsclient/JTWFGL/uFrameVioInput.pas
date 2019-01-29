unit uFrameVioInput;

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
  TFrameVioInput = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    lgInfo: TdxLayoutGroup;
    liButton: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutSplitterItem3: TdxLayoutSplitterItem;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutItem25: TdxLayoutItem;
    dxLayoutItem26: TdxLayoutItem;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutItem28: TdxLayoutItem;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutGroup10: TdxLayoutGroup;
    dxLayoutGroup11: TdxLayoutGroup;
    dxLayoutSplitterItem4: TdxLayoutSplitterItem;
    dxLayoutItem31: TdxLayoutItem;
    dxLayoutItem32: TdxLayoutItem;
    dxLayoutItem33: TdxLayoutItem;
    dxLayoutItem35: TdxLayoutItem;
    dxLayoutItem36: TdxLayoutItem;
    dxLayoutItem37: TdxLayoutItem;
    dxLayoutItem38: TdxLayoutItem;
    btnLoad: TcxButton;
    btnBlack: TcxButton;
    btnDelete: TcxButton;
    btnSave: TcxButton;
    cbbhpzl: TcxComboBox;
    cbbsf: TcxComboBox;
    cbbwfdd: TcxComboBox;
    cbbwfxw: TcxComboBox;
    dterq: TcxDateEdit;
    edtccdjrq: TcxTextEdit;
    edtcd: TcxTextEdit;
    edtcllx: TcxTextEdit;
    edtclpp1: TcxTextEdit;
    edtHZ: TcxTextEdit;
    edtclxh: TcxTextEdit;
    edtcs: TcxTextEdit;
    edtcsys: TcxTextEdit;
    edthphm: TcxTextEdit;
    edtqzbfqz: TcxTextEdit;
    edtsj: TcxTimeEdit;
    edtsyr: TcxTextEdit;
    edtxs: TcxTextEdit;
    edtyxqz: TcxTextEdit;
    mmozsxxdz: TcxMemo;
    edtsyxz: TcxTextEdit;
    edthbbj: TcxTextEdit;
    edtbxzzrq: TcxTextEdit;
    edtfzjg: TcxTextEdit;
    edtclsbdh: TcxTextEdit;
    edtfdjh: TcxTextEdit;
    cxImageList1: TcxImageList;
    dxLayoutItem5: TdxLayoutItem;
    fSelectDev: TFrameSelectDev;
    tbVio: TFDMemTable;
    fBz: TframeBz;
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
    procedure btnBlackClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cbbsfKeyPress(Sender: TObject; var Key: Char);
    procedure edthphmKeyPress(Sender: TObject; var Key: Char);
    procedure cbbhpzlKeyPress(Sender: TObject; var Key: Char);
    procedure fBzbtnExitClick(Sender: TObject);
    procedure fBzbtnSaveClick(Sender: TObject);
    procedure btnP1Click(Sender: TObject);
    procedure btnP2Click(Sender: TObject);
    procedure btnP3Click(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure dxLayoutGroup8Expanded(Sender: TObject);
    procedure dxLayoutGroup8Collapsed(Sender: TObject);
    procedure imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbbwfxwMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbbsfMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbbhpzlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fSelectDevtvDevCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tbVioAfterScroll(DataSet: TDataSet);
    procedure tbVioBeforeDelete(DataSet: TDataSet);
    procedure tbVioAfterDelete(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    FFrameWait: TFrameWait;
    FcmdQueue: TsfQueue;
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
    procedure LoadVehInfo(veh: TVehInfo);
    procedure UpdateColor(veh: TVehInfo);
    procedure ClearVioList;
    procedure UpdateVehFromEdit();
    procedure UpdateDBVioStatus(systemid, bj: string; bz: string = '');
    function SaveVio(): Boolean;
    procedure ShowVioPicture(picFile: string);
    procedure ObjDoned();
    procedure SetSBBH(const Value: string);
    procedure ClearQueue;
    procedure ShowFrameWait();
    procedure FreeFrameWait();
    procedure AddSY(obj: TVio);
    function AddPicText(sourcePic, targetPic: String; vio: TVio): Boolean;
    procedure FillDevCommbox();
  public
    procedure LoadVioList();
    property FrameID: string read FFrameID write FFrameID;
    property SBBH: string read FSBBH write SetSBBH;
  end;

implementation

{$R *.dfm}

function TFrameVioInput.AddPicText(sourcePic, targetPic: String;
  vio: TVio): Boolean;
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
      TextOut(10, 10, '违法时间: ' + formatDatetime('yyyy-mm-dd hh:nn:ss',
        vio.VioRecord.wfsj) + ' 号牌号码: ' + vio.VehInfo.HPHM + ' 号牌种类: ' +
        vio.VehInfo.HPZL);
      TextOut(10, 10 + w, '设备编号: ' + vio.VioRecord.wfdd + ' 车道: ' +
        vio.VioRecord.CD);
      TextOut(10, 10 + w * 2, '设备名称: ' + TLZDictionary.gDicDev[2]
        [vio.VioRecord.wfdd].SBDDMC);
      TextOut(10, 10 + w * 3, '违法代码: ' + vio.VioRecord.wfxw + '  防伪码: ' +
        copy(string(AesEncrypt(AnsiString(sourcePic), AnsiString(Key))
        ), 1, 20));
    end;
    img.IO.SaveToFileJpeg(targetPic);
  except
    Result := False;
  end;
  img.Free;
end;

procedure TFrameVioInput.AddSY(obj: TVio);
var
  fn, ftpdir: String;
begin
  // 如果url里面的IP和ftp的ip不一样,则ftp无法上传，就无法替换原图片
  if not obj.VioRecord.FWQDZ.Contains(gSetup.FtpHost) then
    exit;

  ftpdir := obj.VioRecord.FWQDZ.Replace('http://', '');
  if pos('/', ftpdir) > 0 then
  begin
    ftpdir := Trim(copy(ftpdir, pos('/', ftpdir), Length(ftpdir)));
    if ftpdir = '/' then
      ftpdir := '';
  end
  else
    ftpdir := '';

  if FileExists(gSetup.DirSave + '\' + FObj.systemid + '_1.jpg') then
  begin
    fn := gSetup.DirSave + '\' + obj.VioRecord.PHOTOFILE1;
    if AddPicText(gSetup.DirSave + '\' + FObj.systemid + '_1.jpg', fn, obj) and
      FileExists(fn) then
      TCommon.FtpPutFile(gSetup.FtpHost, gSetup.FtpUser, gSetup.FtpPwd, fn,
        ftpdir + obj.VioRecord.PHOTOFILE1, gSetup.FtpPort);
  end;
  if FileExists(gSetup.DirSave + '\' + FObj.systemid + '_2.jpg') then
  begin
    fn := gSetup.DirSave + '\' + obj.VioRecord.PHOTOFILE2;
    if AddPicText(gSetup.DirSave + '\' + FObj.systemid + '_2.jpg', fn, obj) and
      FileExists(fn) then
      TCommon.FtpPutFile(gSetup.FtpHost, gSetup.FtpUser, gSetup.FtpPwd, fn,
        ftpdir + obj.VioRecord.PHOTOFILE1, gSetup.FtpPort);
  end;
  if FileExists(gSetup.DirSave + '\' + FObj.systemid + '_3.jpg') then
  begin
    fn := gSetup.DirSave + '\' + obj.VioRecord.PHOTOFILE3;
    if AddPicText(gSetup.DirSave + '\' + FObj.systemid + '_3.jpg', fn, obj) and
      FileExists(fn) then
      TCommon.FtpPutFile(gSetup.FtpHost, gSetup.FtpUser, gSetup.FtpPwd, fn,
        ftpdir + obj.VioRecord.PHOTOFILE1, gSetup.FtpPort);
  end;
end;

procedure TFrameVioInput.AfterConstruction;
begin
  inherited;
  imgviopic.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  if screen.Height < 960 then
  begin
    lgGrid.Visible := False;
    lgImage.AlignVert := avTop;
    lgInfo.AlignVert := avClient;
  end
  else
  begin
    lgGrid.Visible := True;
    // lgGrid.AlignVert := avClient;
    lgImage.AlignVert := avBottom;
    lgInfo.AlignVert := avBottom;
  end;
  FVioThread := TVioThread.Create;
  FVioList := TList<TVio>.Create;
  FcmdQueue := TsfQueue.Create;

  if TRequestItf.DbQuery('GetS_ModelActive_Config', 'CJJG=' + gUser.DWDM +
    '&MODEL=TFrameVioInput&CLOSED=1') <> '' then
  begin
    Application.MessageBox('您无权使用该功能,请与支队管理员联系', '信息', MB_OK);
    self.Enabled := False;
    exit;
  end;

  // TLZDictionary.BindComboboxDEVEx(cbbwfdd, False);
  FillDevCommbox;
  TLZDictionary.BindComboboxWFXW(cbbwfxw, True);
  TLZDictionary.BindCombobox(cbbsf, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
  if TLookUpDataSource.DataSource.ContainsKey('HPZL') then
    TColumnGenerator.LookupColumn(tvDev.Columns[1],
      TLookUpDataSource.DataSource['HPZL']);
  Timer1.Enabled := True;
end;

procedure TFrameVioInput.BeforeDestruction;
begin
  inherited;
  ClearVioList;
  FVioThread.Stop;
  Timer1.Enabled := False;
  ClearQueue;
end;

procedure TFrameVioInput.ClearQueue;
var
  cmd: PCmd;
begin
  cmd := FcmdQueue.Pop;
  while cmd <> nil do
  begin
    try
      if cmd^.Action <> '' then
        TRequestItf.DbQuery(cmd^.Action, cmd^.Param);
      Dispose(cmd);
      Sleep(100);
      cmd := FcmdQueue.Pop;
    except
    end;
  end;
  FcmdQueue.Free;
end;

procedure TFrameVioInput.ClearVioList;
var
  vio: TVio;
begin
  for vio in FVioList do
    vio.Deleted := True;
  FVioList.Clear;
end;

procedure TFrameVioInput.InitControl;
begin
  cbbwfdd.Text := '';
  cbbwfxw.Text := '';
  cbbsf.Text := '';
  edthphm.Text := '';
  cbbhpzl.Text := '';
  edtcd.Text := '';
  edtxs.Text := '';
  edtcs.Text := '';
  edtsyr.Text := '';
  edtclpp1.Text := '';
  edtHZ.Text := '';
  edtclxh.Text := '';
  edtcllx.Text := '';
  edtcsys.Text := '';
  edtccdjrq.Text := '';
  edtyxqz.Text := '';
  edtqzbfqz.Text := '';
  edtsyxz.Text := '';
  edthbbj.Text := '';
  edtbxzzrq.Text := '';
  edtfdjh.Text := '';
  edtclsbdh.Text := '';
  edtfzjg.Text := '';
  mmozsxxdz.Text := '';
  imgviopic.Clear;
end;

procedure TFrameVioInput.InitDevTb;
begin
  fSelectDev.tb.Close;
  fSelectDev.tb.FieldDefs.Clear;
  fSelectDev.tb.IndexDefs.Clear;
  fSelectDev.tb.FieldDefs.Add('bj', ftBoolean);
  fSelectDev.tb.FieldDefs.Add('WFDD', ftString, 100);
  fSelectDev.tb.FieldDefs.Add('SBDDMC', ftString, 100);
  fSelectDev.tb.FieldDefs.Add('WFXW', ftString, 100);
  fSelectDev.tb.FieldDefs.Add('C1', ftInteger);
  // fSelectDev.tb.IndexDefs.Add('index', 'WFDD', [ixPrimary]);
  // fSelectDev.tb.IndexName := 'index';
end;

procedure TFrameVioInput.btnSaveClick(Sender: TObject);
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

procedure TFrameVioInput.btnVideoClick(Sender: TObject);
begin
  if FObj = nil then
    exit;

  ShowVioPicture(gSetup.DirSave + '\' + FObj.VioRecord.VIDEOFILE);
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnGreen.Glyph;
end;

procedure TFrameVioInput.LoadVioList;
var
  Param, s: string;
  vio: TVio;
begin
  ShowFrameWait;
  tbVio.Close;
  FObj := nil;
  InitControl;
  ClearVioList;
  Param := 'count=30&cjjg=' + gUser.DWDM + '&ip=' + gClientIp;
  if FWfdd <> '' then
    Param := Param + '&wfdd=' + FWfdd;
  if FWfxw <> '' then
    Param := Param + '&wfxw=' + FWfxw;
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

procedure TFrameVioInput.ObjDoned;
begin
  FObj.Doned := True;
  if not tbVio.eof then
    tbVio.Delete;
end;

procedure TFrameVioInput.FillControl;
var
  HPHM, FWQDZ, tp: string;
  i: Integer;
begin
  InitControl;
  if FObj.VioRecord.wfdd <> '民警抓拍' then
    cbbwfdd.Text := FObj.VioRecord.wfdd
  else
    cbbwfdd.Text := '';
  if TLZDictionary.gDicDev[2].ContainsKey(FObj.VioRecord.wfdd) then
    cbbwfdd.Text := TLZDictionary.gDicDev[2][FObj.VioRecord.wfdd].SBDDMC;
  dterq.Text := formatDatetime('yyyy/mm/dd', FObj.VioRecord.wfsj);
  edtsj.Text := formatDatetime('hh:nn:ss', FObj.VioRecord.wfsj);
  cbbwfxw.Text := FObj.VioRecord.wfxw;
  if TLZDictionary.gDicWfxw.ContainsKey(FObj.VioRecord.wfxw) then
    cbbwfxw.Text := cbbwfxw.Text + ':' + TLZDictionary.gDicWfxw
      [FObj.VioRecord.wfxw].WFXWMC;
  HPHM := FObj.VioRecord.HPHM;
  if HPHM <> '' then
  begin
    cbbsf.Text := HPHM[1];
    for i := 0 to cbbsf.Properties.Items.Count - 1 do
    begin
      if pos(HPHM[1], cbbsf.Properties.Items[i]) > 0 then
      begin
        cbbsf.ItemIndex := i;
        break;
      end;
    end;
    edthphm.Text := copy(HPHM, 2, 100);
  end
  else
    cbbsf.Text := '44:粤';
  cbbhpzl.Text := FObj.VioRecord.HPZL;
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(FObj.VioRecord.HPZL) then
    cbbhpzl.Text := cbbhpzl.Text + ':' + TLZDictionary.gDicMain['HPZL']
      [FObj.VioRecord.HPZL];
  edtcd.Text := FObj.VioRecord.CD;
  edtxs.Text := FObj.VioRecord.XZSD.ToString;
  edtcs.Text := FObj.VioRecord.SJSD.ToString;

  if not FObj.DoneVehInfo then
  begin
    FObj.VehInfo := TCommon.GetVehInfo(FObj.VioRecord.HPHM,
      FObj.VioRecord.HPZL, '');
    FObj.DoneVehInfo := True;
  end;
  LoadVehInfo(FObj.VehInfo);

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

procedure TFrameVioInput.FillDevCommbox;
var
  s: string;
  str: TStringList;
begin
  str := TStringList.Create;
  str.Sort;
  str.Sorted := True;
  // if TLZDictionary.gDicDept.ContainsKey(gUser.DWDM) and TLZDictionary.gDicDept
  // [gUser.DWDM].IsJX then // 机巡中队可以录全大队的，机巡大队可以录全中队的，民警抓拍
  // begin
  for s in TLZDictionary.gDicDev[1].Keys do
  begin
    if (TLZDictionary.gDicDev[1][s].sblx = '1') or
      (TLZDictionary.gDicDev[1][s].sblx = '2') then
      str.Add(TLZDictionary.gDicDev[1][s].SBDDMC);
  end;
  {
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
  }
  cbbwfdd.Properties.Items.Clear;
  cbbwfdd.Properties.Items.AddStrings(str);
  str.Free;
end;

procedure TFrameVioInput.FreeFrameWait;
begin
  if Assigned(FFrameWait) then
    FFrameWait.Visible := False;
end;

procedure TFrameVioInput.fSelectDevtvDevCellClick
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

procedure TFrameVioInput.imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TFrameVioInput.imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TFrameVioInput.LoadVehInfo(veh: TVehInfo);
var
  HPHM, HPZL, Color: string;
  i: Integer;
begin
  if veh.code <> '1' then
  begin
    HPHM := RightStr(Trim(cbbsf.Text), 1) + Trim(edthphm.Text);
    HPZL := LeftStr(Trim(cbbhpzl.Text), 2);
    veh := TCommon.GetVehInfo(HPHM, HPZL, '');
  end;
  edtsyr.Text := veh.syr;
  edtclpp1.Text := veh.clpp1 + veh.clpp2;
  edtHZ.Text := veh.hdzzl + veh.hdzk;
  edtclxh.Text := veh.clxh;
  if TLZDictionary.gDicMain['CLLX'].ContainsKey(veh.cllx) then
    edtcllx.Text := veh.cllx + ':' + TLZDictionary.gDicMain['CLLX'][veh.cllx]
  else
    edtcllx.Text := veh.cllx;

  Color := '';
  for i := 1 to Length(veh.csys) do
  begin
    if TLZDictionary.gDicMain['CSYS'].ContainsKey(veh.csys[i]) then
      Color := Color + TLZDictionary.gDicMain['CSYS'][veh.csys[i]];
  end;
  edtcsys.Text := veh.csys;
  if Color <> '' then
    edtcsys.Text := edtcsys.Text + ':' + Color;
  edtccdjrq.Text := veh.ccdjrq;
  edtyxqz.Text := veh.yxqz;
  edtqzbfqz.Text := veh.qzbfqz;
  if TLZDictionary.gDicMain['SYXZ'].ContainsKey(veh.syxz) then
    edtsyxz.Text := TLZDictionary.gDicMain['SYXZ'][veh.syxz]
  else
    edtsyxz.Text := veh.syxz;
  edthbbj.Text := veh.glbm;
  edtbxzzrq.Text := veh.bxzzrq;
  edtfdjh.Text := veh.fdjh;
  edtclsbdh.Text := veh.clsbdh;
  edtfzjg.Text := veh.fzjg;
  mmozsxxdz.Text := veh.zsxxdz;
  UpdateColor(veh);
end;

procedure TFrameVioInput.UpdateColor(veh: TVehInfo);
var
  defaultColor: TColor;
  defaultTextColor: TColor;
  HPHM, HPZL: string;
begin
  HPHM := RightStr(Trim(cbbsf.Text), 1) + Trim(edthphm.Text);
  HPZL := LeftStr(Trim(cbbhpzl.Text), 2);
  defaultColor := clWindow;
  defaultTextColor := clWindowText;
  edthphm.Style.Color := defaultColor;
  edtqzbfqz.Style.TextColor := defaultTextColor;
  edtyxqz.Style.TextColor := defaultTextColor;
  if tbVio.FieldByName('WFXW').AsString = '13441' then
  begin
    edthphm.Style.Color := clRed;
    if TLZDictionary.gDicHBC.ContainsKey(HPHM + HPZL) then
    begin
      edthphm.Style.Color := clYellow;
    end;
  end;
  if (Length(edtqzbfqz.Text) > 0) and
    (TCommon.StringToDT(edtqzbfqz.Text) - now < 0) then
    edtqzbfqz.Style.TextColor := clRed;
  if (Length(edtyxqz.Text) > 0) and (TCommon.StringToDT(edtyxqz.Text) - now < 0)
  then
    edtyxqz.Style.TextColor := clRed;
end;

procedure TFrameVioInput.UpdateDBVioStatus(systemid, bj: string;
  bz: string = '');
var
  Param: string;
  cmd: PCmd;
begin
  Param := 'SYSTEMID=' + systemid + '&BJ=' + bj + '&LRR=' + gUser.YHBH +
    '&GXSJ=' + formatDatetime('yyyy/mm/dd hh:nn:ss', now());
  if bz <> '' then
    Param := Param + '&BZ=' + bz;
  // TRequestItf.DbQuery('ModifyT_VIO_TEMP', Param);
  New(cmd);
  cmd^.Action := 'ModifyT_VIO_TEMP';
  cmd^.Param := Param;
  FcmdQueue.Push(cmd);
end;

function TFrameVioInput.SaveVio(): Boolean;
var
  Param: string;
  cmd: PCmd;
begin
  Result := False;
  if FObj = nil then
    exit;

  Param := 'CJJG=' + FObj.VioRecord.cjjg + '&HPHM=' + FObj.VehInfo.HPHM +
    '&HPZL=' + FObj.VehInfo.HPZL + '&SYXZ=' + FObj.VehInfo.syxz + '&WFXW=' +
    FObj.VioRecord.wfxw + '&WFDD=' + FObj.VioRecord.wfdd + '&WFSJ=' +
    formatDatetime('yyyy/mm/dd hh:nn:ss', FObj.VioRecord.wfsj) + '&XZSD=' +
    IntToStr(FObj.VioRecord.XZSD) + '&SJSD=' + IntToStr(FObj.VioRecord.SJSD) +
    '&CD=' + FObj.VioRecord.CD + '&FWQDZ=' + FObj.VioRecord.FWQDZ +
    '&PHOTOFILE1=' + FObj.VioRecord.PHOTOFILE1 + '&PHOTOFILE2=' +
    FObj.VioRecord.PHOTOFILE2 + '&PHOTOFILE3=' + FObj.VioRecord.PHOTOFILE3 +
    '&VIDEOFILE=' + FObj.VioRecord.VIDEOFILE + '&CSYS=' + FObj.VehInfo.csys +
    '&CLXH=' + FObj.VehInfo.clxh + '&CLPP1=' + FObj.VehInfo.clpp1 + '&CLPP2=' +
    FObj.VehInfo.clpp2 + '&CLLX=' + FObj.VehInfo.cllx + '&CLSBDH=' +
    FObj.VehInfo.clsbdh + '&FDJH=' + FObj.VehInfo.fdjh + '&SYR=' +
    FObj.VehInfo.syr + '&LXDH=' + FObj.VehInfo.lxdh + '&ZZXZQH=' +
    FObj.VehInfo.zzxzqh + '&ZZXXDZ=' + FObj.VehInfo.zzxxdz + '&ZSXZQH=' +
    FObj.VehInfo.zsxzqh + '&ZSXXDZ=' + FObj.VehInfo.zsxxdz + '&YZBM1=' +
    FObj.VehInfo.yzbm1 + '&YZBM2=' + FObj.VehInfo.yzbm2 + '&ZT=' +
    FObj.VioRecord.bj + '&CJMJ=' + gUser.YHBH + '&LRR=' + gUser.YHBH;

  // Result := StrToBool(TRequestItf.DbQuery('AddT_VIO_HIS', Param));

  New(cmd);
  cmd^.Action := 'AddT_VIO_HIS';
  cmd^.Param := Param;
  FcmdQueue.Push(cmd);
end;

procedure TFrameVioInput.SetSBBH(const Value: string);
begin
  FSBBH := Value;
  FWfdd := FSBBH;
end;

procedure TFrameVioInput.btnExitClick(Sender: TObject);
begin
  fSelectDev.Visible := False;
  dxLayoutControl1Group_Root.Visible := True;
  Application.ProcessMessages;
end;

procedure TFrameVioInput.btnLoadClick(Sender: TObject);
begin
  dxLayoutControl1Group_Root.Visible := False;
  fSelectDev.top := 20;
  fSelectDev.left := (self.Width - fSelectDev.Width) div 2;
  fSelectDev.ColWfxw.Visible := True;
  InitDevTb;
  ShowFrameWait;
  // TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetTempVioListTotal',
  // 'CJJG=' + gUser.DWDM), fSelectDev.tb, '', False);

  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetTempVioTotal',
    'CJJG=' + gUser.DWDM + '&IP=' + gClientIp), fSelectDev.tb, '', False);
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

procedure TFrameVioInput.btnP1Click(Sender: TObject);
begin
  if FObj = nil then
    exit;

  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_1.jpg');
  btnP1.Glyph := btnGreen.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioInput.btnP2Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_2.jpg');
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnGreen.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioInput.btnP3Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_3.jpg');
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnGreen.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioInput.UpdateVehFromEdit();
var
  Key: string;
begin
  if FObj = nil then
    exit;
  FObj.VehInfo.HPHM := RightStr(Trim(cbbsf.Text), 1) + Trim(edthphm.Text);
  FObj.VehInfo.HPZL := LeftStr(Trim(cbbhpzl.Text), 2);
  FObj.VehInfo.syxz := TLZDictionary.StrtoDicInfo(Trim(edtsyxz.Text)).dm;
  FObj.VioRecord.wfxw := TLZDictionary.StrtoDicInfo(Trim(cbbwfxw.Text)).dm;

  FObj.VioRecord.wfdd := '';
  for Key in TLZDictionary.gDicDev[2].Keys do
  begin
    if Trim(TLZDictionary.gDicDev[2][Key].SBDDMC) = Trim(cbbwfdd.Text) then
    begin
      FObj.VioRecord.wfdd := Key;
      break;
    end;
  end;

  FObj.VioRecord.wfsj := TCommon.StringToDT(dterq.Text + ' ' + edtsj.Text);
  FObj.VioRecord.XZSD := StrToInt(edtxs.Text);
  FObj.VioRecord.SJSD := StrToInt(edtcs.Text);
  FObj.VioRecord.CD := edtcd.Text;
  FObj.VehInfo.csys := TLZDictionary.StrtoDicInfo(Trim(edtcsys.Text)).dm;
  FObj.VehInfo.clxh := edtclxh.Text;
  FObj.VehInfo.clpp1 := edtclpp1.Text;
  FObj.VehInfo.clpp2 := '';
  FObj.VehInfo.cllx := TLZDictionary.StrtoDicInfo(Trim(edtcllx.Text)).dm;
  FObj.VehInfo.syr := edtsyr.Text;
  FObj.VehInfo.clsbdh := edtclsbdh.Text;
  FObj.VehInfo.fdjh := edtfdjh.Text;
  FObj.VehInfo.zsxxdz := mmozsxxdz.Text;
  if TLZDictionary.gDicDept.ContainsKey(gUser.DWDM) then
    FObj.VioRecord.bj := TLZDictionary.gDicDept[gUser.DWDM].SCMS
  else
    FObj.VioRecord.bj := '2';
end;

procedure TFrameVioInput.btnBlackClick(Sender: TObject);
var
  Param, bklx: string;
  cmd: PCmd;
begin
  if FObj = nil then
    exit;

  dxLayoutControl1Group_Root.Enabled := False;
  fBz.Visible := True;
  fBz.btnSave.SetFocus;
  fBz.top := (self.Height - fBz.Height) div 2;
  fBz.left := (self.Width - fBz.Width) div 2;
  if edtyxqz.Style.TextColor = clRed then
    fBz.cbbBz.Text := '04:逾期未年检车辆';
  if edtqzbfqz.Style.TextColor = clRed then
    fBz.cbbBz.Text := '05:逾期未报废车辆';
  if (Length(edtclsbdh.Text) = 0) or (Length(edtfdjh.Text) = 0) then
    fBz.cbbBz.Text := '03:假牌车辆';

  while fBz.Visible do
  begin
    Application.ProcessMessages;
    Sleep(100);
  end;

  if not FOK then
    exit;

  UpdateVehFromEdit();

  bklx := TLZDictionary.StrtoDicInfo(fBz.cbbBz.Text).dm;

  Param := 'BKXH=' + formatDatetime('yyyymmddhhnnsszzz', now()) + '&BKR=' +
    gUser.YHBH + '&HPHM=' + FObj.VehInfo.HPHM + '&HPZL=' + FObj.VehInfo.HPZL +
    '&BKJG=' + gUser.DWDM + '&BZ=' + fBz.cbbBz.Text + '&VioUrl=' +
    Trim(FObj.VioRecord.FWQDZ) + Trim(FObj.VioRecord.PHOTOFILE1) + '&ZT=0&BKLX='
    + bklx + '&BKZL=黑名单&CJJG=' + gUser.DWDM;
  // TRequestItf.DbQuery('AddT_KK_ALARM', Param);

  New(cmd);
  cmd^.Action := 'AddT_KK_ALARM';
  cmd^.Param := Param;
  FcmdQueue.Push(cmd);

  UpdateDBVioStatus(FObj.VioRecord.systemid, '5', fBz.cbbBz.Text);
  ObjDoned;
end;

procedure TFrameVioInput.btnDeleteClick(Sender: TObject);
begin
  if FObj = nil then
    exit;
  UpdateDBVioStatus(FObj.VioRecord.systemid, '4');
  ObjDoned;
end;

procedure TFrameVioInput.cxButton2Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  {
    if Length(edtclsbdh.Text) = 0 then
    begin
    Application.MessageBox('该信息不完整请认真核实', '提示', MB_OK + MB_ICONSTOP);
    exit;
    end;
  }
  if edtqzbfqz.Style.TextColor = clRed then
  begin
    Application.MessageBox('该该车达到报废期', '提示', MB_OK + MB_ICONSTOP);
    exit;
  end;

  if Application.MessageBox('是否提交数据，请确认', '提示',
    MB_OKCANCEL + MB_ICONINFORMATION) = IDOK then
  begin
    UpdateVehFromEdit();
    // if FObj.VioRecord.wfxw = '13441' then
    // FObj.VioRecord.bj := '20';
    if (gUser.FH <> '') and StrToBool(gUser.FH) then
      FObj.VioRecord.bj := '9'
    else if (gUser.SH <> '') and StrToBool(gUser.SH) then
      FObj.VioRecord.bj := '29';

    try
      if TLZDictionary.gDicDev[2].ContainsKey(FObj.VioRecord.wfdd) then
        if TLZDictionary.gDicDev[2][FObj.VioRecord.wfdd].AddSY then
          AddSY(FObj);
      SaveVio();
      UpdateDBVioStatus(FObj.VioRecord.systemid, FObj.VioRecord.bj);
    except
      on e: exception do
      begin
        Application.MessageBox(pchar(e.Message + #13 + FObj.VioRecord.systemid),
          'updatedata');
      end;
    end;
    ObjDoned;
  end;
end;

procedure TFrameVioInput.dxLayoutGroup8Collapsed(Sender: TObject);
begin
  img1.Height := 260;
end;

procedure TFrameVioInput.dxLayoutGroup8Expanded(Sender: TObject);
begin
  img1.Height := 180;
end;

procedure TFrameVioInput.cbbsfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edthphm.SetFocus;
end;

procedure TFrameVioInput.cbbsfMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbsf.SelectAll;
end;

procedure TFrameVioInput.cbbwfxwMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbwfxw.SelectAll;
end;

procedure TFrameVioInput.cbbhpzlKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    btnSave.SetFocus;
  end;
end;

procedure TFrameVioInput.cbbhpzlMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbhpzl.SelectAll;
end;

procedure TFrameVioInput.edthphmKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    cbbhpzl.SetFocus;
  end;
end;

procedure TFrameVioInput.fBzbtnExitClick(Sender: TObject);
begin
  FOK := False;
  fBz.Visible := False;
  dxLayoutControl1Group_Root.Enabled := True;
end;

procedure TFrameVioInput.fBzbtnSaveClick(Sender: TObject);
begin
  FOK := True;
  fBz.Visible := False;
  dxLayoutControl1Group_Root.Enabled := True;
end;

procedure TFrameVioInput.ShowFrameWait;
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

procedure TFrameVioInput.ShowVioPicture(picFile: string);
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

procedure TFrameVioInput.tbVioAfterDelete(DataSet: TDataSet);
begin
  tbVio.AfterScroll := tbVioAfterScroll;
end;

procedure TFrameVioInput.tbVioAfterScroll(DataSet: TDataSet);
var
  i: Integer;
begin
  FObj := nil;
  if tbVio.RecordCount = 0 then
  begin
    while FcmdQueue.PushIndex <> FcmdQueue.PopIndex do
    begin
      Sleep(300);
      Application.ProcessMessages;
    end;
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

procedure TFrameVioInput.tbVioBeforeDelete(DataSet: TDataSet);
begin
  tbVio.AfterScroll := nil;
end;

procedure TFrameVioInput.Timer1Timer(Sender: TObject);
var
  cmd: PCmd;
begin
  Timer1.Enabled := False;
  cmd := FcmdQueue.Pop;
  if cmd <> nil then
  begin
    try
      if cmd^.Action <> '' then
        TRequestItf.DbQuery(cmd^.Action, cmd^.Param);
      Dispose(cmd);
    except
    end;
  end;
  Timer1.Enabled := True;
end;

procedure TFrameVioInput.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  btnLoadClick(nil);
end;

end.
