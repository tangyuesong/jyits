unit UFrameJSRYQZ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
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
  dxLayoutContainer, hyieutils, iexBitmaps, hyiedefs, iesettings, iexRulers,
  cxContainer, cxEdit, cxTextEdit, System.Contnrs, imageenview, ieview,
  cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl, dxLayoutcxEditAdapters,
  cxCheckBox, UCommon, uGlobal, uEntity, Udictionary, USetup, Vcl.ExtCtrls,
  frxClass, uRequestItf, System.Generics.Collections, uJsonUtils;

type
  TOK = procedure(obj: TJSRYQZ) of object;

  TPrint = procedure(obj: TJSRYQZ) of object;

type
  TFrameJSRYQZ = class(TdxDialogBaseFrame)
    dxLayoutGroup5: TdxLayoutGroup;
    edtXM: TcxTextEdit;
    edtSFZHM: TcxTextEdit;
    edtXB: TcxTextEdit;
    edtSFZHM18: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    edtLXDZ: TcxTextEdit;
    dxLayoutItem26: TdxLayoutItem;
    dxLayoutItem32: TdxLayoutItem;
    dxLayoutGroup10: TdxLayoutGroup;
    dxLayoutGroup12: TdxLayoutGroup;
    img1: TImageEnView;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    Img2: TImageEnView;
    btnsearch: TcxButton;
    chkprint: TcxCheckBox;
    dxLayoutItem35: TdxLayoutItem;
    dxLayoutItem36: TdxLayoutItem;
    Timer1: TTimer;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutGroup8: TdxLayoutGroup;
    procedure btnSaveClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnsearchClick(Sender: TObject);
    procedure img1DShowNewFrame(Sender: TObject);
    procedure Img2DShowNewFrame(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure edtjdsbh9KeyPress(Sender: TObject; var Key: Char);
    procedure edtSFZHM18KeyPress(Sender: TObject; var Key: Char);
  private
    fn1, fn2, path, ym, d: string;
    FOK: TOK;
    FClose: TClose;
    FEditID: TEditStatus;
    Fid: string;
    Fcljg: string;
    Fprint: TPrint;
    FOneVideoOpened: Boolean;
    function GetJSRYQZ: TJSRYQZ;
    procedure SetJSRYQZ(const Value: TJSRYQZ);
    procedure getpic(img: TImageEnView; fn: string);
    procedure showpic(b: Boolean);
    procedure ImgvideoConnect(img: TImageEnView; w: Integer = 1600;
      h: Integer = 1200; idx: Integer = 0; input: string = '0');
    procedure imgshowFrame(img: TImageEnView);
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
    property Drvlist: TJSRYQZ read GetJSRYQZ write SetJSRYQZ;
    property OnOK: TOK read FOK write FOK;
    property OnPrint: TPrint read Fprint write Fprint;
  end;

var
  FrameJSRYQZ: TFrameJSRYQZ;

implementation

{$R *.dfm}

procedure TFrameJSRYQZ.ImgvideoConnect(img: TImageEnView; w, h, idx: Integer;
  input: string);
begin
  if (not img.IO.DShowParams.Connected) then
  begin
    // set video source as index of IO.DShowParams.VideoInputs
    img.IO.DShowParams.SetVideoInput(idx, StrToIntDef(input, 0),
      // set this parameter if you have more than one camera with same name
      w, // capture width
      h, // capture height
      '' // format
      );
    // enable frame grabbing
    img.IO.DShowParams.EnableSampleGrabber := true;
    // connect to the video input
    img.IO.DShowParams.Connect;
  end;
end;

procedure TFrameJSRYQZ.getpic(img: TImageEnView; fn: string);
begin
  img.IO.DShowParams.GetSample(img.IEBitmap);
  img.IO.SaveToFileJpeg(gSetup.DirSave + '\' + fn);
  img.Update;
  // img.IO.DShowParams.Disconnect;
end;

procedure TFrameJSRYQZ.AfterConstruction;
begin
  inherited;
  FOneVideoOpened := False;
end;

procedure TFrameJSRYQZ.btnExitClick(Sender: TObject);
begin
  inherited;
  if (img1.IO.DShowParams.Connected) then
    img1.IO.DShowParams.Disconnect;
  if (Img2.IO.DShowParams.Connected) then
    Img2.IO.DShowParams.Disconnect;
end;

procedure TFrameJSRYQZ.btnSaveClick(Sender: TObject);
var
  s: string;
  tmpvio: TJSRYQZ;
  b: string;
begin
  inherited;
  if edtSFZHM.Text = '' then
  begin
    Application.MessageBox('当事人不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  ym := FormatDateTime('yyyymm', now);
  d := FormatDateTime('dd', now);
  path := '/' + ym + '/' + d + '/';
  fn1 := FormatDateTime('yyyymmddhhmmsszzz', now) + '_1.jpg';
  fn2 := Copy(fn1, 1, Length(fn1) - 5) + '2.jpg';
  getpic(img1, fn1);
  getpic(Img2, fn2);
  showpic(true);
  // 图片上传ftp

  tmpvio := Drvlist;
  if Editid = TEditStatus.esNew then
    tmpvio.systemid := '';
  s := TJSONUtils.RecordToString<TJSRYQZ>(@tmpvio);

  if Editid = TEditStatus.esNew then
  begin
    b := TRequestItf.PDbQuery('ADDT_JSRYQZ', s);
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
    TRequestItf.PDbQuery('ModifyT_JSRYQZ', s);
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
    if FileExists(gSetup.DirSave + '\' + fn1) then
      TCommon.FtpPutFile(gGpySetup.FtpHost, 'jfyh', 'jfyh',
        gSetup.DirSave + '\' + fn1, path + fn1, 31);
    if FileExists(gSetup.DirSave + '\' + fn2) then
      TCommon.FtpPutFile(gGpySetup.FtpHost, 'jfyh', 'jfyh',
        gSetup.DirSave + '\' + fn2, path + fn2, 31);
  end;
  if Assigned(OnOK) then
  begin
    OnOK(tmpvio);
  end;
  if chkprint.Checked then
  begin
    OnPrint(tmpvio);
  end;
  showpic(False);
  ClearControls(self);
  edtSFZHM18.SetFocus;
end;

procedure TFrameJSRYQZ.btnsearchClick(Sender: TObject);
var
  TempDrv:TDrvInfo;
  tempJSRYPZ:TJSRYQZ;
  xb:string;
begin
  inherited;
  TempDrv:=TCommon.GetDrvInfo(edtSFZHM18.Text) ;
  tempJSRYPZ.SFZHM:= TempDrv.sfzmhm;
  if TempDrv.xb='1' then xb:='男' else xb:='女';
  tempJSRYPZ.XB:=  xb;
  tempJSRYPZ.XM:= TempDrv.xm;
  tempJSRYPZ.LXZSXXDZ:=TempDrv.lxzsxxdz;
  Drvlist:=tempJSRYPZ;
end;

procedure TFrameJSRYQZ.edtjdsbh9KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    btnsearchClick(nil);
    btnSave.SetFocus;
  end;

end;

procedure TFrameJSRYQZ.edtSFZHM18KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if  Key=#13 then
    btnsearchClick(nil);
end;

function TFrameJSRYQZ.GetJSRYQZ: TJSRYQZ;
begin

  Result.sfzhm := Trim(edtSFZHM.Text);
  Result.xm := edtXM.Text;
  Result.xb := edtxb.Text;
  Result.lxzsxxdz := edtLXDZ.Text;
  Result.cljg := gUser.DWDM;
  Result.cljgmc := TLZDictionary.gDicDept[gUser.DWDM].DWMC;
  Result.lrr := gUser.YHXM;
  Result.lrsj :=FormatDateTime('yyyy-mm-dd hh:mm:ss',now);
  Result.systemid := Id;
  Result.tplj := gGpySetup.URL + path;
  Result.tp1 := fn1;
  Result.tp2 := fn2;
  Result.gxsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
  Result.YHBH := gUser.YHBH;
end;

procedure TFrameJSRYQZ.img1DShowNewFrame(Sender: TObject);
begin
  inherited;
  imgshowFrame(img1);
end;

procedure TFrameJSRYQZ.Img2DShowNewFrame(Sender: TObject);
begin
  inherited;
  imgshowFrame(Img2);
end;

procedure TFrameJSRYQZ.imgshowFrame(img: TImageEnView);
begin
  // copy current sample to ImageEnView bitmap
  img.IO.DShowParams.GetSample(img.IEBitmap);
  // refresh ImageEnView1
  img.Update;
  // capturing AVI
  // if SpeedButton2.Down then
  img.IO.SaveToAVI;
end;

procedure TFrameJSRYQZ.SetJSRYQZ(const Value: TJSRYQZ);
begin
  with Value do
  begin
    edtSFZHM.text:=Value.SFZHM;
    edtXM.Text:=Value.XM;
    edtXB.Text:=Value.XB;
    edtLXDZ.Text:=Value.LXZSXXDZ;
    Id := Value.systemid;
  end;

end;

procedure TFrameJSRYQZ.showpic(b: Boolean);
begin
  if b then
  begin
    img1.IO.LoadFromFileJpeg(gSetup.DirSave + '\' + fn1);
    Img2.IO.LoadFromFileJpeg(gSetup.DirSave + '\' + fn2);
  end;
  { else
    begin
    img1.Visible := False;
    imgshow2.Visible := False;
    end; }
end;

procedure TFrameJSRYQZ.Timer1Timer(Sender: TObject);
begin
  inherited;
  gGpySetup := TLZsetup.GpySetup;
  try

    TCommon.showVideo(gGpySetup.input1, gGpySetup.idx1.ToInteger,
      gGpySetup.Width1.ToInteger, gGpySetup.Height1.ToInteger, img1);
    img1.IO.DShowParams.Run;

    TCommon.showVideo(gGpySetup.input2, gGpySetup.idx2.ToInteger,
      gGpySetup.Width2.ToInteger, gGpySetup.Height2.ToInteger, Img2);
    Img2.IO.DShowParams.Run;
    Timer1.Enabled := False;

  except
    Timer1.Enabled := False;
  end;
end;

end.
