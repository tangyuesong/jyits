unit UToolYJQSFK;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkinsdxBarPainter, dxBar, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, uCommon,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  cxEditRepositoryItems, sDialogs, uFrameSignBase, uEntity, dxPicData,
  uFrameFeedbackBase, System.Actions, Vcl.ActnList, cxLabel, cxCheckBox,
  cxCheckComboBox, uFrameSelectDev;

type
  TToolYJQSFK = class(TToolGridFrame)
    btnSign: TdxBarLargeButton;
    btnFeedback: TdxBarLargeButton;
    btnDetail: TdxBarLargeButton;
    dtBegin: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    dtEnd: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    cboJC: TcxComboBox;
    edtHPHM: TcxTextEdit;
    btnSearch: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    BtnExport: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    cmbSource: TcxComboBox;
    dxLayoutItem9: TdxLayoutItem;
    cboYJLX: TcxCheckComboBox;
    dxLayoutItem7: TdxLayoutItem;
    btnExportAll: TcxButton;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    cbbwfdd: TcxComboBox;
    dxLayoutItem11: TdxLayoutItem;
    procedure acteditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure edtHPHMKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure btnExportAllClick(Sender: TObject);
    procedure cbbwfddMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FDev: TFrameSelectDev;
    FExportAllParam: String;
    FFrameFeedback: TFrameFeedbackBase;
    FFrameSign: TFrameSignBase;
    FDetail: TdxFramePicData;
    function Feedbacked(yjxh: string): boolean;
    function GetYJLX: string;
    function GetBKLXList(): TStrings;
    procedure DevSaveClick(Sender: TObject);
    procedure DevExitClick(Sender: TObject);
  protected
    procedure LoadData; override;
  public
    procedure AfterConstruction; override;
  end;

var
  ToolYJQSFK: TToolYJQSFK;

implementation

uses
  uDictionary, uRequestItf, UJSONUtils, uGlobal;
{$R *.dfm}

function TToolYJQSFK.GetBKLXList: TStrings;
var
  s, v: string;
  str: TStringList;
begin
  str := TStringList.Create;
  str.Sort;
  str.Sorted := True;
  for s in TLZDictionary.gDicMain['BKLX'].Keys do
    str.Add(s);
  Result := str;
end;

function TToolYJQSFK.GetYJLX: string;
var
  s: string;
begin
  Result := '';
  s := Trim(cboYJLX.Text);
  if copy(s, 1, 4) = 'None' then
    exit;

  for s in s.Split([';']) do
    Result := Result + Trim(s).Substring(0, 2) + ',';
  if Result <> '' then
    Result := copy(Result, 1, length(Result) - 1);
end;

procedure TToolYJQSFK.acteditExecute(Sender: TObject);
var
  alarm: TAlarmResult;
begin
  inherited;
  alarm := TJSONUtils.TableToRecord<TAlarmResult>(FDMemTable1);
  if Feedbacked(alarm.GCXH) then
    Application.MessageBox('已反馈！', '提示')
  else
  begin
    if not Assigned(FFrameFeedback) then
    begin
      FFrameFeedback := TFrameFeedbackBase.Create(self);
      FFrameFeedback.Parent := self;
      FFrameFeedback.Align := TAlign.alClient;
    end;
    FFrameFeedback.DataTable := self.FDMemTable1;
    FFrameFeedback.Show;
  end;
end;

procedure TToolYJQSFK.actViewExecute(Sender: TObject);
begin
  inherited;
  if (not FDMemTable1.Active) or FDMemTable1.Eof then
    exit;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(self);
    FDetail.Parent := self;
    FDetail.Align := TAlign.alClient;
  end;
  FDetail.HPHM := FDMemTable1.FieldByName('HPHM').AsString;
  FDetail.HPZL := FDMemTable1.FieldByName('HPZL').AsString;
  FDetail.LoadPassList;
  FDetail.Show;
end;

procedure TToolYJQSFK.AfterConstruction;
  procedure AddYJLXItem(code, desc: string);
  begin
    with cboYJLX.Properties.Items.Add do
    begin
      Description := desc;
      ShortDescription := code + ' ' + desc;
    end;
  end;

var
  Key: String;
  bklxs: TStrings;
begin
  inherited;
  FExportAllParam := '';
  dtBegin.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now - 1));
  dtEnd.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now + 1));
  if TLZDictionary.gDicMain.ContainsKey('JC') then
  begin
    TLZDictionary.BindCombobox(cboJC, TLZDictionary.gDicMain['JC'], True);
    cboJC.ItemIndex := 18;
  end;
  if TLZDictionary.gDicMain.ContainsKey('BKLX') then
  begin
    // TLZDictionary.BindCombobox(cboYJLX, TLZDictionary.gDicMain['BKLX'], true);
    bklxs := GetBKLXList;
    for Key in bklxs do
      AddYJLXItem('', Key + ':' + TLZDictionary.gDicMain['BKLX'][Key]);
    bklxs.Free;
  end;

  GridColumns := 'BKLX,HPZL,HPHM,DWDM,KDBH,CD,GCSJ,Local,FEEDBACK,操作';
  GridView.Columns[9].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Hint := '签收';
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Hint := '反馈';
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Hint := '详细';
end;

procedure TToolYJQSFK.btnExportAllClick(Sender: TObject);
var
  table: TFDMemTable;
  ts: TStrings;
  s: String;
begin
  inherited;
  if FExportAllParam = '' then
    exit;
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    table := TFDMemTable.Create(nil);
    s := TRequestItf.DbQuery('GetAlarmResult', FExportAllParam);
    TJSONUtils.JSONToDataSet(s, table);
    if table.Active then
    begin
      ts := TStringList.Create;
      s := '布控类型'#9'号牌种类'#9'号牌号码'#9'单位代码'#9'地点名称'#9'车道'#9'过车时间'#9'预警来源'#9'反馈';
      ts.Add(s);
      table.First;
      while not table.Eof do
      begin
        if TLZDictionary.gDicMain['BKLX'].ContainsKey(table.FieldByName('BKLX')
          .AsString) then
          s := TLZDictionary.gDicMain['BKLX']
            [table.FieldByName('BKLX').AsString] + #9
        else
          s := table.FieldByName('BKLX').AsString + #9;
        if TLZDictionary.gDicMain['HPZL'].ContainsKey(table.FieldByName('HPZL')
          .AsString) then
          s := s + TLZDictionary.gDicMain['HPZL']
            [table.FieldByName('HPZL').AsString] + #9
        else
          s := s + table.FieldByName('HPZL').AsString + #9;
        s := s + table.FieldByName('HPHM').AsString + #9;
        if TLZDictionary.gDicDept.ContainsKey(table.FieldByName('DWDM').AsString)
        then
          s := s + TLZDictionary.gDicDept
            [table.FieldByName('DWDM').AsString].DWMC + #9
        else
          s := s + table.FieldByName('DWDM').AsString + #9;
        if TLZDictionary.gDicDev[2].ContainsKey(table.FieldByName('KDBH')
          .AsString) then
          s := s + TLZDictionary.gDicDev[2][table.FieldByName('KDBH').AsString]
            .SBDDMC + #9
        else
          s := s + table.FieldByName('KDBH').AsString + #9;
        s := s + table.FieldByName('CD').AsString + #9 +
          table.FieldByName('GCSJ').AsString + #9 + table.FieldByName('Local')
          .AsString + #9 + table.FieldByName('FEEDBACK').AsString;
        ts.Add(s);
        table.Next;
      end;
      ts.SaveToFile(dlgSave.FileName);
      ts.Free;
      FreeFrameWait;
      Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin
      FreeFrameWait;
      Application.MessageBox('导出失败', '提示', MB_OK + MB_ICONERROR);
    end;
    table.Free;
  end;
end;

procedure TToolYJQSFK.BtnExportClick(Sender: TObject);
begin
  inherited;
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    Tcommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    FreeFrameWait;
    Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

function TToolYJQSFK.Feedbacked(yjxh: string): boolean;
var
  json: string;
begin
  json := TRequestItf.DbQuery('GetFeedback',
    'yjxh=' + yjxh + '&FKBJ=1&feedbackresult=1'); // 未反馈
  Result := json <> '';
end;

procedure TToolYJQSFK.LoadData;
var
  Param: string;
  s: string;
  beginTime: Double;
  pageSize, pageIndex: Integer;
begin
  inherited;
  beginTime := dtBegin.Date;
  // if (cboZT.Text = '未签收') and (dtEnd.Date - beginTime > 1 / 24 / 2) then
  // beginTime := dtEnd.Date - 1 / 24 / 2;
  Param := Format('yhbh=%s&begin_GCSJ=%s&end_GCSJ=%s',
    [gUser.YHBH, FormatDateTime('yyyy/mm/dd', beginTime),
    FormatDateTime('yyyy/mm/dd', dtEnd.Date)]);
  Param := Param + '&zt=';
  Param := Param + '&BKLX=' + GetYJLX;
  // if cboYJLX.Text <> '' then
  // Param := Param + TLZDictionary.StrtoDicInfo(cboYJLX.Text).dm;
  Param := Param + '&HPHM=';
  if edtHPHM.Text <> '' then
    Param := Param + TLZDictionary.StrtoDicInfo(cboJC.Text).mc + edtHPHM.Text;
  Param := Param + '&Source=' + cmbSource.Text;
  Param := Param + '&kdbh=' + cbbwfdd.Text;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  FExportAllParam := Param;
  Param := Param + Format('&rows=%s&start=%s',
    [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetAlarmResult', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible :=
    btnFeedback.Enabled;
  FreeFrameWait;
end;

procedure TToolYJQSFK.btnSearchClick(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TToolYJQSFK.cbbwfddMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Key: string;
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
  for Key in TLZDictionary.gDicDev[1].Keys do
  begin
    dev := TLZDictionary.gDicDev[1][Key];
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

procedure TToolYJQSFK.DevExitClick(Sender: TObject);
begin
  if Assigned(FDev) then
    FDev.Visible := false;
  dxLayoutControl2Group_Root.Visible := True;
end;

procedure TToolYJQSFK.DevSaveClick(Sender: TObject);
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
  while not FDev.tb.Eof do
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

procedure TToolYJQSFK.edtHPHMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSearchClick(nil);
end;

end.
