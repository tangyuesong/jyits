unit uToolVioSearch;

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
  dxSkinsdxBarPainter, cxClasses, dxBar, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, dxLayoutcxEditAdapters,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxDropDownEdit,
  cxMaskEdit, cxCalendar, cxCheckBox, uDM, dxLayoutControlAdapters, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, Udictionary, sDialogs, uCommon, uRequestItf, uGlobal,
  uJsonUtils, uColumnGenerator, uFrameVioEdit, cxEditRepositoryItems,
  System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls, cxLabel;

type
  TToolVioSearch = class(TToolGridFrame)
    deLrB: TcxDateEdit;
    deLrE: TcxDateEdit;
    cbbSf: TcxComboBox;
    edtHphm: TcxTextEdit;
    cbbHpzl: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    cbbType: TcxComboBox;
    dxLayoutItem14: TdxLayoutItem;
    btnSearch: TcxButton;
    btnUpdate: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    fVioEdit: TFrameVioEdit;
    btnExport: TdxBarLargeButton;
    btnInfo: TdxBarLargeButton;
    BtnExport2: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    Timer1: TTimer;
    procedure btnSearchClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnBlackClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure BtnExport2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FParam: string;
    procedure AfterConstruction; override;
    procedure HideEditFrame();
    procedure ShowEditFrame(isEdit: Boolean);
  protected
    procedure LoadData; override;
  public
    { Public declarations }
  end;

var
  ToolVioSearch: TToolVioSearch;

implementation

{$R *.dfm}
{ TToolVioSearch }

procedure TToolVioSearch.acteditExecute(Sender: TObject);
begin
  inherited;
  btnUpdateClick(nil);
end;

procedure TToolVioSearch.actnewExecute(Sender: TObject);
begin
  inherited;
  btnExportClick(nil);
end;

procedure TToolVioSearch.actViewExecute(Sender: TObject);
begin
  inherited;
  btnInfoClick(nil);
end;

procedure TToolVioSearch.AfterConstruction;
begin
  inherited;
  deLrB.Text := FormatDateTime('yyyy/mm/dd', Now() - 1);
  deLrE.Text := FormatDateTime('yyyy/mm/dd', Now());
  TLZDictionary.BindCombobox(cbbSf, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbHpzl, TLZDictionary.gDicMain['HPZL'], True);
  TLZDictionary.BindCombobox(cbbType, TLZDictionary.gDicMain['BJLX'], True);
  GridColumns := 'LRR, HPHM, HPZL, WFSJ, WFDD, WFXW, CD, XZSD, SJSD, WFZT, 操作';
  GridView.Columns[10].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := btnInfo.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible :=
    btnUpdate.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := False;

  BtnExport2.Visible := btnExport.Enabled;
  cbbSf.ItemIndex := 18;
  cbbHpzl.ItemIndex := 1;
  // LoadData;
end;

procedure TToolVioSearch.btnBackClick(Sender: TObject);
begin
  inherited;
  HideEditFrame;
end;

procedure TToolVioSearch.btnBlackClick(Sender: TObject);
begin
  inherited;
  fVioEdit.DoBlack;
  HideEditFrame;
  self.btnSearchClick(nil);
end;

procedure TToolVioSearch.btnDeleteClick(Sender: TObject);
begin
  inherited;
  fVioEdit.DoDelete;
  HideEditFrame;
  self.btnSearchClick(nil);
end;

procedure TToolVioSearch.btnSaveClick(Sender: TObject);
begin
  inherited;
  fVioEdit.DoSave;
  HideEditFrame;
  self.btnSearchClick(nil);
end;

procedure TToolVioSearch.btnSearchClick(Sender: TObject);
begin
  LoadData;
end;

procedure TToolVioSearch.btnUpdateClick(Sender: TObject);
var
  zt: string;
begin
  inherited;
  if (not FDMemTable1.Active) or (FDMemTable1.Eof) then
    exit;
  zt := FDMemTable1.FieldByName('WFZT').AsString;
  if (zt = '2') or (zt = '20') or (zt = '9') or (zt = '4') then
    ShowEditFrame(True)
  else
    Application.MessageBox('该数据已经确认无法修改', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TToolVioSearch.BtnExport2Click(Sender: TObject);
begin
  inherited;
  btnExportClick(nil);
end;

procedure TToolVioSearch.btnExportClick(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active then
    exit;

  if dlgSave.Execute then
  begin
    TCommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    Application.MessageBox('导出成功', '系统提示', 48);
  end;
end;

procedure TToolVioSearch.btnInfoClick(Sender: TObject);
begin
  inherited;
  if (not FDMemTable1.Active) or (FDMemTable1.Eof) then
    exit;
  ShowEditFrame(False);
end;

procedure TToolVioSearch.HideEditFrame;
begin
  fVioEdit.Visible := False;
  self.Visible := True;
end;

procedure TToolVioSearch.LoadData;
var
  pageSize, pageIndex: Integer;
  s: String;
begin
  inherited;
  ShowFrameWait;
  FParam := 'kssj=' + FormatDateTime('yyyy/mm/dd hh:nn:ss', deLrB.Date);
  FParam := FParam + '&jssj=' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
    deLrE.Date);

  if (cbbSf.ItemIndex > -1) and (Trim(edtHphm.Text) <> '') then
  begin
    FParam := FParam + '&hphm=' + TLZDictionary.StrtoDicInfo(cbbSf.Text).mc +
      Trim(edtHphm.Text);
  end
  else
    FParam := FParam + '&hphm=';
  if cbbHpzl.ItemIndex > -1 then
  begin
    FParam := FParam + '&hpzl=' + TLZDictionary.StrtoDicInfo(cbbHpzl.Text).dm;
  end
  else
    FParam := FParam + '&hpzl=';
  if cbbType.ItemIndex >= 0 then
    FParam := FParam + '&zt=' + TLZDictionary.StrtoDicInfo(cbbType.Text).dm
  else
    FParam := FParam + '&zt=';

  FParam := FParam + '&lrr=' + gUser.YHBH + '&isManager=';
  if gUser.Manager then
    FParam := FParam + '1'
  else
    FParam := FParam + '0';

  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  FParam := FParam + Format('&rows=%s&start=%s',
    [pageSize.ToString, pageIndex.ToString]);
  s := TRequestItf.DbQuery('GetVioInfo', FParam);
  TJsonUtils.JSONToDataSet(s, FDMemTable1, '');
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TToolVioSearch.ShowEditFrame(isEdit: Boolean);
begin
  fVioEdit.dxLayoutItem2.Visible := isEdit;
  fVioEdit.dxLayoutItem3.Visible := isEdit;
  fVioEdit.dxLayoutItem4.Visible := isEdit;
  fVioEdit.Parent := self.Parent;
  self.Visible := False;
  fVioEdit.Visible := True;
  fVioEdit.Align := alClient;
  Application.ProcessMessages;
  fVioEdit.LoadVioList(FDMemTable1.FieldByName('WFZT').AsString,
    FDMemTable1.FieldByName('SYSTEMID').AsString);
end;

procedure TToolVioSearch.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  LoadData;
end;

end.
