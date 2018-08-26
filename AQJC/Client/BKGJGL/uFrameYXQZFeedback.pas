unit UFrameYXQZFeedback;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, DateUtils,
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
  uFrameInputWS,
  cxDropDownEdit, cxMaskEdit, cxCalendar, cxEditRepositoryItems, sDialogs,
  uFrameFeedback, uFrameSign, uEntity, dxPicData, uFrameFeedbackBase,
  System.Actions, Vcl.ActnList,
  cxLabel, Vcl.ExtCtrls;

type
  TFrameYXQZFeedback = class(TToolGridFrame)
    btnFeedback: TdxBarLargeButton;
    Timer1: TTimer;
    procedure acteditExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  protected
    procedure loadData; override;
  private
    FFrameInput: TFrameInputWS;
    procedure DoFeedback(alarm: TAlarmResult; wsbh, jyw, czdw, czr: string);
    function DoSign(alarm: TAlarmResult; czdw, czr, czsj: string): boolean;
    procedure FrameInputbtnExitClick(Sender: TObject);
    procedure FrameInputbtnSaveClick(Sender: TObject);
    function GetCZDW(kdbh: string): string;
    function GetCZR(czdw: string): string;
    function GetWSBH: string;
    function SaveSimpleVio(wsbh: string; alarm: TAlarmResult): String;
  public
    procedure AfterConstruction; override;

  end;

var
  FrameYXQZFeedback: TFrameYXQZFeedback;

implementation

uses uDictionary, uRequestItf, UJSONUtils, uGlobal, uCommon;
{$R *.dfm}

function TFrameYXQZFeedback.SaveSimpleVio(wsbh: string; alarm: TAlarmResult): String;
var
  s, code: string;
  dev: TDevice;
begin
  //TODO: 上传简易违法
  dev := TLZDictionary.gDicDev[2][alarm.KDBH];
{  s := '{"jdsbh":"' + wsbh + '"'
    + ',"ryfl":"8"'
    + ',"jszh":"无"'
    + ',"dabh":"无"'
    + ',"fzjg":"无"'
    + ',"zjcx":"无"'
    + ',"dsr":"无"'
    + ',"clfl":"3"'
    + ',"hpzl":"' + alarm.HPZL + '"'
    + ',"hphm":"' + alarm.HPHM + '"'
    + ',"jtfs":"C01"'
    + ',"wfsj":"' + FormatDateTime('yyyy-mm-dd hh:nn:ss', VarToDateTime(alarm.GCSJ)) + '"'       //YYYY-MM-DD hh24:MI
    + ',"xzqy":"' + dev.LHY_XZQH + '"'
    + ',"wfdd":"' + dev.LHY_WFDD + '"'
    + ',"lddm":"' + dev.LHY_LDDM + '"'
    + ',"ddms":"0"'
    + ',"wfdz":"' + dev.SBDDMC + '"'
    + ',"wfxw":"1340"'
    + ',"cfzl":"1"'
    + ',"fkje":"0"'
    + ',"zqmj":"' + TLZDictionary.StrtoDicInfo(FFrameInput.edtCZMJ.Text).dm + '"'
    + ',"jkfs":"0"'
    + ',"jkbj":"9"'
    + ',"fxjg":"' + FFrameInput.czdw + '"'
    + ',"jsjqbj":"00"'
    + ',"sgdj":"0"';}
  s := 'jdsbh=' + wsbh
    + '&ryfl=8'
    + '&jszh=无'
    + '&dabh=无'
    + '&fzjg=无'
    + '&zjcx=无'
    + '&dsr=无'
    + '&clfl=3'
    + '&hpzl=' + alarm.HPZL
    + '&hphm=' + alarm.HPHM
    + '&jtfs=C01'
    + '&wfsj=' + FormatDateTime('yyyy-mm-dd hh:nn:ss', VarToDateTime(alarm.GCSJ))       //YYYY-MM-DD hh24:MI
    + '&xzqh=' + dev.LHY_XZQH
    + '&wfdd=' + dev.LHY_WFDD
    + '&lddm=' + dev.LHY_LDDM
    + '&ddms=0'
    + '&wfdz=' + dev.SBDDMC
    + '&wfxw=1340'
    + '&cfzl=1'
    + '&fkje=0'
    + '&zqmj=' + TLZDictionary.StrtoDicInfo(FFrameInput.edtCZMJ.Text).dm
    + '&jkfs=0'
    + '&jkbj=9'
    + '&fxjg=' + FFrameInput.czdw
    + '&jsjqbj=00'
    + '&sgdj=0';
  s := TRequestItf.QTZ3Get('SaveSimpleVio?'+s);
  code := TCommon.GetJsonNode('code', s);
  if code = '0' then
    Result:= TCommon.GetJsonNode('message', s)
  else
    Result:= '1';
end;

function TFrameYXQZFeedback.GetWSBH: string;
var
  aJson: string;
begin
  //TODO: 获取文书编号
  aJson := TRequestItf.QTZ3Get('APPLYWSBH?wslb=6&num=1&xzqh=' + Copy(FFrameInput.czdw, 1, 6));
  result := TCommon.GetJsonNode('wsbh', aJson);
end;

procedure TFrameYXQZFeedback.FrameInputbtnSaveClick(Sender: TObject);
var
  wsbh, jyw, r: string;
  alarm: TAlarmResult;
begin
  wsbh := FFrameInput.wsbh;
  jyw := FFrameInput.jyw;
  if jyw <> '' then
  begin
    wsbh := copy(wsbh, 1, 15);
    alarm := TJSonUtils.TableToRecord<TAlarmResult>(FDMemTable1);
    r:= SaveSimpleVio(wsbh, alarm);
    if r = '1' then
    begin
      DoFeedback(alarm, wsbh, jyw, FFrameInput.czdw, FFrameInput.czr);
      dxLayoutControl2Group_Root.Enabled := true;
      FFrameInput.Hide;
    end
    else
      Application.MessageBox(pChar(r), '提示');
  end
  else
    Application.MessageBox('文书编号不正确', '提示');
end;

procedure TFrameYXQZFeedback.FrameInputbtnExitClick(Sender: TObject);
begin
  dxLayoutControl2Group_Root.Enabled := true;
  FFrameInput.Hide;
end;

procedure TFrameYXQZFeedback.acteditExecute(Sender: TObject);
var
  alarm: TAlarmResult;
  czdw: string;
begin
  inherited;
  dxLayoutControl2Group_Root.Enabled := false;
  alarm := TJSonUtils.TableToRecord<TAlarmResult>(FDMemTable1);

  if alarm.Feedback = '已反馈' then
  begin
    Application.MessageBox('该预警已反馈', '提示');
    exit;
  end;
  if not Assigned(FFrameInput) then
  begin
    FFrameInput := TFrameInputWS.Create(self);
    FFrameInput.Parent := self;
    FFrameInput.Top := (self.Height - FFrameInput.Height) div 2;
    FFrameInput.Left := (self.Width - FFrameInput.Width) div 2;
    FFrameInput.btnSave.OnClick := self.FrameInputbtnSaveClick;
    FFrameInput.btnExit.OnClick := self.FrameInputbtnExitClick;
  end;
  FFrameInput.dxLayoutGroup1.CaptionOptions.Text := '[' + alarm.hphm +
    ']请输入处置信息';
  FFrameInput.kdbh := alarm.kdbh;
  FFrameInput.edtWSBH.Text := GetWSBH;
  FFrameInput.Show;
end;

procedure TFrameYXQZFeedback.AfterConstruction;
begin
  inherited;
  GridColumns := 'BKLX,HPZL,HPHM,KDBH,CD,CLSD,GCSJ,FEEDBACK,姓名,SJHM,操作';
  GridView.Columns[10].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := true;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Hint := '反馈';
end;

function TFrameYXQZFeedback.GetCZDW(kdbh: string): string;
var
  czdw: string;
begin
  result := gUser.DWDM;
  if TLZDictionary.gDicDev[2].ContainsKey(kdbh) then
  begin
    czdw := TLZDictionary.gDicDev[2][kdbh].czdw;
    if length(czdw) >= 12 then
      result := copy(czdw, length(czdw) - 11, 12);
  end;
end;

function TFrameYXQZFeedback.GetCZR(czdw: string): string;
var
  yhbh, first: string;
  user: TUser;
begin
  result := gUser.YHXM;
  if gUser.DWDM <> czdw then
  begin
    if TLZDictionary.gDicDept.ContainsKey(czdw) then
    begin
      for yhbh in TLZDictionary.gDicUser.Keys do
      begin
        user := TLZDictionary.gDicUser[yhbh];
        if user.DWDM = czdw then
        begin
          exit(user.YHXM);
        end;
      end;
    end;
  end;
end;

function TFrameYXQZFeedback.DoSign(alarm: TAlarmResult;
  czdw, czr, czsj: string): boolean;
var
  params, r: string;
begin
  result := false;
  params := 'yjxh=' + alarm.GCXH + '&fkbj=0';
  r := TRequestItf.DbQuery('AddFeedback', params);
  if r = '1' then
  begin
    czdw := GetCZDW(alarm.kdbh);
    params := 'SYSTEMID=' + alarm.Systemid + '&QSBJ=1&qsjg=1&sfcj=1';
    params := params + '&qsbm=' + czdw;
    params := params + '&qsr=' + czr;
    params := params + '&qssj=' + czsj;

    TRequestItf.DbQuery('ModifyALARMRESULT', params);
    result := true;
  end
  else
  begin
    Application.MessageBox('反馈失败！', '提示');
  end;
end;

procedure TFrameYXQZFeedback.loadData;
var
  pageSize, pageIndex: Integer;
  Param, s: string;
begin
  inherited;
  ShowFrameWait;
  Application.ProcessMessages;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := 'yhbh=' + gUser.yhbh;
  Param := Param + '&start=0&rows=10000';
  s := TRequestItf.DbQuery('GetYXQZAlarmResult', Param);
  TJSonUtils.JSONToDataSet(s, FDMemTable1);
  lbCount.Caption := '总记录数:' + FDMemTable1.RecordCount.ToString + '条';
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TFrameYXQZFeedback.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  loadData;
end;

procedure TFrameYXQZFeedback.DoFeedback(alarm: TAlarmResult;
  wsbh, jyw, czdw, czr: string);
var
  params, s, Systemid, czsj: string;
  t: double;
begin
  t := VarToDateTime(alarm.GCSJ);
  t := t + OneMinute * 50;
  if t > now then
    t := now;
  czsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', t);
  if (alarm.QSBJ = '0') or (alarm.QSBJ = '') then
  begin
    if not DoSign(alarm, czdw, czr, czsj) then
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
  params := params + '&czdw=' + czdw;
  params := params + '&czr=' + czr;
  params := params + '&czsj=' + czsj;
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
