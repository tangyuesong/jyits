unit uFrameJCBK;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, IOUtils,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, DateUtils,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, ActiveX, Data.DB,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  System.Win.ComObj, uFrameZFZ,
  dxSkinXmas2008Blue, dxCustomTileControl, cxClasses, dxTileControl,
  dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Vcl.StdCtrls,
  dxLayoutControlAdapters, Vcl.Menus, cxButtons, Vcl.ExtCtrls, IdHTTP,
  dxAnimation, System.ImageList, Vcl.ImgList, uDM, Generics.Collections,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, cxLabel, uEntity,
  xtImage, cxMemo, uFrameSelectDev, uFrameFeedback, uFrameSign, dxpicdata,
  hyieutils, iexBitmaps, hyiedefs, iesettings, iexRulers, System.Contnrs,
  imageenview, ieview, imageen, ievect, cxGroupBox, uFrameInput,
  dxGDIPlusClasses, cxImage, cxCheckBox, dxViodata, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxComboBoxExt, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox;

type
  TFrameJCBK = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    btnSign: TcxButton;
    liDJ: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    btnDetail: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    btnDevice: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    Timer1: TTimer;
    btnPause: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    edtSBDDMC: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    edtCD: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    edtGCSJ: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    edtHPHM: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edtHPZL: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    edtSD: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    edtCLPP: TcxTextEdit;
    dxLayoutItem15: TdxLayoutItem;
    edtCLXH: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    edtCSYS: TcxTextEdit;
    dxLayoutItem17: TdxLayoutItem;
    edtCLSBDH: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    edtFDJH: TcxTextEdit;
    dxLayoutItem19: TdxLayoutItem;
    edtSYXZ: TcxTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    edtCCDJRQ: TcxTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    edtYXQX: TcxTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    edtBFQX: TcxTextEdit;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    edtCZDZ: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    edtSYR: TcxTextEdit;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem25: TdxLayoutItem;
    dxLayoutAutoCreatedGroup7: TdxLayoutAutoCreatedGroup;
    edtBKXX: TcxMemo;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    dxLayoutSplitterItem3: TdxLayoutSplitterItem;
    dxTileControl2: TdxTileControl;
    dxLayoutItem8: TdxLayoutItem;
    dxTileControl2Group1: TdxTileControlGroup;
    dxTileControl2Item1: TdxTileControlItem;
    dxTileControl2Item2: TdxTileControlItem;
    dxLayoutGroup8: TdxLayoutGroup;
    btnFeedback: TcxButton;
    liFeedback: TdxLayoutItem;
    ImageEnView1: TImageEnView;
    ImageEnVect1: TImageEnVect;
    dxLayoutItem27: TdxLayoutItem;
    dxTileControl1: TdxTileControl;
    dxTileControlGroup1: TdxTileControlGroup;
    dxTileControlItem3: TdxTileControlItem;
    dxTileControlItem4: TdxTileControlItem;
    dxTileControl2Item3: TdxTileControlItem;
    dxTileControl2Item4: TdxTileControlItem;
    dxTileControl1Item1: TdxTileControlItem;
    dxTileControl1Item2: TdxTileControlItem;
    dxTileControl1Item3: TdxTileControlItem;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    dxLayoutItem28: TdxLayoutItem;
    btnMobile: TcxButton;
    Timer2: TTimer;
    dxLayoutItem29: TdxLayoutItem;
    edtBKLX: TcxTextEdit;
    dxLayoutGroup9: TdxLayoutGroup;
    cxGroupBox3: TcxGroupBox;
    liRoad: TdxLayoutItem;
    cxImage1: TcxImage;
    imgCar: TcxImage;
    labN: TcxLabel;
    lab: TcxLabel;
    labCar: TcxLabel;
    labTime: TcxLabel;
    imgFX1: TcxImage;
    imgFX2: TcxImage;
    cbMoto: TcxCheckBox;
    cbDC: TcxCheckBox;
    dxLayoutItem30: TdxLayoutItem;
    dxLayoutItem31: TdxLayoutItem;
    btnVioInfo: TcxButton;
    dxLayoutItem32: TdxLayoutItem;
    dxLayoutGroup10: TdxLayoutGroup;
    dxLayoutItem33: TdxLayoutItem;
    edtCLZT: TcxTextEdit;
    cbLocal: TcxCheckBox;
    dxLayoutItem3: TdxLayoutItem;
    cboBKLX: TcxCheckComboBox;
    dxLayoutItem26: TdxLayoutItem;
    procedure Timer1Timer(Sender: TObject);
    procedure btnDeviceClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure dxTileControl2Item1Click(Sender: TdxTileControlItem);
    procedure btnFeedbackClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure ImageEnVect1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FrameResize(Sender: TObject);
    procedure btnMobileClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ImageEnVect1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCarClick(Sender: TObject);
    procedure btnVioInfoClick(Sender: TObject);
    procedure btnSignClick(Sender: TObject);
    procedure cbLocalPropertiesChange(Sender: TObject);
  private
    FOpenTime: Double;
    fdbool, fz: Boolean;
    FPicFile: string;
    isfms: Integer;
    LastSpeekTime: Double;
    FFrameInput: TFrameInput;
    FFrameSign: TFrameSign;
    FFeedback: TFrameFeedback;
    FFrameZFZ: TFrameZFZ;
    FDetail: TdxFramePicData;
    FVioInfo: TdxFrameVioData;
    FDev: TFrameSelectDev;
    FSJHM, FSBBH: string;
    FAlarmIndex: Integer;
    FAlarmList: TList<TAlarmResult>;
    FDoneAlarmList: TDictionary<string, Boolean>;
    FWhiteList: TDictionary<string, Boolean>;
    FVehDic: TDictionary<string, TVehInfo>;
    FControlItem: TdxTileControlItem;
    procedure SpeakVoice(voiceList: TStrings);
    procedure SpVoice(s: string);
    procedure LoadAlarm;
    procedure ShowAlarm(alarm: TAlarmResult);
    procedure DevSaveClick(Sender: TObject);
    procedure HidFeedback;
    function FeedbackExists(yjxh: string): Boolean;
    procedure AddItem(alarm: TAlarmResult; dxTileControl: TdxTileControl);
    procedure FrameInputbtnSaveClick(Sender: TObject);
    procedure HidSignFrame;
    procedure ShowVioPicture(picFile: string);
    procedure SetSBBH(const Value: string);
    function GetColor(hpzl: string): TColor;
    function CheckBKR(HPHM, hpzl, yhbh: string): Boolean;
    procedure HideZFZ;
    function AlarmToZFZ(alarm: TAlarmResult): TVehCheck;
    procedure BindBKLX;
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    procedure DevExitClick(Sender: TObject);
    property ControlItem: TdxTileControlItem read FControlItem
      write FControlItem;
    property SBBH: string read FSBBH write SetSBBH;
  end;

implementation

uses
  uRequestItf, uJsonUtils, uGlobal, Udictionary, uCommon;
{$R *.dfm}

procedure TFrameJCBK.AfterConstruction;
var
  list: TList<TVioWmd>;
  item: TVioWmd;
begin
  inherited;
  FOpenTime := now;
  //dxLayoutControl1Group_Root.Visible := false; 缩放有问题
  FAlarmList := TList<TAlarmResult>.Create;
  FDoneAlarmList := TDictionary<string, Boolean>.Create;
  FWhiteList := TDictionary<string, Boolean>.Create;
  FVehDic := TDictionary<string, TVehInfo>.Create;
  list := TJsonUtils.JsonToObjectList<TVioWmd>
    (TRequestItf.DbQuery('GetWhiteList', 'cjjg=' + gUser.DWDM +
    '&powertype=4&dt=' + FormatDatetime('yyyy/mm/dd', Now())));
  for item in list do
  begin
    if not FWhiteList.ContainsKey(item.HPHM + item.hpzl) then
      FWhiteList.Add(item.HPHM + item.hpzl, true);
  end;
  list.Free;

  LastSpeekTime := 0;
  self.dxTileControl2.Items.Clear;
  self.dxTileControl1.Items.Clear;
  ImageEnVect1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  ImageEnVect1.Fit();
  BindBKLX;
end;

procedure TFrameJCBK.BindBKLX;

  function GetBKLXList: TStrings;
  var
    s, v: string;
    str: TStringList;
  begin
    str := TStringList.Create;
    str.Sort;
    str.Sorted := True;
    for s in TLZDictionary.gDicMain['BKLX'].Keys do
      str.Add(s);
    Result := str;
  end;
  procedure AddBKLXItem(code, desc: string);
  begin
    with cboBKLX.Properties.Items.Add do
    begin
      Description := desc;
      ShortDescription := code + ' ' + desc;
    end;
  end;
var
  bklxs: TStrings;
  key: string;
begin
  bklxs := GetBKLXList;
  for Key in bklxs do
    AddBKLXItem('', Key + ':' + TLZDictionary.gDicMain['BKLX'][Key]);
  bklxs.Free;
end;

procedure TFrameJCBK.BeforeDestruction;
begin
  inherited;
  if FSBBH <> '' then
  begin
    TRequestItf.DbQuery('CloseJCPTDevice', 'yhbh=' + gUser.yhbh);
  end;
  FWhiteList.Free;
  FAlarmList.Free;
  FDoneAlarmList.Free;
  FVehDic.Free;
end;

procedure TFrameJCBK.btnDetailClick(Sender: TObject);
begin
  if dxTileControl2Group1.ItemCount = 0 then
    exit;

  if (FAlarmIndex = -1) or (FAlarmIndex >= FAlarmList.Count) then
    FAlarmIndex := 0;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(self);
    FDetail.Parent := self;
    FDetail.Align := TAlign.alClient;
  end;
  FDetail.HPHM := FAlarmList[FAlarmIndex].HPHM;
  FDetail.hpzl := FAlarmList[FAlarmIndex].hpzl;
  FDetail.LoadPassList;
  FDetail.Show;
end;

procedure TFrameJCBK.btnDeviceClick(Sender: TObject);
var
  key: string;
  dev: TDevice;
begin
  if not Assigned(FDev) then
  begin
    FDev := TFrameSelectDev.Create(self);
    FDev.Parent := self;
    FDev.tvDevColumn4.Visible := false;
    // FDev.Top := (self.Height - FDev.Height) div 2;
    FDev.Top := 20;
    FDev.Left := (self.Width - FDev.Width) div 2;
    FDev.btnSave.OnClick := self.DevSaveClick;
    FDev.btnExit.OnClick := self.DevExitClick;
  end;

  FDev.tb.Close;
  FDev.tb.FieldDefs.Clear;
  FDev.tb.IndexDefs.Clear;
  FDev.tb.FieldDefs.Add('bj', ftBoolean);
  FDev.tb.FieldDefs.Add('WFDD', ftString, 100);
  FDev.tb.FieldDefs.Add('SBDDMC', ftString, 100);
  FDev.tb.FieldDefs.Add('C1', ftInteger);
  FDev.tb.IndexDefs.Add('index', 'WFDD', [ixPrimary]);
  FDev.tb.IndexName := 'index';
  FDev.tb.CreateDataSet();

  FDev.tb.DisableControls;
  FDev.tb.Edit;
  for key in TLZDictionary.gDicDev[1].Keys do
  begin
    dev := TLZDictionary.gDicDev[1][key];
    FDev.tb.Append;
    FDev.tb.FieldByName('WFDD').AsString := dev.SBBH;
    FDev.tb.FieldByName('SBDDMC').AsString := dev.SBDDMC;
    FDev.tb.FieldByName('bj').AsBoolean := false;
  end;
  FDev.tb.Post;
  FDev.tb.First;
  FDev.tb.EnableControls;

  Timer1.Enabled := false;
  btnPause.Caption := '启动';
  dxLayoutControl1Group_Root.Visible := false;
  FDev.Visible := true;
end;

procedure TFrameJCBK.btnFeedbackClick(Sender: TObject);
var
  alarm: TAlarmResult;
begin
  if dxTileControl2Group1.ItemCount = 0 then
    exit;

  if (FAlarmIndex = -1) or (FAlarmIndex >= FAlarmList.Count) then
    exit;

  alarm := FAlarmList[FAlarmIndex];

  if not FeedbackExists(alarm.GCXH) then
  begin
    dxLayoutControl1Group_Root.Visible := false;

    if not Assigned(FFeedback) then
    begin
      FFeedback := TFrameFeedback.Create(self);
      FFeedback.Parent := self;
      FFeedback.Top := 20;
      FFeedback.Left := (self.Width - FFeedback.Width) div 2;
      FFeedback.OnClose := HidFeedback;
      FFeedback.OnSuccuss := HidFeedback;
    end;
    FFeedback.alarm := alarm;
    FFeedback.Show;
    Timer1.Enabled := false;
  end
  else
  begin
    Application.MessageBox('已反馈', '提示');
  end;
end;

procedure TFrameJCBK.btnMobileClick(Sender: TObject);
begin
  dxLayoutControl1Group_Root.Visible := false;

  if not Assigned(FFrameInput) then
  begin
    FFrameInput := TFrameInput.Create(self);
    FFrameInput.Parent := self;
    FFrameInput.Top := (self.Height - FFrameInput.Height) div 2;
    FFrameInput.Left := (self.Width - FFrameInput.Width) div 2;
    FFrameInput.btnSave.OnClick := self.FrameInputbtnSaveClick;
    FFrameInput.btnExit.OnClick := self.FrameInputbtnSaveClick;
  end;
  FFrameInput.Show;
end;

procedure TFrameJCBK.DevSaveClick(Sender: TObject);
var
  recNo: Integer;
  ss: string;
begin
  FOpenTime := now;
  ss := '';
  if not FDev.tb.Active then
    exit;
  FDev.tb.DisableControls;
  recNo := FDev.tb.recNo;
  FDev.tb.First;
  while not FDev.tb.eof do
  begin
    if FDev.tb.FieldByName('bj').AsBoolean then
      ss := ss + ',' + FDev.tb.FieldByName('WFDD').AsString;
    FDev.tb.Next;
  end;
  FDev.tb.recNo := recNo;
  FDev.tb.EnableControls;
  if ss <> '' then
  begin
    TRequestItf.DbQuery('CloseJCPTDevice', 'yhbh=' + gUser.yhbh);
    FSBBH := ss.Substring(1);
    if cbLocal.Checked then
      TRequestItf.DbQuery('OpenJCPTDevice', 'sbbh=' + FSBBH + '&yhbh=' + gUser.yhbh + '&local=1')
    else
      TRequestItf.DbQuery('OpenJCPTDevice', 'sbbh=' + FSBBH + '&yhbh=' + gUser.yhbh + '&local=0');
    dxTileControl2.Items.Clear;
    dxTileControl1.Items.Clear;
    LoadAlarm;
    DevExitClick(nil);
    if FAlarmList.Count = 0 then
      Application.MessageBox('该路口暂无预警数据', '提示');
  end
  else
     Application.MessageBox('请选择稽查路口', '提示');
end;

procedure TFrameJCBK.DevExitClick(Sender: TObject);
begin
  if Assigned(FDev) then
  begin
    FDev.Visible := false;
    dxLayoutControl1Group_Root.Visible := true;
    if FSBBH <> '' then
    begin
      Timer1.Enabled := true;
      btnPause.Caption := '暂停';
    end;
  end;
end;

procedure TFrameJCBK.btnPauseClick(Sender: TObject);
begin
  if btnPause.Caption = '启动' then
  begin
    if FSBBH <> '' then
    begin
      Timer1.Enabled := true;
      Timer1Timer(nil);
      btnPause.Caption := '暂停';
    end
    else
    begin
      Application.MessageBox('请选择稽查路口', '提示');
    end;
  end
  else
  begin
    Timer1.Enabled := false;
    btnPause.Caption := '启动';
  end;
end;

function TFrameJCBK.AlarmToZFZ(alarm: TAlarmResult): TVehCheck;
var
  vc: TVehCheck;
begin
  vc.HPHM := alarm.HPHM;
  vc.HPZL := alarm.HPZL;
  vc.GCSJ := alarm.GCSJ;
  vc.FWZBH := alarm.KDMC;
  vc.FWZMC := alarm.FKNR;
  vc.HDZKL := 0;
  vc.HDZZL := 0;
  vc.SJZZL := 0;
  vc.ZKS := 0;
  result := vc;
end;

procedure TFrameJCBK.btnSignClick(Sender: TObject);
var
  item: TVehCheck;
begin
  if dxTileControl2Group1.ItemCount = 0 then
    exit;

  if (FAlarmIndex = -1) or (FAlarmIndex >= FAlarmList.Count) then
    exit;

  item := AlarmToZFZ(FAlarmList[FAlarmIndex]);
  if item.CJR = '' then
  begin
    dxLayoutControl1Group_Root.Visible := false;

    if not Assigned(FFrameZFZ) then
    begin
      FFrameZFZ := TFrameZFZ.Create(self);
      FFrameZFZ.Parent := self;
      FFrameZFZ.Top := 20;
      FFrameZFZ.Left := (self.Width - FFrameZFZ.Width) div 2;
      FFrameZFZ.OnBack := HideZFZ;
    end;
    FFrameZFZ.VehCheckItem := item;
    FFrameZFZ.Show;
    Timer1.Enabled := false;
  end
  else
  begin
    Application.MessageBox('已反馈', '提示');
  end;
end;

function TFrameJCBK.FeedbackExists(yjxh: string): Boolean;
var
  json: string;
begin
  json := TRequestItf.DbQuery('GetFeedback', 'yjxh=' + yjxh + '&FKBJ=1');
  result := json <> '';
end;

procedure TFrameJCBK.btnVioInfoClick(Sender: TObject);
begin
  if dxTileControl2Group1.ItemCount = 0 then
    exit;

  if (FAlarmIndex = -1) or (FAlarmIndex >= FAlarmList.Count) then
    FAlarmIndex := 0;
  if not Assigned(FVioInfo) then
  begin
    FVioInfo := TdxFrameVioData.Create(self);
    FVioInfo.Parent := self;
    FVioInfo.Align := TAlign.alClient;
  end;
  FVioInfo.HPHM := FAlarmList[FAlarmIndex].HPHM;
  FVioInfo.hpzl := FAlarmList[FAlarmIndex].hpzl;
  FVioInfo.LoadVehInfo;
  FVioInfo.Show;
end;

procedure TFrameJCBK.cbLocalPropertiesChange(Sender: TObject);
begin
  TRequestItf.DbQuery('CloseJCPTDevice', 'yhbh=' + gUser.yhbh);
  if cbLocal.Checked then
    TRequestItf.DbQuery('OpenJCPTDevice', 'sbbh=' + FSBBH + '&yhbh=' + gUser.yhbh + '&local=1')
  else
    TRequestItf.DbQuery('OpenJCPTDevice', 'sbbh=' + FSBBH + '&yhbh=' + gUser.yhbh + '&local=0');
end;

procedure TFrameJCBK.HidSignFrame;
var
  alarm: TAlarmResult;
begin
  FFrameSign.Hide;
  if FFrameSign.ModalResult then
  begin
    alarm := FAlarmList[FAlarmIndex];
    alarm.QSBJ := '1';
    if FFrameSign.liSFLJ.Visible then
      alarm.SFCJ := copy(FFrameSign.cboSFLJ.Text, 1, 1)
    else
      alarm.SFCJ := '0';
    FAlarmList[FAlarmIndex] := alarm;
  end;
  dxLayoutControl1Group_Root.Visible := true;
end;

procedure TFrameJCBK.HidFeedback;
begin
  FFeedback.Hide;
  dxLayoutControl1Group_Root.Visible := true;
  Timer1.Enabled := true;
end;

procedure TFrameJCBK.HideZFZ;
begin
  FFrameZFZ.Hide;
  dxLayoutControl1Group_Root.Visible := true;
  Timer1.Enabled := true;
end;

procedure TFrameJCBK.FrameInputbtnSaveClick(Sender: TObject);
begin
  dxLayoutControl1Group_Root.Visible := true;
  if Sender = FFrameInput.btnSave then
    FSJHM := FFrameInput.edtCZSJ.Text;
  FFrameInput.Hide;
end;

procedure TFrameJCBK.ImageEnVect1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  rc: TRect;
  ww, hh: Integer;
begin
  if isfms = 1 then
  begin
    if fdbool then
    begin
      ImageEnVect1.AutoFit := true;
      ImageEnVect1.Proc.ClearAllRedo;
      ImageEnVect1.Proc.SelCopyToClip();
      ImageEnVect1.Proc.CropSel;
      ImageEnVect1.DeSelect;
    end;
    fdbool := false;
    isfms := 3;
  end
  else
  begin
    if fz then
      exit;

    rc.Left := X - 63;
    rc.Top := Y - 50;
    rc.Right := X + 64;
    rc.Bottom := Y + 50;

    with ImageEnVect1 do
    begin
      rc.Left := XScr2Bmp(rc.Left);
      rc.Right := XScr2Bmp(rc.Right);
      rc.Top := YScr2Bmp(rc.Top);
      rc.Bottom := YScr2Bmp(rc.Bottom);
    end;

    ww := rc.Right - rc.Left + 1;
    hh := rc.Bottom - rc.Top + 1;
    ImageEnView1.IEBitmap.Allocate(ww, hh, ImageEnVect1.IEBitmap.PixelFormat);
    ImageEnVect1.IEBitmap.CopyRectTo(ImageEnView1.IEBitmap, rc.Left, rc.Top, 0,
      0, ww, hh);

    ImageEnView1.Update;
    ImageEnView1.Fit;
    ImageEnVect1.Paint;
  end;
end;

procedure TFrameJCBK.ImageEnVect1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    fdbool := true;
    isfms := 1;
    fz := not fz;
  end
  else
  begin
    fz := false;
    isfms := 3;
    ShowVioPicture(FPicFile);
  end;
end;

procedure TFrameJCBK.imgCarClick(Sender: TObject);
begin
  FAlarmIndex := (Sender as TWinControl).Tag;
  ShowAlarm(FAlarmList[FAlarmIndex]);
  // if btnPause.Caption = '暂停' then
  // btnPauseClick(nil);
end;

procedure TFrameJCBK.SpeakVoice(voiceList: TStrings);
var
  voice: OleVariant;
  s: string;
begin
  try
    coinitialize(nil);
    voice := CreateOleObject('SAPI.Spvoice');
    for s in voiceList do
    begin
      voice.speak(s, 0);
    end;
  finally
    couninitialize;
  end;
  voiceList.Free;
end;

procedure TFrameJCBK.SpVoice(s: string);
begin
  WinExec(PAnsiChar(AnsiString(ExtractFilePath(ParamStr(0)) + 'SpVoice.exe ' +
    s)), SW_Hide);
end;

procedure TFrameJCBK.dxTileControl2Item1Click(Sender: TdxTileControlItem);
begin
  FAlarmIndex := Sender.Tag;
  ShowAlarm(FAlarmList[Sender.Tag]);
  Timer1.Interval := 10000;
  // if btnPause.Caption = '暂停' then
  // btnPauseClick(nil);
end;

procedure TFrameJCBK.FrameResize(Sender: TObject);
begin
  dxLayoutItem27.Width := dxLayoutControl1.Width div 3;
  dxTileControl2.OptionsView.GroupBlockMaxColumnCount :=
    dxTileControl2.Width div 130;
  dxTileControl1.OptionsView.GroupBlockMaxColumnCount :=
    dxTileControl1.Width div 130;
end;

procedure TFrameJCBK.SetSBBH(const Value: string);
begin
  FSBBH := Value;
end;

procedure TFrameJCBK.ShowAlarm(alarm: TAlarmResult);
var
  veh: TVehInfo;
  picFile: string;
begin
  if TLZDictionary.gDicMain.ContainsKey('BKLX') and TLZDictionary.gDicMain
    ['BKLX'].ContainsKey(alarm.BKLX) then
    edtBKLX.Text := TLZDictionary.gDicMain['BKLX'][alarm.BKLX]
  else
    edtBKLX.Text := '';

  if TLZDictionary.gDicDev[2].ContainsKey(alarm.KDBH) then
    edtSBDDMC.Text := TLZDictionary.gDicDev[2][alarm.KDBH].SBDDMC
  else
    edtSBDDMC.Text := '未知地点';
  edtGCSJ.Text := alarm.GCSJ.Substring(alarm.GCSJ.IndexOf(' ') + 1);
  edtCD.Text := alarm.CD;
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(alarm.hpzl) then
    edtHPZL.Text := TLZDictionary.gDicMain['HPZL'][alarm.hpzl]
  else
    edtHPZL.Text := '未知号牌种类';
  edtHPHM.Text := alarm.HPHM;
  edtSD.Text := alarm.CLSD;
  edtBKXX.Text := alarm.BZ;

  veh := TCommon.GetVehinfo(alarm.HPHM, alarm.hpzl,'');
  edtCLPP.Text := veh.clpp1;
  edtCLXH.Text := veh.clxh;
  if TLZDictionary.gDicMain.ContainsKey('CSYS') and TLZDictionary.gDicMain
    ['CSYS'].ContainsKey(veh.csys) then
    edtCSYS.Text := TLZDictionary.gDicMain['CSYS'][veh.csys]
  else
    edtCSYS.Text := '';
  edtCLSBDH.Text := veh.clsbdh;
  edtFDJH.Text := veh.fdjh;
  if veh.ccdjrq.IndexOf(' ') > 0 then
    edtCCDJRQ.Text := veh.ccdjrq.Substring(0, veh.ccdjrq.IndexOf(' '));
  if veh.yxqz.IndexOf(' ') > 0 then
    edtYXQX.Text := veh.yxqz.Substring(0, veh.yxqz.IndexOf(' '));
  if veh.qzbfqz.IndexOf(' ') > 0 then
    edtBFQX.Text := veh.qzbfqz.Substring(0, veh.qzbfqz.IndexOf(' '));
  if TLZDictionary.gDicMain.ContainsKey('SYXZ') and TLZDictionary.gDicMain
    ['SYXZ'].ContainsKey(veh.syxz) then
    edtSYXZ.Text := TLZDictionary.gDicMain['SYXZ'][veh.syxz]
  else
    edtSYXZ.Text := '';
  edtCLZT.Text := TLZDictionary.DM2MC('CLZT', veh.zt);
  edtSYR.Text := veh.syr;
  edtCZDZ.Text := veh.ZSXXDZ;
  if alarm.VIOURL <> '' then
  begin
    picFile := gSetup.DirSave + alarm.GCXH + '.jpg';
    if TCommon.GetPic(alarm.VIOURL, '', picFile) then
    begin
      ShowVioPicture(picFile);
    end
    else
    begin
      ImageEnVect1.Clear;
    end;
  end;
  liDJ.Visible := alarm.BKLX = '66';
  liFeedback.Visible := not btnSign.Visible;
end;

procedure TFrameJCBK.ShowVioPicture(picFile: string);
begin
  fz := false;
  FPicFile := picFile;
  ImageEnVect1.AutoFit := true;
  if not FileExists(FPicFile) then
  begin
    ImageEnVect1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'image\ZWTP.png');
    exit;
  end;

  with ImageEnVect1.IO do
  begin
    NativePixelFormat := true;
    LoadFromFile(FPicFile);
  end;
  ImageEnVect1.AutoFit := false;

  ImageEnVect1.Select(0, 0, 0, 0, iespReplace);
  ImageEnVect1.MouseInteract := [miSelect];
  ImageEnVect1.SelectionOptions := [iesoMoveable, iesoCanScroll];
end;

function TFrameJCBK.GetColor(hpzl: string): TColor;
begin
  if hpzl = '02' then
    result := clblue
  else if hpzl = '06' then
    result := clGray
  else if (hpzl = '23') or (hpzl = '24') then
    result := clWhite
  else
    result := clWebOrange;
end;

procedure TFrameJCBK.AddItem(alarm: TAlarmResult;
  dxTileControl: TdxTileControl);
begin
  with dxTileControl.Items.Add do
  begin
    GroupIndex := 0;
    Size := dxCustomTileControl.TdxTileControlItemSize.tcisRegular;
    Text1.Font.Size := 16;
    if TLZDictionary.gDicMain.ContainsKey('BKLXBM') and TLZDictionary.gDicMain
      ['BKLXBM'].ContainsKey(alarm.BKLX) then
      Text1.Value := TLZDictionary.gDicMain['BKLXBM'][alarm.BKLX];
    Text4.Font.Size := 12;
    Text4.Value := alarm.HPHM;
    if alarm.BKZL = '自动同步' then
      Text2.Value := '集';
    if alarm.BKLX = '06' then
      Text2.Value := Text2.Value + ' ' + alarm.WFCS;
    Style.GradientBeginColor := GetColor(alarm.hpzl);
    Tag := dxTileControl1.Items.Count + dxTileControl2.Items.Count - 1;
    OnClick := dxTileControl2Item1Click;
  end;
end;

procedure TFrameJCBK.LoadAlarm;

  function Exists(alarm: TAlarmResult): Boolean;
  var
    obj: TAlarmResult;
  begin
    for obj in FAlarmList do
    begin
      if (obj.HPHM = alarm.HPHM) and (obj.hpzl = alarm.hpzl) then
        exit(true);
    end;
    exit(false);
  end;

  function GetVoice(alarm: TAlarmResult): string;
  var
    i: Integer;
    s, sp: string;
  begin
    result := '';
    if Pos(UpperCase('Windows xp'), UpperCase(TOSVersion.ToString)) > 0 then
      sp := '_'
    else
      sp := '^';
    if not FDoneAlarmList.ContainsKey(alarm.GCXH) then
    begin // 用 FKSJ装载 GetDate()
      if (vartodatetime(alarm.FKSJ) - vartodatetime(alarm.GCSJ)) < OneMinute
      then
      begin
        result := TLZDictionary.gDicMain['BKLX'][alarm.BKLX] + ',' +
          TLZDictionary.gDicMain['HPZL'][alarm.hpzl];
        for i := 1 to alarm.HPHM.Length do
          result := result + alarm.HPHM[i] + sp; // 防止语音播报成自然数
        // result := result + TLZDictionary.gDicDev[2][alarm.KDBH].SBDDMC;
        if FSJHM <> '' then
        begin
          s := TLZDictionary.gDicMain['BKLX'][alarm.BKLX] + ',' +
            TLZDictionary.gDicMain['HPZL'][alarm.hpzl] + alarm.HPHM + ',' +
            TLZDictionary.gDicDev[2][alarm.KDBH].SBDDMC + ',' + alarm.GCSJ;
          TRequestItf.DbQuery('SendSMS', 'sjhm=' + FSJHM + '&content=' + s);
        end;
      end;
      FDoneAlarmList.Add(alarm.GCXH, true);
    end;
  end;

  function GetBKLX: string;
  var
    s: string;
  begin
    s := cboBKLX.Text;
    result := '';
    for s in s.Split([';']) do
      result := result +','+ s.Substring(0, 1);
  end;
var
  json, vioce: string;
  list: TList<TAlarmResult>;
  alarm: TAlarmResult;
  voiceList: string;
  b: Boolean;
  n: Integer;
  veh: TVehInfo;
  bklx: string;
begin
  FAlarmList.Clear;
  voiceList := '';
  n := 0;
  bklx := GetBKLX;
  json := TRequestItf.DbQuery('GetJCBKData', 'sbbh=' + FSBBH + '&bklx' + bklx);
  list := TJsonUtils.JsonToRecordList<TAlarmResult>(json);
  for alarm in list do
  begin
    if FWhiteList.ContainsKey(alarm.HPHM + alarm.hpzl) then
      continue; // 白名单
    if (not cbMoto.Checked) and (alarm.hpzl = '07') then
      continue;
    if (not cbDC.Checked) and (alarm.hpzl = '01') then
      continue;
    if Exists(alarm) then
      continue;
    if (alarm.BKLX = '21') and (not CheckBKR(alarm.HPHM, alarm.hpzl, gUser.yhbh))
    then
      continue; // 刑事案件不提醒，避免打草惊蛇
    if (alarm.BKLX = '04') or (alarm.BKLX = '06') then
    begin
      if FVehDic.ContainsKey(alarm.HPHM+alarm.HPZL) then
        veh := FVehDic[alarm.HPHM + alarm.HPZL]
      else begin
        veh := TCommon.GetVehinfo(alarm.HPHM, alarm.HPZL, '');
        FVehDic.Add(alarm.HPHM+alarm.HPZL, veh);
      end;
      if veh.HPHM <> '' then
      begin
        if (alarm.BKLX = '04') and (not veh.zt.Contains('Q')) then // 已年审
          continue;
        if (alarm.BKLX = '06') and (not veh.zt.Contains('G')) then // 已处理违法
          continue;
      end;
    end;
    FAlarmList.Add(alarm);
    AddItem(alarm, dxTileControl2);
    vioce := GetVoice(alarm);
    if vioce <> '' then
    begin
      inc(n);
      voiceList := voiceList + vioce + ',';
    end;
  end;
  list.Free;

  // 获取附近路口告警
  json := TRequestItf.DbQuery('GetJCBKNData', 'sbbh=' + FSBBH);
  list := TJsonUtils.JsonToRecordList<TAlarmResult>(json);
  b := false;
  for alarm in list do
  begin
    if (not cbMoto.Checked) and (alarm.hpzl = '07') then
      continue;
    if (not cbDC.Checked) and (alarm.hpzl = '01') then
      continue;
    if Exists(alarm) then
      continue;
    if (alarm.BKLX = '21') and (not CheckBKR(alarm.HPHM, alarm.hpzl, gUser.yhbh))
    then
      continue;
    if (alarm.BKLX = '04') or (alarm.BKLX = '06') then
    begin
      if FVehDic.ContainsKey(alarm.HPHM+alarm.HPZL) then
        veh := FVehDic[alarm.HPHM + alarm.HPZL]
      else begin
        veh := TCommon.GetVehinfo(alarm.HPHM, alarm.HPZL, '');
        FVehDic.Add(alarm.HPHM+alarm.HPZL, veh);
      end;
      if veh.HPHM <> '' then
      begin
        if (alarm.BKLX = '04') and (not veh.zt.Contains('Q')) then // 已年审
          continue;
        if (alarm.BKLX = '06') and (not veh.zt.Contains('G')) then // 已处理违法
          continue;
      end;
    end;
    FAlarmList.Add(alarm);
    b := true;
    labN.Caption := TLZDictionary.gDicDev[2][alarm.KDBH].SBDDMC;
    labTime.Caption := copy(alarm.GCSJ, 12, 10);
    lab.Caption := TLZDictionary.gDicDev[2][alarm.FKNR].SBDDMC; // 用 FKNR 装载 本路口
    labCar.Caption := ' ' + alarm.HPHM + ' [' + TLZDictionary.gDicMain['BKLXBM']
      [alarm.BKLX] + '] ';
    labCar.Style.Color := GetColor(alarm.hpzl);
    labCar.Tag := FAlarmList.Count - 1;
    imgCar.Tag := FAlarmList.Count - 1;
    imgFX1.Visible := alarm.FKR = '1';
    imgFX2.Visible := alarm.FKR = '2';
    AddItem(alarm, dxTileControl1);
    vioce := GetVoice(alarm);
    if vioce <> '' then
    begin
      voiceList := voiceList + vioce + ',';
      inc(n);
    end;
  end;
  list.Free;
  liRoad.Visible := b;
  if voiceList <> '' then
  begin
    if LastSpeekTime < Now then
    begin
      SpVoice(voiceList);
      LastSpeekTime := Now + n * 5 / 24 / 60 / 60;
    end;
  end;

  FAlarmIndex := -1;
  if FAlarmList.Count > 0 then
  begin
    ShowAlarm(FAlarmList[0]);
    FAlarmIndex := 0;
  end;
end;

function TFrameJCBK.CheckBKR(HPHM, hpzl, yhbh: string): Boolean;
var
  json: string;
begin
  json := TRequestItf.DbQuery('GetT_KK_ALARM', 'HPHM=' + HPHM + '&HPZL=' + hpzl
    + '&BKR=' + yhbh);
  result := json <> '';
end;

procedure TFrameJCBK.Timer1Timer(Sender: TObject);
begin
  btnPause.Caption := '暂停';
  dxTileControl2.Items.Clear;
  dxTileControl1.Items.Clear;
  LoadAlarm;
  Timer1.Interval := 3000;
  if now - FOpenTime > 12 * OneHour then
  begin
    btnPauseClick(nil);
    Application.MessageBox('已暂停接收数据，请重新启动实时监控。', '提示');
  end;
end;

procedure TFrameJCBK.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := false;
  btnDeviceClick(nil);
end;

end.
