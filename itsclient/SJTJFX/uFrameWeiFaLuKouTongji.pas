unit UFrameWeiFaLuKouTongji;

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
  System.Actions, Generics.Collections,
  Vcl.ActnList, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, uJsonUtils,
  uRequestItf, uCommon, Vcl.ExtCtrls, dxLayoutControlAdapters, Vcl.StdCtrls,
  cxRadioGroup, cxContainer, Vcl.Menus, dxLayoutcxEditAdapters, cxTextEdit,
  cxButtons, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxComboBoxExt, uEntity, uGlobal;

type
  TFrameWeiFaLuKouTongji = class(TdxGridFrame)
    dxLayoutItem5: TdxLayoutItem;
    Timer1: TTimer;
    dtBegin: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    dtEnd: TcxDateEdit;
    dxLayoutItem7: TdxLayoutItem;
    btnOK: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    cboWFXW: TcxComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    procedure LoadWFXW;
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;
var
  FrameWeiFaLuKouTongji: TFrameWeiFaLuKouTongji;

implementation

{$R *.dfm}

procedure TFrameWeiFaLuKouTongji.AfterConstruction;
begin
  inherited;
  GridColumns := 'CJJG,WFDD,WeiFaTotal,DaiShenHe,WeiFaWuXiao,WeiFaYouXiao,ShangChuanChengGong,ShangChuanShiBai,ChongFu,MaxWFSJ';
  GridView.GetColumnByFieldName('CJJG').Options.Filtering := true;
  GridView.GetColumnByFieldName('WFDD').Options.Filtering := true;
  GridView.GetColumnByFieldName('CJJG').Width := 200;
  GridView.GetColumnByFieldName('WFDD').Width := 360;
  GridView.GetColumnByFieldName('MaxWFSJ').Width := 180;

  FDMemTable1.FieldDefs.Add('CJJG', ftString, 100, false);
  FDMemTable1.FieldDefs.Add('WFDD', ftString, 100, false);
  FDMemTable1.FieldDefs.Add('WeiFaTotal', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('DaiShenHe', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('WeiFaWuXiao', ftInteger, 0, false);
  //FDMemTable1.FieldDefs.Add('WeiFaGuoQi', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('WeiFaYouXiao', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('ShangChuanChengGong', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('ShangChuanShiBai', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('ChongFu', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('MaxWFSJ', ftDateTime, 0, false);

  LoadWFXW;

  dtBegin.Date := Now - 1;
  dtEnd.Date := Now;
end;

procedure TFrameWeiFaLuKouTongji.LoadWFXW;
var
  s: string;
  list: TList<TWfxw>;
  item: TWfxw;
begin
  s := TRequestItf.DbQuery('GetWFXWFromTemp','');
  list := TJSONUtils.JsonToRecordList<TWfxw>(s);
  for item in list do
  begin
    self.cboWFXW.Properties.Items.Add(item.WFXWDM + ': ' + item.WFXWMC);
  end;
  list.Free;
end;

procedure TFrameWeiFaLuKouTongji.btnOKClick(Sender: TObject);
var
  s, wfxw: string;
begin
  inherited;
  ShowFrameWait;
  wfxw := cboWFXW.Text;
  if wfxw <> '' then
    wfxw := wfxw.Substring(0, wfxw.IndexOf(':'));
  s := TRequestItf.DbQuery('GetWeiFaLuKouTongJi',
    'dtBegin=' + FormatDateTime('yyyy-mm-dd hh:nn:ss', dtBegin.Date) +
    '&dtEnd=' + FormatDateTime('yyyy-mm-dd hh:nn:ss', dtEnd.Date + 1) +
    '&dwdm=' + gUser.DWDM +
    '&wfxw=' + wfxw);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', False);
  FreeFrameWait;
end;

procedure TFrameWeiFaLuKouTongji.cxButton1Click(Sender: TObject);
begin
  inherited;
  if dlgSave.Execute then
  begin
    TCommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

end.
