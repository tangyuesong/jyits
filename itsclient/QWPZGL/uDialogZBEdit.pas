unit uDialogZBEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, uJsonUtils,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar, uEntity,
  uDictionary, uGlobal, uRequestItf, cxCheckBox, cxCheckComboBox, dxFrame,
  uFrameBanCi;

type
  TDialogZBEdit = class(TdxDialogBaseFrame)
    dxLayoutItem5: TdxLayoutItem;
    cboTime: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    cboSwitchTime: TcxComboBox;
    dxLayoutItem10: TdxLayoutItem;
    cboType: TcxComboBox;
    lgBanCiAAA: TdxLayoutGroup;
    liDD1: TdxLayoutItem;
    edtDD1: TcxTextEdit;

    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    lgBanCi: TdxLayoutGroup;
    procedure btnSaveClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure cboTypePropertiesChange(Sender: TObject);
  private
    FClose: TClose;
    FDWDM: string;
    procedure InitType;
    procedure SetDWDM(const Value: string);
  public
    procedure AfterConstruction; override;
    property OnSave: TClose read FClose write FClose;
    property DWDM: string read FDWDM write SetDWDM;
  end;

var
  DialogZBEdit: TDialogZBEdit;

implementation

{$R *.dfm}
{ TDialogZBEdit }

procedure TDialogZBEdit.AfterConstruction;
begin
  inherited;
  InitType;
  btnAddClick(nil);
end;

procedure TDialogZBEdit.InitType;
  type
    TQWType = record
      XH, TypeName: string;
    end;
var
  json: string;
  list: TList<TQWType>;
  item: TQWType;
begin
  json := TRequestItf.DbQuery('GetQWType');
  list := TJsonUtils.JsonToRecordList<TQWType>(json);
  cboType.Properties.Items.Clear;
  for item in list do
  begin
    cboType.Properties.Items.Add(item.TypeName);
  end;
end;

procedure TDialogZBEdit.SetDWDM(const Value: string);
begin
  FDWDM := Value;
  btnAddClick(nil);
end;

procedure TDialogZBEdit.btnAddClick(Sender: TObject);
var
  li: TdxLayoutItem;
  frame: TFrameBanCi;
begin
  inherited;
  frame := TFrameBanCi.Create(self);
  frame.Name := 'FrameBanCi' + (lgBanCi.Count + 1).ToString;
  frame.Parent := self;
  frame.btnAdd.OnClick := btnAddClick;
  frame.edtName.Text := (lgBanCi.Count + 1).ToString + ' 班';
  frame.dwdm := self.DWDM;
  li := lgBanCi.CreateItem(TdxLayoutItem) as TdxLayoutItem;
  li.Control := frame;
  if Sender <> nil then
    (Sender as TcxButton).Visible := false;
  //frame.FrameZBRY := self.CurrentFrameBanCi.FrameZBRY;
end;

procedure TDialogZBEdit.btnSaveClick(Sender: TObject);
  procedure Save(frameBanCi: TFrameBanCi; xh: integer);
  var
    s: string;
    banCi: TBanCi;
  begin
    banCi := frameBanCi.BanCi;
    if (banCi.YHBH <> '')and(banCi.FZR <> '')and(banCi.BCName <> '') then
    begin
      s := 'XH=' + xh.ToString + '&BcType=' + cboType.Text + '&BCName=' + banCi.bcName +
        '&BcTime=' + cboTime.Text + '&SwitchTime=' + cboSwitchTime.Text +
        '&YHBH=' + banCi.YHBH + '&YHXM=' + banCi.YHXM + '&SJHM=' + banCi.SJHM +
        '&fzr=' + banCi.FZR + '&fzrSJ=' + banCi.FZRSJ + '&Address=' + edtDD1.Text +
        '&dwdm=' + self.DWDM;
      TRequestItf.DbQuery('AddBanCi', s);
    end;
  end;
var
  I: Integer;
begin
  inherited;
  if cboType.Text = '' then
  begin
    Application.MessageBox('请输入勤务类型', '提示', MB_OK);
    exit;
  end;
  if cboTime.ItemIndex = -1 then
  begin
    Application.MessageBox('请选择班次时长', '提示', MB_OK);
    exit;
  end;
  if cboSwitchTime.ItemIndex = -1 then
  begin
    Application.MessageBox('请选择轮换时长', '提示', MB_OK);
    exit;
  end;
  for I := 0 to lgBanCi.Count - 1 do
  begin
    if lgBanCi[i] is TdxLayoutItem then
    begin
      if (lgBanCi[i] as TdxLayoutItem).Control is TFrameBanCi then
      begin
        Save((lgBanCi[i] as TdxLayoutItem).Control as TFrameBanCi, i);
      end;
    end;
  end;
  if cboType.ItemIndex = -1 then
  begin
    TRequestItf.DbQuery('AddQWType', 'TypeName=' + cboType.Text);
    InitType;
  end;
  if Assigned(OnSave) then
    OnSave;
  Hide;
  OnClose;
end;

procedure TDialogZBEdit.cboTypePropertiesChange(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to lgBanCi.Count - 1 do
  begin
    if lgBanCi[i] is TdxLayoutItem then
    begin
      if (lgBanCi[i] as TdxLayoutItem).Control is TFrameBanCi then
      begin
        if ((lgBanCi[i] as TdxLayoutItem).Control as TFrameBanCi).edtName.Text = '' then
          ((lgBanCi[i] as TdxLayoutItem).Control as TFrameBanCi).edtName.Text := (i + 1).ToString + ' 班';
      end;
    end;
  end;
end;

end.
