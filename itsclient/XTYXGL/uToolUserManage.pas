unit uToolUserManage;

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
  dxFrame, dxDialogBase, uDialogUserEdit, uGlobal, uFrameSetUserRole,
  uFrameSetUserDataRole, System.Actions, Vcl.ActnList, uCommon, cxMaskEdit,
  cxDropDownEdit, Udictionary;

type
  TToolUserManage = class(TToolGridFrame)
    edtYhbh: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    edtYhxm: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    btnAdd: TdxBarLargeButton;
    btnModify: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    edtDwdm: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    btnFunction: TdxBarLargeButton;
    btnData: TdxBarLargeButton;
    fUserEdit: TfDialogUserEdit;
    fSetUserRole: TFrameSetUserRole;
    fSetUserDataRole: TFrameSetUserDataRole;
    BtnInput: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    procedure btnSearchClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnFunctionClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure fSetUserRolebtnSaveClick(Sender: TObject);
    procedure btnDataClick(Sender: TObject);
    procedure fSetUserDataRolebtnSaveClick(Sender: TObject);
    procedure fSetUserDataRolebtnCancelClick(Sender: TObject);
    procedure BtnInputClick(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
  private
    procedure AfterConstruction; override;
    procedure ShowEditFrame;
    procedure HideEditFrame;
  public
    { Public declarations }
  end;

var
  ToolUserManage: TToolUserManage;

implementation

{$R *.dfm}
{ TToolUserManage }

procedure TToolUserManage.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);
end;

procedure TToolUserManage.acteditExecute(Sender: TObject);
begin
  inherited;
  btnModifyClick(nil);
end;

procedure TToolUserManage.actnewExecute(Sender: TObject);
begin
  inherited;
  btnFunctionClick(nil);
end;

procedure TToolUserManage.actViewExecute(Sender: TObject);
begin
  inherited;
  btnDataClick(nil);
end;

procedure TToolUserManage.AfterConstruction;
begin
  inherited;
  NoLookupColumns := 'YHBH';
  GridColumns := 'DWDM, YHBH, YHXM, SJHM, FH, Manager, LRR,操作';
  GridView.Columns[7].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Enabled :=
    btnModify.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Enabled := btnDel.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Enabled :=
    btnFunction.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[3].Enabled := btnData.Enabled;
  BtnInput.Visible := btnAdd.Enabled;
end;

procedure TToolUserManage.btnAddClick(Sender: TObject);
begin
  inherited;
  with fUserEdit do
  begin
    UserID := '';
    cbbDwdm.Text := '';
    edtYhbh.Text := '';
    edtYhxm.Text := '';
    edtYhmm.Text := '';
    edtSfzh.Text := '';
    edtSjhm.Text := '';
    cbbYhzw.Text := '';
    edtMac.Text := '';
    edtQsip.Text := '';
    edtJsip.Text := '';
    // cbFh.Checked := False;
    cbbSH.ItemIndex := 0;
    cbManage.Checked := False;
  end;
  ShowEditFrame;
end;

procedure TToolUserManage.btnCancelClick(Sender: TObject);
begin
  inherited;
  EnableControls(true);
  fSetUserRole.Visible := False;
end;

procedure TToolUserManage.btnDataClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  EnableControls(False);
  fSetUserDataRole.SetUserRoles(FDMemTable1.FieldByName('YHBH').AsString);
  fSetUserDataRole.Visible := true;
  fSetUserDataRole.top := (self.Height - fSetUserDataRole.Height) div 2;
  fSetUserDataRole.Left := (self.Width - fSetUserDataRole.Width) div 2;
end;

procedure TToolUserManage.btnDelClick(Sender: TObject);
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
      TRequestItf.DbQuery('ModifyS_User', 'zt=0&SYSTEMID=' + id);
      TRequestItf.DbQuery('DelS_ROLE_USER', 'UserID=' + id);
      TRequestItf.DbQuery('DelS_DataROLE_USER', 'UserID=' + id);
      FDMemTable1.Delete;
    end;
  end;
end;

procedure TToolUserManage.btnExitClick(Sender: TObject);
begin
  inherited;
  HideEditFrame;
end;

procedure TToolUserManage.btnFunctionClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  EnableControls(False);
  fSetUserRole.SetUserRoles(FDMemTable1.FieldByName('YHBH').AsString);
  fSetUserRole.Visible := true;
  fSetUserRole.top := (self.Height - fSetUserRole.Height) div 2;
  fSetUserRole.Left := (self.Width - fSetUserRole.Width) div 2;
end;

procedure TToolUserManage.BtnInputClick(Sender: TObject);
begin
  inherited;
  btnAddClick(nil);
end;

procedure TToolUserManage.btnModifyClick(Sender: TObject);
var
  dwdm: String;
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;

  with fUserEdit do
  begin
    UserID := FDMemTable1.FieldByName('SystemID').AsString;
    dwdm := FDMemTable1.FieldByName('DWDM').AsString;
    if TLZDictionary.gDicDept.ContainsKey(dwdm) then
      cbbDwdm.Text := TLZDictionary.gDicDept[dwdm].DWMC
    else
      cbbDwdm.Text := dwdm;
    edtYhbh.Text := FDMemTable1.FieldByName('YHBH').AsString;
    edtYhxm.Text := FDMemTable1.FieldByName('YHXM').AsString;
    edtYhmm.Text := '$';
    edtSfzh.Text := FDMemTable1.FieldByName('Sfzhm').AsString;
    edtSjhm.Text := FDMemTable1.FieldByName('Sjhm').AsString;
    cbbYhzw.Text := FDMemTable1.FieldByName('ZW').AsString;
    edtMac.Text := FDMemTable1.FieldByName('MAC').AsString;
    edtQsip.Text := FDMemTable1.FieldByName('ipks').AsString;
    edtJsip.Text := FDMemTable1.FieldByName('ipjs').AsString;
    if FDMemTable1.FieldByName('FH').AsString = 'True' then
      cbbSH.ItemIndex := 1
    else if FDMemTable1.FieldByName('SH').AsString = 'True' then
      cbbSH.ItemIndex := 2
    else
      cbbSH.ItemIndex := 0;
    // if FDMemTable1.FieldByName('FH').AsString <> '' then
    // cbFh.Checked := FDMemTable1.FieldByName('FH').AsBoolean
    // else
    // cbFh.Checked := False;
    if FDMemTable1.FieldByName('Manager').AsString <> '' then
      cbManage.Checked := FDMemTable1.FieldByName('Manager').AsBoolean
    else
      cbManage.Checked := False;
  end;
  ShowEditFrame;
end;

procedure TToolUserManage.btnSaveClick(Sender: TObject);
begin
  inherited;
  if fUserEdit.SaveData then
  begin
    btnSearchClick(nil);
    HideEditFrame;
  end;
end;

procedure TToolUserManage.btnSearchClick(Sender: TObject);
var
  Param: String;
begin
  inherited;
  Param := 'zt=1&not_YHBH=' + gUser.yhbh;
  if not gIsSa then
    Param := Param + '&like_dwdm=' + TCommon.GetXZQH(gUser.dwdm);
  if Trim(edtDwdm.Text) <> '' then
    Param := Param + '&like_dwdm=' + Trim(edtDwdm.Text);
  if Trim(edtYhbh.Text) <> '' then
    Param := Param + '&like_yhbh=' + Trim(edtYhbh.Text);
  if Trim(edtYhxm.Text) <> '' then
    Param := Param + '&like_yhxm=' + Trim(edtYhxm.Text);
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetS_User', Param),
    FDMemTable1, 'yhbh');
  FreeFrameWait;
end;

procedure TToolUserManage.fSetUserDataRolebtnCancelClick(Sender: TObject);
begin
  inherited;
  EnableControls(true);
  fSetUserDataRole.Visible := False;
end;

procedure TToolUserManage.fSetUserDataRolebtnSaveClick(Sender: TObject);
begin
  inherited;
  if fSetUserDataRole.SaveUserRoles then
  begin
    EnableControls(true);
    fSetUserDataRole.Visible := False;
  end
  else
    Application.MessageBox('添加用户角色失败', '提示', MB_OK);
end;

procedure TToolUserManage.fSetUserRolebtnSaveClick(Sender: TObject);
begin
  inherited;
  if fSetUserRole.SaveUserRoles then
  begin
    EnableControls(true);
    fSetUserRole.Visible := False;
  end
  else
    Application.MessageBox('添加用户角色失败', '提示', MB_OK);
end;

procedure TToolUserManage.HideEditFrame;
begin
  EnableControls(true);
  fUserEdit.Visible := False;
end;

procedure TToolUserManage.ShowEditFrame;
begin
  EnableControls(False);
  fUserEdit.Visible := true;
  fUserEdit.top := (self.Height - fUserEdit.Height) div 2;
  fUserEdit.Left := (self.Width - fUserEdit.Width) div 2;
end;

end.
