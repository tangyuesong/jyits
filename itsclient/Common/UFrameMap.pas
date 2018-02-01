unit UFrameMap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
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
  dxLayoutcxEditAdapters, dxLayoutContainer, cxContainer, cxEdit, Vcl.StdCtrls,
  Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, cxTextEdit, cxClasses,
  cxButtons, dxLayoutControl, uGlobal, uEntity, Udictionary, uCommon, cxImage,
  cxMaskEdit, cxButtonEdit, hyieutils, iexBitmaps, hyiedefs, iesettings,
  iexRulers, System.Contnrs, imageenview, ieview, uRequestItf, uJsonUtils,
  cefvcl, cef.JsExtented, ceflib, LatLngHelper, Vcl.ExtCtrls;

type
  TFrameMap = class(TdxDialogBaseFrame)
    edtLng: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    Chromium1: TChromium;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    edtLat: TcxTextEdit;
    tmr1: TTimer;
    procedure tmr1Timer(Sender: TObject);
    procedure Chromium1LoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer; out Result: Boolean);
  private
    FJsExtended: TNCJsExtended;
    procedure LoadMap;
    procedure GetPoint(lng, lat: Double);
  public

  end;

  TOnGetPoint = procedure(lng, lat: double) of object;

  TJs = class
  private
    FOnGetPoint: TOnGetPoint;
  public
    procedure GetPoint(lng, lat: double);
    property OnGetPoint: TOnGetPoint read FOnGetPoint write FOnGetPoint;
  end;

implementation

{$R *.dfm}
{ TFrameMap }

procedure TFrameMap.Chromium1LoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer;
  out Result: Boolean);
begin
  inherited;
  FJsExtended.ExecuteJavaScript('GetPointSwitch = true;');
end;

procedure TFrameMap.LoadMap;
var
  FJsProcessor: TJs;
begin
  FJsProcessor := TJs.Create();
  FJsProcessor.OnGetPoint := self.GetPoint;
  FJsExtended := TNCJsExtended.Create(Self);
  FJsExtended.SetProcessObject(FJsProcessor, TypeInfo(TJs));
  FJsExtended.Chromium := self.Chromium1;
  Chromium1.Load(gSetup.MapUrl);
end;

procedure TFrameMap.tmr1Timer(Sender: TObject);
begin
  inherited;
  tmr1.Enabled := False;
  LoadMap;
end;

procedure TFrameMap.GetPoint(lng, lat: Double);
var
  info, script: string;
  tmp: TLatLng;
begin
  tmp.lng := lng;
  tmp.lat := lat;
  tmp := tmp.BD09ToGCJ02;
  tmp := tmp.GCJ02ToWGS84;
  edtLng.Text := Format('%.6f', [tmp.lng]);
  edtLat.Text := Format('%.6f', [tmp.lat]);
  info := edtLng.Text + ', '+ edtLat.Text;
  script := Format('map.clearOverlays(); addMarker(%.12f, %.12f,"marker-blue.png","%s","")', [lng, lat, info]);
  FJsExtended.ExecuteJavaScript(script, '', 0);
end;

{ TJs }

procedure TJs.GetPoint(lng, lat: double);
begin
  if Assigned(OnGetPoint) then
    OnGetPoint(lng, lat);
end;

end.

