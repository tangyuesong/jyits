unit uFrameHBCImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxImport, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, dxLayoutControlAdapters, dxLayoutContainer,
  dxLayoutcxEditAdapters, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, Data.Win.ADODB;

type
  TFrameImportHBC = class(TdxImportDialog)
    con2: TADOConnection;
    qy: TADOQuery;
  private
    function CheckData: boolean;
    function ImportExcel(fileName: string; ATable: TFDMemTable): string;
  protected
    procedure LoadData(fileName: string); override;
    function DoImport: boolean; override;
  public

  end;

var
  FrameImportHBC: TFrameImportHBC;

implementation

uses
  uCommon, uEntity, uJSONUtils, uRequestItf, uColumnGenerator;
{$R *.dfm}
{ TFrameImportHBC }

function TFrameImportHBC.CheckData: boolean;
begin
  result := false;
  if not FDMemTable1.Active then
    exit;
  if (FDMemTable1.FindField('HPHM') = nil) or
    (FDMemTable1.FindField('HPZL') = nil) or
    (FDMemTable1.FindField('CLSBDH') = nil) or
    (FDMemTable1.FindField('FDJH') = nil) then
  begin
    Application.MessageBox('导入格式有误, 必须包含列：HPHM,HPZL,CLSBDH,FDJH', '提示');
    exit;
  end;
  result := true;
end;

function TFrameImportHBC.DoImport: boolean;
var
  veh: TVehInfo;
  hbc: THBC;
  json: string;
  haveError: boolean;
begin
  if not CheckData then
    exit;
  btnBrower.Enabled := false;
  btnSave.Enabled := false;
  btnExit.Enabled := false;
  haveError := false;
  try
    // if FDMemTable1.FindField('status') = nil then
    // FDMemTable1.Fielddefs.Add('status', ftstring, 100, false);

    TRequestItf.DbQuery('DelT_HBC', '');
    FDMemTable1.First;
    while not FDMemTable1.Eof do
    begin
      hbc.HPHM := FDMemTable1.FieldByName('HPHM').AsString;
      hbc.HPZL := FDMemTable1.FieldByName('HPZL').AsString;
      if hbc.HPZL.Length = 1 then
        hbc.HPZL := '0' + hbc.HPZL;
      hbc.CLSBDH := FDMemTable1.FieldByName('CLSBDH').AsString;
      hbc.FDJH := FDMemTable1.FieldByName('FDJH').AsString;
      veh := TCommon.GetVehinfo(hbc.HPHM, hbc.HPZL, '');
      if (veh.HPHM = '') or (veh.CLSBDH <> hbc.CLSBDH) or (veh.FDJH <> hbc.FDJH)
      then
      begin
        // FDMemTable1.FieldByName('status').Value := '信息有误';
        haveError := true;
      end
      else
      begin
        // if not gDicHBC.Contains() then
        hbc.SystemID := TGUID.NewGuid.ToString;
        hbc.SJHM := veh.SJHM;
        hbc.CLPP := veh.clpp1;
        hbc.JDCSYR := veh.syr;
        hbc.ZSXXDZ := veh.ZSXXDZ;
        hbc.ccdjrq := veh.ccdjrq;
        hbc.YXQX := veh.yxqz;
        hbc.BFQX := veh.qzbfqz;
        hbc.CLXH := veh.CLXH;
        hbc.HBDBQK := veh.HBDBQK;

        json := TJSONUtils.RecordToString<THBC>(@hbc);
        json := TRequestItf.DbQuery('AddT_HBC', json);
        FDMemTable1.Edit;
        FDMemTable1.FieldByName('status').Value := '导入成功';
        FDMemTable1.Post;
      end;
      FDMemTable1.Next;
      Application.ProcessMessages;
    end;
    if haveError then
      Application.MessageBox('导入完成，错误信息请查看状态列', '提示')
    else
      Application.MessageBox('导入成功', '提示');
    TRequestItf.DbQuery('DelHBCVio', '');
  finally
    btnBrower.Enabled := true;
    btnSave.Enabled := true;
    btnExit.Enabled := true;
  end;
end;

function TFrameImportHBC.ImportExcel(fileName: string;
  ATable: TFDMemTable): string;
var
  col: String;
  semc: TStrings;
  i: integer;
begin
  semc := TStringList.Create;
  try
    con2.Close;
    con2.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Mode=Share Deny None;Extended Properties=Excel 8.0;'
      + 'Persist Security Info=False;Data Source=' + fileName;
    con2.LoginPrompt := false;
    con2.Connected := true;
    con2.GetTableNames(semc, false);
    qy.Close;
    qy.SQL.Text := 'select HPHM, HPZL, CLSBDH, FDJH from [' + semc[0] + ']';
    qy.Open;
    for i := 0 to qy.Fields.Count - 1 do
    begin
      col := qy.Fields[i].fieldname;
      result := result + ',' + col;
    end;
    result := result.Substring(1);
    ATable.CopyDataSet(qy);
  except
    on e: exception do
      Application.MessageBox(PChar('EXCEL文件有误' + e.Message), '提示',
        MB_OK + MB_ICONERROR);

  end;
  semc.Free;
end;

procedure TFrameImportHBC.LoadData(fileName: string);
var
  s: string;
begin
  Application.ProcessMessages;
  FDMemTable1.Close;
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('FDJH', ftString, 255, false);
  FDMemTable1.FieldDefs.Add('CLSBDH', ftString, 255, false);
  FDMemTable1.FieldDefs.Add('HPZL', ftString, 255, false);
  FDMemTable1.FieldDefs.Add('HPHM', ftString, 255, false);
  FDMemTable1.CreateDataSet();
  // s := TCommon.ImportExcel(fileName, self.FDMemTable1, 'status');
  s := ImportExcel(fileName, self.FDMemTable1);
  Application.ProcessMessages;
  TColumnGenerator.Instance.GenerateField(s, self.GridView);
end;

end.
