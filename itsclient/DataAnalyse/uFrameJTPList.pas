unit UFrameJTPList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, dxGridFrame, uColumnGenerator,
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
  dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf, Vcl.ComCtrls, FireDAC.Comp.DataSet,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, dxSkinsdxBarPainter, cxContainer,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, dxBar, cxClasses,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, Udictionary,
  uRequestItf, uJsonUtils, UFrameJTPAdd, uCommon, uEntity, cxEditRepositoryItems,
  sDialogs, System.Actions, Vcl.ActnList, Vcl.ExtCtrls, cxLabel;

type
  TFrameJTPList = class(TToolGridFrame)
    btnInput: TdxBarLargeButton;
    btnUpdate: TdxBarLargeButton;
    btnCheck: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    DTKSSJ: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbZT: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    btnSearch: TcxButton;
    btnDel: TdxBarLargeButton;
    btnAdd: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    Timer1: TTimer;
    dxLayoutItem10: TdxLayoutItem;
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FrameJTPAdd: TFrameJTPAdd;
  protected
    procedure LoadData; override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameJTPList: TFrameJTPList;

implementation

{$R *.dfm}

{ TFFrameJTPList }
procedure TFrameJTPList.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Eof then
  begin
    // TODO: Delete
    if Application.MessageBox('确定要删除此纪录?', '删除确认',MB_YESNOCANCEL) = mrOK then
    begin
      TRequestItf.DbQuery('DelT_KK_Alarm_JTP', 'SYSTEMID='+FDMemTable1.FieldByName('SYSTEMID').AsString);
      LoadData;
    end;
  end;
end;

procedure TFrameJTPList.AfterConstruction;
begin
  inherited;
  DTKSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', Now - 30));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy/mm/dd', Now + 1));
  cbbZT.ItemIndex := 0;
  GridColumns := 'CLPP,CSYS,SJHM,BKR,GXSJ,操作';
  GridView.Columns[5].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := false;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible := true;
end;

procedure TFrameJTPList.btnSearchClick(Sender: TObject);
begin
  inherited;
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameJTPList.btnAddClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FrameJTPAdd) then
  begin
    FrameJTPAdd := TFrameJTPAdd.Create(Self);
    with FrameJTPAdd do
    begin
      Parent := Self;
      top := 120;
      Left := (Self.Width - Width) div 2;
      FrameJTPAdd.OnOK := LoadData;
    end;
  end;
  FrameJTPAdd.ClearControls(FrameJTPAdd);
  FrameJTPAdd.OnClose := Self.CloseFrame;
  FrameJTPAdd.Show;
  Self.EnableControls(False);
end;

procedure TFrameJTPList.LoadData;
var
  vdt, vdt2, zt, hphm, hpzl, Param: string;
  s: string;
  json: string;
  pageSize, pageIndex: integer;
begin
  inherited;
  vdt := DTKSSJ.Text;
  vdt2 := FormatDateTime('yyyy/mm/dd', DTJSSJ.Date + 1);
  Param := Format('begin_gxsj=%s&end_gxsj=%s', [vdt, vdt2]);
  zt := IntToStr(cbbZT.ItemIndex);
  if zt <> '' then
  begin
    Param := Param + Format('&zt=%s', [zt]);
  end;
  s := TRequestItf.DbQuery('GetT_KK_Alarm_JTP', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, 'GXSJ');
  FreeFrameWait;
end;

procedure TFrameJTPList.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  LoadData;
end;

end.
