unit uFrameFeedbackResult;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkinsdxBarPainter, dxBar, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  cxEditRepositoryItems, sDialogs, uFrameSignBase, uEntity, dxPicData,
  uFrameFeedbackBase, System.Actions, Vcl.ActnList;

type
  TFrameFeedbackResult = class(TToolGridFrame)
    btnSign: TdxBarLargeButton;
    btnFeedback: TdxBarLargeButton;
    btnDetail: TdxBarLargeButton;
    dtBegin: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    dtEnd: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    cboJC: TcxComboBox;
    edtHPHM: TcxTextEdit;
    btnSearch: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    procedure btnDetailClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure edtHPHMKeyPress(Sender: TObject; var Key: Char);
    procedure btnSearchClick(Sender: TObject);
  private
    FDetail: TdxFramePicData;
  protected
    procedure LoadData; override;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameFeedbackResult: TFrameFeedbackResult;

implementation

uses
  uDictionary, uRequestItf, UJSONUtils, uGlobal;
{$R *.dfm}

procedure TFrameFeedbackResult.actViewExecute(Sender: TObject);
begin
  inherited;
  btnDetailClick(nil);
end;

procedure TFrameFeedbackResult.AfterConstruction;
begin
  inherited;
  dtBegin.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now - 30));
  dtEnd.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now + 1));
  if TLZDictionary.gDicMain.ContainsKey('JC') then
  begin
    TLZDictionary.BindCombobox(cboJC, TLZDictionary.gDicMain['JC'], true);
    cboJC.ItemIndex := 18;
  end;

  GridColumns :=
    'CZDW,HPHM,HPZL,KDBH,GCSJ,BKLX,WSBH,CZR,CZSJ,FeedbackMessage,YHBH';
end;

procedure TFrameFeedbackResult.btnDetailClick(Sender: TObject);
begin
  inherited;
  if (not FDMemTable1.Active) or FDMemTable1.Eof then
    exit;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(self);
    FDetail.Parent := self;
    FDetail.Align := TAlign.alClient;
  end;
  FDetail.HPHM := FDMemTable1.FieldByName('HPHM').AsString;
  FDetail.HPZL := FDMemTable1.FieldByName('HPZL').AsString;
  FDetail.LoadPassList;
  FDetail.Show;
end;

procedure TFrameFeedbackResult.LoadData;
var
  Param: string;
  s: string;
  beginTime: Double;
  pageSize, pageIndex: Integer;
begin
  inherited;
  beginTime := dtBegin.Date;
  Param := Format('yhbh=%s&begin_GCSJ=%s&end_GCSJ=%s',
    [gUser.YHBH, FormatDateTime('yyyy/mm/dd', beginTime),
    FormatDateTime('yyyy/mm/dd', dtEnd.Date)]);
  Param := Param + '&HPHM=';
  if edtHPHM.Text <> '' then
    Param := Param + TLZDictionary.StrtoDicInfo(cboJC.Text).mc +
      edtHPHM.Text;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&rows=%s&start=%s',
    [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetFeedbackResult', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TFrameFeedbackResult.btnSearchClick(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameFeedbackResult.edtHPHMKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSearchClick(nil);
end;

end.
