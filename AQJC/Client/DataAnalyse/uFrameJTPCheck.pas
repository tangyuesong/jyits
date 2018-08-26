unit uFrameJTPCheck;

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
  uGlobal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uCommon, uDictionary, uEntity,
  StrUtils, uVioThread,
  System.Generics.Collections, uFrameBz, hyieutils, iexBitmaps, hyiedefs,
  iesettings, iexRulers, System.Contnrs, imageenview, ieview, ievect,
  Vcl.Imaging.jpeg, uLookUpDataSource, sfContnrs, uFrameWait;

type
  TFrameJTPCheck = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    lgCenter: TdxLayoutGroup;
    lgRight: TdxLayoutGroup;
    dxLayoutSplitterItem2: TdxLayoutSplitterItem;
    lgInfo: TdxLayoutGroup;
    liButton: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutItem38: TdxLayoutItem;
    btnDelete: TcxButton;
    btnSave: TcxButton;
    edtclpp1: TcxTextEdit;
    edtClpp2: TcxTextEdit;
    edthphm: TcxTextEdit;
    edtCsys2: TcxTextEdit;
    cxImageList1: TcxImageList;
    dxLayoutItem5: TdxLayoutItem;
    tbJTP: TFDMemTable;
    lgGrid: TdxLayoutGroup;
    lgImage: TdxLayoutGroup;
    liVioTb: TdxLayoutItem;
    cxGrid1: TcxGrid;
    tvJTP: TcxGridDBTableView;
    tvJTPColumn2: TcxGridDBColumn;
    tvJTPColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    DataSource1: TDataSource;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    imgviopic: TImageEnVect;
    img1: TImageEnView;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    edtBklx: TcxTextEdit;
    edtCllx2: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    edtHpzl: TcxTextEdit;
    edtCllx1: TcxTextEdit;
    edtCsys1: TcxTextEdit;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    dxLayoutGroup10: TdxLayoutGroup;
    procedure AfterConstruction; override;
    procedure imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FFrameWait: TFrameWait;
    fdbool, FOK: Boolean;
    FPicFile: String;
    isfms: Integer;
    procedure LoadJTPRecord();
    procedure InitControl();
    procedure ShowVioPicture(picFile: string);
    procedure FreeFrameWait;
    procedure ShowFrameWait;
  public
  end;

implementation

{$R *.dfm}

procedure TFrameJTPCheck.AfterConstruction;
begin
  inherited;
  imgviopic.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
  if screen.Height < 960 then
  begin
    lgGrid.Visible := False;
    lgImage.AlignVert := avTop;
    lgInfo.AlignVert := avClient;
  end
  else
  begin
    lgGrid.Visible := True;
    lgGrid.AlignVert := avClient;
    lgImage.AlignVert := avBottom;
    lgInfo.AlignVert := avBottom;
  end;
end;

procedure TFrameJTPCheck.InitControl;
begin
  edthphm.Text := '';
  edtHpzl.Text := '';
  edtBklx.Text := '';
  edtclpp1.Text := '';
  edtCsys1.Text := '';
  edtCllx1.Text := '';
  edtClpp2.Text := '';
  edtCsys2.Text := '';
  edtCllx2.Text := '';
  imgviopic.Clear;
end;

procedure TFrameJTPCheck.LoadJTPRecord;
begin

end;

procedure TFrameJTPCheck.FreeFrameWait;
begin
  if Assigned(FFrameWait) then
    FFrameWait.Visible := False;
end;

procedure TFrameJTPCheck.imgviopicMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  rc: TRect;
  ww, hh: Integer;
begin
  if isfms = 1 then
  begin
    if fdbool then
    begin
      imgviopic.AutoFit := True;
      imgviopic.Proc.ClearAllRedo;
      imgviopic.Proc.SelCopyToClip();
      imgviopic.Proc.CropSel;
      imgviopic.DeSelect;
    end;
    fdbool := False;
    isfms := 3;
  end
  else
  begin
    rc.left := X - 63;
    rc.top := Y - 50;
    rc.Right := X + 64;
    rc.Bottom := Y + 50;

    with imgviopic do
    begin
      rc.left := XScr2Bmp(rc.left);
      rc.Right := XScr2Bmp(rc.Right);
      rc.top := YScr2Bmp(rc.top);
      rc.Bottom := YScr2Bmp(rc.Bottom);
    end;

    ww := rc.Right - rc.left + 1;
    hh := rc.Bottom - rc.top + 1;
    img1.IEBitmap.Allocate(ww, hh, imgviopic.IEBitmap.PixelFormat);
    imgviopic.IEBitmap.CopyRectTo(img1.IEBitmap, rc.left, rc.top, 0, 0, ww, hh);

    img1.Update;
    img1.Fit;
    imgviopic.Paint;
  end;
end;

procedure TFrameJTPCheck.imgviopicMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    fdbool := True;
    isfms := 1
  end
  else
  begin
    isfms := 3;
    ShowVioPicture(FPicFile);
  end;
  btnSave.SetFocus;
end;

procedure TFrameJTPCheck.ShowFrameWait;
begin
  if not Assigned(FFrameWait) then
  begin
    FFrameWait := TFrameWait.Create(self);
    FFrameWait.Parent := self;
    FFrameWait.top := (self.Height - FFrameWait.Height) div 2;
    FFrameWait.left := (self.Width - FFrameWait.Width) div 2;
  end;
  FFrameWait.Visible := True;
  Application.ProcessMessages;
end;

procedure TFrameJTPCheck.ShowVioPicture(picFile: string);
begin
  FPicFile := picFile;
  imgviopic.AutoFit := True;
  if not FileExists(FPicFile) then
  begin
    imgviopic.IO.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ZWTP.png');
    exit;
  end;

  with imgviopic.IO do
  begin
    NativePixelFormat := True;
    LoadFromFile(FPicFile);
  end;
  imgviopic.AutoFit := False;

  imgviopic.Select(0, 0, 0, 0, iespReplace);
  imgviopic.MouseInteract := [miSelect];
  imgviopic.SelectionOptions := [iesoMoveable, iesoCanScroll];
end;

end.
