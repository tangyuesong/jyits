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
  System.Actions, uGlobal, uCommon;

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
    procedure cxButton1Click(Sender: TObject);
  private
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
  Param := Format('beginTime=%s&endTime=%s&hpzl=%s&num=%s', [vdt, vdt2, hpzl, num]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('getGCPD', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  FreeFrameWait;
end;

end.


