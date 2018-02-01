unit uFrameInputWS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxCheckBox, cxCheckComboBox, uEntity, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxMemo;

type
  TFrameInputWS = class(TdxDialogBaseFrame)
    edtWSBH: TcxMemo;
    dxLayoutItem11: TdxLayoutItem;
    edtCZDW: TcxComboBox;
    edtCZMJ: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    procedure edtCZDWPropertiesChange(Sender: TObject);
  private
    FKDBH: string;
    procedure SetKDBH(const Value: string);
    function GetCZDW: string;
    function GetCZR: string;
    function GetWSBH: string;
    function GetJYW: string;
  public
    property KDBH: string read FKDBH write SetKDBH;
    property WSBH: string read GetWSBH;
    property JYW: string read GetJYW;
    property CZDW: string read GetCZDW;
    property CZR: string read GetCZR;
  end;

var
  FrameInputWS: TFrameInputWS;

implementation
uses udictionary, uGlobal, uCommon;
{$R *.dfm}

{ TFrameInputWS }

procedure TFrameInputWS.edtCZDWPropertiesChange(Sender: TObject);
var
  dw, yhbh: string;
  user: TUser;
begin
  inherited;
  edtCZMJ.Properties.Items.Clear;
  dw := self.CZDW;
  if TLZDictionary.gDicDept.ContainsKey(dw) then
  begin
    for yhbh in TLZDictionary.gDicUser.Keys do
    begin
      user := TLZDictionary.gDicUser[yhbh];
      if user.DWDM = dw then
      begin
        edtCZMJ.Properties.Items.Add(user.yhbh + ':' + user.YHXM);
      end;
    end;
    if gUser.DWDM = dw then
      edtCZMJ.Text := gUser.yhbh + ':' + gUser.YHXM
    else
      edtCZMJ.ItemIndex := 0;
  end
  else
    edtCZMJ.Text := '';
end;

function TFrameInputWS.GetCZDW: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZDW.Text).dm;
end;

function TFrameInputWS.GetCZR: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZMJ.Text).mc;
end;

function TFrameInputWS.GetJYW: string;
begin
  result := TCommon.GetJYW(wsbh);
end;

function TFrameInputWS.GetWSBH: string;
begin
  result := edtWSBH.Text;
end;

procedure TFrameInputWS.SetKDBH(const Value: string);
var
  czdw, key: string;
begin
  FKDBH := Value;
  edtCZDW.Properties.Items.Clear;
  if TLZDictionary.gDicDev[2].ContainsKey(KDBH) then
  begin
    czdw := TLZDictionary.gDicDev[2][KDBH].CZDW;
    for key in czdw.Split([';']) do
    begin
      if TLZDictionary.gDicDept.ContainsKey(key) then
      begin
        edtCZDW.Properties.Items.Add(key + ':' + TLZDictionary.gDicDept[key].DWMC);
      end;
    end;
    edtCZDW.ItemIndex := edtCZDW.Properties.Items.Count - 1;
  end
  else begin
    edtCZDW.Text := '';
  end;
end;

end.
