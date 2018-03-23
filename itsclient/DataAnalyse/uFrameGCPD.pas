unit UFrameGCPD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
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
  cxGrid, dxLayoutControl, dxLayoutcxEditAdapters, dxpicdata,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, Vcl.ActnList, cxCheckBox, cxCheckComboBox,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  Udictionary, uRequestItf, uJsonUtils, cxEditRepositoryItems, sDialogs,
  System.Actions, uGlobal, uCommon, uFrameSelectDev, uEntity, uFramePictureCompare;

type
  TFrameGCPD = class(TdxGridFrame)
    DTKSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    ActionList1: TActionList;
    ActionDetail: TAction;
    edtNum: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    cboHPZL: TcxComboBox;
    edtKDBH: TcxTextEdit;
    btnKK: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    procedure cxButton1Click(Sender: TObject);
    procedure btnKKClick(Sender: TObject);
    procedure edtKDBHKeyPress(Sender: TObject; var Key: Char);
    procedure GridViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    FDev: TFrameSelectDev;
    KDBH: string;
    FramePictureCompare: TFramePictureCompare;
    procedure DevExitClick(Sender: TObject);
    procedure DevSaveClick(Sender: TObject);
    procedure FramePictureCompareClose;
    { Private declarations }
  protected
    procedure LoadData; override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameGCPD: TFrameGCPD;

implementation

{$R *.dfm}
{ TFrameGCPD }

procedure TFrameGCPD.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cboHPZL, TLZDictionary.gDicMain['HPZL'], true);
  DTKSSJ.Date := now - 1;
  DTJSSJ.Date := now;
  GridColumns := 'HPHM,HPZL,KDBH,GCSJ1,GCSJ2';
end;

procedure TFrameGCPD.btnKKClick(Sender: TObject);
var
  key: string;
  dev: TDevice;
begin
  inherited;
  if not Assigned(FDev) then
  begin
    FDev := TFrameSelectDev.Create(self);
    FDev.Parent := self;
    FDev.tvDevColumn4.Visible := false;
    // FDev.Top := (self.Height - FDev.Height) div 2;
    FDev.Top := 20;
    FDev.Left := (self.Parent.Width - FDev.Width) div 2;
    FDev.btnSave.OnClick := self.DevSaveClick;
    FDev.btnExit.OnClick := self.DevExitClick;
  end;

  FDev.tb.Close;
  FDev.tb.FieldDefs.Clear;
  FDev.tb.IndexDefs.Clear;
  FDev.tb.FieldDefs.Add('bj', ftBoolean);
  FDev.tb.FieldDefs.Add('WFDD', ftString, 100);
  FDev.tb.FieldDefs.Add('SBDDMC', ftString, 100);
  FDev.tb.FieldDefs.Add('C1', ftInteger);
  FDev.tb.IndexDefs.Add('index', 'WFDD', [ixPrimary]);
  FDev.tb.IndexName := 'index';
  FDev.tb.CreateDataSet();

  FDev.tb.DisableControls;
  FDev.tb.Edit;
  for key in TLZDictionary.gDicDev[1].Keys do
  begin
    dev := TLZDictionary.gDicDev[1][key];
    FDev.tb.Append;
    FDev.tb.FieldByName('WFDD').AsString := dev.SBBH;
    FDev.tb.FieldByName('SBDDMC').AsString := dev.SBDDMC;
    FDev.tb.FieldByName('bj').AsBoolean := false;
  end;
  FDev.tb.Post;
  FDev.tb.First;
  FDev.tb.EnableControls;
  dxLayoutControl2Group_Root.Visible := false;
  FDev.Visible := true;
end;

procedure TFrameGCPD.DevSaveClick(Sender: TObject);
var
  recNo: Integer;
  ss, ss1: string;
begin
  ss := '';
  ss1 := '';
  if not FDev.tb.Active then
    exit;
  FDev.tb.DisableControls;
  recNo := FDev.tb.recNo;
  FDev.tb.First;
  while not FDev.tb.eof do
  begin
    if FDev.tb.FieldByName('bj').AsBoolean then
    begin
      ss := ss + ',' + FDev.tb.FieldByName('WFDD').AsString;
      ss1 := ss1 + ',' + FDev.tb.FieldByName('SBDDMC').AsString;
    end;
    FDev.tb.Next;
  end;
  FDev.tb.recNo := recNo;
  FDev.tb.EnableControls;

  KDBH := ss;
  edtKDBH.Text := ss1;
  DevExitClick(nil);
end;

procedure TFrameGCPD.edtKDBHKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  Key := #0;
end;

procedure TFrameGCPD.GridViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  url1, url2: string;
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    Exit;
  url1 := FDMemTable1.FieldByName('URL1').AsString;
  url2 := FDMemTable1.FieldByName('URL2').AsString;
  if not Assigned(FramePictureCompare) then
  begin
    FramePictureCompare := TFramePictureCompare.Create(self);
    FramePictureCompare.Parent := self;
    FramePictureCompare.OnClose := FramePictureCompareClose;
  end;
  dxLayoutControl2Group_Root.Visible := false;
  FramePictureCompare.Visible := true;
  FramePictureCompare.HPHM := FDMemTable1.FieldByName('HPHM').AsString;
  FramePictureCompare.HPZL := FDMemTable1.FieldByName('HPZL').AsString;
  FramePictureCompare.LoadPicture(url1, url2);
end;

procedure TFrameGCPD.FramePictureCompareClose;
begin
  FramePictureCompare.Visible := false;
  dxLayoutControl2Group_Root.Visible := true;
end;

procedure TFrameGCPD.DevExitClick(Sender: TObject);
begin
  if Assigned(FDev) then
  begin
    FDev.Visible := false;
    dxLayoutControl2Group_Root.Visible := true;
  end;
end;

procedure TFrameGCPD.cxButton1Click(Sender: TObject);
begin
  inherited;
  if strtointdef(edtNum.Text, 0) = 0 then
  begin
    edtNum.SetFocus;
    exit;
  end;
  LoadData;
end;

procedure TFrameGCPD.LoadData;
var
  vdt, vdt2, hpzl, num, Param: string;
  s: string;
begin
  inherited;
  vdt := formatdatetime('yyyy/mm/dd hh:nn:ss', DTKSSJ.Date);
  vdt2 := formatdatetime('yyyy/mm/dd hh:nn:ss', DTJSSJ.Date);
  num := edtNum.Text;
  hpzl := Copy(cboHPZL.Text, 0, 2);
  Param := Format('beginTime=%s&endTime=%s&hpzl=%s&num=%s&kdbh=%s', [vdt, vdt2, hpzl, num, kdbh]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('getGCPD', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  FreeFrameWait;
end;

end.


