unit UFrameJFPic;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxImage, cxClasses, dxLayoutControl,
  dxGDIPlusClasses, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit;

type
  TFrameJFPic = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    cxImage1: TcxImage;
    dxLayoutItem1: TdxLayoutItem;
    cxImage2: TcxImage;
    dxLayoutItem2: TdxLayoutItem;
    edtwfxw: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    edtfkje: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    edtjf: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    btnexit1: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    procedure btnexit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrameJFPic: TFrameJFPic;

implementation

{$R *.dfm}

procedure TFrameJFPic.btnexit1Click(Sender: TObject);
begin
  inherited;
  cxImage1.Clear;
  cxImage2.Clear;
  Hide;
end;

end.
