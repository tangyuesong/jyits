unit UFrameNocturnal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitFrameCustom, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uDM, uCxGridFileds,
  Vcl.ComCtrls, sPageControl, Vcl.StdCtrls, Vcl.Mask, sMaskEdit,
  sCustomComboEdit, sToolEdit, Vcl.Buttons, sSpeedButton, uDeviceTreeFrame,
  Vcl.ExtCtrls, sPanel, sSplitter, sFrameAdapter, sDialogs, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxDBData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridChartView, cxGridDBChartView, cxClasses, cxGridCustomView, cxGrid, uMap,
  sButton, sGroupBox, sEdit, sSpinEdit, sComboBoxes,uPrompt, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, uGlobal;

type
  TFrameNocturnal = class(TCustomInfoFrame)
    spnl1: TsPanel;
    dterq: TsDateEdit;
    dterq2: TsDateEdit;
    sPanel2: TsPanel;
    cxGrid1: TcxGrid;
    GridViewTask: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    FDQueryTask: TFDQuery;
    DataSourceTask: TDataSource;
    btnSearch: TsButton;
    btnAdd: TsButton;
    btnDelete: TsButton;
    DataSourceResult: TDataSource;
    FDQueryResult: TFDQuery;
    cxGrid1Level2: TcxGridLevel;
    GridViewResult: TcxGridDBTableView;
    sGroupBox1: TsGroupBox;
    sDateEdit1: TsDateEdit;
    sDateEdit2: TsDateEdit;
    btnOK: TsButton;
    btnCancel: TsButton;
    edtName: TsEdit;
    sComboBoxEx3: TsComboBoxEx;
    btnRuleManage: TsButton;
    sGroupBox2: TsGroupBox;
    cxGrid2: TcxGrid;
    GridViewRule: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    sPanel1: TsPanel;
    btnAddRule: TsButton;
    btnClose: TsButton;
    sTimePicker1: TsTimePicker;
    sTimePicker2: TsTimePicker;
    edtRuleName: TsEdit;
    FDQueryRule: TFDQuery;
    DataSourceRule: TDataSource;
    procedure btnSearchClick(Sender: TObject);
    procedure GridViewTaskDataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure btnAddClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRuleManageClick(Sender: TObject);
    procedure btnAddRuleClick(Sender: TObject);
  private
    fCxgridFiledsTask, fCxgridFiledsRule, fCxgridFiledsResult: Tcustomcxgridfiled;
    function AddTask: string;
    procedure RunTask(taskId: string);
    procedure LoadRule;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameNocturnal: TFrameNocturnal;

implementation

{$R *.dfm}

procedure TFrameNocturnal.AfterConstruction;
begin
  inherited;
  self.dterq.Date := Trunc(Now-1);
  self.dterq2.Date := Trunc(Now+1);
  self.sDateEdit1.Date := Trunc(now - 1/24);
  self.sDateEdit2.Date := Trunc(now);

  fCxgridFiledsTask:=Tcustomcxgridfiled.Create(ExtractFilePath(ParamStr(0))+'qtcs.txt');
  fCxgridFiledsTask.width:=ClientWidth;
  fCxgridFiledsTask.customfileds:='TaskId, TaskName, LightBegin, LightEnd, BeginTime, EndTime, CreateTime, FinishTime, Status';
  fCxgridFiledsTask.CxgridView:= GridViewTask;
  fCxgridFiledsTask.setcxgirdviewfield;
  GridViewTask.Columns[0].Visible := false;

  fCxgridFiledsResult:=Tcustomcxgridfiled.Create(ExtractFilePath(ParamStr(0))+'qtcs.txt');
  fCxgridFiledsResult.width:=ClientWidth;
  fCxgridFiledsResult.customfileds:='HPHM, HPZLMC, NUM';
  fCxgridFiledsResult.CxgridView:= GridViewResult;
  fCxgridFiledsResult.setcxgirdviewfield;

  fCxgridFiledsRule:=Tcustomcxgridfiled.Create(ExtractFilePath(ParamStr(0))+'qtcs.txt');
  fCxgridFiledsRule.width:=ClientWidth;
  fCxgridFiledsRule.customfileds:='RuleName, LightBegin, LightEnd';
  fCxgridFiledsRule.CxgridView:= GridViewRule;
  fCxgridFiledsRule.setcxgirdviewfield;

  btnSearchClick(nil);
  LoadRule;
end;

procedure TFrameNocturnal.LoadRule;
begin
  with FDQueryRule do
  begin
    close;
    sql.Clear;
    sql.Add('select SystemID, RuleName, LightBegin, LightEnd ');
    sql.Add('from T_Analyse_NocturnalRule ');
    open;
  end;
end;

procedure TFrameNocturnal.btnAddClick(Sender: TObject);
begin
  inherited;
  self.sGroupBox1.Left := (cxGrid1.Width - sGroupBox1.Width) div 2;
  self.sGroupBox1.Show;
  self.spnl1.Enabled := false;
  self.cxGrid1.Enabled := false;
  self.edtName.Text := 'Task' + FormatDateTime('yymmddhhmm', now);
end;

procedure TFrameNocturnal.btnAddRuleClick(Sender: TObject);
var
  taskid, sql: string;
begin
  inherited;
  taskid := TGuid.NewGuid.ToString;
  sql := 'insert into T_Analyse_NocturnalRule(SYSTEMID, RuleName, LightBegin, LightEnd)'
    + 'values('''+taskid+''','''+edtRuleName.Text+''', '''
    +sTimePicker1.Text+''', '''+sTimePicker2.Text+''') ';
  try
    if dm.conServer.ExecSQL(sql) > 0 then
    begin
      FDQueryRule.Close;
      FDQueryRule.Open;
    end;
  finally

  end;
end;

procedure TFrameNocturnal.btnSearchClick(Sender: TObject);
begin
  inherited;
  if NOT Assigned(FrmPrompt) then Application.CreateForm(TFrmPrompt,FrmPrompt);
  FrmPrompt.spnl2.Caption:='正在查询分析结果，请稍候......';
  FrmPrompt.Show;
  FrmPrompt.Update;
  with FDQueryTask do
  begin
    close;
    sql.Clear;
    sql.Add('select SYSTEMID as TaskId, TaskName, LightBegin, LightEnd, BeginTime, EndTime, CreateTime, FinishTime, Status ');
    sql.Add('from T_Analyse_NocturnalTask ');
    sql.Add('where CreateTime >= :BEGINTIME AND CreateTime < :ENDTIME ');
    sql.Add('order by CreateTime desc');
    Params.ParamByName('BEGINTIME').Value := dterq.Date;
    Params.ParamByName('ENDTIME').Value := dterq2.Date;
    open;
  end;
  frmprompt.Close();
end;

procedure TFrameNocturnal.GridViewTaskDataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
var
  id, status: string;
begin
  inherited;
  id := ADataController.GetValue(ARecordIndex, 0);
  status := ADataController.GetValue(ARecordIndex, 8);
  if status = '完成' then
  begin
    with FDQueryResult do
    begin
      close;
      sql.Clear;
      sql.Add('select TaskId, HPHM, HPZL, HPZLMC, NUM ');
      sql.Add('from T_Analyse_NocturnalTask_Result ');
      sql.Add('where TaskId = :id ');
      sql.Add('order by NUM desc');
      Params.ParamByName('id').Value := id;
      open;
    end;
  end;
end;

procedure TFrameNocturnal.RunTask(taskId: string);
begin
  // TODO: Run Task
end;

procedure TFrameNocturnal.btnCancelClick(Sender: TObject);
begin
  inherited;
  self.sGroupBox1.Hide;
  self.spnl1.Enabled := true;
  self.cxGrid1.Enabled := true;
  self.FDQueryTask.Close;
  self.FDQueryTask.Open;
end;

procedure TFrameNocturnal.btnCloseClick(Sender: TObject);
begin
  inherited;
  self.sGroupBox2.Hide;
  self.spnl1.Enabled := true;
  self.cxGrid1.Enabled := true;
end;

procedure TFrameNocturnal.btnDeleteClick(Sender: TObject);
var
  taskId, sql: string;
begin
  inherited;
  if GridViewTask.DataController.FocusedRecordIndex = -1 then exit;
  if Application.MessageBox('真的要删除吗？', '删除任务', MB_YESNO) = 6 then
  begin
    taskId := GridViewTask.DataController.Values[GridViewTask.DataController.FocusedRecordIndex, 0];
    sql := 'delete from T_Analyse_NocturnalTask where systemid=''' + taskId + ''' ';
    sql := sql +'delete from T_Analyse_NocturnalTask_result where taskid=''' + taskId + ''' ';
    dm.conServer.ExecSQL(sql);
    self.FDQueryTask.Close;
    self.FDQueryTask.Open;
  end;
end;

procedure TFrameNocturnal.btnOKClick(Sender: TObject);
var
  taskid: string;
begin
  inherited;
  taskid := AddTask;
  if taskid <> '' then
  begin
    btnCancelClick(nil);
    RunTask(taskid);
  end;
end;

procedure TFrameNocturnal.btnRuleManageClick(Sender: TObject);
begin
  inherited;
  self.sGroupBox2.Left := (cxGrid1.Width - sGroupBox2.Width) div 2;
  self.sGroupBox2.Show;

  self.spnl1.Enabled := false;
  self.cxGrid1.Enabled := false;
end;

function TFrameNocturnal.AddTask: string;
var
  taskid, sql, sbddmc, beginTime, endTime, LightBegin, LightEnd: string;
  I: Integer;
begin
  result := '';
  taskid := TGuid.NewGuid.ToString;
  LightBegin := '07:00:00';
  LightEnd := '18:00:00';
  sql := 'insert into T_Analyse_NocturnalTask(SYSTEMID, TaskName, LightBegin, LightEnd, BeginTime, EndTime, CreateTime, CreateBy, Status)'
    + 'values('''+taskid+''','''+edtName.Text+''', '''
    +LightBegin+''', '''+LightEnd+''', '''
    +sDateEdit1.Text+''', '''+sDateEdit2.Text+''',getdate(),'''+gUser.YHBH+''',''分析中,请勿退出'') ';
  try
    if dm.conServer.ExecSQL(sql) > 0 then
      result := taskid;
  finally

  end;
end;

end.
