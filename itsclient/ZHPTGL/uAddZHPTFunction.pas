unit uAddZHPTFunction;

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
  TFrameAddZHPTFunction = class(TdxDialogBaseFrame)
    dxLayoutItem1: TdxLayoutItem;
    liMenu: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    edtID: TcxTextEdit;
    cbotype: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    cboMenu: TcxComboBox;
    edtCaption: TcxTextEdit;
    FDMemTable1: TFDMemTable;
    procedure cbotypePropertiesChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    DicZHPTMenu: TDictionary<string, string>;
  public
    procedure AfterConstruction; override;
    procedure AfterShow;
  end;

implementation

{$R *.dfm}

procedure TFrameAddZHPTFunction.AfterConstruction;
begin
  inherited;
  DicZHPTMenu := TDictionary<string, string>.Create;
end;

procedure TFrameAddZHPTFunction.AfterShow;
var
  tb: TFDMemTable;
begin
  inherited;
  cboMenu.Properties.Items.Clear;
  DicZHPTMenu.Clear;
  tb := TFDMemTable.Create(nil);
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetZHPTMenu'), tb, 'MenuID',
    True, [ixPrimary]);
  if tb.Active then
  begin
    tb.First;
    while not tb.eof do
    begin
      DicZHPTMenu.Add(tb.FieldByName('Caption').AsString,
        tb.FieldByName('MenuID').AsString);
      cboMenu.Properties.Items.Add(tb.FieldByName('Caption').AsString);
      tb.Next;
    end;
  end;
  tb.Free;
end;

procedure TFrameAddZHPTFunction.btnSaveClick(Sender: TObject);
var
  menuid, id, name: String;
begin
  inherited;
  if cbotype.ItemIndex < 0 then
  begin
    Application.MessageBox('请选择类型', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;

  id := Trim(edtID.Text);
  name := Trim(edtCaption.Text);
  if id = '' then
  begin
    Application.MessageBox('ID不能为空', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;
  if name = '' then
  begin
    Application.MessageBox('名称不能为空', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;

  if cbotype.ItemIndex = 0 then
  begin
    if TRequestItf.DbQuery('GetZHPTMenu', 'MenuID=' + id) <> '' then
    begin
      Application.MessageBox('ID已经存在', '提示', MB_OK + MB_ICONERROR);
      exit;
    end;
    if TRequestItf.DbQuery('GetZHPTMenu', 'Caption=' + name) <> '' then
    begin
      Application.MessageBox('名称已经存在', '提示', MB_OK + MB_ICONERROR);
      exit;
    end;
    TRequestItf.DbQuery('AddZHPTMenu', 'MenuID=' + id + '&Caption=' + name);
  end
  else
  begin
    if cboMenu.Text = '' then
    begin
      Application.MessageBox('请选择菜单', '提示', MB_OK + MB_ICONERROR);
      exit;
    end;
    menuid := DicZHPTMenu[cboMenu.Text];
    if TRequestItf.DbQuery('GetZHPTFunction', 'MenuID=' + menuid +
      '&FunctionID=' + id) <> '' then
    begin
      Application.MessageBox('ID已经存在', '提示', MB_OK + MB_ICONERROR);
      exit;
    end;
    if TRequestItf.DbQuery('GetZHPTFunction', 'MenuID=' + menuid + '&Caption=' +
      name) <> '' then
    begin
      Application.MessageBox('名称已经存在', '提示', MB_OK + MB_ICONERROR);
      exit;
    end;

    TRequestItf.DbQuery('AddZHPTFunction', 'MenuID=' + menuid + '&FunctionID=' +
      id + '&Caption=' + name);
  end;
  btnExit.Click;
end;

procedure TFrameAddZHPTFunction.cbotypePropertiesChange(Sender: TObject);
begin
  inherited;
  liMenu.Visible := cbotype.ItemIndex = 1;
end;

end.
