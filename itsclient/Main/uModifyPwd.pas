unit uModifyPwd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, dxDialogBase,
  Vcl.StdCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, cxContainer, cxEdit,
  dxLayoutControlAdapters, dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses,
  cxTextEdit, cxButtons, dxLayoutControl, uRequestItf, QBAes, uGLobal;

type
  TfrmModifyPwd = class(TForm)
    dxLayoutControl2: TdxLayoutControl;
    btnSave: TcxButton;
    btnExit: TcxButton;
    edtOldPwd: TcxTextEdit;
    edtNewPwd: TcxTextEdit;
    edtConfirm: TcxTextEdit;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModifyPwd: TfrmModifyPwd;

implementation

{$R *.dfm}

procedure TfrmModifyPwd.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmModifyPwd.btnSaveClick(Sender: TObject);
begin
  inherited;
  if edtNewPwd.Text <> edtConfirm.Text then
  begin
    Application.MessageBox('新密码和确认密码不一致', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;

  if TRequestItf.DbQuery('GetS_User',
    'MM=' + AesEncrypt(gUser.YHBH + edtOldPwd.Text, key)) = '' then
  begin
    Application.MessageBox('原密码不正确', '提示', MB_OK + MB_ICONERROR);
    exit;
  end;

  if TRequestItf.DbQuery('ModifyS_User',
    'MM=' + AesEncrypt(gUser.YHBH + edtNewPwd.Text, key) + '&SystemID=' +
    gUser.SYSTEMID) = '1' then
  begin
    Application.MessageBox('密码修改成功', '提示', MB_OK + MB_ICONINFORMATION);
  end
  else
    Application.MessageBox('密码修改失败', '提示', MB_OK + MB_ICONINFORMATION);
  Close;
end;

procedure TfrmModifyPwd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmModifyPwd := nil;
end;

end.
