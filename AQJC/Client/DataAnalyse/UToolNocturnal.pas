unit UToolNocturnal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFrameTaskManager, cxGraphics,
  cxControls,
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
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.Menus,
  cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, dxSkinsdxBarPainter, cxClasses, dxBar,
  System.Actions, Vcl.ActnList, sDialogs, cxEditRepositoryItems,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, Vcl.ExtCtrls, uFrameAddNocturnal;

type
  TToolNocturnal = class(TFrameTaskManager)
  private
    procedure AfterConstruction; override;
  public
    { Public declarations }
  end;

var
  ToolNocturnal: TToolNocturnal;

implementation

{$R *.dfm}
{ TToolNocturnal }

procedure TToolNocturnal.AfterConstruction;
begin
  inherited;
  GridColumns :=
    'TaskName, LightBegin, LightEnd, BeginTime, EndTime, CreateTime, FinishTime, Status, ²Ù×÷';
  GridView.Columns[8].RepositoryItem := cxdtrpstry1ButtonItem1;
  JKID := 'GetT_Analyse_NocturnalTask';
  self.AddFrame := TFrameAddNocturnal.Create(self);
  self.ResultFrame.GridColumns := 'HPHM,HPZL,nightCount,dayCount';
  self.ResultJKID := 'GetT_Analyse_NocturnalTask_Result';
  self.DeleteTaskJKID := 'DELT_Analyse_NocturnalTask';
end;

end.
