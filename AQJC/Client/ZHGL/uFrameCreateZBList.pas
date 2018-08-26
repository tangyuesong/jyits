unit uFrameCreateZBList;

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
  cxDropDownEdit, uRequestItf, uJsonUtils, Generics.Collections, DateUtils;

type
  TOK = procedure(days: Integer) of object;

  TZBRY = Record
    SYSTEMID: String;
    DWMC: String;
    BCLB: String;
    BCBH: String;
    ZBRY: String;
    RYDH: String;
    ZLZB: Boolean;
    ZRZB: Boolean;
  End;

  TFrameCreateZBList = class(TdxDialogBaseFrame)
    cboLD: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    cboMJ: TcxComboBox;
    dxLayoutItem2: TdxLayoutItem;
    cboXJ: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    edtDays: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    cbbDWMC: TcxComboBox;
    dxLayoutItem7: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
    procedure cbbDWMCPropertiesChange(Sender: TObject);
  private
    FDicLD: TDictionary<String, TZBRY>;
    FDicMJ: TDictionary<String, TZBRY>;
    FDicXJ: TDictionary<String, TZBRY>;
    FLsLD: TStrings;
    FLsMJ: TStrings;
    FLsXJ: TStrings;
    Fls67LD, Fls67MJ, Fls67XJ: TStrings; // ���ֵ�ֵ�࣬�����������ղ�ֵ��ģ����������Ȱ���
    FLDIndex, FMJIndex, FXJIndex: Integer;
    FOK: TOK;
    procedure InitData(ls: TStrings; dic: TDictionary<String, TZBRY>;
      lsRY: TList<TZBRY>; cobb: TcxComboBox);
    procedure SetZB(day: Integer);
    function GetZBRY(ADic: TDictionary<String, TZBRY>; ALs: TStrings;
      ALs67: TStrings; ADay: TDateTime; var AIndex: Integer): TZBRY;
    // AIndex��¼������һ��
  public
    property OnOK: TOK read FOK write FOK;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

var
  FrameCreateZBList: TFrameCreateZBList;

implementation

{$R *.dfm}

procedure TFrameCreateZBList.AfterConstruction;
var
  ls: TList<TZBRY>;
  ry: TZBRY;
begin
  inherited;
  cbbDWMC.Properties.Items.Clear;
  ls := TJsonUtils.JsonToRecordList<TZBRY>(TRequestItf.DbQuery('GetZB_Config',
    'ORDERBY=DWMC'));
  for ry in ls do
  begin
    if cbbDWMC.Properties.Items.IndexOf(ry.DWMC) < 0 then
      cbbDWMC.Properties.Items.Add(ry.DWMC);
  end;
  cbbDWMC.ItemIndex := 0;
end;

procedure TFrameCreateZBList.BeforeDestruction;
begin
  inherited;
  FDicLD.Free;
  FDicMJ.Free;
  FDicXJ.Free;
  FLsLD.Free;
  FLsMJ.Free;
  FLsXJ.Free;
  Fls67LD.Free;
  Fls67MJ.Free;
  Fls67XJ.Free;
end;

procedure TFrameCreateZBList.btnSaveClick(Sender: TObject);
var
  days: Integer;
begin
  inherited;
  days := StrToIntDef(Trim(edtDays.Text), 0);
  if days = 0 then
  begin
    Application.MessageBox('�������ò���ȷ', '��ʾ', MB_OK + MB_ICONERROR);
    Exit;
  end;
  SetZB(days);
  Self.Hide;
  if Assigned(OnOK) then
  begin
    OnOK(days);
  end;
end;

procedure TFrameCreateZBList.cbbDWMCPropertiesChange(Sender: TObject);
var
  ls: TList<TZBRY>;
  DWMC: String;
begin
  inherited;
  DWMC := cbbDWMC.Text;
  edtDays.Text := '30';
  FDicLD := TDictionary<String, TZBRY>.Create;
  FDicMJ := TDictionary<String, TZBRY>.Create;
  FDicXJ := TDictionary<String, TZBRY>.Create;
  FLsLD := TStringList.Create;
  FLsMJ := TStringList.Create;
  FLsXJ := TStringList.Create;
  Fls67LD := TStringList.Create;
  Fls67MJ := TStringList.Create;
  Fls67XJ := TStringList.Create;

  ls := TJsonUtils.JsonToRecordList<TZBRY>(TRequestItf.DbQuery('GetZB_Config',
    'BCLB=�쵼&ORDERBY=BCBH&DWMC=' + DWMC));
  InitData(FLsLD, FDicLD, ls, cboLD);
  ls := TJsonUtils.JsonToRecordList<TZBRY>(TRequestItf.DbQuery('GetZB_Config',
    'BCLB=��&ORDERBY=BCBH&DWMC=' + DWMC));
  InitData(FLsMJ, FDicMJ, ls, cboMJ);
  ls := TJsonUtils.JsonToRecordList<TZBRY>(TRequestItf.DbQuery('GetZB_Config',
    'BCLB=Э��&ORDERBY=BCBH&DWMC=' + DWMC));
  InitData(FLsXJ, FDicXJ, ls, cboXJ);
end;

procedure TFrameCreateZBList.InitData(ls: TStrings;
  dic: TDictionary<String, TZBRY>; lsRY: TList<TZBRY>; cobb: TcxComboBox);
var
  ry: TZBRY;
begin
  dic.Clear;
  cobb.Properties.Items.Clear;
  for ry in lsRY do
  begin
    cobb.Properties.Items.Add(ry.BCBH);
    dic.Add(ry.BCBH, ry);
    ls.Add(ry.BCBH);
  end;
  cobb.ItemIndex := 0;
  lsRY.Free;
end;

procedure TFrameCreateZBList.SetZB(day: Integer);
var
  s, DWMC: String;
  i, l, m, x: Integer;
  ry: TZBRY;
begin
  if TRequestItf.DbQuery('DelZB_List',
    'BEGIN_ZBSJ=' + FormatDatetime('YYYY-MM-DD', Now())) <> '1' then
  begin
    Application.MessageBox('����ֵ��ʧ��', '��ʾ', MB_OK + MB_ICONERROR);
    Exit;
  end;

  DWMC := cbbDWMC.Text;
  l := cboLD.ItemIndex - 1; // ������ѡ����Ǵ��İ࿪ʼ�ţ��ñ�����������ϴ��ŵ����ĸ���
  m := cboMJ.ItemIndex - 1;
  x := cboXJ.ItemIndex - 1;

  for i := 0 to day - 1 do
  begin
    s := 'ZBSJ=' + FormatDatetime('YYYY-MM-DD', Now() + i);
    ry := GetZBRY(FDicLD, FLsLD, Fls67LD, Now() + i, l);
    if ry.SYSTEMID <> '' then
      s := s + '&ZBLD=' + ry.ZBRY + '&LDDH=' + ry.RYDH;
    ry := GetZBRY(FDicMJ, FLsMJ, Fls67MJ, Now() + i, m);
    if ry.SYSTEMID <> '' then
      s := s + '&ZBMJ=' + ry.ZBRY + '&MJDH=' + ry.RYDH;
    ry := GetZBRY(FDicXJ, FLsXJ, Fls67XJ, Now() + i, x);
    if ry.SYSTEMID <> '' then
      s := s + '&ZBXJ=' + ry.ZBRY + '&XJDH=' + ry.RYDH;
    s := s + '&DWMC=' + DWMC;
    TRequestItf.DbQuery('AddZB_List', s);
  end;

end;

function TFrameCreateZBList.GetZBRY(ADic: TDictionary<String, TZBRY>;
  ALs, ALs67: TStrings; ADay: TDateTime; var AIndex: Integer): TZBRY;
var
  week: Integer;
  i, tmpIndex: Integer;
  ry: TZBRY;
begin
  Result.SYSTEMID := '';
  week := DayOfTheWeek(ADay);
  for i := 0 to ALs67.Count - 1 do
  begin
    ry := ADic[ALs[StrToInt(ALs67[i])]];
    if not ry.ZLZB and (week = 6) then
      continue;
    if not ry.ZRZB and (week = 7) then
      continue;
    ALs67.Delete(i);
    Result := ry;
    Exit;
  end;
  tmpIndex := AIndex;
  while True do
  begin
    inc(tmpIndex);
    if tmpIndex = ALs.Count then
      tmpIndex := 0;
    if not ADic[ALs[tmpIndex]].ZLZB and (week = 6) then
    begin
      if ALs67.IndexOf(IntToStr(tmpIndex)) < 0 then
        ALs67.Add(IntToStr(tmpIndex));
      if ALs67.Count = ALs.Count then // ȫ����Ա����Ϣ��û��ֵ��
        Exit
      else
        continue;
    end;
    if not ADic[ALs[tmpIndex]].ZRZB and (week = 7) then
    begin
      if ALs67.IndexOf(IntToStr(tmpIndex)) < 0 then
        ALs67.Add(IntToStr(tmpIndex));
      if ALs67.Count = ALs.Count then
        Exit
      else
        continue;
    end;
    Result := ADic[ALs[tmpIndex]];
    AIndex := tmpIndex;
    Exit;
  end;
end;

end.
