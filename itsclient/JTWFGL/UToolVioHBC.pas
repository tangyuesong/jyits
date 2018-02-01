unit UToolVioHBC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame, cxGraphics, cxControls,
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
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkinsdxBarPainter, dxBar, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, dxFrame, dxDialogBase, dxImport,
  uFrameHBCImport, uFrameHBCEdit, uEntity;

type
  TFrameHBCList = class(TToolGridFrame)
    btnNew: TdxBarLargeButton;
    btnModify: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    btnImport: TdxBarLargeButton;
    btnExport: TdxBarLargeButton;
    btnImportVio: TdxBarLargeButton;
    deBegin: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    deEnd: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbSF: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    edtHPHM: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    cbbHPZL: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    btnQuery: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    procedure btnNewClick(Sender: TObject);
  private
    FEditFrame: TFrameHBCEdit;
    FImportFrame: TFrameImportHBC;
    procedure btnEditSaveClick(Sender: TObject);
    procedure btnEditExitClick(Sender: TObject);
  public
    procedure AfterConstruction; override;
  end;

var
  FrameHBCList: TFrameHBCList;

implementation
uses
  uDictionary, uColumnGenerator;
{$R *.dfm}

procedure TFrameHBCList.btnNewClick(Sender: TObject);
begin
  inherited;
  FEditFrame := TFrameHBCEdit.Create(self);
  with FEditFrame do
  begin
    Parent := self;
    Left := (self.Width - Width) div 2;
    Top := 120;
    btnSave.OnClick := self.btnEditSaveClick;
    btnExit.OnClick := self.btnEditExitClick;
    Show;
  end;
  EnableControls(false);
end;

procedure TFrameHBCList.btnEditSaveClick(Sender: TObject);
var
  hbc: THBC;
begin
  hbc := FEditFrame.HBC;
  //TODO: save to qtz
  FEditFrame.Free;
  EnableControls(true);
end;

procedure TFrameHBCList.AfterConstruction;
begin
  inherited;
  GridColumns := 'CJJG,HPHM,HPZL,FDJH,CCDJRQ,SJHM,CLPP,JDCSYR,ZSXXDZ,CLSBDH,YXQX,BFQX,CLXH,HBDBQK,BZ';

  TLZDictionary.BindCombobox(cbbSF, TLZDictionary.gdicmain['JC'], true);
  cbbSF.ItemIndex := 18;

  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gdicmain['HPZL'], true);
  cbbHPZL.ItemIndex := 1;

  deBegin.Date := now - 30;
  deEnd.Date := now;

  //cxButton1Click(nil);
end;

procedure TFrameHBCList.btnEditExitClick(Sender: TObject);
begin
  FEditFrame.Free;
  EnableControls(true);
end;

end.
