unit uFrameBanCi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, Data.DB,
  dxSkinXmas2008Blue, cxCheckBox, Vcl.Menus, cxLabel, Vcl.StdCtrls, cxButtons,
  cxDropDownEdit, cxMaskEdit, cxCheckComboBox, cxTextEdit, uEntity, uGlobal,
  uDictionary, cxCheckListBox, uFrameSelectDev, uColumnGenerator;

type
  TFrameBanCi = class(TFrame)
    edtName: TcxTextEdit;
    cboFZR: TcxComboBox;
    btnAdd: TcxButton;
    cxLabel1: TcxLabel;
    labelQWRY: TcxLabel;
    labelLB: TcxLabel;
    edtQWRY: TcxTextEdit;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure edtNamePropertiesChange(Sender: TObject);
    procedure cboFZRPropertiesChange(Sender: TObject);
  private
    FBanCi: TBanCi;
    FFrameZBRY: TFrameSelectDev;
    FDWDM: string;
    function GetBanCi: TBanCi;
    procedure InitZBRY;
    procedure SetBanCi(const Value: TBanCi);
    procedure CreateFrameZBRY;
    procedure btnFrameZBRYSaveClick(Sender: TObject);
    procedure btnFrameZBRYExitClick(Sender: TObject);
    function GetFrameZBRY: TFrameSelectDev;
    procedure SetDWDM(const Value: string);
  public
    procedure AfterConstruction; override;
    property FrameZBRY: TFrameSelectDev read GetFrameZBRY write FFrameZBRY;
    property BanCi: TBanCi Read GetBanCi Write SetBanCi;
    property DWDM: string read FDWDM write SetDWDM;
  end;

implementation

{$R *.dfm}

procedure TFrameBanCi.AfterConstruction;
begin
  inherited;
  FFrameZBRY := nil;
end;

function TframeBanCi.GetBanCi: TBanCi;
begin
  result := FBanCi;
end;

function TFrameBanCi.GetFrameZBRY: TFrameSelectDev;
begin
  if FFrameZBRY = nil then
  begin
    CreateFrameZBRY;
    InitZBRY;
  end;
  Result := FFrameZBRY;
end;

procedure TframeBanCi.InitZBRY;
var
  des: string;
  user: TUser;
begin
  FFrameZBRY.tb.Close;
  FFrameZBRY.tb.Open;
  FFrameZBRY.tb.DisableControls;
  for user in TLZDictionary.gDicUser.Values do
  begin
    //if user.DWDM = dwdm then
    begin
      FFrameZBRY.tb.Append;
      FFrameZBRY.tb.FieldByName('bj').AsBoolean := false;
      FFrameZBRY.tb.FieldByName('YHBH').AsString := user.yhbh;
      FFrameZBRY.tb.FieldByName('YHXM').AsString := user.yhxm;
      if user.SJHM <> '' then
        FFrameZBRY.tb.FieldByName('SJHM').AsString := user.SJHM
      else
        FFrameZBRY.tb.FieldByName('SJHM').AsString := '-';

      FFrameZBRY.tb.Post;
    end;
  end;
  FFrameZBRY.tb.First;
  FFrameZBRY.tb.EnableControls;
end;

procedure TframeBanCi.CreateFrameZBRY;
begin
  FFrameZBRY := TFrameSelectDev.Create(self.Parent.Parent.Parent);
  FFrameZBRY.Name := 'FrameZBRY' + FormatDateTime('sszzz', now);
  FFrameZBRY.Parent := self.Parent.Parent.Parent;
  FFrameZBRY.Top := 60;
  FFrameZBRY.left := (self.Parent.Parent.Parent.Width - FFrameZBRY.Width) div 2;
  FFrameZBRY.tvDevColumn2.Caption := '±àºÅ';
  FFrameZBRY.tvDevColumn2.DataBinding.FieldName := 'YHBH';
  FFrameZBRY.tvDevColumn3.Caption := 'ÐÕÃû';
  FFrameZBRY.tvDevColumn3.DataBinding.FieldName := 'YHXM';
  FFrameZBRY.tvDevColumn4.Caption := 'ÊÖ»ú';
  FFrameZBRY.tvDevColumn4.DataBinding.FieldName := 'SJHM';
  FFrameZBRY.tb.Close;
  FFrameZBRY.tb.FieldDefs.Clear;
  FFrameZBRY.tb.IndexDefs.Clear;
  FFrameZBRY.tb.FieldDefs.Add('bj', ftBoolean);
  FFrameZBRY.tb.FieldDefs.Add('YHBH', ftString, 100);
  FFrameZBRY.tb.FieldDefs.Add('YHXM', ftString, 100);
  FFrameZBRY.tb.FieldDefs.Add('SJHM', ftString, 100);
  FFrameZBRY.btnSave.OnClick := btnFrameZBRYSaveClick;
  FFrameZBRY.btnExit.OnClick := btnFrameZBRYExitClick;
end;

procedure TFrameBanCi.btnFrameZBRYSaveClick(Sender: TObject);
begin
  if not FrameZBRY.tb.Active then
    exit;
  FBanCi.YHBH := '';
  FBanCi.YHXM := '';
  FBanCi.SJHM := '';
  cboFZR.Properties.Items.Clear;
  FrameZBRY.tb.DisableControls;
  FrameZBRY.tb.First;
  while not FrameZBRY.tb.eof do
  begin
    if FrameZBRY.tb.FieldByName('bj').AsBoolean then
    begin
      FBanCi.YHBH := FBanCi.YHBH + ',' + FrameZBRY.tb.FieldByName('YHBH').AsString;
      FBanCi.YHXM := FBanCi.YHXM + ',' + FrameZBRY.tb.FieldByName('YHXM').AsString;
      FBanCi.SJHM := FBanCi.SJHM + ',' + FrameZBRY.tb.FieldByName('SJHM').AsString;
      cboFZR.Properties.Items.Add(FrameZBRY.tb.FieldByName('YHXM').AsString);
    end;
    FrameZBRY.tb.Next;
  end;
  FrameZBRY.tb.EnableControls;
  if FBanCi.YHBH <> '' then
  begin
    FBanCi.YHBH := FBanCi.YHBH.Substring(1);
    FBanCi.YHXM := FBanCi.YHXM.Substring(1);
    FBanCi.SJHM := FBanCi.SJHM.Substring(1);
  end;
  edtQWRY.Text := FBanCi.YHXM;
  if cboFZR.Properties.Items.Count = 1 then
    cboFZR.ItemIndex := 0;
  btnFrameZBRYExitClick(nil);
end;

procedure TFrameBanCi.cboFZRPropertiesChange(Sender: TObject);
var
  arrYHXM, arrSJHM: TArray<string>;
  i: Integer;
begin
  FBanCi.FZR := cboFZR.Text;
  arrYHXM := FBanCi.YHXM.Split([',']);
  arrSJHM := FBanCi.SJHM.Split([',']);
  for i := 0 to Length(arrYHXM) - 1 do
  begin
    if arrYHXM[i] = FBanCi.FZR then
      FBanCi.FZRSJ := arrSJHM[i];
  end;
end;

procedure TFrameBanCi.btnFrameZBRYExitClick(Sender: TObject);
begin
  FrameZBRY.Visible := False;
  //dxLayoutControl1Group_Root.Visible := True;
end;

procedure TFrameBanCi.cxButton1Click(Sender: TObject);
begin
  FrameZBRY.tb.DisableControls;
  FrameZBRY.tb.First;
  while not FrameZBRY.tb.Eof do
  begin
    if FrameZBRY.tb.FieldByName('bj').AsBoolean then
    begin
      FrameZBRY.tb.Edit;
      FrameZBRY.tb.FieldByName('bj').AsBoolean := false;
      FrameZBRY.tb.Post;
    end;
    FrameZBRY.tb.Next;
  end;
  FrameZBRY.tb.First;
  FrameZBRY.tb.EnableControls;
  FrameZBRY.Show;
end;

procedure TFrameBanCi.edtNamePropertiesChange(Sender: TObject);
begin
  FBanCi.BCName := edtName.Text;
end;

procedure TframeBanCi.SetBanCi(const Value: TBanCi);
begin

end;

procedure TFrameBanCi.SetDWDM(const Value: string);
begin
  FDWDM := Value;
end;

end.
