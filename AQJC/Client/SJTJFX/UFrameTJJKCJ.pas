unit UFrameTJJKCJ;

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
  System.Actions,
  Vcl.ActnList, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, uJsonUtils,
  uRequestItf, uCommon, Vcl.ExtCtrls, dxLayoutControlAdapters, Vcl.StdCtrls,
  cxRadioGroup, cxContainer, Vcl.Menus, dxLayoutcxEditAdapters, cxTextEdit,
  cxButtons, cxMaskEdit, cxDropDownEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar;

type
  TFrameTJJCCJ = class(TdxGridFrame)
    rbYear: TcxRadioButton;
    dxLayoutItem1: TdxLayoutItem;
    RBmonth: TcxRadioButton;
    dxLayoutItem2: TdxLayoutItem;
    RBDate: TcxRadioButton;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    Timer1: TTimer;
    dtBegin: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    dtEnd: TcxDateEdit;
    dxLayoutItem7: TdxLayoutItem;
    btnOK: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    procedure BtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTJJCCJ: TFrameTJJCCJ;

implementation

{$R *.dfm}

procedure TFrameTJJCCJ.AfterConstruction;
begin
  inherited;
  GridColumns := '排名,DWDM,嫌疑车未审批,嫌疑车已审批,预警数量,已处罚,现场开具文书,接受处理,教育后放行,得分';
end;

procedure TFrameTJJCCJ.BtnClick(Sender: TObject);
var
  d, s: string;
begin
  inherited;
  if RBDate.Checked then
    d := FormatDateTime('yyyy-mm-dd', now)
  else if RBmonth.Checked then
    d := FormatDateTime('yyyy-mm', now) + '-01'
  else if rbYear.Checked then
    d := FormatDateTime('yyyy', now) + '-01-01';
  s := FormatDateTime('yyyy-mm-dd', now + 1);
  dtBegin.Date := VarToDateTime(d);
  dtEnd.Date := VarToDateTime(s);
end;

procedure TFrameTJJCCJ.btnOKClick(Sender: TObject);
var
  s: string;
begin
  inherited;
  ShowFrameWait;
  s := TRequestItf.DbQuery('FeedbackStat',
    'dtBegin=' + FormatDateTime('yyyy-mm-dd', dtBegin.Date)
    + '&dtEnd=' + FormatDateTime('yyyy-mm-dd', dtEnd.Date));
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  FreeFrameWait;
end;

procedure TFrameTJJCCJ.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  BtnClick(nil);
end;

end.
