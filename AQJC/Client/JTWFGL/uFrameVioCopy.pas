unit uFrameVioCopy;

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
  TFrameVioCopy = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    lgInfo: TdxLayoutGroup;
    liButton: TdxLayoutGroup;
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
    btnBack: TcxButton;
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
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    imgviopic: TImageEnVect;
    img1: TImageEnView;
    procedure AfterConstruction; override;
    procedure cxButton2Click(Sender: TObject);
    procedure cbbsfKeyPress(Sender: TObject; var Key: Char);
    procedure edthphmKeyPress(Sender: TObject; var Key: Char);
    procedure cbbhpzlKeyPress(Sender: TObject; var Key: Char);
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
    procedure btnBackClick(Sender: TObject);
  private
    fdbool, FOK, fz: Boolean;
    FPicFile: string;
    isfms: Integer;
    FObj: TVio;
    procedure SetObj(obj: TVio);
    procedure InitControl();
    procedure LoadVehInfo(veh: TVehInfo);
    procedure UpdateColor(veh: TVehInfo);
    procedure UpdateVehFromEdit();
    function SaveVio(): Boolean;
    procedure ShowVioPicture(picFile: string);
    function AddPicText(sourcePic, targetPic: String; vio: TViotemp): Boolean;
    procedure FillDevCommbox();
  public
    property VioObj: TVio read FObj write SetObj;
  end;

implementation

{$R *.dfm}

function TFrameVioCopy.AddPicText(sourcePic, targetPic: String;
  vio: TViotemp): Boolean;
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
      TextOut(10, 10, '违法时间: ' + formatDatetime('yyyy-mm-dd hh:nn:ss', vio.wfsj)
        + ' 号牌号码: ' + vio.HPHM + ' 号牌种类: ' + vio.HPZL);
      TextOut(10, 10 + w, '设备编号: ' + vio.wfdd + ' 车道: ' + vio.CD);
      TextOut(10, 10 + w * 2, '设备名称: ' + TLZDictionary.gDicDev[2]
        [vio.wfdd].SBDDMC);
      TextOut(10, 10 + w * 3, '违法代码: ' + vio.wfxw + '  防伪码: ' +
        copy(string(AesEncrypt(AnsiString(sourcePic), AnsiString(Key))
        ), 1, 20));
    end;
    img.IO.SaveToFileJpeg(targetPic);
  except
    Result := False;
  end;
  img.Free;
end;

procedure TFrameVioCopy.AfterConstruction;
begin
  inherited;
  imgviopic.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  FillDevCommbox;
  TLZDictionary.BindComboboxWFXW(cbbwfxw, True);
  TLZDictionary.BindCombobox(cbbsf, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
end;

procedure TFrameVioCopy.InitControl;
begin
  cbbwfdd.Text := '';
  cbbwfxw.Text := '';
  cbbsf.Text := '44:粤';
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

procedure TFrameVioCopy.btnVideoClick(Sender: TObject);
begin
  if FObj = nil then
    exit;

  ShowVioPicture(gSetup.DirSave + '\' + FObj.VioRecord.VIDEOFILE);
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnGreen.Glyph;
end;

procedure TFrameVioCopy.FillDevCommbox;
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
  cbbwfdd.Properties.Items.Clear;
  cbbwfdd.Properties.Items.AddStrings(str);
  str.Free;
end;

procedure TFrameVioCopy.imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
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

procedure TFrameVioCopy.imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TFrameVioCopy.LoadVehInfo(veh: TVehInfo);
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
  edtclpp1.Text := veh.clpp1;
  edtclpp2.Text := veh.clpp2;
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

procedure TFrameVioCopy.UpdateColor(veh: TVehInfo);
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
  if FObj.VioRecord.wfxw = '13441' then
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

function TFrameVioCopy.SaveVio(): Boolean;
var
  Param: string;
begin
  Result := False;
  if FObj = nil then
    exit;

  Param := 'CJJG=' + FObj.VioRecord.cjjg + '&HPHM=' + FObj.VehInfo.HPHM +
    '&HPZL=' + FObj.VehInfo.HPZL + '&SYXZ=' + FObj.VehInfo.syxz + '&WFXW=' +
    FObj.VioRecord.wfxw + '&WFDD=' + FObj.VioRecord.wfdd + '&WFSJ=' +
    formatDatetime('yyyy/mm/dd hh:nn:ss', FObj.VioRecord.wfsj) + '&XZSD=' +
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

  Result := StrToBool(TRequestItf.DbQuery('AddT_VIO_HIS', Param));
end;

procedure TFrameVioCopy.SetObj(obj: TVio);
var
  HPHM, FWQDZ, tp: string;
  i: Integer;
begin
  InitControl;
  FObj := TVio.Create;

  FObj.SystemID := obj.SystemID;
  FObj.VehInfo := obj.VehInfo;
  FObj.VioRecord := obj.VioRecord;
  FObj.Downloaded := obj.Downloaded;
  FObj.DoneVehInfo := True;
  FObj.Doned := obj.Doned;
  FObj.Deleted := obj.Deleted;

  FObj.VioRecord.wfxw := '';
  FObj.VioRecord.HPHM := '';
  FObj.VioRecord.HPZL := '';
  cbbwfdd.Text := obj.VioRecord.wfdd;
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

  cbbhpzl.ItemIndex := 1;//FObj.VioRecord.HPZL;
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
    TCommon.GetPic(FWQDZ, tp, gSetup.DirSave + '\' + FObj.SystemID + '_1.jpg');

    tp := FObj.VioRecord.PHOTOFILE2;
    if tp <> '' then
    begin
      TCommon.GetPic(FWQDZ, tp, gSetup.DirSave + '\' + FObj.SystemID +
        '_2.jpg');
    end;

    tp := FObj.VioRecord.PHOTOFILE3;
    if tp <> '' then
    begin
      TCommon.GetPic(FWQDZ, tp, gSetup.DirSave + '\' + FObj.SystemID +
        '_3.jpg');
    end;
    FObj.Downloaded := True;
  end;

  if FObj.Downloaded then
  begin
    liP1.Visible := FileExists(gSetup.DirSave + '\' + FObj.SystemID + '_1.jpg');
    liP2.Visible := FileExists(gSetup.DirSave + '\' + FObj.SystemID + '_2.jpg');
    liP3.Visible := FileExists(gSetup.DirSave + '\' + FObj.SystemID + '_3.jpg');
    livideo.Visible := FileExists(gSetup.DirSave + '\' +
      FObj.VioRecord.VIDEOFILE);
    if liP1.Visible then
    begin
      ShowVioPicture(gSetup.DirSave + '\' + FObj.SystemID + '_1.jpg');
      btnP1.Glyph := btnGreen.Glyph;
    end;
    Application.ProcessMessages;
  end;
end;

procedure TFrameVioCopy.btnBackClick(Sender: TObject);
begin
  if FObj <> nil then
    FObj.Free;
  Self.Hide;
end;

procedure TFrameVioCopy.btnP1Click(Sender: TObject);
begin
  if FObj = nil then
    exit;

  ShowVioPicture(gSetup.DirSave + '\' + FObj.SystemID + '_1.jpg');
  btnP1.Glyph := btnGreen.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioCopy.btnP2Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  ShowVioPicture(gSetup.DirSave + '\' + FObj.SystemID + '_2.jpg');
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnGreen.Glyph;
  btnP3.Glyph := btnBlue.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioCopy.btnP3Click(Sender: TObject);
begin
  if FObj = nil then
    exit;
  ShowVioPicture(gSetup.DirSave + '\' + FObj.SystemID + '_3.jpg');
  btnP1.Glyph := btnBlue.Glyph;
  btnP2.Glyph := btnBlue.Glyph;
  btnP3.Glyph := btnGreen.Glyph;
  btnVideo.Glyph := btnBlue.Glyph;
end;

procedure TFrameVioCopy.UpdateVehFromEdit();
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

procedure TFrameVioCopy.cxButton2Click(Sender: TObject);
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
    if (gUser.FH <> '') and StrToBool(gUser.FH) then
      FObj.VioRecord.bj := '9'
    else if (gUser.SH <> '') and StrToBool(gUser.SH) then
      FObj.VioRecord.bj := '29';
    SaveVio();
    Self.Hide;
  end;
  FObj.Free;
end;

procedure TFrameVioCopy.dxLayoutGroup8Collapsed(Sender: TObject);
begin
  img1.Height := 260;
end;

procedure TFrameVioCopy.dxLayoutGroup8Expanded(Sender: TObject);
begin
  img1.Height := 180;
end;

procedure TFrameVioCopy.cbbsfKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    edthphm.SetFocus;
end;

procedure TFrameVioCopy.cbbsfMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbsf.SelectAll;
end;

procedure TFrameVioCopy.cbbwfxwMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbwfxw.SelectAll;
end;

procedure TFrameVioCopy.cbbhpzlKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    btnSave.SetFocus;
  end;
end;

procedure TFrameVioCopy.cbbhpzlMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  cbbhpzl.SelectAll;
end;

procedure TFrameVioCopy.edthphmKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if Key = #13 then
  begin
    LoadVehInfo(veh);
    cbbhpzl.SetFocus;
  end;
end;

procedure TFrameVioCopy.ShowVioPicture(picFile: string);
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

end.
