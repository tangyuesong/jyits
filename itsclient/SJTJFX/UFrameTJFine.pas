unit UFrameTJFine;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, StrUtils, uGlobal,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, cxStyles, cxCustomData, Data.DB, cxDBData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxLayoutContainer, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridChartView, cxGridDBChartView,
  cxGrid, cxDropDownEdit, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxRadioGroup, dxLayoutControl, Udictionary, uEntity,
  System.Actions, Vcl.ActnList;

type
  TFrameTJFine = class(TFrameStat)
    cbbCXFL: TcxComboBox;
    CbbCXLX: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    ChartViewSeries1: TcxGridDBChartSeries;
    cmbDeptType: TcxComboBox;
    dxDeptType: TdxLayoutItem;
    procedure BtnSearchClick(Sender: TObject);
    procedure cbbCXFLPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTJFine: TFrameTJFine;

implementation

{$R *.dfm}

procedure TFrameTJFine.AfterConstruction;
begin
  inherited;
  cbbCXFL.Properties.Items.Add('C:处理机关');
  cbbCXFL.Properties.Items.Add('W:违法行为');
  TLZDictionary.BindCombobox(CbbCXLX, TLZDictionary.gDicMain['JKTJ'], True);
  GridColumns := 'XZQH,CLJG,FKJE,ZS';
  CbbCXLX.ItemIndex := 2;
  cbbCXFL.ItemIndex := 0;
end;

procedure TFrameTJFine.BtnSearchClick(Sender: TObject);
var
  period, CXFL, CXLX, DWJB: string;
begin
  Jkid := 'getFine';
  CXFL := TLZDictionary.StrtoDicInfo(cbbCXFL.Text).dm;
  CXLX := TLZDictionary.StrtoDicInfo(CbbCXLX.Text).dm;
  if cmbDeptType.ItemIndex = 0 then
    DWJB := '4'
  else
    DWJB := '5';
  Param := '&CXZL=' + CXFL + '&CXLX=' + CXLX + '&ZDDM=' + LeftStr(gUser.DWDM, 4)
    + '&DWJB=' + DWJB;
  FDMemTable1.FieldDefs.Clear;
  if CXFL = 'C' then
  begin

    FDMemTable1.FieldDefs.Add('XZQH', ftString, 20, false);
    FDMemTable1.FieldDefs.Add('MC', ftString, 50, false);

    GridColumns := 'XZQH,MC,FKJE,ZS';
    dxLayoutItem12.Visible := True;
  end
  else
  begin
    FDMemTable1.FieldDefs.Add('WFXWDM', ftString, 20, false);
    FDMemTable1.FieldDefs.Add('WFXWMC', ftString, 50, false);
    GridColumns := 'WFXWDM,WFXWMC,FKJE,ZS';
    dxLayoutItem12.Visible := false;
  end;

  FDMemTable1.FieldDefs.Add('JKRQ', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('FKJE', ftFloat, 0, false);
  FDMemTable1.FieldDefs.Add('ZS', ftInteger, 0, false);
  inherited;
end;

procedure TFrameTJFine.cbbCXFLPropertiesChange(Sender: TObject);
begin
  inherited;
  dxDeptType.Visible := cbbCXFL.ItemIndex = 0;
end;

end.
