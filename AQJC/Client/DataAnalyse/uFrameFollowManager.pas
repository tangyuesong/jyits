unit uFrameFollowManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics,
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
  dxLayoutControlAdapters, dxLayoutcxEditAdapters,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, dxSkinsdxBarPainter, cxClasses, dxBar, System.Actions, Vcl.ActnList,
  sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, UFrameAddFollow, Vcl.ExtCtrls,
  uFrameResult, uFrameTaskManager, FireDAC.Stan.Intf, FireDAC.Stan.Option;

type
  TFrameFollowManager = class(TFrameTaskManager)
  private

  public
    procedure  AfterConstruction;override;

  end;

var
  FrameFollowManager: TFrameFollowManager;

implementation

{$R *.dfm}

procedure TFrameFollowManager.AfterConstruction;
begin
  inherited;
  GridColumns:='TaskName, HPHM, HPZL, BeginTime, EndTime, CreateTime, FinishTime, Status, Rate, ²Ù×÷';
  GridView.Columns[9].RepositoryItem:=cxdtrpstry1ButtonItem1;
  JKID := 'GetT_Analyse_FollowTask';
  self.AddFrame := TFrameAddFollow.Create(Self);
  self.ResultFrame.GridColumns := 'HPHM,HPZL,CLPP,CSYS,HitRate';
  self.ResultFrame.GridView.Columns[0].Options.Editing:=true;
  self.ResultJKID := 'GetT_Analyse_FollowTask_Result';
  self.DeleteTaskJKID := 'DELT_Analyse_FollowTask';
end;

end.

