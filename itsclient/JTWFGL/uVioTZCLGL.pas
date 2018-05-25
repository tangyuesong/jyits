unit uVioTZCLGL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxToolGridFrame,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, dxLayoutContainer,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutControl, cxLabel,
  Vcl.ExtCtrls,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, Vcl.ComCtrls, dxCore,
  cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCheckBox, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxCalendar, dxFrames, uDM, dxSkinsdxBarPainter,
  dxBar, Udictionary, dxGridFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, dxFrame, uEntity, uGlobal, uCommon,
  ULookUpDataSource, dxDialogBase, UFrameWmd, System.Generics.Collections,
  System.Rtti, FireDAC.Comp.Client, uRequestItf, uJsonUtils, cxMemo,
  cxEditRepositoryItems, sDialogs, System.Actions, Vcl.ActnList;

type
  TfVioTZCLGL = class(TToolGridFrame)
    cbbJC: TcxComboBox;
    cbbhpzl: TcxComboBox;
    edthphm: TcxTextEdit;
    Chk1: TcxCheckBox;
    btnSearch: TcxButton;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    FrameWmd1: TFrameWmd;
    btnInput: TdxBarLargeButton;
    btnUpdate: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnCheck: TdxBarLargeButton;
    Btnadd: TcxButton;
    dxLayoutItem9: TdxLayoutItem;
    Timer1: TTimer;
    procedure cxButton2Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnInputClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure actnewExecute(Sender: TObject);
    procedure BtnaddClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    function GetVioWMD: TVioWMD;
    procedure ShowEditFrame(obj: TVioWMD);
    procedure HideEditFrame;
  protected
    procedure LoadData; override;
  public
    { Public declarations }
    procedure AfterConstruction; override;
  end;

var
  fVioTZCLGL: TfVioTZCLGL;

implementation

// uses
// uWMD;

{$R *.dfm}

procedure TfVioTZCLGL.actdeleteExecute(Sender: TObject);
begin
  inherited;
  btnDelClick(nil);
end;

procedure TfVioTZCLGL.acteditExecute(Sender: TObject);
begin
  inherited;
  btnUpdateClick(nil);
end;

procedure TfVioTZCLGL.actnewExecute(Sender: TObject);
begin
  inherited;
  btnCheckClick(nil);
end;

procedure TfVioTZCLGL.AfterConstruction;
begin
  inherited;

  FrameWmd1.cxDateEdit1.Date :=
    VarToDateTime(FormatDateTime('yyyy-mm', now - 1));
  FrameWmd1.cxDateEdit2.Date :=
    VarToDateTime(FormatDateTime('yyyy-mm-dd', now + 1));

  TLZDictionary.BindCombobox(cbbJC, TLZDictionary.gdicmain['JC'], true);
  TLZDictionary.BindCombobox(FrameWmd1.cbbJC,
    TLZDictionary.gdicmain['JC'], true);
  TLZDictionary.BindCombobox(cbbhpzl, TLZDictionary.gdicmain['HPZL'], true);
  TLZDictionary.BindCombobox(FrameWmd1.cbbhpzl,
    TLZDictionary.gdicmain['HPZL'], true);
  TLZDictionary.BindCombobox(FrameWmd1.cbbyj,
    TLZDictionary.gdicmain['SHYJ'], true);

  cbbJC.ItemIndex := 18;
  cbbhpzl.ItemIndex := 1;
  FrameWmd1.cbbJC.ItemIndex := 18;
  FrameWmd1.cbbhpzl.ItemIndex := 1;
  FrameWmd1.cbbsyfw.ItemIndex := 1;

  GridColumns := 'lrr,hphm,hpzl,yxsj,jssj,yy,spr,SPYJ,spsj,操作';
  GridView.Columns[9].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible :=
    btnUpdate.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[1].Visible := btnDel.Enabled;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[2].Visible :=
    btnCheck.Enabled;
  Btnadd.Visible := btnInput.Enabled;
end;

function TfVioTZCLGL.GetVioWMD: TVioWMD;
var
  dic: Tdic;
begin
  result := nil;
  if Length(Trim(FrameWmd1.edthphm.Text)) = 0 then
  begin
    Application.MessageBox('号牌号码不能为空', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  if Length(Trim(FrameWmd1.edthphm.Text)) < 5 then
  begin
    Application.MessageBox('号牌号码不能小于6位', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  if Length(Trim(FrameWmd1.MemoYY.Text)) = 0 then
  begin
    Application.MessageBox('申请原因不能为空', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  if (FrameWmd1.dxLayoutItem11.Visible = true) and (FrameWmd1.cbbyj.Text = '')
  then
  begin
    Application.MessageBox('审核意见不能为空', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;

  result := TVioWMD.Create;
  dic := TLZDictionary.StrtoDicInfo(FrameWmd1.cbbJC.Text);
  result.hphm := dic.mc + FrameWmd1.edthphm.Text;
  dic := TLZDictionary.StrtoDicInfo(FrameWmd1.cbbhpzl.Text);
  result.hpzl := dic.dm;
  result.yxsj := FormatDateTime('yyyy/mm/dd', FrameWmd1.cxDateEdit1.Date);
  result.jssj := FormatDateTime('yyyy/mm/dd', FrameWmd1.cxDateEdit2.Date);
  result.yy := FrameWmd1.MemoYY.Text;
  if FrameWmd1.Editid = TEditStatus.esApprove then
    result.spr := gUser.YHBH
  else
    result.lrr := gUser.YHBH;
  result.lrsj := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
  if FrameWmd1.dxLayoutItem11.Visible = false then
    result.zt := '0'
  else
  begin
    dic := TLZDictionary.StrtoDicInfo(FrameWmd1.cbbyj.Text);
    result.zt := dic.dm;
    result.spyj := dic.mc;
    result.bz := FrameWmd1.edt.Text;
    result.spsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
  end;
  dic := TLZDictionary.StrtoDicInfo(FrameWmd1.cbbsyfw.Text);
  result.powertype := dic.dm;
  result.SystemId := FrameWmd1.ID;
  result.DWDM := gUser.DWDM;
  result.gxsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
end;

procedure TfVioTZCLGL.btnSaveClick(Sender: TObject);
var
  wmd: TVioWMD;
  s: string;
begin
  inherited;
  wmd := GetVioWMD;
  if wmd <> nil then
  begin
    s := TJSONUtils.ObjectToString(wmd);

    if FrameWmd1.Editid = TEditStatus.esNew then
      TRequestItf.DbQuery('AddT_VIO_WHILELIST', s)
    else
    begin
      Fdmemtable1.Delete;
      TRequestItf.DbQuery('ModifyT_VIO_WHILELIST', s);
    end;
    TJSONUtils.AddObjToTable(Fdmemtable1, wmd);
    wmd.Free;
    HideEditFrame;
    Application.MessageBox('保存成功', '提示', MB_OK + MB_ICONQUESTION);
  end;

end;

procedure TfVioTZCLGL.btnSearchClick(Sender: TObject);
begin
  edtPageIndex.Text := '0';
  LoadData;
end;

procedure TfVioTZCLGL.BtnaddClick(Sender: TObject);
begin
  inherited;
  btnInputClick(nil);
end;

procedure TfVioTZCLGL.cxButton2Click(Sender: TObject);
begin
  inherited;
  HideEditFrame;
end;

function AddObjToTable(tb: TFDMemTable; obj: TObject): Boolean;
var
  rType: TRttiType;
  arr: TArray<TRttiField>;
  field: TRttiField;
  FRTTICtx: TRTTIContext;
begin
  rType := FRTTICtx.GetType(obj.ClassType);
  arr := rType.GetFields;
  tb.append;
  for field in arr do
  begin
    if tb.FindField(field.Name) <> nil then
      tb.FieldByName(field.Name).Value := field.GetValue(obj).ToString;
  end;
  tb.Post;
end;

procedure TfVioTZCLGL.HideEditFrame;
begin
  EnableControls(true);
  FrameWmd1.Visible := false;
end;

procedure TfVioTZCLGL.LoadData;
var
  s: string;
  hphm, hpzl: string;
  params: string;
  pageSize, pageIndex: Integer;
begin
  inherited;
  ShowFrameWait;
  if Chk1.Checked then
    params := 'zt=0'
  else
    params := 'not_zt=4';

  if Length(Trim(edthphm.Text)) > 0 then
  begin
    hphm := TLZDictionary.StrtoDicInfo(cbbJC.Text).mc + edthphm.Text;
    hpzl := TLZDictionary.StrtoDicInfo(cbbhpzl.Text).dm;
    params := params + '&hphm=' + hphm + '&hpzl=' + hpzl;
  end;
  pageSize := StrToIntDef(cbbPagesize.Text, 30);
  pageIndex := StrToIntDef(edtPageIndex.Text, 0);
  params := params + Format('&rows=%s&start=%s&orderby_desc=GXSJ',
    [pageSize.ToString, pageIndex.ToString]);
  // if gUser.Manager then
  // begin
  // params := params + '&like_dwdm=' + TCommon.GetXZQH(gUser.DWDM);
  // params := params + '&dwdm=' + gUser.DWDM;
  // end
  // else
  // begin
  params := params + '&LRR=' + gUser.YHBH;
  // end;

  s := TRequestItf.DbQuery('GetT_VIO_WHILELIST', params);
  TJSONUtils.JSONToDataSet(s, Fdmemtable1, '');
  btnnextPage.Enabled := Fdmemtable1.RecordCount = pageSize;
  FreeFrameWait;
end;

procedure TfVioTZCLGL.ShowEditFrame(obj: TVioWMD);
begin
  if (obj.zt <> '0') and (FrameWmd1.Editid <> TEditStatus.esNew) then
  begin
    Application.MessageBox('该数据已经审核', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  EnableControls(false);
  FrameWmd1.dxLayoutItem11.Visible := false;
  FrameWmd1.dxLayoutItem13.Visible := false;
  if FrameWmd1.Editid = TEditStatus.esApprove then
  begin
    FrameWmd1.dxLayoutItem11.Visible := true;
    FrameWmd1.dxLayoutItem13.Visible := true;
  end;
  FrameWmd1.Visible := true;
  FrameWmd1.top := (self.Height - FrameWmd1.Height) div 2;
  FrameWmd1.Left := (self.Width - FrameWmd1.Width) div 2;
  FrameWmd1.ID := obj.SystemId;
  FrameWmd1.MemoYY.Text := '';
  FrameWmd1.edthphm.Text := '';
  if obj.SystemId <> '' then
  begin
    FrameWmd1.cxDateEdit1.Date := VarToDateTime(obj.yxsj);
    FrameWmd1.cxDateEdit2.Date := VarToDateTime(obj.jssj);
    FrameWmd1.MemoYY.Text := obj.yy;
    FrameWmd1.cbbhpzl.Text := obj.hpzl + ':' + TLZDictionary.gdicmain['HPZL']
      [obj.hpzl];
    FrameWmd1.edthphm.Text := obj.hphm.Substring(1);
    FrameWmd1.cbbJC.Text := TLZDictionary.getkey('MIAN', 'JC', obj.hphm[1]) +
      ':' + obj.hphm[1];
    // 加字典 1、所有 2、违法 3、过车
    if obj.powertype <> '' then
      FrameWmd1.cbbsyfw.Text := obj.powertype + ':' + TLZDictionary.gdicmain
        ['SYFW'][obj.powertype];
  end
  else
    FrameWmd1.ID := TGUID.NewGuid.ToString;
end;

procedure TfVioTZCLGL.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  LoadData;
end;

procedure TfVioTZCLGL.btnInputClick(Sender: TObject);
var
  tmp: TVioWMD;
begin
  inherited;
  FrameWmd1.Editid := TEditStatus.esNew;
  tmp := TVioWMD.Create;
  ShowEditFrame(tmp);
  tmp.Free;
end;

procedure TfVioTZCLGL.btnUpdateClick(Sender: TObject);
var
  tmp: TVioWMD;
begin
  inherited;
  FrameWmd1.Editid := TEditStatus.esModify;
  tmp := TVioWMD.Create;
  if not Fdmemtable1.IsEmpty then
  begin
    tmp.SystemId := Fdmemtable1.FieldByName('SYSTEMID').AsString;
    tmp.hpzl := Fdmemtable1.FieldByName('hpzl').AsString;
    tmp.hphm := Fdmemtable1.FieldByName('HPHM').AsString;
    tmp.yxsj := Fdmemtable1.FieldByName('yxsj').AsString;
    tmp.jssj := Fdmemtable1.FieldByName('jssj').AsString;
    tmp.yy := Fdmemtable1.FieldByName('yy').AsString;
    tmp.zt := Fdmemtable1.FieldByName('zt').AsString;
    ShowEditFrame(tmp);
    tmp.Free;
  end;
end;

procedure TfVioTZCLGL.btnDelClick(Sender: TObject);
var
  ID: string;
begin
  inherited;
  if Fdmemtable1.FieldByName('zt').AsString <> '0' then
  begin
    Application.MessageBox('该数据已经通过审核', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
  if not Fdmemtable1.IsEmpty then
  begin
    if Application.MessageBox('是否删除数据,请确认', '提示',
      MB_OKCANCEL + MB_ICONINFORMATION) = IDOK then
    begin
      ID := Fdmemtable1.FieldByName('SYSTEMID').AsString;
      TRequestItf.DbQuery('ModifyT_VIO_WHILELIST', 'SYSTEMID=' + ID + '&zt=4');
      Fdmemtable1.Delete;
      Application.MessageBox('删除成功', '提示', MB_OK + MB_ICONQUESTION);
    end;
  end
  else
  begin
    Application.MessageBox('没有数据可以删除', '提示', MB_OK + MB_ICONSTOP);
    Exit;
  end;
end;

procedure TfVioTZCLGL.btnCheckClick(Sender: TObject);
var
  tmp: TVioWMD;
begin
  inherited;
  FrameWmd1.Editid := TEditStatus.esApprove;
  if not Fdmemtable1.IsEmpty then
  begin
    tmp := TVioWMD.Create;
    tmp.SystemId := Fdmemtable1.FieldByName('SYSTEMID').AsString;
    tmp.hpzl := Fdmemtable1.FieldByName('hpzl').AsString;
    tmp.hphm := Fdmemtable1.FieldByName('HPHM').AsString;
    tmp.yxsj := Fdmemtable1.FieldByName('yxsj').AsString;
    tmp.jssj := Fdmemtable1.FieldByName('jssj').AsString;
    tmp.yy := Fdmemtable1.FieldByName('yy').AsString;
    tmp.zt := Fdmemtable1.FieldByName('zt').AsString;
    ShowEditFrame(tmp);
    tmp.Free;
  end;
end;

end.
