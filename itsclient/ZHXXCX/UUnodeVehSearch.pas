unit UUnodeVehSearch;

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
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxDropDownEdit, cxTextEdit, cxMaskEdit,
  cxCalendar, Udictionary, uCommon, uRequestItf, uJsonUtils, sDialogs,
  System.Actions, Vcl.ActnList;

type
  TUnodeVehSearch = class(TdxGridFrame)
    cbbZDCLLX: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    cbbZT: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    BtnExport: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    procedure btnSearchClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
  private
    { Private declarations }
    cllx, zt: string;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  UnodeVehSearch: TUnodeVehSearch;

implementation

{$R *.dfm}

procedure TUnodeVehSearch.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cbbZT, TLZDictionary.gDicMain['CLZT'], True);
  cbbZT.ItemIndex := 5;
  TLZDictionary.BindCombobox(cbbZDCLLX, TLZDictionary.gDicMain['ZDCL'], True);
  cbbZDCLLX.ItemIndex := 1;
  GridColumns := 'hphm, hpzl,clpp,clxh,syr,yxqz,gxsj,zsxxdz,sjhm,ZT';
end;

procedure TUnodeVehSearch.BtnExportClick(Sender: TObject);
begin
  inherited;
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    Tcommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    FreeFrameWait;
    Application.MessageBox('数据导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TUnodeVehSearch.btnSearchClick(Sender: TObject);
var
  s: string;
  Param: string;
begin
  inherited;
  cllx := TLZDictionary.StrtoDicInfo(cbbZDCLLX.Text).dm;
  zt := TLZDictionary.StrtoDicInfo(cbbZT.Text).dm;
  Param := Format('syxz=%s&zt=%s', [cllx, zt]);
  s := TRequestItf.pDbQuery('GETUnodeVehSearch', Param);
  ShowFrameWait;
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', True);
  FreeFrameWait;
end;

end.
