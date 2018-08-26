unit UFrameQDZSP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxComboBoxExt,uEntity,uGlobal,uRequestItf,uJsonUtils,uCommon,Udictionary;

type
  TFrameQDZSP = class(TdxDialogBaseFrame)
    ComSPMC: TcxComboBoxExt;
    dxLayoutItem1: TdxLayoutItem;
    EdtSPDM: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    EdtSPJD: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    EdtSPWD: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
    procedure ComSPMCPropertiesChange(Sender: TObject);
  private
    FQDZDM: string;
    FOK: TClose;
    FQDZRYSL: string;
    function GetQDZ: TQDZSP;
    procedure SetQDZ(const Value: TQDZSP);
    { Private declarations }
  public
    procedure AfterConstruction; override;
    property OnOK: TClose read FOK write FOK;
    property QDZSPlist: TQDZSP read GetQDZ write SetQDZ;
    property QDZDM: string read FQDZDM write FQDZDM;
    property QDZRYSL: string read FQDZRYSL write FQDZRYSL;
  end;

var
  FrameQDZSP: TFrameQDZSP;

implementation

{$R *.dfm}

{ TFrameQDZSP }

procedure TFrameQDZSP.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindComboboxDEV(Self.ComSPMC, True, '3');
end;

procedure TFrameQDZSP.btnSaveClick(Sender: TObject);
var
  s: string;
  tmpqdzSP: TQDZSP;
  b,path,fn1: string;
begin
  inherited;
  if EdtSPDM.Text = '' then
  begin
    Application.MessageBox('视频编号编号不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if ComSPMC.Text = '' then
  begin
    Application.MessageBox('视频名称不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EDTSPJD.Text = '' then
  begin
    Application.MessageBox('视频经度不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if EDTSPWD.Text = '' then
  begin
    Application.MessageBox('视频纬度不能为空', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  // 图片上传ftp

  tmpqdzSP := QDZSPlist;
  if Editid = TEditStatus.esNew then
  begin
    tmpqdzSP.systemid := '';
  end;
  s := TJSONUtils.RecordToString<TQDZSP>(@tmpqdzSP);

  if Editid = TEditStatus.esNew then
  begin
    b := TRequestItf.DbQuery('ADDT_QDZ_VEDIO', s);
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
    TRequestItf.PDbQuery('ModifyT_QDZ_VEDIO', s);
    if b = '0' then
    begin
      Application.MessageBox('修改失败', '提示', MB_OK + MB_ICONINFORMATION);
      exit;
    end
    else
      Application.MessageBox('修改成功', '提示', MB_OK + MB_ICONINFORMATION);
    btnExitClick(nil);
  end;
  if Assigned(OnOK) then
  begin
    OnOK;
  end;
end;

procedure TFrameQDZSP.ComSPMCPropertiesChange(Sender: TObject);
var
  dev: TDevice;
  key: string;
begin
  inherited;
  key := TLZDictionary.StrtoDicInfo(ComSPMC.Text).dm;
  if TLZDictionary.gDicDev[1].ContainsKey(key) then
  begin
    dev := TLZDictionary.gDicDev[1][key];
    EdtSPDM.Text:=dev.SBBH;
    EdtSPJD.Text:=dev.SBJD;
    EdtSPWD.Text:=dev.SBWD;
  end;
end;

function TFrameQDZSP.GetQDZ: TQDZSP;
begin
  Result.SYSTEMID:=id;
  Result.QDZDM:=QDZDM;
  Result.SPMC:=TLZDictionary.StrtoDicInfo(ComSPMC.Text).mc;
  Result.SPDM:=EdtSPDM.Text;
  Result.SPJD:=EdtSPJD.Text;
  Result.SPWD:=EdtSPWD.Text;
end;

procedure TFrameQDZSP.SetQDZ(const Value: TQDZSP);
begin
 QDZDM:=Value.QDZDM;
 ComSPMC.Text:=Value.SPMC;
 EdtSPDM.Text:=Value.SPDM;
 EdtSPJD.Text:=Value.SPJD;
 EdtSPWD.Text:=Value.SPWD;
 id:=Value.SYSTEMID;

end;

end.
