unit uFrameSendSms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, dxLayoutContainer, cxTextEdit, cxMemo, cxClasses, dxLayoutControl,
  uRequestItf, cxMaskEdit, cxDropDownEdit, uFrameAddSms, uDM;

type
  TframeSendSms = class(TdxFrame)
    txtSms: TcxMemo;
    dxLayoutItem1: TdxLayoutItem;
    txtSjhm: TcxMemo;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    cboSjhm: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    cboDxnr: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    cxButton3: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    cxButton4: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cboSjhmPropertiesChange(Sender: TObject);
    procedure cboDxnrPropertiesChange(Sender: TObject);
  private
    IsSaveSjhm: Boolean;
    fAddSms: TFrameAddSms;
    procedure FrameOKClick(name: String);
    procedure FrameClose;
    procedure ShowAddFrame();
  public
    procedure AfterConstruction; override;
  end;

var
  frameSendSms: TframeSendSms;

implementation

{$R *.dfm}

procedure TframeSendSms.AfterConstruction;
var
  s, v: String;
begin
  inherited;
  cboSjhm.Properties.Items.Clear;
  cboDxnr.Properties.Items.Clear;
  s := TRequestItf.DbQuery('GETSMS_SJHM');
  while pos('"Name":"', s) > 0 do
  begin
    s := copy(s, pos('"Name":"', s) + 8, Length(s));
    v := copy(s, 1, pos('"', s) - 1);
    cboSjhm.Properties.Items.Add(v);
  end;
  s := TRequestItf.DbQuery('GETSMS_DXNR');
  while pos('"Name":"', s) > 0 do
  begin
    s := copy(s, pos('"Name":"', s) + 8, Length(s));
    v := copy(s, 1, pos('"', s) - 1);
    cboDxnr.Properties.Items.Add(v);
  end;
end;

procedure TframeSendSms.cboDxnrPropertiesChange(Sender: TObject);
var
  s: String;
begin
  inherited;
  s := TRequestItf.DbQuery('GETSMS_DXNR', 'Name=' + cboDxnr.Text);
  if pos('"Dxnr":"', s) > 0 then
  begin
    s := copy(s, pos('"Dxnr":"', s) + 8, Length(s));
    txtSms.Text := copy(s, 1, pos('"', s) - 1);
  end
  else
    txtSms.Text := '';
end;

procedure TframeSendSms.cboSjhmPropertiesChange(Sender: TObject);
var
  s: String;
begin
  inherited;
  s := TRequestItf.DbQuery('GETSMS_SJHM', 'Name=' + cboSjhm.Text);
  if pos('"Sjhm":"', s) > 0 then
  begin
    s := copy(s, pos('"Sjhm":"', s) + 8, Length(s));
    txtSjhm.Text := copy(s, 1, pos('"', s) - 1);
  end
  else
    txtSjhm.Text := '';
end;

procedure TframeSendSms.cxButton2Click(Sender: TObject);
var
  sjhm, s: String;
begin
  inherited;
  sjhm := '';
  for s in txtSjhm.Lines do
  begin
    sjhm := sjhm + Trim(s) + ';';
  end;
  if sjhm <> '' then
  begin
    sjhm := copy(sjhm, 1, Length(sjhm) - 1);
    TRequestItf.DbQuery('SendSMS', 'sjhm=' + sjhm + '&content=' +
      Trim(txtSms.Text));
    Application.MessageBox('短信提交成功', '提示', MB_OK + MB_ICONINFORMATION);
  end
  else
    Application.MessageBox('请输入手机号码', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TframeSendSms.cxButton3Click(Sender: TObject);
begin
  inherited;
  if Trim(txtSjhm.Text) = '' then
    exit;
  IsSaveSjhm := True;
  ShowAddFrame;
end;

procedure TframeSendSms.cxButton4Click(Sender: TObject);
begin
  inherited;
  if Trim(txtSms.Text) = '' then
    exit;
  IsSaveSjhm := False;
  ShowAddFrame;
end;

procedure TframeSendSms.FrameClose;
begin
  if Assigned(fAddSms) then
    fAddSms.Visible := False;
  dxLayoutControl2.Visible := True;
end;

procedure TframeSendSms.FrameOKClick(name: String);
begin
  FrameClose;
  if IsSaveSjhm then
  begin
    if TRequestItf.DbQuery('GETSMS_Sjhm', 'Name=' + name) <> '' then
    begin
      Application.MessageBox('名称已存在,保存失败', '提示', MB_OK + MB_ICONINFORMATION);
      exit;
    end;
    TRequestItf.DbQuery('ADDSMS_SJHM', 'Name=' + name + '&SJHM=' +
      txtSjhm.Text);
    cboSjhm.Properties.Items.Add(name);
  end
  else
  begin
    if TRequestItf.DbQuery('GETSMS_DXNR', 'Name=' + name) <> '' then
    begin
      Application.MessageBox('名称已存在,保存失败', '提示', MB_OK + MB_ICONINFORMATION);
      exit;
    end;
    TRequestItf.DbQuery('ADDSMS_DXNR', 'Name=' + name + '&DXNR=' + txtSms.Text);
    cboDxnr.Properties.Items.Add(name);
  end;
end;

procedure TframeSendSms.ShowAddFrame;
begin
  if not Assigned(fAddSms) then
  begin
    fAddSms := TFrameAddSms.Create(Self);
    fAddSms.Parent := Self;
  end;
  fAddSms.cxTextEdit1.Text := '';
  fAddSms.Top := (Self.Height - fAddSms.Height) div 2;
  fAddSms.Left := (Self.Width - fAddSms.Width) div 2;
  fAddSms.Visible := True;
  fAddSms.OnOK := FrameOKClick;
  fAddSms.OnClose := FrameClose;
  dxLayoutControl2.Visible := False;

end;

end.
