unit uFrameJianYi;

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
  System.Win.ComObj, System.Contnrs,  cxGroupBox, uFrameInput,
  dxGDIPlusClasses, cxCheckBox, dxViodata, cxMaskEdit, cxDropDownEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCheckComboBox, cxCheckListBox,
  cxRadioGroup, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TBack = procedure of Object;
  TFrameJianYi = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    txtJYW: TcxTextEdit;
    dxLayoutGroup1: TdxLayoutGroup;
    lgVeh: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    cboZQMJ: TcxComboBox;
    cboJSZZL1: TcxComboBox;
    dxLayoutItem12: TdxLayoutItem;
    lgBaseInfo: TdxLayoutGroup;
    dxLayoutItem18: TdxLayoutItem;
    cbJG: TcxRadioButton;
    dxLayoutItem22: TdxLayoutItem;
    txtWFSJ: TcxDateEdit;
    dxLayoutGroup11: TdxLayoutGroup;
    dxLayoutItem23: TdxLayoutItem;
    txtBZ: TcxMemo;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem4: TdxLayoutSeparatorItem;
    btnSave: TcxButton;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    btnCancel: TcxButton;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup12: TdxLayoutGroup;
    dxLayoutGroup13: TdxLayoutGroup;
    dxLayoutGroup14: TdxLayoutGroup;
    liBack: TdxLayoutItem;
    btnBack: TcxButton;
    liMessage: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    txtJDSBH2: TcxTextEdit;
    txtJDSBH1: TcxTextEdit;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    cboJSZZL2: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    txtZJHM: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    txtDABH: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    txtDSR: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    txtZJCX: TcxTextEdit;
    dxLayoutItem14: TdxLayoutItem;
    txtLXDH: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    txtLXDZ: TcxTextEdit;
    dxLayoutItem17: TdxLayoutItem;
    txtHPHM: TcxTextEdit;
    dxLayoutItem19: TdxLayoutItem;
    cboCLFL: TcxComboBox;
    dxLayoutItem20: TdxLayoutItem;
    cboCLLX: TcxComboBox;
    dxLayoutItem21: TdxLayoutItem;
    cboHPZL: TcxComboBox;
    dxLayoutItem25: TdxLayoutItem;
    cboSYXZ: TcxComboBox;
    dxLayoutItem26: TdxLayoutItem;
    cboDLDM2: TcxComboBox;
    dxLayoutItem27: TdxLayoutItem;
    txtDLDM1: TcxTextEdit;
    dxLayoutItem28: TdxLayoutItem;
    txtWFDZ: TcxTextEdit;
    dxLayoutItem29: TdxLayoutItem;
    cboSGLX: TcxComboBox;
    dxLayoutItem30: TdxLayoutItem;
    txtSYR: TcxTextEdit;
    dxLayoutItem31: TdxLayoutItem;
    cboXZQH: TcxComboBox;
    dxLayoutItem32: TdxLayoutItem;
    txtLK1: TcxTextEdit;
    dxLayoutItem33: TdxLayoutItem;
    cboLK2: TcxComboBox;
    dxLayoutItem34: TdxLayoutItem;
    txtLK3: TcxTextEdit;
    dxLayoutItem35: TdxLayoutItem;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutGroup10: TdxLayoutGroup;
    dxLayoutItem36: TdxLayoutItem;
    txtCLSJ: TcxDateEdit;
    txtDLLX: TcxTextEdit;
    dxLayoutItem37: TdxLayoutItem;
    txtWFDM: TcxTextEdit;
    dxLayoutItem39: TdxLayoutItem;
    dxLayoutGroup15: TdxLayoutGroup;
    dxLayoutItem40: TdxLayoutItem;
    cbFK: TcxRadioButton;
    lblWFJF: TcxLabel;
    dxLayoutItem41: TdxLayoutItem;
    lblFKJE: TcxLabel;
    dxLayoutItem38: TdxLayoutItem;
    lblWFNR: TcxLabel;
    dxLayoutItem42: TdxLayoutItem;
    ckbZXRY: TcxCheckBox;
    dxLayoutGroup16: TdxLayoutGroup;
    dxLayoutItem43: TdxLayoutItem;
    txtXM: TcxTextEdit;
    dxLayoutItem44: TdxLayoutItem;
    txtSFZM: TcxTextEdit;
    rbBFK: TcxRadioButton;
    dxLayoutItem46: TdxLayoutItem;
    dxLayoutGroup17: TdxLayoutGroup;
    dxLayoutItem47: TdxLayoutItem;
    rbYHJK: TcxRadioButton;
    dxLayoutItem48: TdxLayoutItem;
    rbXCJK: TcxRadioButton;
    dxLayoutGroup18: TdxLayoutGroup;
    dxLayoutItem49: TdxLayoutItem;
    cboJSJQ: TcxComboBox;
    dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem3: TdxLayoutSeparatorItem;
    dxLayoutItem7: TdxLayoutItem;
    txtFZJG: TcxTextEdit;
    dxLayoutSeparatorItem5: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem6: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem7: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem8: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem9: TdxLayoutSeparatorItem;
    procedure cboHPZLPropertiesCloseUp(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure txtHPHMKeyPress(Sender: TObject; var Key: Char);
    procedure txtZJHMKeyPress(Sender: TObject; var Key: Char);
    procedure txtWFDMKeyPress(Sender: TObject; var Key: Char);
    procedure cbJGClick(Sender: TObject);
  private
    FItem: TViolationWrite;
    FOnBack: TBack;
    procedure ShowItem(item: TViolationWrite);
    function CheckInput(entity: TViolationWrite): boolean;
    function Submit(entity: TViolationWrite): boolean;
    procedure SetCboValue(cbo: TcxCombobox; subValue: string);
    procedure ClearInputs;
    procedure SetVehCheckItem(const Value: TViolationWrite);
    function GetEntity: TViolationWrite;
    procedure GetJDSBH;
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    property ViolationWriteItem: TViolationWrite read FItem write SetVehCheckItem;
    property OnBack: TBack read FOnBack write FOnBack;
  end;

implementation

uses
  uRequestItf, uJsonUtils, uGlobal, Udictionary, uCommon;
{$R *.dfm}

procedure TFrameJianYi.AfterConstruction;
var
  u: TUser;
  jdsbh: string;
begin
  inherited;
  TLZDictionary.BindCombobox(cbohpzl, TLZDictionary.gDicMain['HPZL'], True);
  cboHPZL.ItemIndex := 1;
  TLZDictionary.BindCombobox(cboCLLX, TLZDictionary.gDicMain['CLLX'], True);
  cboCLLX.ItemIndex := 196;
  TLZDictionary.BindCombobox(cboSYXZ, TLZDictionary.gDicMain['SYXZ'], False);
  cboCLLX.ItemIndex := 0;
  //DONE: BindZQMJ 执勤民警
  for u in TLZDictionary.gDicUser.Values do
  begin
    if u.DWDM = gUser.DWDM then
      cboZQMJ.Properties.Items.Add(u.yhbh + ':' + u.YHXM);
  end;
  cboZQMJ.Text := gUser.yhbh + ':' + gUser.YHXM;

  GetJDSBH;
  txtWFSJ.Date := now;
  txtCLSJ.Date := now;
end;

procedure TFrameJianYi.BeforeDestruction;
begin
  TRequestItf.RmQuery('ROLLBACKWSBH', 'wsbh=' + txtJDSBH1.Text + txtJDSBH2.Text);
  inherited;
end;

procedure TFrameJianYi.cbJGClick(Sender: TObject);
begin
  if cbJG.Checked then
  begin
    lblFKJE.Caption := '0';
    rbBFK.Checked := true;
  end
  else begin
    if TLZDictionary.gDicWfxw.ContainsKey(txtWFDM.Text) then
    begin
      lblFKJE.Caption := TLZDictionary.gDicWfxw[txtWFDM.Text].JE;
    end;
    rbYHJK.Checked := true;
  end;
end;

procedure TFrameJianYi.cboHPZLPropertiesCloseUp(Sender: TObject);
var
  veh: TVehInfo;
begin
  if (txtHPHM.Text <> '')and(cboHPZL.Text <> '') then
  begin
    veh := TCommon.GetVehinfo(txtHPHM.Text, Copy(cboHPZL.Text, 1, 2), '');
    cboCLLX.Text := TLZDictionary.gDicMain['CLLX'][veh.cllx];
    cboSYXZ.Text := TLZDictionary.gDicMain['SYXZ'][veh.syxz];
    txtSYR.Text := veh.syr;
  end;
end;

function TFrameJianYi.GetEntity: TViolationWrite;
begin
  result.jdsbh := txtJDSBH1.Text + txtJDSBH2.Text;
  result.ryfl := Copy(cboJSZZL1.Text, 1, 1);
  result.jszh := txtZJHM.Text;
  result.dabh := txtDABH.Text;
  result.fzjg := txtFZJG.Text;
  result.zjcx := txtZJCX.Text;
  result.dsr := txtDSR.Text;
  result.dh := txtLXDH.Text;
  result.zsxxdz := txtLXDZ.Text;
  result.clfl := Copy(cboCLFL.Text, 1, 1);
  result.hpzl := Copy(cboHPZL.Text, 1, 2);
  result.hphm := txtHPHM.Text;
  result.jtfs := 'C01'; // 乘车
  result.wfsj := FormatDateTime('yyyy-mm-dd hh:nn', txtWFSJ.Date);     // YYYY-MM-DD hh24:MI精确到分
  result.xzqh := Copy(cboXZQH.Text, 1, 6);
  result.wfdd := txtDLDM1.Text;
  result.lddm := txtLK1.Text;
  result.ddms := txtLK3.Text;
  result.wfdz := txtWFDZ.Text;
  result.wfxw := txtWFDM.Text;
  if cbJG.Checked then
    result.cfzl := '1'
  else if cbFK.Checked then
    result.cfzl := '2'
  else
    result.cfzl := '';
  result.fkje := lblFKJE.Caption;
  result.zqmj := copy(cboZQMJ.Text, 1, 6);
  result.jkbj := '0';   // 未缴款
  if rbBFK.Checked then
  begin
    result.jkfs := '0';
    result.jkbj := '9'; // 无需缴款
  end
  else if rbXCJK.Checked then
    result.jkfs := '1'
  else
    result.jkfs := '2';
  if TLZDictionary.gDicUser.ContainsKey(result.zqmj) then
    result.fxjg := TLZDictionary.gDicUser[result.zqmj].DWDM;
  result.jsjqbj := Copy(cboJSJQ.Text, 1, 2);
  result.sgdj := '0';
end;

function TFrameJianYi.CheckInput(entity: TViolationWrite): boolean;
begin
  result := (entity.jdsbh <> '')
    and (entity.ZQMJ <> '')
    and (entity.jszh <> '')
    and (entity.DABH <> '')
    and (entity.FZJG <> '')
    and (entity.ZJCX <> '')
    and (entity.DSR <> '')
    and (entity.CLFL <> '')
    and (entity.HPZL <> '')
    and (entity.HPHM <> '')
    and (entity.WFSJ <> '')
    and (entity.XZQH <> '')
    and (entity.wfdd <> '')
    and (entity.lddm <> '')
    and (entity.WFDZ <> '')
    and (entity.wfxw <> '')
    and (entity.cfzl <> '')
    and (entity.jsjqbj <> '')
    and (entity.fxjg <> '');
  if not result then
    Application.MessageBox('信息输入不完整', '提示');
end;

function TFrameJianYi.Submit(entity: TViolationWrite): boolean;
var
  params, json, jccllx: string;
  msg: TRmMessage;
begin
  params := 'JKID=04C54&jdsbh=' + entity.jdsbh;
  params := params + '&ryfl=' + entity.ryfl;
  params := params + '&jszh=' + entity.jszh;
  params := params + '&dabh=' + entity.dabh;
  params := params + '&fzjg=' + entity.fzjg;
  params := params + '&zjcx=' + entity.zjcx;
  params := params + '&dsr=' + entity.dsr;
  if entity.dh <> '' then
    params := params + '&dh=' + entity.dh;
  if entity.zsxxdz <> '' then
    params := params + '&zsxxdz=' + entity.zsxxdz;
  params := params + '&clfl=' + entity.clfl;
  params := params + '&hpzl=' + entity.hpzl;
  params := params + '&hphm=' + entity.hphm;
  params := params + '&jtfs=' + entity.jtfs;
  params := params + '&wfsj=' + entity.wfsj;
  params := params + '&xzqh=' + entity.xzqh;
  params := params + '&wfdd=' + entity.wfdd;
  params := params + '&lddm=' + entity.lddm;

  params := params + '&ddms=' + entity.ddms;

  params := params + '&wfdz=' + entity.wfdz;
  params := params + '&wfxw=' + entity.wfxw;
  params := params + '&cfzl=' + entity.cfzl;
  params := params + '&fkje=' + entity.fkje;
  params := params + '&zqmj=' + entity.zqmj;
  params := params + '&jkfs=' + entity.jkfs;
  params := params + '&jkbj=' + entity.jkbj;
  params := params + '&fxjg=' + entity.fxjg;
  params := params + '&jsjqbj=' + entity.jsjqbj;
  params := params + '&sgdj=' + entity.sgdj;
  json := TRequestItf.RmQuery('Write', params);
  msg := TRequestItf.GetRmMessage(json);
  result := msg.code = '1';
  if result then
  begin
    Application.MessageBox(PWideChar('保存成功！' + msg.msg), '提示');
    TRequestItf.RmQuery('SUBMITWSBH', 'wsbh=' + entity.jdsbh);
    GetJDSBH;
  end
  else
    Application.MessageBox(PWideChar('保存失败！' + msg.msg), '提示');
    //btnBack(nil);
end;

procedure TFrameJianYi.txtHPHMKeyPress(Sender: TObject; var Key: Char);
var
  veh: TVehInfo;
begin
  if key = #13 then
  begin
    veh := TCommon.GetVehinfo(txtHPHM.Text, Copy(cboHPZL.Text, 1, 2), '');
    cboCLLX.Text := veh.cllx;
    cboSYXZ.Text := veh.syxz;
    txtSYR.Text := veh.syr;
  end;
end;

procedure TFrameJianYi.txtWFDMKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    if TLZDictionary.gDicWfxw.ContainsKey(txtWFDM.Text) then
    begin
      lblWFJF.Caption := TLZDictionary.gDicWfxw[txtWFDM.Text].JF;
      lblFKJE.Caption := TLZDictionary.gDicWfxw[txtWFDM.Text].JE;
      lblWFNR.Caption := TLZDictionary.gDicWfxw[txtWFDM.Text].wfxwmc;
    end;
  end;
end;

procedure TFrameJianYi.txtZJHMKeyPress(Sender: TObject; var Key: Char);
var
  veh: TDrvInfo;
begin
  if key = #13 then
  begin
    veh := TCommon.GetDrvInfo(txtZJHM.Text);
    txtFZJG.Text := veh.fzjg;
    txtDABH.Text := veh.dabh;
    txtDSR.Text := veh.XM;
    txtZJCX.Text := veh.zjcx;
    txtLXDH.Text := veh.lxdh;
    txtLXDZ.Text := veh.djzsxxdz;
    if veh.LXZSXXDZ <> '' then
      txtLXDZ.Text := veh.LXZSXXDZ;
  end;
end;

procedure TFrameJianYi.ClearInputs;
var
  item: TViolationWrite;
begin
  item.jdsbh := '';
  ShowItem(item);
end;

procedure TFrameJianYi.btnSaveClick(Sender: TObject);
var
  entity: TViolationWrite;
begin
  entity := self.GetEntity;
  if CheckInput(entity) then
  begin
    Submit(entity);
  end;
end;

procedure TFrameJianYi.btnCancelClick(Sender: TObject);
begin
  ClearInputs;
end;

procedure TFrameJianYi.btnBackClick(Sender: TObject);
begin
  if Assigned(OnBack) then
    OnBack;
end;

procedure TFrameJianYi.SetCboValue(cbo: TcxCombobox; subValue: string);
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

procedure TFrameJianYi.SetVehCheckItem(const Value: TViolationWrite);
begin
  FItem := Value;
  ShowItem(Value);
end;

procedure TFrameJianYi.ShowItem(item: TViolationWrite);
begin

end;

procedure TFrameJianYi.GetJDSBH;
var
  jdsbh: string;
begin
  jdsbh := TRequestItf.RmQuery('APPLYWSBH','yhbh=' + gUser.yhbh + '&wslb=1&num=1');
  if jdsbh <> '' then
  begin
    txtJDSBH1.text := Copy(jdsbh, 1, 6);
    txtJDSBH2.Text := Copy(jdsbh, 7, 9);
    txtJYW.Text := TCommon.GetJYW(jdsbh);
  end;
end;

end.
