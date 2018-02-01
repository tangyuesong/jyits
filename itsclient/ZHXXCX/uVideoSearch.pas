unit uVideoSearch;

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
  TFrameVideoSearch = class(TdxGridFrame)
    dtBegin: TcxDateEdit;
    dtEnd: TcxDateEdit;
    btnSearch: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    ActionList1: TActionList;
    ActionPicture: TAction;
    ActionViewList: TAction;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLgHumansub: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    cxdtrpstry1ImageItem1: TcxEditRepositoryImageItem;
    FDMemTable2: TFDMemTable;
    DataSource2: TDataSource;
    FDMemTable2tp: TBlobField;
    FDMemTable2nr: TStringField;
    cxGrid1DBWinExplorerView1: TcxGridDBWinExplorerView;
    cxGrid1DBWinExplorerView1Item1: TcxGridDBWinExplorerViewItem;
    cxGrid1DBWinExplorerView1Item2: TcxGridDBWinExplorerViewItem;
    dxLayoutGroup7: TdxLayoutGroup;
    Timer1: TTimer;
    cboTargetType: TcxComboBox;
    dxLayoutItem2: TdxLayoutItem;
    dxLgVehicle: TdxLayoutGroup;
    dxLgtwoWheelVehicle: TdxLayoutGroup;
    dxLgThreeWheelVehicle: TdxLayoutGroup;
    cboAgeGroup: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    cboCyclingType: TcxComboBox;
    cboCyclingPersonNumber: TcxComboBox;
    cboThings: TcxComboBox;
    cboRide: TcxComboBox;
    cboHairStyle: TcxComboBox;
    cboTrousersType: TcxComboBox;
    cboJacketType: TcxComboBox;
    cboMask: TcxComboBox;
    cboHat: TcxComboBox;
    cboBag: TcxComboBox;
    cboGlass: TcxComboBox;
    cboGender: TcxComboBox;
    dxLgHuman: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    cboJacketColor: TcxCheckComboBox;
    cboTrousersColor: TcxCheckComboBox;
    procedure btnSearchClick(Sender: TObject);
    procedure ActionViewListExecute(Sender: TObject);
    procedure ActionPictureExecute(Sender: TObject);
    procedure GridViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure edtHPHMKeyPress(Sender: TObject; var Key: Char);
    procedure FDMemTable2AfterScroll(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
  private
    FParams: String;
    FIsLoadPic: Boolean;
    FBeginTime, FEndTime, FKDBH, FHPHM, FHPZL: string;
    FDetail: TdxFramePicData;
    gClpp: TDictionary<string, string>;
    procedure InitTb();
    procedure ShowPicView();
    // function GetPageCount: integer;
  protected
    procedure LoadData; override;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameVideoSearch: TFrameVideoSearch;

implementation

uses
  uDictionary, uRequestItf, uJsonUtils, uCommon;
{$R *.dfm}

procedure TFrameVideoSearch.ActionPictureExecute(Sender: TObject);
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

procedure TFrameVideoSearch.ActionViewListExecute(Sender: TObject);
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

procedure TFrameVideoSearch.AfterConstruction;
var
  tb: TFDMemTable;
  s, dm, mc: String;
begin
  inherited;

  FIsLoadPic := False;
  dtBegin.Date := now - 1;
  dtEnd.Date := now;

  GridColumns := 'HPHM,HPZL,GCSJ,KDBH,CDBH,CLSD,CLPP,CSYS,œÍœ∏–≈œ¢';

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
      end;
      tb.Next;
    end;
    tb.Free;
  end;
end;

procedure TFrameVideoSearch.btnSearchClick(Sender: TObject);
begin
  inherited;
  dxLayoutControl2Group_Root.Enabled := False;
  FBeginTime := FormatDateTime('yyyymmddhhmmss', dtBegin.Date);
  FEndTime := FormatDateTime('yyyymmddhhmmss', dtEnd.Date);
  FKDBH := '';
  FHPHM := '';

  edtPageIndex.Text := '0';
  LoadData;
  dxLayoutControl2Group_Root.Enabled := true;
end;

procedure TFrameVideoSearch.edtHPHMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSearchClick(nil);
end;

procedure TFrameVideoSearch.FDMemTable2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  FDMemTable1.RecNo := FDMemTable2.RecNo;
end;

procedure TFrameVideoSearch.GridViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  ActionPictureExecute(nil);
end;

procedure TFrameVideoSearch.InitTb;
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

procedure TFrameVideoSearch.LoadData;
var
  params, json: string;
  pageSize, pageIndex: integer;
begin
  ShowFrameWait;
  pageSize := StrToIntDef(cbbPageSize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);

  FreeFrameWait;
end;

procedure TFrameVideoSearch.ShowPicView;
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

procedure TFrameVideoSearch.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
end;

end.
