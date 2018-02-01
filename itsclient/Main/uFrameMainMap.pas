unit uFrameMainMap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, cefvcl, cef.JsExtented, uFrameVideo,
  LatLngHelper, uEntity, uRequestItf, uCommon, uJsonUtils, uGlobal, DateUtils,
  System.Generics.Collections, Vcl.ExtCtrls, Vcl.StdCtrls, uDictionary,
  cxCheckBox, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxComboBoxExt;

type

  TJsProcessor = class
  public
    function showMsg(id: String; Msg: String): string;
  end;

  TFrameMainMap = class(TFrame)
    dxLayoutControl2: TdxLayoutControl;
    Chromium1: TChromium;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    Timer1: TTimer;
    Timer2: TTimer;
    cboSBLX: TcxCheckComboBox;
    cboDev: TcxComboBoxExt;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cboDevPropertiesCloseUp(Sender: TObject);
    procedure cboSBLXPropertiesChange(Sender: TObject);
  private
    FJsProcessor: TJsProcessor;
    FJsExtended: TNCJsExtended;
    procedure LoadDevice;
    procedure LoadMap;
    procedure setCenter(lng, lat: Double; zoom: Integer);
    procedure LoadQDZ;
  public
    { Public declarations }
  end;

var
  FrameMainMap: TFrameMainMap;
  FQDZDic: TDictionary<string, TQDZ>;

implementation

uses uFrameDevicePic, uFrameQDZDlg;

{$R *.dfm}

procedure TFrameMainMap.cboDevPropertiesCloseUp(Sender: TObject);
var
  SBBH: string;
  device: TDevice;
  lng, lat: Double;
begin
  inherited;
  SBBH := TLZDictionary.GetKey('DEV', '', cboDev.Text);
  if SBBH <> '' then
  begin
    device := TLZDictionary.gDicDev[2][SBBH];
    lng := StrToFloatDef(device.SBJD, 0);
    lat := StrToFloatDef(device.SBWD, 0);
    if (lng > 0) and (lat > 0) then
    begin
      setCenter(lng + 0.01, lat + 0.004, 18);
    end;
  end;
end;

procedure TFrameMainMap.cboSBLXPropertiesChange(Sender: TObject);
begin
  LoadDevice;
end;

procedure TFrameMainMap.LoadDevice;
var
  s, SBLX: string;
  list: TList<TDevice>;
  dev: TDevice;
  point: TLatLng;
  js: TStrings;
  gxsj: Double;
  i: Integer;
begin
  SBLX := '';
  for i := 0 to cboSBLX.Properties.Items.Count - 1 do
  begin
    if cboSBLX.States[i] = TcxCheckBoxState.cbsChecked then
      SBLX := SBLX + (i + 1).ToString;
  end;

  s := TRequestItf.DbQuery('GetDeviceList', 'yhbh=' + gUser.yhbh +
    '&notnull_sbjd=null&not_sbjd=0');
  list := TJSONUtils.JsonToRecordList<TDevice>(s);
  js := TStringList.Create;
  js.Add('map.clearOverlays();');
  for dev in list do
  begin
    if SBLX.Contains(dev.SBLX) then
    begin
      gxsj := VarToDateTime(dev.gxsj);
      point.lat := dev.SBWD.ToDouble;
      point.lng := dev.SBJD.ToDouble;
      point := point.WGS84ToGCJ02.GCJ02ToBD09;
      if (Now - gxsj) < OneMinute * 30 then
        js.Add(Format('addMarker(%.6f, %.6f,"%s","%s","%s");',
          [point.lng, point.lat, 'camera-blue.png', dev.SBDDMC, dev.SBBH]))
      else
        js.Add(Format('addMarker(%.6f, %.6f,"%s","%s","%s");',
          [point.lng, point.lat, 'camera-red.png', dev.SBDDMC, dev.SBBH]));
    end;
  end;
  FJsExtended.ExecuteJavaScript(js.Text);
  js.Free;
  list.Free;
  if SBLX.Contains('4') then
    LoadQDZ;
end;

procedure TFrameMainMap.LoadMap;
begin
  if not Assigned(FJsProcessor) then
  begin
    FJsProcessor := TJsProcessor.Create;
    FJsExtended := TNCJsExtended.Create(self);
    FJsExtended.SetProcessObject(FJsProcessor, TypeInfo(TJsProcessor));
    FJsExtended.Chromium := self.Chromium1;
    Chromium1.Load(gSetup.MapUrl);

    FrameDevicePic := TFrameDevicePic.Create(self);
    FrameDevicePic.Parent := self;
    FrameDevicePic.Left := self.Width div 4;
    FrameDevicePic.Top := self.Height div 8;
    FrameDevicePic.dxLayoutControl2.Width := self.Width div 2;
    FrameDevicePic.dxLayoutControl2.Height := self.Height * 3 div 4;
    FrameDevicePic.Hide;

    FrameVideo := TFrameVideo.Create(self);
    FrameVideo.Parent := self;
    FrameVideo.Left := self.Width div 4;
    FrameVideo.Top := self.Height div 8;
    FrameVideo.dxLayoutControl2.Width := self.Width div 2;
    FrameVideo.dxLayoutControl2.Height := self.Height * 3 div 4;
    FrameVideo.Hide;

    FrameQDZDlg := TFrameQDZDlg.Create(self);
    FrameQDZDlg.Parent := self;
    FrameQDZDlg.Left := self.Width div 4;
    FrameQDZDlg.Top := self.Height div 8;
    FrameQDZDlg.dxLayoutControl2.Width := self.Width div 2;
    FrameQDZDlg.dxLayoutControl2.Height := self.Height * 3 div 4;
    FrameQDZDlg.Hide;
  end;
end;

procedure TFrameMainMap.LoadQDZ;
var
  s: string;
  list: TList<TQDZ>;
  dev: TQDZ;
  point: TLatLng;
  js: TStrings;
  i: Integer;
begin
  if FQDZDic = nil then
  begin
    FQDZDic := TDictionary<string, TQDZ>.Create;
    s := TRequestItf.DbQuery('GetT_QDZ_DEPT', 'rows=99999&start=0');
    list := TJSONUtils.JsonToRecordList<TQDZ>(s);
    for dev in list do
    begin
      FQDZDic.Add(dev.QDZDM, dev);
    end;
    list.Free;
  end;
  js := TStringList.Create;
  for dev in FQDZDic.Values do
  begin
    point.lng := StrToFloatDef(dev.JD, 0);
    point.lat := StrToFloatDef(dev.WD, 0);
    if (point.lng > 0) and (point.lng < 180) and (point.lat > 0) and
      (point.lat < 90) then
    begin
      point := point.WGS84ToGCJ02.GCJ02ToBD09;

      js.Add(Format('addMarker(%.6f, %.6f,"%s","%s","%s");',
        [point.lng, point.lat, 'camera-blue.png', 'QDZ_' + dev.QDZMC,
        dev.QDZDM]));
    end;
  end;
  FJsExtended.ExecuteJavaScript(js.Text);
  js.Free;
end;

procedure TFrameMainMap.setCenter(lng, lat: Double; zoom: Integer);
var
  script: WideString;
begin
  script := Format('setCenter(%.12f, %.12f,%d)', [lng, lat, zoom]);;
  FJsExtended.ExecuteJavaScript(script, '', 0);
end;

procedure TFrameMainMap.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  LoadMap;
  TLZDictionary.BindComboboxDEV(cboDev);
  Timer2.Enabled := True;
end;

procedure TFrameMainMap.Timer2Timer(Sender: TObject);
var
  lng, lat: Double;
begin
  inherited;
  LoadDevice;
  if Timer2.Interval <> 5 * 60 * 1000 then
  begin
    if StrToIntDef(TLZDictionary.gDicDept[gUser.DWDM].DWJB, 0) > 3 then
    begin
      lng := StrToFloatDef(TLZDictionary.gDicDept[gUser.DWDM].lng, 0);
      lat := StrToFloatDef(TLZDictionary.gDicDept[gUser.DWDM].lat, 0);
      if (lng > 0) and (lat > 0) then
        setCenter(lng, lat, 15);
    end;
    cboSBLX.Show;
    cboDev.Show;
    Timer2.Interval := 5 * 60 * 1000;
  end;
end;

{ TJsProcessor }

function TJsProcessor.showMsg(id, Msg: String): string;
var
  device: TDevice;
begin
  if not Msg.StartsWith('QDZ') then
  begin
    if TLZDictionary.gDicDev[2].ContainsKey(id) then
    begin
      device := TLZDictionary.gDicDev[2][id];
      if device.SBLX = '3' then
      begin
        FrameVideo.SBBH := id;
        FrameVideo.dxLayoutGroup1.CaptionOptions.Text := Msg;
        FrameVideo.Show;
      end
      else
      begin
        FrameDevicePic.SBBH := id;
        FrameDevicePic.dxLayoutGroup1.CaptionOptions.Text := Msg;
        FrameDevicePic.Show;
      end;
    end;
  end
  else
  begin
    FrameQDZDlg.QDZ := FQDZDic[id];
    FrameQDZDlg.dxLayoutGroup1.CaptionOptions.Text := Msg.Substring(4);
    FrameQDZDlg.Show;
  end;
  result := '';
end;

end.
