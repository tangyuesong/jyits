unit UFrameAddFollow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
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
  dxLayoutcxEditAdapters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxLayoutContainer, cxDropDownEdit, cxMaskEdit, cxCalendar,
  cxTextEdit, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl, cxCheckBox,
  Udictionary, uRequestItf, uGlobal;

type
  TFrameAddFollow = class(TdxDialogBaseFrame)
    EdtRwmc: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    EdtMzl: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    DtKssj: TcxDateEdit;
    dxLayoutItem5: TdxLayoutItem;
    DtJssj: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    Edthphm: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    Cbbhpzl: TcxComboBox;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    cxCheckBox1: TcxCheckBox;
    dxLayoutItem9: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
  private
    function AddTask: string;
    { Private declarations }
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  FrameAddFollow: TFrameAddFollow;

implementation

{$R *.dfm}

procedure TFrameAddFollow.AfterConstruction;
begin
  inherited;
  cxCheckBox1.Enabled := gHaveK08;
  DtKssj.Date := now - 1;
  DtJssj.Date := now;
  TLZDictionary.BindCombobox(Cbbhpzl, TLZDictionary.gDicMain['HPZL'], True);
  Cbbhpzl.ItemIndex := 1;
  EdtRwmc.Text := 'Task' + FormatDateTime('yyyymmddhhmmss', now);
end;

procedure TFrameAddFollow.btnSaveClick(Sender: TObject);
begin
  inherited;
  Id := AddTask;
  if Id <> '' then
  begin
    ClearControls(self);
    EdtMzl.Text := '50';
    EdtRwmc.Text := 'Task' + FormatDateTime('yyyymmddhhmmss', now);
    btnExitClick(nil);
  end;
end;

function TFrameAddFollow.AddTask: string;
var
  taskid, params, hpzl, k08, ret: string;
  t1, t2: double;
begin
  result := '';
  t1 := self.DtKssj.Date;
  t2 := self.DtJssj.Date;
  if t2 - t1 > 1 then
  begin
    Application.MessageBox('请缩小时间范围到24小时内。', '提示', MB_OK);
    exit;
  end;
  if t2 < t1 then
  begin
    Application.MessageBox('开始时间不能大于结束时间。', '提示', MB_OK);
    exit;
  end;
  hpzl := TLZDictionary.StrtoDicInfo(Cbbhpzl.Text).dm;
  taskid := TGuid.NewGuid.ToString;
  if self.cxCheckBox1.Checked then
    k08 := '1'
  else
    k08 := '0';
  params := Format
    ('SYSTEMID=%s&TaskName=%s&HPHM=%s&HPZL=%s&BeginTime=%s&EndTime=%s&CreateBy=%s&CreateTime=%s&Status=%s&Rate=%s&K08=%s',
    [taskid, EdtRwmc.Text, Edthphm.Text, hpzl,
    FormatDateTime('yyyy-mm-dd hh:mm:ss', t1),
    FormatDateTime('yyyy-mm-dd hh:mm:ss', t2), gUser.YHBH,
    FormatDateTime('yyyy-mm-dd hh:mm:ss', now), '待分析', EdtMzl.Text, k08]);

  ret := TRequestItf.pDbQuery('AddT_Analyse_FollowTask', params);
  if ret = '1' then
    result := taskid;
end;

end.
