unit UFrameJianYiFeedback;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame, cxGraphics, cxControls,
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
  dxSkinsdxBarPainter, dxBar, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, cxEditRepositoryItems, sDialogs,
  uFrameFeedback, uFrameSign, uEntity, dxPicData, uFrameFeedbackBase,
  System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, cxLabel;

type
  TFrameJianYiFeedback = class(TToolGridFrame)
    btnFeedback: TdxBarLargeButton;
    Timer1: TTimer;
    procedure btnFeedbackClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FFrameFeedback: TFrameFeedbackBase;
  public
    procedure AfterConstruction; override;

  end;

var
  FrameJianYiFeedback: TFrameJianYiFeedback;

implementation

uses uDictionary, uRequestItf, UJSONUtils, uGlobal;
{$R *.dfm}

procedure TFrameJianYiFeedback.acteditExecute(Sender: TObject);
begin
  inherited;
  btnFeedbackClick(nil);
end;

procedure TFrameJianYiFeedback.AfterConstruction;
begin
  inherited;
  GridColumns := 'BKLX,HPZL,HPHM,KDBH,CD,CLSD,GCSJ,FEEDBACK,操作';
  GridView.Columns[8].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := true;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Hint := '反馈';
end;

procedure TFrameJianYiFeedback.btnFeedbackClick(Sender: TObject);
var
  alarm: TAlarmResult;
begin
  inherited;
  alarm := TJSONUtils.TableToRecord<TAlarmResult>(FDMemTable1);
  if alarm.Feedback = '已反馈' then
  begin
    Application.MessageBox('已反馈', '提示');
    exit;
  end;
  if not Assigned(FFrameFeedback) then
  begin
    FFrameFeedback := TFrameFeedbackBase.Create(self);
    FFrameFeedback.Parent := self;
    FFrameFeedback.Align := TAlign.alClient;
  end;
  FFrameFeedback.DataTable := self.FDMemTable1;
  FFrameFeedback.Show;
end;

procedure TFrameJianYiFeedback.Timer1Timer(Sender: TObject);
var
  s: string;
begin
  inherited;
  Timer1.Enabled := false;
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetJianYiAlarmResult', 'YHBH=' + gUser.YHBH);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  FreeFrameWait;
end;

end.
