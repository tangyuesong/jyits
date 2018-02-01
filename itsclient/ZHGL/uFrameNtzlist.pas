unit uFrameNtzlist;

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
  uRequestItf, uJsonUtils, uFrameNtzEdit, uGlobal, udm, uCommon;

type
  TFrameNtzlist = class(TdxGridFrame)
    cxDateEdit1: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    cxDateEdit2: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    edtHphm: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem5: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    cxButton3: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    cxButton4: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    cxButton5: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
  private
    fNtzEdit: TFrameNtzEdit;
    procedure ShowAddFrame(id: String);
    procedure FrameClose;
    procedure FrameOKClick(ANtzInfo: TNtzInfo);
    procedure ShowData();
  public
    procedure AfterConstruction; override;
  end;

var
  FrameNtzlist: TFrameNtzlist;

implementation

{$R *.dfm}
{ TFrameNtzlist }

procedure TFrameNtzlist.actdeleteExecute(Sender: TObject);
begin
  inherited;
  cxButton4Click(nil);
end;

procedure TFrameNtzlist.acteditExecute(Sender: TObject);
begin
  inherited;
  cxButton3Click(nil);
end;

procedure TFrameNtzlist.AfterConstruction;
begin
  inherited;
  cxDateEdit1.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now));
  cxDateEdit2.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now + 30));
  GridColumns := 'HPHM,HPZL,KSSJ,JSSJ,BZ,LRR,GXSJ,操作';
  GridView.Columns[7].Options.ShowEditButtons := isebAlways;
  GridView.Columns[7].RepositoryItem := cxdtrpstry1ButtonItem1;
  GridView.Columns[4].SortOrder := soAscending;
end;

procedure TFrameNtzlist.cxButton1Click(Sender: TObject);
begin
  inherited;
  ShowData;
end;

procedure TFrameNtzlist.cxButton2Click(Sender: TObject);
begin
  inherited;
  ShowAddFrame('');
end;

procedure TFrameNtzlist.cxButton3Click(Sender: TObject);
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;
  ShowAddFrame(FDMemTable1.FieldByName('SystemID').AsString);
end;

procedure TFrameNtzlist.cxButton4Click(Sender: TObject);
var
  s: String;
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    exit;

  if Application.MessageBox('确定要删除吗?', '提示', MB_YESNO + MB_ICONQUESTION) = idYes
  then
  begin
    s := 'SystemID=' + FDMemTable1.FieldByName('SystemID').AsString +
      '&Enabled=0&lrr=' + gUser.yhbh + '&gxsj=' +
      FormatDateTime('yyyy-mm-dd hh:nn:ss', now());
    if TRequestItf.pDbQuery('ModifyT_Ntzlist', s) = '1' then
    begin
      FDMemTable1.Delete;
      Application.MessageBox('删除成功', '提示', MB_OK + MB_ICONINFORMATION);
    end
    else
      Application.MessageBox('删除失败', '提示', MB_OK + MB_ICONERROR);
  end;
end;

procedure TFrameNtzlist.cxButton5Click(Sender: TObject);
begin
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    Tcommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    FreeFrameWait;
    Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFrameNtzlist.FrameClose;
begin
  if Assigned(fNtzEdit) then
    fNtzEdit.Visible := False;
  dxLayoutControl2.Visible := True;
end;

procedure TFrameNtzlist.FrameOKClick(ANtzInfo: TNtzInfo);
var
  action, Param: String;
begin
  FrameClose;
  Param := 'hphm=' + ANtzInfo.hphm + '&hpzl=' + ANtzInfo.hpzl + '&kssj=' +
    ANtzInfo.kssj + '&jssj=' + ANtzInfo.jssj + '&bz=' + ANtzInfo.bz + '&sbbh=' +
    ANtzInfo.sbbh + '&lrr=' + gUser.yhbh;
  if ANtzInfo.systemid <> '' then
  begin
    Param := Param + '&systemid=' + ANtzInfo.systemid + '&gxsj=' +
      FormatDateTime('yyyy-mm-dd hh:nn:ss', now());
    action := 'ModifyT_NtzList';
  end
  else
    action := 'AddT_NtzList';
  if TRequestItf.DbQuery(action, Param) = '1' then
  begin
    Application.MessageBox('保存成功', '提示', MB_OK + MB_ICONINFORMATION);
    ShowData;
  end
  else
    Application.MessageBox('保存失败', '提示', MB_OK + MB_ICONERROR);
end;

procedure TFrameNtzlist.ShowAddFrame(id: String);
begin
  if not Assigned(fNtzEdit) then
  begin
    fNtzEdit := TFrameNtzEdit.Create(Self);
    fNtzEdit.Parent := Self;
  end;
  fNtzEdit.FSystemID := id;
  if id <> '' then
  begin
    fNtzEdit.edtHphm.Text := FDMemTable1.FieldByName('HPHM').AsString;
    fNtzEdit.cbbHpzl.Text := FDMemTable1.FieldByName('HPZL').AsString;
    fNtzEdit.cxDateEdit1.Date :=
      Tcommon.StringToDT(FDMemTable1.FieldByName('KSSJ').AsString);
    fNtzEdit.cxDateEdit2.Date :=
      Tcommon.StringToDT(FDMemTable1.FieldByName('JSSJ').AsString);
    fNtzEdit.edtBz.Text := FDMemTable1.FieldByName('BZ').AsString;
    fNtzEdit.lsSelectedDev.Items.Clear;
    fNtzEdit.lsSelectedDev.Items.Delimiter := ',';
    fNtzEdit.lsSelectedDev.Items.DelimitedText :=
      FDMemTable1.FieldByName('SBBH').AsString;
  end
  else
  begin
    fNtzEdit.edtHphm.Text := '粤';
    fNtzEdit.cbbHpzl.ItemIndex := 0;
    fNtzEdit.cxDateEdit1.Date :=
      VarToDateTime(FormatDateTime('yyyy-mm-dd', now));
    fNtzEdit.cxDateEdit2.Date :=
      VarToDateTime(FormatDateTime('yyyy-mm-dd', now + 30));
    fNtzEdit.edtBz.Text := '';
    fNtzEdit.lsSelectedDev.Items.Clear;
  end;
  fNtzEdit.Top := (Self.Height - fNtzEdit.Height) div 2;
  fNtzEdit.Left := (Self.Width - fNtzEdit.Width) div 2;
  fNtzEdit.Visible := True;
  fNtzEdit.OnOK := FrameOKClick;
  fNtzEdit.OnClose := FrameClose;
  dxLayoutControl2.Visible := False;
end;

procedure TFrameNtzlist.ShowData;
var
  s, Param: string;
begin
  ShowFrameWait;
  Param := 'Enabled=1&begin_kssj=' + FormatDateTime('yyyy/mm/dd',
    cxDateEdit1.Date) + '&end_jssj=' + FormatDateTime('yyyy/mm/dd',
    cxDateEdit2.Date + 1);
  if Trim(edtHphm.Text) <> '' then
    Param := Param + '&like_HPHM=' + Trim(edtHphm.Text);
  s := TRequestItf.pDbQuery('GetT_Ntzlist', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '');
  FreeFrameWait;
end;

end.
