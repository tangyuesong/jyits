unit uCarFaceCompare;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, dxLayoutcxEditAdapters, dxLayoutControlAdapters, hyieutils,
  iexBitmaps, hyiedefs, iesettings, iexRulers, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.StdCtrls, cxRadioGroup, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, System.Contnrs, imageenview, ieview,
  ievect, Vcl.Menus, cxButtons, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxComboBoxExt, Udictionary, DateUtils, Vcl.ExtDlgs,
  uGlobal, uCommon, uRequestItf, Soap.EncdDecd, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridWinExplorerView, cxGridDBWinExplorerView,
  cxGridCustomView, cxGridTableView, cxGridDBTableView, cxGrid, dxGridFrame,
  uCarFaceGrid, uJsonUtils, System.IOUtils, cxGroupBox;

type
  TFrameCarFaceCompare = class(TdxFrame)
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dtKssj: TcxDateEdit;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dtJssj: TcxDateEdit;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    rbFD: TcxRadioButton;
    rbXQ: TcxRadioButton;
    dxLayoutItem6: TdxLayoutItem;
    cboKDBH: TcxComboBoxExt;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    btnSearch: TcxButton;
    btnPic: TcxButton;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem12: TdxLayoutItem;
    picDlg: TOpenPictureDialog;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    cxButton1: TcxButton;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    FrameCarFaceGrid: TFrameCarFaceGrid;
    ImageEnVect1: TImageEnVect;
    ImageEnView1: TImageEnView;
    imgEV: TImageEnVect;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem16: TdxLayoutItem;
    cxButton2: TcxButton;
    dxLayoutGroup8: TdxLayoutGroup;
    dxLayoutItem17: TdxLayoutItem;
    dxLayoutItem18: TdxLayoutItem;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    dxLayoutGroup9: TdxLayoutGroup;
    procedure ImageEnVect1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageEnVect1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ImageEnVect1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPicClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure imgEVMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgEVMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    FMD: Boolean;
    FSelRect: TRect;
    FX, FY, FL, FT: Integer;
    FPicFile, FPassPic: String;
    fdbool, passbool, fxq: Boolean;
    procedure ShowPicture(vect: TImageEnVect; picFile: String);
    function GetDateStr(ADate: TDateTime): String;
    procedure ActionPictureExecute(Sender: TObject);
    procedure SetPicName(const pic: String);
    procedure AfterConstruction; override;
    procedure SetButtonEnabled();
  public
    property gPicName: String read FPicFile write SetPicName;
  end;

var
  FrameCarFaceCompare: TFrameCarFaceCompare;

implementation

{$R *.dfm}
{ TFrameCarFaceCompare }

procedure TFrameCarFaceCompare.ActionPictureExecute(Sender: TObject);
var
  URL, picFile: string;
begin
  dxLayoutItem14.Visible := False;
  dxLayoutGroup8.Visible := True;

  URL := FrameCarFaceGrid.FDMemTable1.FieldByName('FWQDZ').AsString +
    FrameCarFaceGrid.FDMemTable1.FieldByName('TP1').AsString;
  if URL = '' then
    exit;
  picFile := gSetup.DirSave + FormatDateTime('yyyymmddhhnnsszzz', now) + '.jpg';
  if not TFile.Exists(picFile) then
  begin
    TCommon.GetPic(URL, '', picFile);
  end;
  if TFile.Exists(picFile) then
  begin
    FPassPic := picFile;
    ShowPicture(imgEV, FPassPic);
  end;
end;

procedure TFrameCarFaceCompare.AfterConstruction;
begin
  inherited;
  ImageEnVect1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  ImageEnView1.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  dtKssj.Date := now - 3;
  dtJssj.Date := now;
  TLZDictionary.BindComboboxDEV(cboKDBH);
  FrameCarFaceGrid.ActionPicture.OnExecute := ActionPictureExecute;
end;

procedure TFrameCarFaceCompare.btnPicClick(Sender: TObject);
begin
  inherited;
  if picDlg.Execute then
  begin
    FPicFile := picDlg.FileName;
    ShowPicture(ImageEnVect1, FPicFile);
  end;
end;

procedure TFrameCarFaceCompare.btnSearchClick(Sender: TObject);
var
  URL, Param, jobID, pic, json, procc: String;
  n: Integer;
begin
  inherited;

  if FPicFile = '' then
    exit;

  pic := FormatDateTime('yyyymmddhhnnsszzz', now()) + '.jpg';
  if rbXQ.Checked and (FSelRect.Width * FSelRect.Height > 0) then
    CopyFile(PChar(FPicFile), PChar(pic), True)
  else
  begin
    ImageEnVect1.IO.SaveToFile(pic);
    FSelRect.Left := 0;
    FSelRect.Top := 0;
    FSelRect.Width := 0;
    FSelRect.Height := 0;
  end;

  ShowFrameWait;

  URL := EncodeString('http://' + gSetup.ftphost + ':8090/' + pic);

  if TCommon.FtpPutFile(gSetup.ftphost, gSetup.ftpuser, gSetup.FtpPwd, pic, pic,
    gSetup.ftpport) then
  begin
    Param := 'pic=' + URL + '&kssj=' + GetDateStr(dtKssj.Date) + '&jssj=' +
      GetDateStr(dtJssj.Date) + '&kdbh=' + TLZDictionary.gDicDev[2]
      [TLZDictionary.GetKey('DEV', '', cboKDBH.Text)].HikID + '&X=' +
      FSelRect.Left.ToString + '&Y=' + FSelRect.Top.ToString + '&W=' +
      FSelRect.Width.ToString + '&H=' + FSelRect.Height.ToString;
    jobID := TRequestItf.DbQuery('submitCarFaceCompareJob', Param);
    if jobID <> '' then
    begin
      Sleep(2000);
      n := 0;
      while n < 5 do
      begin
        procc := TRequestItf.DbQuery('getJobResultByTaskId', 'taskid=' + jobID);
        if procc = '1' then
        begin
          json := TRequestItf.DbQuery('getJobFinalResultByTaskId',
            'taskid=' + jobID);
          TJsonUtils.JSONToDataSet(json, FrameCarFaceGrid.FDMemTable1,
            '', False);
          dxLayoutGroup1.Visible := False;
          dxLayoutGroup5.Visible := True;
          dxLayoutItem14.Visible := True;
          dxLayoutGroup8.Visible := False;
          break;
        end;
        inc(n);
      end;
    end;
  end
  else
    Application.MessageBox('图片上传失败', '提示', MB_OK + MB_ICONERROR);
  DeleteFile(pic);
  FreeFrameWait;
end;

procedure TFrameCarFaceCompare.cxButton1Click(Sender: TObject);
begin
  inherited;
  if dxLayoutGroup8.Visible then
  begin
    dxLayoutItem14.Visible := True;
    dxLayoutGroup8.Visible := False;
  end
  else
  begin
    dxLayoutGroup1.Visible := True;
    dxLayoutGroup5.Visible := False;
    dxLayoutGroup7.Visible := True;
  end;
end;

procedure TFrameCarFaceCompare.cxButton2Click(Sender: TObject);
begin
  inherited;
  dxLayoutGroup1.Visible := False;
  dxLayoutGroup5.Visible := True;
end;

procedure TFrameCarFaceCompare.cxButton3Click(Sender: TObject);
begin
  inherited;
  FrameCarFaceGrid.FDMemTable1.Prior;
  if FrameCarFaceGrid.FDMemTable1.Bof then
    exit;
  SetButtonEnabled;
  ActionPictureExecute(nil);
end;

procedure TFrameCarFaceCompare.cxButton4Click(Sender: TObject);
begin
  inherited;
  FrameCarFaceGrid.FDMemTable1.Next;
  if FrameCarFaceGrid.FDMemTable1.Eof then
    exit;
  SetButtonEnabled;
  ActionPictureExecute(nil);
end;

function TFrameCarFaceCompare.GetDateStr(ADate: TDateTime): String;
begin
  Result := IntToStr(DateUtils.MilliSecondsBetween(ADate, 25569.3333333333));
end;

procedure TFrameCarFaceCompare.ImageEnVect1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMD := True;
  FX := X;
  FY := Y;
end;

procedure TFrameCarFaceCompare.ImageEnVect1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if fdbool then
  begin
    if rbFD.Checked then
    begin
      ImageEnVect1.Proc.ClearAllRedo;
      ImageEnVect1.Proc.CropSel;
      ImageEnVect1.DeSelect;
    end
    else if fxq and rbXQ.Checked then
    begin
      FSelRect.Left := ImageEnVect1.SelectedRect.X + FL;
      FSelRect.Top := ImageEnVect1.SelectedRect.Y + FT;
      FSelRect.Width := ImageEnVect1.SelectedRect.Width;
      FSelRect.Height := ImageEnVect1.SelectedRect.Height;
      ImageEnView1.IEBitmap.Allocate(ImageEnVect1.SelectedRect.Width,
        ImageEnVect1.SelectedRect.Height, ImageEnVect1.IEBitmap.PixelFormat);
      ImageEnVect1.IEBitmap.CopyRectTo(ImageEnView1.IEBitmap,
        ImageEnVect1.SelectedRect.X, ImageEnVect1.SelectedRect.Y, 0, 0,
        ImageEnVect1.SelectedRect.Width, ImageEnVect1.SelectedRect.Height);
      ImageEnView1.Update;
      ImageEnView1.Fit;
      ImageEnVect1.Paint;
    end;
    fdbool := False;
  end;
end;

procedure TFrameCarFaceCompare.ImageEnVect1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
  begin
    if FMD and ((FX <> X) or (FY <> Y)) then
    begin
      if rbFD.Checked then
      begin
        FL := FL + ImageEnVect1.XScr2Bmp(FX);
        FT := FT + ImageEnVect1.YScr2Bmp(FY);
      end
      else
        fxq := True;
      fdbool := True;
      FMD := False;
    end;
  end
  else
    ShowPicture(ImageEnVect1, FPicFile);
end;

procedure TFrameCarFaceCompare.imgEVMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if passbool then
  begin
    TImageEnVect(Sender).AutoFit := True;
    TImageEnVect(Sender).Proc.ClearAllRedo;
    TImageEnVect(Sender).Proc.SelCopyToClip();
    TImageEnVect(Sender).Proc.CropSel;
    TImageEnVect(Sender).DeSelect;
  end;
  passbool := False;
end;

procedure TFrameCarFaceCompare.imgEVMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
    passbool := True
  else
    ShowPicture(imgEV, FPassPic);
end;

procedure TFrameCarFaceCompare.SetButtonEnabled;
begin
  cxButton3.Enabled := not FrameCarFaceGrid.FDMemTable1.Bof;
  cxButton4.Enabled := not FrameCarFaceGrid.FDMemTable1.Eof;
end;

procedure TFrameCarFaceCompare.SetPicName(const pic: String);
begin
  FPicFile := pic;
  ShowPicture(ImageEnVect1, FPicFile);
end;

procedure TFrameCarFaceCompare.ShowPicture(vect: TImageEnVect; picFile: String);
begin
  if vect.Name = 'ImageEnVect1' then
  begin
    FMD := False;
    FL := 0;
    FT := 0;
    fdbool := False;
    fxq := False;
    with ImageEnVect1 do
    begin
      AutoFit := True;
      IO.NativePixelFormat := True;
      IO.LoadFromFile(picFile);
      Select(0, 0, 0, 0, iespReplace);
      MouseInteract := [miSelect];
      SelectionOptions := [iesoMoveable, iesoCanScroll];
    end;
  end
  else
  begin
    with vect do
    begin
      AutoFit := True;
      IO.NativePixelFormat := True;
      IO.LoadFromFile(picFile);
      Select(0, 0, 0, 0, iespReplace);
      MouseInteract := [miSelect];
      SelectionOptions := [iesoMoveable, iesoCanScroll];
    end;
  end;
end;

end.
