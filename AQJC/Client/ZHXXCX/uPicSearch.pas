unit uPicSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, cxComboboxExt,
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
  cxGrid, dxLayoutControl, Vcl.ComCtrls, dxCore, cxDateUtils, cxCheckBox,
  cxCalendar, hyieutils, iexBitmaps, hyiedefs, iesettings, iexRulers,
  System.Contnrs, imageenview, ieview, ievect, uDictionary, Vcl.ExtDlgs,
  uGlobal, uCommon, uRequestItf, uJsonUtils, Generics.Collections,
  Soap.EncdDecd, dxpicdata, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  uEntity;

type
  TFramePicSearch = class(TdxGridFrame)
    cboKDBH: TcxComboboxExt;
    dtBegin: TcxDateEdit;
    dtEnd: TcxDateEdit;
    btnSearch: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    cb1: TcxCheckBox;
    dxLayoutItem5: TdxLayoutItem;
    cb2: TcxCheckBox;
    dxLayoutItem6: TdxLayoutItem;
    cb3: TcxCheckBox;
    dxLayoutItem7: TdxLayoutItem;
    cb4: TcxCheckBox;
    dxLayoutItem8: TdxLayoutItem;
    cb5: TcxCheckBox;
    dxLayoutItem9: TdxLayoutItem;
    cb6: TcxCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    cb7: TcxCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    cb8: TcxCheckBox;
    dxLayoutItem12: TdxLayoutItem;
    cb9: TcxCheckBox;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem16: TdxLayoutItem;
    btnPic: TcxButton;
    dxLayoutItem19: TdxLayoutItem;
    imgviopic: TImageEnVect;
    picDlg: TOpenPictureDialog;
    ActionList1: TActionList;
    ActionPicture: TAction;
    ActionViewList: TAction;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    lgGrid: TdxLayoutGroup;
    lgPic: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    ImageEnVect1: TImageEnVect;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutGroup10: TdxLayoutGroup;
    dxLayoutGroup11: TdxLayoutGroup;
    cxTextEdit1: TcxTextEdit;
    dxLayoutItem15: TdxLayoutItem;
    cxTextEdit2: TcxTextEdit;
    dxLayoutItem18: TdxLayoutItem;
    cxTextEdit3: TcxTextEdit;
    dxLayoutItem20: TdxLayoutItem;
    cxTextEdit4: TcxTextEdit;
    dxLayoutItem21: TdxLayoutItem;
    cxTextEdit5: TcxTextEdit;
    dxLayoutItem22: TdxLayoutItem;
    cxTextEdit6: TcxTextEdit;
    dxLayoutItem23: TdxLayoutItem;
    cxTextEdit7: TcxTextEdit;
    dxLayoutItem24: TdxLayoutItem;
    cxTextEdit8: TcxTextEdit;
    dxLayoutItem25: TdxLayoutItem;
    dxLayoutGroup12: TdxLayoutGroup;
    dxLayoutGroup13: TdxLayoutGroup;
    cxTextEdit9: TcxTextEdit;
    dxLayoutItem26: TdxLayoutItem;
    cxTextEdit10: TcxTextEdit;
    dxLayoutItem27: TdxLayoutItem;
    cxTextEdit11: TcxTextEdit;
    dxLayoutItem28: TdxLayoutItem;
    cxTextEdit12: TcxTextEdit;
    dxLayoutItem29: TdxLayoutItem;
    cxTextEdit13: TcxTextEdit;
    dxLayoutItem30: TdxLayoutItem;
    cxTextEdit14: TcxTextEdit;
    dxLayoutItem31: TdxLayoutItem;
    dxLayoutGroup14: TdxLayoutGroup;
    dxLayoutGroup15: TdxLayoutGroup;
    dxLayoutGroup16: TdxLayoutGroup;
    edtHphm: TcxTextEdit;
    dxLayoutItem32: TdxLayoutItem;
    procedure imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPicClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure ActionPictureExecute(Sender: TObject);
    procedure FDMemTable1AfterScroll(DataSet: TDataSet);
  private
    FgPicName: String;
    FDetail: TdxFramePicData;
    FdfVehInfo: TDFVehInfo;
    fdbool: Boolean;
    FPicFile, FSearchPicFile: String;
    procedure AfterConstruction; override;
    procedure ShowVioPicture(Sender: TObject; var picFile: string);
    procedure FillVehEdit;
    procedure SetPicName(const pic: String);
    procedure InitControl();
  protected
    procedure LoadData; override;
  public
    property gPicName: String read FgPicName write SetPicName;
  end;

var
  FramePicSearch: TFramePicSearch;

implementation

{$R *.dfm}

procedure TFramePicSearch.ActionPictureExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(self);
    FDetail.Parent := self;
    FDetail.Align := TAlign.alClient;
  end;
  FDetail.url := FDMemTable1.FieldByName('FWQDZ').AsString +
    FDMemTable1.FieldByName('TP1').AsString;
  FDetail.Show;
end;

procedure TFramePicSearch.AfterConstruction;
var
  tb: TFDMemTable;
  s, dm, mc: String;
begin
  inherited;
  imgviopic.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  ImageEnVect1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  dtBegin.Date := now - 3;
  dtEnd.Date := now;
  TLZDictionary.BindComboboxDEV(cboKDBH);
  GridColumns := 'HPHM,HPZL';
end;

procedure TFramePicSearch.btnPicClick(Sender: TObject);
begin
  inherited;
  if picDlg.Execute then
  begin
    FPicFile := picDlg.FileName;
    ShowVioPicture(imgviopic, FPicFile);
  end;
end;

procedure TFramePicSearch.btnSearchClick(Sender: TObject);
var
  url, fName: String;
begin
  inherited;
  if not gHaveK08 then
  begin
    Application.MessageBox('未安装刀锋和K08,暂时无法使用该功能', '提示',
      MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  InitControl;
  if FPicFile = '' then
    Exit;
  ShowFrameWait;
  fName := FormatDatetime('yyyymmddhhnnsszzz', now()) + '.jpg';
  imgviopic.IO.SaveToFileJpeg(fName);

  url := 'http://' + gSetup.ftphost + ':8090/' + fName;
  btnSearch.Enabled := False;

  if TCommon.FtpPutFile(gSetup.ftphost, gSetup.ftpuser, gSetup.FtpPwd, fName,
    fName, gSetup.ftpport) then
  begin
    FdfVehInfo := TCommon.GetPicVehInfo(url);
    if FdfVehInfo.nTagID <> '' then
    begin
      FillVehEdit;
      edtPageIndex.Text := '0';
      LoadData;
    end;
    TCommon.FtpDelFile(gSetup.ftphost, gSetup.ftpuser, gSetup.FtpPwd, fName,
      gSetup.ftpport)
  end
  else
    Application.MessageBox('文件提交失败', '提示', MB_OK + MB_ICONINFORMATION);
  DeleteFile(fName);
  btnSearch.Enabled := True;
  FreeFrameWait;
end;

procedure TFramePicSearch.FDMemTable1AfterScroll(DataSet: TDataSet);
var
  url: String;
begin
  inherited;
  if not FDMemTable1.Active or FDMemTable1.Eof then
    Exit;
  // url := FDMemTable1.FieldByName('FWQDZ').AsString + FDMemTable1.FieldByName
  // ('TP1').AsString;
  FSearchPicFile := gSetup.DirSave + '\' + FormatDatetime('yyyymmddhhnnsszzz',
    now()) + '.jpg';
  if TCommon.GetPic(FDMemTable1.FieldByName('FWQDZ').AsString,
    FDMemTable1.FieldByName('TP1').AsString, FSearchPicFile) then
    ShowVioPicture(ImageEnVect1, FSearchPicFile);
  cxTextEdit9.Text := FDMemTable1.FieldByName('HPHM').AsString;
  cxTextEdit10.Text := FDMemTable1.FieldByName('HPZL').AsString;
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(FDMemTable1.FieldByName('HPZL')
    .AsString) then
    cxTextEdit10.Text := TLZDictionary.gDicMain['HPZL']
      [FDMemTable1.FieldByName('HPZL').AsString];
  cxTextEdit11.Text := FDMemTable1.FieldByName('CSYS').AsString;
  cxTextEdit12.Text := FDMemTable1.FieldByName('CLPP').AsString;
  cxTextEdit13.Text := FDMemTable1.FieldByName('GCSJ').AsString;
  cxTextEdit14.Text := FDMemTable1.FieldByName('KDBH').AsString;
  if TLZDictionary.gDicDev[2].ContainsKey(FDMemTable1.FieldByName('KDBH')
    .AsString) then
    cxTextEdit14.Text := TLZDictionary.gDicDev[2]
      [FDMemTable1.FieldByName('KDBH').AsString].SBDDMC;
end;

procedure TFramePicSearch.FillVehEdit;
begin
  cxTextEdit1.Text := FdfVehInfo.PlateNum;
  cxTextEdit2.Text := FdfVehInfo.nType;
  if TLZDictionary.gK08Hpzl.ContainsKey(FdfVehInfo.nType) then
    cxTextEdit2.Text := TLZDictionary.gK08Hpzl[FdfVehInfo.nType].mc;
  cxTextEdit3.Text := FdfVehInfo.nColor;
  if TLZDictionary.gK08Csys.ContainsKey(FdfVehInfo.nColor) then
    cxTextEdit3.Text := TLZDictionary.gK08Csys[FdfVehInfo.nColor];
  cxTextEdit4.Text := FdfVehInfo.nMainLogo + '-' + FdfVehInfo.nSubLogo;
  if TLZDictionary.gK08Clpp.ContainsKey(cxTextEdit4.Text) then
    cxTextEdit4.Text := TLZDictionary.gK08Clpp[cxTextEdit4.Text];
  if Trim(FdfVehInfo.nPilotSB) = '1' then
    cxTextEdit5.Text := '未系安全带'
  else if Trim(FdfVehInfo.nPilotSB) = '2' then
    cxTextEdit5.Text := '系安全带'
  else
    cxTextEdit5.Text := '未知';
  if Trim(FdfVehInfo.nPilotSV) = '1' then
    cxTextEdit6.Text := '关闭'
  else if Trim(FdfVehInfo.nPilotSV) = '2' then
    cxTextEdit6.Text := '打开'
  else
    cxTextEdit6.Text := '未知';
  if Trim(FdfVehInfo.nPendant) = '1' then
    cxTextEdit7.Text := '有'
  else if Trim(FdfVehInfo.nPendant) = '2' then
    cxTextEdit7.Text := '无'
  else
    cxTextEdit7.Text := '未知';
  if Trim(FdfVehInfo.nUPhone) = '1' then
    cxTextEdit8.Text := '打手机'
  else if Trim(FdfVehInfo.nUPhone) = '2' then
    cxTextEdit8.Text := '未打手机'
  else
    cxTextEdit8.Text := '未知';
end;

procedure TFramePicSearch.imgviopicMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
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

procedure TFramePicSearch.imgviopicMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pic: String;
begin
  if Button = mbLeft then
    fdbool := True
  else
  begin
    if TImageEnVect(Sender).Name = 'imgviopic' then
      pic := FPicFile
    else
      pic := FSearchPicFile;
    ShowVioPicture(Sender, pic);
  end;
end;

procedure TFramePicSearch.InitControl;
begin
  cxTextEdit1.Text := '';
  cxTextEdit2.Text := '';
  cxTextEdit3.Text := '';
  cxTextEdit4.Text := '';
  cxTextEdit5.Text := '';
  cxTextEdit6.Text := '';
  cxTextEdit7.Text := '';
  cxTextEdit8.Text := '';
  cxTextEdit9.Text := '';
  cxTextEdit10.Text := '';
  cxTextEdit11.Text := '';
  cxTextEdit12.Text := '';
  cxTextEdit13.Text := '';
  cxTextEdit14.Text := '';
  FDMemTable1.Close;
  Application.ProcessMessages;
end;

procedure TFramePicSearch.LoadData;
var
  params, json, s: string;
  pageSize, pageIndex: Integer;
  clpp, csys: String;
begin
  inherited;
  pageSize := StrToIntDef(cbbPageSize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);

  params := 'passtime=' + FormatDatetime('yyyy-mm-dd hh:mm:ss', dtBegin.Date) +
    ',' + FormatDatetime('yyyy-mm-dd hh:mm:ss', dtEnd.Date) + '&currentPage=' +
    IntToStr(pageIndex + 1) + '&pageSize=' + pageSize.ToString;
  if cboKDBH.Text <> '' then
    params := params + '&crossingid=' + TLZDictionary.gDicDev[2]
      [TLZDictionary.GetKey('DEV', '', cboKDBH.Text)].HikID;
  if cb1.Checked then
    params := params + '&plateno=' + FdfVehInfo.PlateNum
  else if Trim(edtHphm.Text) <> '' then
    params := params + '&plateno=' + Trim(edtHphm.Text);
  if cb2.Checked then
    params := params + '&vehicletype=' + FdfVehInfo.nType;
  if cb3.Checked then
    params := params + '&vehiclecolor=' + FdfVehInfo.nColor;
  if cb4.Checked then
  begin
    params := params + '&vehiclelogo=' + FdfVehInfo.nMainLogo;
    params := params + '&vehiclesublogo=' + FdfVehInfo.nSubLogo;
  end;
  if cb5.Checked then
    params := params + '&pilotsafebelt=' + FdfVehInfo.nPilotSB;
  if cb6.Checked then
    params := params + '&vicepilotsafebelt=' + FdfVehInfo.nCopilotSB;
  if cb7.Checked then
    params := params + '&pilotsunvisor=' + FdfVehInfo.nPilotSV;
  if cb8.Checked then
    params := params + '&vicepilotsunvisor=' + FdfVehInfo.nCopilotSV;
  if cb9.Checked then
    params := params + '&pendant=' + FdfVehInfo.nPendant;

  json := TRequestItf.DbQuery('GetK08PassList', params);

  Application.ProcessMessages;
  FDMemTable1.AfterScroll := nil;
  TJsonUtils.JSONToDataSet(json, FDMemTable1, '', True);
  if not FDMemTable1.Active then
    Exit;
  FDMemTable1.AfterScroll := FDMemTable1AfterScroll;
  FDMemTable1AfterScroll(nil);
  btnNextPage.Enabled := FDMemTable1.RecordCount = pageSize;
end;

procedure TFramePicSearch.SetPicName(const pic: String);
begin
  FPicFile := pic;
  ShowVioPicture(imgviopic, FPicFile);
end;

procedure TFramePicSearch.ShowVioPicture(Sender: TObject; var picFile: string);
begin
  imgviopic.AutoFit := True;
  if not FileExists(picFile) then
  begin
    TImageEnVect(Sender).IO.LoadFromFile(ExtractFilePath(ParamStr(0)) +
      'image\ZWTP.png');
    picFile := '';
    Exit;
  end;

  with TImageEnVect(Sender) do
  begin
    IO.NativePixelFormat := True;
    if not IO.LoadFromFile(picFile) then
    begin
      picFile := '';
      Exit;
    end;
    // AutoFit := False;
    Select(0, 0, 0, 0, iespReplace);
    MouseInteract := [miSelect];
    SelectionOptions := [iesoMoveable, iesoCanScroll];
  end;
end;

end.
