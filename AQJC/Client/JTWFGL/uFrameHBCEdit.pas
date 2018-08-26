unit uFrameHBCEdit;

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
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, uCommon, uEntity;

type
  TFrameHBCEdit = class(TdxDialogBaseFrame)
    edtHPHM: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbHPZL: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    edtFDJH: TcxTextEdit;
    edtDJRQ: TcxTextEdit;
    edtCLPP: TcxTextEdit;
    edtCLSBDM: TcxTextEdit;
    edtCLXH: TcxTextEdit;
    edtZSDZ: TcxTextEdit;
    edtSYR: TcxTextEdit;
    edtSJHM: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    edtHBDJ: TcxTextEdit;
    edtYXQX: TcxTextEdit;
    edtBFQX: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem3: TdxLayoutSeparatorItem;
    dxLayoutGroup7: TdxLayoutGroup;
    cbbSF: TcxComboBox;
    dxLayoutItem16: TdxLayoutItem;
    procedure edtHPHMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GetHBC: THBC;
    { Private declarations }
  public
    procedure AfterConstruction; override;
    property HBC: THBC read GetHBC;
  end;

var
  FrameHBCEdit: TFrameHBCEdit;

implementation

uses
  Udictionary, uRequestItf, uJSONUtils;
{$R *.dfm}
{ TdxDialogBaseFrame1 }

procedure TFrameHBCEdit.AfterConstruction;
var
  Key: string;
begin
  inherited;
  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gdicmain['HPZL'], true);
  cbbSF.ItemIndex := 1;

  TLZDictionary.BindCombobox(cbbSF, TLZDictionary.gdicmain['JC'], true);
  cbbSF.ItemIndex := 18;
end;

procedure TFrameHBCEdit.edtHPHMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  function CheckZT(zt: string): boolean;
  const
    BadZT = 'OBCDE';
  var
    i: Integer;
  begin
    for i := 1 to zt.Length do
    begin
      if BadZT.Contains(zt[i]) then
        Exit(false);
    end;
    Exit(true);
  end;
var
  json: string;
  veh: TVehInfo;
begin
  inherited;
  if (Key = 13) and (edtHPHM.Text <> '') then
  begin
    veh := TCommon.GetLocalVeh(copy(cbbSF.Text, 4, 20) + edtHPHM.Text, Copy(cbbHPZL.Text, 0, 2));
    if (veh.hphm <> '') and (CheckZT(veh.zt)) then
    begin
      edtFDJH.Text := veh.FDJH;
      edtSJHM.Text := veh.SJHM;
      edtCLPP.Text := veh.CLPP1;
      edtSYR.Text := veh.syr;
      edtZSDZ.Text := veh.ZSXXDZ;
      edtCLSBDM.Text := veh.CLSBDH;
      edtDJRQ.Text := veh.CCDJRQ;
      edtYXQX.Text := veh.yxqz;
      edtBFQX.Text := veh.qzbfqz;
      edtCLXH.Text := veh.CLXH;
      edtHBDJ.Text := veh.HBDBQK;
    end
    else
      Application.MessageBox('该车状态异常！', '提示', mb_ok);
  end;
end;

function TFrameHBCEdit.GetHBC: THBC;
begin
  result.SystemID := TGUID.NewGuid.ToString;
  result.hphm := copy(cbbSF.Text, 4, 1) + edtHPHM.Text;
  result.hpzl := Copy(cbbHPZL.Text, 0, 2);
  result.FDJH := edtFDJH.Text;
  result.SJHM := edtSJHM.Text;
  result.CLPP := edtCLPP.Text;
  result.JDCSYR := edtSYR.Text;
  result.ZSXXDZ := edtZSDZ.Text;
  result.CLSBDH := edtCLSBDM.Text;
  result.CCDJRQ := edtDJRQ.Text;
  result.YXQX := edtYXQX.Text;
  result.BFQX := edtBFQX.Text;
  result.CLXH := edtCLXH.Text;
  result.HBDBQK := edtHBDJ.Text;
end;

end.
