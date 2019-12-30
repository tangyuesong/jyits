unit uDialogZBImport;

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
  dxLayoutControl, uCommon, uColumnGenerator, Udictionary, uGlobal, uRequestItf;

type
  TDialogZBImport = class(TdxImportDialog)
  private
    function CheckData: boolean;
  public
    procedure LoadData(filename: string); override;
    function DoImport: boolean; override;
  end;

var
  DialogZBImport: TDialogZBImport;

implementation

{$R *.dfm}
{ TDialogZBImport }

function TDialogZBImport.CheckData: boolean;
begin
  result := false;
  if not FDMemTable1.Active then
    exit;
  if (FDMemTable1.FieldByName('DATE') = nil) or
    (FDMemTable1.FieldByName('DWDM') = nil) or
    (FDMemTable1.FieldByName('PERSON') = nil) or
    (FDMemTable1.FieldByName('TIME') = nil) or
    (FDMemTable1.FieldByName('TYPE') = nil) then
  begin
    Application.MessageBox('导入格式有误, 必须包含列：DWDM,DATE,TIME,TYPE,PERSON', '提示');
    exit;
  end;
  result := true;
end;

function TDialogZBImport.DoImport: boolean;
var
  dwdm, date, time, lx, person: String;
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
    FDMemTable1.First;
    while not FDMemTable1.Eof do
    begin
      dwdm := FDMemTable1.FieldByName('dwdm').AsString;
      date := FDMemTable1.FieldByName('date').AsString;
      time := FDMemTable1.FieldByName('time').AsString;
      lx := FDMemTable1.FieldByName('type').AsString;
      person := FDMemTable1.FieldByName('person').AsString;
      if (dwdm = '') or (date = '') or (person = '') then
      begin
        FDMemTable1.Edit;
        FDMemTable1.FieldByName('status').Value := 'DWDM,DATE,PERSON为空';
        FDMemTable1.Post;
        haveError := true;
      end
      else if not TLZDictionary.gDicDept.ContainsKey(dwdm) then
      begin
        FDMemTable1.Edit;
        FDMemTable1.FieldByName('status').Value := 'DWDM有误';
        FDMemTable1.Post;
        haveError := true;
      end
      else
      begin
        json := 'date=' + date + '&dwdm=' + dwdm + '&time=' + time + '&type=' +
          lx + '&person=' + person + '&yhbh=' + gUser.yhbh;

        json := TRequestItf.DbQuery('AddZBList', json);
        if json = '1' then
        begin
          FDMemTable1.Edit;
          FDMemTable1.FieldByName('status').Value := '导入成功';
          FDMemTable1.Post;
        end
        else
        begin
          FDMemTable1.Edit;
          FDMemTable1.FieldByName('status').Value := '导入失败';
          FDMemTable1.Post;
        end;
      end;
      FDMemTable1.Next;
      Application.ProcessMessages;
    end;
    if haveError then
      Application.MessageBox('导入完成，错误信息请查看状态列', '提示')
    else
      Application.MessageBox('导入成功', '提示')
  finally
    btnBrower.Enabled := true;
    btnSave.Enabled := true;
    btnExit.Enabled := true;
  end;
end;

procedure TDialogZBImport.LoadData(filename: string);
var
  s: string;
begin
  Application.ProcessMessages;
  s := TCommon.ImportExcel(filename, self.FDMemTable1, 'status');
  Application.ProcessMessages;
  TColumnGenerator.Instance.GenerateField(s, self.GridView);
end;

end.
