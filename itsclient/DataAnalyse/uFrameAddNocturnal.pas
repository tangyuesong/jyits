unit uFrameAddNocturnal;

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
  dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons, dxLayoutControl,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxSpinEdit, cxTimeEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, uGlobal, uRequestItf;

type
  TFrameAddNocturnal = class(TdxDialogBaseFrame)
    deBegin: TcxDateEdit;
    dxLayoutItem6: TdxLayoutItem;
    deEnd: TcxDateEdit;
    dxLayoutItem7: TdxLayoutItem;
    teBegin: TcxTimeEdit;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    teEnd: TcxTimeEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    edtTask: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    procedure btnSaveClick(Sender: TObject);
  private
    procedure AfterConstruction; override;
    function AddTask: Boolean;
  public
    { Public declarations }
  end;

var
  FrameAddNocturnal: TFrameAddNocturnal;

implementation

{$R *.dfm}
{ TFrameAddNocturnal }

function TFrameAddNocturnal.AddTask: Boolean;
var
  params, hpzl, k08, ret: string;
  t1, t2: double;
begin
  result := False;
  t1 := teBegin.Time;
  t2 := teEnd.Time;
  if t2 < t1 then
  begin
    Application.MessageBox('天亮时间不能大于天黑时间。', '提示', MB_ICONINFORMATION);
    exit;
  end;
  params := Format
    ('TaskName=%s&LightBegin=%s&LightEnd=%s&BeginTime=%s&EndTime=%s&CreateBy=%s&CreateTime=%s&Status=%s',
    [edtTask.Text, teBegin.Text, teEnd.Text, FormatDateTime('yyyy/mm/dd',
    deBegin.Date), FormatDateTime('yyyy/mm/dd', deEnd.Date), gUser.YHBH,
    FormatDateTime('yyyy-mm-dd hh:mm:ss', now), '待分析']);
  result := TRequestItf.DbQuery('AddT_Analyse_NocturnalTask', params) = '1';
end;

procedure TFrameAddNocturnal.AfterConstruction;
begin
  inherited;
  teBegin.Text := '07:00:00';
  teEnd.Text := '18:00:00';
  deBegin.Text := FormatDateTime('yyyy/mm/dd', now - 30);
  deEnd.Text := FormatDateTime('yyyy/mm/dd', now);
  edtTask.Text := 'Task' + FormatDateTime('yyyymmddhhmmsszzz', now);
end;

procedure TFrameAddNocturnal.btnSaveClick(Sender: TObject);
begin
  inherited;
  if AddTask then
  begin
    Application.MessageBox('任务添加成功。', '提示', MB_ICONINFORMATION);
    ClearControls(self);
    edtTask.Text := 'Task' + FormatDateTime('yyyymmddhhmmsszzz', now);
    btnExitClick(nil);
  end
  else
    Application.MessageBox('任务添加失败。', '提示', MB_ICONERROR);
end;

end.
