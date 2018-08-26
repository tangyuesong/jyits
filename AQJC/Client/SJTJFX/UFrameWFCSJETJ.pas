unit UFrameWFCSJETJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
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
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridChartView, cxGridDBChartView,
  cxGrid, cxDropDownEdit, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxRadioGroup, dxLayoutControl, System.Actions, Vcl.ActnList;

type
  TFrameWFCSJETJ = class(TFrameStat)
    ChartViewSeries1: TcxGridDBChartSeries;
    ChartViewSeries3: TcxGridDBChartSeries;
    ChartViewSeries4: TcxGridDBChartSeries;
    ChartViewSeries5: TcxGridDBChartSeries;
    ChartViewSeries12: TcxGridDBChartSeries;
    ChartViewSeries13: TcxGridDBChartSeries;
    ChartViewSeries15: TcxGridDBChartSeries;
    procedure BtnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameWFCSJETJ: TFrameWFCSJETJ;

implementation

uses uRequestItf, uCommon, uJSONUtils;
{$R *.dfm}

procedure TFrameWFCSJETJ.AfterConstruction;
begin
  inherited;
  GridColumns := '指标,辖区大队,闯红灯,超速,违停,逆行,未系安全带,其他,合计';
  dxMonth.Visible := false;
end;

procedure TFrameWFCSJETJ.BtnSearchClick(Sender: TObject);
var
  s: string;
begin
  Jkid := 'getWFCSJETJ';
  Param := 'year=' + cbbYear.Text;
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('指标', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('辖区大队', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('闯红灯', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('超速', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('违停', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('逆行', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('未系安全带', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('其他', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('合计', ftInteger, 0, false);
  s := TRequestItf.pDbQuery(Jkid, Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', false);
  // inherited;
end;

end.
