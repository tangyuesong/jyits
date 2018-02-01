unit uFramZBGL;

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
  Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar, System.Actions,
  Vcl.ActnList, sDialogs, cxEditRepositoryItems, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxTextEdit, Vcl.StdCtrls, cxButtons, cxMaskEdit,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, uRequestItf,
  uJsonUtils, uCommon, uFrameZBGL_RY, uFrameCreateZBList;

type
  TFrameZBGL = class(TdxGridFrame)
    cxDateEdit1: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    cxDateEdit2: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    cxButton3: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    frmRY: TFrameZBGL_RY;
    fCreateZBList: TFrameCreateZBList;
    procedure FrameClose;
    procedure FrameOK(ADays: Integer);
  public
    procedure AfterConstruction; override;
  end;

var
  FrameZBGL: TFrameZBGL;

implementation

{$R *.dfm}

procedure TFrameZBGL.AfterConstruction;
begin
  inherited;
  cxDateEdit1.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now));
  cxDateEdit2.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now + 30));
  GridColumns := 'ZBSJ,ZBLD,LDDH,ZBMJ,MJDH,ZBXJ,XJDH';
  cxButton1Click(nil);
end;

procedure TFrameZBGL.cxButton1Click(Sender: TObject);
var
  s: String;
begin
  inherited;
  s := 'begin_ZBSJ=' + FormatDateTime('yyyy-mm-dd', cxDateEdit1.Date) +
    '&end_ZBSJ=' + FormatDateTime('yyyy-mm-dd', cxDateEdit2.Date + 1);
  s := TRequestItf.DbQuery('GETZB_List', s);
  TJsonUtils.JSONToDataSet(s, FDMemTable1, 'ZBSJ', True, [ixPrimary]);
end;

procedure TFrameZBGL.cxButton2Click(Sender: TObject);
begin
  if not Assigned(frmRY) then
  begin
    frmRY := TFrameZBGL_RY.Create(Self);
    frmRY.Parent := Self;
  end;
  frmRY.Visible := True;
  frmRY.OnClose := FrameClose;
  frmRY.ShowData;
  dxLayoutControl2.Visible := False;
end;

procedure TFrameZBGL.cxButton3Click(Sender: TObject);
begin
  inherited;
  if Assigned(fCreateZBList) then
    fCreateZBList.Free;
  fCreateZBList := TFrameCreateZBList.Create(Self);
  fCreateZBList.Parent := Self;
  fCreateZBList.Top := (Self.Height - fCreateZBList.Height) div 2;
  fCreateZBList.Left := (Self.Width - fCreateZBList.Width) div 2;
  fCreateZBList.Visible := True;
  fCreateZBList.OnClose := FrameClose;
  fCreateZBList.OnOK := FrameOK;
  dxLayoutControl2.Visible := False;
end;

procedure TFrameZBGL.FrameClose;
begin
  dxLayoutControl2.Visible := True;
end;

procedure TFrameZBGL.FrameOK(ADays: Integer);
begin
  cxDateEdit1.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now));
  cxDateEdit2.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now + ADays));
  cxButton1Click(nil);
  FrameClose;
end;

end.
