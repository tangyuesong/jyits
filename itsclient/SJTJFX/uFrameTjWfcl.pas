unit uFrameTjWfcl;

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
  sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxRadioGroup, uRequestItf, uJsonUtils,
  uCommon, cxGridChartView, cxGridDBChartView, Dateutils, System.Actions,
  Vcl.ActnList, uFrameZDTotal;

type
  TFrameTjWfcl = class(TdxGridFrame)
    RDYear: TcxRadioButton;
    dxLayoutItem1: TdxLayoutItem;
    RDMonth: TcxRadioButton;
    dxLayoutItem2: TdxLayoutItem;
    RDDate: TcxRadioButton;
    dxLayoutItem4: TdxLayoutItem;
    DTKSSJ: TcxDateEdit;
    dxDTKSSJ: TdxLayoutItem;
    DTJSSJ: TcxDateEdit;
    dxDTJSSJ: TdxLayoutItem;
    BtnSearch: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    BtnExport: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    CbbYear: TcxComboBox;
    dxYEAR: TdxLayoutItem;
    CbbMonth: TcxComboBox;
    dxMonth: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    procedure RDYearClick(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
  private
    fZdTotal: TFrameZDTotal;
    Param: String;
  protected
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTjWfcl: TFrameTjWfcl;

implementation

{$R *.dfm}

procedure TFrameTjWfcl.actViewExecute(Sender: TObject);
var
  params: String;
begin
  inherited;
  if not Assigned(fZdTotal) then
  begin
    fZdTotal := TFrameZDTotal.Create(self);
    fZdTotal.Parent := self;
    fZdTotal.Align := TAlign.alClient;
  end;
  params := Param + '&cljgmc=' + FDMemTable1.FieldByName('cljgmc').AsString +
    '&lrr=' + FDMemTable1.FieldByName('lrr').AsString;
  //fZdTotal.NoColumns := 'WFXW';
  fZdTotal.ColumnStrs :=
    'HPHM, HPZL, JDCSYR, DSR, jszh, WFXWDM, WFXW, WFSJ, WFDZ, CLJGMC, LRR, CLSJ, ZSXXDZ';
  fZdTotal.Show;
  Application.ProcessMessages;
  sleep(50);
  fZdTotal.Query('GetWFCLTJDetail', params);
end;

procedure TFrameTjWfcl.AfterConstruction;
var
  i: Integer;
  iyear: Integer;
  Smonth: string;
begin
  inherited;
  GridColumns := 'cljgmc,lrr,zs,操作';
  GridView.Columns[3].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := true;
  DTKSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now - 7));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now));
  iyear := 2011;
  for i := 0 to 100 do
  begin
    iyear := iyear + 1;
    CbbYear.Properties.Items.Add(iyear.ToString + '年');
    if iyear.ToString = FormatDateTime('yyyy', now) then
      Break;
  end;
  for i := 1 to 12 do
  begin
    Smonth := i.ToString;
    if i < 10 then
      Smonth := '0' + Smonth;
    CbbMonth.Properties.Items.Add(Smonth + '月')

  end;
  RDMonth.Checked := true;
end;

procedure TFrameTjWfcl.BtnExportClick(Sender: TObject);
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

procedure TFrameTjWfcl.BtnSearchClick(Sender: TObject);
var
  s: string;
  y, m, sDate, sDate2: string;
begin
  inherited;
  if (RDYear.Checked) and (CbbYear.Text = '') then
  begin
    Application.MessageBox('请选择统计年份', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  if (RDMonth.Checked) and ((CbbYear.Text = '') or (CbbMonth.Text = '')) then
  begin
    Application.MessageBox('请选择统计年份月份', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  y := Copy(CbbYear.Text, 1, 4);
  m := Copy(CbbMonth.Text, 1, 2);
  if RDYear.Checked then
  begin
    sDate := y + '/01/01';
    sDate2 := inttostr(strtoint(y) + 1) + '/01/01';
  end;
  if RDMonth.Checked then
  begin
    sDate := y + '/' + m + '/' + '01';
    sDate2 := FormatDateTime('yyyy/mm/dd',
      EndoftheMonth(VarToDateTime(sDate)) + 1);
  end;
  if RDDate.Checked then
  begin
    sDate := DTKSSJ.Text;
    sDate2 := DTJSSJ.Text;
  end;
  Param := 'kssj=' + sDate + '&jssj=' + sDate2;
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetWFCLTJ', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  FreeFrameWait;
end;

procedure TFrameTjWfcl.RDYearClick(Sender: TObject);
begin
  inherited;
  if RDYear.Checked then
  begin
    dxYEAR.Visible := true;
    dxMonth.Visible := False;
    dxDTKSSJ.Visible := False;
    dxDTJSSJ.Visible := False;
  end
  else if RDMonth.Checked then
  begin
    dxYEAR.Visible := true;
    dxMonth.Visible := true;
    dxDTKSSJ.Visible := False;
    dxDTJSSJ.Visible := False;
  end
  else if RDDate.Checked then
  begin
    dxYEAR.Visible := False;
    dxMonth.Visible := False;
    dxDTKSSJ.Visible := true;
    dxDTJSSJ.Visible := true;
  end;
  if RDYear.Checked then
    CbbYear.ItemIndex := CbbYear.Properties.Items.Count - 2;
  if RDMonth.Checked then
  begin
    CbbYear.ItemIndex := CbbYear.Properties.Items.Count - 1;
    CbbMonth.Text := FormatDateTime('MM', now) + '月';
  end;
end;

end.
