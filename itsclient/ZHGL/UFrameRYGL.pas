unit UFrameRYGL;

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
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, hyieutils, iexBitmaps, hyiedefs, iesettings, iexRulers,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, System.Contnrs,
  imageenview, ieview, uEntity, uCommon, uJsonUtils, uRequestItf, uGlobal;

type
  TFrameRYGL = class(TdxDialogBaseFrame)
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    Img1: TImageEnView;
    dxLayoutItem1: TdxLayoutItem;
    BtnPath: TcxButtonEdit;
    dxLayoutItem2: TdxLayoutItem;
    EdtSFZHM: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    EdtXM: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    EdtDW: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    EdtDZ: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    EdtSJ: TcxTextEdit;
    dxLayoutItem9: TdxLayoutItem;
    EdtXL: TcxTextEdit;
    dxLayoutItem10: TdxLayoutItem;
    dlgOpen1: TOpenDialog;
    procedure BtnPathClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure EdtSFZHMKeyPress(Sender: TObject; var Key: Char);
  private
    Path, fn1: string;
    FOK: TClose;
    FQDZDM: string;
    FQDZRYSL: string;
    function GetQDZ: TQDZRY;
    procedure SetQDZ(const Value: TQDZRY);
    { Private declarations }
  public
    { Public declarations }
    property OnOK: TClose read FOK write FOK;
    property QDZRYlist: TQDZRY read GetQDZ write SetQDZ;
    property QDZDM: string read FQDZDM write FQDZDM;
    property QDZRYSL: string read FQDZRYSL write FQDZRYSL;
  end;

var
  FrameRYGL: TFrameRYGL;

implementation

{$R *.dfm}

{ TFrameRYGL }

procedure TFrameRYGL.BtnPathClick(Sender: TObject);
begin
  inherited;
  if dlgOpen1.Execute then
  begin
    BtnPath.Text := dlgOpen1.FileName;
    if FileExists(BtnPath.Text) then
      img1.IO.LoadFromFileJpeg(BtnPath.Text);
  end;

end;

procedure TFrameRYGL.btnSaveClick(Sender: TObject);
var
  s: string;
  tmpqdzRY: TQDZRY;
  b: string;
begin
  inherited;
  if EdtXM.Text = '' then
  begin
    Application.MessageBox('姓名不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EdtSFZHM.Text = '' then
  begin
    Application.MessageBox('身份证不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EdtSJ.Text = '' then
  begin
    Application.MessageBox('手机号码不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  path := '/QDZ/RY/';
  fn1 := QDZRYlist.SFZHM + '_1.jpg';
  TCommon.getpic(img1, fn1);
  // 图片上传ftp

  tmpqdzRY := QDZRYlist;
  if Editid = TEditStatus.esNew then
    tmpqdzRY.systemid := '';

  if FileExists(gSetup.DirSave + fn1) then
    tmpqdzRY.TP1 := 'http://' + gSetup.FtpHost + ':8090' + path + fn1;
  s := TJSONUtils.RecordToString<TQDZRY>(@tmpqdzRY);

  if Editid = TEditStatus.esNew then
  begin
    b := TRequestItf.DbQuery('ADDT_QDZ_USER', s);
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
    TRequestItf.PDbQuery('ModifyT_QDZ_USER', s);
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
  end;
  if Assigned(OnOK) then
  begin
    OnOK();
  end;
end;

procedure TFrameRYGL.EdtSFZHMKeyPress(Sender: TObject; var Key: Char);
var
  drvinfo: TDrvInfo;
begin
  inherited;
  if Key = #13 then
  begin
    drvinfo := TCommon.GetDrvInfo(edtsfzhm.Text);
    EdtXM.Text := drvinfo.XM;
    EdtDZ.Text := drvinfo.LXZSXXDZ;
    EdtSJ.Text := drvinfo.SJHM;
  end;

end;

function TFrameRYGL.GetQDZ: TQDZRY;
begin
  Result.QDZDM := QDZDM;
  Result.SFZHM := EdtSFZHM.Text;
  Result.XM := EdtXM.Text;
  Result.DW := EdtDW.Text;
  Result.LXDZ := EdtDZ.Text;
  Result.LXFS := EdtSJ.Text;
  Result.XL := EdtXL.Text;
  Result.SYSTEMID := id;
end;

procedure TFrameRYGL.SetQDZ(const Value: TQDZRY);
begin
  QDZDM := Value.QDZDM;
  EdtSFZHM.Text := Value.SFZHM;
  EdtXM.Text := Value.XM;
  EdtDW.Text := Value.DW;
  EdtDZ.Text := Value.LXDZ;
  EdtSJ.Text := Value.LXFS;
  EdtXL.Text := Value.XL;
  id := Value.systemid;
  // 图片下载
  if TCommon.GetPic(value.TP1, '', gSetup.DirSave + 'temp1.jpg') then
    img1.IO.LoadFromFileJpeg(gSetup.DirSave + 'temp1.jpg');
end;

end.

