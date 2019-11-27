unit uYcydConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Actions, Vcl.ActnList, sDialogs, cxEditRepositoryItems,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, Vcl.StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, DateUtils, StrUtils, Udictionary, uEntity,
  uJsonUtils, uRequestItf, uDialogYcydEdit;

type
  TFrameYcydConfig = class(TdxGridFrame)
    dxLayoutItem1: TdxLayoutItem;
    cmbMonth: TcxComboBox;
    dxLayoutItem2: TdxLayoutItem;
    cmbDwmc: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    BtnSearch: TcxButton;
    BtnAdd: TcxButton;
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
  private
    FYcydEdit: TDialogYcydEdit;
    function GetDwdm: String;
    procedure ShowTaskEdit(AIsM: Boolean);
    procedure TaskEditSaveClick(Sender: TObject);
    procedure TaskEditExitClick(Sender: TObject);
    function GetKpis: String;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameYcydConfig: TFrameYcydConfig;

implementation

{$R *.dfm}
{ TFrameYcydConfig }

procedure TFrameYcydConfig.AfterConstruction;
var
  I, MT, YT: Integer;
  Y, M, D, H, N, S, SS: Word;
  MM: String;
  dept: TDept;
  str: TStringList;
begin
  inherited;
  cmbMonth.Properties.Items.Clear;
  DateUtils.DecodeDateTime(Now, Y, M, D, H, N, S, SS);
  if M = 12 then
    MM := IntToStr(Y + 1) + '01'
  else
    MM := IntToStr(Y) + StrUtils.RightStr('0' + IntToStr(M + 1), 2);

  cmbMonth.Properties.Items.Add(MM);

  for I := 0 to 11 do
  begin
    MT := M - I;
    YT := Y;
    if MT <= 0 then
    begin
      MT := MT + 12;
      YT := YT - 1;
    end;
    MM := IntToStr(YT) + StrUtils.RightStr('0' + IntToStr(MT), 2);
    cmbMonth.Properties.Items.Add(MM);
  end;

  str := TStringList.Create;
  str.Sort;
  str.Sorted := True;

  for dept in TLZDictionary.gDicDept.Values do
    str.Add(dept.DWMC);

  cmbDwmc.Properties.Items.AddStrings(str);
  str.Free;

  GridColumns := GetKpis + ', 操作';
  BtnSearchClick(nil);
end;

procedure TFrameYcydConfig.BtnAddClick(Sender: TObject);
begin
  inherited;
  ShowTaskEdit(False);
end;

procedure TFrameYcydConfig.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('是否确定删除?', '提示', MB_YESNO + MB_ICONQUESTION) = mrYes
  then
  begin
    TRequestItf.DbQuery('DelJGTask', 'dwdm=' + FDMemTable1.FieldByName('dwdm')
      .AsString + '&month=' + FDMemTable1.FieldByName('month').AsString);
    FDMemTable1.Delete;
  end;
end;

procedure TFrameYcydConfig.acteditExecute(Sender: TObject);
begin
  inherited;
  ShowTaskEdit(True);
end;

procedure TFrameYcydConfig.BtnSearchClick(Sender: TObject);
var
  Param, dwdm, month, S: String;
  tb: TFDMemTable;
begin
  inherited;
  month := Trim(cmbMonth.Text);
  if month = '' then
    month := formatDatetime('YYYYMM', Now);
  Param := 'month=' + month;
  dwdm := GetDwdm;
  if dwdm <> '' then
    Param := Param + '&dwdm=' + dwdm;
  ShowFrameWait;

  S := TRequestItf.DbQuery('GetJGYcydConfig', Param);
  if S <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(S, tb, '');
    FDMemTable1.Close;
    FDMemTable1.CreateDataSet;
    FDMemTable1.DisableControls;
    while not tb.Eof do
    begin
      if FDMemTable1.LocateEx('DWDM', tb.FieldByName('DWDM').AsString) then
        FDMemTable1.Edit
      else
      begin
        FDMemTable1.Append;
        FDMemTable1.FieldByName('MONTH').AsString :=
          tb.FieldByName('MONTH').AsString;
        FDMemTable1.FieldByName('DWDM').AsString :=
          tb.FieldByName('DWDM').AsString;
      end;
      FDMemTable1.FieldByName(tb.FieldByName('KPINAME').AsString).AsString :=
        tb.FieldByName('TASKNUM').AsString;
      FDMemTable1.Post;
      tb.Next;
    end;
    FDMemTable1.EnableControls;
    tb.Free;
  end;
  FreeFrameWait;
end;

function TFrameYcydConfig.GetDwdm: String;
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

function TFrameYcydConfig.GetKpis: String;
var
  S, kpiName: string;
  tb: TFDMemTable;
begin
  Result := 'MONTH,DWDM';
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('MONTH', ftString, 100);
  FDMemTable1.FieldDefs.Add('DWDM', ftString, 200);

  S := TRequestItf.DbQuery('GetJGKPI','ycyd=1');
  if S <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(S, tb, '');
    while not tb.Eof do
    begin
      kpiName := tb.FieldByName('kpiName').AsString;
      Result := Result + ',' + kpiName;
      FDMemTable1.FieldDefs.Add(kpiName, ftString, 100);
      tb.Next;
    end;
    tb.Free;
  end;
  FDMemTable1.IndexDefs.Add('index', 'DWDM', [ixPrimary]);
end;

procedure TFrameYcydConfig.ShowTaskEdit(AIsM: Boolean);
var
  I: Integer;
begin
  if not Assigned(FYcydEdit) then
  begin
    FYcydEdit := TDialogYcydEdit.Create(self);
    FYcydEdit.Parent := self;
    FYcydEdit.Top := 20;
    FYcydEdit.Left := (self.Width - FYcydEdit.Width) div 2;
    FYcydEdit.btnSave.OnClick := self.TaskEditSaveClick;
    FYcydEdit.btnExit.OnClick := self.TaskEditExitClick;
  end;

  if not AIsM then
  begin
    FYcydEdit.cmbMonth.Properties.ReadOnly := False;
    FYcydEdit.cmbDwmc.Properties.ReadOnly := False;
    FYcydEdit.cmbMonth.Text := '';
    FYcydEdit.cmbDwmc.Text := '';

    for I := 0 to FYcydEdit.dxLayoutGroup3.ComponentCount - 1 do
    begin
      if FYcydEdit.dxLayoutGroup3.Components[I] is TdxLayoutItem then
        if (FYcydEdit.dxLayoutGroup3.Components[I] as TdxLayoutItem).Control is TcxTextEdit
        then
          ((FYcydEdit.dxLayoutGroup3.Components[I] as TdxLayoutItem)
            .Control as TcxTextEdit).Text := '0';
    end;
  end
  else
  begin
    FYcydEdit.cmbMonth.Properties.ReadOnly := True;
    FYcydEdit.cmbDwmc.Properties.ReadOnly := True;
    FYcydEdit.cmbMonth.Text := FDMemTable1.FieldByName('Month').AsString;
    FYcydEdit.cmbDwmc.Text := TLZDictionary.gDicDept
      [FDMemTable1.FieldByName('dwdm').AsString].DWMC;

    for I := 0 to FYcydEdit.dxLayoutGroup3.ComponentCount - 1 do
    begin
      if FYcydEdit.dxLayoutGroup3.Components[I] is TdxLayoutItem then
        if (FYcydEdit.dxLayoutGroup3.Components[I] as TdxLayoutItem).Control is TcxTextEdit
        then
          ((FYcydEdit.dxLayoutGroup3.Components[I] as TdxLayoutItem)
            .Control as TcxTextEdit).Text :=
            FDMemTable1.FieldByName
            ((FYcydEdit.dxLayoutGroup3.Components[I] as TdxLayoutItem)
            .CaptionOptions.Text).AsString;
    end;
  end;

  dxLayoutControl2Group_Root.Visible := False;
  FYcydEdit.Visible := True;
end;

procedure TFrameYcydConfig.TaskEditExitClick(Sender: TObject);
begin
  FYcydEdit.Visible := False;
  dxLayoutControl2Group_Root.Visible := True;
end;

procedure TFrameYcydConfig.TaskEditSaveClick(Sender: TObject);
begin
  if FYcydEdit.SaveData then
  begin
    FYcydEdit.Visible := False;
    dxLayoutControl2Group_Root.Visible := True;
    BtnSearchClick(nil);
  end;
end;

end.
