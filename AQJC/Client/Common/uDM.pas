unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.ImageList,
  Vcl.ImgList, Vcl.Controls, acAlphaImageList, cxGridDBTableView,
  cxGridTableView, Vcl.Dialogs, System.Variants, Xml.XMLDoc, Xml.XMLIntf,
  Vcl.Forms, cxTextEdit, cxDBLookupComboBox, cefvcl, cef.JsExtented, cxImage,
  System.Types,
  System.IOUtils, Winapi.Windows, IniFiles, Generics.Collections, DBClient,
  Vcl.Imaging.jpeg, Soap.EncdDecd,
  sSkinManager, Vcl.Menus, Vcl.StdActns, System.Actions, Vcl.ActnList,
  cxEditRepositoryItems, cxEdit, cxExtEditRepositoryItems, cxClasses, uEntity,
  uCommon, cxGrid, cxGridExportLink, ImageEnView, dxLayoutLookAndFeels,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, uCxgridFileds,
  dxSkinXmas2008Blue, cxLookAndFeels, dxSkinsForm, cxGraphics, Udictionary,
  uRequestItf, uJSONUtils, uLookUpDataSource, dxSkin, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI, IdBaseComponent,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL;

type
  TDM = class(TDataModule)
    cxdtrpstry1: TcxEditRepository;
    cxProgressBarcxdtrpstry1ProgressBar1: TcxEditRepositoryProgressBar;
    cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    dxLayoutCxLookAndFeel1: TdxLayoutCxLookAndFeel;
    dxLayoutCxLookAndFeelMetropolisDark: TdxLayoutCxLookAndFeel;
    dxLayoutCxLookAndFeelNavy: TdxLayoutCxLookAndFeel;
    dxLayoutCxLookAndFeel2: TdxLayoutCxLookAndFeel;
    dxSkinController1: TdxSkinController;
    dxLayoutCxLookAndFeel3: TdxLayoutCxLookAndFeel;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    ilBarLarge: TcxImageList;
    dxLayoutSkinLookAndFeel2: TdxLayoutSkinLookAndFeel;
    ilBarSmall: TcxImageList;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    cxdtrpstry1ImageItem1: TcxEditRepositoryImageItem;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
  end;

var
  dm: TDM;

implementation

{$R *.dfm}

initialization

end.
