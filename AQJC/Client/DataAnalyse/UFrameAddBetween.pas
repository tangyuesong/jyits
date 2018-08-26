unit UFrameAddBetween;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, cxComboboxExt,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutControlAdapters,
  dxLayoutContainer, Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cefvcl, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView, cxGrid,
  Vcl.StdCtrls, cxButtons, sComboBox, xtsComboBoxEx, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, dxDialogBase,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TFrameAddBetween = class(TdxDialogBaseFrame)
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    cboTo: TcxComboboxExt;
    dxLayoutItem1: TdxLayoutItem;
    btnToAdd: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    btnToDelete: TcxButton;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    cboBack: TcxComboboxExt;
    btnBackDelete: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    btnBackAdd: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    cxGrid2: TcxGrid;
    GridTo: TcxGridTableView;
    GridToColumn3: TcxGridColumn;
    GridToColumn1: TcxGridColumn;
    cxGrid2Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    GridBack: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridLevel2: TcxGridLevel;
    txtName: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    deBegin: TcxDateEdit;
    dxLayoutItem12: TdxLayoutItem;
    deEnd: TcxDateEdit;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    txtInterval: TcxTextEdit;
    dxLayoutItem14: TdxLayoutItem;
    procedure btnToAddClick(Sender: TObject);
    procedure btnBackAddClick(Sender: TObject);
    procedure btnToDeleteClick(Sender: TObject);
    procedure btnBackDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    procedure DeleteRow(grid: TcxGridTableView);
    procedure AddRow(devName: string; grid: TcxGridTableView);
    function AddTask: string;
    { Private declarations }
  public
    procedure AfterConstruction; override;
  end;

var
  FrameAddBetween: TFrameAddBetween;

implementation
uses uDictionary, uRequestITF, uGLobal;
{$R *.dfm}

{ TFrameAddBetween }

procedure TFrameAddBetween.AfterConstruction;
begin
  inherited;
  deBegin.Date := now - 1;
  deEnd.Date := now;
  TLZDictionary.BindComboboxDEV(cboTo);
  TLZDictionary.BindComboboxDEV(cboBack);
  txtName.Text := 'Task' + FormatDateTime('yyyymmddhhmmss', now);
  GridTo.DataController.RecordCount := 0;
  GridBack.DataController.RecordCount := 0;
end;

procedure TFrameAddBetween.btnBackAddClick(Sender: TObject);
begin
  inherited;
  AddRow(cboBack.Text, GridBack);
end;

procedure TFrameAddBetween.btnBackDeleteClick(Sender: TObject);
begin
  inherited;
  DeleteRow(GridBack);
end;

procedure TFrameAddBetween.btnSaveClick(Sender: TObject);
begin
  inherited;
  Id := AddTask;
  if Id <> '' then
  begin
    btnExitClick(nil);
    ClearControls(self);
    GridTo.DataController.RecordCount := 0;
    GridBack.DataController.RecordCount := 0;
    self.txtName.Text := 'Task' + FormatDateTime('yyyymmddhhmmss', now);
  end;
end;

procedure TFrameAddBetween.btnToAddClick(Sender: TObject);
begin
  inherited;
  AddRow(cboTo.Text, GridTo);
end;

procedure TFrameAddBetween.btnToDeleteClick(Sender: TObject);
begin
  inherited;
  DeleteRow(GridTo);
end;

procedure TFrameAddBetween.AddRow(devName: string; grid: TcxGridTableView);
var
  devNo: string;
  iRow: integer;
begin
  devNo := TLZDictionary.getkey('DEV','', devName);
  iRow := grid.DataController.RecordCount;
  grid.DataController.RecordCount := iRow + 1;
  grid.DataController.Values[iRow, 0] := devNo;
  grid.DataController.Values[iRow, 1] := devName;
end;

procedure TFrameAddBetween.DeleteRow(grid: TcxGridTableView);
var
  i, j: integer;
begin
  if grid.DataController.FocusedRecordIndex = -1 then
    exit;
  for i := grid.DataController.FocusedRecordIndex to grid.DataController.RecordCount-2 do
  begin
    for j := 0 to grid.ColumnCount - 1 do
    begin
      grid.DataController.Values[i, j] := grid.DataController.Values[i+1, j];
    end;
  end;
  grid.DataController.RecordCount := grid.DataController.RecordCount - 1;
end;

function TFrameAddBetween.AddTask: string;
var
  taskid, sbbhs1, sbbhs2, params, ret: string;
  I: Integer;
begin
  result := '';
  if deBegin.Date >= deEnd.Date then
  begin
    showmessage('结束时间要大于开始时间');
    exit;
  end;
  sbbhs1 := '';
  for I := 0 to GridTo.DataController.RecordCount - 1 do
  begin
    if i > 0 then
      sbbhs1 := sbbhs1 + ',';
    sbbhs1 := sbbhs1 + GridTo.DataController.Values[i, 0];
  end;
  sbbhs2 := '';
  for I := 0 to GridBack.DataController.RecordCount - 1 do
  begin
    if i > 0 then
      sbbhs2 := sbbhs2 + ',';
    sbbhs2 := sbbhs2 + GridBack.DataController.Values[i, 0];
  end;
  if (sbbhs1 = '')or(sbbhs2 = '') then
  begin
    showmessage('请输入经过的卡口');
    exit;
  end;

  taskid := TGuid.NewGuid.ToString;
  params := Format
    ('SYSTEMID=%s&TaskName=%s&SBBH1=%s&SBBH2=%s&BeginTime=%s&EndTime=%s&interval=%s&CreateBy=%s&CreateTime=%s&Status=%s',
    [taskid, txtName.Text, sbbhs1, sbbhs2, deBegin.Text, deEnd.Text, txtInterval.Text, gUser.YHBH, formatdatetime('yyyy-mm-dd hh:mm:ss', now), '待分析']);
  ret := TRequestItf.pDbQuery('AddT_Analyse_BetweenTask', params);
  if ret = '1' then
  begin
    result := taskid;
  end;
end;

end.
