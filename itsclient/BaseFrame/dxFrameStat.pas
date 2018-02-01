unit dxFrameStat;

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
  Vcl.ActnList;

type
  TFrameStat = class(TdxGridFrame)
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
    dxLayoutItem12: TdxLayoutItem;
    cxGrid2: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    dxLayoutGroup1: TdxLayoutGroup;
    ChartView: TcxGridDBChartView;
    procedure RDYearClick(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
  private
    Fdate: string;
    Fdate2: string;
    FJkid: string;
    Fparam: string;
    Floginfo: string;
    FCreateCol: Boolean;
    { Private declarations }
  protected
    property sDate: string read Fdate write Fdate;
    property sDate2: string read Fdate2 write Fdate2;
    property Jkid: string read FJkid write FJkid;
    property Param: string read Fparam write Fparam;
    property CreateCol: Boolean read FCreateCol write FCreateCol;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameStat: TFrameStat;

implementation

{$R *.dfm}

procedure TFrameStat.AfterConstruction;
var
  i: Integer;
  iyear: Integer;
  Smonth: string;
begin
  inherited;
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
  RDMonth.Checked := True;
  CreateCol := False;
end;

procedure TFrameStat.BtnExportClick(Sender: TObject);
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

procedure TFrameStat.BtnSearchClick(Sender: TObject);
var
  s: string;
  y, m, period: string;
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
    period := 'y';
  end;
  if RDMonth.Checked then
  begin
    sDate := y + '/' + m + '/' + '01';
    sDate2 := FormatDateTime('yyyy/mm/dd',
      EndoftheMonth(VarToDateTime(sDate)) + 1);
    period := 'm';
  end;
  if RDDate.Checked then
  begin
    sDate := DTKSSJ.Text;
    sDate2 := DTJSSJ.Text;
    period := 'd';
  end;
  Param := 'kssj=' + sDate + '&jssj=' + sDate2 + '&period=' + period + Param;
  Floginfo := Param.Replace('&', ',');
  ShowFrameWait;
  s := TRequestItf.pDbQuery(Jkid, Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', CreateCol);
  FreeFrameWait;
end;

procedure TFrameStat.RDYearClick(Sender: TObject);
begin
  inherited;
  if RDYear.Checked then
  begin
    dxYEAR.Visible := True;
    dxMonth.Visible := False;
    dxDTKSSJ.Visible := False;
    dxDTJSSJ.Visible := False;
  end
  else if RDMonth.Checked then
  begin
    dxYEAR.Visible := True;
    dxMonth.Visible := True;
    dxDTKSSJ.Visible := False;
    dxDTJSSJ.Visible := False;
  end
  else if RDDate.Checked then
  begin
    dxYEAR.Visible := False;
    dxMonth.Visible := False;
    dxDTKSSJ.Visible := True;
    dxDTJSSJ.Visible := True;
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
