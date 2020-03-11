unit uFrameZFZ;

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
  dxSkinXmas2008Blue, dxCustomTileControl, cxClasses, dxTileControl,
  dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Vcl.StdCtrls,
  dxLayoutControlAdapters, Vcl.Menus, cxButtons, Vcl.ExtCtrls, IdHTTP,
  dxAnimation, System.ImageList, Vcl.ImgList, uDM, Generics.Collections,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, cxLabel, uEntity,
  cxMemo, uFrameSelectDev, uFrameFeedback, uFrameSign, dxpicdata,
  System.Win.ComObj, System.Contnrs, cxGroupBox, uFrameInput,
  dxGDIPlusClasses, cxCheckBox, dxViodata, cxMaskEdit, cxDropDownEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCheckComboBox,
  cxCheckListBox;

type
  TBack = procedure of Object;

  TFrameZFZ = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup3: TdxLayoutGroup;
    edtSYXZ: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    edtDJRQ: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    edtCLPP: TcxTextEdit;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem29: TdxLayoutItem;
    edtCLLX: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    edthphm: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    cboHPZL: TcxComboBox;
    dxLayoutGroup1: TdxLayoutGroup;
    lgVeh: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    cboJCCLLX: TcxComboBox;
    edtWFCS: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    edtCLZT: TcxTextEdit;
    cbYQWNJ: TcxCheckBox;
    dxLayoutItem9: TdxLayoutItem;
    cbYQWBF: TcxCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    cbWFWCL: TcxCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    edtSFD: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    lgBaseInfo: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    edtMDD: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    edtZFZMC: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    cbSFYFJ: TcxCheckBox;
    dxLayoutItem19: TdxLayoutItem;
    cboGPS: TcxTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    cboJCR: TcxTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    edtJCSJ: TcxTextEdit;
    dxLayoutGroup11: TdxLayoutGroup;
    dxLayoutItem23: TdxLayoutItem;
    edtMS: TcxMemo;
    lgDrivera: TdxLayoutGroup;
    lgDriver1: TdxLayoutGroup;
    lgDriver2: TdxLayoutGroup;
    lgDriver3: TdxLayoutGroup;
    lgDriver11: TdxLayoutGroup;
    liDriver1: TdxLayoutItem;
    liDriver3: TdxLayoutItem;
    liDriver4: TdxLayoutItem;
    liDriver5: TdxLayoutItem;
    liDriver6: TdxLayoutItem;
    liDriver7: TdxLayoutItem;
    liDriver9: TdxLayoutItem;
    liDriver10: TdxLayoutItem;
    liDriver13: TdxLayoutItem;
    liDriver12: TdxLayoutItem;
    liDriver8: TdxLayoutItem;
    txtDriverJSZH: TcxTextEdit;
    txtDriverXM: TcxTextEdit;
    txtDriverLXDH: TcxTextEdit;
    txtDriverFZJG: TcxTextEdit;
    txtDriverJZZT: TcxTextEdit;
    txtDriverLZRQ: TcxTextEdit;
    txtDriverZJCX: TcxTextEdit;
    txtDriverLXDZ: TcxTextEdit;
    cbDriverCF: TcxCheckBox;
    cbDriverYQWSY: TcxCheckBox;
    cbDriverYQWHZ: TcxCheckBox;

    lgFJSa: TdxLayoutGroup;
    lgFJS1: TdxLayoutGroup;
    lgFJS2: TdxLayoutGroup;
    lgFJS3: TdxLayoutGroup;
    lgFJS11: TdxLayoutGroup;
    liFJS1: TdxLayoutItem;
    liFJS3: TdxLayoutItem;
    liFJS4: TdxLayoutItem;
    liFJS5: TdxLayoutItem;
    liFJS6: TdxLayoutItem;
    liFJS7: TdxLayoutItem;
    liFJS9: TdxLayoutItem;
    liFJS10: TdxLayoutItem;
    liFJS13: TdxLayoutItem;
    liFJS12: TdxLayoutItem;
    liFJS8: TdxLayoutItem;
    txtFJSJSZH: TcxTextEdit;
    txtFJSXM: TcxTextEdit;
    txtFJSLXDH: TcxTextEdit;
    txtFJSFZJG: TcxTextEdit;
    txtFJSJZZT: TcxTextEdit;
    txtFJSLZRQ: TcxTextEdit;
    txtFJSZJCX: TcxTextEdit;
    txtFJSLXDZ: TcxTextEdit;
    cbFJSCF: TcxCheckBox;
    cbFJSYQWSY: TcxCheckBox;
    cbFJSYQWHZ: TcxCheckBox;

    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem3: TdxLayoutSeparatorItem;
    lgFJS: TdxLayoutGroup;
    lgDriver: TdxLayoutGroup;
    dxLayoutSeparatorItem4: TdxLayoutSeparatorItem;
    liHZ: TdxLayoutItem;
    liSZ: TdxLayoutItem;
    edtHZ: TcxTextEdit;
    edtSZ: TcxTextEdit;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup12: TdxLayoutGroup;
    dxLayoutGroup13: TdxLayoutGroup;
    dxLayoutGroup14: TdxLayoutGroup;
    liBack: TdxLayoutItem;
    cxButton3: TcxButton;
    liMessage: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    edtYJBM: TcxTextEdit;
    procedure cxButton3Click(Sender: TObject);
  private
    FItem: TVehCheck;
    FOnBack: TBack;
    procedure ShowItem(item: TVehCheck);
    function GetColor(hpzl: string): TColor;
    procedure LoadVehInfo;
    procedure LoadDrvInfo;
    procedure LoadFJInfo;
    procedure ChangeCheckBoxColor(cb: TcxCheckBox);
    procedure SetCboValue(cbo: TcxComboBox; subValue: string);
    procedure SetVehCheckItem(const Value: TVehCheck);
    function GetJCNR(item: TVehCheck): string;
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    property VehCheckItem: TVehCheck read FItem write SetVehCheckItem;
    property OnBack: TBack read FOnBack write FOnBack;
  end;

implementation

uses
  uRequestItf, uJsonUtils, uGlobal, Udictionary, uCommon;
{$R *.dfm}

procedure TFrameZFZ.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cboHPZL, TLZDictionary.gDicMain['HPZL'], True);
end;

procedure TFrameZFZ.BeforeDestruction;
begin
  inherited;
end;

function TFrameZFZ.GetJCNR(item: TVehCheck): string;
var
  s: string;
begin
  s := '';
  if item.pljs = '1' then s := s + '疲劳驾驶 ';
  if item.AQSB = '0' then s := s + '安全设备不合格 ';
  if item.CLLTHW = '0' then s := s + '轮胎花纹不合格 ';
  if item.jaqd = '0' then s := s + '未系安全带 ';
  if item.wfyy = '1' then s := s + '违法营运 ';
  if item.CY = '1' then s := s + '车辆超员 ';
  if item.XGJSBZ = '0' then s := s + '未悬挂或喷涂警示标志 ';
  if item.AZDSJ = '0' then s := s + '未按指定时间行驶 ';
  if item.AZDLX = '0' then s := s + '未按指定路线行驶 ';
  if item.QDYSTXZ = '0' then s := s + '未取得道路运输通行证 ';
  if item.ZTFGBS = '0' then s := s + '未按规定粘贴反光标识 ';
  if item.AZFHZZ = '0' then s := s + '未安装侧后防护装置 ';
  if item.FFGZ = '1' then s := s + '非法改装 ';
  if item.CZ = '1' then s := s + '超载 ';
  result := s;
end;

procedure TFrameZFZ.cxButton3Click(Sender: TObject);
begin
  if Assigned(OnBack) then
    OnBack;
end;

function TFrameZFZ.GetColor(hpzl: string): TColor;
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

procedure TFrameZFZ.SetCboValue(cbo: TcxComboBox; subValue: string);
var
  i: Integer;
begin
  for i := 0 to cbo.Properties.Items.Count - 1 do
  begin
    if cbo.Properties.Items[i].Contains(subValue) then
    begin
      cbo.SelectedItem := i;
      cbo.Text := cbo.Properties.Items[i];
    end;
  end;
end;

procedure TFrameZFZ.SetVehCheckItem(const Value: TVehCheck);
begin
  FItem := Value;
  ShowItem(Value);
  liBack.Visible := True;
end;

procedure TFrameZFZ.ShowItem(item: TVehCheck);
begin
  edthphm.Text := item.HPHM;
  SetCboValue(cboHPZL, item.hpzl);
  cboJCCLLX.Text := item.jccllx;
  LoadVehInfo;
  edtSFD.Text := item.SFD;
  edtMDD.Text := item.MDD;
  edtZFZMC.Text := item.FWZMC;
  cbSFYFJ.Checked := item.SFYFJSY = '1';
  lgFJS.Visible := cbSFYFJ.Checked;
  if item.GPS = '1' then
    cboGPS.Text := '正常'
  else if item.GPS = '0' then
    cboGPS.Text := '未开启'
  else if item.GPS = '9' then
    cboGPS.Text := '未配备'
  else
    cboGPS.Text := '';
  edtHZ.Text := IntToStr(item.HDZKL + item.HDZZL);
  edtSZ.Text := IntToStr(item.ZKS + item.SJZZL);
  cboJCR.Text := item.JCMJ;
  edtJCSJ.Text := item.JCSJ;
  edtMS.Text := GetJCNR(item) + #13#10 + #13#10 + item.JCQKMS;
  edtYJBM.Text := item.YJBM;
  txtDriverJSZH.Text := item.ZJSZH;
  if item.ZJSZH <> '' then
    LoadDrvInfo;
  txtFJSJSZH.Text := item.FJSZH;
  if item.FJSZH <> '' then
    LoadFJInfo;
end;

procedure TFrameZFZ.LoadVehInfo;
var
  veh: TVehInfo;
begin
  veh := TCommon.GetVehinfo(edthphm.Text, TLZDictionary.StrtoDicInfo(cboHPZL.Text).dm, '');

  if TLZDictionary.gDicMain['CLLX'].ContainsKey(veh.cllx) then
    edtCLLX.Text := TLZDictionary.gDicMain['CLLX'][veh.cllx];
  if TLZDictionary.gDicMain['SYXZ'].ContainsKey(veh.syxz) then
    edtSYXZ.Text := TLZDictionary.gDicMain['SYXZ'][veh.syxz];
  edtCLPP.Text := veh.clpp1;
  edtDJRQ.Text := veh.ccdjrq;
  edtCLZT.Text := TLZDictionary.DM2MC('CLZT', veh.zt);

  if veh.yxqz <> '' then
  begin
    cbYQWNJ.Caption := veh.yxqz.Substring(0, 10);
    cbYQWNJ.Checked := veh.yxqz < FormatDateTime('yyyy-mm-dd', now);
    cbYQWBF.Caption := veh.qzbfqz.Substring(0, 10);
    cbYQWBF.Checked := veh.qzbfqz < FormatDateTime('yyyy-mm-dd', now);
  end;
  cbWFWCL.Checked := veh.zt.Contains('G');
  ChangeCheckBoxColor(cbYQWNJ);
  ChangeCheckBoxColor(cbYQWBF);
  ChangeCheckBoxColor(cbWFWCL);
end;

procedure TFrameZFZ.LoadDrvInfo;
var
  drv: TDrvInfo;
begin
  drv := TCommon.GetDrvInfo(txtDriverJSZH.Text);
  txtDriverXM.Text := drv.XM;
  txtDriverFZJG.Text := drv.fzjg;
  txtDriverJZZT.Text := TLZDictionary.DM2MC('JSRZT', drv.zt);
  txtDriverLZRQ.Text := drv.cclzrq;
  txtDriverZJCX.Text := drv.zjcx;
  txtDriverLXDH.Text := drv.lxdh;
  txtDriverLXDZ.Text := drv.djzsxxdz;
  cbDriverCF.Checked := drv.zt.Contains('B');
  cbDriverYQWSY.Checked := drv.zt.Contains('R');
  cbDriverYQWHZ.Checked := drv.zt.Contains('M');
  ChangeCheckBoxColor(cbDriverCF);
  ChangeCheckBoxColor(cbDriverYQWSY);
  ChangeCheckBoxColor(cbDriverYQWHZ);
end;

procedure TFrameZFZ.LoadFJInfo;
var
  drv: TDrvInfo;
begin
  drv := TCommon.GetDrvInfo(txtFJSJSZH.Text);
  txtFJSXM.Text := drv.XM;
  txtFJSFZJG.Text := drv.fzjg;
  txtFJSJZZT.Text := TLZDictionary.DM2MC('JSRZT', drv.zt);
  txtFJSLZRQ.Text := drv.cclzrq;
  txtFJSZJCX.Text := drv.zjcx;
  txtFJSLXDH.Text := drv.lxdh;
  txtFJSLXDZ.Text := drv.djzsxxdz;
  cbFJSCF.Checked := drv.zt.Contains('B');
  cbFJSYQWSY.Checked := drv.zt.Contains('R');
  cbFJSYQWHZ.Checked := drv.zt.Contains('M');
  ChangeCheckBoxColor(cbFJSCF);
  ChangeCheckBoxColor(cbFJSYQWSY);
  ChangeCheckBoxColor(cbFJSYQWHZ);
end;

procedure TFrameZFZ.ChangeCheckBoxColor(cb: TcxCheckBox);
begin
  if cb.Checked then
    cb.Style.Color := clRed
  else
    cb.Style.Color := clBtnFace;
end;

end.
