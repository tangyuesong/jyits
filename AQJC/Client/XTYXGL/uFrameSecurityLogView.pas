unit uFrameSecurityLogView;

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
  TFrameSecurityLogView = class(TdxGridFrame)
    DTKSSJ: TcxDateEdit;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    cmbType: TcxComboBox;
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
  FrameSecurityLogView: TFrameSecurityLogView;

implementation

{$R *.dfm}
{ TFrameSecurityLogView }

procedure TFrameSecurityLogView.AfterConstruction;
begin
  inherited;
  DTKSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', now + 1));
  GridColumns := 'yhbh,ip,type,title,level,descript,gxsj';
end;

procedure TFrameSecurityLogView.Button1Click(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameSecurityLogView.LoadData;
var
  Param: string;
  s: string;
  pageSize, pageIndex: Integer;
  i: Integer;
begin
  inherited;
  Param := Format('kssj=%s&jssj=%s', [FormatDateTime('yyyy/mm/dd hh:nn:ss',
    DTKSSJ.Date), FormatDateTime('yyyy/mm/dd hh:nn:ss', DTJSSJ.Date)]);
  if cmbType.ItemIndex > 0 then
    Param := Param + '&type=' + AesEncrypt(IntToStr(cmbType.ItemIndex), key);
  if edtYhbh.Text <> '' then
    Param := Param + '&yhbh=' + AesEncrypt(edtYhbh.Text, key);
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&currentPage=%s&pageSize=%s',
    [pageIndex.ToString, pageSize.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetSecurityLogList', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', True, [ixDescending], False);

  if FDMemTable1.Active then
  begin
    FDMemTable1.First;
    while not FDMemTable1.Eof do
    begin
      FDMemTable1.Edit;
      for i := 0 to FDMemTable1.FieldDefs.Count - 1 do
      begin
        if (UpperCase(FDMemTable1.FieldDefs.Items[i].Name) = 'GXSJ') or
          (UpperCase(FDMemTable1.FieldDefs.Items[i].Name) = 'SYSTEMID') then
          continue;
        FDMemTable1.Fields[i].AsString :=
          AesDecrypt(FDMemTable1.Fields[i].AsString, key);
      end;
      FDMemTable1.Post;
      FDMemTable1.Next;
    end;
    FDMemTable1.First;
  end;

  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

end.
