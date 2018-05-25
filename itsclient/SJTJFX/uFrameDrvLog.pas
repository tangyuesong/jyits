unit uFrameDrvLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Generics.Collections,
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
  dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  dxSkinsdxBarPainter, cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxClasses, dxBar, System.Actions, Vcl.ActnList, sDialogs,
  cxEditRepositoryItems, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit,
  cxDropDownEdit, cxCalendar, uCommon, uJsonUtils, uRequestItf, uEntity,
  dxDialogBase, Vcl.ExtCtrls, uFrameResult, cxLabel;

type
  TFrameDrvLog = class(TToolGridFrame)
    BtnSearch: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    Timer1: TTimer;
    txtSFZ: TcxTextEdit;
    txtJBR: TcxTextEdit;
    txtDays: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    procedure BtnSearchClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
  private
    FResultFrame: TFrameResult;
  protected
    procedure LoadData; override;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameDrvLog: TFrameDrvLog;

implementation

{$R *.dfm}

procedure TFrameDrvLog.actViewExecute(Sender: TObject);
var
  jszh: string;
  vioList: TList<TVioClass>;
  i: integer;
  jkrq, clrq: TDateTime;
begin
  inherited;
  FResultFrame.Show;
  jszh := FDMemTable1.FieldByName('SFZMHM').AsString;
  clrq := VarToDateTime(FDMemTable1.FieldByName('CLRQ').AsString);
  vioList := TCommon.GetVio('', '', jszh, '', '1');
  for i := vioList.Count - 1 downto 0 do
  begin
    jkrq := vartodatetime(vioList[i].clsj.Substring(0, 19));
    if (jkrq < clrq) or (vioList[i].dsr = vioList[i].jdcsyr) then
      vioList.Delete(i);
  end;
  TJSONUtils.RecordListToTable<TVioClass>(vioList, FResultFrame.FDMemTable1);
  vioList.Free;
end;

procedure TFrameDrvLog.AfterConstruction;
begin
  inherited;
  GridColumns := 'CLRQ,GLBM,JBR,SFZMHM,XM,SJHM,CCLZRQ,DAYS,BZ,²Ù×÷';
  GridView.Columns[9].RepositoryItem := cxdtrpstry1ButtonItem1;

  FResultFrame := TFrameResult.Create(self);
  FResultFrame.Parent := self;
  FResultFrame.Align := alClient;
  FResultFrame.Hide;
  FResultFrame.GridColumns :=
    'WFBH,DSR,HPHM,HPZL,JDCSYR,WFXW,WFJFS,FKJE,WFSJ,WFDZ,JBR1,JKRQ';
end;

procedure TFrameDrvLog.BtnSearchClick(Sender: TObject);
begin
  inherited;
  self.edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameDrvLog.LoadData;
var
  s, Param: string;
begin
  inherited;
  Param := 'days=' + txtDays.Text;
  Param := Param + '&sfzmhm=' + txtSFZ.Text;
  Param := Param + '&jbr=' + txtJBR.Text;
  Param := Param + '&rows=' + cbbPageSize.Text;
  Param := Param + '&start=' + self.edtPageIndex.Text;
  ShowFrameWait;
  s := TRequestItf.DbQuery('GetDrvLog', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1);
  FreeFrameWait;
end;

procedure TFrameDrvLog.Timer1Timer(Sender: TObject);
begin
  inherited;
  self.BtnSearchClick(nil);
end;

end.
