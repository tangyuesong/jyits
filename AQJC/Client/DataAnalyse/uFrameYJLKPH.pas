unit UFrameYJLKPH;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGridFrame, cxGraphics,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, dxLayoutcxEditAdapters, dxpicdata,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, uFrameZDTotal, uEntity,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  Udictionary, uRequestItf, uJsonUtils, cxEditRepositoryItems, sDialogs,
  System.Actions, uGlobal, uCommon, uFrameSelectDev,
  Vcl.ActnList, cxCheckBox, cxCheckComboBox, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxComboBoxExt;

type
  TFrameYJLKPH = class(TdxGridFrame)
    DTKSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    cbbYJLX: TcxCheckComboBox;
    dxLayoutItem8: TdxLayoutItem;
    ActionList1: TActionList;
    ActionDetail: TAction;
    dxLayoutItem4: TdxLayoutItem;
    BtnExport: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    cbbwfdd: TcxComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure GridViewDblClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure cboKDBHMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FDev: TFrameSelectDev;
    FDetail: TdxFramePicData;
    fZdTotal: TFrameZDTotal;
    FTime: String;
    procedure DevSaveClick(Sender: TObject);
    procedure DevExitClick(Sender: TObject);
  protected
    procedure LoadData; override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameYJLKPH: TFrameYJLKPH;

implementation

{$R *.dfm}
{ TFrameYJLKPH }

procedure TFrameYJLKPH.AfterConstruction;
var
  code: string;
begin
  inherited;
  cbbYJLX.Properties.Items.Clear;
  if TLZDictionary.gDicMain.ContainsKey('BKLX') then
  begin
    for code in TLZDictionary.gDicMain['BKLX'].Keys do
    begin
      with cbbYJLX.Properties.Items.Add do
      begin
        Description := code + ' ' + TLZDictionary.gDicMain['BKLX'][code];
        ShortDescription := code;
      end;
    end;
  end;
  DTKSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now - 7));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now));
  // TLZDictionary.BindComboboxDEV(cboKDBH);
  FTime := '';
  GridColumns := '地点名称,预警总数,凌晨最忙时段,凌晨最忙次数,上午最忙时段,' +
    '上午最忙次数,下午最忙时段,下午最忙次数,晚上最忙时段,晚上最忙次数';
end;

procedure TFrameYJLKPH.BtnExportClick(Sender: TObject);
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

procedure TFrameYJLKPH.cboKDBHMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TFrameYJLKPH.cxButton1Click(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameYJLKPH.DevExitClick(Sender: TObject);
begin
  if Assigned(FDev) then
    FDev.Visible := false;
  dxLayoutControl2Group_Root.Visible := True;
end;

procedure TFrameYJLKPH.DevSaveClick(Sender: TObject);
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
  cbbWfdd.Text := ss;
end;

procedure TFrameYJLKPH.GridViewDblClick(Sender: TObject);
var
  params: String;
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.eof then
    exit;
  if FDMemTable1.FieldDefs.IndexOf('KDBH') < 0 then
    exit;
  if not Assigned(fZdTotal) then
  begin
    fZdTotal := TFrameZDTotal.Create(self);
    fZdTotal.Parent := self;
    fZdTotal.Align := TAlign.alClient;
  end;

  params := FTime + '&KDBH=' + FDMemTable1.FieldByName('KDBH').AsString;
  fZdTotal.ColumnStrs := '时间区域,时段,预警次数';
  fZdTotal.Show;
  Application.ProcessMessages;
  sleep(50);
  fZdTotal.Query('stat_YJLKPHFX_Hour', params);

end;

procedure TFrameYJLKPH.LoadData;
var
  vdt, vdt2, zt, HPHM, HPZL, Param, kdbh: string;
  s: string;
  pageSize, pageIndex: Integer;
begin
  inherited;
  vdt := DTKSSJ.Text;
  vdt2 := FormatDateTime('yyyy/mm/dd', DTJSSJ.Date + 1);

  // if cboKDBH.Text <> '' then
  // kdbh := TLZDictionary.GetKey('DEV', '', cboKDBH.Text);
  FTime := Format('beginTime=%s&endTime=%s', [vdt, vdt2]);
  Param := Format('beginTime=%s&endTime=%s&yhbh=%s&kdbh=%s',
    [vdt, vdt2, gUser.yhbh, cbbWfdd.Text]);
  if cbbYJLX.Text <> 'None selected' then
    Param := Param + '&bklx=' + cbbYJLX.Text
  else
    Param := Param + '&bklx=';
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&rows=%s&start=%s',
    [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('stat_YJLKPHFX', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

end.
