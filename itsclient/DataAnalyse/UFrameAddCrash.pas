unit UFrameAddCrash;

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
  TFrameAddCrash = class(TdxDialogBaseFrame)
    cxDateEdit1: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cxDateEdit3: TcxDateEdit;
    cboGCDD: TcxComboboxExt;
    dxLayoutItem6: TdxLayoutItem;
    cxGrid1: TcxGrid;
    GridView: TcxGridTableView;
    cxGrid1Level1: TcxGridLevel;
    BtnAdd: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    cxTextEdit1: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    cxTextEdit2: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    GridViewColumn1: TcxGridDBColumn;
    GridViewColumn2: TcxGridDBColumn;
    GridViewColumn3: TcxGridDBColumn;
    procedure BtnAddClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    function AddTask: string;
    { Private declarations }
  public
    procedure AfterConstruction; override;
  end;

var
  FrameAddCrash: TFrameAddCrash;

implementation

{$R *.dfm}

{ TFrameAddCrash }

procedure TFrameAddCrash.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindComboboxDEV(cboGCDD);
  self.cxDateEdit1.Date := now;
  self.cxDateEdit3.Date := now;
  self.cxTextEdit1.Text := 'Task' + FormatDateTime('yyyymmddhhmmss', now);
end;

procedure TFrameAddCrash.BtnAddClick(Sender: TObject);
var
  iRow: integer;
  t1, t2: double;
begin
  inherited;
  t1 := self.cxDateEdit1.Date;
  t2 := self.cxDateEdit3.Date;
  if t2 - t1 > 1/24 then
  begin
    Application.MessageBox('请缩小时间范围到60分钟内。', '提示', MB_OK);
    exit;
  end;
  if t2 < t1 then
  begin
    Application.MessageBox('开始时间不能大于结束时间。', '提示', MB_OK);
    exit;
  end;

  iRow := GridView.DataController.RecordCount;
  GridView.DataController.RecordCount := iRow + 1;
  GridView.DataController.Values[iRow, 0] := formatdatetime('yyyy-mm-dd hh:mm:ss', t1);
  GridView.DataController.Values[iRow, 1] := formatdatetime('yyyy-mm-dd hh:mm:ss', t2);
  GridView.DataController.Values[iRow, 2] := self.cboGCDD.Text;
end;

procedure TFrameAddCrash.cxButton2Click(Sender: TObject);
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

procedure TFrameAddCrash.btnSaveClick(Sender: TObject);
begin
  inherited;
  Id := AddTask;
  if Id <> '' then
  begin
    btnExitClick(nil);
    ClearControls(self);
    GridView.DataController.RecordCount := 0;
    self.cxTextEdit1.Text := 'Task' + FormatDateTime('yyyymmddhhmmss', now);
  end;
end;

function TFrameAddCrash.AddTask: string;
var
  taskid, params, sbbh, sbddmc, beginTime, endTime, ret: string;
  I: Integer;
begin
  result := '';
  if GridView.DataController.RecordCount < 3 then
  begin
    MessageBox(Application.Handle, '输入条件不能少于3个', '提示', MB_OK);
    exit;
  end;
  taskid := TGuid.NewGuid.ToString;
  params := Format
    ('SYSTEMID=%s&TaskName=%s&CreateBy=%s&CreateTime=%s&Status=%s&Rate=%s',
    [taskid, cxTextEdit1.Text,
    gUser.YHBH,
    formatdatetime('yyyy-mm-dd hh:mm:ss', now), '待分析', cxTextEdit2.Text]);

  ret := TRequestItf.pDbQuery('AddT_Analyse_CrashTask', params);
  if ret = '1' then
  begin
    result := taskid;

    for I := 0 to GridView.DataController.RecordCount - 1 do
    begin
      beginTime := GridView.DataController.Values[i, 0];
      endTime := GridView.DataController.Values[i, 1];
      sbddmc := GridView.DataController.Values[i, 2];
      sbbh := TLZDictionary.GetKey('DEV', '', sbddmc);
      params := Format('TaskId=%s&SBBH=%s&SBDDMC=%s&BeginTime=%s&EndTime=%s',
        [taskid, sbbh, sbddmc, beginTime, endTime]);
      TRequestItf.pDbQuery('AddT_Analyse_CrashTask_Input', params);
    end;
  end;
end;

end.
