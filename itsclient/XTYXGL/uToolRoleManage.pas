unit uToolRoleManage;

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
  uGlobal, dxFrame, uFrameRoleEdit, uFrameRoleUserEdit, System.Actions,
  Vcl.ActnList, cxMaskEdit, cxDropDownEdit, Vcl.ExtCtrls;

type
  TToolRoleManage = class(TToolGridFrame)
    btnAdd: TdxBarLargeButton;
    btnModify: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnUser: TdxBarLargeButton;
    fRoleEdit: TFrameRoleEdit;
    fRoleUserEdit: TFrameRoleUserEdit;
    BtnInput: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    Timer1: TTimer;
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCanelClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure fRoleUserEditbtnSaveClick(Sender: TObject);
    procedure BtnInputClick(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure AfterConstruction; override;
    procedure ShowData();
    procedure ShowEditFrame(RoleID, RoleName, Bz: String);
    procedure HideEditFrame;
  public
    { Public declarations }
  end;

var
  ToolRoleManage: TToolRoleManage;

implementation

{$R *.dfm}
{ TToolRoleManage }

procedure TToolRoleManage.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);
end;

procedure TToolRoleManage.acteditExecute(Sender: TObject);
begin
  inherited;
  btnModifyClick(nil);
end;

procedure TToolRoleManage.actnewExecute(Sender: TObject);
begin
  inherited;
  btnUserClick(nil);
end;

procedure TToolRoleManage.AfterConstruction;
begin
  inherited;
  GridColumns := 'dwdm,yhbh,jsmc,bz,gxsj,操作';
  GridView.Columns[5].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible :=
    btnModify.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := btnDel.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := btnUser.Enabled;
  BtnInput.Visible := btnAdd.Enabled;
end;

procedure TToolRoleManage.btnAddClick(Sender: TObject);
begin
  inherited;
  ShowEditFrame('', '', '');
end;

procedure TToolRoleManage.btnCancelClick(Sender: TObject);
begin
  inherited;
  EnableControls(true);
  fRoleUserEdit.Visible := false;
end;

procedure TToolRoleManage.btnCanelClick(Sender: TObject);
begin
  inherited;
  HideEditFrame;
end;

procedure TToolRoleManage.btnDelClick(Sender: TObject);
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
      TRequestItf.DbQuery('ModifyS_Role_List', 'TYBJ=1&SYSTEMID=' + id);
      TRequestItf.DbQuery('DelS_ROLE_USER', 'RoleID=' + id);
      TRequestItf.DbQuery('DelS_ROLE_Function', 'RoleID=' + id);
      FDMemTable1.Delete;
    end;
  end;
end;

procedure TToolRoleManage.BtnInputClick(Sender: TObject);
begin
  inherited;
  btnAddClick(nil);
end;

procedure TToolRoleManage.btnModifyClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  ShowEditFrame(FDMemTable1.FieldByName('SystemID').AsString,
    FDMemTable1.FieldByName('JSMC').AsString, FDMemTable1.FieldByName('BZ')
    .AsString);
end;

procedure TToolRoleManage.btnSaveClick(Sender: TObject);
begin
  inherited;
  if fRoleEdit.SaveData then
  begin
    HideEditFrame;
    ShowData;
  end;
end;

procedure TToolRoleManage.btnUserClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  EnableControls(false);
  fRoleUserEdit.SearchUser(FDMemTable1.FieldByName('SystemID').AsString);
  fRoleUserEdit.Visible := true;
  fRoleUserEdit.top := (self.Height - fRoleEdit.Height) div 2;
  fRoleUserEdit.Left := (self.Width - fRoleEdit.Width) div 2;
end;

procedure TToolRoleManage.fRoleUserEditbtnSaveClick(Sender: TObject);
begin
  inherited;
  if fRoleUserEdit.SaveRoleUsers then
  begin
    EnableControls(true);
    fRoleUserEdit.Visible := false;
  end
  else
    Application.MessageBox('保存失败', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TToolRoleManage.HideEditFrame;
begin
  EnableControls(true);
  fRoleEdit.Visible := false;
end;

procedure TToolRoleManage.ShowData;
var
  Param: String;
begin
  inherited;
  Param := 'TYBJ=0';
  if not gIsSa then
    Param := Param + '&yhbh=' + gUser.YHBH;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetS_Role_List', Param),
    FDMemTable1, '');
  FreeFrameWait;
end;

procedure TToolRoleManage.ShowEditFrame(RoleID, RoleName, Bz: String);
begin
  EnableControls(false);
  fRoleEdit.FillFunctionRole(RoleID, RoleName, Bz);
  fRoleEdit.Visible := true;
  fRoleEdit.top := (self.Height - fRoleEdit.Height) div 2;
  fRoleEdit.Left := (self.Width - fRoleEdit.Width) div 2;
end;

procedure TToolRoleManage.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  ShowData;
end;

end.
