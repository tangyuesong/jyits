unit uLock;

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
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxLayoutContainer, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, dxLayoutcxEditAdapters, cxContainer, cxProgressBar, Vcl.ExtCtrls,
  uGlobal, uRequestItf, uJsonUtils, Vcl.ComCtrls, cLockVio, uCommon,
  cxEditRepositoryItems, sDialogs, System.Actions, Vcl.ActnList, uEntity,
  Generics.Collections, cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TfLock = class(TdxGridFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    btnSave: TcxButton;
    btnStop: TcxButton;
    pb: TcxProgressBar;
    Timer1: TTimer;
    dxLayoutItem5: TdxLayoutItem;
    pb1: TcxProgressBar;
    procedure btnSaveClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FWhiteList: TStrings;
    FVioC: Integer;
    FVioT: Integer;
    FIsStop: Boolean;
    procedure LoadWhiteList;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  fLock: TfLock;

implementation

{$R *.dfm}

procedure TfLock.btnSaveClick(Sender: TObject);
var
  Param, s: String;
begin
  inherited;
  Param := 'zt=2';
  Param := Param + '&CJJG=' + gUser.DWDM;
  s := TJsonUtils.GetJsonSingleValue(TRequestItf.DbQuery('GetLockTotal',
    Param), 'C');
  FVioT := StrToIntDef(s, 0);
  if FVioT = 0 then
    exit;
  FVioC := 0;
  pb.Position := 0;
  btnSave.Enabled := False;
  btnStop.Enabled := True;
  FIsStop := False;
  Application.ProcessMessages;
  Timer1Timer(nil);
end;

procedure TfLock.btnStopClick(Sender: TObject);
begin
  inherited;
  btnStop.Enabled := False;
  Application.ProcessMessages;
  FIsStop := True;
end;

constructor TfLock.Create(AOwner: TComponent);
begin
  inherited;
  Timer1.Enabled := False;
  Timer1.Interval := 1000;
  GridColumns := 'hphm,hpzl,wfdd,wfsj,wfxw,上传结果';
  LoadWhiteList;
end;

procedure TfLock.LoadWhiteList;
var
  list: TList<TVioWmd>;
  veh: TVioWmd;
begin
  FWhiteList := TStringList.Create;
  list := TJsonUtils.JsonToObjectList<TVioWmd>
    (TRequestItf.DbQuery('GetWhiteList', 'cjjg=' + gUser.DWDM +
    '&powertype=2&dt=' + FormatDatetime('yyyy/mm/dd', Now())));
  for veh in list do
    FWhiteList.Add(veh.hphm + veh.hpzl);
  list.Free;
end;

procedure TfLock.Timer1Timer(Sender: TObject);
var
  s, Param: string;
  i: Integer;
  lvio: TDealLockVio;
begin
  Timer1.Enabled := False;
  Param := 'Count=30&IP=' + gClientIP;
  Param := Param + '&CJJG=' + gUser.DWDM;
  s := TRequestItf.DbQuery('GetLockVioList', Param);
  if s = '' then
  begin
    btnSave.Enabled := True;
    btnStop.Enabled := False;
    pb.Position := 100;
    exit;
  end;
  TJsonUtils.JSONToDataSet(s, FDMemTable1, '');
  i := 0;
  FDMemTable1.First;
  while not FDMemTable1.Eof do
  begin
    inc(i);
    inc(FVioC);
    pb.Position := FVioC * 100 / FVioT;
    pb1.Position := i * 100 / FDMemTable1.RecordCount;
    Application.ProcessMessages;
    lvio := TDealLockVio.Create;

    s := lvio.UploadVio(FDMemTable1.FieldByName('systemid').AsString,
      FWhiteList);
    lvio.Free;
    FDMemTable1.Edit;
    FDMemTable1.FieldByName('上传结果').AsString := s;
    FDMemTable1.Post;
    if FIsStop then
    begin
      btnSave.Enabled := True;
      break;
    end;
    FDMemTable1.Next;
  end;
  Timer1.Enabled := not FIsStop;
end;

end.
