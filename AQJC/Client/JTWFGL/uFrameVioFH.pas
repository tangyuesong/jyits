unit uFrameVioFH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, dxCore,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxClasses, StdCtrls,
  ExtCtrls, dxNavBar, cxGroupBox, dxNavBarBase, dxNavBarCollns, cxTrackBar,
  cxLabel, dxGalleryControl, dxGallery, dxGDIPlusClasses, cxImage, dxGDIPlusAPI,
  dxRatingControl, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  uGlobal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uCommon, uDictionary, uEntity,
  StrUtils, uVioThread,
  System.Generics.Collections, uFrameBz, hyieutils, iexBitmaps, hyiedefs,
  iesettings, iexRulers, System.Contnrs, imageenview, ieview, ievect,
  Vcl.Imaging.jpeg, uLookUpDataSource, sfContnrs, Soap.EncdDecd, uFrameWait;

type
  TFrameVioFH = class(TFrame)
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
    edtclpp2: TcxTextEdit;
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
    procedure cbbsfMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbbwfxwMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbbhpzlMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbVioAfterScroll(DataSet: TDataSet);
    procedure tbVioBeforeDelete(DataSet: TDataSet);
    procedure tbVioAfterDelete(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    FFrameWait: TFrameWait;
    FcmdQueue: TsfQueue;
    FFrameID: String;
    fdbool, FOK, fz: Boolean;
    FPicFile: String;
    isfms: Integer;
    FObj: TVio;
    FWfdd: String;
    // FVioIndex: Integer;
    FVioThread: TVioThread;
    FVioList: TList<TVio>;
    procedure LoadVioList();
    procedure FillControl();
    procedure InitDevTb();
    procedure InitControl();
    procedure LoadVehInfo(veh: TVehInfo);
    procedure UpdateColor(veh: TVehInfo);
    procedure ClearVioList;
    procedure UpdateVehFromEdit();
    procedure UpdateDBVioStatus(systemid, bj: String; bz: String = '');
    procedure ShowVioPicture(picFile: string);
    procedure ObjDoned();
    procedure ClearQueue;
    procedure ShowFrameWait();
    procedure FreeFrameWait();
  public
    property FrameID: String read FFrameID write FFrameID;
  end;

implementation

{$R *.dfm}

procedure TFrameVioFH.AfterConstruction;
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
    lgGrid.AlignVert := avClient;
    lgImage.AlignVert := avBottom;
    lgInfo.AlignVert := avBottom;
  end;

  FVioThread := TVioThread.Create;
  FVioList := TList<TVio>.Create;

  TLZDictionary.BindComboboxDEVEx(cbbwfdd, False);
  TLZDictionary.BindComboboxWFXW(cbbwfxw, True);
  TLZDictionary.BindCombobox(cbbsf, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
  if TLookUpDataSource.DataSource.ContainsKey('HPZL') then
    TColumnGenerator.LookupColumn(tvDev.Columns[1],
      TLookUpDataSource.DataSource['HPZL']);
  FcmdQueue := TsfQueue.Create;
  Timer1.Enabled := True;
end;

procedure TFrameVioFH.BeforeDestruction;
begin
  inherited;
  ClearVioList;
  FVioThread.Stop;
  Timer1.Enabled := False;
  ClearQueue;
end;

procedure TFrameVioFH.ClearQueue;
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

procedure TFrameVioFH.ClearVioList;
var
  vio: TVio;
begin
  for vio in FVioList do
    vio.Deleted := True;
  FVioList.Clear;
end;

procedure TFrameVioFH.InitControl;
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
  edtclpp2.Text := '';
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

procedure TFrameVioFH.InitDevTb;
begin
  fSelectDev.tb.Close;
  fSelectDev.tb.FieldDefs.Clear;
  fSelectDev.tb.IndexDefs.Clear;
  fSelectDev.tb.FieldDefs.Add('bj', ftBoolean);
  fSelectDev.tb.FieldDefs.Add('WFDD', ftString, 100);
  fSelectDev.tb.FieldDefs.Add('SBDDMC', ftString, 100);
  fSelectDev.tb.FieldDefs.Add('C1', ftInteger);
  fSelectDev.tb.IndexDefs.Add('index', 'WFDD', [ixPrimary]);
  fSelectDev.tb.IndexName := 'index';
end;

procedure TFrameVioFH.btnSaveClick(Sender: TObject);
var
  tmpWfdd: String;
begin
  FWfdd := '';
  tmpWfdd := '';
  if not fSelectDev.tb.Active then
    exit;
  fSelectDev.tb.DisableControls;
  fSelectDev.tb.First;
  while not fSelectDev.tb.eof do
  begin
    tmpWfdd := tmpWfdd + fSelectDev.tb.FieldByName('WFDD').AsString + ',';
    if fSelectDev.tb.FieldByName('bj').AsBoolean then
      FWfdd := FWfdd + fSelectDev.tb.FieldByName('WFDD').AsString + ',';
    fSelectDev.tb.Next;
  end;
  fSelectDev.tb.EnableControls;
  if FWfdd <> '' then
    FWfdd := Copy(FWfdd, 1, Length(FWfdd) - 1)
  else
    FWfdd := Copy(tmpWfdd, 1, Length(tmpWfdd) - 1);
  LoadVioList();
  btnExitClick(nil);
end;

procedure TFrameVioFH.btnVideoClick(Sender: TObject);
begin
  if FObj = nil then
    exit;

  ShowVioPicture(gSetup.DirSave + '\' + FObj.VioRecord.VIDEOFILE);
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnGreen.Glyph;
end;

procedure TFrameVioFH.LoadVioList;
var
  Param, s: String;
  vio: TVio;
begin
  tbVio.Close;
  InitControl();
  FObj := nil;
  ClearVioList;
  Param := 'count=30&ip=' + gClientIp;
  if FWfdd <> '' then
    Param := Param + '&wfdd=' + FWfdd;
  s := TRequestItf.DbQuery('GetFHHisVioList', Param);
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
      vio.VioRecord.hphm := tbVio.FieldByName('HPHM').AsString;
      vio.VioRecord.hpzl := tbVio.FieldByName('HPZL').AsString;
      vio.VioRecord.WFSJ := TCommon.StringToDT(tbVio.FieldByName('wfsj')
        .AsString);
      vio.VioRecord.wfxw := tbVio.FieldByName('wfxw').AsString;
      vio.VioRecord.CD := tbVio.FieldByName('cd').AsString;
      vio.VioRecord.SJSD := tbVio.FieldByName('sjsd').AsInteger;
      vio.VioRecord.WFDD := tbVio.FieldByName('WFDD').AsString;
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
end;

procedure TFrameVioFH.ObjDoned;
begin
  FObj.Doned := True;
  if not tbVio.eof then
    tbVio.Delete;
end;

procedure TFrameVioFH.FillControl;
var
  hphm, FWQDZ, tp: String;
  i: Integer;
begin
  InitControl;
  cbbwfdd.Text := FObj.VioRecord.WFDD;
  if TLZDictionary.gDicDev[2].ContainsKey(FObj.VioRecord.WFDD) then
    cbbwfdd.Text := TLZDictionary.gDicDev[2][FObj.VioRecord.WFDD].SBDDMC;
  dterq.Text := FormatDatetime('yyyy/mm/dd', FObj.VioRecord.WFSJ);
  edtsj.Text := FormatDatetime('hh:nn:ss', FObj.VioRecord.WFSJ);
  cbbwfxw.Text := FObj.VioRecord.wfxw;
  if TLZDictionary.gDicWfxw.ContainsKey(FObj.VioRecord.wfxw) then
    cbbwfxw.Text := cbbwfxw.Text + ':' + TLZDictionary.gDicWfxw
      [FObj.VioRecord.wfxw].WFXWMC;
  hphm := FObj.VioRecord.hphm;
  if hphm <> '' then
  begin
    cbbsf.Text := hphm[1];
    for i := 0 to cbbsf.Properties.Items.Count - 1 do
    begin
      if pos(hphm[1], cbbsf.Properties.Items[i]) > 0 then
      begin
        cbbsf.ItemIndex := i;
        break;
      end;
    end;
    edthphm.Text := Copy(hphm, 2, 100);
  end
  else
    cbbsf.Text := '44:粤';
  cbbhpzl.Text := FObj.VioRecord.hpzl;
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(FObj.VioRecord.hpzl) then
    cbbhpzl.Text := cbbhpzl.Text + ':' + TLZDictionary.gDicMain['HPZL']
      [FObj.VioRecord.hpzl];
  edtcd.Text := FObj.VioRecord.CD;
  edtxs.Text := FObj.VioRecord.XZSD.ToString;
  edtcs.Text := FObj.VioRecord.SJSD.ToString;

  if not FObj.DoneVehInfo then
  begin
    FObj.VehInfo := TCommon.GetVehInfo(FObj.VioRecord.hphm,
      FObj.VioRecord.hpzl, '');
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

procedure TFrameVioFH.FreeFrameWait;
begin
  if Assigned(FFrameWait) then
    FFrameWait.Visible := False;
end;

procedure TFrameVioFH.imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TFrameVioFH.imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TFrameVioFH.LoadVehInfo(veh: TVehInfo);
var
  hphm, hpzl, color: String;
  i: Integer;
begin
  if veh.code <> '1' then
  begin
    hphm := RightStr(Trim(cbbsf.Text), 1) + Trim(edthphm.Text);
    hpzl := LeftStr(Trim(cbbhpzl.Text), 2);
    veh := TCommon.GetVehInfo(hphm, hpzl, '');
  end;
  edtsyr.Text := veh.syr;
  edtclpp1.Text := veh.clpp1;
  edtclpp2.Text := veh.clpp2;
  edtclxh.Text := veh.clxh;
  if TLZDictionary.gDicMain['CLLX'].ContainsKey(veh.cllx) then
    edtcllx.Text := veh.cllx + ':' + TLZDictionary.gDicMain['CLLX'][veh.cllx]
  else
    edtcllx.Text := veh.cllx;

  color := '';
  for i := 1 to Length(veh.csys) do
  begin
    if TLZDictionary.gDicMain['CSYS'].ContainsKey(veh.csys[i]) then
      color := color + TLZDictionary.gDicMain['CSYS'][veh.csys[i]];
  end;
  edtcsys.Text := veh.csys;
  if color <> '' then
    edtcsys.Text := edtcsys.Text + ':' + color;

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

procedure TFrameVioFH.UpdateColor(veh: TVehInfo);
var
  defaultColor: TColor;
  defaultTextColor: TColor;
  hphm, hpzl: String;
begin
  hphm := RightStr(Trim(cbbsf.Text), 1) + Trim(edthphm.Text);
  hpzl := LeftStr(Trim(cbbhpzl.Text), 2);
  defaultColor := clWindow;
  defaultTextColor := clWindowText;
  edthphm.Style.color := defaultColor;
  edtqzbfqz.Style.TextColor := defaultTextColor;
  edtyxqz.Style.TextColor := defaultTextColor;
  if tbVio.FieldByName('WFXW').AsString = '13441' then
  begin
    edthphm.Style.color := clRed;
    if TLZDictionary.gDicHBC.ContainsKey(hphm + hpzl) then
    begin
      edthphm.Style.color := clYellow;
    end;
  end;
  if (Length(edtqzbfqz.Text) > 0) and
    (TCommon.StringToDT(edtqzbfqz.Text) - now < 0) then
    edtqzbfqz.Style.TextColor := clRed;
  if (Length(edtyxqz.Text) > 0) and (TCommon.StringToDT(edtyxqz.Text) - now < 0)
  then
    edtyxqz.Style.TextColor := clRed;
end;

procedure TFrameVioFH.UpdateDBVioStatus(systemid, bj: String; bz: String = '');
var
  Param: String;
  cmd: PCmd;
begin
  Param := 'SYSTEMID=' + systemid + '&ZT=' + bj + '&FHR=' + gUser.YHBH +
    '&GXSJ=' + FormatDatetime('yyyy/mm/dd hh:nn:ss', now());
  if bz <> '' then
    Param := Param + '&BZ=' + bz;
  // TRequestItf.DbQuery('ModifyT_VIO_HIS', Param);
  New(cmd);
  cmd^.Action := 'ModifyT_VIO_HIS';
  cmd^.Param := Param;
  FcmdQueue.Push(cmd);
end;

procedure TFrameVioFH.btnExitClick(Sender: TObject);
begin
  fSelectDev.Visible := False;
  dxLayoutControl1Group_Root.Visible := True;
  Application.ProcessMessages;
end;

procedure TFrameVioFH.btnLoadClick(Sender: TObject);
var
  json: String;
begin
  ShowFrameWait;
  dxLayoutControl1Group_Root.Visible := False;
  fSelectDev.Visible := True;
  fSelectDev.top := 20;
  fSelectDev.left := (self.Width - fSelectDev.Width) div 2;
  InitDevTb;
  Application.ProcessMessages;
  json := TRequestItf.DbQuery('GetHisVioListTotalByFH', '');
  if json = '' then
  begin
    FreeFrameWait;
    exit;
  end;
  TJsonUtils.JSONToDataSet(json, fSelectDev.tb, '', False);
  if not fSelectDev.tb.Active then
  begin
    FreeFrameWait;
    exit;
  end;
  fSelectDev.tb.DisableControls;
  fSelectDev.tb.First;
  while not fSelectDev.tb.eof do
  begin
    if (not TLZDictionary.gDicDev[1].ContainsKey(fSelectDev.tb.FieldByName
      ('WFDD').AsString)) then
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

procedure TFrameVioFH.btnP1Click(Sender: TObject);
begin
  if FObj = nil then
    exit;

  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_1.jpg');
  btnP1.Glyph := btnGreen.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioFH.btnP2Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_2.jpg');
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnGreen.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioFH.btnP3Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_3.jpg');
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnGreen.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioFH.UpdateVehFromEdit();
var
  Key: String;
begin
  if FObj = nil then
    exit;
  FObj.VehInfo.hphm := RightStr(Trim(cbbsf.Text), 1) + Trim(edthphm.Text);
  FObj.VehInfo.hpzl := LeftStr(Trim(cbbhpzl.Text), 2);
  if pos(':', edtsyxz.Text) > 1 then
    FObj.VehInfo.syxz := Copy(edtsyxz.Text, 1, pos(':', edtsyxz.Text) - 1)
  else
    FObj.VehInfo.syxz := edtsyxz.Text;
  if pos(':', Trim(cbbwfxw.Text)) > 1 then
    FObj.VioRecord.wfxw := Copy(Trim(cbbwfxw.Text), 1,
      pos(':', Trim(cbbwfxw.Text)) - 1)
  else
    FObj.VioRecord.wfxw := Trim(cbbwfxw.Text);

  FObj.VioRecord.WFDD := '';
  for Key in TLZDictionary.gDicDev[2].Keys do
  begin
    if Trim(TLZDictionary.gDicDev[2][Key].SBDDMC) = Trim(cbbwfdd.Text) then
    begin
      FObj.VioRecord.WFDD := Key;
      break;
    end;
  end;

  FObj.VioRecord.WFSJ := TCommon.StringToDT(dterq.Text + ' ' + edtsj.Text);
  FObj.VioRecord.XZSD := StrToInt(edtxs.Text);
  FObj.VioRecord.SJSD := StrToInt(edtcs.Text);
  FObj.VioRecord.CD := edtcd.Text;
  if pos(':', edtcsys.Text) > 1 then
    FObj.VehInfo.csys := Copy(edtcsys.Text, 1, pos(':', edtcsys.Text) - 1)
  else
    FObj.VehInfo.csys := edtcsys.Text;
  FObj.VehInfo.clxh := edtclxh.Text;
  FObj.VehInfo.clpp1 := edtclpp1.Text;
  FObj.VehInfo.clpp2 := edtclpp2.Text;
  if pos(':', edtcllx.Text) > 1 then
    FObj.VehInfo.cllx := Copy(edtcllx.Text, 1, pos(':', edtcllx.Text) - 1)
  else
    FObj.VehInfo.cllx := edtcllx.Text;
  FObj.VehInfo.syr := edtsyr.Text;
  FObj.VehInfo.clsbdh := edtclsbdh.Text;
  FObj.VehInfo.fdjh := edtfdjh.Text;
  FObj.VehInfo.zsxxdz := mmozsxxdz.Text;
  if TLZDictionary.gDicDept.ContainsKey(gUser.DWDM) then
    FObj.VioRecord.bj := TLZDictionary.gDicDept[gUser.DWDM].SCMS
  else
    FObj.VioRecord.bj := '2';
end;

procedure TFrameVioFH.btnBlackClick(Sender: TObject);
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

  bklx := TLZDictionary.StrtoDicInfo(fBz.cbbBz.Text).dm;

  Param := 'BKXH=' + FormatDatetime('yyyymmddhhnnsszzz', now()) + '&BKR=' +
    gUser.YHBH + '&HPHM=' + FObj.VioRecord.hphm + '&HPZL=' + FObj.VioRecord.hpzl
    + '&BKJG=' + gUser.DWDM + '&BZ=' + fBz.cbbBz.Text + '&Encode_VioUrl=' +
    EncodeString(Trim(FObj.VioRecord.FWQDZ) + Trim(FObj.VioRecord.PHOTOFILE1)) +
    '&ZT=0&BKLX=' + bklx + '&BKZL=手动布控&CJJG=' + gUser.DWDM;
  // TRequestItf.DbQuery('AddT_KK_Alarm', Param);

  New(cmd);
  cmd^.Action := 'AddT_KK_ALARM';
  cmd^.Param := Param;
  FcmdQueue.Push(cmd);

  UpdateDBVioStatus(FObj.VioRecord.systemid, '5', fBz.cbbBz.Text);
  ObjDoned;
end;

procedure TFrameVioFH.btnDeleteClick(Sender: TObject);
begin
  if FObj = nil then
    exit;
  UpdateDBVioStatus(FObj.VioRecord.systemid, '44');
  ObjDoned;
end;

procedure TFrameVioFH.cxButton2Click(Sender: TObject);
begin
  if FObj = nil then
    exit;

  if Length(edtclsbdh.Text) = 0 then
  begin
    Application.MessageBox('该信息不完整请认真核实', '提示', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if edtqzbfqz.Style.TextColor = clRed then
  begin
    Application.MessageBox('该该车达到报废期', '提示', MB_OK + MB_ICONSTOP);
    exit;
  end;

  if Application.MessageBox('是否提交数据，请确认', '提示',
    MB_OKCANCEL + MB_ICONINFORMATION) = IDOK then
  begin
    UpdateVehFromEdit();
    if FObj.VioRecord.wfxw = '13441' then
      FObj.VioRecord.bj := '20';

    try
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

procedure TFrameVioFH.dxLayoutGroup8Collapsed(Sender: TObject);
begin
  img1.Height := 260;
end;

procedure TFrameVioFH.dxLayoutGroup8Expanded(Sender: TObject);
begin
  img1.Height := 180;
end;

procedure TFrameVioFH.cbbsfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edthphm.SetFocus;
end;

procedure TFrameVioFH.cbbsfMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbsf.SelectAll;
end;

procedure TFrameVioFH.cbbwfxwMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbwfxw.SelectAll;
end;

procedure TFrameVioFH.cbbhpzlKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    btnSave.SetFocus;
  end;
end;

procedure TFrameVioFH.cbbhpzlMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbhpzl.SelectAll;
end;

procedure TFrameVioFH.edthphmKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    cbbhpzl.SetFocus;
  end;
end;

procedure TFrameVioFH.fBzbtnExitClick(Sender: TObject);
begin
  FOK := False;
  fBz.Visible := False;
  dxLayoutControl1Group_Root.Enabled := True;
end;

procedure TFrameVioFH.fBzbtnSaveClick(Sender: TObject);
begin
  FOK := True;
  fBz.Visible := False;
  dxLayoutControl1Group_Root.Enabled := True;
end;

procedure TFrameVioFH.ShowFrameWait;
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

procedure TFrameVioFH.ShowVioPicture(picFile: string);
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

procedure TFrameVioFH.tbVioAfterDelete(DataSet: TDataSet);
begin
  tbVio.AfterScroll := tbVioAfterScroll;
end;

procedure TFrameVioFH.tbVioAfterScroll(DataSet: TDataSet);
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

procedure TFrameVioFH.tbVioBeforeDelete(DataSet: TDataSet);
begin
  tbVio.AfterScroll := nil;
end;

procedure TFrameVioFH.Timer1Timer(Sender: TObject);
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

procedure TFrameVioFH.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  btnLoadClick(nil);
end;

end.
