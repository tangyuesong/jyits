unit uFrameSignBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, dxCore,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxClasses, StdCtrls,
  ExtCtrls, dxNavBar, cxGroupBox, dxNavBarBase, dxNavBarCollns, cxTrackBar,
  cxLabel, dxGalleryControl, dxGallery, dxGDIPlusClasses, cxImage, dxGDIPlusAPI,
  dxRatingControl, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, dxSkinsdxNavBarPainter, dxCustomTileControl,
  dxSkinsdxNavBarAccordionViewPainter, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.Menus, System.ImageList, Vcl.ImgList,
  cxButtons,
  Vcl.ComCtrls, cxDateUtils, cxTextEdit, cxSpinEdit, cxTimeEdit, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxMemo, dxLayoutcxEditAdapters, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutControl, udm, dxLayoutLookAndFeels,
  cxSplitter, xtImage, dxSkinsdxBarPainter, dxBar, cxListView, dxFrame,
  dxDialogBase, uFrameSelectDev, uRequestItf, uJsonUtils, uColumnGenerator,
  uGlobal, uEntity,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uCommon, uDictionary,
  StrUtils, uVioThread,
  System.Generics.Collections, uFrameBz, hyieutils, iexBitmaps, hyiedefs,
  iesettings, iexRulers, System.Contnrs, imageenview, ieview, ievect,
  Vcl.Imaging.jpeg;

type
  TFrameSignBase = class(TFrame)
    dxLayoutControl1: TdxLayoutControl;
    ImageEnVect1: TImageEnVect;
    ImageEnView1: TImageEnView;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    edtBFQX: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    edtBKLX: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    edtCCDJRQ: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    edtCLPP: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    edtCLSBDH: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    edtCLXH: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    edtCSYS: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    edtFDJH: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    edtGCSJ: TcxTextEdit;
    dxLayoutItem14: TdxLayoutItem;
    edtHPHM: TcxTextEdit;
    dxLayoutItem15: TdxLayoutItem;
    edtHPZL: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    edtSBDDMC: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    edtSYR: TcxTextEdit;
    dxLayoutItem19: TdxLayoutItem;
    edtSYXZ: TcxTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    edtYXQX: TcxTextEdit;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    cboQSJG: TcxComboBox;
    cboSFLJ: TcxComboBox;
    edtCZDW: TcxComboBox;
    edtCZMJ: TcxComboBox;
    edtCZSJ: TcxTextEdit;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutSplitterItem3: TdxLayoutSplitterItem;
    btnSign: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem11: TdxLayoutItem;
    btnBack: TcxButton;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    procedure imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure cboQSJGPropertiesChange(Sender: TObject);
    procedure btnSignClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure edtCZDWPropertiesChange(Sender: TObject);
  private
    FDataTable: TFDMemTable;
    procedure NextAlarm;
    procedure SetFDataTable(const Value: TFDMemTable);
    function ShowAlarm: boolean;
    procedure SetAlarm(const Alarm: TAlarmResult);
    function CheckInput: boolean;
    function GetCZDWDM: string;
    function GetCZMJBH: string;
    function DoSign: boolean;
  public
    procedure AfterConstruction; override;
    property DataTable: TFDMemTable read FDataTable write SetFDataTable;
  end;

implementation

{$R *.dfm}

procedure TFrameSignBase.AfterConstruction;
begin
  inherited;

end;

procedure TFrameSignBase.SetFDataTable(const Value: TFDMemTable);
begin
  FDataTable := Value;
  ShowAlarm;
end;

function TFrameSignBase.ShowAlarm: boolean;
var
  alarm: TAlarmResult;
  picFile: string;
begin
  result := false;
  alarm := uJSONUtils.TJSONUtils.TableToRecord<TAlarmResult>(DataTable);
  SetAlarm(alarm);
  picFile :=  gSetup.DirSave + alarm.GCXH + '.jpg';
  if (alarm.VIOURL <> '') and TCommon.GetPic(alarm.VIOURL, '', picFile) then
  begin
    with ImageEnVect1 do
    begin
      IO.NativePixelFormat := True;
      IO.LoadFromFile(picFile);
      AutoFit := true;
      Select(0, 0, 0, 0, iespReplace);
      MouseInteract := [miSelect];
      SelectionOptions := [iesoMoveable, iesoCanScroll];
    end;
  end
  else
    ImageEnVect1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
end;

procedure TFrameSignBase.SetAlarm(const Alarm: TAlarmResult);
var
  key, czdw: string;
  veh: TVehinfo;
begin
  if TLZDictionary.gDicMain.ContainsKey('BKLX') and TLZDictionary.gDicMain['BKLX'].ContainsKey(Alarm.BKLX) then
    edtBKLX.Text := TLZDictionary.gDicMain['BKLX'][Alarm.BKLX];
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(Alarm.HPZL) then
    edtHPZL.Text := TLZDictionary.gDicMain['HPZL'][Alarm.HPZL];
  edtHPHM.Text := Alarm.HPHM;
  edtGCSJ.Text := Alarm.GCSJ;



  veh := TCommon.GetLocalVeh(alarm.HPHM, alarm.HPZL);
  edtCLPP.Text := veh.clpp1;
  edtCLXH.Text := veh.clxh;
  if TLZDictionary.gDicMain.ContainsKey('CSYS') and TLZDictionary.gDicMain['CSYS'].ContainsKey(veh.csys) then
    edtCSYS.Text := TLZDictionary.gDicMain['CSYS'][veh.csys]
  else
    edtCSYS.Text := '';
  edtCLSBDH.Text := veh.clsbdh;
  edtFDJH.Text := veh.fdjh;
  if veh.ccdjrq.IndexOf(' ') > 0 then
    edtCCDJRQ.Text := veh.ccdjrq.Substring(0, veh.ccdjrq.IndexOf(' '));
  if veh.yxqz.IndexOf(' ') > 0 then
    edtYXQX.Text := veh.yxqz.Substring(0, veh.yxqz.IndexOf(' '));
  if veh.qzbfqz.IndexOf(' ') > 0 then
    edtBFQX.Text := veh.qzbfqz.Substring(0, veh.qzbfqz.IndexOf(' '));
  if TLZDictionary.gDicMain.ContainsKey('SYXZ') and TLZDictionary.gDicMain['SYXZ'].ContainsKey(veh.syxz) then
    edtSYXZ.Text := TLZDictionary.gDicMain['SYXZ'][veh.syxz]
  else
    edtSYXZ.Text := '';
  edtSYR.Text := veh.syr;

  cboQSJG.ItemIndex := 0;
  cboSFLJ.ItemIndex := 1;

  edtCZDW.Properties.Items.Clear;
  if TLZDictionary.gDicDev[2].ContainsKey(Alarm.KDBH) then
  begin
    czdw := TLZDictionary.gDicDev[2][Alarm.KDBH].CZDW;
    edtSBDDMC.Text := TLZDictionary.gDicDev[2][Alarm.KDBH].SBDDMC;
    for key in czdw.Split([';']) do
    begin
      if TLZDictionary.gDicDept.ContainsKey(key) then
      begin
        edtCZDW.Properties.Items.Add(key + ':' + TLZDictionary.gDicDept[key].DWMC);
      end;
    end;
    edtCZDW.ItemIndex := edtCZDW.Properties.Items.Count - 1;
  end
  else begin
    edtCZDW.Text := '';
    edtSBDDMC.Text := Alarm.KDBH;
  end;

  edtCZSJ.Text := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
end;

procedure TFrameSignBase.NextAlarm;
begin
  with DataTable do
  begin
    Edit;
    FieldByName('QSBJ').AsString := '1';
    if FieldByName('QSBJ').AsString = '0' then
      cboSFLJ.ItemIndex := 1;
    FieldByName('SFCJ').AsString := copy(cboSFLJ.Text, 1, 1);

    if FieldByName('SFCJ').AsString = '0' then
      FieldByName('FEEDBACK').AsString := '已签收未出警'
    else
      FieldByName('FEEDBACK').AsString := '已签收';
    Post;

    Next;
    if not Eof then
      ShowAlarm
    else begin
      Application.MessageBox('全部签收完成。', '提示');
      self.Hide;
    end;
  end;
end;

procedure TFrameSignBase.btnBackClick(Sender: TObject);
begin
  self.Hide;
end;

procedure TFrameSignBase.btnSignClick(Sender: TObject);
begin
  if DoSign then
    NextAlarm;
end;

function TFrameSignBase.DoSign: boolean;
var
  params, r: string;
  alarm: TAlarmResult;
begin
  inherited;
  result := CheckInput;
  if result then
  begin
    alarm := uJSONUtils.TJSONUtils.TableToRecord<TAlarmResult>(DataTable);
    params := 'yjxh='+Alarm.GCXH + '&fkbj=0';
    r := TRequestItf.DbQuery('AddFeedback', params);
    if r = '1' then
    begin
      params := 'SYSTEMID=' + alarm.Systemid + '&QSBJ=1';
      params := params + '&qsjg='+copy(cboQSJG.Text, 1, 1);
      params := params + '&sfcj=' + copy(cboSFLJ.Text, 1, 1);
      if copy(cboSFLJ.Text, 1, 1) = '0' then
        params := params + '&Feedback=已签收未出警'
      else
        params := params + '&Feedback=已签收';
      params := params + '&qsbm=' + GetCZDWDM;
      params := params + '&qsr=' + GetCZMJBH;
      params := params + '&qssj=' + edtCZSJ.Text;

      TRequestItf.DbQuery('ModifyALARMRESULT',  params);
      result := true;
    end
    else begin
      Application.MessageBox('签收失败！', '提示');
    end;
  end;
end;

procedure TFrameSignBase.edtCZDWPropertiesChange(Sender: TObject);
var
  dw, yhbh: string;
  user: TUser;
begin
  edtCZMJ.Properties.Items.Clear;
  dw := GetCZDWDM;
  if TLZDictionary.gDicDept.ContainsKey(dw) then
  begin
    for yhbh in TLZDictionary.gDicUser.Keys do
    begin
      user := TLZDictionary.gDicUser[yhbh];
      if user.DWDM = dw then
      begin
        edtCZMJ.Properties.Items.Add(user.yhbh + ':' + user.YHXM);
      end;
    end;
    if gUser.DWDM = dw then
      edtCZMJ.Text := gUser.yhbh + ':' + gUser.YHXM
    else
      edtCZMJ.ItemIndex := 0;
  end
  else
    edtCZMJ.Text := '';
end;

function TFrameSignBase.GetCZDWDM: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZDW.Text).dm;
end;

function TFrameSignBase.GetCZMJBH: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZMJ.Text).mc;
end;

procedure TFrameSignBase.cboQSJGPropertiesChange(Sender: TObject);
begin
  cboSFLJ.Enabled := cboQSJG.ItemIndex = 0;
  if cboSFLJ.Enabled then
    cboSFLJ.ItemIndex := 1
  else
    cboSFLJ.ItemIndex := 0;
end;

procedure TFrameSignBase.imgviopicMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  rc: TRect;
begin
  rc.left := ImageEnVect1.XScr2Bmp(X-64);
  rc.Right := ImageEnVect1.XScr2Bmp(X + 64);
  rc.top := ImageEnVect1.YScr2Bmp(Y - 50);
  rc.Bottom := ImageEnVect1.YScr2Bmp(Y + 50);

  ImageEnView1.IEBitmap.Allocate(rc.Width, rc.Height, ImageEnVect1.IEBitmap.PixelFormat);
  ImageEnVect1.IEBitmap.CopyRectTo(ImageEnView1.IEBitmap, rc.left, rc.top, 0, 0, rc.Width, rc.Height);
  ImageEnView1.Update;
  ImageEnView1.Fit;
  ImageEnVect1.Paint;
end;

function TFrameSignBase.CheckInput: boolean;
begin
  result := false;
  if edtCZDW.Text = '' then
  begin
    Application.MessageBox('请输入签收单位', '提示');
    edtCZDW.SetFocus;
    exit;
  end;
  if edtCZDW.Text = '' then
  begin
    Application.MessageBox('请输入签收人姓名', '提示');
    edtCZMJ.SetFocus;
    exit;
  end;
  if edtCZSJ.Text = '' then
  begin
    Application.MessageBox('请输入签收时间', '提示');
    edtCZSJ.SetFocus;
    exit;
  end;
  result := true;
end;

end.
