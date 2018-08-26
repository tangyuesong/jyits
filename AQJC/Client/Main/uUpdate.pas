unit uUpdate;
{$I ItsClient.inc }

interface

uses
{$IFDEF WEBXONE}
  wxoExec,
{$ENDIF}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinXmas2008Blue, dxGDIPlusClasses, cxImage, uGlobal;

type
  TfrmUpdate = class(TForm)
    cxImage1: TcxImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdate: TfrmUpdate;

implementation

{$R *.dfm}

procedure TfrmUpdate.FormCreate(Sender: TObject);
begin
{$IFDEF WEBXONE}
  self.WindowState := wsNormal;
  wxoPrepare(Handle, Application.Handle);
  wxoSetTitle(PAnsiChar(AnsiString(gSetup.AppTitle)));
{$ENDIF}
end;

procedure TfrmUpdate.FormShow(Sender: TObject);
begin
{$IFDEF WEBXONE}
  Application.MainFormOnTaskbar := False;
  SetWindowLong(self.Handle, GWL_EXSTYLE, GetWindowLong(self.Handle,
    GWL_EXSTYLE) and (not WS_EX_APPWINDOW));
  ShowWindow(Application.Handle, SW_HIDE);
{$ENDIF}
end;

end.
