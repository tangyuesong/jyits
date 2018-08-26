unit UVehSearch;

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
  cxGrid, dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxImage,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Udictionary, uEntity, uCommon, uJsonUtils,
  System.Generics.Collections,
  cxEditRepositoryItems, sDialogs, System.Actions, Vcl.ActnList, acPNG,
  cxGroupBox;

type
  TFrameVehSearch = class(TdxGridFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    ImageVeh: TcxImage;
    dxLayoutItem1: TdxLayoutItem;
    cbbJC: TcxComboBox;
    dxLayoutItem2: TdxLayoutItem;
    edthphm6: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    cbbhpzl: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    edthphm: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    edthpzl: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    edtclpp: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    edtclxh: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edtjdcsyr: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    edtsfzhm: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    edtcsys: TcxTextEdit;
    dxLayoutItem14: TdxLayoutItem;
    edtcllx: TcxTextEdit;
    dxLayoutItem15: TdxLayoutItem;
    edtsyxz: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    edtccdjrq: TcxTextEdit;
    dxLayoutItem17: TdxLayoutItem;
    edtfdjh: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp2: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp3: TdxLayoutAutoCreatedGroup;
    edtzt: TcxTextEdit;
    dxLayoutItem19: TdxLayoutItem;
    edtcjh: TcxTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    edtczdz: TcxTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    dxlytcrtdgrp5: TdxLayoutAutoCreatedGroup;
    edtsjhm: TcxTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    edtyxqx: TcxTextEdit;
    dxLayoutItem23: TdxLayoutItem;
    dxlytcrtdgrp6: TdxLayoutAutoCreatedGroup;
    edtqzbfqx: TcxTextEdit;
    dxLayoutItem24: TdxLayoutItem;
    dxlytcrtdgrp8: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp7: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp4: TdxLayoutAutoCreatedGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    cxButton1: TcxButton;
    dxLayoutItem13: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem25: TdxLayoutItem;
    cxGroupBox1: TcxGroupBox;
    cxImage1: TcxImage;
    cxButton3: TcxButton;
    procedure btnSearchClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure edthphm6KeyPress(Sender: TObject; var Key: Char);
    procedure actViewExecute(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    procedure setVeh(const Value: TVehInfo);
    procedure SearchVioInfo;
  public
    procedure AfterConstruction; override;
    property Vehinfo: TVehInfo write setVeh;
  end;

var
  FrameVehSearch: TFrameVehSearch;

implementation

uses
  Vcl.Imaging.jpeg, Soap.EncdDecd, uGlobal;
{$R *.dfm}
{ TFrameVehSearch }

procedure TFrameVehSearch.actViewExecute(Sender: TObject);
var
  tmpFile: string;
begin
  inherited;
  tmpFile := TCommon.GetVioPicinfo(FDMemTable1.FieldByName('xh').AsString);
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

procedure TFrameVehSearch.AfterConstruction;
begin
  inherited;
  GridColumns := 'hphm,hpzl,WFSJ,WFDZ,WFXW,FKJE,JKBJ,cjjgmc,操作';
  GridView.Columns[8].RepositoryItem := cxdtrpstry1ButtonItem1;
  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gDicMain['JC'], True);
  cbbJC.ItemIndex := 18;
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
  cbbhpzl.ItemIndex := 1;
  cxButton2.Enabled := false;
  cxButton1.Enabled := True;
end;

procedure TFrameVehSearch.btnSearchClick(Sender: TObject);
var
  sf, hphm, hpzl: string;
begin
  inherited;
  if edthphm6.Text = '' then exit;

  ShowFrameWait;
  sf := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc;
  hphm := sf + edthphm6.Text;
  hpzl := TLZDictionary.StrtoDicInfo(cbbhpzl.Text).dm;
  Vehinfo := TCommon.GetVehinfo(hphm, hpzl, '');
  FreeFrameWait;
  if CxButton1.Enabled and cxButton2.Enabled then
    cxButton2.Enabled := false;
  SearchVioInfo;
end;

procedure TFrameVehSearch.cxButton1Click(Sender: TObject);
begin
  inherited;
  cxButton1.Enabled := false;
  cxButton2.Enabled := True;
  if edthphm6.Text <> '' then
    SearchVioInfo;
end;

procedure TFrameVehSearch.cxButton2Click(Sender: TObject);
begin
  inherited;
  cxButton2.Enabled := false;
  cxButton1.Enabled := True;
  if edthphm6.Text <> '' then
    SearchVioInfo;
end;

procedure TFrameVehSearch.cxButton3Click(Sender: TObject);
begin
  inherited;
  self.cxGroupBox1.Hide;
  dxLayoutControl2.Show;
end;

procedure TFrameVehSearch.edthphm6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSearchClick(nil);

end;

procedure TFrameVehSearch.SearchVioInfo;
var
  sf, hphm, hpzl: string;
  list: Tlist<Tvioinfosrl>;
begin
  ShowFrameWait;
  sf := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc;
  hphm := sf + edthphm6.Text;
  hpzl := TLZDictionary.StrtoDicInfo(cbbhpzl.Text).dm;
  list := Tlist<Tvioinfosrl>.Create;
  if cxButton2.Enabled = false then
    list := TCommon.GetVioByVeh(hphm, hpzl, '0')
  else
    list := TCommon.GetVioByVeh(hphm, hpzl, '1');
  TJSONUtils.RecordListToTable<Tvioinfosrl>(list, FDMemTable1);
  list.Free;
  FreeFrameWait;
end;

procedure TFrameVehSearch.setVeh(const Value: TVehInfo);
begin
  edthphm.Text := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + Value.hphm;
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(Value.hpzl) then
    edthpzl.Text := TLZDictionary.gDicMain['HPZL'][Value.hpzl];
  edtjdcsyr.Text := Value.syr;
  edtsfzhm.Text := Value.sfzmhm;
  edtzt.Text := Value.zt;
  edtsjhm.Text := Value.sjhm;
  edtclpp.Text := Value.clpp1;
  edtclxh.Text := Value.clxh;
  edtcsys.Text := TLZDictionary.getCSYS(Value.csys);
  if TLZDictionary.gDicMain['CLLX'].ContainsKey(Value.cllx) then
    edtcllx.Text := TLZDictionary.gDicMain['CLLX'][Value.cllx];
  if TLZDictionary.gDicMain['SYXZ'].ContainsKey(Value.syxz) then
    edtsyxz.Text := TLZDictionary.gDicMain['SYXZ'][Value.syxz];
  edtccdjrq.Text := Value.ccdjrq;
  edtcjh.Text := Value.clsbdh;

  edtfdjh.Text := Value.fdjh;
  edtczdz.Text := Value.zsxxdz;
  edtyxqx.Text := Value.yxqz;
  edtqzbfqx.Text := Value.qzbfqz;
end;

end.
