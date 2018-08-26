unit UFrameJJCSY;

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
  TFrameJJCSY = class(TFrameStat)
    dxLayoutItem5: TdxLayoutItem;
    cboLevel: TcxComboBox;
    procedure BtnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameJJCSY: TFrameJJCSY;

implementation

uses uRequestItf, uCommon, uJSONUtils;
{$R *.dfm}

procedure TFrameJJCSY.AfterConstruction;
begin
  inherited;
  GridColumns := 'DWDM,�ܲ��Դ���,�����Ų����,�������Դ���,�ﵽ�Ƽݱ�׼����,�ﵽ��ݱ�׼����,��ǿ�ƾƼ�����,��ǿ���������';
  dxMonth.Visible := false;
  dxYear.Visible := false;
  dxDTKSSJ.Visible := true;
  dxDTJSSJ.Visible := true;
end;

procedure TFrameJJCSY.BtnSearchClick(Sender: TObject);
var
  s, level: string;
begin
  Jkid := 'getJJCSY';
  if cboLevel.Text = '�ж�' then
    level := '2'
  else
    level := '1';
  Param := 'level='+ level + '&sTime=' + DTKSSJ.Text + '&eTime=' + DTJSSJ.Text;
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('DWDM', ftString, 50, false);
  FDMemTable1.FieldDefs.Add('�ܲ��Դ���', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('�����Ų����', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('�������Դ���', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('�ﵽ�Ƽݱ�׼����', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('�ﵽ��ݱ�׼����', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('��ǿ�ƾƼ�����', ftInteger, 0, false);
  FDMemTable1.FieldDefs.Add('��ǿ���������', ftInteger, 0, false);
  s := TRequestItf.DbQuery(Jkid, Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', false);
  // inherited;
end;

end.
