unit uLoginWeb;
{$I ItsClient.inc}

interface

uses
{$IFDEF WEBXONE}
  wxoExec,
{$ENDIF}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, sBitBtn,
  Vcl.ExtCtrls, sPanel, Vcl.ComCtrls, sStatusBar, sCheckBox, sEdit,
  sSkinProvider, sSkinManager, acPNG, acImage, QBAes, uEntity, uGlobal,
  sComboBox, uDictionary,
  dxGDIPlusClasses, uCommon, uRequestItf, uJsonUtils, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinXmas2008Blue, Vcl.Menus, cxButtons, cxTextEdit, cxGroupBox, cxImage,
  cxLabel, uFrameLogin, cxClasses, dxSkinsForm;

type
  TFrmLoginWeb = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxImage1: TcxImage;
    FrameLogin: TFrameLogin;
    dxSkinController1: TdxSkinController;
    procedure sbtbtnQuitClick(Sender: TObject);
    procedure sbtbtnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbUserKeyPress(Sender: TObject; var Key: Char);
    procedure edtPwdKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure FrameLoginedtPwdKeyPress(Sender: TObject; var Key: Char);
  private
    loginCount: Integer;
    procedure CheckSa(pwd: String);
  public
    { Public declarations }
  end;

var
  FrmLoginWeb: TFrmLoginWeb;

implementation

{$R *.dfm}

uses uMain;

procedure TFrmLoginWeb.cbbUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    sbtbtnLoginClick(Sender);
end;

procedure TFrmLoginWeb.CheckSa(pwd: String);
var
  s: String;
begin
  s := TRequestItf.DbQuery('Login', 'user=su&pwd=' + pwd);

  if length(s) > 20 then
  begin
    gToken := s;
    gUser.SYSTEMID := 'FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF';
    gUser.DWDM := '440000000000';
    gUser.YHBH := 'su';
    gUser.YHXM := 'su';
    Tag := 1;
    Close;
  end
  else
    MessageBox(Handle, '用户帐号或登录口令有误，请检查后重试。', '警告', MB_OK + MB_ICONWARNING +
      MB_TOPMOST);
end;

procedure TFrmLoginWeb.edtPwdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    sbtbtnLoginClick(Sender);
end;

procedure TFrmLoginWeb.FormCreate(Sender: TObject);
begin
  self.WindowState := wsNormal;
  wxoPrepare(Handle, Application.Handle);
  wxoSetTitle(PAnsiChar(AnsiString(gSetup.AppTitle)));
  FrameLogin.cxLabel1.Caption := gSetup.AppTitle;
  loginCount := 1;
end;

procedure TFrmLoginWeb.FormResize(Sender: TObject);
begin
  FrameLogin.top := (self.Height - FrameLogin.Height) div 2;
  FrameLogin.left := (self.Width - FrameLogin.Width) div 2;
end;

procedure TFrmLoginWeb.FormShow(Sender: TObject);
begin
  FrameLogin.edtUser.SetFocus;
  FormResize(nil);
end;

procedure TFrmLoginWeb.FrameLoginedtPwdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    sbtbtnLoginClick(Sender);
end;

procedure TFrmLoginWeb.sbtbtnLoginClick(Sender: TObject);
var
  user, pw, s: String;
begin
  Tag := 0;
  user := FrameLogin.edtUser.Text;
  gIsSa := user = 'su';
  if gIsSa then
  begin
    pw := AesEncrypt('vioadmin' + FrameLogin.edtPwd.Text, Key);
    CheckSa(pw);
  end
  else
  begin
    pw := AesEncrypt(user + FrameLogin.edtPwd.Text, Key);
    s := TRequestItf.DbQuery('Login', 'user=' + user + '&pwd=' + pw);
    if length(s) < 10 then
    begin
      if loginCount >= 3 then
      begin
        MessageBox(Handle, '超过三次失败验证，无权使用系统。', '验证失败',
          MB_OK + MB_ICONSTOP + MB_TOPMOST);
        wxoClose;
      end
      else
      begin
        MessageBox(Handle, '用户帐号或登录口令有误，请检查后重试。', '警告', MB_OK + MB_ICONWARNING +
          MB_TOPMOST);
        FrameLogin.edtPwd.Text := '';
        FrameLogin.edtPwd.SetFocus();
      end;
      inc(loginCount);
    end
    else
    begin
      gToken := s;
      s := TRequestItf.DbQuery('GetS_User', 'yhbh=' + user + '&mm=' + pw);
      gUser := TJsonUtils.JsonToRecord<TUser>(s);
      gUser.UserName := user;
      gUser.Password := FrameLogin.edtPwd.Text;
      Tag := 1;
      Close;
    end;
  end;
end;

procedure TFrmLoginWeb.sbtbtnQuitClick(Sender: TObject);
begin
  Tag := 0;
  Close;
end;

end.
