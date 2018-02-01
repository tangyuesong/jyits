unit uFrameQDZViewBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics, cxControls,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, uEntity, uGlobal,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, uCommon,
  dxCustomTileControl, cxClasses, dxTileControl, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMemo, cxTextEdit;

type
  TFrameQDZViewBase = class(TdxFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxTileControl1: TdxTileControl;
    dxTileControl1Item1: TdxTileControlItem;
    dxTileControl1Group1: TdxTileControlGroup;
    txtID: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    txtName: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    txtOwner: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    txtPhone: TcxTextEdit;
    txtAddress: TcxMemo;
    dxLayoutItem7: TdxLayoutItem;
  private
    FQDZ: TQDZ;
    procedure SetQDZ(const Value: TQDZ);
    procedure AddPicture(picFile: string);
    { Private declarations }
  public
    property QDZ: TQDZ read FQDZ write SetQDZ;
  end;

var
  FrameQDZViewBase: TFrameQDZViewBase;

implementation

{$R *.dfm}

{ TdxFrame1 }

procedure TFrameQDZViewBase.SetQDZ(const Value: TQDZ);
begin
  FQDZ := Value;
  txtId.Text := Value.QDZDM;
  txtName.Text := Value.QDZMC;
  txtOwner.Text := Value.GLRY;
  txtPhone.Text := Value.LXFS;
  // Õº∆¨œ¬‘ÿ
  if TCommon.GetPic(value.TP1, '', gSetup.DirSave + 'temp1.jpg') then
    AddPicture(gSetup.DirSave + 'temp1.jpg');
  if TCommon.GetPic(value.TP2, '', gSetup.DirSave + 'temp2.jpg') then
    AddPicture(gSetup.DirSave + 'temp2.jpg');
  if TCommon.GetPic(value.TP3, '', gSetup.DirSave + 'temp3.jpg') then
    AddPicture(gSetup.DirSave + 'temp3.jpg');
end;

procedure TFrameQDZViewBase.AddPicture(picFile: string);
begin
  with self.dxTileControl1Item1.Frames.Add do
  begin
    Glyph.Image.LoadFromFile(picFile);
    Glyph.Mode := ifmFit;
  end;
end;

end.
