unit UDcwfSearch;

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
  cxGrid, dxLayoutControl, uDictionary, uRequestItf, uJsonUtils, UVehSearch,
  uCommon;

type
  TDcwfSearch = class(TdxGridFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    cbbJC: TcxComboBox;
    edthphm6: TcxTextEdit;
    cbbhpzl: TcxComboBox;
    btnSearch: TcxButton;
    edtcs: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    BtnExport: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    cbbXzqh: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    procedure btnSearchClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure edtcsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Fveh: TFrameVehSearch;
    procedure AfterConstruction; override;
  end;

var
  DcwfSearch: TDcwfSearch;

implementation

{$R *.dfm}
{ TDcwfSearch }

procedure TDcwfSearch.actViewExecute(Sender: TObject);
var
  hphm: string;
begin
  inherited;
  if not Assigned(Fveh) then
    Fveh := TFrameVehSearch.Create(self);

  Fveh.Show;
end;

procedure TDcwfSearch.AfterConstruction;
begin
  inherited;
  GridColumns := 'hphm,hpzl,c1,ZCWFDZ,ZHWFDZ,ZHWFSJ';
  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gDicMain['JC'], True);
  cbbJC.ItemIndex := 18;
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
  TLZDictionary.BindCombobox(cbbXzqh, TLZDictionary.gDicMain['XZQH'], True);
  cbbhpzl.ItemIndex := 1;
end;

procedure TDcwfSearch.BtnExportClick(Sender: TObject);
var
  Param: string;
begin
  inherited;
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    Param := 'cs=' + edtcs.Text;
    if edthphm6.Text <> '' then
      Param := Param + ',hphm=' + TLZDictionary.StrtoDicInfo(cbbJC.Text).mc +
        edthphm6.Text + ',hpzl=' + TLZDictionary.StrtoDicInfo(cbbhpzl.Text).dm;
    Tcommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    FreeFrameWait;
    Application.MessageBox('数据导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TDcwfSearch.btnSearchClick(Sender: TObject);
var
  s: string;
  Param: string;
begin
  inherited;
  ShowFrameWait;
  Param := 'cs=' + edtcs.Text + '&row=&start=';
  if edthphm6.Text <> '' then
    Param := Param + '&hphm=' + TLZDictionary.StrtoDicInfo(cbbJC.Text).mc +
      edthphm6.Text + '&hpzl=' + TLZDictionary.StrtoDicInfo(cbbhpzl.Text).dm
  else
    Param := Param + '&hphm=&hpzl=';
  if cbbXzqh.Text <> '' then
    Param := Param + '&xzqh=' + TLZDictionary.StrtoDicInfo(cbbXzqh.Text).dm;

  s := TRequestItf.pDbQuery('GetdcwfVeh', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', True);
  FreeFrameWait;
end;

procedure TDcwfSearch.edtcsKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not(Key in ['0' .. '9', #8]) then
    Key := #0;
end;

end.
