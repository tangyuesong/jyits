unit uPassSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGridFrame, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, cxTextEdit, Vcl.StdCtrls, cxButtons,
  cxDropDownEdit, cxMaskEdit, cxCalendar, dxPicData, System.Actions,
  Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCheckBox,
  System.Generics.Collections, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxGridWinExplorerView, cxGridDBWinExplorerView, uDM,
  cxCheckComboBox, uGlobal;

type
  TFramePassSearch = class(TdxGridFrame)
    dtBegin: TcxDateEdit;
    dtEnd: TcxDateEdit;
    btnSearch: TcxButton;
    liKDBH: TdxLayoutItem;
    cboKDBH: TcxComboboxExt;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    cboJC: TcxComboBox;
    edtHPHM: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    cboHPZL: TcxComboBox;
    ActionList1: TActionList;
    ActionPicture: TAction;
    ActionViewList: TAction;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    cboClpp: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    btnReSet: TcxButton;
    dxLayoutItem23: TdxLayoutItem;
    cboZyb: TcxComboBox;
    dxLayoutItem9: TdxLayoutItem;
    edtClpp1: TcxTextEdit;
    dxLayoutItem24: TdxLayoutItem;
    cxdtrpstry1ImageItem1: TcxEditRepositoryImageItem;
    FDMemTable2: TFDMemTable;
    DataSource2: TDataSource;
    FDMemTable2tp: TBlobField;
    FDMemTable2nr: TStringField;
    cxGrid1DBWinExplorerView1: TcxGridDBWinExplorerView;
    cxGrid1DBWinExplorerView1Item1: TcxGridDBWinExplorerViewItem;
    cxGrid1DBWinExplorerView1Item2: TcxGridDBWinExplorerViewItem;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem26: TdxLayoutItem;
    btnView: TcxButton;
    cxCKBOXCSYS: TcxCheckComboBox;
    dxLayoutItem25: TdxLayoutItem;
    Timer1: TTimer;
    procedure btnSearchClick(Sender: TObject);
    procedure ActionViewListExecute(Sender: TObject);
    procedure ActionPictureExecute(Sender: TObject);
    procedure GridViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edtHPHMKeyPress(Sender: TObject; var Key: Char);
    procedure btnReSetClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure FDMemTable2AfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
  private
    FParams: String;
    FIsLoadPic: Boolean;
    FBeginTime, FEndTime, FKDBH, FHPHM, FHPZL: string;
    FDetail: TdxFramePicData;
    gClpp: TDictionary<string, string>;
    procedure InitTb();
    function GetClpp(): String;
    function GetClpp1(): String;
    function GetCsys(): String;
    function GetZyb(): String;
    procedure ShowPicView();
    // function GetPageCount: integer;
  protected
    procedure LoadData; override;
  public
    procedure AfterConstruction; override;
  end;

var
  FramePassSearch: TFramePassSearch;

implementation

uses
  uDictionary, uRequestItf, uJsonUtils, uCommon;
{$R *.dfm}

procedure TFramePassSearch.ActionPictureExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(self);
    FDetail.Parent := self;
    FDetail.Align := TAlign.alClient;
  end;
  // FDetail.URL := FDMemTable1.FieldByName('FWQDZ').AsString +
  // FDMemTable1.FieldByName('TP1').AsString;
  FDetail.GCTable := FDMemTable1;
  FDetail.Show;
end;

procedure TFramePassSearch.ActionViewListExecute(Sender: TObject);
begin
  inherited;
  if FDMemTable1.FieldByName('HPHM').AsString = '-' then
    exit;
  ShowFrameWait;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(self);
    FDetail.Parent := self;
    FDetail.Align := TAlign.alClient;
  end;
  FDetail.HPHM := FDMemTable1.FieldByName('HPHM').AsString;
  FDetail.HPZL := FDMemTable1.FieldByName('HPZL').AsString;
  FDetail.BeginTime := dtBegin.Date;
  FDetail.EndTime := dtEnd.Date;
  FDetail.LoadPassList;
  FDetail.Show;
  FreeFrameWait;
end;

procedure TFramePassSearch.AfterConstruction;
var
  tb: TFDMemTable;
  s, dm, mc: String;
begin
  inherited;

  FIsLoadPic := False;
  dtBegin.Date := now - 1;
  dtEnd.Date := now;
  TLZDictionary.BindCombobox(cboHPZL, TLZDictionary.gDicMain['HPZL'], true);
  cboHPZL.ItemIndex := 1;
  TLZDictionary.BindCombobox(cboJC, TLZDictionary.gDicMain['JC'], true);
  cboJC.ItemIndex := 18;
  TLZDictionary.BindComboboxDEV(cboKDBH);
  GridColumns := 'HPHM,HPZL,GCSJ,KDBH,CDBH,CLSD,CLPP,CSYS,详细信息';

  GridView.Columns[8].Width := 160;
  gClpp := TDictionary<string, string>.Create;

  s := TRequestItf.DbQuery('GetD_K08_CLPP');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(s, tb, 'MC', true, [ixPrimary]);
    tb.First;
    while not tb.Eof do
    begin
      dm := tb.FieldByName('Vehiclelogo').AsString;
      mc := tb.FieldByName('MC').AsString;
      if not gClpp.ContainsKey(dm) then
      begin
        mc := tb.FieldByName('MC').AsString;
        if pos('-', mc) > 0 then
          mc := copy(mc, 1, pos('-', mc) - 1);
        gClpp.Add(dm, mc);
        cboClpp.Properties.Items.Add(mc);
      end;
      tb.Next;
    end;
    tb.Free;
  end;
end;

procedure TFramePassSearch.btnReSetClick(Sender: TObject);
begin
  inherited;
  // cboClpp.Text := '';
  // cboKDBH.Text := '';
  // edtHPHM.Text := '';
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    Tcommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    FreeFrameWait;
    Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFramePassSearch.btnSearchClick(Sender: TObject);
begin
  inherited;
  dxLayoutControl2Group_Root.Enabled := False;
  FBeginTime := FormatDateTime('yyyymmddhhmmss', dtBegin.Date);
  FEndTime := FormatDateTime('yyyymmddhhmmss', dtEnd.Date);
  FKDBH := '';
  FHPHM := '';
  if cboKDBH.Text <> '' then
  begin
    FKDBH := TLZDictionary.GetKey('DEV', '', cboKDBH.Text);
  end;
  if edtHPHM.Text <> '' then
  begin
    FHPZL := TLZDictionary.StrtoDicInfo(cboHPZL.Text).dm;
    FHPHM := TLZDictionary.StrtoDicInfo(cboJC.Text).mc + edtHPHM.Text;
  end;
  edtPageIndex.Text := '0';
  LoadData;
  dxLayoutControl2Group_Root.Enabled := true;
end;

procedure TFramePassSearch.btnViewClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active then
    exit;
  if cxGrid1Level1.GridView = cxGrid1DBWinExplorerView1 then
  begin
    cxGrid1.LookAndFeel.SkinName := 'HybridApp';
    cxGrid1Level1.GridView := GridView;
  end
  else
  begin
    if not FIsLoadPic then
    begin
      dxLayoutControl2Group_Root.Enabled := False;
      ShowFrameWait;
      FIsLoadPic := true;
      ShowPicView;
      FreeFrameWait;
      dxLayoutControl2Group_Root.Enabled := true;
    end
    else
    begin
      cxGrid1.LookAndFeel.SkinName := 'Office2013White';
      cxGrid1Level1.GridView := cxGrid1DBWinExplorerView1;
    end;
  end;
end;

procedure TFramePassSearch.edtHPHMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSearchClick(nil);
end;

procedure TFramePassSearch.FDMemTable2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  FDMemTable1.RecNo := FDMemTable2.RecNo;
end;

procedure TFramePassSearch.GridViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ActionPictureExecute(nil);
end;

procedure TFramePassSearch.InitTb;
begin
  FDMemTable1.Close;
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.IndexDefs.Clear;
  FDMemTable1.FieldDefs.Add('HPHM', ftString, 100);
  FDMemTable1.FieldDefs.Add('HPZL', ftString, 100);
  FDMemTable1.FieldDefs.Add('GCSJ', ftString, 100);
  FDMemTable1.FieldDefs.Add('KDBH', ftString, 100);
  FDMemTable1.FieldDefs.Add('CDBH', ftString, 100);
  FDMemTable1.FieldDefs.Add('CLSD', ftString, 100);
  FDMemTable1.FieldDefs.Add('CLPP', ftString, 100);
  FDMemTable1.FieldDefs.Add('CSYS', ftString, 100);
  FDMemTable1.FieldDefs.Add('FWQDZ', ftString, 500);
  FDMemTable1.FieldDefs.Add('TP1', ftString, 500);
  FDMemTable1.IndexDefs.Add('index', 'GCSJ', [ixDescending]);
  FDMemTable1.IndexName := 'index';
end;

procedure TFramePassSearch.LoadData;
var
  params, json: string;
  pageSize, pageIndex: integer;
  clpp, csys, zyb, clpp1: String;
begin
  ShowFrameWait;
  pageSize := StrToIntDef(cbbPageSize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  clpp := GetClpp;
  csys := GetCsys;
  clpp1 := GetClpp1;
  zyb := GetZyb;
  if (clpp <> '') or (csys <> '') or (zyb <> '') or (clpp1 <> '') then // K08
  begin
    params := 'kssj=' + FormatDateTime('yyyy-mm-dd', dtBegin.Date) + 'T' +
      FormatDateTime('hh:mm:ss', dtBegin.Date) + '.000Z&jssj=' +
      FormatDateTime('yyyy-mm-dd', dtEnd.Date) + 'T' +
      FormatDateTime('hh:mm:ss', dtEnd.Date) + '.999Z&page=' +
      IntToStr(pageIndex + 1) + '&pagesize=' + pageSize.ToString;
    if FKDBH <> '' then
      params := params + '&kdbh=' + FKDBH;
    if (FHPZL <> '') and (FHPHM <> '') then
      params := params + '&hpzl=' + FHPZL + '&hphm=' + FHPHM;
    if clpp <> '' then
      params := params + '&clpp=' + clpp;
    if csys <> '' then
      params := params + '&csys=' + csys;
    if zyb <> '' then
      params := params + '&zyb=' + zyb;
    if clpp1 <> '' then
      params := params + '&clpp1=' + clpp1;
    json := TRequestItf.DbQuery('GetK08PassList', params);
  end
  else
  begin
    params := Format
      ('begin_GCSJ=%s&end_GCSJ=%s&rows=%s&start=%s&orderby_desc=gcsj',
      [FBeginTime, FEndTime, pageSize.ToString, pageIndex.ToString]);
    if FKDBH <> '' then
      params := params + '&KDBH=' + FKDBH;
    if (FHPZL <> '') and (FHPHM <> '') then
      params := params + '&HPZL=' + FHPZL + '&HPHM=' + FHPHM;
    json := TRequestItf.DbQuery('GetPassList', params);
  end;
  FParams := params;
  InitTb;
  Application.ProcessMessages;
  TJsonUtils.JSONToDataSet(json, FDMemTable1, '', False);
  btnNextPage.Enabled := FDMemTable1.RecordCount = pageSize;

  if cxGrid1Level1.GridView = cxGrid1DBWinExplorerView1 then
  begin
    ShowPicView;
    FIsLoadPic := true;
  end
  else
  begin
    FIsLoadPic := False;
    cxGrid1.LookAndFeel.SkinName := 'HybridApp';
    cxGrid1Level1.GridView := GridView;
  end;
  FreeFrameWait;
end;

procedure TFramePassSearch.ShowPicView;
begin
  if not FDMemTable1.Active then
    exit;
  cxGrid1.LookAndFeel.SkinName := 'Office2013White';
  cxGrid1Level1.GridView := cxGrid1DBWinExplorerView1;
  FDMemTable2.AfterScroll := nil;
  FDMemTable1.First;
  FDMemTable2.Close;
  FDMemTable2.Open;
  // FDMemTable2.DisableControls;
  while not FDMemTable1.Eof do
  begin
    try
      FDMemTable2.Append;
      FDMemTable2.FieldByName('nr').AsString := FDMemTable1.FieldByName('HPHM')
        .AsString + '  ' + FDMemTable1.FieldByName('GCSJ').AsString;
      TBlobField(FDMemTable2.FieldByName('tp'))
        .LoadFromStream(Tcommon.GetPic(FDMemTable1.FieldByName('FWQDZ')
        .AsString, FDMemTable1.FieldByName('TP1').AsString));
      FDMemTable2.Post;
      Application.ProcessMessages;
    except
    end;
    FDMemTable1.Next;
  end;
  FDMemTable2.First;
  FDMemTable2.AfterScroll := FDMemTable2AfterScroll;
  // FDMemTable2.EnableControls;
end;

procedure TFramePassSearch.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  dxLayoutItem1.Enabled := gHaveK08;
  dxLayoutItem24.Enabled := gHaveK08;
  dxLayoutItem9.Enabled := gHaveK08;
  dxLayoutItem25.Enabled := gHaveK08;
end;

function TFramePassSearch.GetClpp: String;
var
  Key, clpp: String;
begin
  Result := '';
  clpp := Trim(cboClpp.Text);
  if clpp <> '' then
  begin
    for Key in gClpp.Keys do
    begin
      if gClpp[Key] = clpp then
      begin
        Result := Key;
        break;
      end
      else if (Result = '') and (gClpp[Key].Contains(clpp)) then
        Result := Key;
    end;
  end;
end;

function TFramePassSearch.GetClpp1: String;
var
  s, clpp: String;
  tb: TFDMemTable;
begin
  Result := '';
  clpp := Trim(edtClpp1.Text);
  if clpp <> '' then
  begin
    s := TRequestItf.DbQuery('GetD_K08_CLPP', 'like_MC=' + Trim(cboClpp.Text) +
      '-' + Trim(clpp));
    if s <> '' then
    begin
      tb := TFDMemTable.Create(nil);
      TJsonUtils.JSONToDataSet(s, tb, 'MC', true, [ixPrimary]);
      tb.First;
      if not tb.Eof then
        Result := tb.FieldByName('Vehiclesublogo').AsString;
      tb.Free;
    end;
  end;
end;

function TFramePassSearch.GetCsys: String;
var
  I: integer;
begin
  Result := '';
  for I := 0 to cxCKBOXCSYS.Properties.Items.Count - 1 do
  begin
    if cxCKBOXCSYS.States[I] = TcxCheckBoxstate.cbsChecked then
      Result := Result + (I + 1).ToString + ' ';
  end;
  Result := Trim(Result);
end;

function TFramePassSearch.GetZyb: String;
begin
  Result := '';
  if cboZyb.ItemIndex = 1 then
    Result := '2'
  else if cboZyb.ItemIndex = 2 then
    Result := '1'
  else if cboZyb.ItemIndex = 3 then
    Result := '0';
end;

end.
