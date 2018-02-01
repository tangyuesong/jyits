unit uFrameGCTJ;

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
  TFrameGCTJ = class(TdxFrame)
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
    cbbDateType: TcxComboBox;
    dxLayoutItem3: TdxLayoutItem;
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
  FrameGCTJ: TFrameGCTJ;

implementation

{$R *.dfm}
{ TFrameGCTJ }

procedure TFrameGCTJ.AfterConstruction;
begin
  inherited;
  deBegin.Text := FormatDateTime('yyyy/mm/dd', Now() - 1);
  deEnd.Text := FormatDateTime('yyyy/mm/dd', Now());
  cbbDateType.ItemIndex := 3;
  TLZDictionary.BindComboboxDEV(cbbWfdd, True);
  FDqryclient.FieldDefs.Add('gcsj', ftString, 50, false);
  FDqryclient.FieldDefs.Add('gccs', ftInteger, 0, false);
end;

procedure TFrameGCTJ.btnExportClick(Sender: TObject);
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

procedure TFrameGCTJ.btnSearchClick(Sender: TObject);
var
  Param: String;
begin
  inherited;
  Param := 'cjjg=' + TCommon.GetXZQH(gUser.DWDM);
  Param := Param + '&kssj=' + FormatDateTime('yyyy-mm-dd', deBegin.Date);
  Param := Param + '&jssj=' + FormatDateTime('yyyy-mm-dd', deEnd.Date);
  if cbbDateType.ItemIndex = 0 then
    Param := Param + '&datetype=Y'
  else if cbbDateType.ItemIndex = 1 then
    Param := Param + '&datetype=M'
  else if cbbDateType.ItemIndex = 2 then
    Param := Param + '&datetype=D'
  else if cbbDateType.ItemIndex = 3 then
    Param := Param + '&datetype=H';
  Param := Param + '&tjlx=1';
  if cbbWfdd.ItemIndex >= 0 then
    Param := Param + '&kdbh=' + TLZDictionary.StrtoDicInfo(cbbWfdd.Text).dm;
  { todo 要增加统计类型 1 卡口单点 2 以路为单位 3 管辖区域 }

  Floginfo := Param;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetGCTJ', Param), FDqryclient,
    '', false);
  FreeFrameWait;
end;

end.
