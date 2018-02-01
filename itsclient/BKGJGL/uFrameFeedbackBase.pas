unit uFrameFeedbackBase;

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
  cxButtons, DateUtils,
  Vcl.ComCtrls, cxDateUtils, cxTextEdit, cxSpinEdit, cxTimeEdit, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxMemo, dxLayoutcxEditAdapters, dxLayoutContainer,
  dxLayoutControlAdapters, dxLayoutControl, udm, dxLayoutLookAndFeels,
  cxSplitter, xtImage, dxSkinsdxBarPainter, dxBar, cxListView, dxFrame,
  dxDialogBase, uFrameSelectDev, uRequestItf, uJsonUtils, uColumnGenerator,
  uGlobal, uFrameSign, uFrameFeedback, uEntity,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uCommon, uDictionary,
  StrUtils, uVioThread,
  System.Generics.Collections, uFrameBz, hyieutils, iexBitmaps, hyiedefs,
  iesettings, iexRulers, System.Contnrs, imageenview, ieview, ievect,
  Vcl.Imaging.jpeg, cxCheckBox, cxCheckComboBox;

type
  TFrameFeedbackBase = class(TFrame)
    dxLayoutControl1: TdxLayoutControl;
    ImageEnVect1: TImageEnVect;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    dxLayoutItem5: TdxLayoutItem;
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
    edtCZDW: TcxComboBox;
    edtCZMJ: TcxComboBox;
    edtCZSJ: TcxTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutSplitterItem3: TdxLayoutSplitterItem;
    btnFeedback: TcxButton;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem11: TdxLayoutItem;
    btnBack: TcxButton;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    cboLJJG: TcxComboBox;
    cboLJYY: TcxComboBox;
    cboXYC: TcxComboBox;
    cboWCHYY: TcxComboBox;
    cboCZJG: TcxCheckComboBox;
    cboWSLB: TcxComboBox;
    edtWSBH: TcxTextEdit;
    edtJYW: TcxTextEdit;
    edtYJBM: TcxTextEdit;
    edtLXR: TcxTextEdit;
    edtLXDH: TcxTextEdit;
    liCZJG: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    liLJYY: TdxLayoutItem;
    liWCHYY: TdxLayoutItem;
    liWSLB: TdxLayoutItem;
    liXYC: TdxLayoutItem;
    liJYW: TdxLayoutItem;
    liLXDH: TdxLayoutItem;
    liLXR: TdxLayoutItem;
    liWSBH: TdxLayoutItem;
    liYJBM: TdxLayoutItem;
    lgWS: TdxLayoutGroup;
    lgYJ: TdxLayoutGroup;
    procedure btnFeedbackClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure edtCZDWPropertiesChange(Sender: TObject);
    procedure cboLJJGPropertiesChange(Sender: TObject);
    procedure edtWSBHExit(Sender: TObject);
  private
    FDataTable: TFDMemTable;
    procedure NextAlarm;
    procedure SetFDataTable(const Value: TFDMemTable);
    function ShowAlarm: boolean;
    procedure SetAlarm(const Alarm: TAlarmResult);
    function CheckInput: boolean;
    function GetCZDWDM: string;
    function GetCZMJBH: string;
    function DoFeedback: boolean;
    function GetCZJG: string;
    procedure BindCZJG(bklx: string);
    function DoSign(Alarm: TAlarmResult): boolean;
    function GetJKBJ(pzbh: string): string;
    function WSExists(pzbh: string): boolean;
    procedure SetCLJG(cljg: string);
  public
    procedure AfterConstruction; override;
    procedure SetFeedbackInfo(wslb, wsbh, czdw, czsj: string);
    property DataTable: TFDMemTable read FDataTable write SetFDataTable;
  end;

implementation

{$R *.dfm}

procedure TFrameFeedbackBase.AfterConstruction;
begin
  inherited;

end;

procedure TFrameFeedbackBase.SetFDataTable(const Value: TFDMemTable);
begin
  FDataTable := Value;
  ShowAlarm;
end;

function TFrameFeedbackBase.ShowAlarm: boolean;
var
  Alarm: TAlarmResult;
  picFile: string;
begin
  result := false;
  Alarm := uJsonUtils.TJSONUtils.TableToRecord<TAlarmResult>(DataTable);
  SetAlarm(Alarm);

  // if DataTable.Fields.FieldByName('CZSJ') <> nil then
  if DataTable.FieldDefs.IndexOf('WSBH') >= 0 then
  begin
    SetFeedbackInfo(DataTable.FieldByName('WSLB').AsString,
      DataTable.FieldByName('WSBH').AsString, DataTable.FieldByName('DWDM')
      .AsString, DataTable.FieldByName('CZSJ').AsString);
  end;
  if (DataTable.FieldDefs.IndexOf('CLJG') >= 0) and
    (DataTable.FieldByName('CLJG').AsString <> '') then
  begin
    SetCLJG(DataTable.FieldByName('CLJG').AsString);
  end;
  picFile := gSetup.DirSave + Alarm.GCXH + '.jpg';
  if (Alarm.VIOURL <> '') and TCommon.GetPic(Alarm.VIOURL, '', picFile) then
  begin
    with ImageEnVect1 do
    begin
      IO.NativePixelFormat := True;
      IO.LoadFromFile(picFile);
      AutoFit := True;
      Select(0, 0, 0, 0, iespReplace);
      MouseInteract := [miSelect];
      SelectionOptions := [iesoMoveable, iesoCanScroll];
    end;
  end
  else
    ImageEnVect1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'image\ZWTP.png');
end;

procedure TFrameFeedbackBase.SetAlarm(const Alarm: TAlarmResult);
var
  key, czdw: string;
  veh: TVehinfo;
begin
  if TLZDictionary.gDicMain.ContainsKey('BKLX') and TLZDictionary.gDicMain
    ['BKLX'].ContainsKey(Alarm.bklx) then
    edtBKLX.Text := TLZDictionary.gDicMain['BKLX'][Alarm.bklx];
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(Alarm.HPZL) then
    edtHPZL.Text := TLZDictionary.gDicMain['HPZL'][Alarm.HPZL];
  edtHPHM.Text := Alarm.HPHM;
  edtGCSJ.Text := Alarm.GCSJ;
  veh := TCommon.GetVehInfo(Alarm.HPHM, Alarm.HPZL, '');
  edtCLPP.Text := veh.clpp1;
  edtCLXH.Text := veh.clxh;
  if TLZDictionary.gDicMain.ContainsKey('CSYS') and TLZDictionary.gDicMain
    ['CSYS'].ContainsKey(veh.csys) then
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
  if TLZDictionary.gDicMain.ContainsKey('SYXZ') and TLZDictionary.gDicMain
    ['SYXZ'].ContainsKey(veh.syxz) then
    edtSYXZ.Text := TLZDictionary.gDicMain['SYXZ'][veh.syxz]
  else
    edtSYXZ.Text := '';
  edtSYR.Text := veh.syr;

  edtCZDW.Properties.Items.Clear;
  if TLZDictionary.gDicDev[2].ContainsKey(Alarm.KDBH) then
  begin
    czdw := TLZDictionary.gDicDev[2][Alarm.KDBH].czdw;
    edtSBDDMC.Text := TLZDictionary.gDicDev[2][Alarm.KDBH].SBDDMC;
    for key in czdw.Split([';']) do
    begin
      if TLZDictionary.gDicDept.ContainsKey(key) then
      begin
        edtCZDW.Properties.Items.Add(key + ':' + TLZDictionary.gDicDept
          [key].DWMC);
      end;
    end;
    edtCZDW.ItemIndex := edtCZDW.Properties.Items.Count - 1;
  end
  else
  begin
    edtCZDW.Text := '';
    edtSBDDMC.Text := '';
  end;
  edtCZSJ.Text := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);

  cboLJJG.ItemIndex := 1;
  cboXYC.ItemIndex := 1;
  cboWSLB.ItemIndex := 0;
  BindCZJG(Alarm.bklx);
end;

procedure TFrameFeedbackBase.BindCZJG(bklx: string);
  procedure AddCZJGItem(code, desc: string);
  begin
    with cboCZJG.Properties.Items.Add do
    begin
      Description := desc;
      ShortDescription := code + ' ' + desc;
    end;
  end;

begin
  cboCZJG.Properties.Items.Clear;
  if '02 03 08'.Contains(bklx) then
  begin
    AddCZJGItem('5', '扣留机动车');
    AddCZJGItem('2', '现场开具处罚文书');
    AddCZJGItem('3', '移交其他部门');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if bklx = '04' then
  begin
    AddCZJGItem('5', '扣留机动车');
    AddCZJGItem('2', '现场开具处罚文书');
    AddCZJGItem('6', '已处罚');
    AddCZJGItem('8', '教育告知后放行');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if bklx = '05' then
  begin
    AddCZJGItem('5', '扣留机动车');
    AddCZJGItem('2', '现场开具处罚文书');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if bklx = '06' then
  begin
    AddCZJGItem('2', '现场开具处罚文书');
    AddCZJGItem('4', '当事人接受处理');
    AddCZJGItem('7', '当事人拒绝处理');
    AddCZJGItem('8', '教育告知后放行');
    cboCZJG.States[0] := cbsChecked;
  end
  else if bklx = '07' then
  begin
    AddCZJGItem('2', '现场开具处罚文书');
    AddCZJGItem('7', '当事人拒绝处理');
    AddCZJGItem('8', '教育告知后放行');
    cboCZJG.States[0] := cbsChecked;
  end
  else if '01 21 22 23 24 25'.Contains(bklx) then
  begin
    AddCZJGItem('5', '扣留机动车');
    AddCZJGItem('2', '现场开具处罚文书');
    AddCZJGItem('3', '移交其他部门');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if '31 32'.Contains(bklx) then
  begin
    AddCZJGItem('5', '扣留机动车');
    AddCZJGItem('2', '现场开具处罚文书');
    AddCZJGItem('3', '移交其他部门');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if '09 33 35 34 36 37 38 43'.Contains(bklx) then
  begin
    AddCZJGItem('5', '扣留机动车');
    AddCZJGItem('2', '现场开具处罚文书');
    AddCZJGItem('8', '教育告知后放行');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else // if BKLX = '39 99' then
  begin
    AddCZJGItem('5', '扣留机动车');
    AddCZJGItem('2', '现场开具处罚文书');
    AddCZJGItem('3', '移交其他部门');
    AddCZJGItem('8', '教育告知后放行');
    cboCZJG.States[3] := cbsChecked;
  end;
end;

procedure TFrameFeedbackBase.NextAlarm;
begin
  with DataTable do
  begin
    Edit;
    FieldByName('FEEDBACK').AsString := '已反馈';
    Post;
    Next;

    while (not EOF) and (FieldByName('FEEDBACK').AsString = '已反馈') do
    begin
      Next;
    end;

    if not EOF then
    begin
      ShowAlarm;
    end
    else
    begin
      Application.MessageBox('全部反馈完成。', '提示');
      self.Hide;
    end;
  end;
end;

procedure TFrameFeedbackBase.btnBackClick(Sender: TObject);
begin
  self.Hide;
end;

procedure TFrameFeedbackBase.btnFeedbackClick(Sender: TObject);
begin
  if DoFeedback then
    NextAlarm;
end;

procedure TFrameFeedbackBase.cboLJJGPropertiesChange(Sender: TObject);
var
  czjg: string;
begin
  liLJYY.Visible := cboLJJG.ItemIndex = 0; // 拦截车辆情况：0 未拦截到
  liXYC.Visible := cboLJJG.ItemIndex = 1; // 拦截车辆情况：1 已拦截到
  liCZJG.Visible := liXYC.Visible and (cboXYC.ItemIndex = 1); // 是否嫌疑车辆：1 是
  liWCHYY.Visible := liXYC.Visible and (cboXYC.ItemIndex = 0); // 是否嫌疑车辆：0 否

  czjg := cboCZJG.Text;
  lgWS.Visible := liCZJG.Visible and (czjg.Contains('2') or czjg.Contains('6'));
  // 处置结果：2 现场开具处罚文书
  if lgWS.Visible then
  begin
    cboWSLB.ItemIndex := 0;
    if czjg.Contains('5') then
      cboWSLB.ItemIndex := 1;
  end;

  lgYJ.Visible := liCZJG.Visible and (czjg.Contains('3')); // 处置结果：3 移交其他部门
end;

function TFrameFeedbackBase.DoFeedback: boolean;
var
  params, s, czjg, systemid: string;
  Alarm: TAlarmResult;
begin
  inherited;
  result := false;

  if not CheckInput then
    exit;

  Alarm := uJsonUtils.TJSONUtils.TableToRecord<TAlarmResult>(DataTable);
  if (Alarm.QSBJ = '0') or (Alarm.QSBJ = '') or (Alarm.Feedback = '已反馈') then
  begin
    DoSign(Alarm);
  end;

  s := TRequestItf.DbQuery('GetFeedback', 'yjxh=' + Alarm.GCXH);
  s := s.Substring(s.IndexOf('SYSTEMID":"') + 11);
  systemid := s.Substring(0, s.IndexOf('"'));
  params := 'systemid=' + systemid + '&fkbj=1';
  params := params + '&ljclqk=' + copy(cboLJJG.Text, 1, 1);
  if liLJYY.Visible then
    params := params + '&wljdyy=' + copy(cboLJYY.Text, 1, 2);
  if liXYC.Visible then
    params := params + '&chjg=' + copy(cboXYC.Text, 1, 1);
  if liCZJG.Visible then
  begin
    czjg := GetCZJG();
    params := params + '&cljg=' + czjg;
  end;
  if lgWS.Visible then
  begin
    params := params + '&wslb=' + copy(cboWSLB.Text, 1, 1) + '&wsbh=' +
      edtWSBH.Text + '&jyw=' + edtJYW.Text;
  end;
  if lgYJ.Visible then
  begin
    params := params + '&yjbm=' + edtYJBM.Text + '&lxr=' + edtLXR.Text +
      '&lxdh=' + edtLXDH.Text;
  end;
  if liWCHYY.Visible then
    params := params + '&wchyy=' + copy(cboWCHYY.Text, 1, 2);
  params := params + '&czdw=' + GetCZDWDM;
  params := params + '&czr=' + GetCZMJBH;
  params := params + '&czsj=' + edtCZSJ.Text;
  params := params + '&YHBH=' + gUser.yhbh;
  params := params + '&upload=0';
  s := TRequestItf.DbQuery('ModifyFeedback', params);
  if s = '1' then
  begin
    params := 'SYSTEMID=' + Alarm.systemid;
    params := params + '&Feedback=已反馈';
    TRequestItf.DbQuery('ModifyALARMRESULT', params);
    result := True;
  end
  else
    Application.MessageBox('反馈失败！', '提示');
end;

function TFrameFeedbackBase.DoSign(Alarm: TAlarmResult): boolean;
var
  params, r: string;
begin
  params := 'yjxh=' + Alarm.GCXH + '&fkbj=0';
  if (Alarm.QSBJ = '0') or (Alarm.QSBJ = '') then
    r := TRequestItf.DbQuery('AddFeedback', params)
  else
    r := '1';

  if r = '1' then
  begin
    params := 'SYSTEMID=' + Alarm.systemid + '&QSBJ=1&qsjg=1&sfcj=1&upload=0';
    params := params + '&qsbm=' + GetCZDWDM;
    params := params + '&qsr=' + GetCZMJBH;
    params := params + '&qssj=' + edtCZSJ.Text;

    TRequestItf.DbQuery('ModifyALARMRESULT', params);
    result := True;
  end
  else
  begin
    Application.MessageBox('反馈失败！', '提示');
  end;
end;

procedure TFrameFeedbackBase.edtCZDWPropertiesChange(Sender: TObject);
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

procedure TFrameFeedbackBase.edtWSBHExit(Sender: TObject);
begin
  edtJYW.Text := TCommon.GetJYW(edtWSBH.Text);
end;

function TFrameFeedbackBase.GetCZDWDM: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZDW.Text).dm;
end;

function TFrameFeedbackBase.GetCZMJBH: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZMJ.Text).mc;
end;

function TFrameFeedbackBase.GetCZJG: string;
var
  s: string;
begin
  s := cboCZJG.Text;
  result := '';
  for s in s.Split([';']) do
    result := result + s.Substring(0, 1);
end;

function TFrameFeedbackBase.CheckInput: boolean;
var
  czjg: string;
  Alarm: TAlarmResult;
  GCSJ, czsj: double;
begin
  result := false;
  Alarm := uJsonUtils.TJSONUtils.TableToRecord<TAlarmResult>(DataTable);
  if liCZJG.Visible and (cboCZJG.Text = 'None selected') then
  begin
    Application.MessageBox('请选择处置结果', '提示');
    cboCZJG.SetFocus;
    exit;
  end;

  if lgWS.Visible and (edtWSBH.Text = '') then
  begin
    Application.MessageBox('请输入文书编号', '提示');
    edtWSBH.SetFocus;
    exit;
  end;

  if lgWS.Visible and (edtJYW.Text = '') then
  begin
    Application.MessageBox('请输入文书校验位', '提示');
    edtWSBH.SetFocus;
    exit;
  end;

  if lgYJ.Visible and (edtYJBM.Text = '') then
  begin
    Application.MessageBox('请输入移交部门', '提示');
    edtYJBM.SetFocus;
    exit;
  end;
  if lgYJ.Visible and (edtLXR.Text = '') then
  begin
    Application.MessageBox('请输入联系人', '提示');
    edtLXR.SetFocus;
    exit;
  end;
  if lgYJ.Visible and (edtLXDH.Text = '') then
  begin
    Application.MessageBox('请输入联系电话', '提示');
    edtLXDH.SetFocus;
    exit;
  end;

  if edtCZDW.Text = '' then
  begin
    Application.MessageBox('请输入处置单位', '提示');
    edtCZDW.SetFocus;
    exit;
  end;
  if edtCZDW.Text = '' then
  begin
    Application.MessageBox('请输入处置民警姓名', '提示');
    edtCZMJ.SetFocus;
    exit;
  end;
  if edtCZSJ.Text = '' then
  begin
    Application.MessageBox('请输入处置时间', '提示');
    edtCZSJ.SetFocus;
    exit;
  end;
  GCSJ := VarToDateTime(edtGCSJ.Text);
  czsj := VarToDateTime(edtCZSJ.Text);
  if czsj < GCSJ then
  begin
    Application.MessageBox('处置时间不能小于预警时间', '提示');
    edtCZSJ.SetFocus;
    exit;
  end;

  if liCZJG.Visible then
  begin
    czjg := GetCZJG;
    if '02 03 05 08 01 21 22 23 24 25'.Contains(Alarm.bklx) then
    begin
      if not(czjg.Contains('5') and czjg.Contains('2')) then
      begin
        Application.MessageBox('处置结果必须选择 5:扣留机动车 和 2:现场开具处罚文书', '提示');
        cboCZJG.SetFocus;
        exit;
      end;
    end
    else if '06 07'.Contains(Alarm.bklx) then
    begin
      if czjg.Length <> 1 then
      begin
        Application.MessageBox('处置结果必须单选一个', '提示');
        cboCZJG.SetFocus;
        exit;
      end;
    end
    else if Alarm.bklx = '01 21 22 23 24 25' then
    begin
      if not(czjg.Contains('5') and (czjg.Contains('2') or czjg.Contains('3')))
      then
      begin
        Application.MessageBox
          ('处置结果必须选择 5:扣留机动车，并且 2:现场开具处罚文书、3:移交其他部门 至少要选一个', '提示');
        cboCZJG.SetFocus;
        exit;
      end;
    end
    else if czjg.Contains('5') and (not czjg.Contains('2')) then
    begin
      Application.MessageBox('处置结果选择了 5:扣留机动车，就必须选择 2:现场开具处罚文书', '提示');
      cboCZJG.SetFocus;
      exit;
    end;
    if (czjg.Contains('8') or czjg.Contains('6')) and (czjg.Length > 1) then
    // 如果选择了 8:教育告知后放行，则不能选其他
    begin
      Application.MessageBox('处置结果 6:已处罚 和 8:教育告知后放行 只能单选', '提示');
      cboCZJG.SetFocus;
      exit;
    end;

    if czjg.Contains('5') and czjg.Contains('2') and (cboWSLB.ItemIndex <> 1)
    then
    begin
      Application.MessageBox
        ('处置结果选择了 5:扣留机动车 和 2:现场开具处罚文书，文书类别必须是 3:强制措施凭证', '提示');
      cboCZJG.SetFocus;
      exit;
    end;

    if czjg.Contains('2') and (czsj - GCSJ > 60 * OneMinute) then
    begin
      Application.MessageBox('现场开具处罚文书，处置时间与预警时间不能超过一小时', '提示');
      cboCZJG.SetFocus;
      exit;
    end;

    if lgWS.Visible then
    begin
      if not WSExists(edtWSBH.Text) then
      begin
        Application.MessageBox('文书编号不存在！', '提示');
        edtWSBH.SetFocus;
        exit;
      end;
      if czjg.Contains('4') then // 5. 已处罚必须已缴款(调接口)
      begin
        if GetJKBJ(edtWSBH.Text) <> '1' then
        begin
          Application.MessageBox('已处罚必须已缴款', '提示');
          exit;
        end;
      end;
    end;

  end;
  result := True;
end;

function TFrameFeedbackBase.WSExists(pzbh: string): boolean; // 文书编号是否存在
begin
  // TODO: 文书编号是否存在
  result := True;
end;

function TFrameFeedbackBase.GetJKBJ(pzbh: string): string;
var
  s: string;
begin
  // TODO: 缴款标记
  result := '1';
  // s := TRequestItf.RmQuery('Query', 'jkbh=04C02&pzbh='+pzbh);
  if s <> '' then
  begin
    // s :=
  end;
end;

procedure TFrameFeedbackBase.SetCLJG(cljg: string);
var
  i: integer;
  s: string;
begin
  for i := 0 to cboCZJG.Properties.Items.Count - 1 do
  begin
    s := cboCZJG.Properties.Items[i].Description;
    if s.Contains(cljg) then
      cboCZJG.States[i] := cbsChecked
    else
      cboCZJG.States[i] := cbsUnchecked;
  end;
end;

procedure TFrameFeedbackBase.SetFeedbackInfo(wslb, wsbh, czdw, czsj: string);
var
  GCSJ, wfsj: double;
  czjg, s: string;
  i: integer;
begin
  edtCZDW.Text := czdw;
  for i := 0 to edtCZDW.Properties.Items.Count - 1 do
  begin
    if edtCZDW.Properties.Items[i].Contains(czjg) then
      edtCZDW.ItemIndex := i;
  end;

  edtCZSJ.Text := czsj;
  if liCZJG.Visible then
  begin
    czjg := GetCZJG;
    if czjg.Contains('2') then
    begin
      GCSJ := VarToDateTime(edtGCSJ.Text);
      wfsj := VarToDateTime(edtCZSJ.Text);
      if wfsj - GCSJ > 60 * OneMinute then
      begin
        for i := 0 to cboCZJG.Properties.Items.Count - 1 do
        begin
          s := cboCZJG.Properties.Items[i].ShortDescription;
          if s.Contains('2') or s.Contains('5') then
            cboCZJG.States[i] := cbsUnchecked
          else if s.Contains('6') or s.Contains('4') then
            cboCZJG.States[i] := cbsChecked;
        end;
      end;
    end;
  end;

  for i := 0 to cboWSLB.Properties.Items.Count - 1 do
  begin
    if cboWSLB.Properties.Items[i].Contains(wslb) then
      cboWSLB.ItemIndex := i;
  end;
  edtWSBH.Text := wsbh;
  edtWSBHExit(nil);
end;

end.
