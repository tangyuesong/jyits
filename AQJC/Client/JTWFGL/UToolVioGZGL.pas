unit UToolVioGZGL;

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
  dxSkinsdxBarPainter, dxBar, cxClasses, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxLayoutControl, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Udictionary, dxFrame, uLookUpDataSource, dxDialogBase, UFrameWFGZ,
  uColumnGenerator, UEntity, uRequestItf, uJSONUtils, uGlobal, uCommon, QBAes,
  sDialogs, cxEditRepositoryItems, System.Actions, Vcl.ActnList, cxLabel;

type
  TToolVioGZGL = class(TToolGridFrame)
    dxBarLargeButton1: TdxBarLargeButton;
    btnUpdate: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    cxDateEdit1: TcxDateEdit;
    dxLayoutItem8: TdxLayoutItem;
    cxDateEdit2: TcxDateEdit;
    dxLayoutItem9: TdxLayoutItem;
    ChkJm: TcxCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    btnSearch: TcxButton;
    dxLayoutItem12: TdxLayoutItem;
    FrameWFGZ1: TFrameWFGZ;
    btnExport: TdxBarLargeButton;
    BtnExport2: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    cbblx: TcxComboBox;
    dxLayoutItem2: TdxLayoutItem;
    procedure btnUpdateClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure BtnExport2Click(Sender: TObject);
  private
    procedure HideEditFrame;
    procedure ShowEditFrame();
    function GetVIOTZS: TvioTZS;

    { Private declarations }
  public
    { Public declarations }
    vdt, vdt2: string;
    procedure AfterConstruction; override;
  end;

var
  ToolVioGZGL: TToolVioGZGL;

implementation

procedure TToolVioGZGL.AfterConstruction;
var
  s: TStrings;
  i: Integer;
begin
  inherited;
  cxDateEdit1.Date := VarToDateTime(FormatDateTime('yyyy-mm', now) + '-01');
  cxDateEdit2.Date := VarToDateTime(FormatDateTime('yyyy-mm-dd', now));
  FrameWFGZ1.Visible := false;
  NoLookupColumns := 'wfxw';
  GridColumns :=
    'XH,cjjg,hphm,hpzl,wfdz,wfxw,wfsj,jdcsyr,yzbm,ZSXXDZ, FG, JE, JF';
  BtnExport2.Visible := BtnExport2.Enabled;
end;

procedure TToolVioGZGL.ShowEditFrame();
begin
  if FDMemTable1.IsEmpty then
  begin
    Application.MessageBox('没有数据可以修改', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  EnableControls(false);
  FrameWFGZ1.Visible := true;
  FrameWFGZ1.top := (self.Height - FrameWFGZ1.Height) div 2;
  FrameWFGZ1.Left := (self.Width - FrameWFGZ1.Width) div 2;
  FrameWFGZ1.Edtyzbm.Text := FDMemTable1.FieldByName('yzbm1').AsString;
  FrameWFGZ1.EdtZSXXDZ.Text := FDMemTable1.FieldByName('ZSXXDZ').AsString;
  FrameWFGZ1.EdtSYR.Text := FDMemTable1.FieldByName('JDCSYR').AsString;
end;

procedure TToolVioGZGL.btnExitClick(Sender: TObject);
begin
  inherited;
  HideEditFrame;
end;

procedure TToolVioGZGL.btnSaveClick(Sender: TObject);
var
  TZS: TvioTZS;
  s: string;
begin
  inherited;
  TZS := GetVIOTZS;
  if TZS <> nil then
  begin
    s := FrameWFGZ1.Edtyzbm.Text + ',' + FrameWFGZ1.EdtZSXXDZ.Text + ',' +
      FrameWFGZ1.EdtSYR.Text;
    FDMemTable1.Delete;
    TJSONUtils.AddObjToTable(FDMemTable1, TZS);
    TZS.Free;
    HideEditFrame;
    Application.MessageBox('修改成功', '提示', MB_OK + MB_ICONQUESTION);
  end;

end;

procedure TToolVioGZGL.btnSearchClick(Sender: TObject);
var
  s, Param: string;
  hphm, hpzl: string;
  dic: Tdic;
  dclx: string;
begin
  inherited;
  ShowFrameWait;
  vdt := cxDateEdit1.Text;
  vdt2 := FormatDateTime('yyyy/mm/dd', cxDateEdit2.Date + 1);
  if cbblx.ItemIndex = 1 then
    dclx := 'Q'
  else
    dclx := 'W';
  Param := 'kssj=' + vdt + '&jssj=' + vdt2 + '&dclx=' + dclx;
  Param := Param + '&cjjg=' + gUser.DWDM;
  s := TRequestItf.pDbQuery('GETMail', Param);
  TJSONUtils.JSONToDataSet(s, FDMemTable1, '');
  FreeFrameWait;
end;

procedure TToolVioGZGL.btnUpdateClick(Sender: TObject);
begin
  inherited;
  ShowEditFrame();
end;

procedure TToolVioGZGL.BtnExport2Click(Sender: TObject);
begin
  inherited;
  btnExportClick(nil);
end;

procedure TToolVioGZGL.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);
end;

procedure TToolVioGZGL.acteditExecute(Sender: TObject);
begin
  inherited;
  btnUpdateClick(nil);
end;

procedure TToolVioGZGL.btnDelClick(Sender: TObject);
var
  id: string;
begin
  inherited;
  id := FDMemTable1.FieldByName('Systemid').AsString;
  FDMemTable1.Delete;
  Application.MessageBox('删除成功', '提示', MB_OK + MB_ICONQUESTION);
end;

procedure TToolVioGZGL.btnExportClick(Sender: TObject);
var
  hpzl: string;
  i: Integer;
  dm, Param: string;
begin
  if dlgSave.Execute then
  begin
    ShowFrameWait;
    if ChkJm.Checked then
    begin
      for i := 0 to GridView.ColumnCount - 1 do
      begin
        dm := GridView.Columns[i].DataBinding.FieldName;
        GridView.Columns[i].Caption := dm;
        if (dm = 'WFXW') or (dm = 'HPZL') then
          GridView.Columns[i].PropertiesClass := TcxTextEditProperties;
      end;
      FDMemTable1.First;
      FDMemTable1.DisableControls;
      while not FDMemTable1.Eof do
      begin
        FDMemTable1.Edit;
        FDMemTable1.FieldByName('hphm').AsString :=
          AesEncrypt(FDMemTable1.FieldByName('hphm').AsString, Expostkey);
        hpzl := FDMemTable1.FieldByName('hpzl').AsString;
        if TLZdictionary.gDicMain['HPZL'].ContainsKey(hpzl) then
          FDMemTable1.FieldByName('hpzl').AsString :=
            AesEncrypt(trim(TLZdictionary.gDicMain['HPZL'][hpzl]), Expostkey);
        FDMemTable1.FieldByName('jdcsyr').AsString :=
          AesEncrypt(FDMemTable1.FieldByName('jdcsyr').AsString, Expostkey);
        FDMemTable1.FieldByName('wfxw').AsString :=
          AesEncrypt(FDMemTable1.FieldByName('wfxw').AsString, Expostkey);
        FDMemTable1.FieldByName('wfdz').AsString :=
          AesEncrypt(FDMemTable1.FieldByName('wfdz').AsString, Expostkey);
        FDMemTable1.FieldByName('xh').AsString :=
          AesEncrypt(FDMemTable1.FieldByName('xh').AsString, Expostkey);
        FDMemTable1.FieldByName('ZSXXDZ').AsString :=
          AesEncrypt(FDMemTable1.FieldByName('ZSXXDZ').AsString, Expostkey);
        FDMemTable1.Post;
        FDMemTable1.Next;
      end;
      FDMemTable1.EnableControls;

    end;
    Tcommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);

    Param := 'cjjg=' + gUser.DWDM;
    Param := Param + '&begin_GXSJ=' + vdt + '&end_GXSJ=' + vdt2;
    TRequestItf.pDbQuery('ModifySurveilBz', Param);
    GridColumns :=
      'XH,cjjg,hphm,hpzl,wfdz,wfxw,wfsj,jdcsyr,yzbm,ZSXXDZ, FG, JE, JF';
    btnSearchClick(nil);
    FreeFrameWait;
    Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

function TToolVioGZGL.GetVIOTZS: TvioTZS;
begin
  Result := nil;
  Result := TvioTZS.Create;
  Result.sxh := FDMemTable1.FieldByName('SXH').AsString;
  Result.CJJG := FDMemTable1.FieldByName('CJJG').AsString;
  Result.hphm := FDMemTable1.FieldByName('HPHM').AsString;
  Result.hpzl := FDMemTable1.FieldByName('HPZL').AsString;
  Result.WFDD := FDMemTable1.FieldByName('WFDD').AsString;
  Result.WFXW := FDMemTable1.FieldByName('WFXW').AsString;
  Result.WFSJ := FDMemTable1.FieldByName('WFSJ').AsString;
  Result.JDCSYR := FrameWFGZ1.EdtSYR.Text;
  Result.YZBM1 := FrameWFGZ1.Edtyzbm.Text;
  Result.zsxxdz := FrameWFGZ1.EdtZSXXDZ.Text;;
  Result.WFXWDM := FDMemTable1.FieldByName('WFXWDM').AsString;
  Result.FG := FDMemTable1.FieldByName('FG').AsString;
  Result.JE := FDMemTable1.FieldByName('JE').AsString;
  Result.JF := FDMemTable1.FieldByName('JF').AsString;
end;

procedure TToolVioGZGL.HideEditFrame;
begin
  EnableControls(true);
  FrameWFGZ1.Visible := false;
end;
{$R *.dfm}

end.
