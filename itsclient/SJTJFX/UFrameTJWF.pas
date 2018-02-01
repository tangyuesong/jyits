unit UFrameTJWF;

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
  cxCalendar, cxRadioGroup, dxLayoutControl, System.Actions, Vcl.ActnList;

type
  TFrameTJWF = class(TFrameStat)
    ChartViewSeries1: TcxGridDBChartSeries;
    ChartViewSeries2: TcxGridDBChartSeries;
    ChartViewSeries3: TcxGridDBChartSeries;
    procedure BtnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTJWF: TFrameTJWF;

implementation

{$R *.dfm}

procedure TFrameTJWF.AfterConstruction;
begin
  inherited;
  GridColumns := '单位名称,非现场违法宗数,非现场缴款宗数,非现场缴款金额, '
    + '简易违法宗数,强制违法宗数,现场缴款宗数,现场缴款金额,异地缴款金额,本地缴款金额';
  RDMonth.Checked:=true;
end;

procedure TFrameTJWF.BtnSearchClick(Sender: TObject);
begin
  Jkid := 'VioStat';
  param:='';
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('rq', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('xzqh', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('单位名称', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('非现场违法宗数', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('非现场缴款宗数', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('非现场缴款金额', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('简易违法宗数', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('强制违法宗数', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('现场缴款宗数', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('现场缴款金额', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('异地缴款金额', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('本地缴款金额', ftInteger, 0, false);
  inherited;
end;

end.

