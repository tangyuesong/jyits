unit uFrameAlarmVehImport;

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
  dxLayoutControl;

type
  TFrameAlarmVehImport = class(TdxImportDialog)
  private
    function CheckData: boolean;
  protected
    procedure LoadData(filename: string); override;
    function DoImport: boolean; override;
  public

  end;

var
  FrameAlarmVehImport: TFrameAlarmVehImport;

implementation

uses
  uCommon, uEntity, uGlobal, uJSONUtils, uRequestItf, uColumnGenerator;
{$R *.dfm}
{ TFrameAlarmVehImport }

function TFrameAlarmVehImport.CheckData: boolean;
begin
  result := false;
  if not FDMemTable1.Active then
    exit;
  if (FDMemTable1.FieldByName('HPHM') = nil) or
    (FDMemTable1.FieldByName('HPZL') = nil) or
    (FDMemTable1.FieldByName('CLPP') = nil) or
    (FDMemTable1.FieldByName('CLLX') = nil) or
    (FDMemTable1.FieldByName('CSYS') = nil) or
    (FDMemTable1.FieldByName('BKLX') = nil) then
  begin
    Application.MessageBox('导入格式有误, 必须包含列：HPHM,HPZL,CLPP,CLLX,CSYS,BKLX', '提示');
    exit;
  end;
  result := true;
end;

function TFrameAlarmVehImport.DoImport: boolean;
var
  item: TBKCJResult;
  json: string;
  haveError: boolean;
begin
  result := false;
  if not CheckData then
    exit;
  btnBrower.Enabled := false;
  btnSave.Enabled := false;
  btnExit.Enabled := false;
  haveError := false;
  try
    FDMemTable1.DisableControls;
    FDMemTable1.First;
    while not FDMemTable1.Eof do
    begin
      item.BKXH := FormatDateTime('yyyymmddhhmmsszzz', Now);
      item.HPHM := FDMemTable1.FieldByName('HPHM').AsString;
      item.HPZL := FDMemTable1.FieldByName('HPZL').AsString;
      if item.HPZL.Length = 1 then
        item.HPZL := '0' + item.HPZL;
      item.CLPP := FDMemTable1.FieldByName('CLPP').AsString;
      item.CLLX := FDMemTable1.FieldByName('CLLX').AsString;
      item.CSYS := FDMemTable1.FieldByName('CSYS').AsString;
      item.BKLX := FDMemTable1.FieldByName('BKLX').AsString;
      item.BKZL := '1';
      item.CJJG := gUser.DWDM;
      item.BKR := gUser.YHBH;
      item.ZT := '0';
      if FDMemTable1.FieldByName('SJHM') <> nil then
      begin
        item.SJHM := FDMemTable1.FieldByName('SJHM').AsString;
        item.SJHM := item.SJHM.Replace(',', ';');
        item.SMSTimeBegin := '0800';
        item.SMSTimeEnd := '2200';
      end
      else
        item.SJHM := '';
      if FDMemTable1.FieldByName('BZ') <> nil then
        item.BZ := FDMemTable1.FieldByName('BZ').AsString
      else
        item.BZ := '';

      item.UploadStatus := '0';
      if FDMemTable1.FieldByName('LOCAL') <> nil then
      begin
        if FDMemTable1.FieldByName('LOCAL').AsString = '1' then
          item.UploadStatus := '2'
      end;

      json := TJSONUtils.RecordToString<TBKCJResult>(@item);
      json := TRequestItf.DbQuery('AddT_KK_Alarm', json);
      FDMemTable1.Edit;
      FDMemTable1.FieldByName('status').Value := '导入成功';
      FDMemTable1.Post;

      FDMemTable1.Next;
      Application.ProcessMessages;
    end;
    FDMemTable1.EnableControls;
  finally
    btnBrower.Enabled := true;
    btnSave.Enabled := true;
    btnExit.Enabled := true;
  end;
  if haveError then
    Application.MessageBox('导入完成，错误信息请查看状态列', '提示')
  else
  begin
    result := true;
    Application.MessageBox('导入成功', '提示');
  end;
end;

procedure TFrameAlarmVehImport.LoadData(filename: string);
var
  s: string;
begin
  Application.ProcessMessages;
  s := TCommon.ImportExcel(filename, self.FDMemTable1, 'status');
  Application.ProcessMessages;
  TColumnGenerator.Instance.GenerateField(s, self.GridView);
end;

end.
