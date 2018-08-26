unit uFrameSecurityLogTotal;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Actions, Vcl.ActnList, sDialogs, cxEditRepositoryItems,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, Vcl.StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar,
  uRequestItf, uJSONUtils, QBAES, uGlobal;

type
  TFrameSecurityLogTotal = class(TdxGridFrame)
    DTKSSJ: TcxDateEdit;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    edtYhbh: TcxTextEdit;
    Button1: TButton;
    dxLayoutItem7: TdxLayoutItem;
    procedure Button1Click(Sender: TObject);
  protected
    procedure LoadData; override;
  private
    procedure AfterConstruction; override;
  public
    { Public declarations }
  end;

var
  FrameSecurityLogTotal: TFrameSecurityLogTotal;

implementation

{$R *.dfm}
{ TFrameSecurityLogTotal }

procedure TFrameSecurityLogTotal.AfterConstruction;
begin
  inherited;
  DTKSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now + 1));
  GridColumns := 'yhbh,num';
end;

procedure TFrameSecurityLogTotal.Button1Click(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameSecurityLogTotal.LoadData;
var
  Param: string;
  s: string;
begin
  inherited;
  Param := Format('kssj=%s&jssj=%s', [DTKSSJ.Text, DTJSSJ.Text]);
  if Trim(edtYhbh.Text) <> '' then
    Param := Param + '&yhbh=' + AesEncrypt(Trim(edtYhbh.Text), key);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetSecurityLogTotal', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  if FDMemTable1.Active then
  begin
    FDMemTable1.First;
    while not FDMemTable1.Eof do
    begin
      FDMemTable1.Edit;
      FDMemTable1.FieldByName('yhbh').AsString :=
        AesDecrypt(FDMemTable1.FieldByName('yhbh').AsString, key);
      FDMemTable1.Post;
      FDMemTable1.Next;
    end;
    FDMemTable1.First;
  end;
  FreeFrameWait;
end;

end.
