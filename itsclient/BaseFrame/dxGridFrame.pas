unit dxGridFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, ExtCtrls, Buttons,
  Db, StdCtrls, dxBar, dxBarDBNav, cxLookAndFeels, cxGridLevel,
  cxControls, dxFrame, cxGrid, cxGridCustomView,
  cxGridUIHelper, cxGridPopUpMenu, cxStyles, cxGraphics, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, uGlobal, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxClasses,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, uDM,
  dxLayoutContainer, dxLayoutControl, dxSkinsdxBarPainter, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxEditRepositoryItems, Vcl.Dialogs, sDialogs,
  System.Actions, Vcl.ActnList, Vcl.Menus, cxTextEdit, cxButtons, cxMaskEdit,
  cxDropDownEdit, dxLayoutcxEditAdapters, dxLayoutControlAdapters;

type
  TdxGridFrame = class(TdxFrame)
    GridView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    cxdtrpstry1: TcxEditRepository;
    cxdtrpstry1HyperLinkItem1: TcxEditRepositoryHyperLinkItem;
    cxdtrpstry1SparklineItem1: TcxEditRepositorySparklineItem;
    cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem;
    dlgSave: TsSaveDialog;
    actlst1: TActionList;
    actnew: TAction;
    actedit: TAction;
    actdelete: TAction;
    actView: TAction;
    dxLayoutGroupPage: TdxLayoutGroup;
    dxLayoutItemPagesize: TdxLayoutItem;
    dxLayoutItemFirstPage: TdxLayoutItem;
    dxLayoutItemPriorPage: TdxLayoutItem;
    dxLayoutItemIndex: TdxLayoutItem;
    dxLayoutItemnextPage: TdxLayoutItem;
    dxLayoutItemBtnLastPage: TdxLayoutItem;
    cbbPagesize: TcxComboBox;
    btnFirstPage: TcxButton;
    btnPriorPage: TcxButton;
    edtPageIndex: TcxTextEdit;
    btnnextPage: TcxButton;
    btnLastPage: TcxButton;
    procedure btnPriorPageClick(Sender: TObject);
    procedure btnnextPageClick(Sender: TObject);
    procedure btnFirstPageClick(Sender: TObject);
  protected

  private
    FNoLookupColumns: String;
    FColumns: string;
    procedure SetColumns(const Value: string);
  protected
    procedure LoadData; virtual;
    procedure CloseLayout;
    procedure SetLayoutVisible(b:Boolean);
  public
    property NoLookupColumns: String read FNoLookupColumns
      write FNoLookupColumns;
    property GridColumns: string read FColumns write SetColumns;
  end;

implementation

uses
  uColumnGenerator, uLookUpDataSource;

{$R *.DFM}
{ TdxGridFrame }


procedure TdxGridFrame.btnFirstPageClick(Sender: TObject);
begin
  inherited;

  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TdxGridFrame.btnnextPageClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  i := strtointdef(edtPageIndex.Text, 1);
  begin
    edtPageIndex.Text := (i + 1).tostring;
    LoadData;
  end;
end;

procedure TdxGridFrame.btnPriorPageClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  i := strtointdef(edtPageIndex.Text, 1);
  if i > 0 then
  begin
    edtPageIndex.Text := (i - 1).tostring;
    LoadData;
  end;
end;

procedure TdxGridFrame.CloseLayout;
begin
  SetLayoutVisible(true);
end;

procedure TdxGridFrame.LoadData;
begin

end;

procedure TdxGridFrame.SetColumns(const Value: string);
var
  i: integer;
  FieldName: string;
begin
  FColumns := Value;
  TColumnGenerator.Instance.GenerateField(GridColumns, GridView);
  for i := 0 to GridView.ColumnCount - 1 do
  begin
    FieldName := GridView.Columns[i].DataBinding.FieldName;
    if (',' + UpperCase(FNoLookupColumns) + ',')
      .Contains(',' + UpperCase(FieldName) + ',') then
      continue;
    if TLookUpDataSource.DataSource.ContainsKey(FieldName) then
      TColumnGenerator.LookupColumn(GridView.Columns[i],
        TLookUpDataSource.DataSource[FieldName]);
    if (FieldName = 'ÏêÏ¸ÐÅÏ¢')or(FieldName = '²Ù×÷') then
      GridView.Columns[i].RepositoryItem := cxdtrpstry1ButtonItem1;
  end;
end;

procedure TdxGridFrame.SetLayoutVisible(b: Boolean);
begin
  dxLayoutControl2.Visible:=b;
end;

end.
