unit uFrameJTPJob;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, hyieutils, iexBitmaps, hyiedefs, iesettings, iexRulers,
  System.Contnrs, imageenview, ieview, ievect, Vcl.StdCtrls, cxRadioGroup,
  Vcl.Menus, cxButtons, dxLayoutControlAdapters, dxLayoutcxEditAdapters,
  cxContainer, cxEdit, cxTextEdit, Udictionary, uCommon, uEntity, uGlobal;

type

  TJcptJTP = Record
    systemid: String;
    jobid: String;
    hphm: String;
    hpzl: String;
    bklx: String;
    clpp: String;
    csys: String;
    cllx: String;
    url: String;
    picStr: String;
    rectX: Integer;
    rectY: Integer;
    rectW: Integer;
    rectH: Integer;
    sjhm: String;
  End;

  TFrameJTPJob = class(TdxFrame)
    ImageEnVect1: TImageEnVect;
    ImageEnView1: TImageEnView;
    rbFD: TcxRadioButton;
    rbXQ: TcxRadioButton;
    btnCreateJob: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    edtSjhm: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    btnBack: TcxButton;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dlRealVeh: TdxLayoutGroup;
    edthphm: TcxTextEdit;
    edtHpzl: TcxTextEdit;
    edtclpp1: TcxTextEdit;
    edtCsys1: TcxTextEdit;
    edtCllx1: TcxTextEdit;
    edtClpp2: TcxTextEdit;
    edtCllx2: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    edtCsys2: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    edtBklx: TcxTextEdit;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    btnDelete: TcxButton;
    procedure ImageEnVect1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageEnVect1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ImageEnVect1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnBackClick(Sender: TObject);
  private
    FPicFile: String;
    FMD: Boolean;
    FSelRect: TRect;
    FX, FY, FL, FT: Integer;
    fdbool, fxq: Boolean;
    FJcptJTP: TJcptJTP;
    procedure AfterConstruction; override;
    procedure SetJcptJTP(const jtp: TJcptJTP);
    procedure ShowPicture(vect: TImageEnVect; picFile: String);
  public
    property gJcptJTP: TJcptJTP read FJcptJTP write SetJcptJTP;
    property gSelRect: TRect read FSelRect;
  end;

var
  FrameJTPJob: TFrameJTPJob;

implementation

{$R *.dfm}
{ TFrameJTPJob }

procedure TFrameJTPJob.AfterConstruction;
begin
  inherited;
  ImageEnVect1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  ImageEnView1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
end;

procedure TFrameJTPJob.btnBackClick(Sender: TObject);
begin
  inherited;
  Self.Hide;
end;

procedure TFrameJTPJob.ImageEnVect1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMD := True;
  FX := X;
  FY := Y;
end;

procedure TFrameJTPJob.ImageEnVect1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if fdbool then
  begin
    if rbFD.Checked then
    begin
      ImageEnVect1.Proc.ClearAllRedo;
      ImageEnVect1.Proc.CropSel;
      ImageEnVect1.DeSelect;
    end
    else if fxq and rbXQ.Checked then
    begin
      FSelRect.Left := ImageEnVect1.SelectedRect.X + FL;
      FSelRect.Top := ImageEnVect1.SelectedRect.Y + FT;
      FSelRect.Width := ImageEnVect1.SelectedRect.Width;
      FSelRect.Height := ImageEnVect1.SelectedRect.Height;
      ImageEnView1.IEBitmap.Allocate(ImageEnVect1.SelectedRect.Width,
        ImageEnVect1.SelectedRect.Height, ImageEnVect1.IEBitmap.PixelFormat);
      ImageEnVect1.IEBitmap.CopyRectTo(ImageEnView1.IEBitmap,
        ImageEnVect1.SelectedRect.X, ImageEnVect1.SelectedRect.Y, 0, 0,
        ImageEnVect1.SelectedRect.Width, ImageEnVect1.SelectedRect.Height);
      ImageEnView1.Update;
      ImageEnView1.Fit;
      ImageEnVect1.Paint;
    end;
    fdbool := False;
  end;
end;

procedure TFrameJTPJob.ImageEnVect1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
  begin
    if FMD and ((FX <> X) or (FY <> Y)) then
    begin
      if rbFD.Checked then
      begin
        FL := FL + ImageEnVect1.XScr2Bmp(FX);
        FT := FT + ImageEnVect1.YScr2Bmp(FY);
      end
      else
        fxq := True;
      fdbool := True;
      FMD := False;
    end;
  end
  else
    ShowPicture(ImageEnVect1, FPicFile);
end;

procedure TFrameJTPJob.SetJcptJTP(const jtp: TJcptJTP);
var
  Vehinfo: TVehInfo;
begin
  FJcptJTP := jtp;
  dlRealVeh.Visible := jtp.bklx <> '31'; // Œﬁ≈∆≤ªœ‘ æ
  btnCreateJob.Visible := jtp.jobid = '';
  btnDelete.Visible := jtp.jobid = '';
  edtSjhm.Text := jtp.sjhm;
  if dlRealVeh.Visible then
  begin
    if (length(jtp.hphm) = 7) and (length(jtp.hpzl) = 2) then
    begin
      Vehinfo := TCommon.GetVehinfo(jtp.hphm, jtp.hpzl, '');
      edtClpp2.Text := Vehinfo.clpp1;
      if TLZDictionary.gDicMain.ContainsKey('CSYS') and TLZDictionary.gDicMain
        ['CSYS'].ContainsKey(Vehinfo.csys) then
        edtCsys2.Text := TLZDictionary.gDicMain['CSYS'][Vehinfo.csys]
      else
        edtCsys2.Text := Vehinfo.csys;
      if TLZDictionary.gDicMain.ContainsKey('CLLX') and TLZDictionary.gDicMain
        ['CLLX'].ContainsKey(Vehinfo.cllx) then
        edtCllx2.Text := TLZDictionary.gDicMain['CLLX'][Vehinfo.cllx]
      else
        edtCllx2.Text := Vehinfo.cllx;
    end
    else
    begin
      edtClpp2.Text := '';
      edtCsys2.Text := '';
      edtCllx2.Text := '';
    end;
  end;

  edthphm.Text := jtp.hphm;
  if TLZDictionary.gDicMain.ContainsKey('HPZL') and TLZDictionary.gDicMain
    ['HPZL'].ContainsKey(jtp.hpzl) then
    edtHpzl.Text := TLZDictionary.gDicMain['HPZL'][jtp.hpzl]
  else
    edtHpzl.Text := jtp.hpzl;

  if TLZDictionary.gDicMain.ContainsKey('BKLX') and TLZDictionary.gDicMain
    ['BKLX'].ContainsKey(jtp.bklx) then
    edtBklx.Text := TLZDictionary.gDicMain['BKLX'][jtp.bklx]
  else
    edtBklx.Text := jtp.bklx;

  edtclpp1.Text := jtp.clpp;
  if TLZDictionary.gDicMain.ContainsKey('CSYS') and TLZDictionary.gDicMain
    ['CSYS'].ContainsKey(jtp.csys) then
    edtCsys1.Text := TLZDictionary.gDicMain['CSYS'][jtp.csys]
  else
    edtCsys1.Text := jtp.csys;
  if TLZDictionary.gDicMain.ContainsKey('CLLX') and TLZDictionary.gDicMain
    ['CLLX'].ContainsKey(jtp.cllx) then
    edtCllx1.Text := TLZDictionary.gDicMain['CLLX'][jtp.cllx]
  else
    edtCllx1.Text := jtp.cllx;

  FPicFile := gSetup.DirSave + '\' + jtp.systemid + '.jpg';
  TCommon.GetPic('', jtp.url, FPicFile);
  if not FileExists(FPicFile) and (jtp.picStr <> '') then
    TCommon.Base64ToFile(jtp.picStr, FPicFile);
  ShowPicture(ImageEnVect1, FPicFile);

  FSelRect.Left := jtp.rectX;
  FSelRect.Top := jtp.rectY;
  FSelRect.Width := jtp.rectW;
  FSelRect.Height := jtp.rectH;
  ImageEnVect1.AutoFit := True;
  ImageEnView1.IEBitmap.Allocate(FSelRect.Width, FSelRect.Height,
    ImageEnVect1.IEBitmap.PixelFormat);
  ImageEnVect1.IEBitmap.CopyRectTo(ImageEnView1.IEBitmap, FSelRect.Left,
    FSelRect.Top, 0, 0, FSelRect.Width, FSelRect.Height);
  ImageEnView1.Update;
  ImageEnView1.Fit;
  ImageEnVect1.Paint;
end;

procedure TFrameJTPJob.ShowPicture(vect: TImageEnVect; picFile: String);
begin
  FMD := False;
  FL := 0;
  FT := 0;
  fdbool := False;
  fxq := False;
  with ImageEnVect1 do
  begin
    AutoFit := True;
    IO.NativePixelFormat := True;
    IO.LoadFromFile(picFile);
    Select(0, 0, 0, 0, iespReplace);
    MouseInteract := [miSelect];
    SelectionOptions := [iesoMoveable, iesoCanScroll];
  end;
  rbFD.Checked := True;
  ImageEnView1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
end;

end.
