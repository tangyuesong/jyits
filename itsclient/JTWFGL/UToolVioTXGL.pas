unit UToolVioTXGL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
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
  dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, dxSkinsdxBarPainter, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxDropDownEdit,
  cxMaskEdit, cxCalendar, cxTextEdit, dxBar, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, dxFrame,
  dxDialogBase, UFrameTXGL, udictionary, uCommon, uJsonUtils, uEntity,
  uRequestItf, cxEditRepositoryItems, sDialogs, System.Actions, Vcl.ActnList;

type
  TFToolVIOTXGL = class(TToolGridFrame)
    btnInput: TdxBarLargeButton;
    btnUpdate: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    edthphm5: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    DtKSSJ: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    DTJSSJ: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    cbbJC: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    cbbHPZL: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    btnAdd: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    procedure btnInputClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edthphm5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FrameEditTXGL: TFrameTXGL;
    procedure InsertTable(obj: TResultMail);
    procedure DoOK(obj: TResultMail);
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FToolVIOTXGL: TFToolVIOTXGL;

implementation

{$R *.dfm}

{ TFToolVIOTXGL }
procedure TFToolVIOTXGL.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);

end;

procedure TFToolVIOTXGL.acteditExecute(Sender: TObject);
begin
  inherited;
  btnUpdateClick(nil);
end;

procedure TFToolVIOTXGL.AfterConstruction;
begin
  inherited;
  GridColumns := 'hphm,hpzl,zsxxdz,syr,lrr,txyy,gxsj,操作';
  GridView.Columns[7].RepositoryItem := cxdtrpstry1ButtonItem1;
  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gdicmain['JC'], true);
  cbbJC.ItemIndex := 18;
  TLZDictionary.BindCombobox(cbbHPZL, TLZDictionary.gdicmain['HPZL'], true);
  cbbHPZL.ItemIndex := 1;
  DtKSSJ.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', Now - 30));
  DTJSSJ.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', Now));
  btnAdd.Visible := btnInput.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := btnUpdate.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := btnDel.Enabled;
end;

procedure TFToolVIOTXGL.btnSearchClick(Sender: TObject);
var
  vdt: string;
  vdt2: string;
  hphm: string;
  hpzl: string;
  s: string;
  Param: string;
begin
  inherited;
  vdt := DtKSSJ.Text;
  vdt2 := FormatDateTime('yyyy/mm/dd', DTJSSJ.Date + 1);
  if (vdt = '') or (vdt2 = '') then
  begin
    Application.MessageBox('开始时间和结束时间必须填写', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  Param := 'begin_gxsj=' + vdt + '&end_gxsj=' + vdt2;
  if edthphm5.Text <> '' then
  begin
    hphm := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + edthphm5.Text;
    hpzl := TLZDictionary.StrtoDicInfo(cbbHPZL.Text).dm;
    Param := Param + '&hphm=' + hphm + '&hpzl=' + hpzl;
  end;
  ShowFrameWait;
  s := TRequestItf.pDbQuery('GetS_MAILRESULT', Param);
  TJSONUtils.JSONToDataSet(s, Fdmemtable1, 'GXSJ');
  FreeFrameWait;
end;

procedure TFToolVIOTXGL.btnDelClick(Sender: TObject);
var
  sysid:string;
begin
  inherited;
  sysid := Fdmemtable1.FieldByName('systemid').AsString;
  if Application.MessageBox('是否删除数据', '提示', MB_OKCANCEL + MB_ICONINFORMATION) = IDOK
  then
  begin
    TRequestItf.DbQuery('DelS_MAILRESULT', 'SYSTEMID=' + sysid);
    Fdmemtable1.Delete;
    // Application.MessageBox('删除成功', '提示', MB_OK + MB_ICONQUESTION);
  end;
end;

procedure TFToolVIOTXGL.btnInputClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FrameEditTXGL) then
  begin
    FrameEditTXGL := TFrameTXGL.Create(self);
    FrameEditTXGL.Parent := self;
    FrameEditTXGL.Left := (self.Width - FrameEditTXGL.Width) div 2;
    FrameEditTXGL.Top := 120;
    FrameEditTXGL.OnOK := self.InsertTable;
  end;
  FrameEditTXGL.edthphm.Text := '';
  FrameEditTXGL.EditID := TEditStatus.esNew;
  FrameEditTXGL.dxLayoutItem10.Visible := true;
  FrameEditTXGL.chk1.Checked := true;
  FrameEditTXGL.OnClose := self.CloseFrame;
  FrameEditTXGL.OnOK := DoOK;
  FrameEditTXGL.Show;
  EnableControls(False);
end;

procedure TFToolVIOTXGL.InsertTable(obj: TResultMail);
begin
  if FrameEditTXGL.EditID = TEditStatus.esModify then
    Fdmemtable1.Delete;
  TJSONUtils.AppendRecordToTable<TResultMail>(@obj, Fdmemtable1);
end;

procedure TFToolVIOTXGL.btnUpdateClick(Sender: TObject);
begin
  inherited;
  if Fdmemtable1.IsEmpty then
  begin
    Application.MessageBox('没有数据可以修改', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  if not Assigned(FrameEditTXGL) then
  begin
    FrameEditTXGL := TFrameTXGL.Create(self);
    FrameEditTXGL.Parent := self;
    FrameEditTXGL.Left := (self.Width - FrameEditTXGL.Width) div 2;
    FrameEditTXGL.Top := 120;
    FrameEditTXGL.OnOK := self.InsertTable;
  end;
  FrameEditTXGL.EditID := TEditStatus.esModify;
  FrameEditTXGL.OnClose := self.CloseFrame;
  FrameEditTXGL.OnOK := DoOK;
  FrameEditTXGL.dxLayoutItem10.Visible := False;
  FrameEditTXGL.chk1.Checked := False;
  FrameEditTXGL.MailInfo := TJSONUtils.TableToRecord<TResultMail>(Fdmemtable1);
  FrameEditTXGL.Show;
  EnableControls(False);
end;

procedure TFToolVIOTXGL.DoOK(obj: TResultMail);
begin
  btnSearchClick(nil);
end;

procedure TFToolVIOTXGL.edthphm5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    btnSearchClick(nil);
end;

procedure TFToolVIOTXGL.btnAddClick(Sender: TObject);
begin
  inherited;
  btnInputClick(nil);
end;

end.

