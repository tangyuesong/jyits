unit uCarFaceGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGridFrame, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Actions, Vcl.ActnList, sDialogs, cxEditRepositoryItems,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, Vcl.StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl;

type
  TFrameCarFaceGrid = class(TdxGridFrame)
    ActionList1: TActionList;
    ActionPicture: TAction;
  private
    procedure AfterConstruction; override;
  public
    { Public declarations }
  end;

var
  FrameCarFaceGrid: TFrameCarFaceGrid;

implementation

{$R *.dfm}
{ TFrameCarFaceGrid }

procedure TFrameCarFaceGrid.AfterConstruction;
begin
  inherited;
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
  GridColumns := 'HPHM,HPZL,GCSJ,KDBH,CDBH,CLSD,CLPP,CSYS,œÍœ∏–≈œ¢';
end;

end.
