unit UFrameQDZSB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics,
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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, Generics.Collections,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMemo, cxMaskEdit, cxButtonEdit,
  cxTextEdit, uEntity, uCommon, uRequestItf, uJsonUtils, hyieutils, iexBitmaps,
  hyiedefs, iesettings, iexRulers, System.Contnrs, imageenview, ieview, uGlobal,
  cxDropDownEdit;

type
  TFrameQDZSB = class(TdxDialogBaseFrame)
    EdtSBDM: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    EdtSBMC: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    MmoBZ: TcxMemo;
    dxLayoutItem8: TdxLayoutItem;
    EdtSBZL: TcxCombobox;
    dxLayoutItem10: TdxLayoutItem;
    Img3: TImageEnView;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutGroup5: TdxLayoutGroup;
    Img1: TImageEnView;
    dxLayoutItem12: TdxLayoutItem;
    Img2: TImageEnView;
    dxLayoutItem13: TdxLayoutItem;
    dlgOpen1: TOpenDialog;
    procedure btnSaveClick(Sender: TObject);
    procedure Img1Click(Sender: TObject);
    procedure EdtSBZLPropertiesCloseUp(Sender: TObject);
  private
    FQDZDM: string;
    FOK: TClose;
    FQDZRYSL: string;
    FDicSBZL: TDictionary<string, TQDZSB>;
    procedure Close;
    function GetQDZ: TQDZSB;
    procedure SetQDZ(const Value: TQDZSB);
    { Private declarations }
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    property OnOK: TClose read FOK write FOK;
    property QDZSBlist: TQDZSB read GetQDZ write SetQDZ;
    property QDZDM: string read FQDZDM write FQDZDM;
    property QDZRYSL: string read FQDZRYSL write FQDZRYSL;
  end;

var
  FrameQDZSB: TFrameQDZSB;

implementation

{$R *.dfm}

{ TFrameQDZSB }

procedure TFrameQDZSB.AfterConstruction;
var
  json: string;
  list: TList<TQDZSB>;
  item: TQDZSB;
begin
  inherited;
  self.OnClose := Close;
  FDicSBZL := TDictionary<string, TQDZSB>.Create;
  json := TRequestItf.pDbQuery('GETT_QDZ_DEVICE', '');
  list := TJSONUtils.JsonToRecordList<TQDZSB>(json);
  for item in list do
  begin
    if not FDicSBZL.ContainsKey(item.SBZL) then
    begin
      edtSBZL.Properties.Items.Add(item.SBZL);
      FDicSBZL.Add(item.SBZL, item);
    end;
  end;
  list.Free;
end;

procedure TFrameQDZSB.BeforeDestruction;
begin
  inherited;
  FDicSBZL.Free;
end;

procedure TFrameQDZSB.btnSaveClick(Sender: TObject);
var
  s: string;
  tmpqdzSB: TQDZSB;
  b, path, fn1, fn2, fn3: string;
begin
  inherited;
  if EdtSBDM.Text = '' then
  begin
    Application.MessageBox('设备代码不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EdtSBMC.Text = '' then
  begin
    Application.MessageBox('设备名称不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EdtSBZL.Text = '' then
  begin
    Application.MessageBox('设备种类不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  path := '/QDZ/SB/';
  fn1 := QDZSBlist.SBDM + '_1.jpg';
  fn2 := QDZSBlist.SBDM + '_2.jpg';
  fn3 := QDZSBlist.SBDM + '_3.jpg';
  TCommon.getpic(img1, fn1);
  TCommon.getpic(img2, fn2);
  TCommon.getpic(img3, fn3);
  // 图片上传ftp

  tmpqdzSB := QDZSBlist;
  if Editid = TEditStatus.esNew then
    tmpqdzSB.systemid := '';

  if FileExists(gSetup.DirSave + fn1) then
    tmpqdzSB.TP1 := 'http://' + gSetup.FtpHost + ':8090' + path + fn1;
  if FileExists(gSetup.DirSave + fn2) then
    tmpqdzSB.TP2 := 'http://' + gSetup.FtpHost + ':8090' + path + fn2;
  if FileExists(gSetup.DirSave + fn3) then
    tmpqdzSB.TP3 := 'http://' + gSetup.FtpHost + ':8090' + path + fn3;
  s := TJSONUtils.RecordToString<TQDZSB>(@tmpqdzSB);

  if Editid = TEditStatus.esNew then
  begin
    b := TRequestItf.DbQuery('ADDT_QDZ_DEVICE', s);
    if b = '0' then
    begin
      Application.MessageBox('新增失败,该数据已添加', '提示', MB_OK + MB_ICONINFORMATION);
      exit;
    end
    else
      Application.MessageBox('新增成功', '提示', MB_OK + MB_ICONINFORMATION);
    ClearControls(Self);
  end;
  if Editid = TEditStatus.esModify then
  begin
    TRequestItf.PDbQuery('ModifyT_QDZ_DEVICE', s);
    if b = '0' then
    begin
      Application.MessageBox('修改失败', '提示', MB_OK + MB_ICONINFORMATION);
      exit;
    end
    else
      Application.MessageBox('修改成功', '提示', MB_OK + MB_ICONINFORMATION);
    btnExitClick(nil);
  end;
  if b <> '0' then
  begin
    if FileExists(gSetup.DirSave + fn1) then
      if not TCommon.FtpPutFile(gSetup.FtpHost, gSetup.FtpUser, gSetup.FtpPwd, gSetup.DirSave + fn1, path + fn1, gSetup.FtpPort) then
        Application.MessageBox('图片1上传失败', '提示', MB_OK + MB_ICONINFORMATION);
    if FileExists(gSetup.DirSave + fn2) then
      if not TCommon.FtpPutFile(gSetup.FtpHost, gSetup.FtpUser, gSetup.FtpPwd, gSetup.DirSave + fn2, path + fn2, gSetup.FtpPort) then
        Application.MessageBox('图片2上传失败', '提示', MB_OK + MB_ICONINFORMATION);
    if FileExists(gSetup.DirSave + fn3) then
      if not TCommon.FtpPutFile(gSetup.FtpHost, gSetup.FtpUser, gSetup.FtpPwd, gSetup.DirSave + fn3, path + fn3, gSetup.FtpPort) then
        Application.MessageBox('图片3上传失败', '提示', MB_OK + MB_ICONINFORMATION);
  end;
  if Assigned(OnOK) then
  begin
    OnOK;
  end;
end;

procedure TFrameQDZSB.Close;
begin
  ClearControls(Self);
end;

procedure TFrameQDZSB.EdtSBZLPropertiesCloseUp(Sender: TObject);
var
  dev: TQDZSB;
begin
  inherited;
  if Editid = TEditStatus.esNew then
  begin
    if FDicSBZL.ContainsKey(edtsbzl.Text) then
    begin
      dev := FDicSBZL[edtsbzl.Text];
      dev.SBDM := '';
      dev.QDZDM := QDZDM;
      SetQDZ(dev);
    end;
  end;
end;

function TFrameQDZSB.GetQDZ: TQDZSB;
begin
  Result.QDZDM := QDZDM;
  Result.SBDM := EdtSBDM.Text;
  Result.SBMC := EdtSBMC.Text;
  Result.SBZL := EdtSBZL.Text;
  Result.SYSTEMID := id;
  Result.BZ:=MmoBZ.Text;
end;

procedure TFrameQDZSB.Img1Click(Sender: TObject);
var
  fn: string;
begin
  inherited;
  if dlgOpen1.Execute then
  begin
    fn := dlgOpen1.FileName;
    if (FileExists(fn)) and (UpperCase(ExtractFileExt(fn)) = '.JPG') then
      (Sender as TImageEnView).IO.LoadFromFileJpeg(fn);
  end;
end;

procedure TFrameQDZSB.SetQDZ(const Value: TQDZSB);
begin
  QDZDM := Value.QDZDM;
  EdtSBDM.Text := Value.SBDM;
  EdtSBMC.Text := Value.SBMC;
  EdtSBZL.Text := Value.SBZL;
  id := Value.SYSTEMID;
  MmoBZ.Text:=Value.BZ;

  // 图片下载
  if TCommon.GetPic(Value.TP1, '', gSetup.DirSave + 'temp1.jpg') then
    img1.IO.LoadFromFileJpeg(gSetup.DirSave + 'temp1.jpg');
  if TCommon.GetPic(Value.TP2, '', gSetup.DirSave + 'temp2.jpg') then
    img2.IO.LoadFromFileJpeg(gSetup.DirSave + 'temp2.jpg');
  if TCommon.GetPic(Value.TP3, '', gSetup.DirSave + 'temp3.jpg') then
    img3.IO.LoadFromFileJpeg(gSetup.DirSave + 'temp3.jpg');
end;

end.

