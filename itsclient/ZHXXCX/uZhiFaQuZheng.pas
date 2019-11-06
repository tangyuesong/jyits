unit uZhiFaQuZheng;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGridFrame, cxGraphics, cxControls,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, Clipbrd,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxDropDownEdit, cxTextEdit, cxMaskEdit,
  cxCalendar, Udictionary, uCommon, uRequestItf, uJsonUtils, sDialogs,
  System.Actions, Vcl.ActnList, cxImage, cxGroupBox, uGlobal;

type
  TZhiFaQuZheng = class(TdxGridFrame)
    cboHPZL: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    edtHPHM: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    dtBegin: TcxDateEdit;
    dxLayoutItem5: TdxLayoutItem;
    dtEnd: TcxDateEdit;
    cxGroupBox1: TcxGroupBox;
    cxImage1: TcxImage;
    cxButton3: TcxButton;
    procedure btnSearchClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
  private

  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  ZhiFaQuZheng: TZhiFaQuZheng;

implementation

{$R *.dfm}

procedure TZhiFaQuZheng.acteditExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  s := FDMemTable1.FieldByName('hphm').AsString + #9 +
  FDMemTable1.FieldByName('hpzl').AsString + #9 +
  FDMemTable1.FieldByName('gcsj').AsString + #9 +
  FDMemTable1.FieldByName('yhbh').AsString + #9 +
  FDMemTable1.FieldByName('gxsj').AsString + #9 +
  FDMemTable1.FieldByName('tp').AsString;
  Clipbrd.Clipboard.AsText := s;
  Application.MessageBox('已复制到剪贴板', '提示');
end;

procedure TZhiFaQuZheng.actViewExecute(Sender: TObject);
var
  s, t: string;
begin
  inherited;
  s := FDMemTable1.FieldByName('tp').AsString;
  t := gSetup.DirSave + '\' + FDMemTable1.FieldByName('hphm').AsString + '.jpg';
  if TCommon.GetPic('', s, t) then
  begin
    self.cxGroupBox1.Show;
    self.cxGroupBox1.Align := alClient;
    self.dxLayoutControl2.Hide;
    cxImage1.Picture.LoadFromFile(t);
  end
  else
    Application.MessageBox('暂无图片', '提示');
end;

procedure TZhiFaQuZheng.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cboHPZL, TLZDictionary.gDicMain['HPZL'], True);
  cboHPZL.Text := '';
  dtBegin.Date := trunc(now - 30);
  dtEnd.Date := trunc(now+1);
  GridColumns := 'hphm,hpzl,gcsj,yhbh,gxsj,tp,操作';
  gridview.Columns[3].Caption := '记录人';
  gridview.Columns[4].Caption := '入库时间';
  gridview.Columns[5].Caption := '图片地址';
  gridview.Columns[5].Width := 300;
end;

procedure TZhiFaQuZheng.btnSearchClick(Sender: TObject);
var
  s, kssj, jssj, hphm, hpzl, Param: string;
begin
  inherited;
  hphm := edtHPHM.Text;
  hpzl := '';
  if hphm <> '' then
  begin
    hpzl := cboHPZL.Text;
    hpzl := hpzl.Substring(0, hpzl.IndexOf(':'));
  end;
  kssj := FormatDateTime('yyyy-mm-dd', dtBegin.Date);
  jssj := FormatDateTime('yyyy-mm-dd', dtEnd.Date);
  Param := Format('begin_gxsj=%s&end_gxsj=%s&like_hpzl=%s&like_hphm=%s', [kssj, jssj, hpzl, hphm]);
  ShowFrameWait;
  s := TRequestItf.pDbQuery('GetT_ZhiFaQuZheng_Pic', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', True);
  FreeFrameWait;
end;

procedure TZhiFaQuZheng.cxButton3Click(Sender: TObject);
begin
  inherited;
  self.cxGroupBox1.Hide;
  dxLayoutControl2.Show;
end;

end.
