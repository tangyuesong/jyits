unit uBugEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutControlAdapters, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, dxLayoutContainer, cxClasses, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, cxCheckBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cefvcl,
  uJsonUtils, uEntity, uCommon, uRequestItf, uGlobal, cef.JsExtented,
  LatLngHelper, Vcl.ExtCtrls, Udictionary, cxMemo, dxCustomTileControl,
  dxTileControl, Vcl.ExtDlgs, IOUtils, NetEncoding, cxImage, cxScrollBox;

type
  Tclose = procedure of object;

  TBug = record
    SYSTEMID,Categery,Title,Content,FXR,LXDH,FXRXM,FXRDWMC,FXRDWDM,CLR,CLFF: string;
    Url1, Url2, Url3, Url4, Url5: string;
    FXSJ,CLSJ: TDateTime;
    Status: integer;
    Flag: boolean;
  end;

type
  TFrameBugEdit = class(TdxFrame)
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    BtnSave: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    BtnExit: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    edtTitle: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    cboCategery: TcxComboBox;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    memMS: TcxMemo;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    edtBZR: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    edtBZSJ: TcxTextEdit;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem7: TdxLayoutItem;
    cboStatus: TcxComboBox;
    OpenPictureDialog1: TOpenPictureDialog;
    dxLayoutItem9: TdxLayoutItem;
    edtLXDH: TcxTextEdit;
    liHFNR: TdxLayoutItem;
    memHFNR: TcxMemo;
    cxScrollBox1: TcxScrollBox;
    dxLayoutItem10: TdxLayoutItem;
    cxImage1: TcxImage;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    procedure BtnExitClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure cxImage1Click(Sender: TObject);
  private
    Fclose: Tclose;
    FEditStatus: TEditStatus;
    FBug: TBug;
    procedure SetStatus(const Value: TEditStatus);
    procedure SetBug(const Value: TBug);
    procedure ShowPictures;
  public
    property onclose: Tclose read Fclose write Fclose;
    property EditStatus: TEditStatus read FEditStatus write SetStatus;
    property Bug: TBug read FBug write SetBug;
    procedure AfterConstruction; override;
  end;
var
  FrameBugEdit: TFrameBugEdit;

implementation

{$R *.dfm}

{ TFrameBugEdit }

procedure TFrameBugEdit.AfterConstruction;
begin

end;

procedure TFrameBugEdit.SetBug(const Value: TBug);
begin
  FBug := Value;
  cboCategery.Text := FBug.Categery;
  edtTitle.Text := FBug.Title;
  memMS.Text := FBug.Content;
  cboStatus.ItemIndex := FBug.Status;
  edtBZR.Text := FBug.FXRDWMC + ' - ' + FBug.FXRXM;
  edtBZSJ.Text := FormatDateTime('yyyy-mm-dd hh:nn', FBug.FXSJ);
  edtLXDH.Text := FBug.LXDH;
  memHFNR.Text := FBug.CLFF;
  ShowPictures;
end;

procedure TFrameBugEdit.ShowPictures;
  procedure AddItem(img: TcxImage; url: string);
  var
    localPath: string;
  begin
    if url = '' then
    begin
      img.Clear;
      img.Properties.Caption := '浏览……';
    end
    else begin
      img.Width := img.Parent.Width div 3 - 3;
      localPath := gSetup.DirSave + TGuid.NewGuid.ToString + '.jpg';
      if TCommon.Getpic(url, '', localPath) then
        img.Picture.LoadFromFile(localPath);
    end;
  end;
var
  i: integer;
begin
  AddItem(cxImage1, TNetEncoding.Base64.Decode(FBug.Url1));
  AddItem(cxImage2, TNetEncoding.Base64.Decode(FBug.Url2));
  AddItem(cxImage3, TNetEncoding.Base64.Decode(FBug.Url3));
end;

procedure TFrameBugEdit.SetStatus(const Value: TEditStatus);
begin
  FEditStatus := Value;
  cboCategery.Enabled := Value = TEditStatus.esNew;
  edtTitle.Enabled := Value = TEditStatus.esNew;
  memMS.Enabled := Value = TEditStatus.esNew;
  cboStatus.Enabled := Value = TEditStatus.esApprove;
  edtBZR.Enabled := false;
  edtBZSJ.Enabled := Value = TEditStatus.esNew;
  edtLXDH.Enabled := Value = TEditStatus.esNew;
  liHFNR.Visible := Value = TEditStatus.esApprove;
  btnSave.Enabled := (Value = TEditStatus.esApprove)or(Value = TEditStatus.esNew);
end;

procedure TFrameBugEdit.BtnSaveClick(Sender: TObject);
  function GetUrl(paramName: string; img: TcxImage): string;
  var
    filename, picPath, url: string;
    item: TdxTileControlItem;
    i: integer;
  begin
    result := '';
    picPath := img.Properties.Caption;
    if TFile.Exists(picPath) then
    begin
      filename := TPath.GetFileName(picPath);
      url := 'http://' + gSetup.ftphost + ':8090/' + filename;
      if TCommon.FtpPutFile(gSetup.ftphost, gSetup.ftpuser, gSetup.FtpPwd, picPath, filename, gSetup.ftpport) then
        result := '&' + paramName + '=' + TNetEncoding.Base64.Encode(url);
    end;
  end;
var
  s, url:string;
begin
  inherited;
  if EditStatus = TEditStatus.esNew then
  begin
    url := GetUrl('url1', cxImage1) + GetUrl('url2', cxImage2) + GetUrl('url3', cxImage3);
    s := 'categery=' + cboCategery.Text +
      '&title=' + edtTitle.Text +
      '&content=' + memMS.Text +
      '&FXR=' + gUser.yhbh +
      '&LXDH=' + edtLXDH.Text +
      '&FXRXM=' + gUser.YHXM +
      '&FXRDWDM=' + gUser.DWDM +
      '&FXRDWMC=' + TLZDictionary.gDicDept[gUser.DWDM].DWMC +
      '&FXSJ=' + edtBZSJ.Text + url;
    s := TRequestItf.pDbQuery('AddS_Bug', s);
    if s = '1' then
    begin
      Application.MessageBox('保存成功', '提示', MB_OK + MB_ICONINFORMATION);
      BtnExitClick(nil);
    end
    else
      Application.MessageBox('保存失败', '提示', MB_OK + MB_ICONINFORMATION);
  end
  else if EditStatus = TEditStatus.esApprove then
  begin
    if cboStatus.ItemIndex <> FBug.Status then
    begin
      s := 'SYSTEMID=' + FBug.SYSTEMID +
        '&clff=' + memHFNR.Text +
        '&status=' + cboStatus.ItemIndex.ToString +
        '&CLSJ=' + FormatDateTime('yyyy/mm/dd', now);
      s := TRequestItf.pDbQuery('ModifyS_Bug', s);
      if s = '1' then
      begin
        Application.MessageBox('保存成功', '提示', MB_OK + MB_ICONINFORMATION);
        BtnExitClick(nil);
      end
      else
        Application.MessageBox('保存失败', '提示', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TFrameBugEdit.cxImage1Click(Sender: TObject);
var
  img: TcxImage;
begin
  inherited;
  img := Sender as TcxImage;
  if EditStatus = esNew then
  begin
    if self.OpenPictureDialog1.Execute then
    begin
      img.Width := img.Parent.Width div 3 - 3;
      img.Picture.LoadFromFile(self.OpenPictureDialog1.FileName);
      img.Properties.Caption := self.OpenPictureDialog1.FileName;
    end;
  end
  else begin
    {if img.Properties.FitMode = ifmStretch then
    begin
      img.Properties.FitMode := ifmFit;
    end
    else begin
      img.Properties.FitMode := ifmStretch;
      img.Width := img.Parent.Width div 3 - 3;
    end;                                      }
  end;
end;

procedure TFrameBugEdit.BtnExitClick(Sender: TObject);
begin
  inherited;
  Hide;
  if Assigned(onclose) then
  begin
    onclose;
  end;

end;

end.

