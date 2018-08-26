unit uFrameBlackCheck;

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
  Vcl.Imaging.jpeg, uLookUpDataSource, sfContnrs, uFrameWait;

type
  TFrameBlackCheck = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    lgInfo: TdxLayoutGroup;
    liButton: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutSplitterItem3: TdxLayoutSplitterItem;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutItem23: TdxLayoutItem;
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
    btnDelete: TcxButton;
    btnSave: TcxButton;
    cbbhpzl: TcxComboBox;
    cbbsf: TcxComboBox;
    edtccdjrq: TcxTextEdit;
    edtclpp1: TcxTextEdit;
    edtclpp2: TcxTextEdit;
    edtclxh: TcxTextEdit;
    edthphm: TcxTextEdit;
    edtqzbfqz: TcxTextEdit;
    edtsyr: TcxTextEdit;
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
    tbVio: TFDMemTable;
    lgGrid: TdxLayoutGroup;
    lgImage: TdxLayoutGroup;
    liVioTb: TdxLayoutItem;
    cxGrid1: TcxGrid;
    tvDev: TcxGridDBTableView;
    tvDevColumn2: TcxGridDBColumn;
    tvDevColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSource1: TDataSource;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    imgviopic: TImageEnVect;
    img1: TImageEnView;
    edtBkzl: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbBklx: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    cbbCllx: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    cbbCsys: TcxComboBox;
    dxLayoutItem7: TdxLayoutItem;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure btnDeleteClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edthphmKeyPress(Sender: TObject; var Key: Char);
    procedure tbVioAfterDelete(DataSet: TDataSet);
    procedure tbVioAfterScroll(DataSet: TDataSet);
    procedure tbVioBeforeDelete(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    FFrameWait: TFrameWait;
    FcmdQueue: TsfQueue;
    fdbool, FOK: Boolean;
    FPicFile: String;
    isfms: Integer;
    FObj: TVio;
    FWfdd: String;
    FVioThread: TVioThread;
    FVioList: TList<TVio>;
    procedure LoadVioList();
    procedure FillControl();
    procedure InitControl();
    procedure LoadVehInfo(veh: TVehInfo);
    procedure UpdateColor(veh: TVehInfo);
    procedure ClearVioList;
    function SaveVio(): Boolean;
    procedure ShowVioPicture(picFile: string);
    procedure ObjDoned();
    procedure ClearQueue;
    procedure ShowFrameWait();
    procedure FreeFrameWait();
  public
  end;

implementation

{$R *.dfm}

procedure TFrameBlackCheck.AfterConstruction;
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

  TLZDictionary.BindCombobox(cbbBklx, TLZDictionary.gDicMain['BKLX'], True);
  TLZDictionary.BindCombobox(cbbsf, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
  TLZDictionary.BindCombobox(cbbCllx, TLZDictionary.gDicMain['CLLX'], True);
  TLZDictionary.BindCombobox(cbbCsys, TLZDictionary.gDicMain['CSYS'], True);

  if TLookUpDataSource.DataSource.ContainsKey('HPZL') then
    TColumnGenerator.LookupColumn(tvDev.Columns[1],
      TLookUpDataSource.DataSource['HPZL']);

  FcmdQueue := TsfQueue.Create;
  Timer1.Enabled := True;
end;

procedure TFrameBlackCheck.BeforeDestruction;
begin
  inherited;
  ClearVioList;
  FVioThread.Stop;
  Timer1.Enabled := False;
  ClearQueue;
end;

procedure TFrameBlackCheck.ClearQueue;
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

procedure TFrameBlackCheck.ClearVioList;
var
  vio: TVio;
begin
  for vio in FVioList do
    vio.Deleted := True;
  FVioList.Clear;
end;

procedure TFrameBlackCheck.InitControl;
begin
  cbbsf.Text := '';
  edthphm.Text := '';
  cbbhpzl.Text := '';
  edtsyr.Text := '';
  edtclpp1.Text := '';
  edtclpp2.Text := '';
  edtclxh.Text := '';
  cbbCllx.Text := '';
  cbbCsys.Text := '';
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
  cbbBklx.Text := '';
  imgviopic.Clear;
end;

procedure TFrameBlackCheck.LoadVioList;
var
  Param, s, url: String;
  vio: TVio;
begin
  ShowFrameWait;
  tbVio.Close;
  InitControl;
  FObj := nil;
  ClearVioList;
  Param := 'count=30&lockip=' + gClientIP + '&cjjg=' + gUser.DWDM;
  s := TRequestItf.DbQuery('GetKKAlarmCheck', Param);
  if s <> '' then
  begin
    tbVio.AfterScroll := nil;
    TJsonUtils.JSONToDataSet(s, tbVio, '');
    tbVio.First;
    while not tbVio.eof do
    begin
      vio := TVio.Create;
      vio.SystemID := tbVio.FieldByName('SYSTEMID').AsString;
      vio.VioRecord.SystemID := vio.SystemID;
      vio.VioRecord.hphm := tbVio.FieldByName('HPHM').AsString;
      vio.VioRecord.hpzl := tbVio.FieldByName('HPZL').AsString;
      vio.VioRecord.WFXW := tbVio.FieldByName('BKLX').AsString;
      vio.VioRecord.bj := tbVio.FieldByName('BKZL').AsString;
      url := tbVio.FieldByName('VioUrl').AsString;
      while pos('/', url) > 0 do
        url := copy(url, pos('/', url) + 1, length(url));

      vio.VioRecord.FWQDZ := StringReplace(tbVio.FieldByName('VioUrl').AsString,
        url, '', [rfReplaceAll]);
      vio.VioRecord.PHOTOFILE1 := url;
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
  end;
  FreeFrameWait;
end;

procedure TFrameBlackCheck.ObjDoned;
begin
  FObj.Doned := True;
  if not tbVio.eof then
    tbVio.Delete;
end;

procedure TFrameBlackCheck.FillControl;
var
  hphm, FWQDZ, tp: String;
  i: Integer;
begin
  InitControl;
  if TLZDictionary.gDicMain['BKLX'].ContainsKey(FObj.VioRecord.WFXW) then
    cbbBklx.Text := FObj.VioRecord.WFXW + ':' + TLZDictionary.gDicMain['BKLX']
      [FObj.VioRecord.WFXW]
  else
    cbbBklx.Text := FObj.VioRecord.WFXW;
  edtBkzl.Text := FObj.VioRecord.bj;
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
    edthphm.Text := copy(hphm, 2, 100);
  end
  else
    cbbsf.Text := '44:粤';
  cbbhpzl.Text := FObj.VioRecord.hpzl;
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(FObj.VioRecord.hpzl) then
    cbbhpzl.Text := cbbhpzl.Text + ':' + TLZDictionary.gDicMain['HPZL']
      [FObj.VioRecord.hpzl];

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
    TCommon.GetPic(FWQDZ, tp, gSetup.DirSave + '\' + FObj.SystemID + '_1.jpg');

    FObj.Downloaded := True;
  end;

  if FObj.Downloaded then
  begin
    if FileExists(gSetup.DirSave + '\' + FObj.SystemID + '_1.jpg') then
      ShowVioPicture(gSetup.DirSave + '\' + FObj.SystemID + '_1.jpg');
    Application.ProcessMessages;
  end;
end;

procedure TFrameBlackCheck.FreeFrameWait;
begin
  if Assigned(FFrameWait) then
    FFrameWait.Visible := False;
end;

procedure TFrameBlackCheck.imgviopicMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
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

procedure TFrameBlackCheck.imgviopicMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    fdbool := True;
    isfms := 1
  end
  else
  begin
    isfms := 3;
    ShowVioPicture(FPicFile);
  end;
  btnSave.SetFocus;
end;

procedure TFrameBlackCheck.LoadVehInfo(veh: TVehInfo);
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
    cbbCllx.Text := veh.cllx + ':' + TLZDictionary.gDicMain['CLLX'][veh.cllx]
  else
    cbbCllx.Text := veh.cllx;

  color := '';
  for i := 1 to length(veh.csys) do
  begin
    if TLZDictionary.gDicMain['CSYS'].ContainsKey(veh.csys[i]) then
      color := color + TLZDictionary.gDicMain['CSYS'][veh.csys[i]];
  end;
  cbbCsys.Text := veh.csys;
  if color <> '' then
    cbbCsys.Text := cbbCsys.Text + ':' + color;

  edtccdjrq.Text := veh.ccdjrq;
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

procedure TFrameBlackCheck.UpdateColor(veh: TVehInfo);
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

  edthphm.Style.color := clRed;
  if TLZDictionary.gDicHBC.ContainsKey(hphm + hpzl) then
  begin
    edthphm.Style.color := clYellow;
  end;

  if (length(edtqzbfqz.Text) > 0) and
    (TCommon.StringToDT(edtqzbfqz.Text) - now < 0) then
    edtqzbfqz.Style.color := clRed;
  if (length(edtyxqz.Text) > 0) and (TCommon.StringToDT(edtyxqz.Text) - now < 0)
  then
    edtyxqz.Style.color := clYellow;
end;

function TFrameBlackCheck.SaveVio(): Boolean;
var
  Param: String;
  cmd: PCmd;
begin
  Result := False;
  if FObj = nil then
    exit;

  Param := 'SYSTEMID=' + FObj.VioRecord.SystemID + '&BKLX=' +
    TLZDictionary.StrtoDicInfo(cbbBklx.Text).DM + '&ZT=1&SPR=' + gUser.YHBH +
    '&SPSJ=' + FormatDatetime('yyyy/mm/dd hh:nn:ss', now()) + '&SPYJ=同意' +
    '&CLPP=' + Trim(edtclpp1.Text) + '&CLLX=' + TLZDictionary.StrtoDicInfo
    (cbbCllx.Text).DM + '&CSYS=' + TLZDictionary.StrtoDicInfo(cbbCsys.Text).DM +
    '&GXSJ=' + FormatDatetime('yyyy-mm-dd hh:nn:ss', now());

  // Result := StrToBool(TRequestItf.DbQuery('ModifyT_KK_ALARM', Param));
  New(cmd);
  cmd^.Action := 'ModifyT_KK_ALARM';
  cmd^.Param := Param;
  FcmdQueue.Push(cmd);
end;

procedure TFrameBlackCheck.btnDeleteClick(Sender: TObject);
var
  cmd: PCmd;
begin
  if FObj = nil then
    exit;
  // TRequestItf.DbQuery('DelT_KK_ALARM', 'systemid=' + FObj.VioRecord.SystemID);
  New(cmd);
  cmd^.Action := 'DelT_KK_ALARM';
  cmd^.Param := 'systemid=' + FObj.VioRecord.SystemID;
  FcmdQueue.Push(cmd);
  ObjDoned;
end;

procedure TFrameBlackCheck.cxButton2Click(Sender: TObject);
begin
  if FObj = nil then
    exit;

  if Trim(edtclpp1.Text) = '' then
  begin
    Application.MessageBox('中文品牌不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if Trim(cbbCllx.Text) = '' then
  begin
    Application.MessageBox('车辆类型不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if Trim(cbbCsys.Text) = '' then
  begin
    Application.MessageBox('车辆颜色不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  try
    SaveVio();
  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message + #13 + FObj.VioRecord.SystemID),
        'updatedata');
    end;
  end;
  ObjDoned;
end;

procedure TFrameBlackCheck.edthphmKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    cbbhpzl.SetFocus;
  end;
end;

procedure TFrameBlackCheck.ShowFrameWait;
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

procedure TFrameBlackCheck.ShowVioPicture(picFile: string);
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

procedure TFrameBlackCheck.tbVioAfterDelete(DataSet: TDataSet);
begin
  tbVio.AfterScroll := tbVioAfterScroll;
end;

procedure TFrameBlackCheck.tbVioAfterScroll(DataSet: TDataSet);
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
      (FVioList[i].SystemID = tbVio.FieldByName('SystemID').AsString) then
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

procedure TFrameBlackCheck.tbVioBeforeDelete(DataSet: TDataSet);
begin
  tbVio.AfterScroll := nil;
end;

procedure TFrameBlackCheck.Timer1Timer(Sender: TObject);
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

procedure TFrameBlackCheck.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  LoadVioList();
end;

end.
