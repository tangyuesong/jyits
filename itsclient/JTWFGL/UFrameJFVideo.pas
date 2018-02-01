unit UFrameJFVideo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters, dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxEdit, hyieutils, iexBitmaps, hyiedefs, iesettings, iexRulers, System.Contnrs, imageenview, ieview, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, USetup, uEntity, uCommon, uGlobal, Vcl.ExtCtrls;

type
  TFrameJFVideo = class(TdxDialogBaseFrame)
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    cbbidx1: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    edtinput1: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbWBL1: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    cbbidx2: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    edtinput2: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cbbWBL2: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    imgshow1: TImageEnView;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    imgshow2: TImageEnView;
    tmr1: TTimer;
    procedure btnExitClick(Sender: TObject);
    procedure cbbWBL2PropertiesChange(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure cbbWBL1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure ShowVideoFormats;
    function GetGPY: TGPY;
    procedure SetGPY(const Value: TGPY);
  public
    { Public declarations }
    procedure AfterConstruction; override;
    property GPYInfo: TGPY read GetGPY write SetGPY;
  end;

var
  FrameJFVideo: TFrameJFVideo;

implementation

{$R *.dfm}
procedure TFrameJFVideo.AfterConstruction;
begin
  inherited;
  gGpySetup := TLZsetup.GpySetup;
  ShowVideoFormats;
  GPYInfo := gGpySetup;
end;

procedure TFrameJFVideo.btnExitClick(Sender: TObject);
begin
  inherited;
  if imgshow1.IO.DShowParams.Connected then
    imgshow1.IO.DShowParams.Disconnect;
  if imgshow2.IO.DShowParams.Connected then
    imgshow2.IO.DShowParams.Disconnect;
end;

procedure TFrameJFVideo.cbbWBL1PropertiesChange(Sender: TObject);
begin
  inherited;

    if imgshow1.IO.DShowParams.Connected then
      imgshow1.IO.DShowParams.Disconnect;
    Tcommon.showVideo(GPYInfo.input1, GPYInfo.idx1.ToInteger, GPYInfo.Width1.ToInteger, GPYInfo.Height1.ToInteger, imgshow1);

end;

procedure TFrameJFVideo.cbbWBL2PropertiesChange(Sender: TObject);
begin
  inherited;
  try
    if imgshow2.IO.DShowParams.Connected then
      imgshow2.IO.DShowParams.Disconnect;
    Tcommon.showVideo(GPYInfo.input2, GPYInfo.idx2.ToInteger, GPYInfo.Width2.ToInteger, GPYInfo.Height2.ToInteger, imgshow2);
  except

  end;
end;

function TFrameJFVideo.GetGPY: TGPY;
var
  arr: TArray<string>;
  WBL: string;
begin
  WBL := cbbWBL1.Text;
  arr := WBL.Split(['x']);
  Result.input1 := edtinput1.Text;
  Result.idx1 := cbbidx1.ItemIndex.ToString;
  Result.Width1 := arr[0];
  Result.Height1 :=arr[1];

  WBL := cbbWBL2.Text;
  arr := WBL.Split(['x']);
  Result.input2 := edtinput2.Text;
  Result.idx2 := cbbidx2.ItemIndex.ToString;
  Result.Width2 := arr[0];
  Result.Height2 := arr[1];
end;

procedure TFrameJFVideo.SetGPY(const Value: TGPY);
begin
  edtinput1.Text := Value.input1;
  cbbidx1.ItemIndex := Value.idx1.ToInteger;
  cbbidx1.Properties.Items.Assign(imgshow1.IO.DShowParams.VideoInputs);
  cbbidx1.ItemIndex := 0;
  cbbWBL1.Text := IntToStr(Value.Width1.ToInteger()) + 'x' + inttostr(value.Height1.ToInteger);

  edtinput2.Text := Value.input2;
  cbbidx2.ItemIndex := Value.idx2.ToInteger;
  cbbidx2.Properties.Items.Assign(imgshow2.IO.DShowParams.VideoInputs);
  cbbidx2.ItemIndex := 0;
  cbbWBL2.Text := IntToStr(Value.Width2.ToInteger()) + 'x' + inttostr(value.Height2.ToInteger());

end;

procedure TFrameJFVideo.ShowVideoFormats;
var
  i: integer;
  s: string;
begin
  with imgshow1.IO.DShowParams do
  begin
    SetVideoInput(gGpySetup.idx1.ToInteger, StrToIntDef(gGpySetup.input1, 0));
    Connect;

    cbbWBL1.Clear;
    for i := 0 to VideoFormatsCount - 1 do
    begin
      with VideoFormats[i] do
        s := inttostr(MaxWidth) + 'x' + inttostr(MaxHeight);
      cbbWBL1.Properties.Items.Add(s);
    end;
    Disconnect;
  end;

  with imgshow2.IO.DShowParams do
  begin
    SetVideoInput(gGpySetup.idx2.ToInteger, StrToIntDef(gGpySetup.input2, 0));
    Connect;
    cbbWBL2.Clear;
    for i := 0 to VideoFormatsCount - 1 do
    begin
      with VideoFormats[i] do
        s := inttostr(MaxWidth) + 'x' + inttostr(MaxHeight);
      cbbWBL2.Properties.Items.Add(s);
    end;
    Disconnect;
  end;

end;

procedure TFrameJFVideo.tmr1Timer(Sender: TObject);
begin
  inherited;
  try
    if imgshow1.IO.DShowParams.Connected then
      imgshow1.IO.DShowParams.Disconnect;
    Tcommon.showVideo(GPYInfo.input1, GPYInfo.idx1.ToInteger, GPYInfo.Width1.ToInteger, GPYInfo.Height1.ToInteger, imgshow1);
  except

  end;
end;

end.


