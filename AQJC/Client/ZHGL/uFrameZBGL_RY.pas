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
  cxGrid, dxLayoutControl, uJsonUtils, uRequestItf, dxCore, uFrameRYEdit,
  uEntity, uDictionary;

type
  TClose = procedure of Object;

  TFrameZBGL_RY = class(TdxGridFrame)
    cboBCLB: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    cbbDWMC: TcxComboBox;
    dxLayoutItem5: TdxLayoutItem;
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
    procedure AfterConstruction; override;
  public
    property OnClose: TClose read FClose write FClose;
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

  if Application.MessageBox('ȷ��ɾ����?', '��ʾ', MB_YESNO + MB_ICONQUESTION) = idYES
  then
  begin
    if TRequestItf.DbQuery('DelZB_Config',
      'SYSTEMID=' + FDMemTable1.FieldByName('SYSTEMID').AsString) = '1' then
    begin
      FDMemTable1.Delete;
      Application.MessageBox('ɾ���ɹ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end
    else
      Application.MessageBox('ɾ��ʧ��', '��ʾ', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFrameZBGL_RY.acteditExecute(Sender: TObject);
begin
  inherited;
  ShowAddFrame(FDMemTable1.FieldByName('SYSTEMID').AsString);
end;

procedure TFrameZBGL_RY.AfterConstruction;
var
  dept: TDept;
begin
  inherited;
  cbbDWMC.Properties.Items.Clear;
  cbbDWMC.Properties.Items.Add('ȫ��');
  for dept in TLZDictionary.gDicDept.Values do
    cbbDWMC.Properties.Items.Add(dept.DWMC);
  cbbDWMC.ItemIndex := 0;

  GridColumns := 'DWMC,BCLB,BCBH,ZBRY,RYDH,ZLZB,ZRZB,����';
  GridView.Columns[7].Options.ShowEditButtons := isebAlways;
  GridView.Columns[7].RepositoryItem := cxdtrpstry1ButtonItem1;
  GridView.Columns[1].SortOrder := soAscending;
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
    fRYEdit.cbbDWMC.Text := Trim(FDMemTable1.FieldByName('DWMC').AsString);
    fRYEdit.cbbBCLB.Text := Trim(FDMemTable1.FieldByName('BCLB').AsString);
    fRYEdit.edtBCBH.Text := Trim(FDMemTable1.FieldByName('BCBH').AsString);
    fRYEdit.edtZBRY.Text := Trim(FDMemTable1.FieldByName('ZBRY').AsString);
    fRYEdit.edtRYDH.Text := Trim(FDMemTable1.FieldByName('RYDH').AsString);
    fRYEdit.cbZLZB.Checked := FDMemTable1.FieldByName('ZLZB').AsBoolean;
    fRYEdit.cbZRZB.Checked := FDMemTable1.FieldByName('ZRZB').AsBoolean;
  end
  else
  begin
    fRYEdit.cbbBCLB.Text := '��';
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

  if cbbDWMC.ItemIndex > 0 then
  begin
    if s <> '' then
      s := s + '&';
    s := s + 'DWMC=' + cbbDWMC.Text;
  end;

  s := TRequestItf.DbQuery('GetZB_Config', s);
  TJsonUtils.JSONToDataSet(s, FDMemTable1, '');
end;

end.
