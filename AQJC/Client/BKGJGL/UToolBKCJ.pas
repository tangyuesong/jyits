unit UToolBKCJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
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
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, dxSkinsdxBarPainter, cxContainer,
  Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, dxBar, cxClasses,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, Udictionary,
  uRequestItf, uJsonUtils, UFrameBKCJ, uCommon, uEntity, cxEditRepositoryItems,
  sDialogs, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TFToolBKCJ = class(TToolGridFrame)
    btnInput: TdxBarLargeButton;
    btnUpdate: TdxBarLargeButton;
    btnCheck: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
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
    cbbZT: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    btnSearch: TcxButton;
    btnDel: TdxBarLargeButton;
    cxButton1: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    Timer1: TTimer;
    procedure btnSearchClick(Sender: TObject);
    procedure btnInputClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure edthphmKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FrameBKCJ: TFrameBKCJ;
    procedure InsertTable(obj: TBKCJResult);
  protected
    procedure LoadData; override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FToolBKCJ: TFToolBKCJ;

implementation

{$R *.dfm}

{ TFToolBKCJ }
procedure TFToolBKCJ.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);
end;

procedure TFToolBKCJ.acteditExecute(Sender: TObject);
begin
  inherited;
  btnUpdateClick(nil);
end;

procedure TFToolBKCJ.actnewExecute(Sender: TObject);
begin
  inherited;
  btnCheckClick(nil);
end;

procedure TFToolBKCJ.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gDicMain['JC'], true);
  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gDicMain['HPZL'], true);
  DTKSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', Now - 30));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', Now + 1));
  cbbJC.ItemIndex := 18;
  cbbHPZL.ItemIndex := 1;
  cbbZT.ItemIndex := 0;
  GridColumns := 'bkxh,bkr,HPHM,HPZL,BKLX,gxsj,����';
  GridView.Columns[6].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible :=
    btnUpdate.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible :=
    btnCheck.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := btnDel.Enabled;
end;

procedure TFToolBKCJ.btnSearchClick(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFToolBKCJ.btnInputClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FrameBKCJ) then
  begin
    FrameBKCJ := TFrameBKCJ.Create(Self);
    with FrameBKCJ do
    begin
      Parent := Self;
      top := 120;
      Left := (Self.Width - Width) div 2;
      FrameBKCJ.OnOK := InsertTable;
    end;
  end;
  FrameBKCJ.ClearControls(FrameBKCJ);
  FrameBKCJ.BKXH := FormatDateTime('yyyymmddhhmmsszzz', Now);
  FrameBKCJ.EditID := TEditStatus.esNew;
  FrameBKCJ.OnClose := Self.CloseFrame;
  FrameBKCJ.dxLayoutGroup6.Visible := False;
  FrameBKCJ.dxLayoutGroup7.Visible := False;
  FrameBKCJ.dxLayoutItem15.Visible := true;
  FrameBKCJ.Show;
  Self.EnableControls(False);
end;

procedure TFToolBKCJ.btnUpdateClick(Sender: TObject);
begin
  inherited;
  if FDMemTable1.IsEmpty then
  begin
    Application.MessageBox('û�п����޸ĵ�����', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if FDMemTable1.FieldByName('zt').AsString <> '0' then
  begin
    Application.MessageBox('�����ݲ��Ǵ����״̬,�����޸�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if not Assigned(FrameBKCJ) then
  begin
    FrameBKCJ := TFrameBKCJ.Create(Self);
    with FrameBKCJ do
    begin
      Parent := Self;
      top := 120;
      Left := (Self.Width - Width) div 2;
      FrameBKCJ.OnOK := InsertTable;
    end;
  end;
  FrameBKCJ.EditID := TEditStatus.esModify;
  FrameBKCJ.BKCJ := TJSONUtils.TableToRecord<TBKCJResult>(FDMemTable1);
  FrameBKCJ.BKXH := FDMemTable1.FieldByName('bkxh').AsString;
  FrameBKCJ.OnClose := Self.CloseFrame;
  FrameBKCJ.dxLayoutGroup6.Visible := False;
  FrameBKCJ.dxLayoutGroup7.Visible := False;
  FrameBKCJ.dxLayoutItem15.Visible := False;
  FrameBKCJ.Show;
  Self.EnableControls(False);
end;

procedure TFToolBKCJ.cxButton1Click(Sender: TObject);
begin
  inherited;
  btnInputClick(nil);
end;

procedure TFToolBKCJ.edthphmKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSearchClick(nil);

end;

procedure TFToolBKCJ.btnCheckClick(Sender: TObject);
begin
  inherited;
  if FDMemTable1.IsEmpty then
  begin
    Application.MessageBox('û�п�����˵�����', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if FDMemTable1.FieldByName('zt').AsString <> '0' then
  begin
    Application.MessageBox('�����ݲ��Ǵ����״̬', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if not Assigned(FrameBKCJ) then
  begin
    FrameBKCJ := TFrameBKCJ.Create(Self);
    with FrameBKCJ do
    begin
      Parent := Self;
      top := 120;
      Left := (Self.Width - Width) div 2;
      FrameBKCJ.OnOK := InsertTable;

    end;
  end;
  FrameBKCJ.EditID := TEditStatus.esApprove;
  FrameBKCJ.BKXH := FDMemTable1.FieldByName('bkxh').AsString;
  FrameBKCJ.BKCJ := TJSONUtils.TableToRecord<TBKCJResult>(FDMemTable1);
  FrameBKCJ.OnClose := Self.CloseFrame;
  FrameBKCJ.dxLayoutGroup7.Visible := true;
  FrameBKCJ.dxLayoutGroup6.Visible := False;
  FrameBKCJ.dxLayoutItem15.Visible := False;
  FrameBKCJ.Show;
  Self.EnableControls(False);
end;

procedure TFToolBKCJ.btnDelClick(Sender: TObject);
begin
  inherited;
  if FDMemTable1.IsEmpty then
  begin
    Application.MessageBox('û�п��Գ���������', '��ʾ', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if not Assigned(FrameBKCJ) then
  begin
    FrameBKCJ := TFrameBKCJ.Create(Self);
    with FrameBKCJ do
    begin
      Parent := Self;
      top := 120;
      Left := (Self.Width - Width) div 2;
      FrameBKCJ.OnOK := InsertTable;

    end;
  end;
  FrameBKCJ.EditID := TEditStatus.escancel;
  FrameBKCJ.BKXH := FDMemTable1.FieldByName('bkxh').AsString;
  FrameBKCJ.BKCJ := TJSONUtils.TableToRecord<TBKCJResult>(FDMemTable1);
  FrameBKCJ.OnClose := Self.CloseFrame;
  FrameBKCJ.dxLayoutGroup7.Visible := False;
  FrameBKCJ.dxLayoutGroup6.Visible := true;
  FrameBKCJ.dxLayoutItem15.Visible := False;
  FrameBKCJ.Show;
  Self.EnableControls(False);
end;

procedure TFToolBKCJ.InsertTable(obj: TBKCJResult);
begin
  if FrameBKCJ.EditID = TEditStatus.esNew then
    btnSearchClick(nil);
  if (FrameBKCJ.EditID = TEditStatus.esModify) or
    (FrameBKCJ.EditID = TEditStatus.esApprove) or
    (FrameBKCJ.EditID = TEditStatus.escancel) then
    FDMemTable1.Delete;
  if (FrameBKCJ.EditID = TEditStatus.esModify) then
    TJSONUtils.AppendRecordToTable<TBKCJResult>(@obj, FDMemTable1);
end;

procedure TFToolBKCJ.LoadData;
var
  vdt, vdt2, zt, hphm, hpzl, Param: string;
  s: string;
  json: string;
  pageSize, pageIndex: integer;
begin
  inherited;
  vdt := DTKSSJ.Text;
  vdt2 := FormatDateTime('yyyy/mm/dd', DTJSSJ.Date + 1);
  if (vdt = '') or (vdt2 = '') then
  begin
    Application.MessageBox('��ʼʱ��ͽ���ʱ�������д', '��ʾ', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  Param := Format('bkzl=1&begin_gxsj=%s&end_gxsj=%s', [vdt, vdt2]);
  zt := IntToStr(cbbZT.ItemIndex);
  if zt <> '' then
  begin
    Param := Param + Format('&zt=%s', [zt]);
  end;
  if edthphm.Text <> '' then
  begin
    hphm := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + edthphm.Text;
    hpzl := TLZDictionary.StrtoDicInfo(cbbHPZL.Text).dm;
    Param := Param + Format('&hphm=%s&hpzl=%s', [hphm, hpzl]);
  end;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&rows=%s&start=%s&orderby_desc=GXSJ',
    [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetT_KK_Alarm', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, 'GXSJ');
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TFToolBKCJ.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  LoadData;
end;

end.
