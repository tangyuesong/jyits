unit USpotSearch;

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
  cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  uCommon, Udictionary, uRequestItf, uJsonUtils, sDialogs, System.Actions,
  Vcl.ActnList;

type
  TFrameSpotSearch = class(TdxGridFrame)
    DtKssj: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DtJssj: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbZT: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    BtnSearch: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    txtCondition: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    procedure BtnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameSpotSearch: TFrameSpotSearch;

implementation

{$R *.dfm}
{ TFrameSpotSearch }

procedure TFrameSpotSearch.AfterConstruction;
begin
  inherited;
  DtKssj.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now - 30));
  DtJssj.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now + 1));
end;

procedure TFrameSpotSearch.BtnSearchClick(Sender: TObject);
var
  s: string;
  Param: string;
begin
  inherited;
  ShowFrameWait;
  if cbbZT.Text = '强制处罚' then
    GridColumns := 'PZBH,JSZH,DABH,DSR,HPHM,HPZL,JDCSYR,FDJH,WFSJ,WFDZ,WFXW1,WFXW2,ZQMJ,FXJG'
  else if cbbZT.Text = '简易处罚' then
    GridColumns := 'JDSBH,JSZH,DABH,DSR,HPHM,HPZL,JDCSYR,WFSJ,WFDZ,WFXW,ZQMJ,FXJG'
  else
    GridColumns := 'HPHM,HPZL,WFDD,WFSJ,CJJG,ZQMJ';
  Param := Format('kssj=%s&jssj=%s&type=%s&condition=%s', [DtKssj.Text, DtJssj.Text, cbbZT.Text, txtCondition.Text]);
  s := TRequestItf.DbQuery('searchSpot', Param);

  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', True);
  FreeFrameWait;
end;

end.
