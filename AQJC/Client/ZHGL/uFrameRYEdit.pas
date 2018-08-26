unit uFrameRYEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, uRequestItf, cxLabel, Udictionary, uJsonUtils,
  Generics.Collections, uEntity;

type
  TOK = procedure() of object;

  TFrameRYEdit = class(TdxDialogBaseFrame)
    cbbBCLB: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    edtBCBH: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    edtZBRY: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    edtRYDH: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    cbZLZB: TcxCheckBox;
    dxLayoutItem7: TdxLayoutItem;
    cbZRZB: TcxCheckBox;
    dxLayoutItem8: TdxLayoutItem;
    cxLabel1: TcxLabel;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    cbbDWMC: TcxComboBox;
    procedure btnExitClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FOK: TOK;
    procedure AfterConstruction; override;
  public
    FSystemID: String;
    property OnOK: TOK read FOK write FOK;
  end;

var
  FrameRYEdit: TFrameRYEdit;

implementation

{$R *.dfm}

procedure TFrameRYEdit.AfterConstruction;
var
  dept: TDept;
begin
  inherited;
  cbbDWMC.Properties.Items.Clear;
  for dept in TLZDictionary.gDicDept.Values do
    cbbDWMC.Properties.Items.Add(dept.DWMC);
  cbbDWMC.ItemIndex := 0;
end;

procedure TFrameRYEdit.btnExitClick(Sender: TObject);
begin
  inherited;
  Self.Hide;
  if Assigned(OnClose) then
  begin
    OnClose;
  end;
end;

procedure TFrameRYEdit.btnSaveClick(Sender: TObject);
var
  s, r: String;
begin
  inherited;
  s := 'DWMC=' + cbbDWMC.Text + '&BCLB=' + Trim(cbbBCLB.Text) + '&BCBH=' +
    Trim(edtBCBH.Text) + '&ZBRY=' + Trim(edtZBRY.Text) + '&RYDH=' +
    Trim(edtRYDH.Text);
  if cbZLZB.Checked then
    s := s + '&ZLZB=1'
  else
    s := s + '&ZLZB=0';
  if cbZRZB.Checked then
    s := s + '&ZRZB=1'
  else
    s := s + '&ZRZB=0';
  if FSystemID <> '' then
  begin
    s := s + '&SYSTEMID=' + FSystemID;
    r := TRequestItf.DbQuery('ModifyZB_Config', s);
  end
  else
    r := TRequestItf.DbQuery('ADDZB_Config', s);
  if r = '1' then
    Application.MessageBox('操作成功', '提示', MB_OK + MB_ICONINFORMATION)
  else
    Application.MessageBox('操作失败', '提示', MB_OK + MB_ICONERROR);

  Self.Hide;
  if Assigned(OnOK) then
  begin
    OnOK;
  end;
end;

end.
