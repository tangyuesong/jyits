unit uFrameVIOLRRYTJ;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxClasses, cxCustomData, cxStyles, cxEdit, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, Vcl.ExtCtrls, sSplitter,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGridChartView, cxGrid, cxCustomPivotGrid, cxDBPivotGrid,
  cxPivotGridChartConnection, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCheckBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxImage, uJsonUtils, uRequestItf, uGlobal,
  uColumnGenerator, ULookUpDataSource, sDialogs, uCommon, cxGridDBChartView;

type
  TFrameVIOLRRYTJ = class(TdxFrame)
    dstempZCB: TDataSource;
    cxGrid1: TcxGrid;
    cxgrid3: TcxGridDBTableView;
    cxgridGrid1DBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    sSplitter1: TsSplitter;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    deBegin: TcxDateEdit;
    dxLayoutItem5: TdxLayoutItem;
    deEnd: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    cbGroup: TcxCheckBox;
    dxLayoutItem7: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    btnExport: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    FDqryZB: TFDMemTable;
    dlgSave: TsSaveDialog;
    dxLayoutItem1: TdxLayoutItem;
    cxGrid2: TcxGrid;
    ChartView: TcxGridDBChartView;
    ChartViewSeries1: TcxGridDBChartSeries;
    cxGridLevel2: TcxGridLevel;
    cxGrid1DBChartView1: TcxGridDBChartView;
    cxGrid1DBChartView1Series1: TcxGridDBChartSeries;
    ChartViewSeries2: TcxGridDBChartSeries;
    ChartViewSeries3: TcxGridDBChartSeries;
    ChartViewSeries4: TcxGridDBChartSeries;
    ChartViewSeries5: TcxGridDBChartSeries;
    ChartViewSeries6: TcxGridDBChartSeries;
    ChartViewSeries7: TcxGridDBChartSeries;
    procedure btnSearchClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    Floginfo: String;
    procedure SetColumns(GridColumns: string; GridVIew: TcxGridDBTableView);
    procedure AfterConstruction; override;
  public
    { Public declarations }
  end;

var
  FrameVIOLRRYTJ: TFrameVIOLRRYTJ;

implementation

{$R *.dfm}

procedure TFrameVIOLRRYTJ.AfterConstruction;
begin
  inherited;
  deBegin.Text := FormatDateTime('yyyy/mm/dd', Now() - 1);
  deEnd.Text := FormatDateTime('yyyy/mm/dd', Now());
  SetColumns('LRR, 录入未上传, 上传失败, 上传成功, 待复核, 待审核, 复核删除, 录入删除, 删除率', cxgrid3);
  FDqryZB.FieldDefs.Add('LRR', ftString, 50, false);
  FDqryZB.FieldDefs.Add('录入未上传', ftInteger, 0, false);
  FDqryZB.FieldDefs.Add('上传失败', ftInteger, 0, false);
  FDqryZB.FieldDefs.Add('上传成功', ftInteger, 0, false);
  FDqryZB.FieldDefs.Add('待复核', ftInteger, 0, false);
  FDqryZB.FieldDefs.Add('待审核', ftInteger, 0, false);
  FDqryZB.FieldDefs.Add('复核删除', ftInteger, 0, false);
  FDqryZB.FieldDefs.Add('录入删除', ftInteger, 0, false);
  FDqryZB.FieldDefs.Add('删除率', ftString, 100, false);
end;

procedure TFrameVIOLRRYTJ.btnExportClick(Sender: TObject);
begin
  inherited;
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    TCommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    FreeFrameWait;
    Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);

  end;
end;

procedure TFrameVIOLRRYTJ.btnSearchClick(Sender: TObject);
var
  Param: String;
begin
  inherited;
  Param := 'kssj=' + FormatDateTime('yyyy/mm/dd hh:nn:ss', deBegin.Date);
  Param := Param + '&jssj=' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
    deEnd.Date + 1);
  Param := Param + '&cjjg=' + gUser.DWDM;
  if cbGroup.Checked then
    Param := Param + '&isgroup=1';
  Floginfo := Param;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetLrryTjGrid', Param), FDqryZB,
    '', false);
  FreeFrameWait;
end;

procedure TFrameVIOLRRYTJ.SetColumns(GridColumns: string;
  GridVIew: TcxGridDBTableView);
var
  i: Integer;
  FieldName: string;
begin
  TColumnGenerator.Instance.GenerateField(GridColumns, GridVIew);
  for i := 0 to GridVIew.ColumnCount - 1 do
  begin
    FieldName := GridVIew.Columns[i].DataBinding.FieldName;
    if TLookUpDataSource.DataSource.ContainsKey(FieldName) then
      TColumnGenerator.LookupColumn(GridVIew.Columns[i],
        TLookUpDataSource.DataSource[FieldName]);
  end;
end;

end.
