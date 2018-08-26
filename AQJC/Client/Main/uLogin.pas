unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, sBitBtn,
  Vcl.ExtCtrls, sPanel, Vcl.ComCtrls, sStatusBar, sCheckBox, sEdit, uCommon,
  sSkinProvider, sSkinManager, acPNG, acImage, QBAes, uEntity, uGlobal,
  sComboBox, uDictionary, uRequestItf, uJsonUtils, cxGraphics, cxControls,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, NB30,
  dxSkinXmas2008Blue, cxCheckBox, uFrameLogin, cxClasses, dxSkinsForm;

type
  TFrmLogin = class(TForm)
    FrameLogin: TFrameLogin;
    chk1: TcxCheckBox;
    dxSkinController1: TdxSkinController;
    procedure sbtbtnQuitClick(Sender: TObject);
    procedure sbtbtnLoginClick(Sender: TObject);
    procedure cbbUserKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    loginCount: Integer;
    procedure CheckSa(pwd, mac: String);
    procedure GetUserPwd();
    procedure SaveUserPwd();
  public
    { Public declarations }
  end;

var
  frmLogin: TFrmLogin;
  LoginOk: Boolean;

function CheckLogin: Boolean;

implementation

{$R *.dfm}

function GetMACAddress: string;
var
  AdapterList: TLanaEnum;
  NCB: TNCB;

  function GetAdaPterInfo(lana: AnsiChar): string;
  var
    Adapter: TAdapterStatus;
    NCB: TNCB;
  begin
    FillChar(NCB, Sizeof(NCB), 0);
    NCB.ncb_command := Char(NCBRESET);
    NCB.ncb_lana_num := lana;
    if Netbios(@NCB) <> Char(NRC_GOODRET) then
    begin
      Result := '';
      exit;
    end;
    FillChar(NCB, Sizeof(NCB), 0);
    NCB.ncb_command := Char(NCBASTAT);
    NCB.ncb_lana_num := lana;
    NCB.ncb_callname := '*';
    FillChar(Adapter, Sizeof(Adapter), 0);
    NCB.ncb_buffer := @Adapter;
    NCB.ncb_length := Sizeof(Adapter);
    if Netbios(@NCB) <> Char(NRC_GOODRET) then
    begin
      Result := 'mac not found';
      exit;
    end;
    Result := IntToHex(Byte(Adapter.adapter_address[0]), 2) +
      IntToHex(Byte(Adapter.adapter_address[1]), 2) +
      IntToHex(Byte(Adapter.adapter_address[2]), 2) +
      IntToHex(Byte(Adapter.adapter_address[3]), 2) +
      IntToHex(Byte(Adapter.adapter_address[4]), 2) +
      IntToHex(Byte(Adapter.adapter_address[5]), 2);
  end;

begin
  FillChar(NCB, Sizeof(NCB), 0);
  NCB.ncb_command := Char(NCBENUM);
  NCB.ncb_buffer := @AdapterList;
  NCB.ncb_length := Sizeof(AdapterList);
  Netbios(@NCB);
  if Byte(AdapterList.length) > 0 then
    Result := GetAdaPterInfo(AdapterList.lana[0])
  else
    Result := '';
end;

function CheckLogin: Boolean;
begin
  Application.CreateForm(TFrmLogin, frmLogin);
  frmLogin.ShowModal;
  Result := LoginOk;
  FreeAndNil(frmLogin);
end;

procedure TFrmLogin.GetUserPwd;
var
  s, mm: string;
begin
  s := TRequestItf.DbQuery('GetS_User_Log', 'ip=' + gClientIP + '&yhbh=' +
    Trim(FrameLogin.edtUser.Text));
  mm := TJsonUtils.GetJsonSingleValue(s, 'MM');
  if mm <> '' then
  begin
    FrameLogin.edtPwd.Text := AesDecrypt(mm, Key);
    chk1.Checked := StrToBool(TJsonUtils.GetJsonSingleValue(s, 'YHBJ'));
  end;
end;

procedure TFrmLogin.SaveUserPwd;
var
  s, id, param: String;
begin
  s := TRequestItf.DbQuery('GetS_User_Log', 'ip=' + gClientIP + '&yhbh=' +
    Trim(FrameLogin.edtUser.Text));
  id := TJsonUtils.GetJsonSingleValue(s, 'SYSTEMID');
  if id <> '' then
  begin
    param := 'systemid=' + id + '&gxsj=' +
      FormatDateTime('yyyy/mm/dd hh:nn:ss', now());
    if chk1.Checked then
      param := param + '&yhbj=1&mm=' + AesEncrypt(FrameLogin.edtPwd.Text, Key)
    else
      param := param + '&yhbj=0&mm=';
    TRequestItf.DbQuery('ModifyS_User_Log', param);
  end
  else if (id = '') and chk1.Checked then
  begin
    param := 'ip=' + gClientIP + '&yhbj=1&yhbh=' + Trim(FrameLogin.edtPwd.Text)
      + '&mm=' + AesEncrypt(FrameLogin.edtPwd.Text, Key);
    TRequestItf.DbQuery('AddS_User_Log', param);
  end;
end;

procedure TFrmLogin.cbbUserKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    sbtbtnLoginClick(Sender);
end;

procedure TFrmLogin.CheckSa(pwd, mac: String);
var
  s: String;
begin
  s := TRequestItf.DbQuery('Login', 'user=su&pwd=' + pwd+'&id='+mac);
  if TCommon.GetJsonNode('code', s) = '1' then
  begin
    gToken := TCommon.GetJsonNode('token', s);
    gUser.SYSTEMID := 'FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF';
    gUser.DWDM := '445100000000';
    gUser.YHBH := 'su';
    gUser.YHXM := 'su';
    gUser.Password:= frameLogin.edtPwd.Text;
    LoginOk := True;
    close;
  end
  else
  begin
    MessageBox(Handle, PChar(TCommon.GetJsonNode('message', s)), '警告',
      MB_OK + MB_ICONWARNING + MB_TOPMOST);
  end;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FrameLogin.cxLabel1.Caption := gSetup.AppTitle;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  loginCount := 1;
  FrameLogin.edtUser.SetFocus;
end;

procedure TFrmLogin.sbtbtnLoginClick(Sender: TObject);
var
  user, pw, s, mac: String;
begin
  LoginOk := False;
  user := FrameLogin.edtUser.Text;
  gIsSa := user = 'su';
  mac := GetMACAddress;
  if mac = '' then
  begin
    MessageBox(Handle, '获取MAC失败', '警告', MB_OK + MB_ICONWARNING + MB_TOPMOST);
    close;
  end;

  if gIsSa then
  begin
    pw := AesEncrypt('vioadmin' + FrameLogin.edtPwd.Text, Key);
    CheckSa(pw, mac);
  end
  else
  begin
    pw := AesEncrypt(user + FrameLogin.edtPwd.Text, Key);

    s := TRequestItf.DbQuery('Login', 'user=' + user + '&pwd=' + pw +
      '&id=' + mac);
    if TCommon.GetJsonNode('code', s) = '1' then
    begin
      gToken := TCommon.GetJsonNode('token', s);
      gUser := TJsonUtils.JsonToRecord<TUser>(s);
      gUser.UserName := user;
      gUser.Password := FrameLogin.edtPwd.Text;
      LoginOk := True;
      close;
    end
    else
    begin
      MessageBox(Handle, PChar(TCommon.GetJsonNode('message', s)), '警告',
        MB_OK + MB_ICONWARNING + MB_TOPMOST);
      FrameLogin.edtPwd.Text := '';
      FrameLogin.edtPwd.SetFocus();
    end;
  end;
end;

procedure TFrmLogin.sbtbtnQuitClick(Sender: TObject);
begin
  LoginOk := False;
  close();
end;

end.
