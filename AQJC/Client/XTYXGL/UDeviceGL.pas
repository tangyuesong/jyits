unit UDeviceGL;

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
  cxButtons, cxMaskEdit, cxDropDownEdit, cxTextEdit, UFrameDeviceEdit,
  cxGridViewLayoutContainer, cxGridLayoutView, cxGridDBLayoutView,
  cxGridCustomLayoutView, uJsonUtils, uCommon, uEntity, uRequestItf, uGlobal,
  cxCheckBox, cxGridCardView, cxGridDBCardView, cxDBEditRepository, Udictionary,
  ULookUpDataSource, uColumnGenerator, System.Actions, Vcl.ActnList, sDialogs,
  Vcl.ExtCtrls;

type
  TFDeviceList = class(TToolGridFrame)
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    cxdtrpstry1CheckBoxItem1: TcxEditRepositoryCheckBoxItem;
    CardView1: TcxGridDBCardView;
    cxgrdbcrdvwrwCardView1Row1: TcxGridDBCardViewRow;
    cxgrdbcrdvwrwCardView1Row2: TcxGridDBCardViewRow;
    cxgrdbcrdvwrwCardView1Row3: TcxGridDBCardViewRow;
    cxgrdbcrdvwrwCardView1Row4: TcxGridDBCardViewRow;
    cxdtrpstry1LookupComboBoxItem1: TcxEditRepositoryLookupComboBoxItem;
    cxgrdbcrdvwrwCardView1Row5: TcxGridDBCardViewRow;
    Btnnew: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    EdtSBBH: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    EdtSBDDMC: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    BtnSearch: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    Timer1: TTimer;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FrameDeviceEdit: TFrameDeviceEdit;
    procedure CloseFrame;
    procedure ShowDeviceEdit;
    procedure insertTable(dev: Tdevice);

    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FDeviceList: TFDeviceList;

implementation

{$R *.dfm}

procedure TFDeviceList.dxBarLargeButton1Click(Sender: TObject);
begin
  inherited;
  if not Assigned(FrameDeviceEdit) then
    FrameDeviceEdit := TFrameDeviceEdit.Create(self);
  FrameDeviceEdit.SetEditReadOnly(FrameDeviceEdit, False);
end;

procedure TFDeviceList.insertTable(dev: Tdevice);
begin
  if FrameDeviceEdit.EditID = TEditStatus.esModify then
    FDMemTable1.Delete;
  TJSONUtils.AppendRecordToTable<Tdevice>(@dev, FDMemTable1);
end;

procedure TFDeviceList.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('确定删除?', '提示', MB_OKCANCEL + MB_ICONQUESTION) = idOK
  then
  begin
    TRequestItf.DbQuery('ModifyS_Device', 'systemid=' + FDMemTable1.FieldByName
      ('systemid').AsString+'&QYZT=0');
    FDMemTable1.Delete;
  end;
end;

procedure TFDeviceList.acteditExecute(Sender: TObject);
begin
  inherited;
  ShowDeviceEdit;
  FrameDeviceEdit.id := FDMemTable1.FieldByName('Systemid').AsString;
  FrameDeviceEdit.Device := TJSONUtils.TableToRecord<Tdevice>(FDMemTable1);
  FrameDeviceEdit.SetEditReadOnly(FrameDeviceEdit, False);
  FrameDeviceEdit.dxLayoutItem2.Visible := True;
  FrameDeviceEdit.dxLayoutItem3.Visible := True;
  FrameDeviceEdit.EditID := TEditStatus.esModify;
  FrameDeviceEdit.OnClose := CloseFrame;
end;

procedure TFDeviceList.actnewExecute(Sender: TObject);
begin
  inherited;
  ShowDeviceEdit;
  FrameDeviceEdit.SetEditReadOnly(FrameDeviceEdit, False);
  FrameDeviceEdit.EditID := TEditStatus.esNew;
  FrameDeviceEdit.dxLayoutItem2.Visible := True;
  FrameDeviceEdit.dxLayoutItem3.Visible := True;
  FrameDeviceEdit.ClearControls(FrameDeviceEdit);
  FrameDeviceEdit.OnClose := CloseFrame;
end;

procedure TFDeviceList.ShowDeviceEdit;
begin
  if not Assigned(FrameDeviceEdit) then
  begin
    FrameDeviceEdit := TFrameDeviceEdit.Create(self);
    FrameDeviceEdit.Parent := self;
  end;
  FrameDeviceEdit.SetEditReadOnly(FrameDeviceEdit, True);
  FrameDeviceEdit.id := FDMemTable1.FieldByName('systemid').AsString;
  FrameDeviceEdit.Show;
end;

procedure TFDeviceList.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  BtnSearchClick(nil);
end;

procedure TFDeviceList.actViewExecute(Sender: TObject);
begin
  inherited;
  ShowDeviceEdit;
  FrameDeviceEdit.dxLayoutItem2.Visible := False;
  FrameDeviceEdit.dxLayoutItem3.Visible := False;
  FrameDeviceEdit.Device := TJSONUtils.TableToRecord<Tdevice>(FDMemTable1);
end;

procedure TFDeviceList.AfterConstruction;
begin
  inherited;
  TColumnGenerator.Instance.LookupRow(cxgrdbcrdvwrwCardView1Row3,
    TLookUpDataSource.DSCJJG);
  TColumnGenerator.Instance.LookupRow(cxgrdbcrdvwrwCardView1Row4,
    TLookUpDataSource.DSSBLX);
  NoLookupColumns := 'SBBH';
  GridColumns := 'SBBH,SBDDMC,SBJD,SBWD,SBLX,CJJG,操作';
  GridView.Columns[6].RepositoryItem := cxdtrpstry1ButtonItem1;
end;

procedure TFDeviceList.BtnSearchClick(Sender: TObject);
var
  s: string;
  Param: string;
  xzqh: string;
begin
  inherited;
  xzqh := TCommon.GetXZQH(guser.DWDM);
  Param := 'like_cjjg=' + xzqh;

  if EdtSBBH.Text <> '' then
  begin
    Param := Param + '&like_sbbh=' + EdtSBBH.Text;
  end;
  if EdtSBDDMC.Text <> '' then
  begin
    Param := Param + '&like_sbddmc=' + EdtSBDDMC.Text;
  end;
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetS_Device', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '', True);
  FreeFrameWait;
end;

procedure TFDeviceList.CloseFrame;
begin
  BtnSearchClick(nil);
end;

end.
