unit uZBConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Generics.Collections,
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
  Udictionary, uEntity, uJsonUtils, uRequestItf, uCommon, uZBBCManage, uPaiBan,
  uFrameDeptTreeList, uGlobal, Vcl.ExtCtrls;

type
  TFrameZBConfig = class(TdxGridFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    cmbDwmc: TcxComboBox;
    dtStart: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    BtnAdd: TcxButton;
    BtnSearch: TcxButton;
    dxLayoutItem7: TdxLayoutItem;
    btnBcManage: TcxButton;
    SaveDialog1: TSaveDialog;
    dxLayoutItem5: TdxLayoutItem;
    dtEnd: TcxDateEdit;
    Timer1: TTimer;
    dxLayoutItem8: TdxLayoutItem;
    cboType: TcxComboBox;
    dxLayoutItem9: TdxLayoutItem;
    btnExport: TcxButton;
    procedure BtnSearchClick(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure cmbDwmcPropertiesPopup(Sender: TObject);
    procedure btnBcManageClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    FFrameDept: TFrameDeptTreeList;
    FramePaiBan: TFramePaiBan;
    FrameZBBCManage: TFrameZBBCManage;
    procedure HideDept;
    procedure InitType;
  public
    procedure AfterConstruction; override;
  end;

var
  FrameZBConfig: TFrameZBConfig;

implementation

{$R *.dfm}
{ TFrameZBConfig }

procedure TFrameZBConfig.AfterConstruction;
begin
  inherited;
  GridColumns := 'DWDM,BCDate,StartTime,EndTime,BCType,BCName,Address,FZR,YHXM,SJHM,操作';
  FDMemTable1.FieldDefs.Clear;
  FDMemTable1.FieldDefs.Add('systemid', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('DWDM', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('BCDate', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('StartTime', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('EndTime', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('BCType', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('BCName', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('FZR', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('YHBH', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('YHXM', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('SJHM', ftString, 4000, false);
  FDMemTable1.FieldDefs.Add('Address', ftString, 4000, false);
  dtStart.Date := trunc(now);
  dtEnd.Date := trunc(now);
  InitType;
end;

procedure TFrameZBConfig.InitType;
  type
    TQWType = record
      XH, TypeName: string;
    end;
var
  json: string;
  list: TList<TQWType>;
  item: TQWType;
begin
  json := TRequestItf.DbQuery('GetQWType');
  list := TJsonUtils.JsonToRecordList<TQWType>(json);
  cboType.Properties.Items.Clear;
  for item in list do
  begin
    cboType.Properties.Items.Add(item.TypeName);
  end;
end;

procedure TFrameZBConfig.BtnAddClick(Sender: TObject);
begin
  inherited;
  if Assigned(FFrameDept) and (FFrameDept.Selected.DWDM <> '') then
  begin
    if not Assigned(FramePaiBan) then
    begin
      FramePaiBan := TFramePaiBan.Create(self.Owner);
      FramePaiBan.Parent := self.Parent;
      FramePaiBan.Align := TAlign.alClient;
    end;
    FramePaiBan.Show;
    FramePaiBan.DWDM := FFrameDept.Selected.DWDM;
    FramePaiBan.InitType;
    FramePaiBan.FDMemTable1.Close;
    FramePaiBan.cboTypePropertiesChange(nil);
  end
  else
    Application.MessageBox('请选择单位', '提示', MB_OK);
end;

procedure TFrameZBConfig.btnBcManageClick(Sender: TObject);
begin
  inherited;
  if Assigned(FFrameDept) and (FFrameDept.Selected.DWDM <> '') then
  begin
    if not Assigned(FrameZBBCManage) then
    begin
      FrameZBBCManage := TFrameZBBCManage.Create(self.Owner);
      FrameZBBCManage.Parent := self.Parent;
      FrameZBBCManage.Align := TAlign.alClient;
    end;
    FrameZBBCManage.Show;
    FrameZBBCManage.DWDM := FFrameDept.Selected.DWDM;
    FrameZBBCManage.BtnSearchClick(nil);
  end
  else
    Application.MessageBox('请选择单位', '提示', MB_OK);
end;

procedure TFrameZBConfig.btnExportClick(Sender: TObject);
begin
  inherited;
  if dlgSave.Execute then
  begin
    TCommon.ExportGridtoData(ExtractFileExt(dlgSave.FileName),
      dlgSave.FileName, cxGrid1);
    Application.MessageBox('导出成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
end;

procedure TFrameZBConfig.acteditExecute(Sender: TObject);
begin
  inherited;
  //ShowZBEdit(FDMemTable1.FieldByName('Systemid').AsString);
end;

procedure TFrameZBConfig.actdeleteExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('确定要删除这条排班记录？', '提示', mb_YesNo) = mrYes then
  begin
    TRequestItf.DbQuery('DelPaiBan',
      'Systemid=' + FDMemTable1.FieldByName('systemid').AsString);
    LoadData;
  end;
end;

procedure TFrameZBConfig.BtnSearchClick(Sender: TObject);
var
  s, json: String;
begin
  inherited;
  if Assigned(FFrameDept) and (FFrameDept.Selected.DWDM <> '') then
  begin
    ShowFrameWait;
    s := 'dwdm=' + FFrameDept.Selected.DWDM +
      '&begin_StartTime=' + FormatDateTime('yyyy/mm/dd', dtStart.Date) +
      '&end_StartTime=' + FormatDateTime('yyyy/mm/dd', dtEnd.Date + 1);
    if cboType.Text <> '' then
      s := s + '&BCType=' + cboType.Text;
    s := s + '&orderby=BCType,StartTime';
    json := TRequestItf.DbQuery('GetPaiBan', s);
    TJsonUtils.JSONToDataSet(json, FDMemTable1, '', false);
    with FDMemTable1 do
    begin
      if Active then
      begin
        First;
        while not Eof do
        begin
          Edit;
          s := FieldByName('StartTime').AsString;
          FieldByName('BCDate').AsString := s.Substring(0, 10);
          FieldByName('StartTime').AsString := s.Substring(11, 5);
          s := FieldByName('EndTime').AsString;
          FieldByName('EndTime').AsString := s.Substring(11, 5);
          Post;
          Next;
        end;
        First;
      end;
    end;

    FreeFrameWait;
  end
  else
    Application.MessageBox('请选择单位', '提示', MB_OK);
end;

procedure TFrameZBConfig.cmbDwmcPropertiesPopup(Sender: TObject);
begin
  inherited;
  FFrameDept.Show;
end;

procedure TFrameZBConfig.HideDept;
begin
  FFrameDept.Hide;
  self.cmbDwmc.Text := FFrameDept.Selected.DWMC;
end;

procedure TFrameZBConfig.Timer1Timer(Sender: TObject);
var
  dept: TDept;
begin
  inherited;
  Timer1.Enabled := false;
  FFrameDept := TFrameDeptTreeList.Create(self.Owner);
  FFrameDept.Parent := self.Parent;
  FFrameDept.Top := 20;
  FFrameDept.Left := (self.Parent.Width - FFrameDept.Width) div 2;
  FFrameDept.OnClose := HideDept;
  dept.DWDM := gUser.DWDM;
  FFrameDept.Selected := dept;
  self.cmbDwmc.Text := FFrameDept.Selected.DWMC;

  BtnSearchClick(nil);
end;

end.
