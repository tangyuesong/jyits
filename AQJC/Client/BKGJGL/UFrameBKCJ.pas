unit UFrameBKCJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMemo, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImage, uEntity, Udictionary, uGlobal, uCommon, uJsonUtils,
  uRequestItf, cxSpinEdit, cxTimeEdit, cxCheckBox;

type
  TOK = procedure(obj: TBKCJResult) of object;

type
  TFrameBKCJ = class(TdxDialogBaseFrame)
    cbbJC: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    edthphm: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbHPZL: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    edtSJ: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtBZ: TcxMemo;
    dxLayoutItem7: TdxLayoutItem;
    dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    cbbSPYJ: TcxComboBox;
    dxLayoutItem10: TdxLayoutItem;
    edtSPYJ: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    cbbCXYJ: TcxComboBox;
    dxLayoutItem12: TdxLayoutItem;
    edtCXYJ: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    dlgOpen1: TOpenDialog;
    tmBegin: TcxTimeEdit;
    tmEnd: TcxTimeEdit;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    cboBKLX: TcxComboBox;
    dxLayoutItem14: TdxLayoutItem;
    chk1: TcxCheckBox;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    edtclpp1: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    cbbCllx: TcxComboBox;
    dxLayoutItem17: TdxLayoutItem;
    cbbCsys: TcxComboBox;
    dxLayoutItem18: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
  private
    FBKXH: string;
    FBKR: string;
    FBZ: string;
    Fok: TOK;
    function Getbkcj: TBKCJResult;
    procedure Setbkcj(const Value: TBKCJResult);
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
    property BKCJ: TBKCJResult read Getbkcj write Setbkcj;
    property BKXH: string read FBKXH write FBKXH;
    property OnOK: TOK read Fok write Fok;
  end;

var
  FrameBKCJ: TFrameBKCJ;

implementation

{$R *.dfm}
{ TFrameBKCJ }

procedure TFrameBKCJ.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gDicMain['HPZL'], True);
  TLZDictionary.BindCombobox(cboBKLX, TLZDictionary.gDicMain['BKLX'], True);
  TLZDictionary.BindCombobox(cbbCllx, TLZDictionary.gDicMain['CLLX'], True);
  TLZDictionary.BindCombobox(cbbCsys, TLZDictionary.gDicMain['CSYS'], True);
  edtBZ.Clear;
  cbbJC.ItemIndex := 18;
  cbbHPZL.ItemIndex := 1;
  cbbSPYJ.ItemIndex := 0;
  cbbCXYJ.ItemIndex := 0;
end;

procedure TFrameBKCJ.btnSaveClick(Sender: TObject);
var
  tmpBKCJ: TBKCJResult;
  s: string;
  b: string;
  ftpfn: string;
begin
  inherited;
  tmpBKCJ := BKCJ;
  if edthphm.Text = '' then
  begin
    Application.MessageBox('车辆不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if Trim(edtclpp1.Text) = '' then
  begin
    Application.MessageBox('车辆品牌不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if Trim(cbbCllx.Text) = '' then
  begin
    Application.MessageBox('车辆类型不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if Trim(cbbCsys.Text) = '' then
  begin
    Application.MessageBox('车身颜色不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;

  if EditID = TEditStatus.esNew then
    tmpBKCJ.SYSTEMID := '';
  if (EditID = TEditStatus.esApprove) and (cbbSPYJ.Text = '') then
  begin
    Application.MessageBox('审核意见选择原因不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if (EditID = TEditStatus.escancel) and (cbbCXYJ.Text = '') then
  begin
    Application.MessageBox('撤销选择原因不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if cboBKLX.ItemIndex < 0 then
  begin
    Application.MessageBox('布控类型不能为空', '错误', MB_OK + MB_ICONSTOP);
    exit;
  end;

  s := TJSONUtils.RecordToString<TBKCJResult>(@tmpBKCJ);
  if EditID = TEditStatus.esNew then
  begin

    b := TRequestItf.DbQuery('AddT_KK_Alarm', s);
    Application.MessageBox('新增成功', '提示', MB_OK + MB_ICONINFORMATION);
  end
  else if EditID = TEditStatus.esModify then
  begin
    b := TRequestItf.DbQuery('ModifyT_KK_Alarm', s);
    Application.MessageBox('修改成功', '提示', MB_OK + MB_ICONINFORMATION);

  end
  else if EditID = TEditStatus.esApprove then
  begin
    b := TRequestItf.DbQuery('ModifyT_KK_Alarm', s);
    Application.MessageBox('审核成功', '提示', MB_OK + MB_ICONINFORMATION);

  end
  else if EditID = TEditStatus.escancel then
  begin
    b := TRequestItf.DbQuery('ModifyT_KK_Alarm', s);
    Application.MessageBox('撤销成功', '提示', MB_OK + MB_ICONINFORMATION);

  end;
  if not chk1.Checked then
    btnExitClick(nil);
  ftpfn := FormatDatetime('yyyymmddhhmmsszzz', Now) + '.jpg';
  if Assigned(OnOK) then
  begin
    OnOK(tmpBKCJ);
  end;
  ClearControls(Self);
end;

function TFrameBKCJ.Getbkcj: TBKCJResult;
begin
  Result.SYSTEMID := id;
  Result.CJJG := gUser.DWDM;
  Result.BKXH := BKXH;
  Result.HPHM := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + edthphm.Text;
  Result.HPZL := TLZDictionary.StrtoDicInfo(cbbHPZL.Text).dm;
  Result.SJHM := edtSJ.Text;
  Result.sjhm := result.sjhm.Replace(',', ';');
  Result.SMSTimeBegin := FormatDatetime('hhmm', tmBegin.Time);
  Result.SMSTimeEnd := FormatDatetime('hhmm', tmEnd.Time);
  Result.BKZL := '1';
  if (EditID = TEditStatus.esNew) or (EditID = TEditStatus.esModify) then
  begin
    Result.BKR := gUser.YHBH;
    Result.BZ := edtBZ.Text;
    Result.ZT := '0'
  end
  else if EditID = TEditStatus.esApprove then
  begin
    Result.SPR := gUser.YHBH;
    Result.SPSJ := FormatDatetime('yyyy/mm/dd hh:ss:mm', Now);
    Result.SPYJ := edtSPYJ.Text;
    if cbbSPYJ.Text = '同意' then
    begin
      Result.ZT := '1';
    end
    else if cbbSPYJ.Text = '不同意' then
      Result.ZT := '2';
    Result.BZ := FBZ;
    Result.BKR := FBKR;
  end
  else if EditID = TEditStatus.escancel then
  begin
    Result.CXR := gUser.YHBH;
    Result.CXYJ := cbbCXYJ.Text + ',' + edtCXYJ.Text;
    Result.ZT := '3';
    Result.BZ := FBZ;
    Result.BKR := FBKR;
  end;
  Result.GXSJ := FormatDatetime('yyyy/mm/dd hh:ss:mm', Now);
  Result.BKLX := TLZDictionary.StrtoDicInfo(cboBKLX.Text).dm;
  Result.clpp := Trim(edtclpp1.Text);
  Result.cllx := TLZDictionary.StrtoDicInfo(cbbCllx.Text).dm;
  Result.csys := TLZDictionary.StrtoDicInfo(cbbCsys.Text).dm;
end;

procedure TFrameBKCJ.Setbkcj(const Value: TBKCJResult);
begin
  id := Value.SYSTEMID;
  BKXH := Value.BKXH;
  cbbJC.Text := TLZDictionary.getkey('MAIN', 'JC', Value.HPHM[1]) + ':' +
    Value.HPHM[1];
  edthphm.Text := Copy(Value.HPHM, 2, 100);
  cbbHPZL.Text := Value.HPZL + ':' + TLZDictionary.gDicMain['HPZL'][Value.HPZL];
  edtSJ.Text := Value.SJHM;
  edtBZ.Text := Value.BZ;
  if Value.SMSTimeBegin = '' then
    tmBegin.Text := '00:00:00'
  else
    tmBegin.Text := Copy(Value.SMSTimeBegin, 1, 2) + ':' +
      Copy(Value.SMSTimeBegin, 3, 2) + ':00';
  if Value.SMSTimeEnd = '' then
    tmEnd.Text := '23:59:59'
  else
    tmEnd.Text := Copy(Value.SMSTimeEnd, 1, 2) + ':' + Copy(Value.SMSTimeEnd, 3,
      2) + ':00';
  cboBKLX.Text := Value.BKLX + ':' + TLZDictionary.gDicMain['BKLX'][Value.BKLX];
  FBKR := Value.BKR;
  FBZ := Value.BZ;
  edtclpp1.Text := Value.clpp;
  cbbCllx.Text := Value.cllx;
  if TLZDictionary.gDicMain['CLLX'].ContainsKey(Value.cllx) then
    cbbCllx.Text := Value.cllx + ':' + TLZDictionary.gDicMain['CLLX']
      [Value.cllx];
  cbbCsys.Text := Value.csys;
  if TLZDictionary.gDicMain['CSYS'].ContainsKey(Value.csys) then
    cbbCsys.Text := Value.csys + ':' + TLZDictionary.gDicMain['CSYS']
      [Value.csys];
end;

end.
