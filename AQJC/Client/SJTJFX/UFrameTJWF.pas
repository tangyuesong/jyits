unit UFrameTJWF;

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
  cxCalendar, cxRadioGroup, dxLayoutControl, System.Actions, Vcl.ActnList,
  uFrameZDTotal, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent;

type
  TFrameTJWF = class(TFrameStat)
    ChartViewSeries1: TcxGridDBChartSeries;
    ChartViewSeries2: TcxGridDBChartSeries;
    ChartViewSeries3: TcxGridDBChartSeries;
    NetHTTPClient1: TNetHTTPClient;
    procedure BtnSearchClick(Sender: TObject);
    procedure GridViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    fZdTotal: TFrameZDTotal;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameTJWF: TFrameTJWF;

implementation

{$R *.dfm}

procedure TFrameTJWF.AfterConstruction;
begin
  inherited;
  GridColumns := '��λ����,���ֳ�Υ������,���ֳ��ɿ�����,���ֳ��ɿ���, ' +
    '����Υ������,ǿ��Υ������,�ֳ��ɿ�����,�ֳ��ɿ���,��ؽɿ���,���ؽɿ���';
  RDMonth.Checked := true;
end;

procedure TFrameTJWF.BtnSearchClick(Sender: TObject);
begin
  Jkid := 'VioStat';
  Param := '&DWJB=4&XZQH=4451';
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('rq', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('xzqh', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('��λ����', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('���ֳ�Υ������', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('���ֳ��ɿ�����', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('���ֳ��ɿ���', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('����Υ������', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('ǿ��Υ������', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('�ֳ��ɿ�����', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('�ֳ��ɿ���', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('��ؽɿ���', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('���ؽɿ���', ftInteger, 0, false);
  inherited;
end;

procedure TFrameTJWF.GridViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  params: String;
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  if FDMemTable1.FieldDefs.IndexOf('XZQH') < 0 then
    exit;
  if not Assigned(fZdTotal) then
  begin
    fZdTotal := TFrameZDTotal.Create(self);
    fZdTotal.Parent := self;
    fZdTotal.Align := TAlign.alClient;
  end;

  params := Param.Replace('DWJB=4', 'DWJB=5');
  params := params.Replace('XZQH=4451',
    'XZQH=' + FDMemTable1.FieldByName('XZQH').AsString);
  fZdTotal.ColumnStrs := 'XZQH,��λ����,���ֳ�Υ������,���ֳ��ɿ�����,���ֳ��ɿ���, ' +
    '����Υ������,ǿ��Υ������,�ֳ��ɿ�����,�ֳ��ɿ���,��ؽɿ���,���ؽɿ���';
  fZdTotal.Show;
  Application.ProcessMessages;
  sleep(50);
  fZdTotal.Query(Jkid, params);
end;

end.
