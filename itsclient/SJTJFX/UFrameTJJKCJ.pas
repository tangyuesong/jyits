unit UFrameTJJKCJ;

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
  System.Actions, DateUtils, StrUtils,
  Vcl.ActnList, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uGlobal,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, uJsonUtils,
  uRequestItf, uCommon, Vcl.ExtCtrls, dxLayoutControlAdapters, Vcl.StdCtrls,
  cxRadioGroup, cxContainer, Vcl.Menus, dxLayoutcxEditAdapters, cxTextEdit,
  cxButtons, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar;

type
  TFrameTJJCCJ = class(TdxGridFrame)
    rbYear: TcxRadioButton;
    dxLayoutItem1: TdxLayoutItem;
    RBmonth: TcxRadioButton;
    dxLayoutItem2: TdxLayoutItem;
    RBDate: TcxRadioButton;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    cmbDeptType: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    CbbYear: TcxComboBox;
    CbbMonth: TcxComboBox;
    DTKSSJ: TcxDateEdit;
    DTJSSJ: TcxDateEdit;
    dxYEAR: TdxLayoutItem;
    dxMonth: TdxLayoutItem;
    dxDTKSSJ: TdxLayoutItem;
    dxDTJSSJ: TdxLayoutItem;
    BtnSearch: TcxButton;
    BtnExport: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    procedure BtnSearchClick(Sender: TObject);
    procedure rbYearClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTJJCCJ: TFrameTJJCCJ;

implementation

{$R *.dfm}

procedure TFrameTJJCCJ.AfterConstruction;
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
    CbbMonth.Properties.Items.Add(Smonth + '月');
  end;
  RBmonth.Checked := True;
  rbYearClick(nil);
  GridColumns := '排名,DWDM,预警数量,已处罚,现场开具文书,接受处理,教育后放行,得分';
end;

procedure TFrameTJJCCJ.BtnExportClick(Sender: TObject);
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

procedure TFrameTJJCCJ.BtnSearchClick(Sender: TObject);
var
  y, m, kssj, jssj, zddm, dwjb, json: string;
begin
  inherited;
  if (rbYear.Checked) and (CbbYear.Text = '') then
  begin
    Application.MessageBox('请选择统计年份', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  if (RBmonth.Checked) and ((CbbYear.Text = '') or (CbbMonth.Text = '')) then
  begin
    Application.MessageBox('请选择统计年份月份', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  y := Copy(CbbYear.Text, 1, 4);
  m := Copy(CbbMonth.Text, 1, 2);
  if rbYear.Checked then
  begin
    kssj := y + '/01/01';
    jssj := inttostr(strtoint(y) + 1) + '/01/01';
  end;
  if RBmonth.Checked then
  begin
    kssj := y + '/' + m + '/' + '01';
    jssj := FormatDateTime('yyyy/mm/dd',
      EndoftheMonth(VarToDateTime(kssj)) + 1);
  end;
  if RBDate.Checked then
  begin
    kssj := DTKSSJ.Text;
    jssj := DTJSSJ.Text;
  end;

  zddm := LeftStr(gUser.Dwdm, 4);
  if cmbDeptType.ItemIndex = 0 then
    dwjb := '4'
  else
    dwjb := '5';
  ShowFrameWait;
  json := TRequestItf.DbQuery('FeedbackStat', 'kssj=' + kssj + '&jssj=' + jssj +
    '&zddm=' + zddm + '&dwjb=' + dwjb);
  TJSONUtils.JSONToDataSet(json, FDMemTable1);
  FreeFrameWait;
end;

procedure TFrameTJJCCJ.rbYearClick(Sender: TObject);
begin
  inherited;
  if rbYear.Checked then
  begin
    dxYEAR.Visible := True;
    dxMonth.Visible := False;
    dxDTKSSJ.Visible := False;
    dxDTJSSJ.Visible := False;
  end
  else if RBmonth.Checked then
  begin
    dxYEAR.Visible := True;
    dxMonth.Visible := True;
    dxDTKSSJ.Visible := False;
    dxDTJSSJ.Visible := False;
  end
  else if RBDate.Checked then
  begin
    dxYEAR.Visible := False;
    dxMonth.Visible := False;
    dxDTKSSJ.Visible := True;
    dxDTJSSJ.Visible := True;
  end;
  if rbYear.Checked then
    CbbYear.ItemIndex := CbbYear.Properties.Items.Count - 2;
  if RBmonth.Checked then
  begin
    CbbYear.ItemIndex := CbbYear.Properties.Items.Count - 1;
    CbbMonth.Text := FormatDateTime('MM', now) + '月';
  end;
end;

end.
