unit uDialogUserEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, Udictionary, uCommon, uGlobal, uRequestItf, uEntity, uJsonUtils,
  Generics.Collections, QBAES, cxCheckBox, FireDAC.Comp.Client;

type
  TfDialogUserEdit = class(TdxDialogBaseFrame)
    edtYhbh: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    edtYhxm: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    edtYhmm: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    edtSfzh: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtSjhm: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cbbYhzw: TcxComboBox;
    dxLayoutItem9: TdxLayoutItem;
    edtMac: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edtQsip: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    edtJsip: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    cbbDwdm: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    cbManage: TcxCheckBox;
    dxLayoutItem14: TdxLayoutItem;
    cbbSH: TcxComboBox;
    dxLayoutItem15: TdxLayoutItem;
  private
    procedure AfterConstruction; override;
    function GetEditUserInfo: String;
  public
    UserID: String;
    function SaveData: Boolean;
  end;

var
  fDialogUserEdit: TfDialogUserEdit;

implementation

{$R *.dfm}
{ TfDialogUserEdit }

procedure TfDialogUserEdit.AfterConstruction;
var
  xzqh, param: String;
  depts: TList<TDept>;
  dept: TDept;
begin
  inherited;
  cbbDwdm.Properties.Items.Clear;
  param := 'bj=1';
  if not gIsSa then
  begin
    TLZDictionary.BindCombobox(cbbYhzw, TLZDictionary.gDicMain['ZW']);
    xzqh := TCommon.GetXZQH(gUser.DWDM);
    param := param + '&like_dwdm=' + xzqh;
  end;
  depts := TJsonUtils.JsonToRecordList<TDept>
    (TRequestItf.DbQuery('GetS_Dept', param));
  for dept in depts do
    cbbDwdm.Properties.Items.Add(dept.DWMC);
  depts.Free;
end;

function TfDialogUserEdit.GetEditUserInfo: String;
var
  DWDM: String;
  dept: TDept;
begin
  DWDM := cbbDwdm.Text;
  for dept in TLZDictionary.gDicDept.Values do
    if dept.DWMC = DWDM then
    begin
      DWDM := dept.DWDM;
      break;
    end;

  Result := 'DWDM=' + DWDM + '&YHBH=' + Trim(edtYhbh.Text) + '&YHXM=' +
    Trim(edtYhxm.Text);
  if Trim(edtYhmm.Text) <> '$' then
    Result := Result + '&MM=' + AesEncrypt(Trim(edtYhbh.Text) +
      Trim(edtYhmm.Text), key);
  if cbbYhzw.ItemIndex >= 0 then
    Result := Result + '&ZW=' + cbbYhzw.Text;
  if Trim(edtSfzh.Text) <> '' then
    Result := Result + '&SFZHM=' + Trim(edtSfzh.Text);
  if Trim(edtSjhm.Text) <> '' then
    Result := Result + '&SJHM=' + Trim(edtSjhm.Text);
  if Trim(edtMac.Text) <> '' then
    Result := Result + '&MAC=' + Trim(edtMac.Text);
  if Trim(edtQsip.Text) <> '' then
    Result := Result + '&IPKS=' + Trim(edtQsip.Text);
  if Trim(edtJsip.Text) <> '' then
    Result := Result + '&IPJS=' + Trim(edtJsip.Text);
  if cbbSH.ItemIndex = 0 then
    Result := Result + '&FH=0&SH=0'
  else if cbbSH.ItemIndex = 1 then
    Result := Result + '&FH=1&SH=0'
  else if cbbSH.ItemIndex = 2 then
    Result := Result + '&FH=0&SH=1';
  // if cbFh.Checked then
  // Result := Result + '&FH=1';
  if cbManage.Checked then
    Result := Result + '&Manager=1';
  if UserID <> '' then
    Result := Result + '&Systemid=' + UserID
  else
    Result := Result + '&Zt=1&LRR=' + gUser.yhbh;
end;

function TfDialogUserEdit.SaveData: Boolean;
var
  param, sysid: String;
begin
  Result := False;
  if cbbDwdm.ItemIndex < 0 then
  begin
    Application.MessageBox('单位代码不能为空', '提示', MB_OK);
    exit;
  end;
  if Trim(edtYhbh.Text) = '' then
  begin
    Application.MessageBox('用户编号不能为空', '提示', MB_OK);
    exit;
  end;
  if Trim(edtYhxm.Text) = '' then
  begin
    Application.MessageBox('用户姓名不能为空', '提示', MB_OK);
    exit;
  end;
  if Trim(edtYhmm.Text) = '' then
  begin
    Application.MessageBox('用户密码不能为空', '提示', MB_OK);
    exit;
  end;

  param := 'YHBH=' + Trim(edtYhbh.Text);
  if UserID <> '' then
    param := param + '&zt=1&not_systemid=' + UserID
  else
    param := param + '&zt=1';

  if TRequestItf.DbQuery('GetS_User', param) <> '' then
  begin
    Application.MessageBox('用户编号已存在', '提示', MB_OK);
    exit;
  end;

  param := GetEditUserInfo;

  if UserID <> '' then
  begin
    if TRequestItf.DbQuery('ModifyS_User', param) <> '1' then
    begin
      Application.MessageBox('修改用户失败', '提示', MB_OK);
      exit;
    end;
  end
  else
  begin
    if TRequestItf.DbQuery('AddS_User', param) <> '1' then
    begin
      Application.MessageBox('添加用户失败', '提示', MB_OK);
      exit;
    end;
  end;
  Result := True;
end;

end.
