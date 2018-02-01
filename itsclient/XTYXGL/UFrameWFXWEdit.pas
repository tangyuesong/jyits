unit UFrameWFXWEdit;

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
  cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit,
  uEntity, uCommon, uJsonUtils, uRequestItf;

type
  TOK = procedure(obj: TWfxw) of object;

type
  TFrameWFXWEdit = class(TdxDialogBaseFrame)
    EdtWfxwdm: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    Edtwfxwmc: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    edtfg: TcxMemo;
    dxLayoutItem5: TdxLayoutItem;
    edttljc: TcxMemo;
    dxLayoutItem6: TdxLayoutItem;
    edtje: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    edtjf: TcxTextEdit;
    dxLayoutItem8: TdxLayoutItem;
    edtyxqks: TcxDateEdit;
    dxLayoutItem9: TdxLayoutItem;
    edtyxqjs: TcxDateEdit;
    dxLayoutItem10: TdxLayoutItem;
    dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup;
    edtbz: TcxMemo;
    dxLayoutItem11: TdxLayoutItem;
    dxlytcrtdgrp3: TdxLayoutAutoCreatedGroup;
    procedure btnSaveClick(Sender: TObject);
  private
    FOK: TOK;
    function GetWfxw: TWfxw;
    procedure SetWfxw(const Value: TWfxw);
    { Private declarations }
  public
    { Public declarations }
    property EditWFxw: TWfxw read GetWfxw write SetWfxw;
    property OnOK: TOK read FOK write FOK;
  end;

var
  FrameWFXWEdit: TFrameWFXWEdit;

implementation

{$R *.dfm}
{ TFrameWFXWEdit }

procedure TFrameWFXWEdit.btnSaveClick(Sender: TObject);
var
  tmpWFxw: TWfxw;
  s: string;
begin
  inherited;
  if (EdtWfxwdm.Text = '') or (Edtwfxwmc.Text = '') then
  begin
    Application.MessageBox('违法行为代码或者违法行为名称不能为空', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  tmpWFxw := EditWFxw;
  if EditID = TEditStatus.esNew then
    tmpWFxw.Systemid := '';
  s := TJSONUtils.RecordToString<TWfxw>(@tmpWFxw);
  if EditID = TEditStatus.esNew then
  begin
    TRequestItf.pDbQuery('AddT_VIO_ILLECODE', s);
    Application.MessageBox('增加成功', '提示', MB_OK + MB_ICONINFORMATION);
  end;
  if EditID = TEditStatus.esModify then
  begin
    TRequestItf.pDbQuery('ModifyT_VIO_ILLECODE', s);
    Application.MessageBox('修改成功', '提示', MB_OK + MB_ICONINFORMATION);
    btnExitClick(nil);
  end;
  if Assigned(OnOK) then
  begin
    OnOK(tmpWFxw);
  end;
  ClearControls(Self);

end;

function TFrameWFXWEdit.GetWfxw: TWfxw;
begin
  Result.Systemid := id;
  Result.WFXWDM := EdtWfxwdm.Text;
  Result.wfxwmc := Edtwfxwmc.Text;
  Result.FG := edtfg.Text;
  Result.TLJC := edttljc.Text;
  Result.JE := edtje.Text;
  Result.JF := edtjf.Text;
  Result.yxqks := edtyxqks.Text;
  Result.yxqjs := edtyxqjs.Text;
  Result.bz := edtbz.Text;
  Result.gxsj := FormatDateTime('yyyy/mm/ss hh:mm:ss', Now);
end;

procedure TFrameWFXWEdit.SetWfxw(const Value: TWfxw);
begin
  EdtWfxwdm.Text := Value.WFXWDM;
  Edtwfxwmc.Text := Value.wfxwmc;
  edtfg.Text := Value.FG;
  edttljc.Text := Value.TLJC;
  edtje.Text := Value.JE;
  edtjf.Text := Value.JF;
  edtyxqks.Text := Value.yxqks;
  edtyxqjs.Text := Value.yxqjs;
  edtbz.Text := Value.bz;
end;

end.
