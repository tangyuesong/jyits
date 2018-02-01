unit uToolDataRoleManage;

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
  uGlobal, dxFrame, uFrameDataRoleEdit, uFrameDataRoleUserEdit, System.Actions,
  Vcl.ActnList, cxMaskEdit, cxDropDownEdit, Vcl.ExtCtrls;

type
  TToolDataRoleManage = class(TToolGridFrame)
    btnAdd: TdxBarLargeButton;
    btnModify: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnUser: TdxBarLargeButton;
    fDataRoleEdit: TFrameDataRoleEdit;
    fDataRoleUserEdit: TFrameDataRoleUserEdit;
    BtnInput: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    Timer1: TTimer;
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCanelClick(Sender: TObject);
    procedure fDataRoleUserEditbtnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure BtnInputClick(Sender: TObject);
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
  ToolDataRoleManage: TToolDataRoleManage;

implementation

{$R *.dfm}
{ TToolDataRoleManage }

procedure TToolDataRoleManage.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);
end;

procedure TToolDataRoleManage.acteditExecute(Sender: TObject);
begin
  inherited;
  btnModifyClick(nil);
end;

procedure TToolDataRoleManage.actnewExecute(Sender: TObject);
begin
  inherited;
  btnUserClick(nil);
end;

procedure TToolDataRoleManage.AfterConstruction;
begin
  inherited;
  GridColumns := 'dwdm,yhbh,jsmc,bz,gxsj,操作';
  GridView.Columns[5].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons[0].Visible := btnModify.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons[1].Visible := btnDel.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons[2].Visible := btnUser.Enabled;
  BtnInput.Visible := btnAdd.Enabled;
end;

procedure TToolDataRoleManage.btnAddClick(Sender: TObject);
begin
  inherited;
  ShowEditFrame('', '', '');
end;

procedure TToolDataRoleManage.btnCancelClick(Sender: TObject);
begin
  inherited;
  EnableControls(true);
  fDataRoleUserEdit.Visible := false;
end;

procedure TToolDataRoleManage.btnCanelClick(Sender: TObject);
begin
  inherited;
  HideEditFrame;
end;

procedure TToolDataRoleManage.btnDelClick(Sender: TObject);
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
      TRequestItf.DbQuery('DelS_DataRole', 'SYSTEMID=' + id);
      TRequestItf.DbQuery('DelS_DataROLE_USER', 'RoleID=' + id);
      TRequestItf.DbQuery('DelS_DataROLE_Device', 'RoleID=' + id);
      FDMemTable1.Delete;
    end;
  end;
end;

procedure TToolDataRoleManage.btnModifyClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  ShowEditFrame(FDMemTable1.FieldByName('SystemID').AsString,
    FDMemTable1.FieldByName('JSMC').AsString, FDMemTable1.FieldByName('BZ')
    .AsString);
end;

procedure TToolDataRoleManage.btnSaveClick(Sender: TObject);
begin
  inherited;
  if fDataRoleEdit.SaveData then
  begin
    HideEditFrame;
    ShowData;
  end;
end;

procedure TToolDataRoleManage.btnUserClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  EnableControls(false);
  fDataRoleUserEdit.SearchUser(FDMemTable1.FieldByName('SystemID').AsString);
  fDataRoleUserEdit.Visible := true;
  fDataRoleUserEdit.top := (self.Height - fDataRoleUserEdit.Height) div 2;
  fDataRoleUserEdit.Left := (self.Width - fDataRoleUserEdit.Width) div 2;
end;

procedure TToolDataRoleManage.BtnInputClick(Sender: TObject);
begin
  inherited;
  btnAddClick(nil);
end;

procedure TToolDataRoleManage.fDataRoleUserEditbtnSaveClick(Sender: TObject);
begin
  inherited;
  if fDataRoleUserEdit.SaveRoleUsers then
  begin
    EnableControls(true);
    fDataRoleUserEdit.Visible := false;
  end
  else
    Application.MessageBox('保存失败', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TToolDataRoleManage.HideEditFrame;
begin
  EnableControls(true);
  fDataRoleEdit.Visible := false;
end;

procedure TToolDataRoleManage.ShowData;
var
  Param: String;
begin
  inherited;
  if not gIsSa then
    Param := 'yhbh=' + gUser.YHBH
  else
    Param := '';
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetS_DataRole', Param),
    FDMemTable1, '');
  FreeFrameWait;
end;

procedure TToolDataRoleManage.ShowEditFrame(RoleID, RoleName, Bz: String);
begin
  EnableControls(false);
  fDataRoleEdit.FillDataRole(RoleID, RoleName, Bz);
  fDataRoleEdit.Visible := true;
  fDataRoleEdit.top := (self.Height - fDataRoleEdit.Height) div 2;
  fDataRoleEdit.Left := (self.Width - fDataRoleEdit.Width) div 2;
end;

procedure TToolDataRoleManage.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  ShowData;
end;

end.
