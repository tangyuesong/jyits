unit uFrameZHPTDeviceRoleEdit;

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
  cxButtons, cxMemo, cxTextEdit, uRequestItf, uJsonUtils,
  Generics.Collections, uGlobal, cxListView, Udictionary, uEntity, cxMaskEdit,
  cxDropDownEdit, uCommon, cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TZHPTDevice = Record
    SBID: String;
    SBMC: String;
  end;

  TFrameZHPTDeviceRoleEdit = class(TdxFrame)
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
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FrdList: TStrings;
    FRoleID: String;
    procedure GetDevices(RoleID: String);
    procedure BeforeDestruction; override;
  public
    procedure FillDataRole(RoleID, RoleName, Bz: String);
  end;

implementation

{$R *.dfm}
{ TFrameZHPTDeviceRoleEdit }

procedure TFrameZHPTDeviceRoleEdit.BeforeDestruction;
begin
  inherited;
  FrdList.Free;
end;

procedure TFrameZHPTDeviceRoleEdit.btnSaveClick(Sender: TObject);
var
  Param, s: String;
  i, j, k: integer;
begin
  inherited;
  if Trim(edtRole.Text) = '' then
  begin
    Application.MessageBox('角色名称不能为空', '提示', MB_OK);
    exit;
  end;

  Param := 'JSMC=' + Trim(edtRole.Text);
  if FRoleID <> '' then
    Param := Param + '&systemid=' + FRoleID;

  s := TRequestItf.DbQuery('GetZHPTDeviceRole', Param);

  if (TCommon.GetJsonNode('code', s) = '1') and
    (TCommon.GetJsonNode('totalnum', s) <> '0') then
  begin
    Application.MessageBox('角色名称已存在', '提示', MB_OK);
    exit;
  end;

  if FRoleID <> '' then
  begin
    Param := 'JSMC=' + Trim(edtRole.Text) + '&gxsj=' +
      FormatDatetime('yyyy/mm/dd hh:nn:ss', Now()) + '&SystemID=' + FRoleID +
      '&bz=' + Trim(Memobz.Text);
    s := TRequestItf.DbQuery('ModifyZHPTDeviceRole', Param);
    if TCommon.GetJsonNode('code', s) <> '1' then
    begin
      Application.MessageBox('修改角色失败', '提示', MB_OK);
      exit;
    end;
  end
  else
  begin
    FRoleID := TGUID.NewGuid.ToString;
    Param := 'Systemid=' + FRoleID + '&yhbh=' + gUser.yhbh + '&JSMC=' +
      Trim(edtRole.Text) + '&bz=' + Trim(Memobz.Text);

    s := TRequestItf.DbQuery('AddZHPTDeviceRole', Param);
    if TCommon.GetJsonNode('code', s) <> '1' then
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
        TRequestItf.DbQuery('AddZHPTDeviceRoleDevice',
          'RoleID=' + FRoleID + '&SBID=' + lvDevice.Items[i].Caption);
    end
    else
    begin
      if FrdList.IndexOf(lvDevice.Items[i].Caption) >= 0 then
        TRequestItf.DbQuery('DelZHPTDeviceRoleDevice',
          'RoleID=' + FRoleID + '&SBID=' + lvDevice.Items[i].Caption);
    end;
  end;
  btnCanel.Click;
end;

procedure TFrameZHPTDeviceRoleEdit.cxButton1Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to lvDevice.Items.Count - 1 do
    lvDevice.Items[i].Checked := True;
end;

procedure TFrameZHPTDeviceRoleEdit.cxButton2Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to lvDevice.Items.Count - 1 do
    lvDevice.Items[i].Checked := not lvDevice.Items[i].Checked;
end;

procedure TFrameZHPTDeviceRoleEdit.FillDataRole(RoleID, RoleName, Bz: String);
var
  item: TListItem;
  i: integer;
  dev: TZHPTDevice;
  devList: TList<TZHPTDevice>;
  Param: String;
begin
  lvDevice.Clear;
  FRoleID := RoleID;

  if FrdList = nil then
    FrdList := TStringList.Create
  else
    FrdList.Clear;

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

  if gIsSa then
    Param := ''
  else
    Param := 'yhbh=' + gUser.yhbh;

  devList := TJsonUtils.RecordListSort<TZHPTDevice>
    (TJsonUtils.JsonToRecordList<TZHPTDevice>
    (TRequestItf.DbQuery('GetZHPTDeviceByUser', Param)), 'SBID');
  for dev in devList do
  begin
    item := lvDevice.Items.Add;
    item.Caption := dev.SBID;
    item.SubItems.Add(dev.SBMC);
    if FrdList.IndexOf(dev.SBID) >= 0 then
      item.Checked := True
    else
      item.Checked := False;
  end;
  devList.Free;
end;

procedure TFrameZHPTDeviceRoleEdit.GetDevices(RoleID: String);
var
  tb: TFDMemTable;
  SBID: String;
begin
  tb := TFDMemTable.Create(nil);
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetZHPTDeviceByRole',
    'RoleID=' + RoleID), tb);

  if tb.Active then
  begin
    tb.First;
    while not tb.Eof do
    begin
      SBID := tb.FieldByName('SBID').AsString;
      FrdList.Add(SBID);
      tb.Next;
    end;
  end;
  tb.Free;
end;

end.
