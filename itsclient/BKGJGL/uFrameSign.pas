unit uFrameSign;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxCheckBox, cxCheckComboBox, uEntity, dxSkinsCore,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TFrameSign= class(TdxDialogBaseFrame)
    edtHPHM: TcxTextEdit;
    edtCZSJ: TcxTextEdit;
    edtCZDW: TcxComboBox;
    edtCZMJ: TcxComboBox;
    cboQSJG: TcxComboBox;
    cboSFLJ: TcxComboBox;
    liHPHM: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    liSFLJ: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    edtYJLX: TcxTextEdit;
    liYJLX: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    edtGCDD: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    edtGCSJ: TcxTextEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure cboQSJGPropertiesChange(Sender: TObject);
    procedure edtCZDWPropertiesChange(Sender: TObject);
  private
    FAlarm: TAlarmResult;
    FModalResult: boolean;
    FOnSuccuss: TClose;
    function CheckInput: boolean;
    procedure SetAlarm(const Value: TAlarmResult);
    function GetCZDWDM: string;
    function GetCZMJBH: string;
  public
    property Alarm: TAlarmResult read FAlarm write SetAlarm;
    property ModalResult: boolean read FModalResult;
    property OnSuccuss: TClose read FOnSuccuss write FOnSuccuss;
  end;

var
  FrameSign: TFrameSign;

implementation
uses uRequestItf, uGlobal, uDictionary;
{$R *.dfm}

procedure TFrameSign.btnSaveClick(Sender: TObject);
var
  params, r: string;
begin
  inherited;
  if not CheckInput then
  begin
    exit;
  end;
  params := 'yjxh='+Alarm.GCXH + '&fkbj=0';
  r := TRequestItf.DbQuery('AddFeedback', params);
  if r = '1' then
  begin
    params := 'SYSTEMID=' + alarm.Systemid + '&QSBJ=1';
    params := params + '&qsjg='+copy(cboQSJG.Text, 1, 1);
    if liSFLJ.Visible then
      r := copy(cboSFLJ.Text, 1, 1)
    else
      r := '0';
    params := params + '&sfcj=' + r;
    if r = '0' then
      params := params + '&Feedback=已签收未出警'
    else
      params := params + '&Feedback=已签收';
    params := params + '&qsbm=' + GetCZDWDM;
    params := params + '&qsr=' + GetCZMJBH;
    params := params + '&qssj=' + edtCZSJ.Text;

    TRequestItf.DbQuery('ModifyALARMRESULT',  params);
    Application.MessageBox('签收成功', '提示');
    FModalResult := true;
    if Assigned(OnSuccuss) then
      OnSuccuss;
  end
  else begin
    FModalResult := false;
    Application.MessageBox('签收失败！', '提示');
  end;
end;

procedure TFrameSign.cboQSJGPropertiesChange(Sender: TObject);
begin
  inherited;
  liSFLJ.Visible := cboQSJG.ItemIndex = 0;
end;

function TFrameSign.CheckInput: boolean;
begin
  result := false;
  if edtCZDW.Text = '' then
  begin
    Application.MessageBox('请输入签收单位', '提示');
    edtCZDW.SetFocus;
    exit;
  end;
  if edtCZDW.Text = '' then
  begin
    Application.MessageBox('请输入签收人姓名', '提示');
    edtCZMJ.SetFocus;
    exit;
  end;
  if edtCZSJ.Text = '' then
  begin
    Application.MessageBox('请输入签收时间', '提示');
    edtCZSJ.SetFocus;
    exit;
  end;
  result := true;
end;

function TFrameSign.GetCZDWDM: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZDW.Text).dm;
end;

function TFrameSign.GetCZMJBH: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZMJ.Text).mc;
end;

procedure TFrameSign.edtCZDWPropertiesChange(Sender: TObject);
var
  dw, yhbh: string;
  user: TUser;
begin
  inherited;
  edtCZMJ.Properties.Items.Clear;
  dw := GetCZDWDM;
  if TLZDictionary.gDicDept.ContainsKey(dw) then
  begin
    for yhbh in TLZDictionary.gDicUser.Keys do
    begin
      user := TLZDictionary.gDicUser[yhbh];
      if user.DWDM = dw then
      begin
        edtCZMJ.Properties.Items.Add(user.yhbh + ':' + user.YHXM);
      end;
    end;
    if gUser.DWDM = dw then
      edtCZMJ.Text := gUser.yhbh + ':' + gUser.YHXM
    else
      edtCZMJ.ItemIndex := 0;
  end
  else
    edtCZMJ.Text := '';
end;

procedure TFrameSign.SetAlarm(const Value: TAlarmResult);
var
  key, czdw: string;
begin
  FAlarm := Value;
  if TLZDictionary.gDicMain.ContainsKey('BKLX') and TLZDictionary.gDicMain['BKLX'].ContainsKey(Alarm.BKLX) then
    edtYJLX.Text := '[' + TLZDictionary.gDicMain['BKLX'][Alarm.BKLX] + '] ';
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(Alarm.HPZL) then
    edtHPHM.Text := '[' + TLZDictionary.gDicMain['HPZL'][Alarm.HPZL] + '] ';
  edtHPHM.Text := edtHPHM.Text + Alarm.HPHM;
  edtGCSJ.Text := Alarm.GCSJ;
  FModalResult := false;
  cboQSJG.ItemIndex := 0;
  cboSFLJ.ItemIndex := 1;

  edtCZDW.Properties.Items.Clear;
  if TLZDictionary.gDicDev[2].ContainsKey(Alarm.KDBH) then
  begin
    czdw := TLZDictionary.gDicDev[2][Alarm.KDBH].CZDW;
    edtGCDD.Text := TLZDictionary.gDicDev[2][Alarm.KDBH].SBDDMC;
    for key in czdw.Split([';']) do
    begin
      if TLZDictionary.gDicDept.ContainsKey(key) then
      begin
        edtCZDW.Properties.Items.Add(key + ':' + TLZDictionary.gDicDept[key].DWMC);
      end;
    end;
    edtCZDW.ItemIndex := edtCZDW.Properties.Items.Count - 1;
  end
  else begin
    edtCZDW.Text := '';
    edtGCDD.Text := '';
  end;
//  edtCZMJ.Text := gUser.yhbh + ':' + gUser.YHXM;

  edtCZSJ.Text := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
end;

end.
