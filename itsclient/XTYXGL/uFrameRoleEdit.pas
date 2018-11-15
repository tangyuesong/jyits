unit uFrameRoleEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, dxLayoutContainer, cxCustomData,
  cxStyles, cxTL, cxTLdxBarBuiltInMenu, Vcl.ComCtrls, cxContainer, cxEdit,
  cxTreeView, cxInplaceContainer, cxClasses, dxLayoutControl,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxMemo, cxTextEdit, uRequestItf, uJsonUtils, uUserPower,
  Generics.Collections, uGlobal;

type
  TRoleFunction = Record
    SystemID: String;
    RoleID: String;
    FunctionID: String;
  end;

  TFrameRoleEdit = class(TdxFrame)
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    edtRole: TcxTextEdit;
    btnSave: TcxButton;
    btnCanel: TcxButton;
    Memobz: TcxMemo;
    dxLayoutItem3: TdxLayoutItem;
    tlFunction: TcxTreeList;
    dxLayoutItem1: TdxLayoutItem;
    tlFunctionColumn2: TcxTreeListColumn;
    tlFunctionColumn3: TcxTreeListColumn;
  private
    FRoleID: String;
    function GetFunctions(RoleID: String): TStrings;
  public
    procedure FillFunctionRole(RoleID, RoleName, Bz: String);
    function SaveData(): Boolean;
  end;

var
  FrameRoleEdit: TFrameRoleEdit;

implementation

{$R *.dfm}
{ TFrameRoleEdit }

procedure TFrameRoleEdit.FillFunctionRole(RoleID, RoleName, Bz: String);
var
  mmList: TList<TMainMenu>;
  mm: TMainMenu;
  cmList: TList<TChildMenu>;
  cm: TChildMenu;
  afList: TList<TAppFunction>;
  af: TAppFunction;
  rnode, cnode, fnode: TcxTreeListNode;
  rfList: TStrings;
begin
  tlFunction.Clear;
  tlFunction.Root.CheckGroupType:= ncgCheckGroup;
  tlFunction.OptionsView.CheckGroups:= True;
  FRoleID := RoleID;
  if Trim(RoleID) <> '' then
  begin
    rfList := GetFunctions(RoleID);
    edtRole.Text := RoleName;
    Memobz.Text := Bz;
  end
  else
  begin
    rfList := TStringList.Create;
    edtRole.Text := '';
    Memobz.Text := '';
  end;
  for mm in gUserPower.AllMainMenu do
  begin
     if not gIsSa and (gUserPower.UserMainMenu.IndexOf(mm.SystemID) < 0) then
     continue;
    rnode := tlFunction.Add;
    rnode.CheckGroupType := ncgCheckGroup;
    rnode.Texts[0] := mm.Caption;
    if gUserPower.AllChildMenu.ContainsKey(mm.SystemID) then
      cmList := gUserPower.AllChildMenu[mm.SystemID]
    else
      continue;
    for cm in cmList do
    begin
       if not gIsSa and (gUserPower.UserChildMenu.IndexOf(cm.SystemID) < 0) then
       continue;
      cnode := rnode.AddChild;
      cnode.CheckGroupType := ncgCheckGroup;
      cnode.Texts[0] := cm.Caption;
      if gUserPower.AllFunction.ContainsKey(cm.SystemID) then
        afList := gUserPower.AllFunction[cm.SystemID]
      else
        continue;
      for af in afList do
      begin
         if not gIsSa and (gUserPower.UserFunction[cm.SystemID].IndexOf(af.ControlName) < 0) then
         continue;
        fnode := cnode.AddChild;
        fnode.CheckGroupType := ncgCheckGroup;
        fnode.Texts[0] := af.Caption;
        fnode.Texts[1] := af.SystemID;
        if rfList.IndexOf(af.SystemID) >= 0 then
          fnode.Checked := True;
      end;
    end;
  end;
  rfList.Free;
end;

function TFrameRoleEdit.GetFunctions(RoleID: String): TStrings;
var
  rfList: TList<TRoleFunction>;
  rf: TRoleFunction;
begin
  Result := TStringList.Create;
  rfList := TJsonUtils.JsonToRecordList<TRoleFunction>
    (TRequestItf.DbQuery('GetS_ROLE_FUNCTION', 'RoleID=' + RoleID));
  for rf in rfList do
    Result.Add(rf.FunctionID);
  rfList.Free;
end;

function TFrameRoleEdit.SaveData: Boolean;
var
  rnode, cnode, fnode: TcxTreeListNode;
  param: String;
  i, j, k: Integer;
begin
  inherited;
  Result:= False;
  if Trim(edtRole.Text) = '' then
  begin
    Application.MessageBox('角色名称不能为空', '提示', MB_OK);
    exit;
  end;

  param := 'TYBJ=0&JSMC=' + Trim(edtRole.Text);
  if FRoleID <> '' then
    param := param + '&not_systemid=' + FRoleID;

  if TRequestItf.DbQuery('GetS_Role_List', param) <> '' then
  begin
    Application.MessageBox('角色名称已存在', '提示', MB_OK);
    exit;
  end;

  if FRoleID <> '' then
  begin
    TRequestItf.DbQuery('DelS_Role_Function', 'RoleID=' + FRoleID);
    param := 'JSMC=' + Trim(edtRole.Text) + '&gxsj=' +
      FormatDatetime('yyyy/mm/dd hh:nn:ss', Now()) + '&SystemID=' + FRoleID;
    if Trim(Memobz.Text) <> '' then
      param := param + '&bz=' + Trim(Memobz.Text);
    TRequestItf.DbQuery('ModifyS_Role_List', param);
  end
  else
  begin
    FRoleID := TGUID.NewGuid.ToString;
    param := 'Systemid=' + FRoleID + '&yhbh=' + gUser.YHBH + '&dwdm=' +
      gUser.DWDM + '&JSMC=' + Trim(edtRole.Text);
    if Trim(Memobz.Text) <> '' then
      param := param + '&bz=' + Trim(Memobz.Text);
    if TRequestItf.DbQuery('AddS_Role_List', param) <> '1' then
    begin
      Application.MessageBox('添加角色失败', '提示', MB_OK);
      exit;
    end;
  end;

  for i := 0 to tlFunction.Count - 1 do
  begin
    rnode := tlFunction.Items[i];
    for j := 0 to rnode.Count - 1 do
    begin
      cnode := rnode.Items[j];
      for k := 0 to cnode.Count - 1 do
      begin
        fnode := cnode.Items[k];
        if fnode.Checked then
          TRequestItf.DbQuery('AddS_Role_Function', 'RoleID=' + FRoleID +
            '&FunctionID=' + fnode.Texts[1]);
      end;
    end;
  end;
  Result:= True;
end;

end.
