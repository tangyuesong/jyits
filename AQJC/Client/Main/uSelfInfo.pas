unit uSelfInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, dxDialogBase,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, cxContainer, cxEdit,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses,
  cxTextEdit, cxButtons, dxLayoutControl, uRequestItf, QBAes, uGLobal, uCommon;

type
  TfrmSelfInfo = class(TForm)
    dxLayoutControl2: TdxLayoutControl;
    btnSave: TcxButton;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    cxTextEdit7: TcxTextEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmSelfInfo: TfrmSelfInfo;

implementation

{$R *.dfm}

procedure TfrmSelfInfo.btnSaveClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSelfInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmSelfInfo := nil;
end;

procedure TfrmSelfInfo.FormShow(Sender: TObject);
begin
  cxTextEdit1.Text := gUser.yhbh;
  cxTextEdit2.Text := gUser.YHXM;
  cxTextEdit7.Text := gUser.DWMC;
  cxTextEdit3.Text := gUser.lastlogintime;
  cxTextEdit4.Text := gUser.lasttokenerror;
  cxTextEdit5.Text := gUser.validday;
  cxTextEdit6.Text := gUser.passwordvalidday;
end;

end.
