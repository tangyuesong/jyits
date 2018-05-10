unit uFrameTaskManager;

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
  dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkinsdxBarPainter, cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxClasses, dxBar, System.Actions, Vcl.ActnList, sDialogs,
  cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, uCommon, uJsonUtils, uRequestItf, uEntity,
  dxDialogBase, Vcl.ExtCtrls, uFrameResult, cxLabel;

type
  TFrameTaskManager = class(TToolGridFrame)
    BtnSearch: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    BtnAdd: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    DTKSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    Timer1: TTimer;
    procedure actdeleteExecute(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
  private
    FJkid: string;
    FAddFrame: TdxDialogBaseFrame;
    FResultFrame: TFrameResult;
    FResultJKID: string;
    FDeleteTaskJKID: string;
    procedure SetAddFrame(const Value: TdxDialogBaseFrame);
    procedure OnAddFrameClosed;
    //procedure SetResultFrame(const Value: TFrameResult);
  protected
    property AddFrame: TdxDialogBaseFrame read FAddFrame write SetAddFrame;
    property JKid: string read FJkid write FJkid;
    property ResultFrame: TFrameResult read FResultFrame;// write SetResultFrame;
    property ResultJKID: string read FResultJKID write FResultJKID;
    property DeleteTaskJKID: string read FDeleteTaskJKID write FDeleteTaskJKID;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameTaskManager: TFrameTaskManager;

implementation

{$R *.dfm}

procedure TFrameTaskManager.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if DeleteTaskJKID <> '' then
  begin
    if Application.MessageBox('确定要删除此任务？', '提示', mb_YesNo) = mrYes then
    begin
      TRequestItf.DbQuery(DeleteTaskJKID,
        'Systemid=' + FDMemTable1.FieldByName('systemid').AsString);
      BtnSearchClick(nil);
    end;
  end;
end;

procedure TFrameTaskManager.actViewExecute(Sender: TObject);
var
  s, Param: string;
begin
  inherited;
  if Assigned(FResultFrame) then
  begin
    if FDMemTable1.FieldByName('Status').AsString = '完成' then
    begin
      FResultFrame.Parent := self;
      FResultFrame.Align := alClient;
      FResultFrame.Show;
      Param := 'TaskID=' + FDMemTable1.FieldByName('systemid').AsString;
      s := TRequestItf.DbQuery(ResultJKID, Param);
      TJSONUtils.JSONToDataSet(s, FResultFrame.FDMemTable1);
    end;
  end;
end;

procedure TFrameTaskManager.AfterConstruction;
begin
  inherited;
  DTKSSJ.Date := now - 30;
  DTJSSJ.Date := now + 1;
  self.FResultFrame := TFrameResult.Create(self);
  DeleteTaskJKID := '';
end;

procedure TFrameTaskManager.BtnAddClick(Sender: TObject);
begin
  inherited;
  if Assigned(FAddFrame) then
  begin
    FAddFrame.id := '';
    FAddFrame.Top := 120;
    FAddFrame.Left := (self.Width - AddFrame.Width) div 2;
    AddFrame.Show;
  end;
end;

procedure TFrameTaskManager.BtnSearchClick(Sender: TObject);
var
  s, Param: string;
begin
  inherited;
  Param := 'begin_CreateTime=' + DTKSSJ.Text + '&end_CreateTime=' + DTJSSJ.Text
    + '&orderby_desc=CreateTime';
  ShowFrameWait;
  s := TRequestItf.DbQuery(JKid, Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  FreeFrameWait;
end;

procedure TFrameTaskManager.SetAddFrame(const Value: TdxDialogBaseFrame);
begin
  FAddFrame := Value;
  FAddFrame.Parent := self;
  FAddFrame.OnClose := OnAddFrameClosed;
end;

{procedure TFrameTaskManager.SetResultFrame(const Value: TFrameResult);
begin
  FResultFrame := Value;
  FResultFrame.Parent := self;
end; }

procedure TFrameTaskManager.Timer1Timer(Sender: TObject);
begin
  inherited;
  self.BtnSearchClick(nil);
end;

procedure TFrameTaskManager.OnAddFrameClosed;
begin
  if FAddFrame.id <> '' then
  begin
    if DTJSSJ.Date < now then
      DTJSSJ.Date := now;
    self.BtnSearchClick(nil);
    Timer1.Enabled := true;
  end;
end;

end.
