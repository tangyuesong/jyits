unit UFrameDeviceEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutControlAdapters, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, dxLayoutContainer, cxClasses, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, cxCheckBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cefvcl,
  uJsonUtils, uEntity, uCommon, uRequestItf, uGlobal, cef.JsExtented,
  LatLngHelper, Vcl.ExtCtrls, Udictionary;

type
  Tclose = procedure of object;

  Tok = procedure(value: TDevice) of object;

type
  TFrameDeviceEdit = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    Btn1: TcxButton;
    dxLayoutItem2: TdxLayoutItem;
    BtnSave: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    BtnExit: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    EdtSbbh: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    EdtJCBKBABH: TcxCombobox;
    dxLayoutItem7: TdxLayoutItem;
    EdtJCPTBABH: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    EdtLHY_SBBH: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    EdtLKBH: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    EdtLKMC: TcxTextEdit;
    dxLayoutItem11: TdxLayoutItem;
    EdtFXBH: TcxTextEdit;
    dxLayoutItem12: TdxLayoutItem;
    EdtFXMC: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    cbbLDMC: TcxComboBox;
    dxLayoutItem14: TdxLayoutItem;
    EdtSBCJ: TcxTextEdit;
    dxLayoutItem15: TdxLayoutItem;
    EdtWHRY: TcxTextEdit;
    dxLayoutItem16: TdxLayoutItem;
    EdtLXFS: TcxTextEdit;
    dxLayoutItem17: TdxLayoutItem;
    EdtSBWD: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    EdtSBJD: TcxTextEdit;
    dxLayoutItem19: TdxLayoutItem;
    EdtLHY_WFDD: TcxTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    EdtLHY_LDDM: TcxTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    EdtLHY_DDMS: TcxTextEdit;
    dxLayoutItem23: TdxLayoutItem;
    EdtLHY_XZQH: TcxTextEdit;
    dxLayoutItem24: TdxLayoutItem;
    EdtLHY_CJFS: TcxTextEdit;
    dxLayoutItem25: TdxLayoutItem;
    EdtJDJG: TcxTextEdit;
    dxLayoutItem28: TdxLayoutItem;
    EdtJDBH: TcxTextEdit;
    dxLayoutItem29: TdxLayoutItem;
    EdtQSSBBH: TcxTextEdit;
    dxLayoutItem30: TdxLayoutItem;
    EDTWFXW: TcxTextEdit;
    dxLayoutItem31: TdxLayoutItem;
    EDTXZSD: TcxTextEdit;
    dxLayoutItem32: TdxLayoutItem;
    EDTDCXZSD: TcxTextEdit;
    dxLayoutItem33: TdxLayoutItem;
    EdtTPGS: TcxTextEdit;
    dxLayoutItem34: TdxLayoutItem;
    EdtIP: TcxTextEdit;
    dxLayoutItem35: TdxLayoutItem;
    dxlytcrtdgrp2: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp3: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp4: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp5: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp6: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp8: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp9: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp10: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp11: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp12: TdxLayoutAutoCreatedGroup;
    dxlytcrtdgrp13: TdxLayoutAutoCreatedGroup;
    chkSCJCPT: TcxCheckBox;
    dxLayoutItem36: TdxLayoutItem;
    chkaqdsb: TcxCheckBox;
    dxLayoutItem37: TdxLayoutItem;
    chkysxzp: TcxCheckBox;
    dxLayoutItem38: TdxLayoutItem;
    dxLayoutItem39: TdxLayoutItem;
    chkxxzp: TcxCheckBox;
    dxLayoutItem40: TdxLayoutItem;
    chkxysb: TcxCheckBox;
    dxLayoutItem41: TdxLayoutItem;
    chkDCXXZP: TcxCheckBox;
    dxLayoutItem42: TdxLayoutItem;
    dxlytcrtdgrp14: TdxLayoutAutoCreatedGroup;
    Chromium1: TChromium;
    dxLayoutItem43: TdxLayoutItem;
    DTQYQS: TcxDateEdit;
    dxLayoutItem1: TdxLayoutItem;
    DTJDYXQ: TcxDateEdit;
    dxLayoutItem44: TdxLayoutItem;
    dxlytcrtdgrp15: TdxLayoutAutoCreatedGroup;
    cbbSBLX: TcxComboBox;
    dxLayoutItem22: TdxLayoutItem;
    dxlytcrtdgrp7: TdxLayoutAutoCreatedGroup;
    chkTPXZ: TcxCheckBox;
    tmr1: TTimer;
    cbbCZDW: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem26: TdxLayoutItem;
    edtSBDDMC: TcxTextEdit;
    procedure Btn1Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure BtnExitClick(Sender: TObject);
    procedure EdtSBWDPropertiesEditValueChanged(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    FJsExtended: TNCJsExtended;
    Fclose: Tclose;
    FEditId: TEditStatus;
    Fid: string;
    Fok: Tok;
    function GetDev: TDevice;
    procedure SetDev(const Value: TDevice);
    procedure ShowMark;
    procedure LoadMap;
    procedure SetTitle(const Value: string);
  public
    property onclose: Tclose read Fclose write Fclose;
    property Device: TDevice read GetDev write SetDev;
    property EditID: TEditStatus read FEditId write FEditId;
    property Onok: Tok read Fok write Fok;
    property id: string read Fid write Fid;
    procedure AfterConstruction; override;
    procedure SetEditReadOnly(parentControl: TWinControl; value: Boolean);
    procedure ClearControls(parentControl: TWinControl);
  end;

  TJs = class
  private
    FLatEdit: TcxTextEdit;
    FLngEdit: TcxTextEdit;
  public
    procedure GetPoint(lng, lat: double);
    property LngEdit: TcxTextEdit read FLngEdit write FLngEdit;
    property LatEdit: TcxTextEdit read FLatEdit write FLatEdit;
  end;

var
  FrameDeviceEdit: TFrameDeviceEdit;

implementation

{$R *.dfm}

{ TFrameDeviceEdit }
procedure TFrameDeviceEdit.ClearControls(parentControl: TWinControl);
var
  item: TControl;
  i: integer;
begin
  for i := 0 to parentControl.ControlCount - 1 do
  begin
    item := parentControl.Controls[i];
    if item is TCustomEdit then
      (item as TCustomEdit).Clear
    else if item is TCustomListControl then
    begin
      (item as TCustomListControl).Clear;
      (item as TCustomListControl).ItemIndex := -1;
    end
    else if item is TWinControl then
      ClearControls(item as TWinControl);
  end;
end;

procedure TFrameDeviceEdit.LoadMap;
var
  path: string;
  FJsProcessor: TJs;
begin
  FJsProcessor := TJs.Create();
  FJsProcessor.LngEdit := self.edtSBJD;
  FJsProcessor.LatEdit := self.edtSBWD;
  FJsExtended := TNCJsExtended.Create(Self);
  FJsExtended.SetProcessObject(FJsProcessor, TypeInfo(TJs));
  FJsExtended.Chromium := self.Chromium1;
  Chromium1.Load(gSetup.MapUrl);

end;

procedure TFrameDeviceEdit.SetEditReadOnly(parentControl: TWinControl; value: Boolean);
var
  item: TControl;
  i: integer;
begin
  for i := 0 to parentControl.ControlCount - 1 do
  begin
    item := parentControl.Controls[i];
    if item is TcxTextEdit then
      (item as TcxTextEdit).Properties.ReadOnly := value
    else if item is TcxComboBox then
      (item as TcxComboBox).Properties.ReadOnly := value
    else if item is TcxDateEdit then
      (item as TcxDateEdit).Properties.ReadOnly := value
    else if item is TWinControl then
      SetEditReadOnly(item as TWinControl, value);
  end;
end;

procedure TFrameDeviceEdit.SetTitle(const Value: string);
begin

end;

procedure TFrameDeviceEdit.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindComboboxDEPT(cbbCZDW, True);
  TLZDictionary.BindCombobox(cbbSBLX, TLZDictionary.gDicMain['SBLX'], True);
  TLZDictionary.BindCombobox(cbbLDMC, TLZDictionary.gDicMain['DLMC'], True);
end;

procedure TFrameDeviceEdit.Btn1Click(Sender: TObject);
begin
  inherited;
  FJsExtended.ExecuteJavaScript('GetPointSwitch = !GetPointSwitch;');
end;

procedure TFrameDeviceEdit.BtnSaveClick(Sender: TObject);
var
  tmpDev:TDevice;
  s:string;
begin
  inherited;
  tmpDev:=Device;
  if EditID=TEditStatus.esNew then tmpDev.Systemid:='';
  s:=TJSONUtils.RecordToString<TDevice>(@tmpdev);
  if EditID = TEditStatus.esNew then
  begin
    TRequestItf.pDbQuery('AddS_Device',s);
    Application.MessageBox('增加成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
  if EditID =TEditStatus.esModify then
  begin
    TRequestItf.pDbQuery('ModifyS_Device',s);
    Application.MessageBox('修改成功', '提示', MB_OK + MB_ICONINFORMATION);
    BtnExitClick(nil);
  end;
  if Assigned(onok) then
  begin
    Onok(tmpDev);
  end;
end;

procedure TFrameDeviceEdit.BtnExitClick(Sender: TObject);
begin
  inherited;
  Hide;
  if Assigned(onclose) then
  begin
    onclose;
  end;

end;

procedure TFrameDeviceEdit.EdtSBWDPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  //Self.ShowMark;
end;

function TFrameDeviceEdit.GetDev: TDevice;
begin
  Result.Systemid:=id;
  Result.SBBH := EdtSbbh.Text;
  Result.JCPTBABH := EdtJCPTBABH.Text;
  Result.JCPTBAFX := (EdtJCBKBABH.ItemIndex + 1).ToString;
  Result.LKBH := EdtLKBH.Text;
  Result.LKMC := EdtLKMC.Text;
  Result.FXBH := EdtFXBH.Text;
  Result.FXMC := EdtFXMC.Text;
  Result.CJJG := gUser.DWDM;
  Result.SBDDMC := EdtSBDDMC.Text;
  Result.SBJD := EdtSBJD.Text;
  Result.SBWD := EdtSBWD.Text;
  Result.SBIP := EdtIP.Text;
  Result.SBCJ := EdtSBCJ.Text;
  Result.CSLXR := EdtWHRY.Text;
  Result.LXFS := EdtLXFS.Text;
  Result.QYSJ := DTQYQS.Text;
  Result.JDYXQ := DTJDYXQ.Text;
  Result.XZSD := StrToInt(EDTXZSD.Text);
  Result.DCXZSD := StrToInt(EDTDCXZSD.Text);
  Result.QSSBBH := EdtQSSBBH.Text;
  Result.SBLX := cbbSBLX.Text;
   {todo 名称转代码}
  Result.LDBH := cbbLDMC.Text;
  Result.LHY_XZQH := EdtLHY_XZQH.Text;
  Result.LHY_WFDD := EdtLHY_WFDD.Text;
  Result.LHY_SBBH := EdtLHY_SBBH.Text;
  Result.LHY_LDDM := EdtLHY_LDDM.Text;
  Result.LHY_DDMS := EdtLHY_DDMS.Text;
  Result.LHY_CJFS := EdtLHY_CJFS.Text;
  Result.QYZT := True;
  Result.SCJCPT := chkSCJCPT.Checked;
  Result.TPGS := EdtTPGS.Text;
  Result.WFXW := EDTWFXW.Text;
  Result.bz := '';
  Result.GXSJ := FormatDateTime('yyyy/mm/dd hh:mm:ss', Now);
  Result.TPXZ := chkTPXZ.Checked;
  Result.XXZB := chkxxzp.Checked;
  Result.AQDSB := chkaqdsb.Checked;
  Result.XXZB := chkxysb.Checked;
  Result.DCXXZB := chkDCXXZP.Checked;
  Result.YSXZB := chkysxzp.Checked;
  Result.CZDW:=TLZDictionary.StrtoDicInfo(cbbCZDW.Text).dm;
  Result.xysb:=chkxysb.Checked;

end;

procedure TFrameDeviceEdit.SetDev(const Value: TDevice);
begin
  EdtSbbh.Text := Value.SBBH;
  EdtJCPTBABH.Text := Value.JCPTBABH;
  EdtJCBKBABH.ItemIndex := strtointdef(Value.JCPTBAFX,1)-1;
  EdtLKBH.Text := Value.LKBH;
  EdtLKMC.Text := Value.LKMC;
  EdtFXBH.Text := Value.FXBH;
  EdtFXMC.Text := Value.FXMC;
  edtSBDDMC.Text := Value.SBDDMC;
  EdtSBJD.Text := Value.SBJD;
  EdtSBWD.Text := Value.SBWD;
  EdtIP.Text := Value.SBIP;
  EdtSBCJ.Text := Value.SBCJ;
  EdtWHRY.Text := Value.CSLXR;
  EdtLXFS.Text := Value.LXFS;
  DTQYQS.Text := Value.QYSJ;
  DTJDYXQ.Text := Value.JDYXQ;
  EDTXZSD.Text := IntToStr(Value.XZSD);
  EDTDCXZSD.Text := IntToStr(Value.DCXZSD);
  EdtQSSBBH.Text := Value.QSSBBH;
  cbbSBLX.Text := Value.SBLX;
  cbbLDMC.Text := Value.LDBH;
  EdtLHY_XZQH.Text := Value.LHY_XZQH;
  EdtLHY_WFDD.Text := Value.LHY_WFDD;
  EdtLHY_SBBH.Text := Value.LHY_SBBH;
  EdtLHY_LDDM.Text := Value.LHY_LDDM;
  EdtLHY_DDMS.Text := Value.LHY_DDMS;
  EdtLHY_CJFS.Text := Value.LHY_CJFS;
  chkSCJCPT.Checked := Value.SCJCPT;
  EdtTPGS.Text := Value.TPGS;
  EDTWFXW.Text := Value.WFXW;
  if TLZDictionary.gDicDept.ContainsKey(Value.CZDW) then
  cbbCZDW.Text:=Value.CZDW+':'+TLZDictionary.gDicDept[Value.CZDW].DWMC;
  ShowMark;
end;

procedure TFrameDeviceEdit.ShowMark;

  procedure createMarker(lng, lat: Double; icon, info, id: WideString);
  var
    script: WideString;
  begin
    script := Format('addMarker(%.12f, %.12f,"%s","%s","%s")', [lng, lat, icon, info, id]);

    FJsExtended.ExecuteJavaScript(script, '', 0);
  end;

  procedure clearMarkers;
  var
    script: WideString;
  begin
    //addHeatmap
    script := 'map.clearOverlays()';
    FJsExtended.ExecuteJavaScript(script, '', 0);
  end;

  procedure setCenter(lng, lat: Double; zoom: Integer);
  var
    script: WideString;
  begin
    script := Format('setCenter(%.12f, %.12f,%d)', [lng, lat, zoom]);
    FJsExtended.ExecuteJavaScript(script, '', 0);
  end;

var
  lat, lng: Double;
  info, icon, id: string;
  yl: TLatLng;
  xl: TLatLng;
begin
  inherited;
  if not Assigned(FJsExtended) then Exit;

  if (Length(Trim(edtSBJD.Text)) > 0) and (Length(Trim(edtSBWD.Text)) > 0) then
  begin
    clearMarkers;
    yl.lat := StrToFloat(edtSBWD.Text);
    yl.lng := StrToFloat(edtSBJD.Text);
    yl := yl.WGS84ToGCJ02.GCJ02ToBD09;
    lng := yl.lng;
    lat := yl.lat;
    icon := 'marker-blue.png';
    icon := icon.Replace('\', '//');
    info := '设备编号:' + edtSBBH.Text + ',' + '设备名称:' + edtLKMC.Text + EdtFXMC.Text;
    id := edtSBBH.Text;
    createMarker(lng, lat, icon, info, id);
    setCenter(lng, lat, 14);
  end;
end;

procedure TFrameDeviceEdit.tmr1Timer(Sender: TObject);
begin
  inherited;
  tmr1.Enabled := False;
  LoadMap;
end;
{ TJs }

procedure TJs.GetPoint(lng, lat: double);
var
  tmp: TLatLng;
begin
  tmp.lng := lng;
  tmp.lat := lat;
  tmp := tmp.BD09ToGCJ02;
  tmp := tmp.GCJ02ToWGS84;
  if Assigned(LngEdit) then
    LngEdit.Text := Format('%.6f', [tmp.lng]);
  if Assigned(LatEdit) then
    LatEdit.Text := Format('%.6f', [tmp.lat]);
end;

end.

