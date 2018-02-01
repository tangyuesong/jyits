unit dxFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls,
  ExtCtrls, ImgList, dxPSCore, dxPgsDlg, cxLookAndFeels, cxLookAndFeelPainters,
  dxOffice11, cxLabel, cxGraphics, cxControls, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, uGlobal, dxSkinsdxBarPainter, dxBar, cxClasses,
  dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, udm, uFrameWait;

type

  TdxFrame = class(TFrame)
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    procedure FrameResize(Sender: TObject);
  private
    FFrameWait: TFrameWait;
    FFrameID: String;
    FCaption: string;
    FChangingVisibility: Boolean;
    FReportLink: TBasedxReportLink;
    function GetActive: Boolean;
    function GetCaption: string;
    function GetComponentPrinter: TdxComponentPrinter;
    function GetHasHint: Boolean;
    function GetPrintStyleManager: TdxPrintStyleManager;
    procedure UpdateDescriptionHeight;

  protected
    // IcxLookAndFeelNotificationListener
    function GetObject: TObject;
    procedure MasterLookAndFeelChanged(Sender: TcxLookAndFeel;
      AChangedValues: TcxLookAndFeelValues);
    procedure MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);

    procedure AddOperationsToPopupMenu; virtual;
    function GetDescription: string; virtual;
    function GetHint: string; virtual;
    function GetInspectedObject: TPersistent; virtual;
    function GetInitialShowInspector: Boolean; virtual;
    function GetPrintableComponent: TComponent; virtual;
    function NeedInspector: Boolean; virtual;
    procedure LookAndFeelChanged; virtual;

    procedure FocusFirstControl;

    procedure CheckDescription;
    procedure SetCaption(Value: string); virtual;

    function CreateReportLink: TBasedxReportLink;
    function GetReportLink: TBasedxReportLink; virtual;
    function GetReportLinkClass: TdxReportLinkClass;
    procedure PrepareLink(AReportLink: TBasedxReportLink); virtual;

    property HasHint: Boolean read GetHasHint;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure AfterShow; virtual;
    function CanDeactivate: Boolean; virtual;
    // procedure DoExport(AExportType: TSupportedExportType; const AFileName: string; AHandler: TObject; ADataOnly: Boolean); virtual;
    procedure ChangeVisibility(AShow: Boolean); virtual;
    function GetReportLinkName: string; virtual;

    function ExportFileName: string; virtual;
    function IsSupportExport: Boolean; virtual;

    procedure ShowFrameWait;
    procedure FreeFrameWait;

    property Active: Boolean read GetActive;
    property Caption: string read GetCaption write SetCaption;
    property ComponentPrinter: TdxComponentPrinter read GetComponentPrinter;
    property InspectedObject: TPersistent read GetInspectedObject;
    property PrintableComponent: TComponent read GetPrintableComponent;
    property PrintStyleManager: TdxPrintStyleManager read GetPrintStyleManager;
    property ReportLink: TBasedxReportLink read GetReportLink;
    property FrameID: String read FFrameID write FFrameID;
  end;

implementation

{$R *.DFM}

uses
  dxBarExtItems, Types;

{ TdxFrame }

constructor TdxFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Visible := False;
  AddOperationsToPopupMenu;
  RootLookAndFeel.AddChangeListener(self);
  LookAndFeelChanged;
end;

destructor TdxFrame.Destroy;
begin
  RootLookAndFeel.RemoveChangeListener(self);
  inherited;
end;
{
  procedure TdxFrame.DoExport(AExportType: TSupportedExportType;
  const AFileName: string; AHandler: TObject; ADataOnly: Boolean);
  begin

  end; }

function TdxFrame.GetActive: Boolean;
begin
  Result := Visible;
end;

function TdxFrame.GetCaption: string;
begin
  Result := FCaption;
end;

function TdxFrame.GetComponentPrinter: TdxComponentPrinter;
var
  I: Integer;
  Component: TComponent;
begin
  with Application.MainForm do
    for I := 0 to ComponentCount - 1 do
    begin
      Component := Components[I];
      if Component is TdxComponentPrinter then
      begin
        Result := TdxComponentPrinter(Component);
        Exit;
      end;
    end;
  Result := nil;
end;

function TdxFrame.GetHasHint: Boolean;
begin
  Result := GetHint <> '';
end;

function TdxFrame.GetPrintStyleManager: TdxPrintStyleManager;
var
  I: Integer;
  Component: TComponent;
begin
  with Application.MainForm do
    for I := 0 to ComponentCount - 1 do
    begin
      Component := Components[I];
      if Component is TdxPrintStyleManager then
      begin
        Result := TdxPrintStyleManager(Component);
        Exit;
      end;
    end;
  Result := nil;
end;

procedure TdxFrame.SetCaption(Value: string);
begin
  FCaption := ' ' + Value;
end;

procedure TdxFrame.ShowFrameWait;
begin
  if not Assigned(FFrameWait) then
  begin
    FFrameWait := TFrameWait.Create(self);
    FFrameWait.Parent := self;
  end;
  FFrameWait.Top := (self.Height - FFrameWait.Height) div 2;
  FFrameWait.Left := (self.Width - FFrameWait.Width) div 2;
  FFrameWait.Visible := True;
  Application.ProcessMessages;
end;

function TdxFrame.GetReportLink: TBasedxReportLink;
begin
  if FReportLink = nil then
    FReportLink := CreateReportLink;
  Result := FReportLink;

  if Result <> nil then
    with Result do
    begin
      ReportTitle.Text := Caption;
      RestoreFromOriginal;
      Component := PrintableComponent;
    end;
end;

procedure TdxFrame.UpdateDescriptionHeight;
var
  ARect: TRect;
begin
  { if not pnlDescription.Visible or (lblDescription.Caption = '') or not lblDescription.HandleAllocated then
    Exit;
    ARect := lblDescription.BoundsRect;
    InflateRect(ARect, -3, 0);
    lblDescription.Canvas.Font.Assign(lblDescription.Style.Font);
    DrawText(lblDescription.Canvas.Handle, PChar(lblDescription.Caption),
    Length(lblDescription.Caption), ARect, DT_CALCRECT or DT_WORDBREAK);
    InflateRect(ARect, 0, 2);
    pnlDescription.Height := ARect.Bottom - ARect.Top + pnlDescription.Height -
    lblDescription.Height; }
end;

procedure TdxFrame.CheckDescription;
begin
  if GetDescription <> '' then
  begin
    // lblDescription.Caption := GetDescription;
    // pnlDescription.Visible := True;
    UpdateDescriptionHeight;
  end;
end;

function TdxFrame.GetObject: TObject;
begin
  Result := self;
end;

procedure TdxFrame.MasterLookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  LookAndFeelChanged;
end;

procedure TdxFrame.MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);
begin
  // do nothing
end;

procedure TdxFrame.AddOperationsToPopupMenu;
begin
end;

function TdxFrame.GetDescription: string;
begin
  Result := '';
end;

function TdxFrame.GetHint: string;
begin
end;

function TdxFrame.GetInspectedObject: TPersistent;
begin
  Result := nil;
end;

function TdxFrame.GetInitialShowInspector: Boolean;
begin
  Result := False;
end;

function TdxFrame.GetPrintableComponent: TComponent;
begin
  Result := nil;
end;

function TdxFrame.NeedInspector: Boolean;
begin
  Result := GetInspectedObject <> nil;
end;

procedure TdxFrame.LookAndFeelChanged;
begin
  Color := Application.MainForm.Color;
  if (RootLookAndFeel.ActiveStyle in [lfsNative, lfsOffice11]) then
  begin
    // pnlHintInternal.Color := dxOffice11DockColor1;
  end
  else
  begin
    // pnlHintInternal.Color := clInfoBk;
  end;
end;

procedure TdxFrame.FocusFirstControl;
var
  AControl: TWinControl;
begin
  AControl := FindNextControl(nil, True, True, False);
  if AControl <> nil then
    AControl.SetFocus;
end;

procedure TdxFrame.AfterShow;
begin
  // do nothing
end;

function TdxFrame.CanDeactivate: Boolean;
begin
  Result := True;
end;

procedure TdxFrame.ChangeVisibility(AShow: Boolean);
begin
  try
    FChangingVisibility := True;
    Visible := AShow;
    if AShow then
    begin
      CheckDescription;
      FocusFirstControl;
    end;
  finally
    FChangingVisibility := False;
  end;
end;

function TdxFrame.GetReportLinkName: string;
begin
  Result := '';
end;

function TdxFrame.CreateReportLink: TBasedxReportLink;
begin
  Result := ComponentPrinter.AddEmptyLink(GetReportLinkClass);
  if Result <> nil then
    PrepareLink(Result);
end;

function TdxFrame.GetReportLinkClass: TdxReportLinkClass;
begin
  if PrintableComponent <> nil then
    Result := dxPSCore.dxPSLinkClassByCompClass
      (TComponentClass(PrintableComponent.ClassType))
  else
    Result := nil;
end;

procedure TdxFrame.PrepareLink(AReportLink: TBasedxReportLink);
begin
  AReportLink.StyleManager := self.PrintStyleManager;
  AReportLink.Active := False;
end;

function TdxFrame.IsSupportExport: Boolean;
begin
  Result := False;
end;

function TdxFrame.ExportFileName: string;
begin
  Result := 'dxExport';
end;

procedure TdxFrame.FrameResize(Sender: TObject);
begin
  UpdateDescriptionHeight;
end;

procedure TdxFrame.FreeFrameWait;
begin
  if Assigned(FFrameWait) then
  begin
    FFrameWait.Visible := False;
  end;
  Application.ProcessMessages;
end;

end.
