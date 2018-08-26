unit uFrameVioEdit;

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
  Vcl.Imaging.jpeg, EncdDecd;

type
  TFrameVioEdit = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    lgInfo: TdxLayoutGroup;
    liButton: TdxLayoutGroup;
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
    lgImage: TdxLayoutGroup;
    DataSource1: TDataSource;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    imgviopic: TImageEnVect;
    img1: TImageEnView;
    btnBack: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
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
  private
    FBj: String;
    FFrameID: String;
    fdbool, FOK: Boolean;
    FPicFile: String;
    isfms: Integer;
    FObj: TVio;
    procedure FillControl();
    procedure InitControl();
    procedure LoadVehInfo(veh: TVehInfo);
    procedure UpdateColor(veh: TVehInfo);
    procedure UpdateVehFromEdit();
    procedure UpdateDBVioStatus(systemid, bj: String; bz: String = '');
    procedure ShowVioPicture(picFile: string);
    function SaveVio(): Boolean;
  public
    property FrameID: String read FFrameID write FFrameID;
    procedure LoadVioList(bj: String; sysid: String);
    procedure DoBlack();
    procedure DoDelete();
    procedure DoSave();
  end;

implementation

{$R *.dfm}

procedure TFrameVioEdit.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindComboboxDEVEx(cbbwfdd, False);
  TLZDictionary.BindComboboxWFXW(cbbwfxw, True);
  TLZDictionary.BindCombobox(cbbsf, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
end;

procedure TFrameVioEdit.BeforeDestruction;
begin
  inherited;
  if FObj <> nil then
    FObj.Free;
end;

procedure TFrameVioEdit.InitControl;
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

procedure TFrameVioEdit.btnVideoClick(Sender: TObject);
begin
  if FObj = nil then
    exit;

  ShowVioPicture(gSetup.DirSave + '\' + FObj.VioRecord.VIDEOFILE);
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnGreen.Glyph;
end;

procedure TFrameVioEdit.LoadVioList(bj: String; sysid: String);
var
  s: String;
begin
  tbVio.Close;
  InitControl;
  FBj := bj;
  if bj = '4' then
    s := TRequestItf.DbQuery('GetT_VIO_Temp', 'systemid=' + sysid)
  else
    s := TRequestItf.DbQuery('GetT_VIO_HIS', 'systemid=' + sysid);
  if s <> '' then
  begin
    TJsonUtils.JSONToDataSet(s, tbVio, '');
    tbVio.First;
    if not tbVio.eof then
    begin
      FObj := TVio.Create;
      FObj.systemid := tbVio.FieldByName('SYSTEMID').AsString;
      FObj.VioRecord.systemid := FObj.systemid;
      FObj.VioRecord.hphm := tbVio.FieldByName('HPHM').AsString;
      FObj.VioRecord.hpzl := tbVio.FieldByName('HPZL').AsString;
      FObj.VioRecord.WFSJ := TCommon.StringToDT(tbVio.FieldByName('wfsj')
        .AsString);
      FObj.VioRecord.wfxw := tbVio.FieldByName('wfxw').AsString;
      FObj.VioRecord.CD := tbVio.FieldByName('cd').AsString;
      FObj.VioRecord.SJSD := tbVio.FieldByName('sjsd').AsInteger;
      FObj.VioRecord.WFDD := tbVio.FieldByName('WFDD').AsString;
      FObj.VioRecord.XZSD := tbVio.FieldByName('XZSD').AsInteger;
      FObj.VioRecord.FWQDZ := tbVio.FieldByName('fwqdz').AsString;
      FObj.VioRecord.PHOTOFILE1 := tbVio.FieldByName('PHOTOFILE1').AsString;
      FObj.VioRecord.PHOTOFILE2 := tbVio.FieldByName('PHOTOFILE2').AsString;
      FObj.VioRecord.PHOTOFILE3 := tbVio.FieldByName('PHOTOFILE3').AsString;
      FObj.VioRecord.VIDEOFILE := tbVio.FieldByName('VIDEOFILE').AsString;
      FObj.VioRecord.cjjg := tbVio.FieldByName('CJJG').AsString;
    end;
    FillControl();
  end;
end;

procedure TFrameVioEdit.FillControl;
var
  hphm, FWQDZ, tp: String;
  i: Integer;
begin
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

procedure TFrameVioEdit.imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TFrameVioEdit.imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    fdbool := True;
    isfms := 1;
  end
  else
  begin
    isfms := 3;
    ShowVioPicture(FPicFile);
  end;
  btnSave.SetFocus;
end;

procedure TFrameVioEdit.LoadVehInfo(veh: TVehInfo);
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

procedure TFrameVioEdit.UpdateColor(veh: TVehInfo);
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

procedure TFrameVioEdit.UpdateDBVioStatus(systemid, bj: String;
  bz: String = '');
var
  Param: String;
begin
  if FBj = '4' then
  begin
    Param := 'SYSTEMID=' + systemid + '&BJ=' + bj + '&LRR=' + gUser.YHBH +
      '&GXSJ=' + FormatDatetime('yyyy/mm/dd hh:nn:ss', now());
    if bz <> '' then
      Param := Param + '&BZ=' + bz;
    TRequestItf.DbQuery('ModifyT_VIO_TEMP', Param);
  end
  else
  begin
    Param := 'zt=' + bj + '&systemid=' + systemid + '&GXSJ=' +
      FormatDatetime('yyyy/mm/dd hh:nn:ss', now());;
    if bz <> '' then
      Param := Param + '&bz=' + bz;
    TRequestItf.DbQuery('ModifyT_VIO_HIS', Param);
  end;
end;

procedure TFrameVioEdit.btnP1Click(Sender: TObject);
begin
  if FObj = nil then
    exit;

  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_1.jpg');
  btnP1.Glyph := btnGreen.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioEdit.btnP2Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_2.jpg');
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnGreen.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioEdit.btnP3Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  ShowVioPicture(gSetup.DirSave + '\' + FObj.systemid + '_3.jpg');
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnGreen.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioEdit.UpdateVehFromEdit();
var
  Key: String;
begin
  if FObj = nil then
    exit;
  FObj.VehInfo.hphm := RightStr(Trim(cbbsf.Text), 1) + Trim(edthphm.Text);
  FObj.VehInfo.hpzl := LeftStr(Trim(cbbhpzl.Text), 2);
  FObj.VehInfo.syxz := TLZDictionary.StrtoDicInfo(Trim(edtsyxz.Text)).dm;
  FObj.VioRecord.wfxw := TLZDictionary.StrtoDicInfo(Trim(cbbwfxw.Text)).dm;

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
  FObj.VehInfo.csys := TLZDictionary.StrtoDicInfo(Trim(edtcsys.Text)).dm;
  FObj.VehInfo.clxh := edtclxh.Text;
  FObj.VehInfo.clpp1 := edtclpp1.Text;
  FObj.VehInfo.clpp2 := edtclpp2.Text;
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

procedure TFrameVioEdit.DoBlack;
var
  Param, bklx: string;
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
    EncodeString(Trim(FObj.VioRecord.FWQDZ) + Trim(FObj.VioRecord.PHOTOFILE1)) + '&ZT=0&BKLX='
    + bklx + '&BKZL=手动布控&CJJG=' + gUser.DWDM;
  TRequestItf.DbQuery('AddT_KK_ALARM', Param);

  UpdateDBVioStatus(FObj.VioRecord.systemid, '5', fBz.cbbBz.Text);
end;

procedure TFrameVioEdit.DoDelete;
begin
  if FObj = nil then
    exit;
  if FBj = '4' then
    exit;
  UpdateDBVioStatus(FObj.VioRecord.systemid, '4');
end;

procedure TFrameVioEdit.DoSave;
var
  bj: String;
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

  UpdateVehFromEdit();
  if FObj.VioRecord.wfxw = '13441' then
    FObj.VioRecord.bj := '20';
  if (gUser.FH <> '') and StrToBool(gUser.FH) then
    FObj.VioRecord.bj := '9';

  try
    SaveVio();
    if FBj = '4' then
      bj := '2'
    else
      bj := FObj.VioRecord.bj;
    UpdateDBVioStatus(FObj.VioRecord.systemid, bj);
  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message + #13 + FObj.VioRecord.systemid),
        'updatedata');
    end;
  end;
end;

procedure TFrameVioEdit.dxLayoutGroup8Collapsed(Sender: TObject);
begin
  img1.Height := 260;
end;

procedure TFrameVioEdit.dxLayoutGroup8Expanded(Sender: TObject);
begin
  img1.Height := 130;
end;

procedure TFrameVioEdit.cbbsfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edthphm.SetFocus;
end;

procedure TFrameVioEdit.cbbsfMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbsf.SelectAll;
end;

procedure TFrameVioEdit.cbbwfxwMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbwfxw.SelectAll;
end;

procedure TFrameVioEdit.cbbhpzlKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    btnSave.SetFocus;
  end;
end;

procedure TFrameVioEdit.cbbhpzlMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbhpzl.SelectAll;
end;

procedure TFrameVioEdit.edthphmKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    cbbhpzl.SetFocus;
  end;
end;

procedure TFrameVioEdit.fBzbtnExitClick(Sender: TObject);
begin
  FOK := False;
  fBz.Visible := False;
  dxLayoutControl1Group_Root.Enabled := True;
end;

procedure TFrameVioEdit.fBzbtnSaveClick(Sender: TObject);
begin
  FOK := True;
  fBz.Visible := False;
  dxLayoutControl1Group_Root.Enabled := True;
end;

function TFrameVioEdit.SaveVio: Boolean;
var
  Param: String;
begin
  Result := False;
  if FObj = nil then
    exit;

  Param := 'CJJG=' + FObj.VioRecord.cjjg + '&HPHM=' + FObj.VehInfo.hphm +
    '&HPZL=' + FObj.VehInfo.hpzl + '&SYXZ=' + FObj.VehInfo.syxz + '&WFXW=' +
    FObj.VioRecord.wfxw + '&WFDD=' + FObj.VioRecord.WFDD + '&WFSJ=' +
    FormatDatetime('yyyy/mm/dd hh:nn:ss', FObj.VioRecord.WFSJ) + '&XZSD=' +
    IntToStr(FObj.VioRecord.XZSD) + '&SJSD=' + IntToStr(FObj.VioRecord.SJSD) +
    '&CD=' + FObj.VioRecord.CD + '&Encode_FWQDZ=' +
    EncodeString(FObj.VioRecord.FWQDZ) + '&PHOTOFILE1=' +
    FObj.VioRecord.PHOTOFILE1 + '&PHOTOFILE2=' + FObj.VioRecord.PHOTOFILE2 +
    '&PHOTOFILE3=' + FObj.VioRecord.PHOTOFILE3 + '&VIDEOFILE=' +
    FObj.VioRecord.VIDEOFILE + '&CSYS=' + FObj.VehInfo.csys + '&CLXH=' +
    FObj.VehInfo.clxh + '&CLPP1=' + FObj.VehInfo.clpp1 + '&CLPP2=' +
    FObj.VehInfo.clpp2 + '&CLLX=' + FObj.VehInfo.cllx + '&CLSBDH=' +
    FObj.VehInfo.clsbdh + '&FDJH=' + FObj.VehInfo.fdjh + '&SYR=' +
    FObj.VehInfo.syr + '&LXDH=' + FObj.VehInfo.lxdh + '&ZZXZQH=' +
    FObj.VehInfo.zzxzqh + '&ZZXXDZ=' + FObj.VehInfo.zzxxdz + '&ZSXZQH=' +
    FObj.VehInfo.zsxzqh + '&ZSXXDZ=' + FObj.VehInfo.zsxxdz + '&YZBM1=' +
    FObj.VehInfo.yzbm1 + '&YZBM2=' + FObj.VehInfo.yzbm2 + '&ZT=' +
    FObj.VioRecord.bj + '&CJMJ=' + gUser.YHBH + '&LRR=' + gUser.YHBH;
  if FBj = '4' then
  begin
    Result := StrToBool(TRequestItf.DbQuery('AddT_VIO_HIS', Param));
  end
  else
  begin
    Param := Param + '&SystemID=' + FObj.systemid;
    Result := StrToBool(TRequestItf.DbQuery('ModifyT_VIO_HIS', Param));
  end;
end;

procedure TFrameVioEdit.ShowVioPicture(picFile: string);
begin
  FPicFile := picFile;
  imgviopic.AutoFit := True;
  if not FileExists(FPicFile) then
  begin
    imgviopic.Clear;
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

end.
