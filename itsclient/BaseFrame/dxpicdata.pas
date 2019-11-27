unit dxpicdata;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, hyieutils, iexBitmaps, hyiedefs,
  iesettings, iexRulers, dxLayoutContainer, dxLayoutcxEditAdapters, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, System.Contnrs, imageenview,
  ieview, cxClasses, dxLayoutControl, dxLayoutControlAdapters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridCardView, cxGridDBCardView, cxGridCustomView,
  cxGridCustomLayoutView, cxGridLevel, cxGrid, Vcl.ExtCtrls, xtImage, cefvcl,
  cxImage, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridTableView, cef.JsExtented,
  cxGridDBTableView, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uEntity, IOUtils, idHTTP,
  dxBarBuiltInMenu, cxPC, ievect, Vcl.ExtDlgs;

type
  TdxFramePicData = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    cxgrd1: TcxGrid;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutItem18: TdxLayoutItem;
    dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem19: TdxLayoutItem;
    edtCD: TcxTextEdit;
    edtkdbh: TcxTextEdit;
    edtgcsj: TcxTextEdit;
    edthpzl: TcxTextEdit;
    edthphm: TcxTextEdit;
    edtclpp: TcxTextEdit;
    edtCLSD: TcxTextEdit;
    edtcsys: TcxTextEdit;
    edtclxh: TcxTextEdit;
    edtyxqx: TcxTextEdit;
    edtccdjrq: TcxTextEdit;
    edtsyxz: TcxTextEdit;
    edtsyr: TcxTextEdit;
    edtqzbfqz: TcxTextEdit;
    edtzsxxdz: TcxTextEdit;
    edtfdjh: TcxTextEdit;
    edtcjh: TcxTextEdit;
    dxLayoutGroup4: TdxLayoutGroup;
    cxButton1: TcxButton;
    dxLayoutItem20: TdxLayoutItem;
    btnMap: TcxButton;
    dxLayoutItem21: TdxLayoutItem;
    btnPic: TcxButton;
    dxLayoutItem22: TdxLayoutItem;
    GridView: TcxGridDBTableView;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    Chromium1: TChromium;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    Timer1: TTimer;
    cxPageControl1: TcxPageControl;
    dxLayoutItem1: TdxLayoutItem;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    imgviopic: TImageEnVect;
    dxLayoutGroup7: TdxLayoutGroup;
    btnPrior: TcxButton;
    btnNext: TcxButton;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    btnSearchPic: TcxButton;
    dxLayoutItem25: TdxLayoutItem;
    btnGj: TcxButton;
    dxLayoutItem26: TdxLayoutItem;
    btnDownPic: TcxButton;
    dxLayoutItem27: TdxLayoutItem;
    saveDialog: TSavePictureDialog;
    procedure cxButton1Click(Sender: TObject);
    procedure GridViewFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure btnMapClick(Sender: TObject);
    procedure btnPicClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnSearchPicClick(Sender: TObject);
    procedure btnGjClick(Sender: TObject);
    procedure btnDownPicClick(Sender: TObject);
  private
    fdbool: Boolean;
    FPicFile: String;
    FHPHM: string;
    FHPZL: string;
    FJsExtended: TNCJsExtended;
    FUrl: string;
    FGCTable: TFDMemTable;
    FEndTime: TDateTime;
    FBeginTime: TDateTime;
    procedure ShowPicture(tb: TFDMemTable);
    procedure BindControls(tb: TFDMemTable);
    procedure LoadMap;
    procedure SetUrl(const Value: string);
    procedure SetGcTable(const tb: TFDMemTable);
    procedure ShowVioPicture(Sender: TObject; var picFile: string);
    procedure SerButtonEnabled();
    { Private declarations }
  public
    procedure AfterConstruction; override;
    procedure LoadPassList;
    property HPHM: string read FHPHM write FHPHM;
    property HPZL: string read FHPZL write FHPZL;
    property URL: string read FUrl write SetUrl;
    property BeginTime: TDateTime read FBeginTime write FBeginTime;
    property EndTime: TDateTime read FEndTime write FEndTime;
    property GCTable: TFDMemTable read FGCTable write SetGcTable;
  end;

var
  dxFramePicData: TdxFramePicData;

implementation

uses
  uColumnGenerator, uCommon, uRequestItf, uJSONUtils, uDictionary,
  uLookUpDataSource, uGlobal, uMain, dxFrames, uPicSearch;
{$R *.dfm}

procedure TdxFramePicData.AfterConstruction;
begin
  inherited;
  TColumnGenerator.Instance.GenerateField('HPHM,KDBH,GCSJ', self.GridView);
  TColumnGenerator.LookupColumn(GridView.Columns[1], TLookUpDataSource.DSDev);
  self.cxPageControl1.ActivePageIndex := 0;
  FBeginTime := now - 30;
  FEndTime := now;
end;

procedure TdxFramePicData.cxButton1Click(Sender: TObject);
begin
  inherited;
  Hide;
end;

procedure TdxFramePicData.GridViewFocusedRecordChanged
  (Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord
  : TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  BindControls(FDMemTable1);
  ShowPicture(FDMemTable1);
end;

procedure TdxFramePicData.imgviopicMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if fdbool then
  begin
    TImageEnVect(Sender).AutoFit := True;
    TImageEnVect(Sender).Proc.ClearAllRedo;
    TImageEnVect(Sender).Proc.SelCopyToClip();
    TImageEnVect(Sender).Proc.CropSel;
    TImageEnVect(Sender).DeSelect;
  end;
  fdbool := False;
end;

procedure TdxFramePicData.imgviopicMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    fdbool := True
  else
    ShowVioPicture(Sender, FPicFile);
end;

procedure TdxFramePicData.BindControls(tb: TFDMemTable);
var
  veh: TVehinfo;
begin
  veh := TCommon.GetVehinfo(tb.FieldByName('HPHM').AsString,
    tb.FieldByName('HPZL').AsString, '');
  edtkdbh.Text := tb.FieldByName('KDBH').AsString;
  if TLZDictionary.gDicDev[2].ContainsKey(edtkdbh.Text) then
    edtkdbh.Text := TLZDictionary.gDicDev[2][edtkdbh.Text].SBDDMC;
  edtgcsj.Text := tb.FieldByName('GCSJ').AsString;
  edtCD.Text := tb.FieldByName('CDBH').AsString;
  edtCLSD.Text := tb.FieldByName('CLSD').AsString;
  edthphm.Text := tb.FieldByName('HPHM').AsString;
  if TLZDictionary.gDicMain.ContainsKey('HPZL') and TLZDictionary.gDicMain
    ['HPZL'].ContainsKey(tb.FieldByName('HPZL').AsString) then
    edthpzl.Text := TLZDictionary.gDicMain['HPZL']
      [tb.FieldByName('HPZL').AsString]
  else
    edthpzl.Text := tb.FieldByName('HPZL').AsString;
  edtclpp.Text := veh.clpp1;
  edtclxh.Text := veh.clxh;
  if TLZDictionary.gDicMain.ContainsKey('CSYS') and TLZDictionary.gDicMain
    ['CSYS'].ContainsKey(veh.csys) then
    edtcsys.Text := TLZDictionary.gDicMain['CSYS'][veh.csys]
  else
    edtcsys.Text := veh.csys;
  edtcjh.Text := veh.clsbdh;
  edtfdjh.Text := veh.fdjh;
  if veh.ccdjrq.IndexOf(' ') > 0 then
    edtccdjrq.Text := veh.ccdjrq.Substring(0, veh.ccdjrq.IndexOf(' '))
  else
    edtccdjrq.Text := veh.ccdjrq;
  if TLZDictionary.gDicMain.ContainsKey('SYXZ') and TLZDictionary.gDicMain
    ['SYXZ'].ContainsKey(veh.SYXZ) then
    edtsyxz.Text := TLZDictionary.gDicMain['SYXZ'][veh.SYXZ]
  else
    edtsyxz.Text := veh.SYXZ;

  if veh.yxqz.IndexOf(' ') > 0 then
    edtyxqx.Text := veh.yxqz.Substring(0, veh.yxqz.IndexOf(' '))
  else
    edtyxqx.Text := veh.yxqz;

  if veh.QZBFQZ.IndexOf(' ') > 0 then
    edtqzbfqz.Text := veh.QZBFQZ.Substring(0, veh.QZBFQZ.IndexOf(' '))
  else
    edtqzbfqz.Text := veh.QZBFQZ;

  edtsyr.Text := veh.syr;
  edtzsxxdz.Text := veh.ZSXXDZ;
end;

procedure TdxFramePicData.btnDownPicClick(Sender: TObject);
var
  fName, hphm, hpzl, gcsj, tp: string;
  tmpTable: TFDMemTable;
begin
  inherited;
  if not FileExists(FPicFile) then
    Application.MessageBox('图片不存在', '提示', MB_ICONINFORMATION + MB_OK)
  else
  begin
    tmpTable := self.FDMemTable1;
    if FGCTable <> nil then
      tmpTable := FGCTable;
    hphm := tmpTable.FieldByName('HPHM').AsString;
    hpzl := tmpTable.FieldByName('HPZL').AsString;
    gcsj := tmpTable.FieldByName('GCSJ').AsString;
    fName := 'ZhiFaQuZheng/' + hphm + '_' + TPath.GetFileName(FPicFile);
    if TCommon.FtpPutFile(gSetup.ftphost, gSetup.ftpuser, gSetup.FtpPwd, FPicFile,
      fName, gSetup.ftpport) then
    begin
      tp := 'http://' + gSetup.ftphost + ':8090/' + fName;
      if TRequestItf.DbQuery('AddT_ZhiFaQuZheng_Pic', 'hphm='+hphm+'&hpzl='+hpzl+'&yhbh='+gUser.yhbh+'&gcsj='+gcsj+'&tp='+tp) = '1' then
        Application.MessageBox('图片保存成功', '提示', MB_ICONINFORMATION + MB_OK)
      else
        Application.MessageBox('图片保存失败', '提示', MB_ICONINFORMATION + MB_OK)
    end
    else
      Application.MessageBox('图片上传失败', '提示', MB_ICONINFORMATION + MB_OK);
  end;
end;

procedure TdxFramePicData.btnGjClick(Sender: TObject);
begin
  inherited;
  self.HPHM := FGCTable.FieldByName('HPHM').AsString;
  self.HPZL := FGCTable.FieldByName('HPZL').AsString;
  self.LoadPassList;
end;

procedure TdxFramePicData.btnMapClick(Sender: TObject);
begin
  inherited;
  // liMap.Visible := true;
  // liPic.Visible := false;
  self.cxPageControl1.ActivePageIndex := 1;
  LoadMap;
end;

procedure TdxFramePicData.btnNextClick(Sender: TObject);
begin
  inherited;
  FGCTable.Next;
  if FGCTable.Eof then
    exit;
  SerButtonEnabled;
  ShowPicture(FGCTable);
  BindControls(FGCTable);
end;

procedure TdxFramePicData.btnPicClick(Sender: TObject);
begin
  inherited;
  // liMap.Visible := false;
  // liPic.Visible := true;
  self.cxPageControl1.ActivePageIndex := 0;
end;

procedure TdxFramePicData.btnPriorClick(Sender: TObject);
begin
  inherited;
  FGCTable.Prior;
  if FGCTable.Bof then
    exit;
  SerButtonEnabled;
  ShowPicture(FGCTable);
  BindControls(FGCTable);
end;

procedure TdxFramePicData.btnSearchPicClick(Sender: TObject);
var
  frame: TdxFrameInfo;
  pic: String;
begin
  inherited;
  frame := frmMain.ShowFrameByCaption('以图搜车数据分析');
  if frame <> nil then
  begin
    pic := gSetup.DirSave + FormatDateTime('yyyymmddhhnnsszzz', now) + '.jpg';
    imgviopic.IO.SaveToFileJpeg(pic);
    TFramePicSearch(frame.frame).gPicName := pic;
  end;
end;

procedure TdxFramePicData.LoadPassList;
var
  json, params: string;
begin
  self.dxLayoutGroup7.Visible := False;
  // self.dxLayoutGroup2.Visible := True;
  self.cxPageControl1.ActivePageIndex := 0;
  self.dxLayoutItem21.Visible := True;
  self.dxLayoutItem22.Visible := True;
  if HPHM <> '-' then
    params := 'HPHM=' + HPHM + '&HPZL=' + HPZL + '&begin_gcsj=' +
      FormatDateTime('yyyymmddhhmmss', FBeginTime) + '&end_gcsj=' +
      FormatDateTime('yyyymmddhhmmss', FEndTime);
  params := params + '&orderby_desc=GCSJ';
  json := TRequestItf.DbQuery('GetPassList', params);
  TJsonUtils.JSONToDataSet(json, FDMemTable1, 'GCSJ');
  LoadMap;
  self.dxLayoutItem3.Visible := True;
end;

procedure TdxFramePicData.LoadMap;
  procedure clearMarkers;
  var
    script: WideString;
  begin
    // addHeatmap
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
  sbbh: string;
  firstPoint: Boolean;
  lng, lat: Double;
  js, line: string;
  dev: TDevice;
begin
  if not Assigned(FJsExtended) then
  begin
    FJsExtended := TNCJsExtended.Create(self);
    FJsExtended.Chromium := self.Chromium1;
    Chromium1.Load(gSetup.MapUrl);
  end;
  clearMarkers;
  with FDMemTable1 do
  begin
    if not Active then
      exit;
    DisableControls;
    First;
    firstPoint := True;
    line := 'var polyline = new BMap.Polyline([';
    js := 'map.clearOverlays();';
    while not Eof do
    begin
      sbbh := FieldByName('KDBH').AsString;
      if TLZDictionary.gDicDev[2].ContainsKey(sbbh) then
      begin
        dev := TLZDictionary.gDicDev[2][sbbh];
        lng := strtofloatdef(dev.SBJD, 110);
        lat := strtofloatdef(dev.SBWD, 23);
        if lng <> 0 then
        begin
          js := js + Format('addMarker(%.12f, %.12f,"%s","%s","%s");',
            [lng, lat, 'marker-blue.png', dev.SBDDMC, dev.sbbh]);
          if firstPoint then
          begin
            setCenter(lng, lat, 12);
            firstPoint := False;
            line := line + 'new BMap.Point(' + lng.ToString + ', ' +
              lat.ToString + ')';
          end
          else
            line := line + ',new BMap.Point(' + lng.ToString + ', ' +
              lat.ToString + ')';
        end;
      end;

      Next;
    end;

    line := line +
      '], {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});';
    js := js + line + 'map.addOverlay(polyline);';
    js := js + Format('addMarker(%.12f, %.12f,"%s","%s","%s");',
      [lng, lat, 'marker-red.png', '', '']);
    FJsExtended.ExecuteJavaScript(js, '', 0);
    First;
    EnableControls;
  end;
end;

procedure TdxFramePicData.SerButtonEnabled;
begin
  if FGCTable.RecNo = 1 then
    btnPrior.Enabled := False
  else
    btnPrior.Enabled := True;
  if FGCTable.RecNo = FGCTable.RecordCount then
    btnNext.Enabled := False
  else
    btnNext.Enabled := True;
end;

procedure TdxFramePicData.SetGcTable(const tb: TFDMemTable);
begin
  FGCTable := tb;
  self.dxLayoutItem3.Visible := False;
  self.dxLayoutGroup7.Visible := True;
  // self.dxLayoutGroup2.Visible := False;
  self.cxPageControl1.ActivePageIndex := 0;
  self.dxLayoutItem21.Visible := False;
  self.dxLayoutItem22.Visible := False;
  dxLayoutItem25.Visible := frmMain.FindFrameByCaption('以图搜车数据分析');
  SerButtonEnabled;
  ShowPicture(FGCTable);
  BindControls(FGCTable);
end;

procedure TdxFramePicData.SetUrl(const Value: string);
var
  picFile: string;
begin
  FUrl := Value;
  self.dxLayoutItem3.Visible := False;
  // self.dxLayoutGroup2.Visible := False;
  self.cxPageControl1.ActivePageIndex := 0;
  self.dxLayoutItem21.Visible := False;
  self.dxLayoutItem22.Visible := False;

  picFile := gSetup.DirSave + 'tmp.jpg';
  if TCommon.GetPic(FUrl, '', picFile) then
  begin
    try
      FPicFile := picFile;
      ShowVioPicture(imgviopic, FPicFile);
      // self.cxImage1.Picture.LoadFromFile(picFile);
    except

    end;
  end;
end;

procedure TdxFramePicData.ShowPicture(tb: TFDMemTable);
var
  URL, picFile: string;
begin
  URL := tb.FieldByName('FWQDZ').AsString + tb.FieldByName('TP1').AsString;
  if URL = '' then
    exit;
  picFile := gSetup.DirSave + FormatDateTime('yyyymmddhhnnsszzz', now) + '.jpg';
  if not TFile.Exists(picFile) then
    TCommon.GetPic(URL, '', picFile);
  FPicFile := picFile;
  // self.cxImage1.Picture.LoadFromFile(picFile);
  ShowVioPicture(imgviopic, FPicFile);
end;

procedure TdxFramePicData.ShowVioPicture(Sender: TObject; var picFile: string);
begin
  imgviopic.AutoFit := True;
  if not FileExists(picFile) then
  begin
    TImageEnVect(Sender).IO.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'image\ZWTP.png');
    picFile := '';
    exit;
  end;

  try
    with TImageEnVect(Sender) do
    begin
      IO.NativePixelFormat := True;
      if not IO.LoadFromFile(picFile) then
      begin
        picFile := '';
        exit;
      end;
      // AutoFit := False;
      Select(0, 0, 0, 0, iespReplace);
      MouseInteract := [miSelect];
      SelectionOptions := [iesoMoveable, iesoCanScroll];
    end;
  except
    TImageEnVect(Sender).IO.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'image\ZWTP.png');
    picFile := '';
  end;
end;

procedure TdxFramePicData.Timer1Timer(Sender: TObject);
begin
  inherited;
  FJsExtended := TNCJsExtended.Create(self);
  FJsExtended.Chromium := self.Chromium1;
  Chromium1.Load(gSetup.MapUrl);
  Timer1.Enabled := False;
end;

end.
