unit UFrameQDZGL;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, uFrameMap,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxContainer, cxEdit, Vcl.StdCtrls,
  Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, cxTextEdit, cxClasses,
  cxButtons, dxLayoutControl, uGlobal, uEntity, Udictionary, uCommon, cxImage,
  cxMaskEdit, cxButtonEdit, hyieutils, iexBitmaps, hyiedefs, iesettings,
  iexRulers, System.Contnrs, imageenview, ieview, uRequestItf, uJsonUtils;

type
  TOK = procedure(obj: TQDZ) of object;

type
  TFrameQDZGL = class(TdxDialogBaseFrame)
    EdtQDZDM: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    EdtQDZMC: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    EDTJD: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    EDTWD: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    EDTGLRY: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    EDTLXFS: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    img1: TImageEnView;
    dxLayoutItem10: TdxLayoutItem;
    img2: TImageEnView;
    dxLayoutItem11: TdxLayoutItem;
    img3: TImageEnView;
    dxLayoutItem12: TdxLayoutItem;
    dlgOpen1: TOpenDialog;
    btnMap: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
    procedure EDTJDKeyPress(Sender: TObject; var Key: Char);
    procedure img1Click(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
  private
    fn1, fn2, fn3, path, rysl, sbsl, spsl: string;
    FOK: TOK;
    FFrameMap: TFrameMap;
    function GetQDZ: TQDZ;
    procedure SetQDZ(const Value: TQDZ);
    procedure FrameMapBtnSaveClick(Sender: TObject);
  public
    property OnOK: TOK read FOK write FOK;
    property QDZlist: TQDZ read GetQDZ write SetQDZ;
  end;

var
  FrameQDZGL: TFrameQDZGL;

implementation

{$R *.dfm}
{ TFrameQDZGL }

procedure TFrameQDZGL.btnMapClick(Sender: TObject);
begin
  inherited;
  if not Assigned(FFrameMap) then
  begin
    FFrameMap := TFrameMap.Create(self);
    FFrameMap.Parent := Self.Parent;
    FFrameMap.Align := alClient;
    FFrameMap.btnSave.OnClick := self.FrameMapBtnSaveClick;
  end;
  FFrameMap.Show;
end;

procedure TFrameQDZGL.FrameMapBtnSaveClick(Sender: TObject);
begin
  self.EDTJD.Text := FFrameMap.edtLng.Text;
  self.EDTWD.Text := FFrameMap.edtLat.Text;
  FFrameMap.Hide;
end;

procedure TFrameQDZGL.btnSaveClick(Sender: TObject);
var
  s: string;
  tmpqdz: TQDZ;
  b: string;
begin
  inherited;
  if EdtQDZDM.Text = '' then
  begin
    Application.MessageBox('劝导站编号不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EdtQDZMC.Text = '' then
  begin
    Application.MessageBox('劝导站名称不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EDTJD.Text = '' then
  begin
    Application.MessageBox('劝导站经度不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EDTWD.Text = '' then
  begin
    Application.MessageBox('劝导站纬度不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  path := '/QDZ/';
  fn1 := QDZlist.QDZDM + '_1.jpg';
  fn2 := Copy(fn1, 1, Length(fn1) - 5) + '2.jpg';
  fn3 := Copy(fn1, 1, Length(fn1) - 5) + '3.jpg';
  TCommon.getpic(img1, fn1);
  TCommon.getpic(img2, fn2);
  TCommon.getpic(img3, fn3);
  // 图片上传ftp

  tmpqdz := QDZlist;
  if Editid = TEditStatus.esNew then
  begin
    tmpqdz.systemid := '';
    tmpqdz.rysl := '0';
    tmpqdz.sbsl := '0';
    tmpqdz.spsl := '0';

  end;
  if FileExists(gSetup.DirSave + fn1) then
    tmpqdz.TP1 := 'http://' + gSetup.FtpHost + ':8090' + path + fn1;
  if FileExists(gSetup.DirSave + fn2) then
    tmpqdz.TP2 := 'http://' + gSetup.FtpHost + ':8090' + path + fn2;
  if FileExists(gSetup.DirSave + fn3) then
    tmpqdz.TP3 := 'http://' + gSetup.FtpHost + ':8090' + path + fn3;
  tmpqdz.GXSJ := FormatDateTime('yyyy/mm/dd hh:mm:ss', Now);
  s := TJSONUtils.RecordToString<TQDZ>(@tmpqdz);

  if Editid = TEditStatus.esNew then
  begin
    b := TRequestItf.DbQuery('ADDT_QDZ_DEPT', s);
    if b = '0' then
    begin
      Application.MessageBox('新增失败,该数据已添加', '提示', MB_OK + MB_ICONINFORMATION);
      exit;
    end
    else
      Application.MessageBox('新增成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
  if Editid = TEditStatus.esModify then
  begin
    TRequestItf.PDbQuery('ModifyT_QDZ_DEPT', s);
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
    OnOK(tmpqdz);
  end;

end;

procedure TFrameQDZGL.EDTJDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', #8, #13, #127, '.', '-']) then
    Key := #0;

end;

function TFrameQDZGL.GetQDZ: TQDZ;
begin
  Result.QDZDM := EdtQDZDM.Text;
  Result.QDZMC := EdtQDZMC.Text;
  Result.JD := EDTJD.Text;
  Result.WD := EDTWD.Text;
  Result.GLRY := EDTGLRY.Text;
  Result.LXFS := EDTLXFS.Text;
  Result.rysl := rysl;
  Result.sbsl := sbsl;
  Result.spsl := spsl;
  Result.SYSTEMID := id;
end;

procedure TFrameQDZGL.img1Click(Sender: TObject);
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

procedure TFrameQDZGL.SetQDZ(const Value: TQDZ);
begin
  EdtQDZDM.Text := Value.QDZDM;
  EdtQDZMC.Text := Value.QDZMC;
  EDTJD.Text := Value.JD;
  EDTWD.Text := Value.WD;
  EDTGLRY.Text := Value.GLRY;
  EDTLXFS.Text := Value.LXFS;
  rysl := Value.rysl;
  sbsl := Value.sbsl;
  spsl := Value.spsl;
  id := Value.systemid;
  // 图片下载
  if TCommon.GetPic(value.TP1, '', gSetup.DirSave + 'temp1.jpg') then
    img1.IO.LoadFromFileJpeg(gSetup.DirSave + 'temp1.jpg');
  if TCommon.GetPic(value.TP2, '', gSetup.DirSave + 'temp2.jpg') then
    img2.IO.LoadFromFileJpeg(gSetup.DirSave + 'temp2.jpg');
  if TCommon.GetPic(value.TP3, '', gSetup.DirSave + 'temp3.jpg') then
    img3.IO.LoadFromFileJpeg(gSetup.DirSave + 'temp3.jpg');
end;

end.

