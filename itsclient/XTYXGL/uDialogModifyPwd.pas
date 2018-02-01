unit uDialogModifyPwd;

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
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, uRequestItf, QBAes,
  uGLobal;

type
  TfDialogModifyPwd = class(TdxDialogBaseFrame)
    edtOldPwd: TcxTextEdit;
    edtNewPwd: TcxTextEdit;
    edtConfirm: TcxTextEdit;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
  private
    { Private declarations }
  public
    function Save: Boolean;
  end;

var
  fDialogModifyPwd: TfDialogModifyPwd;

implementation

{$R *.dfm}

function TfDialogModifyPwd.Save: Boolean;
var
  oldPwd, newPwd: string;
begin
  inherited;
  Result := False;
  if edtNewPwd.Text <> edtConfirm.Text then
  begin
    Application.MessageBox('新密码和确认密码不一致', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;

  if TRequestItf.DbQuery('GetS_User',
    'MM=' + AesEncrypt(gUser.YHBH + edtOldPwd.Text, key)) = '' then
  begin
    Application.MessageBox('原密码不正确', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;

  if TRequestItf.DbQuery('ModifyS_User',
    'MM=' + AesEncrypt(gUser.YHBH + edtNewPwd.Text, key) + '&SystemID=' +
    gUser.SYSTEMID) = '1' then
  begin
    Application.MessageBox('密码修改成功', '提示', MB_OK + MB_ICONINFORMATION);
    self.Parent.Enabled := True;
    Hide;
  end
  else
    Application.MessageBox('密码修改失败', '提示', MB_OK + MB_ICONINFORMATION);
  Application.MessageBox('修改成功', '提示', MB_OK + MB_ICONINFORMATION);
  Result := True;
end;

end.
