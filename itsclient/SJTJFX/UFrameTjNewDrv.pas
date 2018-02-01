unit UFrameTjNewDrv;

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
  cxFilter, cxData, cxDataStorage, cxNavigator, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxLayoutContainer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridChartView, cxGridDBChartView,
  cxGrid, cxDropDownEdit, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxRadioGroup, dxLayoutControl, uRequestItf, uCommon, uJsonUtils,
  System.Actions, Vcl.ActnList;

type
  TFrameTJNewDrv = class(TFrameStat)
    ChartViewSeries1: TcxGridDBChartSeries;
    ChartViewSeries2: TcxGridDBChartSeries;
    ChartViewSeries3: TcxGridDBChartSeries;
    procedure BtnSearchClick(Sender: TObject);
  private
    { Private declarations }
    Floginfo: string;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTJNewDrv: TFrameTJNewDrv;

implementation

{$R *.dfm}

procedure TFrameTJNewDrv.AfterConstruction;
begin
  inherited;
  GridColumns := 'ZJCX,当月,上月,新增,上年同月,环比增长(%),同比增长(%)';
  RDMonth.Checked := True;
  RDDate.Checked := false;
end;

procedure TFrameTJNewDrv.BtnSearchClick(Sender: TObject);
var
  s: string;
  y, m, period: string;
begin

  if (RDYear.Checked) and (CbbYear.Text = '') then
  begin
    Application.MessageBox('请选择统计年份', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  if (RDMonth.Checked) and ((CbbYear.Text = '') or (CbbMonth.Text = '')) then
  begin
    Application.MessageBox('请选择统计年份月份', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  y := Copy(CbbYear.Text, 1, 4);
  m := Copy(CbbMonth.Text, 1, 2);

  if RDYear.Checked then
  begin
    sDate := y;
    period := 'y';
    Jkid := 'getDrvSL2';
    GridColumns := 'ZJCX,当年,上年,新增,环比增长(%)';
    ChartViewSeries3.Visible := false;
    ChartViewSeries1.DataBinding.FieldName := '当年';
    ChartViewSeries1.DisplayText := '当年';
    ChartViewSeries2.DataBinding.FieldName := '上年';
    ChartViewSeries2.DisplayText := '上年';
  end;
  if RDMonth.Checked then
  begin
    sDate := y + '-' + m;
    period := 'm';
    Jkid := 'getDrvSL1';
    GridColumns := 'ZJCX,当月,上月,新增,上年同月,环比增长(%),同比增长(%)';
    ChartViewSeries3.Visible := True;
    ChartViewSeries1.DataBinding.FieldName := '当月';
    ChartViewSeries1.DisplayText := '上月';
    ChartViewSeries2.DataBinding.FieldName := '当月';
    ChartViewSeries2.DisplayText := '上月';
  end;
  Param := 'kssj=' + sDate;
  Floginfo := Param.Replace('&', ',');
  s := TRequestItf.pDbQuery(Jkid, Param);
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('ZJCX', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('日期', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('当月', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('上月', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('新增', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('当年', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('上年', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('上年同月', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('环比增长(%)', ftFloat, 0, false);
  FDMemTable1.FieldDefs.Add('同比增长(%)', ftFloat, 0, false);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', false);
end;

end.
