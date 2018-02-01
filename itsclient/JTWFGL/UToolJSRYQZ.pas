unit UToolJSRYQZ;

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
  dxDialogBase, UFrameJSRYQZ, USetup, Udictionary, uCommon, uRequestItf,
  uEntity, uJsonUtils, frxClass, uGlobal, cxEditRepositoryItems, UFrameJSRPic,
  sDialogs, System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TFToolJSRYQZ = class(TToolGridFrame)
    btnInput: TdxBarLargeButton;
    btnUpdate: TdxBarLargeButton;
    btnPrint: TdxBarLargeButton;
    DtKSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DtJSSJ: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
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
    FrameJSRYQZ: TFrameJSRYQZ;
    FrameJSRPic: TFrameJSRPic;
    procedure InsertTable(obj: Tjsryqz);
    procedure ShowFrameEdit;
    { Private declarations }
  protected
    procedure LoadData; override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
    procedure Print(obj: Tjsryqz);
  end;

var
  FToolJSRYQZ: TFToolJSRYQZ;

implementation

{$R *.dfm}

uses
  UFrameJFVideo, UFrameJFFTP, UFrameJFPic;

procedure TFToolJSRYQZ.Print(obj: Tjsryqz);
begin
  frxrprt1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '2.fr3');
  TfrxMemoView(frxrprt1.FindObject('dsr')).Memo.Text := obj.xm;
  TfrxMemoView(frxrprt1.FindObject('jszh')).Memo.Text := obj.sfzhm;
  TfrxMemoView(frxrprt1.FindObject('wfsjn')).Memo.Text := Copy(obj.gxsj, 1, 4);
  TfrxMemoView(frxrprt1.FindObject('wfsjy')).Memo.Text := Copy(obj.gxsj, 6, 2);
  TfrxMemoView(frxrprt1.FindObject('wfsjr')).Memo.Text := Copy(obj.gxsj, 9, 2);
  TfrxMemoView(frxrprt1.FindObject('wfsjs')).Memo.Text := Copy(obj.gxsj, 12, 2);
  TfrxMemoView(frxrprt1.FindObject('wfsjf')).Memo.Text := Copy(obj.gxsj, 15, 2);
  TfrxMemoView(frxrprt1.FindObject('cljgmc')).Memo.Text := obj.cljgmc;
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

procedure TFToolJSRYQZ.ShowFrameEdit;
begin
  if not Assigned(FrameJSRYQZ) then
  begin
    FrameJSRYQZ := TFrameJSRYQZ.Create(Self);
    with FrameJSRYQZ do
    begin
      Parent := Self;
      top := 0;
      Left := (Self.Width - Width) div 2;
      OnOK := InsertTable;
      OnClose := Self.CloseFrame;
      OnPrint := Print;
    end;
  end;
  FrameJSRYQZ.ClearControls(FrameJSRYQZ);
  if not FrameJSRYQZ.Timer1.Enabled then
    FrameJSRYQZ.Timer1.Enabled := True;
  FrameJSRYQZ.Show;
end;

procedure TFToolJSRYQZ.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  LoadData;
end;

procedure TFToolJSRYQZ.acteditExecute(Sender: TObject);
begin
  inherited;
  btnUpdateClick(nil);
end;

procedure TFToolJSRYQZ.actnewExecute(Sender: TObject);
begin
  inherited;
  btnPrintClick(nil);
end;

procedure TFToolJSRYQZ.actViewExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(FrameJSRPic) then
    FrameJSRPic := TFrameJSRPic.Create(Self);
  with FrameJSRPic do
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
    edtSfzhm.Text := FDMemTable1.FieldByName('SFZHM').AsString;
    edtXm.Text := FDMemTable1.FieldByName('XM').AsString;
    edtXb.Text := FDMemTable1.FieldByName('XB').AsString;
    edtLxdz.Text := FDMemTable1.FieldByName('LXZSXXDZ').AsString;
    Show;
  end;

end;

procedure TFToolJSRYQZ.AfterConstruction;
begin
  inherited;
  GridColumns := 'SFZHM,XM,XB,LXZSXXDZ,cljgmc,YHBH,GXSJ,操作';
  GridView.Columns[7].Options.ShowEditButtons := isebAlways;
  GridView.Columns[7].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible :=
    btnUpdate.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible :=
    btnPrint.Enabled;
  DtKSSJ.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', Now - 30));
  DtJSSJ.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', Now));
end;

procedure TFToolJSRYQZ.BtnAddClick(Sender: TObject);
begin
  inherited;
  btnInputClick(nil);
end;

procedure TFToolJSRYQZ.btnInputClick(Sender: TObject);
begin
  inherited;
  ShowFrameEdit;
  FrameJSRYQZ.EditID := TEditStatus.esNew;
  Self.EnableControls(False);
end;

procedure TFToolJSRYQZ.btnVideoSetupClick(Sender: TObject);
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

procedure TFToolJSRYQZ.btnUpdateClick(Sender: TObject);
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
  FrameJSRYQZ.EditID := TEditStatus.esModify;
  FrameJSRYQZ.Drvlist := TJSONUtils.TableToRecord<Tjsryqz>(FDMemTable1);
  EnableControls(False);
end;

procedure TFToolJSRYQZ.btnPrintClick(Sender: TObject);
var
  drv: Tjsryqz;
begin
  inherited;
  drv := TJSONUtils.TableToRecord<Tjsryqz>(FDMemTable1);
  Print(drv);
  Application.MessageBox('打印成功', '提示', MB_OK + MB_ICONINFORMATION);
end;

procedure TFToolJSRYQZ.btnSearchClick(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFToolJSRYQZ.InsertTable(obj: Tjsryqz);
begin
  if FrameJSRYQZ.EditID = TEditStatus.esModify then
    FDMemTable1.Delete;
  TJSONUtils.AppendRecordToTable<Tjsryqz>(@obj, FDMemTable1);
end;

procedure TFToolJSRYQZ.LoadData;
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
    Param := 'like_cljg=' + TCommon.GetXZQH(gUser.DWDM)
  else
    Param := 'yhbh=' + gUser.yhbh;

  Param := Param + Format('&begin_lrsj=%s&end_lrsj=%s', [vdt, vdt2]);
  jdsbh := Edtjdsbh.Text;
  if jdsbh <> '' then
    Param := Param + Format('&sfzhm=%s', [jdsbh]);
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&rows=%s&start=%s&orderby_desc=GXSJ',
    [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  json := TRequestItf.pDbQuery('GetT_JSRYQZ', Param);
  TJSONUtils.JSONToDataSet(json, FDMemTable1, '');
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

end.
