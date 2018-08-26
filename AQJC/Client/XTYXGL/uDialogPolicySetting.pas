unit uDialogPolicySetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, uRequestItf, uCommon,
  QJson;

type
  TfDialogPolicySetting = class(TdxDialogBaseFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    procedure btnSaveClick(Sender: TObject);
  private
    procedure AfterConstruction; override;
  public
    { Public declarations }
  end;

var
  fDialogPolicySetting: TfDialogPolicySetting;

implementation

{$R *.dfm}
{ TfDialogPolicySetting }

procedure TfDialogPolicySetting.AfterConstruction;
var
  s, k, v: String;
  json, node: TQJson;
  i: Integer;
begin
  inherited;
  s := TRequestItf.DbQuery('GetPolicySetting', '');
  if s <> '' then
  begin
    json := TQJson.Create;
    json.Parse(s);
    for i := 0 to json.Count - 1 do
    begin
      node := json.Items[i];
      k := TCommon.GetJsonNode('key', json.Items[i].ToString);
      v := TCommon.GetJsonNode('value', json.Items[i].ToString);
      if k = 'LoginErrorUser' then
        cxTextEdit1.Text := v
      else if k = 'LoginErrorTerminal' then
        cxTextEdit2.Text := v
      else if k = 'LockTime' then
        cxTextEdit3.Text := v
      else if k = 'RequestCount' then
        cxTextEdit4.Text := v
      else if k = 'UnUseDays' then
        cxTextEdit5.Text := v;
    end;
    json.Free;
  end;
end;

procedure TfDialogPolicySetting.btnSaveClick(Sender: TObject);
var
  param: String;
begin
  inherited;
  if StrToIntDef(cxTextEdit1.Text, -1) = -1 then
  begin
    Application.MessageBox('[同一用户最大登录重试次数]设置错误', 'ERROR', MB_OK + MB_ICONERROR);
    exit;
  end;
  TRequestItf.DbQuery('ModifyPolicySetting', 'value=' + cxTextEdit1.Text +
    '&systemid=LoginErrorUser');

  if StrToIntDef(cxTextEdit2.Text, -1) = -1 then
  begin
    Application.MessageBox('[同一终端最大登录重试次数', 'ERROR', MB_OK + MB_ICONERROR);
    exit;
  end;
  TRequestItf.DbQuery('ModifyPolicySetting', 'value=' + cxTextEdit2.Text +
    '&systemid=LoginErrorTerminal');

  if StrToIntDef(cxTextEdit3.Text, -1) = -1 then
  begin
    Application.MessageBox('[登录锁定时长(分)', 'ERROR', MB_OK + MB_ICONERROR);
    exit;
  end;
  TRequestItf.DbQuery('ModifyPolicySetting', 'value=' + cxTextEdit3.Text +
    '&systemid=LockTime');

  if StrToIntDef(cxTextEdit4.Text, -1) = -1 then
  begin
    Application.MessageBox('[一分钟内最大请求次数(高频访问)', 'ERROR', MB_OK + MB_ICONERROR);
    exit;
  end;
  TRequestItf.DbQuery('ModifyPolicySetting', 'value=' + cxTextEdit4.Text +
    '&systemid=RequestCount');

  if StrToIntDef(cxTextEdit5.Text, -1) = -1 then
  begin
    Application.MessageBox('[账户未使用天数(账户长期未使用)', 'ERROR', MB_OK + MB_ICONERROR);
    exit;
  end;
  TRequestItf.DbQuery('ModifyPolicySetting', 'value=' + cxTextEdit5.Text +
    '&systemid=UnUseDays');
  Application.MessageBox('保存成功', '提示', MB_OK + MB_ICONINFORMATION);
end;

end.
