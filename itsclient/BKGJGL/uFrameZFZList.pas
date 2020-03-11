unit uFrameZFZList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections,
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
  dxSkinsdxBarPainter, dxBar, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, uColumnGenerator, ULookUpDataSource,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  cxEditRepositoryItems, sDialogs, uFrameSignBase, uEntity,
  uFrameZFZ, System.Actions, Vcl.ActnList, cxLabel;

type
  TFrameZFZList = class(TToolGridFrame)
    btnSign: TdxBarLargeButton;
    btnFeedback: TdxBarLargeButton;
    btnDetail: TdxBarLargeButton;
    dtBegin: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    dtEnd: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    cboFWZ: TcxComboBox;
    btnSearch: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    BtnAdd: TcxButton;
    procedure acteditExecute(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    FFrameZFZ: TFrameZFZ;
    procedure HideZFZ;
    procedure ShowEdit(item: TVehCheck);
  protected
    procedure LoadData; override;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameZFZList: TFrameZFZList;

implementation

uses
  uDictionary, uRequestItf, UJSONUtils, uGlobal;
{$R *.dfm}

procedure TFrameZFZList.acteditExecute(Sender: TObject);
var
  item: TVehCheck;
begin
  inherited;
  item := TJSONUtils.TableToRecord<TVehCheck>(FDMemTable1);
  ShowEdit(item);
end;

procedure TFrameZFZList.HideZFZ;
begin
  FFrameZFZ.Hide;
  dxLayoutControl2Group_Root.Visible := true;
  LoadData;
end;

procedure TFrameZFZList.AfterConstruction;
begin
  inherited;
  dtBegin.Date := now - 1;
  dtEnd.Date := now;
  TLZDictionary.BindComboboxDEPT(self.cboFWZ, true);
  GridColumns := 'DWDM,HPHM,HPZL,JCSJ,JCCLLX,SFD,MDD,操作';
  GridView.Columns[7].RepositoryItem := cxdtrpstry1ButtonItem1;
  GridView.Columns[0].Caption := '部门';
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Hint := '查看';
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := true;
end;

procedure TFrameZFZList.LoadData;
var
  Param: string;
  s: string;
  beginTime: Double;
  pageSize, pageIndex: Integer;
begin
  inherited;
  beginTime := dtBegin.Date;
  //if (cboZT.Text = '未签收') and (dtEnd.Date - beginTime > 1 / 24 / 2) then
  //  beginTime := dtEnd.Date - 1 / 24 / 2;
  Param := Format('yhbh=%s&begin_GCSJ=%s&end_GCSJ=%s',
    [gUser.YHBH, FormatDateTime('yyyy/mm/dd hh:mm:ss', beginTime),
    FormatDateTime('yyyy/mm/dd hh:mm:ss', dtEnd.Date)]);
  Param := Param + '&dwdm=' + Copy(cboFWZ.Text, 0, 12);
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  Param := Param + Format('&rows=%s&start=%s', [pageSize.ToString, pageIndex.ToString]);
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetSERV_VEH_CHECK', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TFrameZFZList.btnNewClick(Sender: TObject);
var
  item: TVehCheck;
begin
  inherited;
  item.HDZKL := 0;
  item.HDZZL := 0;
  item.ZKS := 0;
  item.SJZZL := 0;
  item.FWZBH := '';
  item.FWZMC := '';
  item.GCXH := '';
  item.systemid := '';
  ShowEdit(item);
end;

procedure TFrameZFZList.ShowEdit(item: TVehCheck);
begin
  if not Assigned(FFrameZFZ) then
  begin
    FFrameZFZ := TFrameZFZ.Create(self);
    FFrameZFZ.Parent := self;
    FFrameZFZ.Top := 20;
    FFrameZFZ.Left := (self.Width - FFrameZFZ.Width) div 2;
    FFrameZFZ.OnBack := HideZFZ;
  end;
  FFrameZFZ.VehCheckItem := item;

  dxLayoutControl2Group_Root.Visible := false;
  FFrameZFZ.Show;
end;

procedure TFrameZFZList.btnSearchClick(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

end.
