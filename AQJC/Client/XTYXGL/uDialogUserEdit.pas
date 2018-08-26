unit uDialogUserEdit;

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
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, Udictionary, uCommon, uGlobal, uRequestItf, uEntity, uJsonUtils,
  Generics.Collections, QBAES, cxCheckBox, FireDAC.Comp.Client, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxCalendar, cxSpinEdit, cxTimeEdit;

type
  TfDialogUserEdit = class(TdxDialogBaseFrame)
    edtYhbh: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    edtYhxm: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    edtYhmm: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    edtSfzh: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtSjhm: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    cbbYhzw: TcxComboBox;
    dxLayoutItem9: TdxLayoutItem;
    edtMac: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edtQsip: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    edtJsip: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    cbbDwdm: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    cbManage: TcxCheckBox;
    dxLayoutItem14: TdxLayoutItem;
    cbbSH: TcxComboBox;
    dxLayoutItem15: TdxLayoutItem;
    dtValidDate: TcxDateEdit;
    dtPasswordValidDate: TcxDateEdit;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutItem19: TdxLayoutItem;
    dtLoginTimeBegin: TcxTimeEdit;
    dxLayoutItem20: TdxLayoutItem;
    dtLoginTimeEnd: TcxTimeEdit;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    dxLayoutItem21: TdxLayoutItem;
    cbMJ: TcxCheckBox;
    dxLayoutItem17: TdxLayoutItem;
    cbMM: TcxCheckBox;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
  private
    procedure AfterConstruction; override;
    function GetEditUserInfo: String;
    function ValidatePID(const APID: string): string;
  public
    UserID: String;
    function SaveData: Boolean;
  end;

var
  fDialogUserEdit: TfDialogUserEdit;

implementation

{$R *.dfm}
{ TfDialogUserEdit }

function TfDialogUserEdit.ValidatePID(const APID: string): string;
{ 内部函数,取身份证号校验位,最后一位,对18位有效 }
  function GetVerifyBit(sIdentityNum: string): Char;
  var
    nNum: Integer;
  begin
    Result := #0;
    nNum := StrToInt(sIdentityNum[1]) * 7 + StrToInt(sIdentityNum[2]) * 9 +
      StrToInt(sIdentityNum[3]) * 10 + StrToInt(sIdentityNum[4]) * 5 +
      StrToInt(sIdentityNum[5]) * 8 + StrToInt(sIdentityNum[6]) * 4 +
      StrToInt(sIdentityNum[7]) * 2 + StrToInt(sIdentityNum[8]) * 1 +
      StrToInt(sIdentityNum[9]) * 6 + StrToInt(sIdentityNum[10]) * 3 +
      StrToInt(sIdentityNum[11]) * 7 + StrToInt(sIdentityNum[12]) * 9 +
      StrToInt(sIdentityNum[13]) * 10 + StrToInt(sIdentityNum[14]) * 5 +
      StrToInt(sIdentityNum[15]) * 8 + StrToInt(sIdentityNum[16]) * 4 +
      StrToInt(sIdentityNum[17]) * 2;
    nNum := nNum mod 11;
    case nNum of
      0:
        Result := '1';
      1:
        Result := '0';
      2:
        Result := 'X';
      3:
        Result := '9';
      4:
        Result := '8';
      5:
        Result := '7';
      6:
        Result := '6';
      7:
        Result := '5';
      8:
        Result := '4';
      9:
        Result := '3';
      10:
        Result := '2';
    end;
  end;

var
  L: Integer;
  sCentury: string;
  sYear2Bit: string;
  sMonth: string;
  sDate: string;
  iCentury: Integer;
  iMonth: Integer;
  iDate: Integer;
  CRCFact: string; // 18位证号的实际值
  CRCTh: string; // 18位证号的理论值
  FebDayAmt: Byte; // 2月天数

begin
  L := Length(APID);
  if (L in [15, 18]) = False then
  begin
    Result := Format('身份证号不是15位或18位(%0:s,实际位数:%1:d)', [APID, L]);
    Exit;
  end;
  CRCFact := '';
  if L = 18 then

  begin
    sCentury := Copy(APID, 7, 2);
    iCentury := StrToInt(sCentury);
    if (iCentury in [18 .. 20]) = False then
    begin
      Result := Format('身份证号码无效:18位证号的年份前两位必须在18-20之间(%0:S)', [sCentury]);
      Exit;
    end;
    sYear2Bit := Copy(APID, 9, 2);
    sMonth := Copy(APID, 11, 2);
    sDate := Copy(APID, 13, 2);
    CRCFact := Copy(APID, 18, 1);
  end
  else
  begin
    sCentury := '19';
    sYear2Bit := Copy(APID, 7, 2);
    sMonth := Copy(APID, 9, 2);
    sDate := Copy(APID, 11, 2);
  end;
  iMonth := StrToInt(sMonth);
  iDate := StrToInt(sDate);
  if (iMonth in [01 .. 12]) = False then
  begin
    Result := Format('身份证号码无效:月份必须在01-12之间(%0:s)', [sMonth]);
    Exit;
  end;
  if (iMonth in [1, 3, 5, 7, 8, 10, 12]) then
  begin
    if (iDate in [01 .. 31]) = False then
    begin
      Result := Format('身份证号码无效:日期无效,不能为零或超出当月最大值(%0:s)', [sDate]);
      Exit;
    end;
  end;
  if (iMonth in [4, 6, 9, 11]) then
  begin
    if (iDate in [01 .. 30]) = False then
    begin
      Result := Format('身份证号码无效:日期无效,不能为零或超出当月最大值(%0:s)', [sDate]);
      Exit;
    end;
  end;
  if IsLeapYear(StrToInt(sCentury + sYear2Bit)) = True then

  begin
    FebDayAmt := 29;
  end
  else

  begin
    FebDayAmt := 28;
  end;
  if (iMonth in [2]) then
  begin
    if (iDate in [01 .. FebDayAmt]) = False then
    begin
      Result := Format('身份证号码无效:日期无效,不能为零或超出当月最大值(%0:s)', [sDate]);
      Exit;
    end;
  end;
  if CRCFact <> '' then

  begin
    CRCTh := GetVerifyBit(APID);
    if CRCFact <> CRCTh then

    begin
      Result := Format('身份证号码无效:校验位(第18位)错:(%0:s)', [APID]);
      Exit;
    end;
  end;
end;

procedure TfDialogUserEdit.AfterConstruction;
var
  dept: TDept;
begin
  inherited;
  TLZDictionary.BindCombobox(cbbYhzw, TLZDictionary.gDicMain['ZW']);
  cbbDwdm.Properties.Items.Clear;
  for dept in TLZDictionary.gDicDept.Values do
    cbbDwdm.Properties.Items.Add(dept.DWMC);
end;

function TfDialogUserEdit.GetEditUserInfo: String;
var
  DWDM: String;
  dept: TDept;
begin
  DWDM := cbbDwdm.Text;
  for dept in TLZDictionary.gDicDept.Values do
    if dept.DWMC = DWDM then
    begin
      DWDM := dept.DWDM;
      break;
    end;

  Result := 'DWDM=' + DWDM + '&YHBH=' + Trim(edtYhbh.Text) + '&YHXM=' +
    Trim(edtYhxm.Text);
  if (UserID = '') or cbMM.Checked then
    Result := Result + '&MM=' + AesEncrypt(edtYhbh.Text + '88888888', key);
  if cbbYhzw.ItemIndex >= 0 then
    Result := Result + '&ZW=' + cbbYhzw.Text;
  if Trim(edtSfzh.Text) <> '' then
    Result := Result + '&SFZHM=' + Trim(edtSfzh.Text);
  if Trim(edtSjhm.Text) <> '' then
    Result := Result + '&SJHM=' + Trim(edtSjhm.Text);
  if Trim(edtMac.Text) <> '' then
    Result := Result + '&MAC=' + Trim(edtMac.Text);
  if Trim(edtQsip.Text) <> '' then
    Result := Result + '&IPKS=' + Trim(edtQsip.Text);
  if Trim(edtJsip.Text) <> '' then
    Result := Result + '&IPJS=' + Trim(edtJsip.Text);
  if cbbSH.ItemIndex = 0 then
    Result := Result + '&FH=0&SH=0'
  else if cbbSH.ItemIndex = 1 then
    Result := Result + '&FH=1&SH=0'
  else if cbbSH.ItemIndex = 2 then
    Result := Result + '&FH=0&SH=1';
  // if cbFh.Checked then
  // Result := Result + '&FH=1';

  if cbManage.Checked then
    Result := Result + '&Manager=1'
  else
    Result := Result + '&Manager=0';
  if cbMJ.Checked then
    Result := Result + '&ISMJ=1'
  else
    Result := Result + '&IsMJ=0';
  if dtValidDate.Text <> '' then
    Result := Result + '&ValidDate=' + dtValidDate.Text;
  if dtPasswordValidDate.Text <> '' then
    Result := Result + '&PasswordValidDate=' + dtPasswordValidDate.Text;
  Result := Result + '&LoginTimeBegin=' + dtLoginTimeBegin.Text;
  Result := Result + '&LoginTimeEnd=' + dtLoginTimeEnd.Text;
  if UserID <> '' then
    Result := Result + '&Systemid=' + UserID
  else
    Result := Result + '&Zt=1&LRR=' + gUser.yhbh;
end;

function TfDialogUserEdit.SaveData: Boolean;
var
  param, sysid, s: String;
begin
  Result := False;
  if cbbDwdm.ItemIndex < 0 then
  begin
    Application.MessageBox('单位代码不能为空', '提示', MB_OK);
    Exit;
  end;
  if Trim(edtYhbh.Text) = '' then
  begin
    Application.MessageBox('用户编号不能为空', '提示', MB_OK);
    Exit;
  end;
  if Trim(edtYhxm.Text) = '' then
  begin
    Application.MessageBox('用户姓名不能为空', '提示', MB_OK);
    Exit;
  end;
  { if Trim(edtYhmm.Text) = '' then
    begin
    Application.MessageBox('用户密码不能为空', '提示', MB_OK);
    exit;
    end; }

  s := ValidatePID(edtSfzh.Text);
  if s <> '' then
  begin
    Application.MessageBox(PChar(s), '提示', MB_OK);
    Exit;
  end;

  param := 'YHBH1=' + Trim(edtYhbh.Text);
  if UserID <> '' then
    param := param + '&systemid=' + UserID;

  s := TRequestItf.DbQuery('GetS_User', param);

  if (TCommon.GetJsonNode('code', s) = '1') and
    (TCommon.GetJsonNode('totalnum', s) <> '0') then
  begin
    Application.MessageBox('用户编号已存在', '提示', MB_OK);
    Exit;
  end;

  param := GetEditUserInfo;

  if UserID <> '' then
  begin
    s := TRequestItf.DbQuery('ModifyS_User', param);
    if TCommon.GetJsonNode('code', s) <> '1' then
    begin
      Application.MessageBox('修改用户失败', '提示', MB_OK);
      Exit;
    end;
  end
  else
  begin
    s := TRequestItf.DbQuery('AddS_User', param);
    if TCommon.GetJsonNode('code', s) <> '1' then
    begin
      Application.MessageBox('添加用户失败', '提示', MB_OK);
      Exit;
    end;
  end;
  Result := True;
end;

end.
