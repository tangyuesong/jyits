unit uFrameZHPTDeviceRole;

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
  uFrameZHPTDeviceRoleEdit, uFrameZHPTDeviceRoleUser, uFrameAddZHPTDevice;

type
  TFrameZHPTDeviceRole = class(TToolGridFrame)
    btnAdd: TdxBarLargeButton;
    btnModify: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnUser: TdxBarLargeButton;
    BtnInput: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    Timer1: TTimer;
    btnAddFunction: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCanelClick(Sender: TObject);
    procedure btnModifyClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure BtnInputClick(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnAddFunctionClick(Sender: TObject);
  private
    FrameZHPTDeviceRoleEdit: TFrameZHPTDeviceRoleEdit;
    FrameAddZHPTDevice: TFrameAddZHPTDevice;
    FrameZHPTDeviceRoleUser: TFrameZHPTDeviceRoleUser;
    procedure AfterConstruction; override;
    procedure ShowData();
    procedure ShowEditFrame(RoleID, RoleName, Bz: String);
    procedure HideEditFrame;
    procedure ZHPTDeviceExitClick(Sender: TObject);
    procedure ZHPTDeviceRoleEditExitClick(Sender: TObject);
    procedure ZHPTDeviceRoleUserExitClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrameZHPTDeviceRole: TFrameZHPTDeviceRole;

implementation

{$R *.dfm}
{ TFrameZHPTDeviceRole }

procedure TFrameZHPTDeviceRole.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);
end;

procedure TFrameZHPTDeviceRole.acteditExecute(Sender: TObject);
begin
  inherited;
  btnModifyClick(nil);
end;

procedure TFrameZHPTDeviceRole.actnewExecute(Sender: TObject);
begin
  inherited;
  btnUserClick(nil);
end;

procedure TFrameZHPTDeviceRole.ZHPTDeviceExitClick(Sender: TObject);
begin
  inherited;
  if Assigned(FrameAddZHPTDevice) then
    FrameAddZHPTDevice.Visible := false;
  EnableControls(True);
end;

procedure TFrameZHPTDeviceRole.AfterConstruction;
begin
  inherited;
  GridColumns := 'yhbh,jsmc,bz,gxsj,操作';
  GridView.Columns[4].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible :=
    btnModify.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := btnDel.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := btnUser.Enabled;
  BtnInput.Visible := btnAdd.Enabled;
end;

procedure TFrameZHPTDeviceRole.btnAddClick(Sender: TObject);
begin
  inherited;
  ShowEditFrame('', '', '');
end;

procedure TFrameZHPTDeviceRole.btnAddFunctionClick(Sender: TObject);
begin
  inherited;
  EnableControls(false);
  if not Assigned(FrameAddZHPTDevice) then
  begin
    FrameAddZHPTDevice := TFrameAddZHPTDevice.Create(self);
    FrameAddZHPTDevice.Parent := self;
    FrameAddZHPTDevice.top := (self.Height - FrameAddZHPTDevice.Height) div 2;
    FrameAddZHPTDevice.Left := (self.Width - FrameAddZHPTDevice.Width) div 2;
    FrameAddZHPTDevice.btnExit.OnClick := ZHPTDeviceExitClick;
  end
  else
  begin
    FrameAddZHPTDevice.edtID.Text := '';
    FrameAddZHPTDevice.edtCaption.Text := '';
    FrameAddZHPTDevice.edtSBDD.Text := '';
  end;
  FrameAddZHPTDevice.Visible := True;
end;

procedure TFrameZHPTDeviceRole.btnCanelClick(Sender: TObject);
begin
  inherited;
  HideEditFrame;
end;

procedure TFrameZHPTDeviceRole.btnDelClick(Sender: TObject);
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
      TRequestItf.DbQuery('ModifyZHPTDeviceRole', 'TYBJ=1&SYSTEMID=' + id);
      TRequestItf.DbQuery('DelZHPTDeviceRoleUser', 'RoleID=' + id);
      TRequestItf.DbQuery('DelZHPTDeviceRoleDevice', 'RoleID=' + id);
      FDMemTable1.Delete;
    end;
  end;
end;

procedure TFrameZHPTDeviceRole.BtnInputClick(Sender: TObject);
begin
  inherited;
  btnAddClick(nil);
end;

procedure TFrameZHPTDeviceRole.btnModifyClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  ShowEditFrame(FDMemTable1.FieldByName('SystemID').AsString,
    FDMemTable1.FieldByName('JSMC').AsString, FDMemTable1.FieldByName('BZ')
    .AsString);
end;

procedure TFrameZHPTDeviceRole.btnUserClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  EnableControls(false);

  if not Assigned(FrameZHPTDeviceRoleUser) then
  begin
    FrameZHPTDeviceRoleUser := TFrameZHPTDeviceRoleUser.Create(self);
    FrameZHPTDeviceRoleUser.Parent := self;
    FrameZHPTDeviceRoleUser.top :=
      (self.Height - FrameZHPTDeviceRoleUser.Height) div 2;
    FrameZHPTDeviceRoleUser.Left :=
      (self.Width - FrameZHPTDeviceRoleUser.Width) div 2;
    FrameZHPTDeviceRoleUser.btnCancel.OnClick := ZHPTDeviceRoleUserExitClick;
  end;

  FrameZHPTDeviceRoleUser.SearchUser(FDMemTable1.FieldByName('SystemID')
    .AsString);
  FrameZHPTDeviceRoleUser.Visible := True;
end;

procedure TFrameZHPTDeviceRole.ZHPTDeviceRoleEditExitClick(Sender: TObject);
begin
  if Assigned(FrameZHPTDeviceRoleEdit) then
  begin
    FrameZHPTDeviceRoleEdit.Visible := false;
    ShowData;
  end;
  EnableControls(True);
end;

procedure TFrameZHPTDeviceRole.HideEditFrame;
begin
  EnableControls(True);
end;

procedure TFrameZHPTDeviceRole.ShowData;
var
  Param: String;
begin
  inherited;
  Param := 'TYBJ=0';
  if not gIsSa then
    Param := Param + '&yhbh=' + gUser.YHBH;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetZHPTDeviceRole', Param),
    FDMemTable1);
  FreeFrameWait;
end;

procedure TFrameZHPTDeviceRole.ShowEditFrame(RoleID, RoleName, Bz: String);
begin
  EnableControls(false);
  if not Assigned(FrameZHPTDeviceRoleEdit) then
  begin
    FrameZHPTDeviceRoleEdit := TFrameZHPTDeviceRoleEdit.Create(self);
    FrameZHPTDeviceRoleEdit.Parent := self;
    FrameZHPTDeviceRoleEdit.top :=
      (self.Height - FrameZHPTDeviceRoleEdit.Height) div 2;
    FrameZHPTDeviceRoleEdit.Left :=
      (self.Width - FrameZHPTDeviceRoleEdit.Width) div 2;
    FrameZHPTDeviceRoleEdit.btnCanel.OnClick := ZHPTDeviceRoleEditExitClick;
  end;
  FrameZHPTDeviceRoleEdit.FillDataRole(RoleID, RoleName, Bz);
  FrameZHPTDeviceRoleEdit.Visible := True;
end;

procedure TFrameZHPTDeviceRole.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  ShowData;
end;

procedure TFrameZHPTDeviceRole.ZHPTDeviceRoleUserExitClick(Sender: TObject);
begin
  if Assigned(FrameZHPTDeviceRoleUser) then
    FrameZHPTDeviceRoleUser.Visible := false;
  EnableControls(True);
end;

end.
