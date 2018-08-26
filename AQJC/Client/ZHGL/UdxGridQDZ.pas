unit UdxGridQDZ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
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
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, System.Actions, Vcl.ActnList,
  sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  cxTextEdit, Vcl.StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, uDM, UFrameQDZGL, uCommon, uEntity,
  uJsonUtils, uRequestItf, uGlobal, UFrameQDZRYSBSP, uFrameQDZView;

type
  TFrameQDZ = class(TdxGridFrame)
    BtnAdd: TcxButton;
    procedure BtnAddClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
  private
    FFrameQDZView: TFrameQDZView;
    FrameQDZGL: TFrameQDZGL;
    FrameQDZRYSBSP: TFrameQDZRYSBSP;
    procedure ShowFrameEdit;
    procedure InsertTable(obj: TQDZ);
    procedure LoadData; override;
    procedure CloseLayout; overload;
    procedure SetLayoutVisible(b: Boolean); overload;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameQDZ: TFrameQDZ;

implementation

{$R *.dfm}

uses
  UFrameVioJFGL;

procedure TFrameQDZ.LoadData;
var
  json, Param: string;
  pageSize, pageIndex: Integer;
begin
  inherited;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('rows=%s&start=%s', [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  json := TRequestItf.pDbQuery('GetT_QDZ_DEPT', Param);
  TJSONUtils.JSONToDataSet(json, FDMemTable1, '');
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TFrameQDZ.InsertTable(obj: TQDZ);
begin
  if FrameQDZGL.EditID = TEditStatus.esModify then
    FDMemTable1.Delete
  else begin
    edtPageIndex.Text := '0';
    loadData;
  end;
end;

procedure TFrameQDZ.actdeleteExecute(Sender: TObject);
var
  sysid: string;
  qdzdm: string;
begin
  inherited;
  sysid := Fdmemtable1.FieldByName('systemid').AsString;
  qdzdm := FDMemTable1.FieldByName('QDZDM').AsString;
  if Application.MessageBox('是否删除数据', '提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDOK then
  begin
    TRequestItf.DbQuery('DelT_QDZ_DEPT', 'SYSTEMID=' + sysid);
    Fdmemtable1.Delete;
    TRequestItf.DbQuery('DelT_QDZ_DEVICE', 'qdzdm=' + qdzdm);
    TRequestItf.DbQuery('DelT_QDZ_USER', 'qdzdm=' + qdzdm);
    TRequestItf.DbQuery('DelT_QDZ_VEDIO', 'qdzdm=' + qdzdm);
    // Application.MessageBox('删除成功', '提示', MB_OK + MB_ICONQUESTION);
  end;

end;

procedure TFrameQDZ.acteditExecute(Sender: TObject);
begin
  inherited;
  ShowFrameEdit;
  FrameQDZGL.EditID := TEditStatus.esModify;
  FrameQDZGL.Qdzlist := TJSONUtils.TableToRecord<TQDZ>(FDMemTable1);
  SetLayoutVisible(False);
end;

procedure TFrameQDZ.actnewExecute(Sender: TObject);
var
  DM: string;
begin
  inherited;
  DM := FDMemTable1.FieldByName('QDZDM').AsString;
  if not Assigned(FrameQDZRYSBSP) then
  begin
    FrameQDZRYSBSP := TFrameQDZRYSBSP.Create(Self);
    with FrameQDZRYSBSP do
    begin
      Parent := Self;
      top := 0;
      Left := (Self.Width - Width) div 2;

  //    OnOK := InsertTable;
      OnClose := CloseLayout;
    end;
  end;
  FrameQDZRYSBSP.qdzdm := DM;
  FrameQDZRYSBSP.loadData(TQZTXX.esRY);
  SetLayoutVisible(false);
  FrameQDZRYSBSP.QZTStatus := TQZTXX.esRY;
  FrameQDZRYSBSP.Show;
end;

procedure TFrameQDZ.actViewExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(FFrameQDZView) then
  begin
    FFrameQDZView := TFrameQDZView.Create(Self);
    FFrameQDZView.Parent := Self;
    FFrameQDZView.Align := alClient;
  end;
  FFrameQDZView.Show;
  ShowFrameWait;
  FFrameQDZView.QDZ := TJSONUtils.TableToRecord<TQDZ>(FDMemTable1);
  FreeFrameWait;
end;

procedure TFrameQDZ.AfterConstruction;
begin
  inherited;
  GridColumns := 'QDZDM,QDZMC,JD,WD,GLRY,LXFS,RYSL,SBSL,SPSL,GXSJ,操作';
  GridView.Columns[10].Width := 160;
  GridView.Columns[10].Options.ShowEditButtons := isebAlways;
  GridView.Columns[10].RepositoryItem := cxdtrpstry1ButtonItem1;
  LoadData;
end;

procedure TFrameQDZ.BtnAddClick(Sender: TObject);
begin
  inherited;
  ShowFrameEdit;
  FrameQDZGL.EditID := TEditStatus.esNew;
  FrameQDZGL.OnClose := CloseLayout;
  SetLayoutVisible(False);
end;

procedure TFrameQDZ.CloseLayout;
begin
  BtnAdd.Visible := True;
  dxLayoutControl2.Visible := True;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameQDZ.SetLayoutVisible(b: Boolean);
begin
  BtnAdd.Visible := b;
  dxLayoutControl2.Visible := b;
end;

procedure TFrameQDZ.ShowFrameEdit;
begin
  if not Assigned(FrameQDZGL) then
  begin
    FrameQDZGL := TFrameQDZGL.Create(Self);
    with FrameQDZGL do
    begin
      Parent := Self;
      top := 0;
      Left := (Self.Width - Width) div 2;
      OnOK := InsertTable;
      OnClose := CloseLayout;
    end;
  end;
  FrameQDZGL.ClearControls(FrameQDZGL);
  FrameQDZGL.Show;
end;

end.

