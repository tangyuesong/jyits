unit UFrameTXGL;

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
  dxLayoutcxEditAdapters, cxContainer, cxEdit, dxLayoutContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxClasses, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, Udictionary, uEntity, uRequestItf, uJsonUtils, uCommon,
  uGlobal, System.Generics.Collections, cxCheckBox;

type
  TOK = procedure(obj: TResultMail) of object;

  TFrameTXGL = class(TdxDialogBaseFrame)
    cbbJC: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    edthphm: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbHPZL: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    edtjdcsyr: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    cbbzsxxdz: TcxComboBox;
    dxLayoutItem7: TdxLayoutItem;
    edtbz: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    cbbtxyy: TcxComboBox;
    dxLayoutItem9: TdxLayoutItem;
    chk1: TcxCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
    procedure edthphmKeyPress(Sender: TObject; var Key: Char);
    procedure cbbHPZLKeyPress(Sender: TObject; var Key: Char);
    procedure cbbzsxxdzKeyPress(Sender: TObject; var Key: Char);
    procedure cbbJCKeyPress(Sender: TObject; var Key: Char);
  private
    FEditId: TEditStatus;
    Fid: string;
    FOK: TOK;
    FClose: TClose;
    function readmail: TResultMail;
    procedure setmail(const Value: TResultMail);
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
    property MailInfo: TResultMail read readmail write setmail;
    property OnOK: TOK read FOK write FOK;
  end;

var
  FrameTXGL: TFrameTXGL;

implementation

{$R *.dfm}
{ TFrameTXGL }

procedure TFrameTXGL.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gdicmain['JC'], True);
  cbbJC.ItemIndex := 18;
  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gdicmain['HPZL'], True);
  cbbHPZL.ItemIndex := 1;
end;

procedure TFrameTXGL.btnSaveClick(Sender: TObject);
var
  s: string;
  tempmail: TResultMail;
begin
  inherited;
  tempmail := MailInfo;
  if Editid = TEditStatus.esNew then
    tempmail.systemid := '';
  s := TJSONUtils.RecordToString<TResultMail>(@tempmail);
  if (edthphm.Text = '') or (cbbzsxxdz.Text = '') then
  begin
    Application.MessageBox('号牌号码和地址不能为空', '提示', MB_OK + MB_ICONSTOP);
    exit;
  end;

  if Editid = TEditStatus.esNew then
  begin
    TRequestItf.PDbQuery('AddS_MAILRESULT', s);
    Application.MessageBox('新增成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
  if Editid = TEditStatus.esModify then
  begin
    TRequestItf.PDbQuery('ModifyS_MAILRESULT', s);
    Application.MessageBox('修改成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
  if Assigned(OnOK) then
  begin
    OnOK(tempmail);
  end;
  if not chk1.Checked then
  begin
    btnExitClick(nil);
    exit;
  end;
  ClearControls(Self);
  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gdicmain['JC'], True);
  cbbJC.ItemIndex := 18;
  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gdicmain['HPZL'], True);
  cbbHPZL.ItemIndex := 1;
  edthphm.SetFocus;
end;

procedure TFrameTXGL.cbbHPZLKeyPress(Sender: TObject; var Key: Char);
var
  hphm, hpzl, stime, etime, params, json: string;
  list: TList<Tvioinfosrl>;
  item: Tvioinfosrl;
begin
  inherited;
  if Key = #13 then
  begin
    hphm := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + edthphm.Text;
    hpzl := TLZDictionary.StrtoDicInfo(cbbHPZL.Text).dm;
    stime := FormatDateTime('YYYY/MM/DD', Now - 365);
    etime := FormatDateTime('YYYY/MM/DD', Now);
    params := Format('Hphm=%s&Hpzl=%s&begin_gxsj=%s&end_gxsj=%s',
      [hphm, hpzl, stime, etime]);
    json := TRequestItf.PDbQuery('GetT_VIO_Surveil', params);
    list := TJSONUtils.JsonToRecordList<Tvioinfosrl>(json);
    cbbzsxxdz.Properties.Items.Clear;
    for item in list do
    begin
      edtjdcsyr.Text := item.JDCSYR;
      if cbbzsxxdz.Properties.Items.IndexOf(item.ZSXXDZ) = -1 then
        cbbzsxxdz.Properties.Items.Add(item.ZSXXDZ);
    end;
    cbbzsxxdz.ItemIndex := 0;
    cbbtxyy.ItemIndex := 1;
    if cbbzsxxdz.Properties.Items.Count > 1 then
      cbbzsxxdz.DroppedDown := True;
    btnSave.SetFocus;
  end;
end;

procedure TFrameTXGL.cbbJCKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    edthphm.SetFocus;
  end;

end;

procedure TFrameTXGL.cbbzsxxdzKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    btnSave.SetFocus;
  end;

end;

procedure TFrameTXGL.edthphmKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    cbbHPZL.SetFocus;
  end;

end;

function TFrameTXGL.readmail: TResultMail;
begin
  Result.systemid := ID;
  Result.hphm := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + edthphm.Text;
  Result.hpzl := TLZDictionary.StrtoDicInfo(cbbHPZL.Text).dm;
  Result.syr := edtjdcsyr.Text;
  Result.ZSXXDZ := cbbzsxxdz.Text;
  Result.txyy := cbbtxyy.Text;
  Result.bz := edtbz.Text;
  Result.lrr := gUser.YHBH;
  Result.ip := gClientIP;
  Result.gxsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', Now);
end;

procedure TFrameTXGL.setmail(const Value: TResultMail);
begin
  ID := Value.systemid;
  cbbJC.Text := TLZDictionary.getkey('MAIN', 'JC', Value.hphm[1]) + ':' +
    Value.hphm[1];
  edthphm.Text := Copy(Value.hphm, 2, 100);
  cbbHPZL.Text := Value.hpzl + ':' + TLZDictionary.gdicmain['HPZL'][Value.hpzl];
  edtjdcsyr.Text := Value.syr;
  cbbzsxxdz.Text := Value.ZSXXDZ;
  cbbtxyy.Text := Value.txyy;
  edtbz.Text := Value.bz;
end;

end.
