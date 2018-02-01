unit uFrameDevicePic;

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
  TFrameDevicePic = class(TdxDialogBaseFrame)
    cxImage1: TcxImage;
    Timer1: TTimer;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    dxLayoutItem2: TdxLayoutItem;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    dxLayoutItem1: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    cxButton2: TcxButton;
    procedure btnSaveClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    FSBBH: string;
    FLastTime: Double;
    procedure SetSBBH(const Value: string);
    procedure LoadPicture;
  public
    property SBBH: string read FSBBH write SetSBBH;
  end;

var
  FrameDevicePic: TFrameDevicePic;

implementation

uses
  uRequestItf, uJSONUtils, uCommon, uEntity, uGlobal, uMain,
  uFrameVioInput, uFrameJCBK;
{$R *.dfm}

procedure TFrameDevicePic.btnSaveClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrameDevicePic.SetSBBH(const Value: string);
begin
  FSBBH := Value;
  LoadPicture;
end;

procedure TFrameDevicePic.cxButton1Click(Sender: TObject);
begin
  inherited;
  frmMain.ShowFrameByCaption('电子警察数据采集');
  if frmMain.pageMain.ActivePage.Controls[0] is TFrameVioInput then
  begin
    with (frmMain.pageMain.ActivePage.Controls[0] as TFrameVioInput) do
    begin
      SBBH := FSBBH;
      btnExitClick(nil);
      LoadVioList;
    end;
  end;
end;

procedure TFrameDevicePic.cxButton2Click(Sender: TObject);
begin
  inherited;
  frmMain.ShowFrameByCaption('布控车辆实时监控');
  if frmMain.pageMain.ActivePage.Controls[0] is TFrameJCBK then
  begin
    with (frmMain.pageMain.ActivePage.Controls[0] as TFrameJCBK) do
    begin
      SBBH := FSBBH;
      Timer1.Enabled := true;
      Timer2.Enabled := false;
      Timer1Timer(nil);
    end;
  end;
end;

procedure TFrameDevicePic.LoadPicture;
var
  params, json: string;
  list: TList<TPass>;
  pass: TPass;
  picFile: string;
  i: integer;
begin
  params := 'begin_GCSJ=%s&end_GCSJ=%s&rows=3&KDBH=%s&orderby_desc=gcsj';
  params := Format(params, [FormatDateTime('yyyymmddhhmmss', now - 1),
    FormatDateTime('yyyymmddhhmmss', now), FSBBH]);
  json := TRequestItf.DbQuery('GetPassList', params);
  list := TJsonUtils.JsonToRecordList<TPass>(json);
  i := 0;
  for pass in list do
  begin
    picFile := gSetup.DirSave + pass.Hphm + '.jpg';
    if TCommon.GetPic(pass.fwqdz + pass.tp1, '', picFile) then
    begin
      inc(i);
      Timer1.Enabled := true;
      if i = 1 then
        self.cxImage1.Picture.LoadFromFile(picFile)
      else if i = 2 then
        self.cxImage2.Picture.LoadFromFile(picFile)
      else
        self.cxImage3.Picture.LoadFromFile(picFile);
    end;
  end;
  FLastTime := now;
  list.Free;
end;

procedure TFrameDevicePic.Timer1Timer(Sender: TObject);
begin
  inherited;
  if now - FLastTime > 1 / 24 / 60 then
    LoadPicture;
  if cxPageControl1.ActivePageIndex = cxPageControl1.PageCount - 1 then
    cxPageControl1.ActivePageIndex := 0
  else
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex + 1;
end;

end.
