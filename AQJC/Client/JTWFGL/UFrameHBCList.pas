unit UFrameHBCList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  Generics.Collections,
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
  Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxDropDownEdit, cxMaskEdit, cxCalendar,
  dxFrame, dxDialogBase, dxImport, uFrameHBCImport, uFrameHBCEdit, uEntity,
  uCommon, cxEditRepositoryItems, sDialogs, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls;

type
  TFrameHBCList = class(TToolGridFrame)
    btnNew: TdxBarLargeButton;
    btnModify: TdxBarLargeButton;
    btnDelete: TdxBarLargeButton;
    btnImport: TdxBarLargeButton;
    btnExport: TdxBarLargeButton;
    btnImportVio: TdxBarLargeButton;
    cbbSF: TcxComboBox;
    dxLayoutItem4: TdxLayoutItem;
    edtHPHM: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    btnImport2: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    BtnExport2: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    btnImportVio2: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    Timer1: TTimer;
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnImportVioClick(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FEditFrame: TFrameHBCEdit;
    FImportFrame: TFrameImportHBC;
    procedure btnEditSaveClick(Sender: TObject);
    procedure btnEditExitClick(Sender: TObject);
    procedure btnImportExitClick(Sender: TObject);
    procedure btnImportSaveClick(Sender: TObject);
  protected
    procedure LoadData; override;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameHBCList: TFrameHBCList;

implementation

uses
  uDictionary, uColumnGenerator, uRequestItf, uJSONUtils, dxGridFrame, QBAes;
{$R *.dfm}

procedure TFrameHBCList.btnNewClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FEditFrame) then
  begin
    FEditFrame := TFrameHBCEdit.Create(self);
    FEditFrame.Parent := self;
    FEditFrame.Left := (self.Width - FEditFrame.Width) div 2;
    FEditFrame.Top := 120;
    FEditFrame.btnSave.OnClick := self.btnEditSaveClick;
    FEditFrame.btnExit.OnClick := self.btnEditExitClick;
  end;
  FEditFrame.edtHPHM.Text := '';
  FEditFrame.Show;
  EnableControls(false);
end;

procedure TFrameHBCList.btnSearchClick(Sender: TObject);
begin
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TFrameHBCList.LoadData;
var
  hphm, json: string;
  pageSize, pageIndex: Integer;
begin
  inherited;
  ShowFrameWait;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  hphm := Format('rows=%s&start=%s&orderby_desc=GXSJ',
    [pageSize.ToString, pageIndex.ToString]);
  if edtHPHM.Text <> '' then
    hphm := hphm + '&hphm=' + copy(cbbSF.Text, 4, 20) + edtHPHM.Text;
  hphm := hphm + '&BJ=1';
  json := TRequestItf.DbQuery('GetT_HBC', hphm);
  FDMemTable1.Close;
  TJSONUtils.JSONToDataSet(json, FDMemTable1, '');
  btnnextPage.Enabled := FDMemTable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TFrameHBCList.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  LoadData;
end;

procedure TFrameHBCList.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDeleteClick(nil);
end;

procedure TFrameHBCList.AfterConstruction;
begin
  inherited;
  GridColumns := 'HPHM,HPZL,CLPP,HBDBQK,CCDJRQ,YXQX,BFQX,BZ,操作';
  TLZDictionary.BindCombobox(cbbSF, TLZDictionary.gdicmain['JC'], true);
  GridView.Columns[8].RepositoryItem := cxdtrpstry1ButtonItem1;
  GridView.Columns[8].Width := 30;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible :=
    btnDelete.Enabled;
  btnImport2.Visible := btnImport.Enabled;
  btnImportVio2.Visible := btnImportVio.Enabled;
  BtnExport2.Visible := btnExport.Enabled;
  cbbSF.ItemIndex := 18;
end;

procedure TFrameHBCList.btnDeleteClick(Sender: TObject);
var
  id: string;
begin
  inherited;
  if not FDMemTable1.Eof then
  begin
    if Application.MessageBox('是否删除数据?', '提示', MB_YESNO + MB_ICONQUESTION) = mrYes
    then
    begin
      id := FDMemTable1.FieldByName('SYSTEMID').AsString;
      TRequestItf.DbQuery('ModifyT_HBC', 'SYSTEMID=' + id + '&BJ=0');
      FDMemTable1.Delete;
    end;
  end;
end;

procedure TFrameHBCList.btnEditExitClick(Sender: TObject);
begin
  FEditFrame.Hide;
  EnableControls(true);
end;

procedure TFrameHBCList.btnEditSaveClick(Sender: TObject);
var
  hbc: THBC;
  id, json: string;
begin
  hbc := FEditFrame.hbc;
  json := TJSONUtils.RecordToString<THBC>(@hbc);
  json := TRequestItf.DbQuery('AddT_HBC', json);
  FDMemTable1.Last;
  FDMemTable1.Append;
  FDMemTable1.Edit;
  FDMemTable1.FieldByName('SYSTEMID').Value := id;
  FDMemTable1.FieldByName('HPHM').Value := hbc.hphm;
  FDMemTable1.FieldByName('HPZL').Value := hbc.HPZL;
  FDMemTable1.FieldByName('FDJH').Value := hbc.FDJH;
  FDMemTable1.FieldByName('SJHM').Value := hbc.SJHM;
  FDMemTable1.FieldByName('CLPP').Value := hbc.CLPP;
  FDMemTable1.FieldByName('JDCSYR').Value := hbc.JDCSYR;
  FDMemTable1.FieldByName('ZSXXDZ').Value := hbc.ZSXXDZ;
  FDMemTable1.FieldByName('CLSBDH').Value := hbc.CLSBDH;
  FDMemTable1.FieldByName('CLXH').Value := hbc.CLXH;
  FDMemTable1.FieldByName('HBDBQK').Value := hbc.HBDBQK;
  FDMemTable1.FieldByName('CCDJRQ').Value := hbc.CCDJRQ;
  FDMemTable1.FieldByName('YXQX').Value := hbc.YXQX;
  FDMemTable1.FieldByName('BFQX').Value := hbc.BFQX;
  FDMemTable1.Post;

  FEditFrame.Hide;
  EnableControls(true);
end;

procedure TFrameHBCList.btnExportClick(Sender: TObject);
var
  json, filename, ext: string;
  tmp: TdxGridFrame;
  tb: TFDMemTable;
  f: TField;
  dic: TDictionary<string, boolean>;
begin
  inherited;
  if not SaveDialog1.Execute then
    exit;
  ShowFrameWait;
  filename := SaveDialog1.filename;
  ext := ExtractFileExt(filename);
  if ext = '' then
  begin
    ext := '.xls';
    filename := filename + '.xls';
  end;
  Application.ProcessMessages;
  self.Cursor := crAppStart;
  json := TRequestItf.DbQuery('GetHBCVioToExport', '');
  if json <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJSONUtils.JSONToDataSet(json, tb);
    tmp := TdxGridFrame.Create(self);
    TColumnGenerator.Instance.GenerateField
      ('hphm,hpzl,clpp,fdjh,syr,ccdjrq,clxh,YJ', tmp.GridView);
    for f in tb.Fields do
      tmp.FDMemTable1.FieldDefs.Add(f.FieldName, f.DataType, f.DataSize, false);
    tmp.FDMemTable1.FieldDefs.Add('yj', ftString, 10, false);
    tb.First;
    tmp.FDMemTable1.Open;
    dic := TDictionary<string, boolean>.Create;
    while not tb.Eof do
    begin
      if not dic.ContainsKey(tb.FieldByName('hphm').AsString +
        tb.FieldByName('hpzl').AsString) then
      begin
        dic.Add(tb.FieldByName('hphm').AsString + tb.FieldByName('hpzl')
          .AsString, true);
        tmp.FDMemTable1.Append;
        tmp.FDMemTable1.Edit;
        tmp.FDMemTable1.FieldByName('hphm').Value :=
          AesEncrypt(tb.FieldByName('hphm').AsString, 'lgm');
        tmp.FDMemTable1.FieldByName('hpzl').Value :=
          AesEncrypt(tb.FieldByName('hpzl').AsString, 'lgm');
        tmp.FDMemTable1.FieldByName('clpp').Value :=
          AesEncrypt(tb.FieldByName('clpp').AsString, 'lgm');
        tmp.FDMemTable1.FieldByName('FDJH').Value :=
          AesEncrypt(tb.FieldByName('FDJH').AsString, 'lgm');
        tmp.FDMemTable1.FieldByName('syr').Value :=
          AesEncrypt(tb.FieldByName('syr').AsString, 'lgm');
        if Length(tb.FieldByName('ccdjrq').AsString) > 0 then
          tmp.FDMemTable1.FieldByName('ccdjrq').Value :=
            tb.FieldByName('ccdjrq').AsString;
        tmp.FDMemTable1.FieldByName('clxh').Value :=
          tb.FieldByName('clxh').AsString;
        tmp.FDMemTable1.FieldByName('yj').Value := '待审核';
        tmp.FDMemTable1.Post;
      end;
      TRequestItf.DbQuery('ChangeHisVioStatus', 'zt=19&bz=已导出&Systemid=' +
        tb.FieldByName('systemid').AsString);
      tb.Next;
    end;
    dic.Free;
    tmp.FDMemTable1.EnableControls;
    tb.Free;
    TCommon.ExportGridtoData(ext, filename, tmp.CxGrid1);
    tmp.Free;
  end;
  self.Cursor := crDefault;
  FreeFrameWait;
end;

procedure TFrameHBCList.btnImportClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FImportFrame) then
    FImportFrame := TFrameImportHBC.Create(self);
  with FImportFrame do
  begin
    Parent := self;
    Left := (self.Width - Width) div 2;
    Top := 120;
    btnSave.OnClick := self.btnImportSaveClick;
    btnExit.OnClick := self.btnImportExitClick;
    Show;
  end;
  EnableControls(false);
end;

procedure TFrameHBCList.btnImportExitClick(Sender: TObject);
begin
  FImportFrame.btnExitClick(Sender);
  if not FImportFrame.Visible then
    EnableControls(true);
end;

procedure TFrameHBCList.btnImportSaveClick(Sender: TObject);
begin
  FImportFrame.btnSaveClick(Sender);
  if not FImportFrame.Visible then
  begin
    EnableControls(true);
    btnSearchClick(nil);
  end;
end;

procedure TFrameHBCList.btnImportVioClick(Sender: TObject);
var
  filename, Fields, fdHphm, fdHpzl, fdYJ: string;
  table, tbl: TFDMemTable;
  vHphm, vHpzl, vYJ, vZt, s, systemid: string;
  b: boolean;
  ss: TStrings;
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    filename := OpenDialog1.filename;
    table := TFDMemTable.Create(nil);
    ss := TStringList.Create;
    Fields := TCommon.ImportExcel(filename, table);
    Fields := Fields.ToUpper;
    b := Fields <> '';
    if b then
    begin
      if Fields.contains('号牌号码') then
        fdHphm := '号牌号码'
      else if Fields.contains('HPHM') then
        fdHphm := 'HPHM';

      if Fields.contains('号牌种类') then
        fdHpzl := '号牌种类'
      else if Fields.contains('HPZL') then
        fdHpzl := 'HPZL';

      if Fields.contains('意见') then
        fdYJ := '意见'
      else if Fields.contains('YJ') then
        fdYJ := 'YJ';
    end;
    b := b and (fdHphm <> '') and (fdHpzl <> '') and (fdYJ <> '');
    b := b and table.Active;
    if b then
    begin
      s := TRequestItf.DbQuery('GetT_VIO_HIS', 'zt=19');
      if s <> '' then
      begin
        tbl := TFDMemTable.Create(nil);
        TJSONUtils.JSONToDataSet(s, tbl);

        table.First;
        while not table.Eof do
        begin
          vHphm := table.FieldByName(fdHphm).AsString;
          vHpzl := table.FieldByName(fdHpzl).AsString;
          vYJ := table.FieldByName(fdYJ).AsString;
          vHphm := AesDecrypt(vHphm, 'lgm');
          vHphm := vHphm.Trim;
          vHpzl := AesDecrypt(vHpzl, 'lgm');
          vHpzl := vHpzl.Trim;
          if vYJ = '同意' then
            vZt := '2'
          else
            vZt := '4';
          ss.Add(vHphm + #9 + vHpzl + #9 + vYJ + #9 + vZt);
          tbl.First;
          while not tbl.Eof do
          begin
            if (tbl.FieldByName('HPHM').AsString = vHphm) and
              (tbl.FieldByName('HPZL').AsString = vHpzl) then
            begin
              TRequestItf.DbQuery('ChangeHisVioStatus',
                'zt=' + vZt + '&bz=' + vYJ + '&systemid=' +
                tbl.FieldByName('SYSTEMID').AsString);
            end;
            tbl.Next;
          end;
          table.Next;
        end;
        tbl.Free;
      end;
    end;
    ss.SaveToFile(filename + '.txt');
    ss.Free;
    table.Free;
    if b then
      Application.MessageBox('导入成功', '提示')
    else
      Application.MessageBox('导入失败，请检查导入文件', '提示');
  end;
end;

end.
