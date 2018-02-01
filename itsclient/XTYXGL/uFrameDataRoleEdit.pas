unit uFrameDataRoleEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, cxCustomData,
  cxStyles, cxTL, cxTLdxBarBuiltInMenu, Vcl.ComCtrls, cxContainer, cxEdit,
  cxTreeView, cxInplaceContainer, cxClasses, dxLayoutControl,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxMemo, cxTextEdit, uRequestItf, uJsonUtils, uUserPower,
  Generics.Collections, uGlobal, cxListView, Udictionary, uEntity, cxMaskEdit,
  cxDropDownEdit, uCommon, cxCheckBox;

type
  TRoleDevice = Record
    SystemID: String;
    RoleID: String;
    SBBH: String;
  end;

  TFrameDataRoleEdit = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    edtRole: TcxTextEdit;
    btnSave: TcxButton;
    btnCanel: TcxButton;
    Memobz: TcxMemo;
    dxLayoutItem3: TdxLayoutItem;
    lvDevice: TcxListView;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    cbbDwdm: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    edtSbbh: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    cxButton3: TcxButton;
    dxLayoutItem10: TdxLayoutItem;
    cxCheckBox1: TcxCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    FrdList: TStrings;
    FRoleID: String;
    procedure GetDevices(RoleID: String);
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  public
    procedure FillDataRole(RoleID, RoleName, Bz: String);
    function SaveData(): Boolean;
  end;

var
  FrameDataRoleEdit: TFrameDataRoleEdit;

implementation

{$R *.dfm}
{ TFrameDataRoleEdit }

procedure TFrameDataRoleEdit.AfterConstruction;
var
  xzqh, param: String;
  depts: TList<TDept>;
  dept: TDept;
begin
  inherited;
  FrdList := TStringList.Create;
  cbbDwdm.Properties.Items.Clear;
  param := 'bj=1';
  if not gIsSa then
  begin
    xzqh := TCommon.GetXZQH(gUser.DWDM);
    param := param + '&like_dwdm=' + xzqh;
  end;
  depts := TJsonUtils.JsonToRecordList<TDept>
    (TRequestItf.DbQuery('GetS_Dept', param));
  for dept in depts do
    cbbDwdm.Properties.Items.Add(dept.DWDM);
  depts.Free;
end;

procedure TFrameDataRoleEdit.BeforeDestruction;
begin
  inherited;
  FrdList.Free;
end;

procedure TFrameDataRoleEdit.cxButton1Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to lvDevice.Items.Count - 1 do
    lvDevice.Items[i].Checked := True;
end;

procedure TFrameDataRoleEdit.cxButton2Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to lvDevice.Items.Count - 1 do
    lvDevice.Items[i].Checked := not lvDevice.Items[i].Checked;
end;

procedure TFrameDataRoleEdit.cxButton3Click(Sender: TObject);
var
  devList: TList<TDevice>;
  dev: TDevice;
  s, param: String;
  item: TListItem;
  i: integer;
begin
  lvDevice.Clear;
  if Trim(FRoleID) <> '' then
    GetDevices(FRoleID);

  param := 'QYZT=1';
  if Trim(cbbDwdm.Text) <> '' then
    param := param + '&like_cjjg=' + Trim(cbbDwdm.Text);
  if Trim(edtSbbh.Text) <> '' then
    param := param + '&like_sbbh=' + Trim(edtSbbh.Text);

  devList := TJsonUtils.RecordListSort<TDevice>
    (TJsonUtils.JsonToRecordList<TDevice>(TRequestItf.DbQuery('GetS_DEVICE',
    param)), 'SBBH');
  for dev in devList do
  begin
    if not TLZDictionary.gDicDev[1].ContainsKey(dev.SBBH) then
      continue;

    if gIsSa then
    begin
      item := lvDevice.Items.Add;
      item.Caption := dev.SBBH;
      item.SubItems.Add(dev.SBDDMC);
      if FrdList.IndexOf(dev.SBBH) >= 0 then
        item.Checked := True
      else
        item.Checked := False;
    end
    else
    begin
      if not TLZDictionary.gDicDev[1].ContainsKey(dev.SBBH) then
        continue;
      if cxCheckBox1.Checked and (FrdList.IndexOf(dev.SBBH) < 0) then
        continue;

      item := lvDevice.Items.Add;
      item.Caption := dev.SBBH;
      item.SubItems.Add(dev.SBDDMC);
      if FrdList.IndexOf(dev.SBBH) >= 0 then
        item.Checked := True
      else
        item.Checked := False;
    end;
  end;
  devList.Free;
end;

procedure TFrameDataRoleEdit.cxCheckBox1PropertiesChange(Sender: TObject);
var
  i: integer;
begin
  inherited;
  if cxCheckBox1.Checked then
  begin
    for i := lvDevice.Items.Count - 1 downto 0 do
    begin
      if not lvDevice.Items[i].Checked then
        lvDevice.Items[i].Delete;
    end;
  end
  else
    cxButton3Click(nil);
end;

procedure TFrameDataRoleEdit.FillDataRole(RoleID, RoleName, Bz: String);
var
  item: TListItem;
  i: integer;
  dev: TDevice;
begin
  cxCheckBox1.Checked := False;
  lvDevice.Clear;
  FRoleID := RoleID;
  if Trim(RoleID) <> '' then
  begin
    GetDevices(RoleID);
    edtRole.Text := RoleName;
    Memobz.Text := Bz;
  end
  else
  begin
    edtRole.Text := '';
    Memobz.Text := '';
  end;

  for dev in TLZDictionary.gDicDev[1].Values do
  begin
    item := lvDevice.Items.Add;
    item.Caption := dev.SBBH;
    item.SubItems.Add(dev.SBDDMC);
    if FrdList.IndexOf(dev.SBBH) >= 0 then
      item.Checked := True
    else
      item.Checked := False;
  end;
end;

procedure TFrameDataRoleEdit.GetDevices(RoleID: String);
var
  rdList: TList<TRoleDevice>;
  rd: TRoleDevice;
begin
  FrdList.Clear;
  rdList := TJsonUtils.JsonToRecordList<TRoleDevice>
    (TRequestItf.DbQuery('GetS_DataRole_Device', 'RoleID=' + RoleID));
  for rd in rdList do
    FrdList.Add(rd.SBBH);
  rdList.Free;
end;

function TFrameDataRoleEdit.SaveData: Boolean;
var
  param: String;
  i, j, k: integer;
begin
  inherited;
  Result := False;
  if Trim(edtRole.Text) = '' then
  begin
    Application.MessageBox('角色名称不能为空', '提示', MB_OK);
    exit;
  end;

  param := 'JSMC=' + Trim(edtRole.Text);
  if FRoleID <> '' then
    param := param + '&not_systemid=' + FRoleID;

  if TRequestItf.DbQuery('GetS_DataRole', param) <> '' then
  begin
    Application.MessageBox('角色名称已存在', '提示', MB_OK);
    exit;
  end;

  if FRoleID <> '' then
  begin
    // TRequestItf.DbQuery('DelS_DataRole_Device', 'RoleID=' + FRoleID);
    param := 'JSMC=' + Trim(edtRole.Text) + '&gxsj=' +
      FormatDatetime('yyyy/mm/dd hh:nn:ss', Now()) + '&SystemID=' + FRoleID;
    if Trim(Memobz.Text) <> '' then
      param := param + '&bz=' + Trim(Memobz.Text);
    TRequestItf.DbQuery('ModifyS_DataRole', param);
  end
  else
  begin
    FRoleID := TGUID.NewGuid.ToString;
    param := 'Systemid=' + FRoleID + '&yhbh=' + gUser.YHBH + '&dwdm=' +
      gUser.DWDM + '&JSMC=' + Trim(edtRole.Text);
    if Trim(Memobz.Text) <> '' then
      param := param + '&bz=' + Trim(Memobz.Text);
    if TRequestItf.DbQuery('AddS_DataRole', param) <> '1' then
    begin
      Application.MessageBox('添加角色失败', '提示', MB_OK);
      exit;
    end;
  end;

  for i := 0 to lvDevice.Items.Count - 1 do
  begin
    if lvDevice.Items[i].Checked then
    begin
      if FrdList.IndexOf(lvDevice.Items[i].Caption) < 0 then
        TRequestItf.DbQuery('AddS_DataRole_Device', 'RoleID=' + FRoleID +
          '&SBBH=' + lvDevice.Items[i].Caption);
    end
    else
    begin
      if FrdList.IndexOf(lvDevice.Items[i].Caption) >= 0 then
        TRequestItf.DbQuery('DelS_DataRole_Device', 'RoleID=' + FRoleID +
          '&SBBH=' + lvDevice.Items[i].Caption);
    end;
  end;
  Result := True;
end;

end.
