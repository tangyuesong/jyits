unit uFrameAddZHPTDevice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, uRequestItf, Generics.Collections, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uJsonUtils;

type
  TFrameAddZHPTDevice = class(TdxDialogBaseFrame)
    dxLayoutItem5: TdxLayoutItem;
    edtID: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtCaption: TcxTextEdit;
    FDMemTable1: TFDMemTable;
    dxLayoutItem1: TdxLayoutItem;
    edtSBDD: TcxTextEdit;
    procedure btnSaveClick(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TFrameAddZHPTDevice.btnSaveClick(Sender: TObject);
var
  id, name: String;
begin
  inherited;

  id := Trim(edtID.Text);
  name := Trim(edtCaption.Text);
  if id = '' then
  begin
    Application.MessageBox('ID����Ϊ��', '��ʾ', MB_OK + MB_ICONERROR);
    exit;
  end;
  if name = '' then
  begin
    Application.MessageBox('���Ʋ���Ϊ��', '��ʾ', MB_OK + MB_ICONERROR);
    exit;
  end;

  if TRequestItf.DbQuery('GetZHPTDevice', 'SBID=' + id) <> '' then
  begin
    Application.MessageBox('ID�Ѿ�����', '��ʾ', MB_OK + MB_ICONERROR);
    exit;
  end;
  if TRequestItf.DbQuery('GetZHPTDevice', 'SBMC=' + name) <> '' then
  begin
    Application.MessageBox('�����Ѿ�����', '��ʾ', MB_OK + MB_ICONERROR);
    exit;
  end;
  TRequestItf.DbQuery('AddZHPTDevice', 'SBID=' + id + '&SBMC=' + name + '&SBDD='
    + Trim(edtSBDD.Text));

  btnExit.Click;
end;

end.
