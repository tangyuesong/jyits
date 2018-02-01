unit USearchYJCLKJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGridFrame, cxGraphics,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, dxLayoutcxEditAdapters, dxpicdata, uEntity,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, System.Actions, uGlobal, uFrameInput, Vcl.ActnList,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  Udictionary, uRequestItf, uJsonUtils, cxEditRepositoryItems, sDialogs,
  uCommon;

type
  TSearchYJCLKJ = class(TdxGridFrame)
    DTKSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbJC: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    edthphm: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    cbbHPZL: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    cbbYJLX: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    ActionList1: TActionList;
    ActionDetail: TAction;
    ActionSMS: TAction;
    btnExport: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    procedure ActionDetailExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ActionSMSExecute(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    { Private declarations }
    FParams: String;
    FDetail: TdxFramePicData;
    FFrameInput: TFrameInput;
    procedure FrameInputbtnSaveClick(Sender: TObject);
  protected
    procedure LoadData; override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  SearchYJCLKJ: TSearchYJCLKJ;

implementation

{$R *.dfm}
{ TSearchYJCLKJ }

procedure TSearchYJCLKJ.ActionDetailExecute(Sender: TObject);
begin
  inherited;
  if FDMemTable1.FieldByName('HPHM').AsString = '-' then
    exit;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(self);
    FDetail.Parent := self;
    FDetail.Align := TAlign.alClient;
  end;
  FDetail.HPHM := FDMemTable1.FieldByName('HPHM').AsString;
  FDetail.HPZL := FDMemTable1.FieldByName('HPZL').AsString;
  FDetail.LoadPassList;
  FDetail.Show;
end;

procedure TSearchYJCLKJ.ActionSMSExecute(Sender: TObject);
var
  s, HPHM, HPZL: string;
  list: TList<T_KK_ALARM>;
  item: T_KK_ALARM;
begin
  inherited;
  if not Assigned(FFrameInput) then
  begin
    FFrameInput := TFrameInput.Create(self);
    FFrameInput.Parent := self;
    FFrameInput.Top := (self.Height - FFrameInput.Height) div 2;
    FFrameInput.Left := (self.Width - FFrameInput.Width) div 2;
    FFrameInput.btnSave.OnClick := self.FrameInputbtnSaveClick;
    FFrameInput.btnExit.OnClick := self.FrameInputbtnSaveClick;
  end;
  dxLayoutControl2Group_Root.Visible := false;
  HPHM := FDMemTable1.FieldByName('HPHM').AsString;
  HPZL := FDMemTable1.FieldByName('HPZL').AsString;
  s := TRequestItf.DbQuery('GetT_KK_ALARM', 'hphm=' + HPHM + '&hpzl=' + HPZL);
  list := TJSONUtils.JsonToRecordList<T_KK_ALARM>(s);
  if list <> nil then
  begin
    s := '';
    for item in list do
    begin
      if item.SJHM <> '' then
        s := s + ',' + item.SJHM;
    end;
    if s <> '' then
      FFrameInput.edtCZSJ.Text := s.Substring(1);
    list.Free;
  end;
  FFrameInput.Show;
end;

procedure TSearchYJCLKJ.FrameInputbtnSaveClick(Sender: TObject);
var
  SJHM, HPHM, HPZL, s: string;
  list: TList<T_KK_ALARM>;
  item: T_KK_ALARM;
begin
  SJHM := FFrameInput.edtCZSJ.Text;
  if (Sender = FFrameInput.btnSave) and (SJHM.Length >= 11) then
  begin
    HPHM := FDMemTable1.FieldByName('HPHM').AsString;
    HPZL := FDMemTable1.FieldByName('HPZL').AsString;
    s := TRequestItf.DbQuery('GetT_KK_ALARM', 'hphm=' + HPHM + '&hpzl=' + HPZL);
    list := TJSONUtils.JsonToRecordList<T_KK_ALARM>(s);
    if list <> nil then
    begin
      if list.Count > 0 then
        TRequestItf.DbQuery('ModifyT_KK_ALARM', 'SYSTEMID=' + list[0].SYSTEMID +
          '&SJHM=' + SJHM);
      list.Free;
    end;

  end;
  FFrameInput.Hide;
  dxLayoutControl2Group_Root.Visible := true;
end;

procedure TSearchYJCLKJ.AfterConstruction;
begin
  inherited;
  if TLZDictionary.gDicMain.ContainsKey('JC') then
    TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gDicMain['JC'], true);
  if TLZDictionary.gDicMain.ContainsKey('HPZL') then
    TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gDicMain['HPZL'], true);
  if TLZDictionary.gDicMain.ContainsKey('BKLX') then
    TLZDictionary.BindCombobox(cbbYJLX, TLZDictionary.gDicMain['BKLX'], true);
  DTKSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now - 30));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now + 1));
  cbbHPZL.ItemIndex := 1;
  cbbJC.ItemIndex := 18;
  GridColumns := 'HPZL,HPHM,ZCCXDD,CJJG,ZCCXSJ,ZHGCSJ,C1,详细信息';
  GridView.Columns[7].Options.ShowEditButtons := isebAlways;
  GridView.Columns[7].RepositoryItem := cxdtrpstry1ButtonItem1;
  FDMemTable1.FieldDefs.Add('HPZL', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('HPHM', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('ZCCXDD', ftString, 100, false);
  FDMemTable1.FieldDefs.Add('CJJG', ftString, 100, false);
  FDMemTable1.FieldDefs.Add('ZCCXSJ', ftString, 100, false);
  FDMemTable1.FieldDefs.Add('ZHGCSJ', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('C1', ftInteger, 0, false);
  FDMemTable1.IndexDefs.Add('index', 'C1', [ixDescending]);
  FDMemTable1.IndexName := 'index';
end;

procedure TSearchYJCLKJ.btnExportClick(Sender: TObject);
begin
  inherited;
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    Tcommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    FreeFrameWait;
    Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TSearchYJCLKJ.cxButton1Click(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TSearchYJCLKJ.LoadData;
var
  vdt, vdt2, zt, HPHM, HPZL, Param: string;
  s: string;
  pageSize, pageIndex: Integer;
begin
  inherited;
  vdt := DTKSSJ.Text;
  vdt2 := FormatDateTime('yyyy/mm/dd', DTJSSJ.Date + 1);
  Param := Format('yhbh=%s&kssj=%s&jssj=%s', [gUser.YHBH, vdt, vdt2]);
  if cbbYJLX.Text <> '' then
  begin
    zt := TLZDictionary.StrtoDicInfo(cbbYJLX.Text).dm;
  end;

  if edthphm.Text <> '' then
  begin
    HPHM := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + edthphm.Text;
    HPZL := TLZDictionary.StrtoDicInfo(cbbHPZL.Text).dm;
  end;
  Param := Param + '&yjlx=' + zt + '&hphm=' + HPHM + '&hpzl=' + HPZL;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&rows=%s&start=%s',
    [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetVehPassTotal', Param);
  FParams := Param;
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', false);
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

end.
