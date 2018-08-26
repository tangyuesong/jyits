unit uModifyPwd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, dxDialogBase,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, cxContainer, cxEdit,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses,
  cxTextEdit, cxButtons, dxLayoutControl, uRequestItf, QBAes, uGLobal, uCommon;

type
  TfrmModifyPwd = class(TForm)
    dxLayoutControl2: TdxLayoutControl;
    btnSave: TcxButton;
    btnExit: TcxButton;
    edtOldPwd: TcxTextEdit;
    edtNewPwd: TcxTextEdit;
    edtConfirm: TcxTextEdit;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  public
    { Public declarations }
  end;

var
  frmModifyPwd: TfrmModifyPwd;
  IsSecurity: Boolean;

function CheckPasswordSecurity: Boolean;
function CheckSecurity(pwd: String): Boolean;

implementation

{$R *.dfm}

function CheckSecurity(pwd: String): Boolean;
var
  haveSJ, haveZM, haveTS: Boolean;
  i, ascii: Integer;
begin
  Result := False;
  if Length(pwd) < 8 then
    exit;
  haveSJ := False;
  haveZM := False;
  haveTS := False;
  for i := 1 to Length(pwd) do
  begin
    ascii := ord(pwd[i]);
    if (ascii >= 48) and (ascii <= 57) then
      haveSJ := True
    else if ((ascii >= 65) and (ascii <= 90)) or
      ((ascii >= 97) and (ascii <= 122)) then
      haveZM := True
    else
      haveTS := True;
  end;
  Result := haveSJ and haveZM and haveTS;
end;

function CheckPasswordSecurity: Boolean;
begin
  Result := CheckSecurity(gUser.Password);
  if not Result then
  begin
    Application.MessageBox('密码强度太低，请修改密码', '提示', MB_OK + MB_ICONINFORMATION);
    Application.CreateForm(TfrmModifyPwd, frmModifyPwd);
    frmModifyPwd.ShowModal;
    Result := IsSecurity;
    FreeAndNil(frmModifyPwd);
  end;
end;

procedure TfrmModifyPwd.btnExitClick(Sender: TObject);
begin
  IsSecurity := False;
  Close();
end;

procedure TfrmModifyPwd.btnSaveClick(Sender: TObject);
var
  s: String;
begin
  inherited;
  if edtNewPwd.Text <> edtConfirm.Text then
  begin
    Application.MessageBox('新密码和确认密码不一致', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;

  if not CheckSecurity(edtNewPwd.Text) then
  begin
    Application.MessageBox('密码强度太低，必须长度大于8，包含字母，数字，特殊字符', '提示',
      MB_OK + MB_ICONERROR);
    exit;
  end;

  if edtOldPwd.Text <> gUser.Password then
  begin
    Application.MessageBox('原密码不正确', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;

  s := TRequestItf.DbQuery('ModifyS_User',
    'MM=' + AesEncrypt(gUser.YHBH + edtNewPwd.Text, key) + '&SystemID=' +
    gUser.SYSTEMID);

  if TCommon.GetJsonNode('code', s) = '1' then
  begin
    Application.MessageBox('密码修改成功', '提示', MB_OK + MB_ICONINFORMATION);
    gUser.Password := edtNewPwd.Text;
    IsSecurity := True;
    Close;
  end
  else
    Application.MessageBox('密码修改失败', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmModifyPwd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmModifyPwd := nil;
end;

end.
