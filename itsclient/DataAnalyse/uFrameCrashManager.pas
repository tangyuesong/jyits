unit uFrameCrashManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameTaskManager, cxGraphics,
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
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, dxSkinsdxBarPainter, cxClasses, dxBar, System.Actions, Vcl.ActnList,
  sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, UFrameAddCrash, Vcl.ExtCtrls,
  cxLabel, dxpicdata;

type
  TFrameCrashManager = class(TFrameTaskManager)
  private
    FDetail: TdxFramePicData;
    procedure actViewExecute(Sender: TObject);
  public
    procedure AfterConstruction;override;
  end;

var
  FrameCrashManager: TFrameCrashManager;

implementation

{$R *.dfm}

procedure TFrameCrashManager.AfterConstruction;
begin
  inherited;
  GridColumns:='TaskName, CreateTime, FinishTime, Status, Rate, ²Ù×÷';
  JKID := 'GetT_Analyse_CrashTask';
  self.AddFrame := TFrameAddcrash.Create(Self);
  self.ResultJKID := 'GetT_Analyse_CrashTask_Result';
  self.DeleteTaskJKID := 'DELT_Analyse_CrashTask';

  self.ResultFrame.GridColumns := 'HPHM, HPZL,HitCount,HitRate,²Ù×÷';
  self.ResultFrame.cxdtrpstry1ButtonItem1.Properties.Buttons[0].Action := self.ResultFrame.actView;
  self.ResultFrame.actView.OnExecute := self.actViewExecute;
end;

procedure TFrameCrashManager.actViewExecute(Sender: TObject);
var
  s, Param: string;
begin
  inherited;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(self);
    FDetail.Parent := self;
    FDetail.Align := TAlign.alClient;
  end;
  FDetail.HPHM := self.ResultFrame.FDMemTable1.FieldByName('HPHM').AsString;
  FDetail.hpzl := self.ResultFrame.FDMemTable1.FieldByName('HPZL').AsString;
  FDetail.LoadPassList;
  FDetail.Show;
end;

end.

