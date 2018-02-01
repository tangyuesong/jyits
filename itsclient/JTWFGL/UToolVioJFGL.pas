unit UToolVioJFGL;

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
  dxCore, System.DateUtils, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar, dxBar, cxClasses,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, dxFrame,
  dxDialogBase, UFrameVioJFGL, USetup, Udictionary, uCommon, uRequestItf,
  uEntity, uJsonUtils, frxClass, uGlobal, cxEditRepositoryItems, UFrameJFPic,
  sDialogs, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, cxLabel;

type
  TFToolVioJFGL = class(TToolGridFrame)
    btnInput: TdxBarLargeButton;
    btnUpdate: TdxBarLargeButton;
    btnPrint: TdxBarLargeButton;
    DtKSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DtJSSJ: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbJC: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    edthphm: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    cbbhpzl: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    Edtjdsbh: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    frxrprt1: TfrxReport;
    btnVideoSetup: TdxBarLargeButton;
    btnFtpSetup: TdxBarLargeButton;
    BtnAdd: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    Timer1: TTimer;
    procedure btnInputClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnVideoSetupClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FrameVioJFGL: TFrameVioJFGL;
    FrameJFPic: TFrameJFPic;
    procedure InsertTable(obj: TVioClass);
    procedure ShowFrameEdit;
    { Private declarations }
  protected
    procedure LoadData; override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
    procedure Print(obj: TVioClass);
  end;

var
  FToolVioJFGL: TFToolVioJFGL;

implementation

{$R *.dfm}

uses
  UFrameJFVideo, UFrameJFFTP;

procedure TFToolVioJFGL.Print(obj: TVioClass);
begin
  frxrprt1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '1.fr3');
  TfrxMemoView(frxrprt1.FindObject('dsr')).Memo.Text := obj.dsr;
  TfrxMemoView(frxrprt1.FindObject('jszh')).Memo.Text := obj.jszh;
  TfrxMemoView(frxrprt1.FindObject('wfsjn')).Memo.Text := Copy(obj.WFSJ, 1, 4);
  TfrxMemoView(frxrprt1.FindObject('wfsjy')).Memo.Text := Copy(obj.WFSJ, 6, 2);
  TfrxMemoView(frxrprt1.FindObject('wfsjr')).Memo.Text := Copy(obj.WFSJ, 9, 2);
  TfrxMemoView(frxrprt1.FindObject('wfsjs')).Memo.Text := Copy(obj.WFSJ, 12, 2);
  TfrxMemoView(frxrprt1.FindObject('wfsjf')).Memo.Text := Copy(obj.WFSJ, 15, 2);
  TfrxMemoView(frxrprt1.FindObject('hphm')).Memo.Text := obj.HPHM;
  if TLZDictionary.gDicMain.ContainsKey('HPZL') and TLZDictionary.gDicMain
    ['hpzl'].ContainsKey(obj.HPZL) then
    TfrxMemoView(frxrprt1.FindObject('hpzl')).Memo.Text :=
      TLZDictionary.gDicMain['hpzl'][obj.HPZL]
  else
    TfrxMemoView(frxrprt1.FindObject('hpzl')).Memo.Text := obj.HPZL;
  TfrxMemoView(frxrprt1.FindObject('wfdz')).Memo.Text := obj.wfdz;
  if TLZDictionary.gDicWfxw.ContainsKey(obj.WFXW) then
    TfrxMemoView(frxrprt1.FindObject('wfxwmc')).Memo.Text :=
      TLZDictionary.gDicWfxw[obj.WFXW].wfxwmc
  else
    TfrxMemoView(frxrprt1.FindObject('wfxwmc')).Memo.Text := obj.WFXW;
  TfrxMemoView(frxrprt1.FindObject('wfxw')).Memo.Text := obj.WFXW;
  TfrxMemoView(frxrprt1.FindObject('fkje')).Memo.Text := obj.fkje;
  TfrxMemoView(frxrprt1.FindObject('wfjfs')).Memo.Text := obj.wfjfs;
  if Trim(obj.zjcx) <> '无' then
    TfrxMemoView(frxrprt1.FindObject('zjcx')).Memo.Text := obj.zjcx
  else
    TfrxMemoView(frxrprt1.FindObject('zjcx')).Memo.Text := '';
  TCommon.GetPic(obj.tplj, obj.tp1, gSetup.DirSave + '\' + obj.tp1);
  TCommon.GetPic(obj.tplj, obj.tp2, gSetup.DirSave + '\' + obj.tp2);

  if FileExists(gSetup.DirSave + '\' + obj.tp1) then
    TfrxPictureView(frxrprt1.FindObject('pic1')).Picture.LoadFromFile
      (gSetup.DirSave + '\' + obj.tp1);
  if FileExists(gSetup.DirSave + '\' + obj.tp2) then
    TfrxPictureView(frxrprt1.FindObject('pic2')).Picture.LoadFromFile
      (gSetup.DirSave + '\' + obj.tp2);
  frxrprt1.PrepareReport;
  frxrprt1.PrintOptions.ShowDialog := False;
  frxrprt1.Print;
  // frxrprt1.ShowPreparedReport;
end;

procedure TFToolVioJFGL.ShowFrameEdit;
begin
  if not Assigned(FrameVioJFGL) then
  begin
    FrameVioJFGL := TFrameVioJFGL.Create(Self);
    with FrameVioJFGL do
    begin
      Parent := Self;
      top := 0;
      Left := (Self.Width - Width) div 2;
      FrameVioJFGL.OnOK := InsertTable;
      FrameVioJFGL.OnClose := Self.CloseFrame;
      FrameVioJFGL.OnPrint := Print;
    end;
  end;
  FrameVioJFGL.ClearControls(FrameVioJFGL);
  FrameVioJFGL.edtjdsbh6.Text := Copy(gUser.DWDM, 1, 6);
  if not FrameVioJFGL.Timer1.Enabled then
    FrameVioJFGL.Timer1.Enabled := True;
  FrameVioJFGL.Show;
end;

procedure TFToolVioJFGL.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  LoadData;
end;

procedure TFToolVioJFGL.acteditExecute(Sender: TObject);
begin
  inherited;
  btnUpdateClick(nil);
end;

procedure TFToolVioJFGL.actnewExecute(Sender: TObject);
begin
  inherited;
  btnPrintClick(nil);
end;

procedure TFToolVioJFGL.actViewExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(FrameJFPic) then
    FrameJFPic := TFrameJFPic.Create(Self);
  with FrameJFPic do
  begin
    Parent := Self;
    TCommon.GetPic(FDMemTable1.FieldByName('tplj').AsString,
      FDMemTable1.FieldByName('tp1').AsString, gSetup.DirSave + '\' +
      'temp1.jpg');
    if FileExists(gSetup.DirSave + '\' + 'temp1.jpg') then
      cxImage1.Picture.LoadFromFile(gSetup.DirSave + '\' + 'temp1.jpg');
    TCommon.GetPic(FDMemTable1.FieldByName('tplj').AsString,
      FDMemTable1.FieldByName('tp2').AsString, gSetup.DirSave + '\' +
      'temp2.jpg');
    if FileExists(gSetup.DirSave + '\' + 'temp2.jpg') then
      cxImage2.Picture.LoadFromFile(gSetup.DirSave + '\' + 'temp2.jpg');
    edtwfxw.Text := TLZDictionary.gDicWfxw[FDMemTable1.FieldByName('wfxw')
      .AsString].wfxwmc;
    edtfkje.Text := FDMemTable1.FieldByName('fkje').AsString;
    edtjf.Text := FDMemTable1.FieldByName('wfjfs').AsString;
    Show;
  end;

end;

procedure TFToolVioJFGL.AfterConstruction;
begin
  inherited;
  GridColumns := 'JDSBH,DSR,HPHM,HPZL,JDCSYR,WFXW,WFSJ,WFDZ,YHBH,GXSJ,操作';
  GridView.Columns[10].Width := 120;
  GridView.Columns[10].Options.ShowEditButtons := isebAlways;
  GridView.Columns[10].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible :=
    btnUpdate.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible :=
    btnPrint.Enabled;
  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gDicMain['JC'], True);
  cbbJC.ItemIndex := 18;
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
  cbbhpzl.ItemIndex := 1;
  DtKSSJ.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', Now - 30));
  DtJSSJ.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', Now));
end;

procedure TFToolVioJFGL.BtnAddClick(Sender: TObject);
begin
  inherited;
  btnInputClick(nil);
end;

procedure TFToolVioJFGL.btnInputClick(Sender: TObject);
begin
  inherited;
  ShowFrameEdit;
  FrameVioJFGL.EditID := TEditStatus.esNew;
  Self.EnableControls(False);
end;

procedure TFToolVioJFGL.btnVideoSetupClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FrameJFVideo) then
  begin
    FrameJFVideo := TFrameJFVideo.Create(Self);
    with FrameJFVideo do
    begin
      Parent := Self;
      top := 0;
      Left := (Self.Width - Width) div 2;
    end;
  end;
  FrameJFVideo.Show;
  Self.EnableControls(False);
end;

procedure TFToolVioJFGL.btnUpdateClick(Sender: TObject);
var
  gxsj: TDateTime;
begin
  inherited;
  gxsj := TCommon.StringToDT(FDMemTable1.FieldByName('gxsj').AsString);
  if Now - gxsj > OneMinute * 10 then
  begin
    Application.MessageBox('超过10分不能修改', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if FDMemTable1.IsEmpty then
  begin
    Application.MessageBox('没有数据可以修改', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  ShowFrameEdit;
  FrameVioJFGL.EditID := TEditStatus.esModify;
  FrameVioJFGL.WFJFlist := TJSONUtils.TableToRecord<TVioClass>(FDMemTable1);
  EnableControls(False);
end;

procedure TFToolVioJFGL.btnPrintClick(Sender: TObject);
var
  vio: TVioClass;
begin
  inherited;
  vio := TJSONUtils.TableToRecord<TVioClass>(FDMemTable1);
  Print(vio);
  Application.MessageBox('打印成功', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TFToolVioJFGL.btnSearchClick(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFToolVioJFGL.InsertTable(obj: TVioClass);
begin
  if FrameVioJFGL.EditID = TEditStatus.esModify then
    FDMemTable1.Delete;
  TJSONUtils.AppendRecordToTable<TVioClass>(@obj, FDMemTable1);
end;

procedure TFToolVioJFGL.LoadData;
var
  json, Param: string;
  HPHM, HPZL, vdt, vdt2, jdsbh: string;
  pageSize, pageIndex: Integer;
begin
  inherited;
  vdt := DtKSSJ.Text;
  vdt2 := FormatDateTime('yyyy/mm/dd', DtJSSJ.Date + 1);
  if (vdt = '') or (vdt2 = '') then
  begin
    Application.MessageBox('开始时间和结束时间必须填写', '提示', MB_OK + MB_ICONSTOP);
    exit;
  end;
  if gUser.Manager then
    Param := 'like_dwdm=' + TCommon.GetXZQH(gUser.DWDM)
  else
    Param := 'a.yhbh=' + gUser.yhbh;

  Param := Param + Format('&begin_lrsj=%s&end_lrsj=%s', [vdt, vdt2]);
  if edthphm.Text <> '' then
  begin
    HPHM := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + edthphm.Text;
    HPZL := TLZDictionary.StrtoDicInfo(cbbhpzl.Text).dm;
    Param := Param + Format('&hphm=%s&hpzl=%s', [HPHM, HPZL]);
  end;
  jdsbh := Edtjdsbh.Text;
  if jdsbh <> '' then
    Param := Param + Format('&jdsbh=%s', [jdsbh]);
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&rows=%s&start=%s&orderby_desc=GXSJ',
    [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  json := TRequestItf.pDbQuery('GetSorceProcess', Param);
  TJSONUtils.JSONToDataSet(json, FDMemTable1, '');
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

end.
