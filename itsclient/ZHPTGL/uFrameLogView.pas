unit uFrameLogView;

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
  cxGrid, dxLayoutControl, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  uRequestItf, uJSONUtils;

type
  TFrameLogView = class(TdxGridFrame)
    DTKSSJ: TcxDateEdit;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    cmbResult: TcxComboBox;
    edtYhbh: TcxTextEdit;
    edtRequest: TcxTextEdit;
    Button1: TButton;
    dxLayoutItem7: TdxLayoutItem;
    procedure Button1Click(Sender: TObject);
  protected
    procedure LoadData; override;
  private
    procedure AfterConstruction; override;
  public
    { Public declarations }
  end;

var
  FrameLogView: TFrameLogView;

implementation

{$R *.dfm}
{ TFrameLogView }

procedure TFrameLogView.AfterConstruction;
begin
  inherited;
  DTKSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now + 1));
  GridColumns := 'Token,UserID,IP,Action,Param,Time,Valid,DeviceID';
end;

procedure TFrameLogView.Button1Click(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameLogView.LoadData;
var
  Param: string;
  s: string;
  pageSize, pageIndex: Integer;
begin
  inherited;
  Param := Format('kssk=%s&jssj=%s', [DTKSSJ.Text, DTJSSJ.Text]);
  if cmbResult.ItemIndex = 1 then
    Param := Param + '&valid=1'
  else if cmbResult.ItemIndex = 2 then
    Param := Param + '&valid=0'
  else
    Param := Param + '&valid=';
  if Trim(edtYhbh.Text) <> '' then
    Param := Param + '&yhbh=' + Trim(edtYhbh.Text)
  else
    Param := Param + '&yhbh=';
  if Trim(edtRequest.Text) <> '' then
    Param := Param + '&request=' + Trim(edtRequest.Text)
  else
    Param := Param + '&request=';

  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&currentpage=%s&pagesize=%s',
    [pageIndex.ToString, pageSize.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetLogList', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

end.
