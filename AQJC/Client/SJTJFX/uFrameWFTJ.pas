unit uFrameWFTJ;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxDropDownEdit,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit, cxCalendar,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, cxComboboxExt,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, cxStyles, cxCustomData, Data.DB, cxDBData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxGridChartView,
  cxGridDBChartView, cxGridCustomView, cxGrid, sDialogs, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uJsonUtils, uRequestItf, uGlobal, uCommon, Udictionary,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TFrameWFTJ = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    deBegin: TcxDateEdit;
    dxLayoutItem8: TdxLayoutItem;
    deEnd: TcxDateEdit;
    dxLayoutItem9: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem10: TdxLayoutItem;
    btnExport: TcxButton;
    dxLayoutItem11: TdxLayoutItem;
    cbbWfdd: TcxComboboxExt;
    dxLayoutItem12: TdxLayoutItem;
    dstemp2: TDataSource;
    dlgSave: TsSaveDialog;
    cxGrid2: TcxGrid;
    cxGrid2DBChartView1: TcxGridDBChartView;
    cxGrid2DBChartView1Series1: TcxGridDBChartSeries;
    cxGridLevel2: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxgrid3: TcxGridDBTableView;
    cxgridnumcxgrid3Column1: TcxGridDBColumn;
    cxgridnumcxgrid3Column2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    FDqryclient: TFDMemTable;
    procedure btnSearchClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    Floginfo: String;
    procedure AfterConstruction; override;
  public
    { Public declarations }
  end;

var
  FrameWFTJ: TFrameWFTJ;

implementation

{$R *.dfm}
{ TFrameWFTJ }

procedure TFrameWFTJ.AfterConstruction;
begin
  inherited;
  deBegin.Text := FormatDateTime('yyyy/mm/dd', Now() - 7);
  deEnd.Text := FormatDateTime('yyyy/mm/dd', Now());
  TLZDictionary.BindComboboxDEV(cbbWfdd, True);
  FDqryclient.FieldDefs.Add('hh', ftString, 50, false);
  FDqryclient.FieldDefs.Add('num', ftInteger, 0, false);
end;

procedure TFrameWFTJ.btnExportClick(Sender: TObject);
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

procedure TFrameWFTJ.btnSearchClick(Sender: TObject);
var
  Param: String;
begin
  inherited;
  Param := 'kssj=' + FormatDateTime('yyyy-mm-dd', deBegin.Date);
  Param := Param + '&jssj=' + FormatDateTime('yyyy-mm-dd', deEnd.Date);
  Param := Param + '&kdbh=' + TLZDictionary.StrtoDicInfo(cbbWfdd.Text).dm;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetWFTJ', Param), FDqryclient,
    '', false);
  FreeFrameWait;
end;

end.
