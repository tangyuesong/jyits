unit UFrameSDCLAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMemo, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImage, uEntity, Udictionary, uGlobal, uCommon, uJsonUtils,
  uRequestItf, cxSpinEdit, cxTimeEdit, cxCheckBox, uFrameSelectDev,
  cxCheckComboBox;

type
  TOK = procedure of object;

type
  TFrameSDCLAdd = class(TdxDialogBaseFrame)
    edtSJ: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtBZ: TcxMemo;
    dxLayoutItem7: TdxLayoutItem;
    tmBegin: TcxTimeEdit;
    tmEnd: TcxTimeEdit;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    cboFZJG1: TcxComboBox;
    dxLayoutItem16: TdxLayoutItem;
    edtKDBH: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    btnKDBH: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    cbbHPZL: TcxComboBox;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    cbbBKLX: TcxCheckComboBox;
    dxLayoutItem10: TdxLayoutItem;
    cboFZJG2: TcxCheckComboBox;
    dxLayoutItem11: TdxLayoutItem;
    cboXZQH: TcxComboBox;
    procedure btnSaveClick(Sender: TObject);
    procedure btnKDBHClick(Sender: TObject);
    procedure edtKDBHKeyPress(Sender: TObject; var Key: Char);
    procedure cboXZQHPropertiesChange(Sender: TObject);
  private
    Fok: TOK;
    FDev: TFrameSelectDev;
    procedure DevExitClick(Sender: TObject);
    procedure DevSaveClick(Sender: TObject);
  public
    { Public declarations }
    procedure AfterConstruction; override;
    property OnOK: TOK read Fok write Fok;
  end;

var
  FrameSDCLAdd: TFrameSDCLAdd;

implementation

{$R *.dfm}
{ TFrameSDCL }

procedure TFrameSDCLAdd.AfterConstruction;
var
  bklx: string;
  item: TcxCheckComboboxItem;
begin
  inherited;
  TLZDictionary.BindCombobox(cboFZJG1, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gDicMain['HPZL'], True);
  TLZDictionary.BindCombobox(cboXZQH, TLZDictionary.gDicMain['XZQH'], True);

  for bklx in TLZDictionary.gDicMain['BKLX'].Keys do
  begin
    item := cbbBKLX.Properties.Items.Add;
    item.ShortDescription := bklx;
    item.Description := TLZDictionary.gDicMain['BKLX'][bklx];
  end;
end;

procedure TFrameSDCLAdd.btnKDBHClick(Sender: TObject);
var
  key, xzqh, kks: string;
  dev: TDevice;
begin
  inherited;
  if not Assigned(FDev) then
  begin
    FDev := TFrameSelectDev.Create(self.Parent);
    FDev.Parent := self.Parent;
    FDev.tvDevColumn4.Visible := false;
    // FDev.Top := (self.Height - FDev.Height) div 2;
    FDev.Top := 20;
    FDev.Left := (self.Parent.Width - FDev.Width) div 2;
    FDev.btnSave.OnClick := self.DevSaveClick;
    FDev.btnExit.OnClick := self.DevExitClick;
    FDev.liReSelect.Visible := true;
  end;

  FDev.tb.Close;
  FDev.tb.FieldDefs.Clear;
  FDev.tb.IndexDefs.Clear;
  FDev.tb.FieldDefs.Add('bj', ftBoolean);
  FDev.tb.FieldDefs.Add('WFDD', ftString, 100);
  FDev.tb.FieldDefs.Add('SBDDMC', ftString, 100);
  FDev.tb.FieldDefs.Add('C1', ftInteger);
  FDev.tb.IndexDefs.Add('index', 'WFDD', [ixPrimary]);
  FDev.tb.IndexName := 'index';
  FDev.tb.CreateDataSet();

  FDev.tb.DisableControls;
  FDev.tb.Edit;
  kks := edtKDBH.Text;
  xzqh := '';
  if cboXZQH.SelectedItem >= 0 then
    xzqh := copy(cboXZQH.Text, 1, 6);
  for key in TLZDictionary.gDicDev[1].Keys do
  begin
    dev := TLZDictionary.gDicDev[1][key];
    if (xzqh<>'') and dev.SBBH.StartsWith(xzqh) then
    begin
      FDev.tb.Append;
      FDev.tb.FieldByName('WFDD').AsString := dev.SBBH;
      FDev.tb.FieldByName('SBDDMC').AsString := dev.SBDDMC;
      FDev.tb.FieldByName('bj').AsBoolean := kks.Contains(dev.SBBH);
    end;
  end;
  FDev.tb.Post;
  FDev.tb.First;
  FDev.tb.EnableControls;
  dxLayoutControl2Group_Root.Visible := false;
  FDev.Visible := true;
end;

procedure TFrameSDCLAdd.DevSaveClick(Sender: TObject);
var
  recNo: Integer;
  ss: string;
begin
  ss := '';
  if not FDev.tb.Active then
    exit;
  FDev.tb.DisableControls;
  recNo := FDev.tb.recNo;
  FDev.tb.First;
  while not FDev.tb.eof do
  begin
    if FDev.tb.FieldByName('bj').AsBoolean then
    begin
      ss := ss + ',' + FDev.tb.FieldByName('WFDD').AsString;
    end;
    FDev.tb.Next;
  end;
  FDev.tb.recNo := recNo;
  FDev.tb.EnableControls;
  if ss <> '' then
  begin
    edtKDBH.Text := ss;
    DevExitClick(nil);
  end
  else
     Application.MessageBox('请选择过车地点', '提示');
end;

procedure TFrameSDCLAdd.edtKDBHKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TFrameSDCLAdd.DevExitClick(Sender: TObject);
begin
  if Assigned(FDev) then
  begin
    FDev.Visible := false;
    dxLayoutControl2Group_Root.Visible := true;
  end;
end;

procedure TFrameSDCLAdd.btnSaveClick(Sender: TObject);
var
  s, fzjg, bklx: string;
begin
  inherited;
  fzjg := '';
  if cboFZJG1.Text <> '' then
    fzjg := copy(cboFZJG1.Text, 4, 2) + cboFZJG2.Text;
  if (cbbBKLX.Text <> '')and(cbbBKLX.Text <> 'ALL') then
    bklx := cbbBKLX.Text//copy(cbbBKLX.Text, 1, 2)
  else
    bklx := '';

  if (fzjg = '')and(bklx = '') then
  begin
    Application.MessageBox('发证机关和布控类型不能同时为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if edtKDBH.Text = '' then
  begin
    Application.MessageBox('过车地点不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if edtSJ.Text = '' then
  begin
    Application.MessageBox('手机号码不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  s := 'BKR=' + gUser.yhbh + '&SJHM=' + edtSJ.Text + '&ZT=1&FZJG='+ fzjg
    + '&HPZL=' + TLZDictionary.StrtoDicInfo(cbbHPZL.Text).dm
    + '&KDBH=' + edtKDBH.Text + '&bklx=' + bklx + '&BZ=' + edtBZ.Text
    + '&smsTimeBegin=' + FormatDatetime('hhmm', tmBegin.Time)
    + '&smsTimeEnd=' + FormatDatetime('hhmm', tmEnd.Time);

  TRequestItf.DbQuery('AddT_KK_Alarm_SDCL', s);
  Application.MessageBox('新增成功', '提示', MB_OK + MB_ICONINFORMATION);

  btnExitClick(nil);

  if Assigned(OnOK) then
  begin
    OnOK();
  end;
  ClearControls(Self);
end;

procedure TFrameSDCLAdd.cboXZQHPropertiesChange(Sender: TObject);
var
  key, xzqh, ss: string;
begin
  inherited;
  ss := '';
  if cboXZQH.SelectedItem >= 0 then
  begin
    xzqh := copy(cboXZQH.Text, 1, 6);
    for key in TLZDictionary.gDicDev[1].Keys do
    begin
      if key.StartsWith(xzqh) then
      begin
        ss := ss + key + ','
      end;
    end;
  end;
  edtKDBH.Text := ss;
end;

end.
