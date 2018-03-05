unit UFrameTJZDWFXW;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrameStat, cxGraphics,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, cxStyles, cxCustomData, Data.DB, cxDBData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, StrUtils, uGlobal,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridChartView, cxGridDBChartView,
  cxGrid, cxDropDownEdit, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxRadioGroup, dxLayoutControl, System.Actions, Vcl.ActnList,
  DateUtils,
  uRequestItf, uJsonUtils, uCommon, uFrameZDTotal;

type
  TFrameTJZDWFXW = class(TFrameStat)
    ChartViewSeries13: TcxGridDBChartSeries;
    CBBTjlx: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    procedure BtnSearchClick(Sender: TObject);
    procedure GridViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    fZdTotal: TFrameZDTotal;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTJZDWFXW: TFrameTJZDWFXW;

implementation

{$R *.dfm}

procedure TFrameTJZDWFXW.AfterConstruction;
begin
  inherited;

  RDMonth.Checked := True;
  CBBTjlx.ItemIndex := 0;
end;

procedure TFrameTJZDWFXW.BtnSearchClick(Sender: TObject);
var
  cols: String;
  i: Integer;
begin
  if CBBTjlx.Text = '∑«œ÷≥°' then
    Jkid := 'getwfxwtj_s'
  else
    Jkid := 'getwfxwtj_v';
  CreateCol := True;
  Param := '&zddm=' + LeftStr(gUser.DWDM, 4);
  Param := Param + '&DWJB=4';
  inherited;
  cols := '';
  for i := 0 to FDMemTable1.FieldDefs.Count - 1 do
    cols := cols + FDMemTable1.FieldDefs[i].Name + ',';
  GridColumns := copy(cols, 1, Length(cols) - 1);
  GridView.OptionsView.ColumnAutoWidth := False;
end;

procedure TFrameTJZDWFXW.GridViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  params: String;
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  if FDMemTable1.FieldDefs.IndexOf('XZQH') < 0 then
    exit;

  if not Assigned(fZdTotal) then
  begin
    fZdTotal := TFrameZDTotal.Create(self);
    fZdTotal.Parent := self;
    fZdTotal.Align := TAlign.alClient;
  end;
  params := Param.Replace('DWJB=4', 'DWJB=5');
  params := params + '&XZQH=' + FDMemTable1.FieldByName('XZQH').AsString;
  fZdTotal.ColumnStrs := GridColumns;
  fZdTotal.Show;
  Application.ProcessMessages;
  sleep(50);
  fZdTotal.Query(Jkid, params);
  fZdTotal.GridView.OptionsView.ColumnAutoWidth := False;
end;

end.
