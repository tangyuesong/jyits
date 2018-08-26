unit uPicView;

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
  dxBarBuiltInMenu, cxPC, ievect, uCarFaceCompare;

type
  TPicView = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
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
    Chromium1: TChromium;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    Timer1: TTimer;
    imgviopic: TImageEnVect;
    dxLayoutGroup7: TdxLayoutGroup;
    btnPrior: TcxButton;
    btnNext: TcxButton;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    btnSearchPic: TcxButton;
    dxLayoutItem25: TdxLayoutItem;
    liMap: TdxLayoutItem;
    liPic: TdxLayoutItem;
    procedure cxButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnSearchPicClick(Sender: TObject);
  private
    fdbool: Boolean;
    FPicFile: String;
    FJsExtended: TNCJsExtended;
    FUrl: string;
    FGCTable: TFDMemTable;
    procedure ShowPicture(tb: TFDMemTable);
    procedure BindControls(tb: TFDMemTable);
    procedure LoadMap;
    procedure SetUrl(const Value: string);
    procedure SetGcTable(const tb: TFDMemTable);
    procedure ShowVioPicture(Sender: TObject; var picFile: string);
    procedure SetButtonEnabled();
    procedure ShowMapMarker;
    { Private declarations }
  public
    procedure AfterConstruction; override;
    property URL: string read FUrl write SetUrl;
    property GCTable: TFDMemTable read FGCTable write SetGcTable;
  end;

var
  PicView: TPicView;

implementation

uses
  uCommon, uRequestItf, uJSONUtils, uDictionary, uMain, uPicSearch,
  uGlobal, dxFrames;
{$R *.dfm}

procedure TPicView.AfterConstruction;
begin
  inherited;
end;

procedure TPicView.cxButton1Click(Sender: TObject);
begin
  inherited;
  Hide;
end;

procedure TPicView.imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
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

procedure TPicView.imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    fdbool := True
  else
    ShowVioPicture(Sender, FPicFile);
end;

procedure TPicView.BindControls(tb: TFDMemTable);
var
  veh: TVehinfo;
begin
  veh := TCommon.GetLocalVeh(tb.FieldByName('HPHM').AsString,
    tb.FieldByName('HPZL').AsString);
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

procedure TPicView.btnNextClick(Sender: TObject);
begin
  inherited;
  FGCTable.Next;
  if FGCTable.Eof then
    exit;
  SetButtonEnabled;
  ShowPicture(FGCTable);
  BindControls(FGCTable);
  ShowMapMarker;
end;

procedure TPicView.btnPriorClick(Sender: TObject);
begin
  inherited;
  FGCTable.Prior;
  if FGCTable.Bof then
    exit;
  SetButtonEnabled;
  ShowPicture(FGCTable);
  BindControls(FGCTable);
  ShowMapMarker;
end;

procedure TPicView.btnSearchPicClick(Sender: TObject);
var
  frame: TdxFrameInfo;
  pic: String;
begin
  inherited;
  frame := frmMain.ShowFrameByCaption('以图搜图数据分析');
  if frame <> nil then
  begin
    pic := gSetup.DirSave + FormatDateTime('yyyymmddhhnnsszzz', now) + '.jpg';
    imgviopic.IO.SaveToFileJpeg(pic);
    TFrameCarFaceCompare(frame.frame).gPicName := pic;
    TFrameCarFaceCompare(frame.frame).dxLayoutGroup1.Visible := True;
    TFrameCarFaceCompare(frame.frame).dxLayoutGroup5.Visible := False;
    TFrameCarFaceCompare(frame.frame).dxLayoutGroup7.Visible := False;
  end;
end;

procedure TPicView.LoadMap;
begin
  if not Assigned(FJsExtended) then
  begin
    FJsExtended := TNCJsExtended.Create(self);
    FJsExtended.Chromium := self.Chromium1;
    Chromium1.Load(gSetup.MapUrl);
  end;
end;

procedure TPicView.ShowMapMarker;
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
  lng, lat: Double;
  js, line: string;
  dev: TDevice;
begin
  LoadMap;
  clearMarkers;
  if FGCTable = nil then
    exit;
  sbbh := FGCTable.FieldByName('KDBH').AsString;
  if TLZDictionary.gDicDev[2].ContainsKey(sbbh) then
  begin
    dev := TLZDictionary.gDicDev[2][sbbh];
    lng := strtofloatdef(dev.SBJD, 110);
    lat := strtofloatdef(dev.SBWD, 23);
    if lng <> 0 then
    begin
      js := Format('addMarker(%.12f, %.12f,"%s","%s","%s");',
        [lng, lat, 'marker-blue.png', dev.SBDDMC, dev.sbbh]);
      FJsExtended.ExecuteJavaScript(js, '', 0);

      setCenter(lng, lat, 14);
    end;
  end;

end;

procedure TPicView.SetButtonEnabled;
begin
  btnPrior.Enabled := not FGCTable.Bof;
  btnNext.Enabled := not FGCTable.Eof;
end;

procedure TPicView.SetGcTable(const tb: TFDMemTable);
begin
  FGCTable := tb;
  dxLayoutItem25.Visible := frmMain.FindFrameByCaption('以图搜图数据分析');
  SetButtonEnabled;
  ShowPicture(FGCTable);
  BindControls(FGCTable);
  ShowMapMarker;
end;

procedure TPicView.SetUrl(const Value: string);
var
  picFile: string;
begin
  FUrl := Value;
  picFile := gSetup.DirSave + 'tmp.jpg';
  if TCommon.GetPic(FUrl, '', picFile) then
  begin
    try
      FPicFile := picFile;
      ShowVioPicture(imgviopic, FPicFile);
    except

    end;
  end;
end;

procedure TPicView.ShowPicture(tb: TFDMemTable);
var
  URL, picFile: string;
begin
  URL := tb.FieldByName('FWQDZ').AsString + tb.FieldByName('TP1').AsString;
  if URL = '' then
    exit;
  picFile := gSetup.DirSave + FormatDateTime('yyyymmddhhnnsszzz', now) + '.jpg';
  if not TFile.Exists(picFile) then
  begin
    TCommon.GetPic(URL, '', picFile);
  end;
  if TFile.Exists(picFile) then
  begin
    try
      FPicFile := picFile;
      ShowVioPicture(imgviopic, FPicFile);
    except

    end;
  end;
end;

procedure TPicView.ShowVioPicture(Sender: TObject; var picFile: string);
var
  picPath: string;
begin
  imgviopic.AutoFit := True;
  if not FileExists(picFile) then
  begin
    picPath := ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png';
    TImageEnVect(Sender).IO.LoadFromFile(picPath);
    picFile := '';
    exit;
  end;

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
end;

procedure TPicView.Timer1Timer(Sender: TObject);
begin
  inherited;
  ShowMapMarker;
  Timer1.Enabled := False;
end;

end.
