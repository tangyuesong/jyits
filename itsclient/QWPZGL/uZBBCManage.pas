unit uZBBCManage;

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
  Udictionary, uEntity, uJsonUtils, uRequestItf, uDialogZBEdit, uCommon,
  uDialogZBImport;

type
  TFrameZBBCManage = class(TdxGridFrame)
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    edtName: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    BtnAdd: TcxButton;
    BtnSearch: TcxButton;
    SaveDialog1: TSaveDialog;
    dxLayoutItem5: TdxLayoutItem;
    btnClose: TcxButton;
    procedure BtnSearchClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    FDialogZBEdit: TDialogZBEdit;
    procedure ZBExitClick;
    procedure LoadData;
  public
    DWDM: string;
    procedure AfterConstruction; override;
  end;

//var
  //FrameZBBCManage: TFrameZBBCManage;

implementation

{$R *.dfm}
{ TFrameZBBCManage }

procedure TFrameZBBCManage.AfterConstruction;
begin
  inherited;
  GridColumns := 'BCType,BCName,BCTime,SwitchTime,FZR,YHXM,Address,操作';
  LoadData;
end;

procedure TFrameZBBCManage.BtnAddClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FDialogZBEdit) then
  begin
    FDialogZBEdit := TDialogZBEdit.Create(self);
    FDialogZBEdit.Parent := self;
    FDialogZBEdit.Top := 60;
    FDialogZBEdit.Left := (self.Width - FDialogZBEdit.Width) div 2;
    FDialogZBEdit.OnClose := self.ZBExitClick;
    FDialogZBEdit.OnSave := self.LoadData;
  end;
  FDialogZBEdit.ClearControls(FDialogZBEdit);
  FDialogZBEdit.DWDM := self.DWDM;
  dxLayoutControl2Group_Root.Enabled := False;
  FDialogZBEdit.Visible := True;
end;

procedure TFrameZBBCManage.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('确定要删除此班次？', '提示', mb_YesNo) = mrYes then
  begin
    TRequestItf.DbQuery('DelBanCi',
      'Systemid=' + FDMemTable1.FieldByName('systemid').AsString);
    LoadData;
  end;
end;

procedure TFrameZBBCManage.acteditExecute(Sender: TObject);
begin
  inherited;
  //ShowZBEdit(FDMemTable1.FieldByName('Systemid').AsString);
end;

procedure TFrameZBBCManage.BtnSearchClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TFrameZBBCManage.btnCloseClick(Sender: TObject);
begin
  inherited;
  self.Hide;
end;

procedure TFrameZBBCManage.LoadData;
var
  Param: String;
begin
  param := 'DWDM=' + self.DWDM;
  if edtName.Text <> '' then
    Param := 'BCName=' + edtName.Text;
  ShowFrameWait;
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetBanCi', Param),
    FDMemTable1, 'BCType');
  FreeFrameWait;
end;

procedure TFrameZBBCManage.ZBExitClick;
begin
  FDialogZBEdit.Visible := False;
  dxLayoutControl2Group_Root.Enabled := True;
end;

end.
