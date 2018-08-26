unit USearchLJ;

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
  TFrameSearchLJ = class(TdxGridFrame)
    DtKssj: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DtJssj: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbZT: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    BtnSearch: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    BtnExport: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameSearchLJ: TFrameSearchLJ;

implementation

{$R *.dfm}
{ TFrameSearchLJ }

procedure TFrameSearchLJ.AfterConstruction;
begin
  inherited;
  DtKssj.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now - 30));
  DtJssj.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now + 1));
  TLZDictionary.BindCombobox(cbbZT, TLZDictionary.gDicMain['FKBF'], True);
  cbbZT.ItemIndex := 0;
  GridColumns := 'SFZMHM, ZJCX, FZRQ, XM, CSRQ, DJZSXXDZ, SJHM, YXQS, YXQZ';
end;

procedure TFrameSearchLJ.BtnExportClick(Sender: TObject);
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

procedure TFrameSearchLJ.BtnSearchClick(Sender: TObject);
var
  s: string;
  Param: string;
begin
  inherited;
  ShowFrameWait;
  if cbbZT.ItemIndex = 2 then
    GridColumns :=
      'HPHM, HPZL, CLPP1, CLXH, SFZMHM, SYR, ZSXXDZ, SJHM, yqjy,qzbfqz'
  else
    GridColumns := 'SFZMHM, ZJCX, FZRQ, XM, CSRQ, DJZSXXDZ, SJHM, YXQS, YXQZ';
  Param := Format('kssj=%s&jssj=%s', [DtKssj.Text, DtJssj.Text]);
  if cbbZT.ItemIndex = 0 then
    s := TRequestItf.pDbQuery('GetDRIVINGLICENSE', Param)
  else if cbbZT.ItemIndex = 1 then
    s := TRequestItf.pDbQuery('GetDRIVINGLICENSE70', '')
  else
    s := TRequestItf.pDbQuery('GetVIOVEHICLE', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', True);
  FreeFrameWait;
end;

end.
