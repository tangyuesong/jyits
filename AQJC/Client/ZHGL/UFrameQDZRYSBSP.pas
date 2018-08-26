unit UFrameQDZRYSBSP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, uDM, Vcl.Menus, dxLayoutControlAdapters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, cxGridViewLayoutContainer,
  cxGridLayoutView, cxGridDBLayoutView, cxGridWinExplorerView,
  cxGridDBWinExplorerView, cxGridCustomLayoutView, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxEditRepositoryItems, uEntity, uJsonUtils, uRequestItf, uGlobal, uCommon,
  uLookUpDataSource, uColumnGenerator, UFrameRYGL, UFrameQDZSB, UFrameQDZSP,
  System.Actions, Vcl.ActnList;

type
  TClose = procedure of object;

type
  TFrameQDZRYSBSP = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    BtnRY: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    BtnSP: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    BtnSB: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    GridView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxLayoutItem4: TdxLayoutItem;
    cxGrid1DBLayoutView1Group_Root: TdxLayoutGroup;
    cxGrid1DBLayoutView1: TcxGridDBLayoutView;
    cxGrid1DBWinExplorerView1: TcxGridDBWinExplorerView;
    cxGrid1DBLayoutView1LayoutItem1: TcxGridLayoutItem;
    sfzhm: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1LayoutItem2: TcxGridLayoutItem;
    xm: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1LayoutItem4: TcxGridLayoutItem;
    xl: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1LayoutItem5: TcxGridLayoutItem;
    dw: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1LayoutItem7: TcxGridLayoutItem;
    lxdz: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1LayoutItem8: TcxGridLayoutItem;
    lxfs: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1LayoutItem9: TcxGridLayoutItem;
    btninfo: TcxGridDBLayoutViewItem;
    BtnExit: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    cxdtrpstry1: TcxEditRepository;
    cxdtrpstry1HyperLinkItem1: TcxEditRepositoryHyperLinkItem;
    cxdtrpstry1SparklineItem1: TcxEditRepositorySparklineItem;
    cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem;
    cxdtrpstry1ImageItem1: TcxEditRepositoryImageItem;
    cxGrid1DBLayoutView1Group7: TdxLayoutGroup;
    cxGrid1DBLayoutView1Group8: TdxLayoutGroup;
    btnAdd: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    cxGrid1DBWinExplorerView1Item1: TcxGridDBWinExplorerViewItem;
    cxGrid1DBWinExplorerView1Item2: TcxGridDBWinExplorerViewItem;
    cxGrid1DBWinExplorerView1Item3: TcxGridDBWinExplorerViewItem;
    cxGrid1DBLayoutView1LayoutItem10: TcxGridLayoutItem;
    btnimage: TcxGridDBLayoutViewItem;
    cxdtrpstry1ButtonItem2: TcxEditRepositoryButtonItem;
    cxGrid1DBLayoutView1LayoutItem11: TcxGridLayoutItem;
    tp1: TcxGridDBLayoutViewItem;
    cxGrid1DBLayoutView1Group1: TdxLayoutAutoCreatedGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    actlst1: TActionList;
    actnew: TAction;
    actedit: TAction;
    actdelete: TAction;
    actView: TAction;
    procedure BtnExitClick(Sender: TObject);
    procedure BtnRYClick(Sender: TObject);
    procedure BtnSPClick(Sender: TObject);
    procedure BtnSBClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
  private
    FQDZDM: string;
    FColumns: string;
    FNoLookupColumns: string;
    FrameRYGL: TFrameRYGL;
    FClose: TClose;
    FQZTStatus: TQZTXX;
    procedure InsertTable;
    procedure SetColumns(const Value: string);
    procedure LoadFrame(QZTXX: TQZTXX);
    { Private declarations }

  public
    { Public declarations }

    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure loadData(QZTXX: TQZTXX);
    property OnClose: TClose read FClose write FClose;
    property QDZDM: string read FQDZDM write FQDZDM;
    property NoLookupColumns: string read FNoLookupColumns write FNoLookupColumns;
    property GridColumns: string read FColumns write SetColumns;
    property QZTStatus: TQZTXX read FQZTStatus write FQZTStatus;
  end;

var
  FrameQDZRYSBSP: TFrameQDZRYSBSP;

implementation

{$R *.dfm}
procedure TFrameQDZRYSBSP.actdeleteExecute(Sender: TObject);
var
  sysid: string;
  qdzdm: string;
begin
  inherited;
  sysid := Fdmemtable1.FieldByName('systemid').AsString;
  qdzdm := FDMemTable1.FieldByName('QDZDM').AsString;
  if Application.MessageBox('是否删除数据', '提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDOK then
  begin
    if FQZTStatus = esRY then
      TRequestItf.DbQuery('DelT_QDZ_USER', 'SYSTEMID=' + sysid)
    else if FQZTStatus = esSB then
      TRequestItf.DbQuery('DelT_QDZ_DEVICE', 'SYSTEMID=' + sysid)
    else if FQZTStatus = esSP then
      TRequestItf.DbQuery('DelT_QDZ_VEDIO', 'SYSTEMID=' + sysid);
    Fdmemtable1.Delete;
  end;

end;

procedure TFrameQDZRYSBSP.acteditExecute(Sender: TObject);
begin
  inherited;
  LoadFrame(QZTStatus);
  if QZTStatus = esRY then
  begin
    FrameRYGL.EditID := TEditStatus.esModify;
    FrameRYGL.QDZRYlist := TJSONUtils.TableToRecord<TQDZRY>(FDMemTable1);
  end
  else if QZTStatus = esSB then
  begin
    FrameQDZSB.EditID := TEditStatus.esModify;
    FrameQDZSB.QDZSBlist := TJSONUtils.TableToRecord<TQDZSB>(FDMemTable1);
  end
  else if QZTStatus = esSP then
  begin
    FrameQDZSP.EditID := TEditStatus.esModify;
    FrameQDZSP.QDZSPlist := TJSONUtils.TableToRecord<TQDZSP>(FDMemTable1);
  end;

end;

procedure TFrameQDZRYSBSP.AfterConstruction;
begin
  inherited;
  //loadData(0);
  QZTStatus := TQZTXX.esRY;
end;

procedure TFrameQDZRYSBSP.BeforeDestruction;
begin
  inherited;
  if Assigned(FrameRYGL) then
    FreeAndNil(FrameRYGL);

  if Assigned(FrameQDZSB) then
    FreeAndNil(FrameQDZSB);

  if Assigned(FrameQDZSP) then
    FreeAndNil(FrameQDZSP);
end;

procedure TFrameQDZRYSBSP.btnAddClick(Sender: TObject);
begin
  inherited;
  LoadFrame(QZTStatus);
  if QZTStatus = esRY then
    FrameRYGL.EditID := TEditStatus.esNew
  else if QZTStatus = esSB then
    FrameQDZSB.EditID := TEditStatus.esNew
  else if QZTStatus = esSP then
    FrameQDZSP.EditID := TEditStatus.esNew;
end;

procedure TFrameQDZRYSBSP.BtnExitClick(Sender: TObject);
begin
  inherited;
  Hide;
  OnClose;
end;

procedure TFrameQDZRYSBSP.BtnRYClick(Sender: TObject);
begin
  inherited;
  QZTStatus := TQZTXX.esRY;
  loadData(QZTStatus);
end;

procedure TFrameQDZRYSBSP.BtnSBClick(Sender: TObject);
begin
  inherited;
  QZTStatus := TQZTXX.esSB;
  loadData(QZTStatus);
end;

procedure TFrameQDZRYSBSP.BtnSPClick(Sender: TObject);
begin
  inherited;
  QZTStatus := TQZTXX.esSP;
  loadData(QZTStatus);
end;

procedure TFrameQDZRYSBSP.loadData(QZTXX: TQZTXX);
var
  json: string;
begin
  inherited;
  if QZTXX = esRY then
  begin
    json := TRequestItf.pDbQuery('GETT_QDZ_USER', 'QDZDM=' + FQDZDM);
    GridColumns := 'QDZDM,SFZHM,XM,DW,LXFS,LXDZ,操作';
    GridView.Columns[6].Options.ShowEditButtons := isebAlways;
    GridView.Columns[6].RepositoryItem := cxdtrpstry1ButtonItem1;
    cxGrid1Level1.GridView := GridView;
  end
  else if QZTXX = esSP then
  begin
    json := TRequestItf.pDbQuery('GETT_QDZ_VEDIO', 'QDZDM=' + FQDZDM);
    GridColumns := 'QDZDM,SPDM,SPMC,SPJD,SPWD,操作';
    GridView.Columns[5].Options.ShowEditButtons := isebAlways;
    GridView.Columns[5].RepositoryItem := cxdtrpstry1ButtonItem1;
    cxGrid1Level1.GridView := GridView;
  end
  else if QZTXX = esSB then
  begin
    json := TRequestItf.pDbQuery('GETT_QDZ_DEVICE', 'QDZDM=' + FQDZDM);
    GridColumns := 'QDZDM,SBDM,SBMC,BZ,操作';
    GridView.Columns[4].Options.ShowEditButtons := isebAlways;
    GridView.Columns[4].RepositoryItem := cxdtrpstry1ButtonItem1;
    cxGrid1Level1.GridView := GridView;
  end;
  TJSONUtils.JSONToDataSet(json, FDMemTable1, '');
end;

procedure TFrameQDZRYSBSP.LoadFrame(QZTXX: TQZTXX);
begin
  if QZTXX = esRY then
  begin
    if not Assigned(FrameRYGL) then
    begin
      FrameRYGL := TFrameRYGL.Create(self);
      FrameRYGL.Align := alClient;
      FrameRYGL.Parent := Self;
      FrameRYGL.OnOK := InsertTable;
    end;
    FrameRYGL.Show;
    FrameRYGL.QDZDM := FQDZDM;
  end
  else if QZTXX = esSB then
  begin
    if not Assigned(FrameQDZSB) then
    begin
      FrameQDZSB := TFrameQDZSB.Create(self);
      FrameQDZSB.Align := alClient;
      FrameQDZSB.Parent := Self;
      FrameQDZSB.OnOK := InsertTable;
    end;
    FrameQDZSB.Show;
    FrameQDZSB.QDZDM := FQDZDM;
  end
  else if QZTXX = esSP then
  begin
    if not Assigned(FrameQDZSP) then
    begin
      FrameQDZSP := TFrameQDZSP.Create(self);
      FrameQDZSP.Align := alClient;
      FrameQDZSP.Parent := Self;
      FrameQDZSP.OnOK := InsertTable;
    end;
    FrameQDZSP.Show;
    FrameQDZSP.QDZDM := FQDZDM;
  end

end;

procedure TFrameQDZRYSBSP.SetColumns(const Value: string);
var
  i: integer;
  FieldName: string;
begin
  FColumns := Value;
  TColumnGenerator.Instance.GenerateField(GridColumns, GridView);
  for i := 0 to GridView.ColumnCount - 1 do
  begin
    FieldName := GridView.Columns[i].DataBinding.FieldName;
    if (',' + UpperCase(FNoLookupColumns) + ',').contains(',' + UpperCase(FieldName) + ',') then
      continue;
    if TLookUpDataSource.DataSource.ContainsKey(FieldName) then
      TColumnGenerator.LookupColumn(GridView.Columns[i], TLookUpDataSource.DataSource[FieldName]);
    if FieldName = '详细信息' then
      GridView.Columns[i].RepositoryItem := cxdtrpstry1ButtonItem1;
  end;
end;

procedure TFrameQDZRYSBSP.InsertTable;
begin
  loadData(FQZTStatus);
end;

end.

