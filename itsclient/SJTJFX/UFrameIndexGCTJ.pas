unit UFrameIndexGCTJ;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, Data.DB,
  cxDBData, dxLayoutContainer, dxLayoutControlAdapters, Vcl.StdCtrls,
  cxRadioGroup, cxGridLevel, cxGridChartView, cxGridDBChartView, cxClasses,
  cxGridCustomView, cxGrid, dxLayoutControl, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uRequestItf, uCommon, uJsonUtils, uGlobal, cxEdit,
  cxPivotGridChartConnection, cxCustomPivotGrid, cxDBPivotGrid, Vcl.ExtCtrls;

type
  TFrameIndexGCSJ = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    cxGrid2: TcxGrid;
    ChartView: TcxGridDBChartView;
    ChartViewSeries1: TcxGridDBChartSeries;
    ChartViewSeries2: TcxGridDBChartSeries;
    cxGridLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridLevel2: TcxGridLevel;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    rb1: TcxRadioButton;
    dxLayoutItem4: TdxLayoutItem;
    rb2: TcxRadioButton;
    dxLayoutItem5: TdxLayoutItem;
    rb3: TcxRadioButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable2: TFDMemTable;
    cxDBPivotGrid1: TcxDBPivotGrid;
    cxDBPivotGrid1Field1: TcxDBPivotGridField;
    cxDBPivotGrid1Field2: TcxDBPivotGridField;
    cxDBPivotGrid1Field3: TcxDBPivotGridField;
    cxPivotGridChartConnection1: TcxPivotGridChartConnection;
    cxGrid1ChartView1: TcxGridChartView;
    dxLayoutItem7: TdxLayoutItem;
    Timer1: TTimer;
    procedure rb1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameIndexGCSJ: TFrameIndexGCSJ;

implementation

{$R *.dfm}

procedure TFrameIndexGCSJ.AfterConstruction;
begin
  inherited;

end;

procedure TFrameIndexGCSJ.rb1Click(Sender: TObject);
var
  d1, d2, Param, s: string;
  series: TcxGridDBChartSeries;
begin
  inherited;
  if rb1.Checked then
  begin
    d1 := FormatDateTime('yyyy-mm-dd', now);
    d2 := FormatDateTime('yyyy-mm-dd', now);
  end;
  if rb2.Checked then
  begin
    d1 := FormatDateTime('yyyy-mm-dd', now - 1);
    d2 := FormatDateTime('yyyy-mm-dd', now - 1);
  end;
  if rb3.Checked then
  begin
    d1 := FormatDateTime('yyyy-mm-dd', now - 2);
    d2 := FormatDateTime('yyyy-mm-dd', now - 2);
  end;
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('GCSJ', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('MC', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('GCCS', ftInteger, 0, false);
  FDMemTable2.FieldDefs.Clear;
  FDMemTable2.FieldDefs.Add('DWMC', ftString, 50, false);
  FDMemTable2.FieldDefs.Add('在线设备', ftInteger, 0, false);
  FDMemTable2.FieldDefs.Add('离线设备', ftInteger, 0, false);
  Param := 'cjjg=' + Tcommon.GetXZQH(gUser.DWDM) + '&kssj=' + d1 + '&jssj=' + d2
    + '&sjlx=H' + '&tjlx=3' + '&kdbh=';
  ShowFrameWait;
  s := tRequestItf.DbQuery('GetGCTJ', Param);
  if s = '' then
  begin
    FreeFrameWait;
    exit;
  end;

  uJsonUtils.TJSONUtils.JSONToDataSet(s, FDMemTable1, '', false);
  s := tRequestItf.DbQuery('GetDeviceOnOffTotal', '');
  if s = '' then
  begin
    FreeFrameWait;
    exit;
  end;
  uJsonUtils.TJSONUtils.JSONToDataSet(s, FDMemTable2, '', false);
  FreeFrameWait;
end;

procedure TFrameIndexGCSJ.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  rb1Click(nil);
end;

end.
