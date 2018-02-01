unit dxViodata;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  acPNG, cxImage, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, System.Generics.Collections,
  uEntity, uCommon, uJsonUtils, uColumnGenerator, ULookUpDataSource,
  uDictionary, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdxFrameVioData = class(TdxFrame)
    dxLayoutControl1: TdxLayoutControl;
    cxGrid1: TcxGrid;
    GridView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    ImageVeh: TcxImage;
    edthphm: TcxTextEdit;
    edtcsys: TcxTextEdit;
    edtccdjrq: TcxTextEdit;
    edthpzl: TcxTextEdit;
    edtclpp: TcxTextEdit;
    edtsyxz: TcxTextEdit;
    edtcjh: TcxTextEdit;
    edtczdz: TcxTextEdit;
    edtfdjh: TcxTextEdit;
    edtyxqx: TcxTextEdit;
    edtsjhm: TcxTextEdit;
    edtqzbfqx: TcxTextEdit;
    edtjdcsyr: TcxTextEdit;
    edtsfzhm: TcxTextEdit;
    edtclxh: TcxTextEdit;
    edtcllx: TcxTextEdit;
    edtzt: TcxTextEdit;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem9: TdxLayoutItem;
    dxlytcrtdgrp3: TdxLayoutAutoCreatedGroup;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutItem18: TdxLayoutItem;
    dxlytcrtdgrp5: TdxLayoutAutoCreatedGroup;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem22: TdxLayoutItem;
    dxlytcrtdgrp6: TdxLayoutAutoCreatedGroup;
    dxLayoutItem24: TdxLayoutItem;
    dxlytcrtdgrp8: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp2: TdxLayoutAutoCreatedGroup;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxlytcrtdgrp7: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp4: TdxLayoutAutoCreatedGroup;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    cxButton1: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure cxButton1Click(Sender: TObject);
  private
    FHPHM: string;
    FHPZL: string;
    procedure setVeh(const Value: TVehInfo);
  public
    procedure AfterConstruction; override;
    procedure LoadVehInfo;
    property HPHM: string read FHPHM write FHPHM;
    property HPZL: string read FHPZL write FHPZL;
    property Vehinfo: TVehInfo write setVeh;
  end;

var
  dxFrameVioData: TdxFrameVioData;

implementation

{$R *.dfm}

procedure TdxFrameVioData.AfterConstruction;
var
  i: integer;
  FieldName: string;
begin
  TColumnGenerator.Instance.GenerateField('hphm,hpzl,WFSJ,WFDZ,WFXW,cjjgmc',
    GridView);
  for i := 0 to GridView.ColumnCount - 1 do
  begin
    FieldName := GridView.Columns[i].DataBinding.FieldName;
    if TLookUpDataSource.DataSource.ContainsKey(FieldName) then
      TColumnGenerator.LookupColumn(GridView.Columns[i],
        TLookUpDataSource.DataSource[FieldName]);
  end;
end;

procedure TdxFrameVioData.cxButton1Click(Sender: TObject);
begin
  inherited;
  Hide;
end;

procedure TdxFrameVioData.LoadVehInfo;
var
  list: Tlist<Tvioinfosrl>;
begin
  inherited;
  Vehinfo := TCommon.GetVehinfo(HPHM, HPZL, '',False);
  list := TCommon.GetVioByVeh(HPHM, HPZL, '');
  list := TJSONUtils.RecordListSort<Tvioinfosrl>(list, 'wfsj', [ixDescending]);
  TJSONUtils.RecordListToTable<Tvioinfosrl>(list, FDMemTable1);
  list.Free;
end;

procedure TdxFrameVioData.setVeh(const Value: TVehInfo);
begin
  edthphm.Text := HPHM;
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(HPZL) then
    edthpzl.Text := TLZDictionary.gDicMain['HPZL'][HPZL]
  else
    edthpzl.Text := HPZL;
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
