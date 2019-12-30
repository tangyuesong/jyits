unit uPaiBan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGridFrame, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, DateUtils,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Actions, Vcl.ActnList, sDialogs, cxEditRepositoryItems,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, Vcl.StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  Udictionary, uEntity, uJsonUtils, uRequestItf, uCommon, uDialogZBEdit,
  uFrameDeptTreeList, cxSpinEdit, cxTimeEdit, uGlobal;

type
  TFramePaiBan = class(TdxGridFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    cboType: TcxComboBox;
    dtStart: TcxDateEdit;
    btnDo: TcxButton;
    SaveDialog1: TSaveDialog;
    dxLayoutItem5: TdxLayoutItem;
    dtEnd: TcxDateEdit;
    dxLayoutItem8: TdxLayoutItem;
    cboLianBan: TcxComboBox;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem9: TdxLayoutItem;
    btnClose: TcxButton;
    dxLayoutItem10: TdxLayoutItem;
    btnSave: TcxButton;
    tmStart: TcxTimeEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    cboBanCiStart: TcxComboBox;
    cxButton1: TcxButton;
    dxLayoutItem11: TdxLayoutItem;
    procedure btnDoClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cboTypePropertiesChange(Sender: TObject);
  private
    function DoPaiBan(startDate, endDate: TDateTime; lianBanShu: integer;
      bcList: TList<TBanCi>; bcIndex: integer): TList<TPaiBan>;
    function GetBcList(bcType: string): TList<TBanCi>;
    function GetPaiBanList(dwdm, bcType: string; startDate, endDate: TDateTime): TList<TPaiBan>;
  public
    DWDM: string;
    procedure AfterConstruction; override;
    procedure InitType;
  end;

//svar
  //FramePaiBan: TFramePaiBan;

implementation

{$R *.dfm}
{ TFramePaiBan }

procedure TFramePaiBan.AfterConstruction;
begin
  inherited;
  GridColumns := 'BCDate,StartTime,EndTime,BCType,BCName,FZR,YHXM,Address';
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('BCDate', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('BCDateEnd', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('StartTime', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('EndTime', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('BCType', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('BCName', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('FZR', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('FZRSJ', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('YHBH', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('YHXM', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('SJHM', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('Address', ftString, 4000, false);
  FDMemTable1.CreateDataSet;

  //InitType;
end;

procedure TFramePaiBan.InitType;
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
  list.Free;
end;

procedure TFramePaiBan.acteditExecute(Sender: TObject);
begin
  inherited;
  //ShowZBEdit(FDMemTable1.FieldByName('Systemid').AsString);
end;

procedure TFramePaiBan.btnCloseClick(Sender: TObject);
begin
  inherited;
  self.Hide;
end;

procedure TFramePaiBan.btnDoClick(Sender: TObject);
var
  startDate, endDate: TDateTime;
  lianBanShu: integer;
  bcList: TList<TBanCi>;
  pbList: TList<TPaiBan>;
  paiban: TPaiBan;
begin
  inherited;
  startDate := dtStart.Date + tmStart.Time;
  endDate := dtEnd.Date + 1;
  if startDate < now then
  begin
    Application.MessageBox('开始时间必选大于当前时间', '提示', MB_OK);
    exit;
  end;
  if endDate <= startDate then
  begin
    Application.MessageBox('开始时间必选小于结束时间', '提示', MB_OK);
    exit;
  end;
  if cboType.Text = '' then
  begin
    Application.MessageBox('请选择勤务类型', '提示', MB_OK);
    exit;
  end;
  lianBanShu := StrToIntDef(cboLianBan.Text, 1);
  bcList := GetBcList(cboType.Text);
  if bcList.Count = 0 then
  begin
    Application.MessageBox('请先配置班次信息', '提示', MB_OK);
    exit;
  end;
  pbList := GetPaiBanList(self.DWDM, cboType.Text, startDate, endDate);
  if pbList.Count > 0 then
  begin
    pbList.Free;
    if Application.MessageBox('已存在排班信息，覆盖已有排班数据？', '提示', MB_YESNO) <> mrYes then
      exit;
  end;

  pbList := DoPaiBan(startDate, endDate, lianBanShu, bcList, cboBanCiStart.ItemIndex);
  FDMemTable1.Close;
  FDMemTable1.Open;
  FDMemTable1.DisableControls;
  for paiban in pbList do
  begin
    FDMemTable1.Append;
    FDMemTable1.FieldByName('BCDate').AsString := paiban.Date;
    FDMemTable1.FieldByName('BCDateEnd').AsString := paiban.DateEnd;
    FDMemTable1.FieldByName('StartTime').AsString := paiban.StartTime;
    FDMemTable1.FieldByName('EndTime').AsString := paiban.EndTime;
    FDMemTable1.FieldByName('BCType').AsString := paiban.BanCi.BCType;
    FDMemTable1.FieldByName('BCName').AsString := paiban.BanCi.BCName;
    FDMemTable1.FieldByName('FZR').AsString := paiban.BanCi.FZR;
    FDMemTable1.FieldByName('FZRSJ').AsString := paiban.BanCi.FZRSJ;
    FDMemTable1.FieldByName('YHBH').AsString := paiban.BanCi.YHBH;
    FDMemTable1.FieldByName('YHXM').AsString := paiban.BanCi.YHXM;
    FDMemTable1.FieldByName('SJHM').AsString := paiban.BanCi.SJHM;
    FDMemTable1.FieldByName('Address').AsString := paiban.BanCi.Address;
    FDMemTable1.Post;
  end;
  FDMemTable1.EnableControls;
  pbList.Free;
  bcList.Free;
end;

procedure TFramePaiBan.btnSaveClick(Sender: TObject);
var
  s: string;
  starttime, endtime: TDateTime;
begin
  inherited;
  if not (FDMemTable1.Active and (FDMemTable1.RecordCount > 0)) then exit;

  s := 'dwdm=' + self.DWDM + '&bcType=' + cboType.Text +
    '&begin_StartTime=' + FormatDateTime('yyyy/mm/dd', dtStart.Date + tmStart.Time) +
    '&end_StartTime=' + FormatDateTime('yyyy/mm/dd', dtEnd.Date + 1);
  TRequestItf.DbQuery('DelPaiBan', s);

  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
    s := 'dwdm=' + self.DWDM +
      '&bcType=' + FDMemTable1.FieldByName('BCType').AsString +
      '&bcName=' + FDMemTable1.FieldByName('BCName').AsString +
      '&FZR=' + FDMemTable1.FieldByName('FZR').AsString +
      '&FZRSJ=' + FDMemTable1.FieldByName('FZRSJ').AsString +
      '&YHBH=' + FDMemTable1.FieldByName('YHBH').AsString +
      '&YHXM=' + FDMemTable1.FieldByName('YHXM').AsString +
      '&SJHM=' + FDMemTable1.FieldByName('SJHM').AsString +
      '&Address=' + FDMemTable1.FieldByName('Address').AsString +
      '&StartTime=' + FDMemTable1.FieldByName('BCDate').AsString +
        ' ' + FDMemTable1.FieldByName('StartTime').AsString +
      '&EndTime=' + FDMemTable1.FieldByName('BCDateEnd').AsString +
        ' ' + FDMemTable1.FieldByName('EndTime').AsString;
    TRequestItf.DbQuery('AddPaiBan', s);
    FDMemTable1.Next;
  end;
  Application.MessageBox('保存成功', '提示', MB_OK);
  FDMemTable1.Close;
end;

procedure TFramePaiBan.cboTypePropertiesChange(Sender: TObject);
var
  bcList: TList<TBanCi>;
  item: TBanCi;
begin
  inherited;
  cboBanCiStart.Properties.Items.Clear;
  bcList := GetBcList(cboType.Text);
  for item in bcList do
  begin
    cboBanCiStart.Properties.Items.Add(item.BCName);
  end;
  bcList.Free;
  cboBanCiStart.Text := '';
end;

function TFramePaiBan.GetBcList(bcType: string): TList<TBanCi>;
var
  json: string;
begin
  json := TRequestItf.DbQuery('GetBanCi', 'bcType=' + bcType + '&dwdm=' + self.DWDM);
  result := TJsonUtils.JsonToRecordList<TBanCi>(json);
end;

function TFramePaiBan.GetPaiBanList(dwdm, bcType: string; startDate, endDate: TDateTime): TList<TPaiBan>;
var
  s, json: string;
begin
  s := 'dwdm=' + DWDM + '&bcType=' + bcType +
      '&begin_StartTime=' + FormatDateTime('yyyy/mm/dd', startDate) +
      '&end_StartTime=' + FormatDateTime('yyyy/mm/dd', endDate);
  json := TRequestItf.DbQuery('GetPaiBan', s);
  result := TJsonUtils.JsonToRecordList<TPaiBan>(json);
end;

function TFramePaiBan.DoPaiBan(startDate, endDate: TDateTime;
  lianBanShu: integer; bcList: TList<TBanCi>; bcIndex: integer): TList<TPaiBan>;
var
  d, dStart, dEnd: TDateTime;
  lianBanCount: integer;
  banCi: TBanCi;
  paiBan: TPaiBan;
begin
  result := TList<TPaiBan>.Create;
  if (bcList = nil) or (bcList.Count = 0) then
    exit;
  if bcIndex = -1 then
    bcIndex := 0;
  lianBanCount := 0;
  d := startDate;
  while d < endDate do
  begin
    banCi := bcList[bcIndex];
    dStart := d;
    dEnd := d + banCi.BCTime / 24;

    paiBan.BanCi := banCi;
    paiBan.Date := FormatDateTime('yyyy-mm-dd', dStart);
    paiBan.StartTime := FormatDateTime('hh:mm', dStart);
    paiBan.DateEnd := FormatDateTime('yyyy-mm-dd', dEnd);
    paiBan.EndTime := FormatDateTime('hh:mm', dEnd);
    result.Add(paiBan);

    Inc(lianBanCount);
    if lianBanCount = lianBanShu then
    begin
      lianBanCount := 0;
      Inc(bcIndex);
      if bcIndex = bcList.Count then
        bcIndex := 0;
    end;
    d := d + banCi.SwitchTime / 24;
  end;
end;

end.
