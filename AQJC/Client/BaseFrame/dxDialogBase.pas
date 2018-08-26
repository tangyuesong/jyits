unit dxDialogBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, Vcl.StdCtrls, cxButtons, cxClasses, dxLayoutControl,uCommon,cxTextEdit,
  dxSkinsdxNavBarPainter, dxSkinsdxNavBarAccordionViewPainter, dxNavBarCollns,
  dxNavBarBase, dxNavBar, cxDropDownEdit,cxMemo;
type
  TClose = procedure of Object;

  TdxDialogBaseFrame = class(TdxFrame)
    btnSave: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    btnExit: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    procedure btnExitClick(Sender: TObject);
  private
    FClose: TClose;
    FEditId: TEditStatus;
    Fid: string;
    function GetTitle: string;
    procedure SetTitle(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    procedure EnableControls(parentControl: TWinControl; enabled: boolean);
    procedure SetEditReadOnly(parentControl: TWinControl; value: Boolean);
    procedure ClearControls(parentControl: TWinControl);
    property OnClose: TClose read FClose write FClose;
    property EditID: TEditStatus read FEditId write FEditId;
    property id: string read Fid write Fid;
    property Title: string read GetTitle write SetTitle;
  end;

var
  dxDialogBaseFrame: TdxDialogBaseFrame;

implementation

{$R *.dfm}
procedure TdxDialogBaseFrame.ClearControls(parentControl: TWinControl);
var
  item: TControl;
  i: integer;
begin
  for i := 0 to parentControl.ControlCount - 1 do
  begin
    item := parentControl.Controls[i];
    if item is TCustomEdit then
      (item as TCustomEdit).Text:=''
    else if item is TcxComboBox then
    begin
      (item as TcxComboBox).Text:='';
      (item as TcxComboBox).ItemIndex := -1;
    end
    else if item is TcxTextEdit then
    begin
      (item as TcxTextEdit).Text:='';
    end
    else if item is TcxMemo then
    begin
      (item as TcxMemo).Text:='';
    end
    else if item is TWinControl then
      ClearControls(item as TWinControl);
  end;
end;

procedure TdxDialogBaseFrame.SetEditReadOnly(parentControl: TWinControl;value:Boolean);
var
  item: TControl;
  i: integer;
begin
  for i := 0 to parentControl.ControlCount - 1 do
  begin
    item := parentControl.Controls[i];
    if item is TcxTextEdit then
      (item as TcxTextEdit).Properties.ReadOnly:=value
    else if item is TcxComboBox then
      (item as TcxComboBox).Properties.ReadOnly:=value
    else if item is TWinControl then
      SetEditReadOnly(item as TWinControl, value);
  end;
end;

procedure TdxDialogBaseFrame.EnableControls(parentControl: TWinControl; enabled: boolean);
var
  item: TControl;
  i: integer;
begin
  for i := 0 to parentControl.ControlCount - 1 do
  begin
    item := parentControl.Controls[i];
    if item is TCustomEdit then
      (item as TCustomEdit).Enabled := enabled
    else if item is TCustomListControl then
    begin
      (item as TCustomListControl).Enabled := enabled;
    end
    else if item is TWinControl then
      EnableControls(item as TWinControl, enabled);
  end;
end;

function TdxDialogBaseFrame.GetTitle: string;
begin
  result := self.dxLayoutGroup1.CaptionOptions.Text;
end;

procedure TdxDialogBaseFrame.SetTitle(const Value: string);
begin
  self.dxLayoutGroup1.CaptionOptions.Text := Value;
end;

procedure TdxDialogBaseFrame.btnExitClick(Sender: TObject);
begin
  inherited;
  Hide;
  if Assigned(OnClose) then
  begin
    OnClose;
  end;
end;

end.
