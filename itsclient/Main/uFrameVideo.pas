unit uFrameVideo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ShellAPI, DateUtils,
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
  cxImage, dxBarBuiltInMenu, cxPC, uGlobal, IOUtils,
  FHNSBSATXLib_TLB, FHNSBSDLGATXLib_TLB, FHZWNDOCXLib_TLB, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTrackBar, cxCalendar, cxButtonEdit, cxSpinEdit, cxTimeEdit;

type
  TFrameVideo = class(TdxDialogBaseFrame)
    Timer1: TTimer;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    liTrack: TdxLayoutItem;
    dxLayoutGroup6: TdxLayoutGroup;
    cxDateEdit1: TcxDateEdit;
    cxTrackBar1: TcxTrackBar;
    dxLayoutItem6: TdxLayoutItem;
    btnPlay: TcxButton;
    btnFast: TcxButton;
    btnSlow: TcxButton;
    btnDownload: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutItem11: TdxLayoutItem;
    btnStop: TcxButton;
    Timer2: TTimer;
    lgDownload: TdxLayoutGroup;
    cxTimeEdit1: TcxTimeEdit;
    cxTimeEdit2: TcxTimeEdit;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    edtPath: TcxButtonEdit;
    cxButton1: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    SaveDialog1: TSaveDialog;
    cxButton2: TcxButton;
    procedure Timer1Timer(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure cxDateEdit1PropertiesChange(Sender: TObject);
    procedure btnFastClick(Sender: TObject);
    procedure btnSlowClick(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cxTrackBar1PropertiesGetPositionHint(Sender: TObject;
      const APosition: Integer; var AHintText: string; var ACanShow,
      AIsHintMultiLine: Boolean);
    procedure cxTrackBar1PropertiesChange(Sender: TObject);
    procedure cxTrackBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxTrackBar1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure edtPathPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
  private
    FRecordPlaying: boolean;
    FStep: integer;
    FSBBH: string;
    FhzWndOcx: TFhzWndOcx;
    FhnSBSAtx: TFhnSBSAtx;
    FCallID: integer;
    FHWND, FX: integer;
    FStartPosition: integer;
    function InitFh: boolean;
    procedure SetSBBH(const Value: string);
    procedure StopVideo;
    procedure FhnSBSPlayRecordEvent(Sender: TObject; ErrorCode, hWnd,
      CallID: Integer);
    procedure PlayRecord;
    procedure ControlPlay;
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    property SBBH: string read FSBBH write SetSBBH;
  end;

var
  FrameVideo: TFrameVideo;

implementation

{$R *.dfm}

procedure TFrameVideo.AfterConstruction;
begin
  inherited;
  Timer1.Enabled := false;
  FCallID := 0;
  FRecordPlaying := false;
  self.cxDateEdit1.Date := now;
  FX := 0;
  OnClose := StopVideo;
  btnStop.Enabled := false;
end;

procedure TFrameVideo.BeforeDestruction;
begin
  inherited;

end;

procedure TFrameVideo.StopVideo;
begin
  if btnSave.Caption = '录像' then
    FhnSBSAtx.FhnSBSStopVideo(FCallID)
  else if btnStop.Enabled then
    btnStopClick(nil);
  FhnSBSAtx.FhnSBSLogOut;
end;

procedure TFrameVideo.btnDownloadClick(Sender: TObject);
var
  d: double;
begin
  inherited;
  lgDownload.Visible := true;
  d := cxTrackBar1.Position/cxTrackBar1.Properties.Max;
  if d > OneMinute * 5 then
  begin
    cxTimeEdit1.Time := d - OneMinute * 5;
    cxTimeEdit2.Time := d + OneMinute * 5;
  end
  else begin
    cxTimeEdit1.Time := 0;
    cxTimeEdit2.Time := OneMinute * 10;
  end;
end;

procedure TFrameVideo.btnFastClick(Sender: TObject);
begin
  inherited;
  case FX of
  -8: FX := -4;
  -4: FX := -2;
  -2: FX := 0;
  0: FX := 2;
  2: FX := 4;
  4: FX := 8;
  else
    exit;
  end;
  ControlPlay;
end;

procedure TFrameVideo.btnSlowClick(Sender: TObject);
begin
  inherited;
  case FX of
  -4: FX := -8;
  -2: FX := -4;
  0: FX := -2;
  2: FX := 0;
  4: FX := 2;
  8: FX := 4;
  else
    exit;
  end;
  ControlPlay;
end;

procedure TFrameVideo.ControlPlay;
begin
  if FX > 0 then
    FhnSBSAtx.FHNSBSRecordControlPlay(FCallID, 1, FX, 0, 0)
  else if FX < 0 then
    FhnSBSAtx.FHNSBSRecordControlPlay(FCallID, 2, ABS(FX), 0, 0)
  else begin
    PlayRecord;
  end;
end;

procedure TFrameVideo.btnPlayClick(Sender: TObject);
begin
  inherited;
  PlayRecord;
  btnPlay.Enabled := false;
  btnStop.Enabled := true;
  cxDateEdit1.Enabled := false;
  btnPlay.Tag := 1;
  btnSlow.Tag := 1;
  Timer2.Enabled := true;
end;

procedure TFrameVideo.btnStopClick(Sender: TObject);
begin
  inherited;
  FhnSBSAtx.FhnSBSStopPlayRecord(FCallID);
  FRecordPlaying := false;
  btnStop.Enabled := false;
  btnPlay.Enabled := true;
  cxDateEdit1.Enabled := true;
  Timer2.Enabled := false;
end;

procedure TFrameVideo.cxButton1Click(Sender: TObject);
var
  dS, dE: double;
  timeS, timeE: integer;
begin
  inherited;
  if cxTimeEdit2.Time <= cxTimeEdit1.Time then
  begin
    Application.MessageBox('请输入时间范围', '提示');
    exit;
  end;
  if edtPath.Text = '' then
  begin
    Application.MessageBox('请输入保存文件', '提示');
    exit;
  end;
  dS := StrToDateTime(cxDateEdit1.Text + ' ' + cxTimeEdit1.Text);
  dE := StrToDateTime(cxDateEdit1.Text + ' ' + cxTimeEdit2.Text);
  timeS := trunc(SecondSpan(dS, StrToDateTime('1970/01/01 08:00')));
  timeE := trunc(SecondSpan(dE, StrToDateTime('1970/01/01 08:00')));
  FhnSBSAtx.FhnSBSLoadDownRecordByTime(FSBBH, 1, timeS, timeE, edtPath.Text, 'a.avi', 0);
  lgDownload.Visible := false;
end;

procedure TFrameVideo.cxButton2Click(Sender: TObject);
begin
  inherited;
  if Align = alCustom then
    self.Align := alClient
  else
    Align := alCustom;
end;

procedure TFrameVideo.cxDateEdit1PropertiesChange(Sender: TObject);
begin
  inherited;
  cxTrackBar1.Position := 0;
end;

procedure TFrameVideo.cxTrackBar1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if FRecordPlaying then
  begin
    //Timer2.Enabled := false;
  end;
end;

procedure TFrameVideo.cxTrackBar1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if FRecordPlaying then
  begin
    Timer2.Enabled := false;
    PlayRecord;
    Timer2.Enabled := true;
  end
end;

procedure TFrameVideo.cxTrackBar1PropertiesChange(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrameVideo.PlayRecord;
var
  d: double;
  timeS, timeE: integer;
begin
  FhnSBSAtx.FhnSBSStopPlayRecord(FCallID);
  FRecordPlaying := false;
  FStartPosition := cxTrackBar1.Position;
  d := Trunc(cxDateEdit1.Date);
  timeS := trunc(SecondSpan(d, StrToDateTime('1970/01/01 08:00'))) + FStartPosition;
  timeE := trunc(SecondSpan(d + 1, StrToDateTime('1970/01/01 08:00')));
  FhnSBSAtx.FhnSBSPlayRecordByTime(FHWND, FSBBH, 1, timeS, timeE, 1, 4, 0);
end;

procedure TFrameVideo.cxTrackBar1PropertiesGetPositionHint(Sender: TObject;
  const APosition: Integer; var AHintText: string; var ACanShow,
  AIsHintMultiLine: Boolean);
var
  d: double;
begin
  inherited;
  d := APosition / cxTrackBar1.Properties.Max;
  AHintText := FormatDateTime('hh:mm', d);
end;

procedure TFrameVideo.edtPathPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    edtPath.Text := SaveDialog1.FileName;
  end;
end;

procedure TFrameVideo.btnSaveClick(Sender: TObject);
begin
  inherited;
  if btnSave.Caption = '录像' then
  begin
    dxLayoutGroup5.Visible := true;
    btnSave.Caption := '直播';
    FhnSBSAtx.FhnSBSStopVideo(FCallID);
  end
  else
  begin
    dxLayoutGroup5.Visible := false;
    btnSave.Caption := '录像';
    if btnStop.Enabled then
    begin
      btnStopClick(nil);
    end;
    FCallID := FhnSBSAtx.FhnSBSPlayVideoEx(FHWND, FSBBH, 1, 1, 0);
  end;
end;

procedure TFrameVideo.Timer1Timer(Sender: TObject);
var
  b: boolean;
begin
  inherited;
  b := true;
  case FStep of
    0:
      b := InitFh;
    1:
      FCallID := FhnSBSAtx.FhnSBSPlayVideoEx(FHWND, FSBBH, 1, 1, 0);
  else
    ;
  end;
  inc(FStep);
  btnSave.Enabled := b and (FStep >= 3);
  Timer1.Enabled := b and (FStep < 3);
end;

procedure TFrameVideo.Timer2Timer(Sender: TObject);
var
  seconds: integer;
begin
  inherited;
  if FRecordPlaying then
  begin
    seconds := FhnSBSAtx.FHNSBSGetVodCurrTime(FCallID, '');
    //cxTrackBar1.Properties.OnChange := nil;
    cxtrackbar1.Position := FStartPosition + seconds;
    Application.ProcessMessages;
    //cxTrackBar1.Properties.OnChange := cxTrackBar1PropertiesChange;
  end;
end;

procedure TFrameVideo.SetSBBH(const Value: string);
begin
  FSBBH := Value;
  FStep := 0;
  btnSave.Enabled := false;
  Timer1.Enabled := true;
end;

function TFrameVideo.InitFh: boolean;
var
  r: integer;
begin
  result := false;
  if not Assigned(FhzWndOcx) then
  begin
    try
      FhnSBSAtx := TFhnSBSAtx.Create(self);
      FhnSBSAtx.Parent := self;
      FhnSBSAtx.Visible := false;
      FhnSBSAtx.OnFhnSBSPlayRecordEvent := FhnSBSPlayRecordEvent;
      FhzWndOcx := TFhzWndOcx.Create(self);
      FhzWndOcx.Parent := self;
      FhzWndOcx.Align := TAlign.alClient;
      dxLayoutItem2.Control := FhzWndOcx;
      r := FhnSBSAtx.FhnSBSInitial(gSetup.VideoHost, gSetup.VideoPort);
      Title := gSetup.VideoHost + ' ' + r.ToString;
      r := FhnSBSAtx.FhnSBSLogin(gSetup.VideoUser, gSetup.VideoPwd);
      Title := Title + ' ' + r.ToString;
      FHWND := FhzWndOcx.FhzWndInitial;
      result := true;
    except
      on e: exception do
      begin
        Title := e.Message;
        //TODO: 未安装控件？
      end;
    end;
  end;
end;

procedure TFrameVideo.FhnSBSPlayRecordEvent(Sender: TObject; ErrorCode: Integer; hWnd: Integer; CallID: Integer);
begin
  FCallID := CallID;
  FRecordPlaying := True;
end;

end.
