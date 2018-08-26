unit UWFXWGL;

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
  dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, dxSkinsdxBarPainter, cxContainer,
  Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, dxBar, cxClasses, cxEditRepositoryItems,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutControl, sDialogs, uRequestItf, uCommon, uJsonUtils, UFrameWFXWEdit,
  uEntity, System.Actions, Vcl.ActnList, cxMaskEdit, cxDropDownEdit,
  Vcl.ExtCtrls;

type
  TFrameWFXWGL = class(TToolGridFrame)
    BtnNew: TdxBarLargeButton;
    btnUpdate: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    BtnAdd: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    Timer1: TTimer;
    procedure BtnNewClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FrameWfxwedit: TFrameWFXWEdit;
    procedure InsertTable(obj: TWfxw);
    procedure ShowWFXWEdit;
    procedure CloseFrame;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameWFXWGL: TFrameWFXWGL;

implementation

{$R *.dfm}

procedure TFrameWFXWGL.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);
end;

procedure TFrameWFXWGL.acteditExecute(Sender: TObject);
begin
  inherited;
  btnUpdateClick(nil);
end;

procedure TFrameWFXWGL.AfterConstruction;
begin
  inherited;
  GridColumns := 'wfxwdm,wfxwmc,fg,tljc,je,jf,yxqks,yxqjs,操作';
  GridView.Columns[8].RepositoryItem := cxdtrpstry1ButtonItem1;
  BtnAdd.Visible := BtnNew.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible :=
    btnUpdate.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := btnDel.Enabled;
end;

procedure TFrameWFXWGL.ShowWFXWEdit;
begin
  if not Assigned(FrameWfxwedit) then
  begin
    FrameWfxwedit := TFrameWFXWEdit.Create(Self);
    FrameWfxwedit.Parent := Self;
    FrameWfxwedit.Left := (Self.Width - FrameWfxwedit.Width) div 2;
    FrameWfxwedit.Top := 0;
    FrameWfxwedit.OnOK := Self.InsertTable;
    FrameWfxwedit.OnClose := Self.CloseFrame;
  end;
  FrameWfxwedit.Show;
end;

procedure TFrameWFXWGL.Timer1Timer(Sender: TObject);
var
  s: string;
begin
  inherited;
  Timer1.Enabled := False;
  ShowFrameWait;
  s := uRequestItf.TRequestItf.pDbQuery('GetT_VIO_ILLECODE', '');
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '');
  FreeFrameWait;
end;

procedure TFrameWFXWGL.BtnAddClick(Sender: TObject);
begin
  inherited;
  BtnNewClick(nil);
end;

procedure TFrameWFXWGL.btnDelClick(Sender: TObject);
var
  systemid: string;
  b: string;
begin
  inherited;
  systemid := FDMemTable1.FieldByName('systemid').AsString;
  b := TRequestItf.pDbQuery('ModifyT_VIO_ILLECODE', 'TYBJ=1&systemid=' + systemid);
  if b <> '0' then
  begin
    Application.MessageBox('删除成功', '提示', MB_OK + MB_ICONINFORMATION);
    FDMemTable1.Delete;
  end
  else
    Application.MessageBox('删除失败', '提示', MB_OK + MB_ICONINFORMATION)

end;

procedure TFrameWFXWGL.BtnNewClick(Sender: TObject);
begin
  inherited;
  ShowWFXWEdit;
  FrameWfxwedit.ClearControls(FrameWfxwedit);
  FrameWfxwedit.EditID := TEditStatus.esNew;
  FrameWfxwedit.OnClose := Self.CloseFrame;
end;

procedure TFrameWFXWGL.btnUpdateClick(Sender: TObject);
begin
  inherited;
  ShowWFXWEdit;
  FrameWfxwedit.id := FDMemTable1.FieldByName('systemid').AsString;
  FrameWfxwedit.EditID := TEditStatus.esModify;
  FrameWfxwedit.EditWFxw := TJSONUtils.TableToRecord<TWfxw>(FDMemTable1);
  EnableControls(False);
end;

procedure TFrameWFXWGL.CloseFrame;
var
  s: String;
begin
  inherited;
  ShowFrameWait;
  s := uRequestItf.TRequestItf.pDbQuery('GetT_VIO_ILLECODE', '');
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '');
  FreeFrameWait;
end;

procedure TFrameWFXWGL.InsertTable(obj: TWfxw);
begin
  if FrameWfxwedit.EditID = TEditStatus.esModify then
    FDMemTable1.Delete;
  TJSONUtils.AppendRecordToTable<TWfxw>(@obj, FDMemTable1);
end;

end.
