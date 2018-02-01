unit uFrameZBGL_RY;

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
  cxGrid, dxLayoutControl, uJsonUtils, uRequestItf, dxCore, uFrameRYEdit;

type
  TClose = procedure of Object;

  TFrameZBGL_RY = class(TdxGridFrame)
    cboBCLB: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cboBCLBPropertiesChange(Sender: TObject);
  private
    FClose: TClose;
    fRYEdit: TFrameRYEdit;
    procedure ShowAddFrame(id: String);
    procedure FrameClose();
    procedure FrameOK();
  public
    property OnClose: TClose read FClose write FClose;
    procedure AfterConstruction; override;
    procedure ShowData;
  end;

var
  FrameZBGL_RY: TFrameZBGL_RY;

implementation

{$R *.dfm}
{ TFrameZBGL_RY }

procedure TFrameZBGL_RY.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if (not FDMemTable1.Active) or (FDMemTable1.Eof) then
    exit;

  if Application.MessageBox('确定删除吗?', '提示', MB_YESNO + MB_ICONQUESTION) = idYES
  then
  begin
    if TRequestItf.DbQuery('DelZB_Config',
      'SYSTEMID=' + FDMemTable1.FieldByName('SYSTEMID').AsString) = '1' then
    begin
      FDMemTable1.Delete;
      Application.MessageBox('删除成功', '提示', MB_OK + MB_ICONINFORMATION);
    end
    else
      Application.MessageBox('删除失败', '提示', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFrameZBGL_RY.acteditExecute(Sender: TObject);
begin
  inherited;
  ShowAddFrame(FDMemTable1.FieldByName('SYSTEMID').AsString);
end;

procedure TFrameZBGL_RY.AfterConstruction;
begin
  inherited;
  GridColumns := 'BCLB,BCBH,ZBRY,RYDH,ZLZB,ZRZB,操作';
  GridView.Columns[6].Options.ShowEditButtons := isebAlways;
  GridView.Columns[6].RepositoryItem := cxdtrpstry1ButtonItem1;
  GridView.Columns[0].SortOrder := soAscending;
end;

procedure TFrameZBGL_RY.cboBCLBPropertiesChange(Sender: TObject);
begin
  inherited;
  ShowData;
end;

procedure TFrameZBGL_RY.cxButton1Click(Sender: TObject);
begin
  inherited;
  Self.Hide;
  if Assigned(OnClose) then
  begin
    OnClose;
  end;
end;

procedure TFrameZBGL_RY.cxButton2Click(Sender: TObject);
begin
  inherited;
  ShowAddFrame('');
end;

procedure TFrameZBGL_RY.FrameClose;
begin
  dxLayoutControl2.Visible := True;
end;

procedure TFrameZBGL_RY.FrameOK;
begin
  ShowData;
  dxLayoutControl2.Visible := True;
end;

procedure TFrameZBGL_RY.ShowAddFrame(id: String);
begin
  if not Assigned(fRYEdit) then
  begin
    fRYEdit := TFrameRYEdit.Create(Self);
    fRYEdit.Parent := Self;
  end;
  fRYEdit.FSystemID := id;
  if id <> '' then
  begin
    fRYEdit.cbbBCLB.Text := Trim(FDMemTable1.FieldByName('BCLB').AsString);
    fRYEdit.edtBCBH.Text := Trim(FDMemTable1.FieldByName('BCBH').AsString);
    fRYEdit.edtZBRY.Text := Trim(FDMemTable1.FieldByName('ZBRY').AsString);
    fRYEdit.edtRYDH.Text := Trim(FDMemTable1.FieldByName('RYDH').AsString);
    fRYEdit.cbZLZB.Checked := FDMemTable1.FieldByName('ZLZB').AsBoolean;
    fRYEdit.cbZRZB.Checked := FDMemTable1.FieldByName('ZRZB').AsBoolean;
  end
  else
  begin
    fRYEdit.cbbBCLB.Text := '民警';
    fRYEdit.edtBCBH.Text := '';
    fRYEdit.edtZBRY.Text := '';
    fRYEdit.edtRYDH.Text := '';
    fRYEdit.cbZLZB.Checked := True;
    fRYEdit.cbZRZB.Checked := True;
  end;
  fRYEdit.Top := (Self.Height - fRYEdit.Height) div 2;
  fRYEdit.Left := (Self.Width - fRYEdit.Width) div 2;
  fRYEdit.Visible := True;
  fRYEdit.OnOK := FrameOK;
  fRYEdit.OnClose := FrameClose;
  dxLayoutControl2.Visible := False;
end;

procedure TFrameZBGL_RY.ShowData;
var
  s: String;
begin
  inherited;
  if cboBCLB.ItemIndex > 0 then
    s := 'BCLB=' + cboBCLB.Text
  else
    s := '';
  s := TRequestItf.DbQuery('GetZB_Config', s);
  TJsonUtils.JSONToDataSet(s, FDMemTable1, '');
end;

end.
