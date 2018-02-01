unit uFrameQDZDlg;

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
  cxImage, dxBarBuiltInMenu, cxPC, uEntity, uFrameInput;

type
  TFrameQDZDlg = class(TdxDialogBaseFrame)
    cxImage1: TcxImage;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    dxLayoutItem2: TdxLayoutItem;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    dxLayoutItem1: TdxLayoutItem;
    btnSMS: TcxButton;
    Timer1: TTimer;
    procedure btnSaveClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnSMSClick(Sender: TObject);
  private
    FQDZ: TQDZ;
    FLastTime: Double;
    FFrameInput: TFrameInput;
    procedure SetQDZ(const Value: TQDZ);
    procedure LoadPicture;
    procedure FrameInputbtnSaveClick(Sender: TObject);
    procedure FrameInputbtnCancelClick(Sender: TObject);
  public
    property QDZ: TQDZ read FQDZ write SetQDZ;
  end;

var
  FrameQDZDlg: TFrameQDZDlg;

implementation

uses
  uCommon, uGlobal, uMain, uFrameQDZView, uRequestItf;
{$R *.dfm}

procedure TFrameQDZDlg.btnSaveClick(Sender: TObject);
var
  frame: TFrameQDZView;
begin
  inherited;
  frmMain.ShowFrameByCaption('È°µ¼Õ¾ÏêÏ¸ÐÅÏ¢');
  if frmMain.pageMain.ActivePage.Controls[0] is TFrameQDZView then
  begin
    frame := frmMain.pageMain.ActivePage.Controls[0] as TFrameQDZView;
    frame.dxLayoutItem8.Visible := false;
    ShowFrameWait;
    frame.QDZ := FQDZ;
    FreeFrameWait;
  end;
end;

procedure TFrameQDZDlg.SetQDZ(const Value: TQDZ);
begin
  FQDZ := Value;
  LoadPicture;
end;

procedure TFrameQDZDlg.btnSMSClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FFrameInput) then
  begin
    FFrameInput := TFrameInput.Create(self);
    FFrameInput.Parent := self;
    FFrameInput.dxLayoutControl2.Width := 300;
    FFrameInput.dxLayoutControl2.Height := 200;
    FFrameInput.Top := self.Height - 300;
    FFrameInput.Left := (self.Width - 300) div 2;
    FFrameInput.btnSave.OnClick := self.FrameInputbtnSaveClick;
    FFrameInput.btnExit.OnClick := self.FrameInputbtnCancelClick;
  end;
  FFrameInput.Show;
end;

procedure TFrameQDZDlg.FrameInputbtnSaveClick(Sender: TObject);
var
  sjhm, content: string;
begin
  sjhm := FFrameInput.edtCZSJ.Text;
  if sjhm <> '' then
  begin
    content := QDZ.QDZDM + ' ' + QDZ.QDZMC + ' ' + QDZ.GLRY + ' ' + QDZ.LXFS;
    TRequestItf.DbQuery('SendSMS', 'sjhm=' + SJHM + '&content=' + content);
  end;
  FFrameInput.Hide;
end;

procedure TFrameQDZDlg.FrameInputbtnCancelClick(Sender: TObject);
begin
  FFrameInput.Hide;
end;

procedure TFrameQDZDlg.LoadPicture;
var
  params, json: string;
  list: TList<TPass>;
  pass: TPass;
  picFile: string;
  i: integer;
begin
  if TCommon.GetPic(FQDZ.TP1, '', gSetup.DirSave + 'temp1.jpg') then
    self.cxImage1.Picture.LoadFromFile(gSetup.DirSave + 'temp1.jpg');

  if TCommon.GetPic(FQDZ.TP2, '', gSetup.DirSave + 'temp2.jpg') then
    self.cxImage2.Picture.LoadFromFile(gSetup.DirSave + 'temp2.jpg');

  if TCommon.GetPic(FQDZ.TP3, '', gSetup.DirSave + 'temp3.jpg') then
    self.cxImage3.Picture.LoadFromFile(gSetup.DirSave + 'temp3.jpg');

  Timer1.Enabled := true;
end;

procedure TFrameQDZDlg.Timer1Timer(Sender: TObject);
begin
  inherited;
  if cxPageControl1.ActivePageIndex = cxPageControl1.PageCount - 1 then
    cxPageControl1.ActivePageIndex := 0
  else
    cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex + 1;
end;

end.
