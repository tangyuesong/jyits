unit dxImport;

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
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxTextEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdxImportDialog = class(TdxDialogBaseFrame)
    cxGrid1: TcxGrid;
    GridView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    btnBrower: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    edtFile: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    OpenDialog1: TOpenDialog;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure btnBrowerClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  protected
    procedure LoadData(filename: string); virtual; abstract;
    function DoImport: boolean; virtual; abstract;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dxImportDialog: TdxImportDialog;

implementation

{$R *.dfm}

procedure TdxImportDialog.btnBrowerClick(Sender: TObject);
begin
  inherited;
  if self.OpenDialog1.Execute then
  begin
    edtFile.Text := self.OpenDialog1.filename;
    LoadData(self.OpenDialog1.filename);
  end;
end;

procedure TdxImportDialog.btnExitClick(Sender: TObject);
begin
  inherited;
  self.Hide;
end;

procedure TdxImportDialog.btnSaveClick(Sender: TObject);
begin
  inherited;
  btnBrower.Enabled := false;
  edtFile.Enabled := false;
  if DoImport then
  begin
    ShowMessage('导入成功！');
    self.Hide;
  end;
end;

end.
