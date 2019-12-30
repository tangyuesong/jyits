unit uDialogYcydEdit;

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
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, Udictionary, uEntity, DateUtils, StrUtils, uRequestItf,
  System.Generics.Collections, FireDAC.Comp.Client, uJsonUtils, uGlobal;

type
  TDialogYcydEdit = class(TdxDialogBaseFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    cmbMonth: TcxComboBox;
    cmbDwmc: TcxComboBox;
    dxLayoutGroup5: TdxLayoutGroup;
  private
    function GetDwdm: String;
    function GetKPI: TDictionary<string, string>;
    function GetKpiID(kpiName: String): String;
  public
    FKpi: TDictionary<string, string>;
    procedure AfterConstruction; override;
    function SaveData: Boolean;
  end;

var
  DialogYcydEdit: TDialogYcydEdit;

implementation

{$R *.dfm}
{ TdxDialogBaseFrame1 }

procedure TDialogYcydEdit.AfterConstruction;
var
  Y, M, D, H, N, S, SS: Word;
  MM, mc: String;
  dept: TDept;
  str: TStringList;
  dlItem: TdxLayoutItem;
  edt: TcxTextEdit;
begin
  inherited;
  cmbMonth.Properties.Items.Clear;
  DateUtils.DecodeDateTime(Now, Y, M, D, H, N, S, SS);
  if M = 12 then
    MM := IntToStr(Y + 1) + '01'
  else
    MM := IntToStr(Y) + StrUtils.RightStr('0' + IntToStr(M + 1), 2);

  cmbMonth.Properties.Items.Add(MM);
  cmbMonth.Properties.Items.Add(FormatDateTime('yyyymm', Now));

  str := TStringList.Create;
  str.Sort;
  str.Sorted := True;

  for dept in TLZDictionary.gDicDept.Values do
    str.Add(dept.DWMC);

  cmbDwmc.Properties.Items.AddStrings(str);
  str.Free;

  FKpi := GetKPI;
  for mc in FKpi.Values do
  begin
    edt := TcxTextEdit.Create(self);
    edt.Parent := self;
    edt.Height := 21;
    edt.AutoSize := False;
    dlItem := TdxLayoutItem.Create(dxLayoutGroup3);
    dlItem.Parent := dxLayoutGroup3;
    dlItem.Control := edt;
    dlItem.CaptionOptions.Text := mc;
    edt.Text := '0';
    // self.Height := self.Height + 25;
  end;
end;

function TDialogYcydEdit.GetDwdm: String;
var
  dwdm: String;
  dept: TDept;
begin
  Result := '';
  dwdm := Trim(cmbDwmc.Text);
  if dwdm <> '' then
  begin
    for dept in TLZDictionary.gDicDept.Values do
      if dept.DWMC = dwdm then
      begin
        Result := dept.dwdm;
        break;
      end;
  end;
end;

function TDialogYcydEdit.GetKpiID(kpiName: String): String;
var
  Kpi, S: String;
begin
  Result := '';
  Kpi := Trim(kpiName);
  if Kpi <> '' then
  begin
    for S in FKpi.Keys do
      if FKpi[S] = Kpi then
      begin
        Result := S;
        break;
      end;
  end;
end;

function TDialogYcydEdit.GetKPI: TDictionary<string, string>;
var
  S, key, mc: string;
  tb: TFDMemTable;
begin
  Result := TDictionary<string, string>.Create;
  S := TRequestItf.DbQuery('GetJGKPI', 'ycyd=1');
  if S <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(S, tb, '');
    while not tb.Eof do
    begin
      key := tb.FieldByName('systemid').AsString;
      mc := tb.FieldByName('kpiName').AsString;
      Result.Add(key, mc);
      tb.Next;
    end;
    tb.Free;
  end;
end;

function TDialogYcydEdit.SaveData: Boolean;
var
  Month, dwdm, Num, KPIID, Param, kpiName: String;
  i: Integer;
begin
  Month := Trim(cmbMonth.Text);
  dwdm := GetDwdm;

  if Month = '' then
  begin
    Application.MessageBox('月份不能为空', '提示', MB_OK);
    exit;
  end;
  if dwdm = '' then
  begin
    Application.MessageBox('单位名称不能为空', '提示', MB_OK);
    exit;
  end;

  Result := False;
  for i := 0 to dxLayoutGroup3.ComponentCount - 1 do
  begin
    if dxLayoutGroup3.Components[i] is TdxLayoutItem then
      if (dxLayoutGroup3.Components[i] as TdxLayoutItem).Control is TcxTextEdit
      then
      begin
        kpiName := (dxLayoutGroup3.Components[i] as TdxLayoutItem)
          .CaptionOptions.Text;
        KPIID := GetKpiID(kpiName);
        Num := Trim(((dxLayoutGroup3.Components[i] as TdxLayoutItem)
          .Control as TcxTextEdit).Text);
        if StrToFloatDef(Num, -1) < 0 then
        begin
          Application.MessageBox(PChar('[' + kpiName + ']数量填写有误'),
            ' 提示 ', MB_OK);
          exit;
        end;
        Param := 'Month=' + Month + '&dwdm=' + dwdm + '&kpiid=' + KPIID +
          '&tasknum=' + Num + '&yhbh=' + gUser.yhbh + '&gxsj=' +
          FormatDateTime('yyyy/mm/dd hh:nn:ss', Now);

        if TRequestItf.DbQuery('ModifyJGYcyd', Param) <> '1' then
        begin
          Application.MessageBox('操作失败', '提示', MB_OK);
          exit;
        end;
      end;
  end;
  Result := True;
end;

end.
