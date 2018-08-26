unit UDrvSearch;

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
  cxGrid, dxLayoutControl, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, cxImage, uGlobal,
  uEntity, uRequestItf, uJsonUtils, uCommon, System.Generics.Collections,
  cxEditRepositoryItems, sDialogs, System.Actions, Vcl.ActnList, acPNG,
  cxMaskEdit, cxDropDownEdit, cxGroupBox;

type
  TFrameDevSearch = class(TdxGridFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    edtsfzhm: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    edtdabh: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    cxImage3: TcxImage;
    dxLayoutItem7: TdxLayoutItem;
    edtxm: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    edtgj: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    edtxb: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edtlxdz: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    edtdjdz: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    edtsjhm: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    edtlxdh: TcxTextEdit;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    edtzt: TcxTextEdit;
    dxLayoutItem15: TdxLayoutItem;
    edtzjcx: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    edtqssj: TcxTextEdit;
    dxLayoutItem17: TdxLayoutItem;
    edtjssj: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    cxButton2: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    cxButton3: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    cxGroupBox1: TcxGroupBox;
    cxImage1: TcxImage;
    cxButton1: TcxButton;
    procedure btnSearchClick(Sender: TObject);
    procedure edtsfzhmKeyPress(Sender: TObject; var Key: Char);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SearchVioInfo();
  private
    procedure SetDrv(const Value: TDrvInfo);
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
    property Drvinfo: TDrvInfo write SetDrv;
  end;

var
  FrameDevSearch: TFrameDevSearch;

implementation

{$R *.dfm}
{ TFrameDevSearch }

procedure TFrameDevSearch.actViewExecute(Sender: TObject);
var
  tmpFile, hphm, hpzl, wfsj, xh: string;
  list: TList<TVioInfoSRL>;
  item: TVioInfoSRL;
begin
  inherited;
  xh := '';
  tmpFile := '';
  hphm := FDMemTable1.FieldByName('HPHM').AsString;
  hpzl := FDMemTable1.FieldByName('HPZL').AsString;
  wfsj := FDMemTable1.FieldByName('WFSJ').AsString;
  list := TCommon.GetVioByVeh(hphm, hpzl, '');
  for item in list do
  begin
    if item.wfsj = wfsj then
      xh := item.XH;
  end;
  list.Free;
  if xh <> '' then
    tmpFile := TCommon.GetVioPicinfo(xh);

  if tmpFile <> '' then
  begin
    self.cxGroupBox1.Show;
    self.cxGroupBox1.Align := alClient;
    self.dxLayoutControl2.Hide;
    cxImage1.Picture.LoadFromFile(tmpFile);
    DeleteFile(tmpFile);
  end
  else
    Application.MessageBox('暂无图片', '提示');
end;

procedure TFrameDevSearch.AfterConstruction;
begin
  inherited;
  GridColumns := 'hphm,hpzl,WFSJ,WFDZ,WFXW,FKJE,WFJFS,操作';
  GridView.Columns[7].RepositoryItem := cxdtrpstry1ButtonItem1;
  edtsfzhm.Text := Copy(gUser.DWDM, 1, 4);
  cxButton3.Enabled := false;
  cxButton2.Enabled := True;
end;

procedure TFrameDevSearch.btnSearchClick(Sender: TObject);
begin
  inherited;
  ShowFrameWait;
  Drvinfo := TCommon.GetDrvInfo(edtsfzhm.Text);
  FreeFrameWait;
  SearchVioInfo;
end;

procedure TFrameDevSearch.cxButton1Click(Sender: TObject);
begin
  inherited;
  self.cxGroupBox1.Hide;
  dxLayoutControl2.Show;
end;

procedure TFrameDevSearch.cxButton2Click(Sender: TObject);
begin
  inherited;
  cxButton3.Enabled := True;
  cxButton2.Enabled := false;
  SearchVioInfo;
end;

procedure TFrameDevSearch.cxButton3Click(Sender: TObject);
begin
  inherited;
  cxButton3.Enabled := false;
  cxButton2.Enabled := True;
  SearchVioInfo;
end;

procedure TFrameDevSearch.edtsfzhmKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSearchClick(nil);

end;

procedure TFrameDevSearch.SearchVioInfo;
var
  list: TList<TVioClass>;
begin
  ShowFrameWait;
  list := TList<TVioClass>.Create;
  if cxButton3.Enabled = false then
    list := TCommon.GetVio('', '', edtsfzhm.Text, '', '0')
  else
    list := TCommon.GetVio('', '', edtsfzhm.Text, '', '1');
  TJSONUtils.RecordListToTable<TVioClass>(list, FDMemTable1);
  list.Free;
  FreeFrameWait;
end;

procedure TFrameDevSearch.SetDrv(const Value: TDrvInfo);
begin
  edtxm.Text := Value.xm;
  if Value.xb = '1' then
    edtxb.Text := '男'
  else if Value.xb = '2' then
    edtxb.Text := '女';
  if Value.gj = '156' then
    edtgj.Text := '中国'
  else
    edtgj.Text := Value.gj;
  edtzjcx.Text := Value.zjcx;
  edtlxdz.Text := Value.lxzsxxdz;
  edtdjdz.Text := Value.djzsxxdz;
  edtlxdh.Text := Value.lxdh;
  edtsjhm.Text := Value.sjhm;
  edtzt.Text := Value.zt;
  edtqssj.Text := Value.yxqs;
  edtjssj.Text := Value.yxqz;
end;

end.
