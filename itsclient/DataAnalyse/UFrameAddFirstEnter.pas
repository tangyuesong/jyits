unit UFrameAddFirstEnter;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, uDictionary, uGlobal,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, uRequestItf,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, dxDialogBase,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, sComboBox, xtsComboBoxEx,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cefvcl, dxLayoutControl,
  cxComboboxExt, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TFrameAddFirstEnter = class(TdxDialogBaseFrame)
    edtBeginDate: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    edtEndDate: TcxDateEdit;
    cboGCDD: TcxComboboxExt;
    dxLayoutItem6: TdxLayoutItem;
    cxGrid1: TcxGrid;
    GridView: TcxGridTableView;
    cxGrid1Level1: TcxGridLevel;
    BtnAdd: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    btnDelete: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    edtTaskName: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edtDays: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    procedure BtnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    function AddTask: string;
    { Private declarations }
  public
    procedure AfterConstruction; override;
  end;

var
  FrameAddFirstEnter: TFrameAddFirstEnter;

implementation

{$R *.dfm}

{ TFrameAddFirstEnter }

procedure TFrameAddFirstEnter.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindComboboxDEV(cboGCDD, true, '12', gUser.DWDM.Substring(0, 6));
  self.edtBeginDate.Text := FormatDateTime('yyyy/mm/dd', Now() - 7);
  self.edtEndDate.Text := FormatDateTime('yyyy/mm/dd', Now());now;
  self.edtTaskName.Text := 'Task' + FormatDateTime('yyyymmddhhmmss', now);
end;

procedure TFrameAddFirstEnter.BtnAddClick(Sender: TObject);
var
  iRow: integer;
  aa: TArray<string>;
  s: string;
begin
  inherited;
  s := cboGCDD.Text;
  aa := s.Split([':']);
  if Length(aa) = 2 then
  begin
    iRow := GridView.DataController.RecordCount;
    GridView.DataController.RecordCount := iRow + 1;
    GridView.DataController.Values[iRow, 0] := aa[0];
    GridView.DataController.Values[iRow, 1] := aa[1];
  end;
end;

procedure TFrameAddFirstEnter.btnDeleteClick(Sender: TObject);
var
  i, j: integer;
begin
  inherited;
  if GridView.DataController.FocusedRecordIndex = -1 then
    exit;
  for i := GridView.DataController.FocusedRecordIndex to GridView.DataController.RecordCount-2 do
  begin
    for j := 0 to GridView.ColumnCount - 1 do
    begin
      GridView.DataController.Values[i, j] := GridView.DataController.Values[i+1, j];
    end;
  end;
  GridView.DataController.RecordCount := GridView.DataController.RecordCount - 1;
end;

procedure TFrameAddFirstEnter.btnSaveClick(Sender: TObject);
begin
  inherited;
  if edtEndDate.Date < edtBeginDate.Date then
  begin
    Application.MessageBox('开始时间不能大于结束时间。', '提示', MB_OK);
    exit;
  end;
  Id := AddTask;
  if Id <> '' then
  begin
    btnExitClick(nil);
    ClearControls(self);
    GridView.DataController.RecordCount := 0;
    self.edtTaskName.Text := 'Task' + FormatDateTime('yyyymmddhhmmss', now);

  end;
end;

function TFrameAddFirstEnter.AddTask: string;
var
  taskid, params, sbbh, sbddmc, beginTime, endTime, ret: string;
  I: Integer;
begin
  result := '';
  if GridView.DataController.RecordCount < 1 then
  begin
    MessageBox(Application.Handle, '请输入进城卡口', '提示', MB_OK);
    exit;
  end;
  taskid := TGuid.NewGuid.ToString;
  sbbh := '';
  sbddmc := '';
  for I := 0 to GridView.DataController.RecordCount - 1 do
  begin
    sbbh := sbbh + ',' + GridView.DataController.Values[i, 0];
    sbddmc := sbddmc + ',' + GridView.DataController.Values[i, 1];
  end;
  sbbh := sbbh.Substring(1);
  sbddmc := sbddmc.Substring(1);
  params := Format
    ('SYSTEMID=%s&beginTime=%s&endTime=%s&Days=%s&sbbh=%s&sbddmc=%s&TaskName=%s&CreateBy=%s&CreateTime=%s&Status=%s',
    [taskid,
    FormatDatetime('yyyy/mm/dd', edtBeginDate.Date),
    FormatDatetime('yyyy/mm/dd', edtEndDate.Date),
    edtDays.Text,
    sbbh,sbddmc,
    edtTaskName.Text,
    gUser.YHBH,
    FormatDatetime('yyyy/mm/dd hh:mm:ss', now), '待分析']);

  ret := TRequestItf.pDbQuery('AddT_Analyse_FirstEnterTask', params);
  if ret = '1' then
  begin
    result := taskid;
  end;
end;

end.
