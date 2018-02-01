unit uFrameSetUserDataRole;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, Vcl.ComCtrls, cxContainer,
  cxEdit, cxListView, cxInplaceContainer, uRequestItf, uJsonUtils,
  Generics.Collections, uGlobal, uUserPower, cxTextEdit, Udictionary, uEntity;

type

  TRole = Record
    SYSTEMID: String;
    YHBH: String;
    DWDM: String;
    JSMC: String;
    BZ: String;
  end;

  TFrameSetUserDataRole = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    btnSave: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    btnCancel: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    lvOtherRole: TcxListView;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    lvMineRole: TcxListView;
    dxLayoutLabeledItem1: TdxLayoutLabeledItem;
    dxLayoutLabeledItem2: TdxLayoutLabeledItem;
    lliCreator: TdxLayoutLabeledItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    lvDevice: TcxListView;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    procedure lvOtherRoleChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvOtherRoleSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvMineRoleSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    FRoleDic: TDictionary<string, TRole>;
    FSelectRoles: TStrings;
    FRoleName: String;
    FYhbh: String;
    procedure LoadRoleFunctions(rolename: String);
  public
    procedure SetUserRoles(userid: String);
    function SaveUserRoles: Boolean;
  end;

var
  FrameSetUserDataRole: TFrameSetUserDataRole;

implementation

{$R *.dfm}
{ TFrameSetUserDataRole }

procedure TFrameSetUserDataRole.LoadRoleFunctions(rolename: String);
var
  rds: TList<TRoleDevice>;
  rd: TRoleDevice;
  roleids: TStrings;
  dev: TDevice;
  s: String;
  Item: TListItem;
begin
  if FRoleName = rolename then
    exit;
  lvDevice.Clear;
  if not FRoleDic.ContainsKey(rolename) then
    exit;
  FRoleName := rolename;
  s := TRequestItf.DbQuery('GetS_DataRole_Device',
    'RoleID=' + FRoleDic[FRoleName].SYSTEMID);
  if s = '' then
    exit;

  rds := TJsonUtils.JsonToRecordList<TRoleDevice>(s);
  roleids := TStringList.Create;
  for rd in rds do
    roleids.Add(rd.SBBH);
  rds.Free;

  for dev in TLZDictionary.gDicDev[1].Values do
  begin
    if roleids.IndexOf(dev.SBBH) >= 0 then
    begin
      Item := lvDevice.Items.Add;
      Item.Caption := dev.SBBH;
      Item.SubItems.Add(dev.SBDDMC);
    end;
  end;
  roleids.Free;
end;

procedure TFrameSetUserDataRole.lvMineRoleSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  inherited;
  LoadRoleFunctions(Item.Caption);
end;

procedure TFrameSetUserDataRole.lvOtherRoleChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  inherited;
  if not Item.Checked then
    Item.Checked := True;
end;

procedure TFrameSetUserDataRole.lvOtherRoleSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  inherited;
       LoadRoleFunctions(Item.Caption);
  if FRoleDic.ContainsKey(Item.Caption) then
    lliCreator.CaptionOptions.Text := '(创建用户:' + FRoleDic[Item.Caption]
      .YHBH + ')';
end;

function TFrameSetUserDataRole.SaveUserRoles: Boolean;
var
  Item: TListItem;
begin
  Result := True;
  try
    for Item in lvMineRole.Items do
    begin
      if Item.Checked then
      begin
        if FSelectRoles.IndexOf(Item.Caption) < 0 then
          TRequestItf.DbQuery('AddS_DataRole_User', 'YHBH=' + FYHBH +
            '&RoleID=' + FRoleDic[Item.Caption].SYSTEMID);
      end
      else
      begin
        if FSelectRoles.IndexOf(Item.Caption) >= 0 then
          TRequestItf.DbQuery('DelS_DataRole_User', 'YHBH=' + FYHBH +
            '&RoleID=' + FRoleDic[Item.Caption].SYSTEMID);
      end;
    end;
  except
    Result := False;
  end;
  FreeAndNil(FRoleDic);
  FreeAndNil(FSelectRoles);
end;

procedure TFrameSetUserDataRole.SetUserRoles(userid: String);
var
  Item: TListItem;
  roles: TList<TRole>;
  role: TRole;
  lv: TcxListView;
  isExists: Boolean;
begin
  inherited;
  lvOtherRole.Items.Clear;
  lvMineRole.Items.Clear;
  lvDevice.Clear;
  FRoleName := '';
  FYhbh := userid;
  lliCreator.Caption := '';
  if FRoleDic <> nil then
    FRoleDic.Clear
  else
    FRoleDic := TDictionary<string, TRole>.Create;
  if FSelectRoles <> nil then
    FSelectRoles.Clear
  else
    FSelectRoles := TStringList.Create;
  roles := TJsonUtils.JsonToRecordList<TRole>
    (TRequestItf.DbQuery('GetUserDataRoles', 'a.YHBH=' + FYhbh));
  for role in roles do
  begin
    if role.YHBH = gUser.YHBH then
    begin
      lv := lvMineRole;
      FSelectRoles.Add(role.JSMC);
    end
    else
      lv := lvOtherRole;
    Item := lv.Items.Add;
    Item.Caption := role.JSMC;
    Item.Checked := True;
    if not FRoleDic.ContainsKey(role.JSMC) then
      FRoleDic.Add(role.JSMC, role);
  end;
  roles.Free;
  roles := TJsonUtils.JsonToRecordList<TRole>
    (TRequestItf.DbQuery('GetS_DataROLE', 'yhbh=' + gUser.YHBH));
  for role in roles do
  begin
    isExists := False;
    for Item in lvMineRole.Items do
    begin
      if Item.Caption = role.JSMC then
      begin
        isExists := True;
        break;
      end;
    end;
    if not isExists then
    begin
      Item := lvMineRole.Items.Add;
      Item.Caption := role.JSMC;
      Item.Checked := False;
      FRoleDic.Add(role.JSMC, role);
    end;
  end;
end;

end.
