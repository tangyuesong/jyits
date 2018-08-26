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
    dxLayoutItem8: TdxLayoutItem;
    ActionList1: TActionList;
    ActionDetail: TAction;
    edtNum: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    cboKK: TcxComboBox;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    FDetail: TdxFramePicData;
    function GetKKSelected: string;
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
//var
//  code: string;
begin
  inherited;
  {cboKK.Properties.Items.Clear;
  for code in TLZDictionary.gDicDev[1].Keys do
  begin
    with cboKK.Properties.Items.Add do
    begin
      Description := TLZDictionary.gDicDev[1][code].SBDDMC;
      ShortDescription := code;
    end;
  end;  }

  TLZDictionary.BindComboboxDEVEx(cboKK, false, TCommon.GetXZQH(gUser.DWDM));
  DTKSSJ.Date := now - 1;
  DTJSSJ.Date := now;
  GridColumns := 'HPHM,HPZL,NUM';
end;

function TFrameGCPD.GetKKSelected: string;
//var
//  s: string;
//  i: integer;
begin
  result := TLZDictionary.GetKey('DEV', '', cboKK.Text);
{  result := '';
  for i := 0 to cboKK.Properties.Items.Count - 1 do
  begin
    s := cboKK.Properties.Items[i].Description;
    if cboKK.States[i] = cbsChecked then
      result := result + ',' + cboKK.Properties.Items[i].ShortDescription;
  end;
  if result <> '' then
    result := result.Substring(1);   }
end;

procedure TFrameGCPD.cxButton1Click(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  if cboKK.SelectedItem = -1 then
  begin
    cboKK.SetFocus;
    exit;
  end;
  if strtointdef(edtNum.Text, 0) = 0 then
  begin
    edtNum.SetFocus;
    exit;
  end;
  LoadData;
end;

procedure TFrameGCPD.LoadData;
var
  vdt, vdt2, kk, num, Param: string;
  s: string;
  pageSize, pageIndex: Integer;
begin
  inherited;
  vdt := formatdatetime('yyyy/mm/dd hh:nn:ss', DTKSSJ.Date);
  vdt2 := formatdatetime('yyyy/mm/dd hh:nn:ss', DTJSSJ.Date);
  kk := GetKKSelected;
  num := edtNum.Text;
  Param := Format('beginTime=%s&endTime=%s&kk=%s&num=%s', [vdt, vdt2, kk, num]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('getGCPD', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  FreeFrameWait;
end;

end.


