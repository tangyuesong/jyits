unit UFrameTJJF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrameStat, cxGraphics,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, cxStyles, cxCustomData, Data.DB, cxDBData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridChartView, cxGridDBChartView,
  cxGrid, cxDropDownEdit, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxRadioGroup, dxLayoutControl, Udictionary, System.Actions,
  Vcl.ActnList, uFrameTJJFDetail;

type
  TFrameTJJF = class(TFrameStat)
    CbbCXFL: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    ChartViewSeries1: TcxGridDBChartSeries;
    ChartViewSeries2: TcxGridDBChartSeries;
    Action1: TAction;
    procedure BtnSearchClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    FDetailFrame: TFrameTJJFDetail;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTJJF: TFrameTJJF;

implementation
uses uColumnGenerator, uLookUpDataSource, uRequestItf, uJSONUtils, dateutils;
{$R *.dfm}

procedure TFrameTJJF.Action1Execute(Sender: TObject);
var
  id, s,y,m,sDate,sDate2,param: string;
begin
  inherited;
  if not Assigned(FDetailFrame) then
  begin
    FDetailFrame := TFrameTJJFDetail.Create(self);
    FDetailFrame.Parent := self;
    FDetailFrame.Top := 60;
    FDetailFrame.Left := (self.Width - FDetailFrame.Width) div 2;
    FDetailFrame.Title := '未计分记录';
  end;

  if RDYear.Checked then
  begin
    y := Copy(CbbYear.Text, 1, 4);
    sDate := y + '/01/01';
    sDate2 := inttostr(strtoint(y)+1) + '/01/01';
  end;
  if RDMonth.Checked then
  begin
    y := Copy(CbbYear.Text, 1, 4);
    m := Copy(CbbMonth.Text, 1, 2);
    sDate := y + '/' + m + '/' + '01';
    sDate2 := FormatDateTime('yyyy/mm/dd', EndoftheMonth(VarToDateTime(sDate))+1);
  end;
  if RDDate.Checked then
  begin
    sDate := DTKSSJ.Text;
    sDate2 := DTJSSJ.Text;
  end;
  param := 'kssj=' + sDate + '&jssj=' + sdate2;
  if GridColumns.Contains('cljgmc') then
  begin
    id := FDMemTable1.FieldByName('cljg').AsString;
    s := TRequestItf.pDbQuery('GetJFCXDetail', param+'&type=1&id=' + id);
  end
  else begin
    id := FDMemTable1.FieldByName('lrr').AsString;
    s := TRequestItf.pDbQuery('GetJFCXDetail', param+'&type=0&id=' + id);
  end;

  TJSONUtils.JSONToDataSet(s, FDetailFrame.FDMemTable1);
  FDetailFrame.Show;
end;

procedure TFrameTJJF.AfterConstruction;
begin
  inherited;
  CbbCXFL.Properties.Items.Add('0:录入人');
  CbbCXFL.Properties.Items.Add('1:处理机关');
  CbbCXFL.ItemIndex := 0;
  GridColumns := 'cljg,cljgmc,wjf1,wjf2,zs,操作';
  GridView.Columns[5].RepositoryItem:=cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := true;
  RDMonth.Checked:=True;
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('gxsj', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('cljg', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('cljgmc', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('lrr', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('wjf1', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('wjf2', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('ZS', ftInteger, 0, false);
end;

procedure TFrameTJJF.BtnSearchClick(Sender: TObject);
var
  CXFL: string;
begin
  Jkid := 'GetJFCX';
  CXFL := TLZDictionary.StrtoDicInfo(cbbCXFL.Text).dm;
  param := '&CXZL=' + CXFL;
  if CXFL = '0' then
  begin
    GridColumns := 'cljg,lrr,wjf1,wjf2,zs,操作';
    TColumnGenerator.LookupColumn(GridView.Columns[0], TLookUpDataSource.DataSource['DWDM']);
  end
  else
  GridColumns := 'cljg,cljgmc,wjf1,wjf2,zs,操作';
  GridView.Columns[5].RepositoryItem:=cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := true;
  if CXFL = '0' then
    ChartView.Categories.DataBinding.FieldName := 'lrr'
  else
    ChartView.Categories.DataBinding.FieldName := 'cljgmc';
  inherited;
end;

end.

