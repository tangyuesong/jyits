unit uFramePictureCompare;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxCheckBox, cxCheckComboBox, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Generics.Collections, Vcl.ExtCtrls,
  cxImage, dxBarBuiltInMenu, cxPC;

type
  TFramePictureCompare = class(TdxDialogBaseFrame)
    cxImage1: TcxImage;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    cxImage2: TcxImage;
    procedure btnSaveClick(Sender: TObject);
  public
    procedure LoadPicture(url1, url2: string);
  end;

var
  FramePictureCompare: TFramePictureCompare;

implementation
uses
  uGlobal, uCommon;
{$R *.dfm}

procedure TFramePictureCompare.btnSaveClick(Sender: TObject);
begin
  inherited;
 //
end;

procedure TFramePictureCompare.LoadPicture(url1, url2: string);
var
  picFile: string;
begin
  picFile := gSetup.DirSave + 'PictureCompare1.jpg';
  if TCommon.GetPic(url1, '', picFile) then
    self.cxImage1.Picture.LoadFromFile(picFile);
  picFile := gSetup.DirSave + 'PictureCompare2.jpg';
  if TCommon.GetPic(url2, '', picFile) then
    self.cxImage2.Picture.LoadFromFile(picFile);
  self.cxImage1.Width := self.Width div 2 - 4;
end;

end.
