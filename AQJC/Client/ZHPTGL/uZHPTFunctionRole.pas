unit uZHPTFunctionRole;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkinsdxBarPainter, cxClasses, dxBar, sDialogs, cxEditRepositoryItems,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutControl, dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxContainer,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uRequestItf, uJsonUtils,
  uGlobal, dxFrame, uFrameRoleUserEdit, System.Actions,
  Vcl.ActnList, cxMaskEdit, cxDropDownEdit, Vcl.ExtCtrls, cxLabel,
  uAddZHPTFunction, uFrameZHPTFunctionRoleEdit, uFrameZHPTFunctionRoleUser,
  dxBarBuiltInMenu, cxPC;

type
  TZHPTFunctionRole = class(TToolGridFrame)
    btnAdd: TdxBarLargeButton;
    btnModify: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnUser: TdxBarLargeButton;
    BtnInput: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    btnAddFunction: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    pcMenu: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCanelClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure BtnInputClick(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure btnAddFunctionClick(Sender: TObject);
    procedure pcMenuChange(Sender: TObject);
  private
    FrameAddZHPTFunction: TFrameAddZHPTFunction;
    FrameZHPTFunctionRoleEdit: TFrameZHPTFunctionRoleEdit;
    FrameZHPTFunctionRoleUser: TFrameZHPTFunctionRoleUser;
    procedure AfterConstruction; override;
    procedure ShowEditFrame(RoleID, RoleName, Bz: String);
    procedure HideEditFrame;
    procedure AddZHPTFunctionExitClick(Sender: TObject);
    procedure EditZHPTFunctionRoleExitClick(Sender: TObject);
    procedure ZHPTFunctionRoleUserExitClick(Sender: TObject);
    procedure LoadRoles;
    procedure LoadMenus;
    procedure LoadFunctions;
  public
    { Public declarations }
  end;

var
  ZHPTFunctionRole: TZHPTFunctionRole;

implementation

{$R *.dfm}
{ TZHPTFunctionRole }

procedure TZHPTFunctionRole.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if pcMenu.ActivePageIndex = 0 then
    btnDelClick(nil)
  else if pcMenu.ActivePageIndex = 1 then
    TRequestItf.DbQuery('DelZHPTMenu', 'Systemid=' + FDMemTable1.FieldByName
      ('SYSTEMID').AsString)
  else if pcMenu.ActivePageIndex = 2 then
    TRequestItf.DbQuery('DelZHPTFunction',
      'Systemid=' + FDMemTable1.FieldByName('SYSTEMID').AsString);
  FDMemTable1.Delete;
end;

procedure TZHPTFunctionRole.acteditExecute(Sender: TObject);
begin
  inherited;
  btnModifyClick(nil);
end;

procedure TZHPTFunctionRole.actnewExecute(Sender: TObject);
begin
  inherited;
  btnUserClick(nil);
end;

procedure TZHPTFunctionRole.AddZHPTFunctionExitClick(Sender: TObject);
begin
  inherited;
  if Assigned(FrameAddZHPTFunction) then
    FrameAddZHPTFunction.Visible := false;
  EnableControls(True);
  pcMenuChange(nil);
end;

procedure TZHPTFunctionRole.AfterConstruction;
begin
  inherited;
  pcMenu.ActivePageIndex := 0;
  pcMenuChange(nil);
end;

procedure TZHPTFunctionRole.btnAddClick(Sender: TObject);
begin
  inherited;
  ShowEditFrame('', '', '');
end;

procedure TZHPTFunctionRole.btnAddFunctionClick(Sender: TObject);
begin
  inherited;
  EnableControls(false);
  if not Assigned(FrameAddZHPTFunction) then
  begin
    FrameAddZHPTFunction := TFrameAddZHPTFunction.Create(self);
    FrameAddZHPTFunction.Parent := self;
    FrameAddZHPTFunction.top :=
      (self.Height - FrameAddZHPTFunction.Height) div 2;
    FrameAddZHPTFunction.Left :=
      (self.Width - FrameAddZHPTFunction.Width) div 2;
    FrameAddZHPTFunction.btnExit.OnClick := AddZHPTFunctionExitClick;
  end
  else
  begin
    FrameAddZHPTFunction.cbotype.ItemIndex := -1;
    FrameAddZHPTFunction.edtID.Text := '';
    FrameAddZHPTFunction.edtCaption.Text := '';
  end;
  FrameAddZHPTFunction.AfterShow;
  FrameAddZHPTFunction.Visible := True;
end;

procedure TZHPTFunctionRole.btnCanelClick(Sender: TObject);
begin
  inherited;
  HideEditFrame;
end;

procedure TZHPTFunctionRole.btnDelClick(Sender: TObject);
var
  id: string;
begin
  inherited;
  if not FDMemTable1.Eof then
  begin
    if Application.MessageBox('是否确定删除?', '提示', MB_YESNO + MB_ICONQUESTION) = mrYes
    then
    begin
      id := FDMemTable1.FieldByName('SYSTEMID').AsString;
      TRequestItf.DbQuery('ModifyZHPTFunctionRole', 'TYBJ=1&SYSTEMID=' + id);
      TRequestItf.DbQuery('DelZHPTFunctionRoleUser', 'RoleID=' + id);
      TRequestItf.DbQuery('DelZHPTFunctionRoleFunction', 'RoleID=' + id);
    end;
  end;
end;

procedure TZHPTFunctionRole.BtnInputClick(Sender: TObject);
begin
  inherited;
  btnAddClick(nil);
end;

procedure TZHPTFunctionRole.btnModifyClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  ShowEditFrame(FDMemTable1.FieldByName('SystemID').AsString,
    FDMemTable1.FieldByName('JSMC').AsString, FDMemTable1.FieldByName('BZ')
    .AsString);
end;

procedure TZHPTFunctionRole.btnUserClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  EnableControls(false);
  if not Assigned(FrameZHPTFunctionRoleUser) then
  begin
    FrameZHPTFunctionRoleUser := TFrameZHPTFunctionRoleUser.Create(self);
    FrameZHPTFunctionRoleUser.Parent := self;
    FrameZHPTFunctionRoleUser.top :=
      (self.Height - FrameZHPTFunctionRoleUser.Height) div 2;
    FrameZHPTFunctionRoleUser.Left :=
      (self.Width - FrameZHPTFunctionRoleUser.Width) div 2;
    FrameZHPTFunctionRoleUser.btnCancel.OnClick :=
      ZHPTFunctionRoleUserExitClick;
  end;

  FrameZHPTFunctionRoleUser.SearchUser(FDMemTable1.FieldByName('SystemID')
    .AsString);
  FrameZHPTFunctionRoleUser.Visible := True;
end;

procedure TZHPTFunctionRole.EditZHPTFunctionRoleExitClick(Sender: TObject);
begin
  if Assigned(FrameZHPTFunctionRoleEdit) then
  begin
    FrameZHPTFunctionRoleEdit.Visible := false;
    pcMenuChange(nil);
  end;
  EnableControls(True);
end;

procedure TZHPTFunctionRole.HideEditFrame;
begin
  EnableControls(True);
end;

procedure TZHPTFunctionRole.LoadFunctions;
begin
  GridColumns := 'menuid,functionid,caption,activate,main,操作';
  GridView.Columns[5].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := True;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := false;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetZHPTAllFunction', ''),
    FDMemTable1);
  FreeFrameWait;
end;

procedure TZHPTFunctionRole.LoadMenus;
begin
  GridColumns := 'menuid,caption,activate,操作';
  GridView.Columns[3].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := True;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := false;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetZHPTAllMenu', ''),
    FDMemTable1);
  FreeFrameWait;
end;

procedure TZHPTFunctionRole.LoadRoles;
var
  Param: String;
begin
  GridColumns := 'yhbh,jsmc,bz,gxsj,操作';
  GridView.Columns[4].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := True;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := True;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := True;
  Param := 'TYBJ=0';
  if not gIsSa then
    Param := Param + '&yhbh=' + gUser.YHBH;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetZHPTFunctionRole', Param),
    FDMemTable1);
  FreeFrameWait;
end;

procedure TZHPTFunctionRole.pcMenuChange(Sender: TObject);
begin
  inherited;
  FDMemTable1.Close;
  if pcMenu.ActivePageIndex = 0 then
    LoadRoles
  else if pcMenu.ActivePageIndex = 1 then
    LoadMenus
  else if pcMenu.ActivePageIndex = 2 then
    LoadFunctions;
end;

procedure TZHPTFunctionRole.ShowEditFrame(RoleID, RoleName, Bz: String);
begin
  EnableControls(false);
  if not Assigned(FrameZHPTFunctionRoleEdit) then
  begin
    FrameZHPTFunctionRoleEdit := TFrameZHPTFunctionRoleEdit.Create(self);
    FrameZHPTFunctionRoleEdit.Parent := self;
    FrameZHPTFunctionRoleEdit.top :=
      (self.Height - FrameZHPTFunctionRoleEdit.Height) div 2;
    FrameZHPTFunctionRoleEdit.Left :=
      (self.Width - FrameZHPTFunctionRoleEdit.Width) div 2;
    FrameZHPTFunctionRoleEdit.btnCanel.OnClick := EditZHPTFunctionRoleExitClick;
  end;
  FrameZHPTFunctionRoleEdit.FillFunctionRole(RoleID, RoleName, Bz);
  FrameZHPTFunctionRoleEdit.Visible := True;
end;

procedure TZHPTFunctionRole.ZHPTFunctionRoleUserExitClick(Sender: TObject);
begin
  if Assigned(FrameZHPTFunctionRoleUser) then
    FrameZHPTFunctionRoleUser.Visible := false;
  EnableControls(True);
end;

end.
