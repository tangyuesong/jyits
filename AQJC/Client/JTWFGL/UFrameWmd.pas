unit UFrameWmd;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, uGlobal, udm,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, uDictionary,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxMemo, cxDropDownEdit, cxCalendar, cxMaskEdit, cxTextEdit,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  uCommon;

type
  TFrameWmd = class(TdxDialogBaseFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    edthphm: TcxTextEdit;
    cbbhpzl: TcxComboBox;
    cbbjc: TcxComboBox;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    MemoYY: TcxMemo;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    cbbSYFW: TcxComboBox;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    cbbYJ: TcxComboBox;
    edt: TcxTextEdit;
  private
    FID: string;
    FEditId: TEditStatus;
  public
    property ID: string read FID Write FID; // ϵͳid
    property EditID: TEditStatus read FEditId write FEditId;
  end;

var
  FrameWmd: TFrameWmd;

implementation

{$R *.dfm}

end.
