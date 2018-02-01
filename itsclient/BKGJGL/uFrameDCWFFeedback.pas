unit UFrameDCWFFeedback;

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
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, uFrameInput;

type
  TFrameDCWFFeedback = class(TToolGridFrame)
    btnFeedback: TdxBarLargeButton;
    dxLayoutItem1: TdxLayoutItem;
    Timer1: TTimer;
    procedure acteditExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  protected
    procedure loadData; override;
  private
    FFrameInput: TFrameInput;
    procedure DoFeedback(alarm: TAlarmResult; wsbh, jyw: string);
    function DoSign(alarm: TAlarmResult): boolean;
    procedure FrameInputbtnExitClick(Sender: TObject);
    procedure FrameInputbtnSaveClick(Sender: TObject);
  public
    procedure AfterConstruction; override;

  end;

var
  FrameDCWFFeedback: TFrameDCWFFeedback;

implementation

uses uDictionary, uRequestItf, UJSONUtils, uGlobal, uCommon;
{$R *.dfm}

procedure TFrameDCWFFeedback.FrameInputbtnSaveClick(Sender: TObject);
var
  wsbh, jyw: string;
  alarm: TAlarmResult;
begin
  wsbh := FFrameInput.edtCZSJ.Text;
  jyw := TCommon.GetJYW(wsbh);
  if jyw <> '' then
  begin
    alarm := TJSonUtils.TableToRecord<TAlarmResult>(FDMemTable1);
    DoFeedback(alarm, wsbh, jyw);
    FFrameInput.Hide;
  end
  else
    Application.MessageBox('文书编号不正确', '提示');
end;

procedure TFrameDCWFFeedback.FrameInputbtnExitClick(Sender: TObject);
begin
  FFrameInput.Hide;
end;

procedure TFrameDCWFFeedback.acteditExecute(Sender: TObject);
var
  alarm: TAlarmResult;
begin
  inherited;
  alarm := TJSonUtils.TableToRecord<TAlarmResult>(FDMemTable1);
  if alarm.Feedback = '已反馈' then
  begin
    Application.MessageBox('该预警已反馈', '提示');
    exit;
  end;
  if not Assigned(FFrameInput) then
  begin
    FFrameInput := TFrameInput.Create(self);
    FFrameInput.Parent := self;
    FFrameInput.Top := (self.Height - FFrameInput.Height) div 2;
    FFrameInput.Left := (self.Width - FFrameInput.Width) div 2;
    FFrameInput.btnSave.OnClick := self.FrameInputbtnSaveClick;
    FFrameInput.btnExit.OnClick := self.FrameInputbtnSaveClick;
  end;
  FFrameInput.Show;
end;

procedure TFrameDCWFFeedback.AfterConstruction;
begin
  inherited;
  GridColumns := 'BKLX,HPZL,HPHM,KDBH,CD,CLSD,GCSJ,FEEDBACK,违法次数,姓名,SJHM,操作';
  GridView.Columns[11].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := true;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Hint := '反馈';
end;

function TFrameDCWFFeedback.DoSign(alarm: TAlarmResult): boolean;
var
  params, r: string;
begin
  result := false;
  params := 'yjxh=' + alarm.GCXH + '&fkbj=0';
  r := TRequestItf.DbQuery('AddFeedback', params);
  if r = '1' then
  begin
    params := 'SYSTEMID=' + alarm.Systemid + '&QSBJ=1&qsjg=1&sfcj=1';
    params := params + '&qsbm=' + gUser.DWDM;
    params := params + '&qsr=' + gUser.YHXM;
    params := params + '&qssj=' + FormatDateTime('yyyy/mm/dd hh:mm:ss', now);

    TRequestItf.DbQuery('ModifyALARMRESULT', params);
    result := true;
  end
  else
  begin
    Application.MessageBox('反馈失败！', '提示');
  end;
end;

procedure TFrameDCWFFeedback.loadData;
var
  pageSize, pageIndex: Integer;
  Param, s: string;
begin
  inherited;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := 'yhbh=' + gUser.YHBH;
  Param := Param + Format('&start=%s&rows=%s',
    [pageIndex.ToString, pageSize.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetDCWFAlarmResult', Param);
  TJSonUtils.JSONToDataSet(s, FDMemTable1);
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TFrameDCWFFeedback.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  loadData;
end;

procedure TFrameDCWFFeedback.DoFeedback(alarm: TAlarmResult; wsbh, jyw: string);
var
  params, s, Systemid: string;
begin
  if (alarm.QSBJ = '0') or (alarm.QSBJ = '') then
  begin
    if not DoSign(alarm) then
      exit;
  end;

  s := TRequestItf.DbQuery('GetFeedback', 'yjxh=' + alarm.GCXH);
  s := s.Substring(s.IndexOf('SYSTEMID":"') + 11);
  Systemid := s.Substring(0, s.IndexOf('"'));
  params := 'systemid=' + Systemid + '&fkbj=1';
  params := params + '&ljclqk=1';
  params := params + '&chjg=1';
  params := params + '&cljg=2'; // 开具文书

  params := params + '&wslb=1';
  params := params + '&wsbh=' + wsbh;
  params := params + '&jyw=' + jyw;

  params := params + '&czdw=' + gUser.DWDM;
  params := params + '&czr=' + gUser.YHXM;
  params := params + '&czsj=' + FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
  s := TRequestItf.DbQuery('ModifyFeedback', params);
  if s = '1' then
  begin
    params := 'SYSTEMID=' + alarm.Systemid;
    params := params + '&Feedback=已反馈';
    TRequestItf.DbQuery('ModifyALARMRESULT', params);
    FDMemTable1.Edit;
    FDMemTable1.FieldByName('FEEDBACK').AsString := '已反馈';
    FDMemTable1.Post;
  end
  else
    Application.MessageBox('反馈失败！', '提示');
end;

end.
