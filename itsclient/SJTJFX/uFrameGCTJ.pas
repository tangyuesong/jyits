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
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, uFrameSelectDev, uEntity;

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
    dxLayoutItem4: TdxLayoutItem;
    cbbwfdd: TcxComboBox;
    procedure btnSearchClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure cbbWfddMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    Floginfo: String;
    FDev: TFrameSelectDev;
    procedure AfterConstruction; override;
    procedure DevSaveClick(Sender: TObject);
    procedure DevExitClick(Sender: TObject);
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
  // TLZDictionary.BindComboboxDEV(cbbWfdd, True);
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
  // if cbbWfdd.ItemIndex >= 0 then
  // Param := Param + '&kdbh=' + TLZDictionary.StrtoDicInfo(cbbWfdd.Text).dm;

  Param := Param + '&kdbh=' + cbbwfdd.Text;

  { todo 要增加统计类型 1 卡口单点 2 以路为单位 3 管辖区域 }

  Floginfo := Param;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetGCTJ', Param), FDqryclient,
    '', false);
  FreeFrameWait;
end;

procedure TFrameGCTJ.cbbWfddMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  key: string;
  dev: TDevice;
begin
  inherited;
  if Button <> mbLeft then
    exit;

  if not Assigned(FDev) then
  begin
    FDev := TFrameSelectDev.Create(self);
    FDev.Parent := self;
    FDev.tvDevColumn2.Caption := '设备编号';
    FDev.tvDevColumn3.Caption := '设备地点名称';
    FDev.tvDevColumn4.Visible := false;
    // FDev.Top := (self.Height - FDev.Height) div 2;
    FDev.Top := 20;
    FDev.Left := (self.Width - FDev.Width) div 2;
    FDev.btnSave.OnClick := self.DevSaveClick;
    FDev.btnExit.OnClick := self.DevExitClick;
  end;

  FDev.tb.Close;
  FDev.tb.FieldDefs.Clear;
  FDev.tb.IndexDefs.Clear;
  FDev.tb.FieldDefs.Add('bj', ftBoolean);
  FDev.tb.FieldDefs.Add('WFDD', ftString, 100);
  FDev.tb.FieldDefs.Add('SBDDMC', ftString, 100);
  FDev.tb.FieldDefs.Add('C1', ftInteger);
  FDev.tb.IndexDefs.Add('index', 'WFDD', [ixPrimary]);
  FDev.tb.IndexName := 'index';
  FDev.tb.CreateDataSet();

  FDev.tb.DisableControls;
  FDev.tb.Edit;
  for key in TLZDictionary.gDicDev[1].Keys do
  begin
    dev := TLZDictionary.gDicDev[1][key];
    FDev.tb.Append;
    FDev.tb.FieldByName('WFDD').AsString := dev.SBBH;
    FDev.tb.FieldByName('SBDDMC').AsString := dev.SBDDMC;
    FDev.tb.FieldByName('bj').AsBoolean := false;
  end;
  FDev.tb.Post;
  FDev.tb.First;
  FDev.tb.EnableControls;
  dxLayoutControl2Group_Root.Visible := false;
  FDev.Visible := True;
end;

procedure TFrameGCTJ.DevExitClick(Sender: TObject);
begin
  if Assigned(FDev) then
    FDev.Visible := false;
  dxLayoutControl2Group_Root.Visible := True;
end;

procedure TFrameGCTJ.DevSaveClick(Sender: TObject);
var
  recNo: Integer;
  ss: string;
begin
  DevExitClick(nil);
  ss := '';
  if not FDev.tb.Active then
    exit;
  FDev.tb.DisableControls;
  recNo := FDev.tb.recNo;
  FDev.tb.First;
  while not FDev.tb.eof do
  begin
    if FDev.tb.FieldByName('bj').AsBoolean then
      ss := ss + ',' + FDev.tb.FieldByName('WFDD').AsString;
    FDev.tb.Next;
  end;
  FDev.tb.recNo := recNo;
  FDev.tb.EnableControls;
  if ss <> '' then
    ss := ss.Substring(1);
  cbbwfdd.Text := ss;
end;

end.
