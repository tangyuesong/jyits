unit uBugList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkinsdxBarPainter, dxBar, cxClasses, cxEditRepositoryItems,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, cxContainer, Vcl.Menus,
  Vcl.StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxTextEdit, uBugEdit,
  cxGridViewLayoutContainer, cxGridLayoutView, cxGridDBLayoutView,
  cxGridCustomLayoutView, uJsonUtils, uCommon, uEntity, uRequestItf, uGlobal,
  cxCheckBox, cxGridCardView, cxGridDBCardView, cxDBEditRepository, Udictionary,
  ULookUpDataSource, uColumnGenerator, System.Actions, Vcl.ActnList, sDialogs,
  Vcl.ExtCtrls, cxLabel;

type
  TFrameBugList = class(TToolGridFrame)
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    cxdtrpstry1CheckBoxItem1: TcxEditRepositoryCheckBoxItem;
    cxdtrpstry1LookupComboBoxItem1: TcxEditRepositoryLookupComboBoxItem;
    Btnnew: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    cboCategery: TcxCombobox;
    dxLayoutItem2: TdxLayoutItem;
    edtTitle: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    Timer1: TTimer;
    dxLayoutItem6: TdxLayoutItem;
    btnRe: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    btnDelete: TcxButton;
    procedure btnSearchClick(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FrameBugEdit: TFrameBugEdit;
    procedure CloseFrame;
    procedure ShowDeviceEdit;
    function GetCurrentBugFromGrid: TBug;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameBugList: TFrameBugList;

implementation

{$R *.dfm}

procedure TFrameBugList.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('确定删除?', '提示', MB_OKCANCEL + MB_ICONQUESTION) = idOK
  then
  begin
    TRequestItf.DbQuery('ModifyS_Bug', 'systemid=' +
      FDMemTable1.FieldByName('systemid').AsString + '&flag=1');
    FDMemTable1.Delete;
  end;
end;

procedure TFrameBugList.actnewExecute(Sender: TObject);
var
  bug: TBug;
begin
  inherited;
  ShowDeviceEdit;
  bug.Categery := '';
  bug.Title := '';
  bug.Content := '';
  bug.SYSTEMID := '';
  bug.Status := 0;
  bug.FXR := gUser.yhbh;
  bug.FXRXM := gUser.YHXM;
  bug.FXRDWDM := gUser.DWDM;
  bug.FXRDWMC := TLZDictionary.gDicDept[gUser.DWDM].DWMC;
  bug.FXSJ := now;
  bug.LXDH := '';
  bug.CLFF := '';
  bug.Url1 := '';
  bug.Url2 := '';
  bug.Url3 := '';
  bug.Url4 := '';
  bug.Url5 := '';
  FrameBugEdit.Bug := bug;
  FrameBugEdit.EditStatus := TEditStatus.esNew;
end;

procedure TFrameBugList.acteditExecute(Sender: TObject);
begin
  inherited;
  ShowDeviceEdit;
  FrameBugEdit.Bug := GetCurrentBugFromGrid;
  FrameBugEdit.EditStatus := TEditStatus.esApprove;
end;

procedure TFrameBugList.actViewExecute(Sender: TObject);
begin
  inherited;
  ShowDeviceEdit;
  FrameBugEdit.Bug := GetCurrentBugFromGrid;
  FrameBugEdit.EditStatus := TEditStatus.esCancel;
end;

function TFrameBugList.GetCurrentBugFromGrid: TBug;
begin
  result.SYSTEMID := FDMemTable1.FieldByName('SYSTEMID').AsString;
  result.Categery := FDMemTable1.FieldByName('Categery').AsString;
  result.Title := FDMemTable1.FieldByName('Title').AsString;
  result.Content := FDMemTable1.FieldByName('Content').AsString;
  result.FXR := FDMemTable1.FieldByName('FXR').AsString;
  result.LXDH := FDMemTable1.FieldByName('LXDH').AsString;
  result.FXRXM := FDMemTable1.FieldByName('FXRXM').AsString;
  result.FXRDWMC := FDMemTable1.FieldByName('FXRDWMC').AsString;
  result.FXRDWDM := FDMemTable1.FieldByName('FXRDWDM').AsString;
  result.CLR := FDMemTable1.FieldByName('CLR').AsString;
  result.CLFF := FDMemTable1.FieldByName('CLFF').AsString;
  result.Url1 := FDMemTable1.FieldByName('Url1').AsString;
  result.Url2 := FDMemTable1.FieldByName('Url2').AsString;
  result.Url3 := FDMemTable1.FieldByName('Url3').AsString;
  result.Url4 := FDMemTable1.FieldByName('Url4').AsString;
  result.Url5 := FDMemTable1.FieldByName('Url5').AsString;
  result.FXSJ := FDMemTable1.FieldByName('FXSJ').AsDateTime;
  result.CLSJ := FDMemTable1.FieldByName('CLSJ').AsDateTime;
  result.Status := FDMemTable1.FieldByName('Status').AsInteger;
  result.Flag := FDMemTable1.FieldByName('Flag').AsBoolean;
end;

procedure TFrameBugList.ShowDeviceEdit;
begin
  if not Assigned(FrameBugEdit) then
  begin
    FrameBugEdit := TFrameBugEdit.Create(self);
    FrameBugEdit.Parent := self;
    FrameBugEdit.OnClose := CloseFrame;
  end;
  FrameBugEdit.Show;
end;

procedure TFrameBugList.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := btnRe.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[3].Visible := btnDelete.Enabled;
  btnRe.Visible := btnRe.Enabled;
  btnDelete.Visible := btnDelete.Enabled;
  BtnSearchClick(nil);
end;

procedure TFrameBugList.AfterConstruction;
begin
  inherited;
  GridColumns := 'Categery,Title,FXRDWMC,FXRXM,FXSJ,操作';
  GridView.Columns[5].RepositoryItem := cxdtrpstry1ButtonItem1;
end;

procedure TFrameBugList.btnSearchClick(Sender: TObject);
var
  s: string;
  Param: string;
begin
  inherited;
  Param := 'flag=0';

  if cboCategery.Text <> '' then
  begin
    Param := '&categery=' + cboCategery.Text;
  end;
  if edtTitle.Text <> '' then
  begin
      Param := Param + '&like_title=' + edtTitle.Text;
  end;
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetS_Bug', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', True);
  FreeFrameWait;
end;

procedure TFrameBugList.CloseFrame;
begin
  BtnSearchClick(nil);
end;

end.
