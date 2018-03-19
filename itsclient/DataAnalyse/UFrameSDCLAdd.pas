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
  uRequestItf, cxSpinEdit, cxTimeEdit, cxCheckBox, uFrameSelectDev;

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
    edtFZJG: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    edtKDBH: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    btnKDBH: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    cbbHPZL: TcxComboBox;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    cbbSource: TcxComboBox;
    procedure btnSaveClick(Sender: TObject);
    procedure btnKDBHClick(Sender: TObject);
    procedure edtKDBHKeyPress(Sender: TObject; var Key: Char);
  private
    Fok: TOK;
    KDBH: string;
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
begin
  inherited;
  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gDicMain['HPZL'], True);
end;

procedure TFrameSDCLAdd.btnKDBHClick(Sender: TObject);
var
  key: string;
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
  for key in TLZDictionary.gDicDev[1].Keys do
  begin
    dev := TLZDictionary.gDicDev[1][key];
    FDev.tb.Append;
    FDev.tb.FieldByName('WFDD').AsString := dev.SBBH;
    FDev.tb.FieldByName('SBDDMC').AsString := dev.SBDDMC;
    FDev.tb.FieldByName('bj').AsBoolean := false;
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
  ss, ss1: string;
begin
  ss := '';
  ss1 := '';
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
      ss1 := ss1 + ',' + FDev.tb.FieldByName('SBDDMC').AsString;
    end;
    FDev.tb.Next;
  end;
  FDev.tb.recNo := recNo;
  FDev.tb.EnableControls;
  if ss <> '' then
  begin
    KDBH := ss;
    edtKDBH.Text := ss1;
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
  s: string;
begin
  inherited;
  if Trim(edtFZJG.Text) = '' then
  begin
    Application.MessageBox('发证机关不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if edtKDBH.Text = '' then
  begin
    Application.MessageBox('过车地点不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;

  s := 'BKR=' + gUser.yhbh + '&SJHM=' + edtSJ.Text + '&ZT=1&FZJG='
    + edtFZJG.Text + '&HPZL=' + TLZDictionary.StrtoDicInfo(cbbHPZL.Text).dm
    + '&KDBH=' + KDBH + '&Source=' + cbbSource.Text + '&BZ=' + edtBZ.Text
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

end.
