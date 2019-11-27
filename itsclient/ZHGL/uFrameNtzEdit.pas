unit uFrameNtzEdit;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxListBox, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxTextEdit, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl, Vcl.ExtCtrls,
  uDictionary, uEntity, cxLabel;

type
  TNtzInfo = Record
    systemid: String;
    hphm: String;
    hpzl: string;
    kssj: String;
    jssj: String;
    bz: String;
    sbbh: String;
  End;

  TOK = procedure(ANtzInfo: TNtzInfo) of object;

  TFrameNtzEdit = class(TdxDialogBaseFrame)
    dxLayoutGroup5: TdxLayoutGroup;
    edtHphm: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    cbbHpzl: TcxComboBox;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup6: TdxLayoutGroup;
    cxDateEdit1: TcxDateEdit;
    dxLayoutItem5: TdxLayoutItem;
    cxDateEdit2: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtBz: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    lsAllDev: TcxListBox;
    dxLayoutItem8: TdxLayoutItem;
    lsSelectedDev: TcxListBox;
    dxLayoutItem9: TdxLayoutItem;
    Panel1: TPanel;
    dxLayoutItem14: TdxLayoutItem;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    procedure btnSaveClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure lsAllDevDblClick(Sender: TObject);
  private
    FOK: TOK;
  public
    FSystemID: String;
    procedure AfterConstruction; override;
    property OnOK: TOK read FOK write FOK;
  end;

var
  FrameNtzEdit: TFrameNtzEdit;

implementation

{$R *.dfm}
{ TFrameNtzEdit }

procedure TFrameNtzEdit.AfterConstruction;
var
  dev: TDevice;
  ts: TStringList;
begin
  inherited;
  cxDateEdit1.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now));
  cxDateEdit2.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now + 30));
  TLZDictionary.BindCombobox(cbbHpzl, TLZDictionary.gdicmain['HPZL'], true);
  cbbHpzl.ItemIndex := 0;

  ts := TStringList.Create;
  ts.Sorted := true;
  for dev in TLZDictionary.gDicDev[2].Values do
  begin
    if dev.DCXXZB then
      ts.Add(dev.SBBH + ':' + dev.SBDDMC);
  end;
  lsAllDev.Items.AddStrings(ts);
  ts.Free;
end;

procedure TFrameNtzEdit.btnSaveClick(Sender: TObject);
var
  ntz: TNtzInfo;
  s: String;
begin
  inherited;
  if Assigned(FOK) then
  begin
    ntz.systemid := FSystemID;
    ntz.hphm := edtHphm.Text;
    ntz.hpzl := cbbHpzl.Text;
    if pos(':', ntz.hpzl) > 0 then
      ntz.hpzl := copy(ntz.hpzl, 1, pos(':', ntz.hpzl) - 1);
    ntz.kssj := FormatDateTime('yyyy-mm-dd', cxDateEdit1.Date);
    ntz.jssj := FormatDateTime('yyyy-mm-dd', cxDateEdit2.Date);
    ntz.bz := edtBz.Text;
    ntz.sbbh := '';
    for s in lsSelectedDev.Items do
    begin
      ntz.sbbh := ntz.sbbh + s.Substring(0, s.IndexOf(':')) + ',';
    end;
    if ntz.sbbh <> '' then
      ntz.sbbh := copy(ntz.sbbh, 1, length(ntz.sbbh) - 1);
    OnOK(ntz);
  end;
end;

procedure TFrameNtzEdit.cxButton1Click(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i := 0 to lsAllDev.Items.Count - 1 do
  begin
    if lsAllDev.Selected[i] then
    begin
      if lsSelectedDev.Items.IndexOf(lsAllDev.Items[i]) < 0 then
        lsSelectedDev.Items.Add(lsAllDev.Items[i]);
    end;
  end;
end;

procedure TFrameNtzEdit.cxButton2Click(Sender: TObject);
begin
  inherited;
  lsSelectedDev.Items.Clear;
  lsSelectedDev.Items.AddStrings(lsAllDev.Items);
end;

procedure TFrameNtzEdit.cxButton3Click(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i := lsSelectedDev.Items.Count - 1 downto 0 do
  begin
    if lsSelectedDev.Selected[i] then
      lsSelectedDev.Items.Delete(i);
  end;
end;

procedure TFrameNtzEdit.cxButton4Click(Sender: TObject);
begin
  inherited;
  lsSelectedDev.Items.Clear;
end;

procedure TFrameNtzEdit.lsAllDevDblClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  for i := 0 to lsAllDev.Items.Count - 1 do
  begin
    if lsAllDev.Selected[i] then
    begin
      if lsSelectedDev.Items.IndexOf(lsAllDev.Items[i]) < 0 then
        lsSelectedDev.Items.Add(lsAllDev.Items[i]);
    end;
  end;
end;

end.
