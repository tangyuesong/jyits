unit uFrameDataRoleUserEdit;

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
  dxLayoutControl, Vcl.Menus, dxLayoutControlAdapters, Vcl.StdCtrls, cxButtons,
  cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxInplaceContainer, dxLayoutcxEditAdapters, cxContainer, cxTextEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uJsonUtils, uRequestItf,
  Generics.Collections, cxMaskEdit, cxDropDownEdit, uEntity, uCommon, uGlobal;

type
  TRoleUser = Record
    SystemID: String;
    RoleID: String;
    YHBH: String;
  end;

  TFrameDataRoleUserEdit = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    btnSave: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    btnCancel: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    edtYhxm: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    edtYhbh: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    dxLayoutItem7: TdxLayoutItem;
    cxGrid1: TcxGrid;
    GridView: TcxGridDBTableView;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    GridViewColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    dxLayoutItem3: TdxLayoutItem;
    GridViewColumn6: TcxGridDBColumn;
    GridViewColumn7: TcxGridDBColumn;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    cbbDwdm: TcxComboBox;
    cbbRyll: TcxComboBox;
    dxLayoutItem10: TdxLayoutItem;
    procedure btnSearchClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    FRoleID: String;
    function GetRoleUsers(): TStrings;
    procedure InitTb();
    procedure AfterConstruction; override;
  public
    procedure SearchUser(RoleID: String = '');
    function SaveRoleUsers(): Boolean;
  end;

var
  FrameDataRoleUserEdit: TFrameDataRoleUserEdit;

implementation

{$R *.dfm}
{ TFrameDataRoleUserEdit }

procedure TFrameDataRoleUserEdit.AfterConstruction;
var
  xzqh, Param: String;
  depts: TList<TDept>;
  dept: TDept;
begin
  inherited;
  cbbDwdm.Properties.Items.Clear;
  Param := 'bj=1';
  if not gIsSa then
  begin
    xzqh := TCommon.GetXZQH(gUser.DWDM);
    Param := Param + '&like_dwdm=' + xzqh;
  end;
  depts := TJsonUtils.JsonToRecordList<TDept>
    (TRequestItf.DbQuery('GetS_Dept', Param));
  for dept in depts do
    cbbDwdm.Properties.Items.Add(dept.DWDM);
  depts.Free;
end;

procedure TFrameDataRoleUserEdit.btnSearchClick(Sender: TObject);
begin
  inherited;
  SearchUser;
end;

procedure TFrameDataRoleUserEdit.cxButton1Click(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active then
    exit;
  FDMemTable1.DisableControls;
  FDMemTable1.First;
  while not FDMemTable1.eof do
  begin
    FDMemTable1.Edit;
    FDMemTable1.FieldByName('bj').AsBoolean := True;
    FDMemTable1.Post;
    FDMemTable1.Next;
  end;
  FDMemTable1.First;
  FDMemTable1.EnableControls;
end;

procedure TFrameDataRoleUserEdit.cxButton2Click(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active then
    exit;
  FDMemTable1.DisableControls;
  FDMemTable1.First;
  while not FDMemTable1.eof do
  begin
    FDMemTable1.Edit;
    FDMemTable1.FieldByName('bj').AsBoolean := not FDMemTable1.FieldByName('bj')
      .AsBoolean;
    FDMemTable1.Post;
    FDMemTable1.Next;
  end;
  FDMemTable1.First;
  FDMemTable1.EnableControls;
end;

function TFrameDataRoleUserEdit.GetRoleUsers: TStrings;
var
  users: TList<TRoleUser>;
  user: TRoleUser;
begin
  Result := TStringList.Create;
  users := TJsonUtils.JsonToRecordList<TRoleUser>
    (TRequestItf.DbQuery('GetS_DataRole_User', 'RoleID=' + FRoleID));
  for user in users do
    Result.Add(user.YHBH);
  users.Free;
end;

procedure TFrameDataRoleUserEdit.InitTb;
begin
  FDMemTable1.Close;
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.IndexDefs.Clear;
  FDMemTable1.FieldDefs.Add('bj', ftBoolean);
  FDMemTable1.FieldDefs.Add('SYSTEMID', ftString, 100);
  FDMemTable1.FieldDefs.Add('DWDM', ftString, 100);
  FDMemTable1.FieldDefs.Add('YHBH', ftString, 100);
  FDMemTable1.FieldDefs.Add('YHXM', ftString, 100);
  FDMemTable1.FieldDefs.Add('SJHM', ftString, 100);
  FDMemTable1.FieldDefs.Add('BZ', ftString, 100);
  FDMemTable1.FieldDefs.Add('LRR', ftString, 100);

  //FDMemTable1.IndexDefs.Add('index', 'BJ', [ixPrimary]);
  //FDMemTable1.IndexName := 'index';
end;

function TFrameDataRoleUserEdit.SaveRoleUsers: Boolean;
begin
  Result := True;
  try
    if not FDMemTable1.Active then
      exit;
    FDMemTable1.DisableControls;
    FDMemTable1.First;
    while not FDMemTable1.eof do
    begin
      // 只对显示的用户进行操作，如果全部删除，防止某些用户拥有该角色，但是不在查询列表中
      TRequestItf.DbQuery('DelS_DataRole_User', 'RoleID=' + FRoleID + '&YHBH=' +
        FDMemTable1.FieldByName('YHBH').AsString);
      if FDMemTable1.FieldByName('bj').AsBoolean then
        TRequestItf.DbQuery('AddS_DataRole_User', 'RoleID=' + FRoleID + '&YHBH='
          + FDMemTable1.FieldByName('YHBH').AsString);
      FDMemTable1.Next;
    end;
    FDMemTable1.First;
    FDMemTable1.EnableControls;
  except
    Result := False;
  end;
end;

procedure TFrameDataRoleUserEdit.SearchUser(RoleID: String);
var
  Param: String;
  users: TStrings;
begin
  inherited;
  if RoleID <> '' then
    FRoleID := RoleID;

  users := GetRoleUsers;
  Param := 'ZT=1&not_yhbh=' + gUser.YHBH;
  if Trim(cbbDwdm.Text) <> '' then
    Param := Param + '&like_dwdm=' + Trim(cbbDwdm.Text);
  if Trim(edtYhbh.Text) <> '' then
    Param := Param + '&like_yhbh=' + Trim(edtYhbh.Text);
  if Trim(edtYhxm.Text) <> '' then
    Param := Param + '&like_yhxm=' + Trim(edtYhxm.Text);
  if cbbRyll.ItemIndex = 1 then
    Param := Param + '&isMJ=1'
  else if cbbRyll.ItemIndex = 2 then
    Param := Param + '&isMJ=2'
  else if cbbRyll.ItemIndex = 3 then
    Param := Param + '&isMJ=0';
  InitTb;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetS_User', Param), FDMemTable1,
    'yhbh', False);
  if not FDMemTable1.Active then
    exit;
  FDMemTable1.DisableControls;
  FDMemTable1.First;
  while not FDMemTable1.eof do
  begin
    FDMemTable1.Edit;
    if users.IndexOf(FDMemTable1.FieldByName('YHBH').AsString) >= 0 then
      FDMemTable1.FieldByName('bj').AsBoolean := True
    else
      FDMemTable1.FieldByName('bj').AsBoolean := False;
    FDMemTable1.Post;
    FDMemTable1.Next;
  end;
  FDMemTable1.First;
  FDMemTable1.EnableControls;
end;

end.
