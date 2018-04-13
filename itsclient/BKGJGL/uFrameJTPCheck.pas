unit uFrameJTPCheck;

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
  StrUtils, uVioThread, uFrameInput,
  System.Generics.Collections, uFrameBz, hyieutils, iexBitmaps, hyiedefs,
  iesettings, iexRulers, System.Contnrs, imageenview, ieview, ievect,
  Vcl.Imaging.jpeg, uLookUpDataSource, sfContnrs, uFrameWait;

type
  TFrameJTPCheck = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    lgInfo: TdxLayoutGroup;
    liButton: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem19: TdxLayoutItem;
    btnDelete: TcxButton;
    btnNext: TcxButton;
    cbbhpzl: TcxComboBox;
    edtclpp: TcxTextEdit;
    edthphm: TcxTextEdit;
    cxImageList1: TcxImageList;
    dxLayoutItem5: TdxLayoutItem;
    tbVio: TFDMemTable;
    liVioTb: TdxLayoutItem;
    cxGrid1: TcxGrid;
    tvDev: TcxGridDBTableView;
    tvDevColumn2: TcxGridDBColumn;
    tvDevColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSource1: TDataSource;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    imgviopic: TImageEnVect;
    cbbCllx: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    cbbCsys: TcxComboBox;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    btnSearch: TcxButton;
    txtCLPP: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    cboCSYS: TcxComboBox;
    dxLayoutGroup1: TdxLayoutGroup;
    tvDevColumn1: TcxGridDBColumn;
    tvDevColumn4: TcxGridDBColumn;
    dxLayoutItem11: TdxLayoutItem;
    txtHPHM: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    dtDateBegin: TcxDateEdit;
    dtDateEnd: TcxDateEdit;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    cboType: TcxComboBox;
    dxLayoutItem17: TdxLayoutItem;
    edtHPHM1: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    cbbHPZL1: TcxComboBox;
    dxLayoutItem20: TdxLayoutItem;
    cbbCLLX1: TcxComboBox;
    dxLayoutItem21: TdxLayoutItem;
    edtCLPP1: TcxTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    cbbCSYS1: TcxComboBox;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    cboSF: TcxComboBox;
    dxLayoutItem2: TdxLayoutItem;
    btnSJ: TcxButton;
    procedure AfterConstruction; override;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure tvDevFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnSJClick(Sender: TObject);
  private
    FFrameWait: TFrameWait;
    FFrameInput: TFrameInput;
    FPicFile: String;
    isfms: Integer;
    procedure LoadData;
    procedure FillControl();
    procedure InitControl();
    procedure LoadVehInfo;
    procedure ShowVioPicture(picFile: string);
    procedure ShowFrameWait();
    procedure FreeFrameWait();
    procedure FrameInputbtnSaveClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

procedure TFrameJTPCheck.AfterConstruction;
begin
  inherited;
  imgviopic.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');

  TLZDictionary.BindCombobox(cboSF, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
  TLZDictionary.BindCombobox(cbbCllx, TLZDictionary.gDicMain['CLLX'], True);
  TLZDictionary.BindCombobox(cbbCsys, TLZDictionary.gDicMain['CSYS'], True);
  TLZDictionary.BindCombobox(cboCsys, TLZDictionary.gDicMain['CSYS'], True);

  if TLookUpDataSource.DataSource.ContainsKey('HPZL') then
    TColumnGenerator.LookupColumn(tvDev.Columns[1],
      TLookUpDataSource.DataSource['HPZL']);
  if TLookUpDataSource.DataSource.ContainsKey('CSYS') then
    TColumnGenerator.LookupColumn(tvDev.Columns[3],
      TLookUpDataSource.DataSource['CSYS']);

  dtDateBegin.Text := FormatDateTime('yyyy/mm/dd', now - 1);
  dtDateEnd.Text := FormatDateTime('yyyy/mm/dd', now);
end;

procedure TFrameJTPCheck.InitControl;
begin
  edthphm.Text := '';
  cbbhpzl.Text := '';
  edtclpp.Text := '';
  cbbCllx.Text := '';
  cbbCsys.Text := '';
  //cbbBklx.Text := '';

  edthphm1.Text := '';
  cbbhpzl1.Text := '';
  edtclpp1.Text := '';
  cbbCllx1.Text := '';
  cbbCsys1.Text := '';

  imgviopic.Clear;
end;

procedure TFrameJTPCheck.LoadData;
var
  Param, s, url: String;
  vio: TVio;
begin
  ShowFrameWait;
  InitControl;
  Param := 'hphm=' + copy(cboSF.Text, 4, 2) + txtHPHM.Text + '&clpp=' + txtCLPP.Text + '&csys=' + cboCSYS.Text
    + '&beginGXSJ='+FormatDateTime('yyyy/mm/dd', dtDateBegin.Date)
    + '&endGXSJ='+FormatDateTime('yyyy/mm/dd', dtDateEnd.Date + 1)
    + '&bklx=' + copy(cboType.Text, 1, 2);
  s := TRequestItf.DbQuery('GetKKAlarmCheckJTP', Param);
  TJsonUtils.JSONToDataSet(s, tbVio, '');
  //FillControl;
  FreeFrameWait;
end;

procedure TFrameJTPCheck.FillControl;
var
  tp, hpzl, csys: String;
  i: Integer;
begin
  InitControl;

  edthphm.Text := tbVio.FieldByName('HPHM').AsString;
  hpzl := tbVio.FieldByName('HPZL').AsString;
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(hpzl) then
    cbbhpzl.Text := hpzl + ':' + TLZDictionary.gDicMain['HPZL'][hpzl]
  else
    cbbhpzl.Text := hpzl;

  cbbCLLX.Text := tbVio.FieldByName('CLLX').AsString;
  edtCLPP.Text := tbVio.FieldByName('CLPP').AsString;

  csys := tbVio.FieldByName('CSYS').AsString;
  if TLZDictionary.gDicMain['CSYS'].ContainsKey(csys) then
    cbbCSYS.Text := csys + ':' + TLZDictionary.gDicMain['CSYS'][csys]
  else
    cbbcsys.Text := csys;

  LoadVehInfo;

  tp := tbVio.FieldByName('VioUrl').AsString;
  if TCommon.GetPic('', tp, gSetup.DirSave + '\' + edthphm.Text + '_1.jpg') then
  begin
    if FileExists(gSetup.DirSave + '\' + edthphm.Text + '_1.jpg') then
      ShowVioPicture(gSetup.DirSave + '\' + edthphm.Text + '_1.jpg');
  end;
end;

procedure TFrameJTPCheck.FreeFrameWait;
begin
  if Assigned(FFrameWait) then
    FFrameWait.Visible := False;
end;

procedure TFrameJTPCheck.LoadVehInfo;
var
  hphm, hpzl, color: String;
  i: Integer;
  veh: TVehInfo;
begin
  hphm := Trim(edthphm.Text);
  hpzl := LeftStr(Trim(cbbhpzl.Text), 2);
  veh := TCommon.GetVehInfo(hphm, hpzl, '');
  edtHPHM1.Text := edtHPHM.Text;
  cbbHPZL1.Text := cbbHPZL.Text;
  if TLZDictionary.gDicMain['CLLX'].ContainsKey(veh.cllx) then
    cbbCllx1.Text := veh.cllx + ':' + TLZDictionary.gDicMain['CLLX'][veh.cllx]
  else
    cbbCllx1.Text := veh.cllx;
  edtclpp1.Text := veh.clpp1;

  color := '';
  for i := 1 to length(veh.csys) do
  begin
    if TLZDictionary.gDicMain['CSYS'].ContainsKey(veh.csys[i]) then
      color := color + TLZDictionary.gDicMain['CSYS'][veh.csys[i]];
  end;
  cbbCsys1.Text := veh.csys + ':' + color;
end;

procedure TFrameJTPCheck.btnSearchClick(Sender: TObject);
begin
  LoadData;
end;

procedure TFrameJTPCheck.btnSJClick(Sender: TObject);
begin
  if not tbVio.Eof then exit;
  if not Assigned(FFrameInput) then
  begin
    FFrameInput := TFrameInput.Create(self);
    FFrameInput.Parent := self;
    FFrameInput.Top := (self.Height - FFrameInput.Height) div 2;
    FFrameInput.Left := (self.Width - FFrameInput.Width) div 2;
    FFrameInput.btnSave.OnClick := self.FrameInputbtnSaveClick;
    FFrameInput.btnExit.OnClick := self.FrameInputbtnSaveClick;
  end;
  dxLayoutControl1Group_Root.Visible := false;
  FFrameInput.Show;
end;

procedure TFrameJTPCheck.FrameInputbtnSaveClick(Sender: TObject);
var
  sjhm: string;
begin
  dxLayoutControl1Group_Root.Visible := true;
  if Sender = FFrameInput.btnSave then
  begin
    SJHM := FFrameInput.edtCZSJ.Text;
    TRequestItf.DbQuery('ModifyT_KK_ALARM', 'systemid=' + tbVio.FieldByName('SYSTEMID').AsString + '&IsCheck=1&SJHM='+SJHM);
    tbVio.Delete;
  end;
  FFrameInput.Hide;
end;

procedure TFrameJTPCheck.btnNextClick(Sender: TObject);
begin
  if not tbVio.Eof then
  begin
    TRequestItf.DbQuery('ModifyT_KK_ALARM', 'systemid=' + tbVio.FieldByName('SYSTEMID').AsString + '&IsCheck=1');
    tbVio.Delete;
  end;
  //FillControl;
end;

procedure TFrameJTPCheck.btnDeleteClick(Sender: TObject);
begin
  if not tbVio.Eof then
  begin
    TRequestItf.DbQuery('ModifyT_KK_ALARM', 'systemid=' + tbVio.FieldByName('SYSTEMID').AsString + '&zt=2&IsCheck=1');
    tbVio.Delete;
  end;
  //FillControl;
end;

procedure TFrameJTPCheck.ShowFrameWait;
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

procedure TFrameJTPCheck.ShowVioPicture(picFile: string);
begin
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

procedure TFrameJTPCheck.tvDevFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  FillControl;
end;

end.
