unit UFrameLogStat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrameStat, cxGraphics,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, cxStyles, cxCustomData, Data.DB, cxDBData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridChartView, cxGridDBChartView,
  cxGrid, cxDropDownEdit, Vcl.StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxCalendar, cxRadioGroup, dxLayoutControl, System.Actions, Vcl.ActnList;

type
  TFrameLogStat = class(TFrameStat)
    dxLayoutItem5: TdxLayoutItem;
    cboUser: TcxComboBox;
    cboFunc: TcxComboBox;
    dxLayoutItem9: TdxLayoutItem;
    procedure BtnSearchClick(Sender: TObject);
  private
    procedure BindFunc;
    procedure BindUser;
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameLogStat: TFrameLogStat;

implementation

uses uRequestItf, uCommon, uJSONUtils, uDictionary, uEntity;
{$R *.dfm}

procedure TFrameLogStat.BindFunc;
var
  s: string;
  tb: TFDMemTable;
begin
  s := TRequestItf.DbQuery('GetS_QTZ_Action2Function', 'flag=1&orderby=ID');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(s, tb, 'ID', true, [ixPrimary]);
    while not tb.Eof do
    begin
      cboFunc.Properties.Items.Add(tb.FieldByName('func').AsString);
      tb.Next;
    end;
    tb.Free;
  end;
end;

procedure TFrameLogStat.BindUser;
var
  yhbh: string;
  tb: TFDMemTable;
  user: TUser;
begin
  for yhbh in TLZDictionary.gDicUser.Keys do
    begin
      user := TLZDictionary.gDicUser[yhbh];
      cboUser.Properties.Items.Add(user.yhbh + ':' + user.YHXM);
    end;
end;

procedure TFrameLogStat.AfterConstruction;
begin
  inherited;
  GridColumns := 'YHBH,功能,使用天数,使用次数';
  dxMonth.Visible := false;
  dxYear.Visible := false;
  dxDTKSSJ.Visible := true;
  dxDTJSSJ.Visible := true;

  BindFunc;
  BindUser;
end;

procedure TFrameLogStat.BtnSearchClick(Sender: TObject);
var
  s, level, yhbh: string;
begin
  Jkid := 'getLogStatPDA';
  yhbh := cboUser.Text;
  if yhbh.IndexOf(':') > 1 then
    yhbh := yhbh.Substring(0, yhbh.IndexOf(':'));
  Param := Format('sTime=%s&eTime=%s&yhbh=%s&afid=%d',
    [DTKSSJ.Text, DTJSSJ.Text, yhbh, cboFunc.ItemIndex + 1]);
  s := TRequestItf.DbQuery(Jkid, Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', true);
  // inherited;
end;

end.
