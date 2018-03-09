unit UFrameJTPAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
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
  uRequestItf, cxSpinEdit, cxTimeEdit, cxCheckBox;

type
  TOK = procedure of object;

type
  TFrameJTPAdd = class(TdxDialogBaseFrame)
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
    edtclpp1: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    cbbCsys: TcxComboBox;
    dxLayoutItem18: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
  private
    Fok: TOK;
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
    property OnOK: TOK read Fok write Fok;
  end;

var
  FrameJTPAdd: TFrameJTPAdd;

implementation

{$R *.dfm}
{ TFrameJTP }

procedure TFrameJTPAdd.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cbbCsys, TLZDictionary.gDicMain['CSYS'], True);
end;

procedure TFrameJTPAdd.btnSaveClick(Sender: TObject);
var
  s: string;
begin
  inherited;
  if Trim(edtclpp1.Text) = '' then
  begin
    Application.MessageBox('品牌型号不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;

  s := 'BKR=' + gUser.yhbh + '&SJHM=' + edtSJ.Text + '&ZT=1&CLPP='
    + edtCLPP1.Text + '&CSYS=' + TLZDictionary.StrtoDicInfo(cbbCsys.Text).dm
    + '&smsTimeBegin=' + FormatDatetime('hhmm', tmBegin.Time)
    + '&smsTimeEnd=' + FormatDatetime('hhmm', tmEnd.Time);

  TRequestItf.DbQuery('AddT_KK_Alarm_JTP', s);
  Application.MessageBox('新增成功', '提示', MB_OK + MB_ICONINFORMATION);

  btnExitClick(nil);

  if Assigned(OnOK) then
  begin
    OnOK();
  end;
  ClearControls(Self);
end;

end.
