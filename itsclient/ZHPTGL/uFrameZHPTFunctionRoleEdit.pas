unit uFrameZHPTFunctionRoleEdit;

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
  Generics.Collections, uGlobal, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TUserFunction = Record
    MenuID: String;
    MenuName: String;
    FunctionID: String;
    FunctionName: String;
  end;

  TFrameZHPTFunctionRoleEdit = class(TdxFrame)
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
    FDMemTable1: TFDMemTable;
    tlFunctionColumn3: TcxTreeListColumn;
    tlFunctionColumn4: TcxTreeListColumn;
    procedure btnSaveClick(Sender: TObject);
  private
    FRoleID: String;
    function GetRoleFunction(RoleID: String): TDictionary<String, TStrings>;
    function GetUserAllFunction(): TDictionary<String, TList<TUserFunction>>;
  public
    procedure FillFunctionRole(RoleID, RoleName, Bz: String);
  end;

implementation

{$R *.dfm}
{ TFrameZHPTFunctionRoleEdit }

procedure TFrameZHPTFunctionRoleEdit.btnSaveClick(Sender: TObject);
var
  rnode, cnode: TcxTreeListNode;
  Param, MenuID, FunctionID: String;
  i, j, k: Integer;
begin
  inherited;
  if Trim(edtRole.Text) = '' then
  begin
    Application.MessageBox('角色名称不能为空', '提示', MB_OK);
    exit;
  end;

  Param := 'TYBJ=0&JSMC=' + Trim(edtRole.Text);
  if FRoleID <> '' then
    Param := Param + '&not_systemid=' + FRoleID;

  if TRequestItf.DbQuery('GetZHPTFunctionRole', Param) <> '' then
  begin
    Application.MessageBox('角色名称已存在', '提示', MB_OK);
    exit;
  end;

  if FRoleID <> '' then
  begin
    TRequestItf.DbQuery('DelZHPTFunctionRoleFunction', 'RoleID=' + FRoleID);
    Param := 'JSMC=' + Trim(edtRole.Text) + '&gxsj=' +
      FormatDatetime('yyyy/mm/dd hh:nn:ss', Now()) + '&SystemID=' + FRoleID +
      '&bz=' + Trim(Memobz.Text);
    TRequestItf.DbQuery('ModifyZHPTFunctionRole', Param);
  end
  else
  begin
    FRoleID := TGUID.NewGuid.ToString;
    Param := 'Systemid=' + FRoleID + '&yhbh=' + gUser.yhbh + '&JSMC=' +
      Trim(edtRole.Text) + '&bz=' + Trim(Memobz.Text);
    if TRequestItf.DbQuery('AddZHPTFunctionRole', Param) <> '1' then
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
      if cnode.Checked then
      begin
        MenuID := cnode.Texts[1];
        FunctionID := cnode.Texts[2];
        TRequestItf.DbQuery('AddZHPTFunctionRoleFunction',
          'RoleID=' + FRoleID + '&MenuID=' + MenuID + '&FunctionID=' +
          FunctionID);
      end;
    end;
  end;
  btnCanel.Click;
end;

procedure TFrameZHPTFunctionRoleEdit.FillFunctionRole(RoleID, RoleName,
  Bz: String);
var
  ufs: TDictionary<String, TList<TUserFunction>>;
  rfs: TDictionary<String, TStrings>;
  MenuID: String;
  uf: TUserFunction;
  rnode, cnode, fnode: TcxTreeListNode;
  rfList: TStrings;
begin
  tlFunction.Clear;
  tlFunction.Root.CheckGroupType := ncgCheckGroup;
  tlFunction.OptionsView.CheckGroups := True;

  ufs := GetUserAllFunction;

  FRoleID := RoleID;
  if Trim(RoleID) <> '' then
  begin
    rfs := GetRoleFunction(RoleID);
    edtRole.Text := RoleName;
    Memobz.Text := Bz;
  end
  else
  begin
    rfs := TDictionary<String, TStrings>.Create;
    edtRole.Text := '';
    Memobz.Text := '';
  end;

  for MenuID in ufs.Keys do
  begin
    rnode := tlFunction.Add;
    rnode.CheckGroupType := ncgCheckGroup;
    rnode.Texts[0] := ufs[MenuID][0].MenuName;
    for uf in ufs[MenuID] do
    begin
      cnode := rnode.AddChild;
      cnode.CheckGroupType := ncgCheckGroup;
      cnode.Texts[0] := uf.FunctionName;
      cnode.Texts[1] := uf.MenuID;
      cnode.Texts[2] := uf.FunctionID;
      if rfs.ContainsKey(uf.MenuID) and
        (rfs[uf.MenuID].IndexOf(uf.FunctionID) >= 0) then
        cnode.Checked := True
      else
        cnode.Checked := False;
    end;
  end;
  ufs.Free;
  rfs.Free;
end;

function TFrameZHPTFunctionRoleEdit.GetRoleFunction(RoleID: String)
  : TDictionary<String, TStrings>;
var
  tb: TFDMemTable;
  MenuID, FunctionID: String;
  Param: String;
begin
  Result := TDictionary<String, TStrings>.Create;
  tb := TFDMemTable.Create(nil);
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetZHPTFunctionByRole',
    'RoleID=' + RoleID), tb);
  if tb.Active then
  begin
    tb.First;
    while not tb.Eof do
    begin
      MenuID := tb.FieldByName('MenuID').AsString;
      FunctionID := tb.FieldByName('FunctionID').AsString;
      if not Result.ContainsKey(MenuID) then
        Result.Add(MenuID, TStringList.Create);
      Result[MenuID].Add(FunctionID);
      tb.Next;
    end;
  end;
  tb.Free;
end;

function TFrameZHPTFunctionRoleEdit.GetUserAllFunction
  : TDictionary<String, TList<TUserFunction>>;
var
  tb: TFDMemTable;
  fun: TUserFunction;
  Param: String;
begin
  Result := TDictionary < String, TList < TUserFunction >>.Create;
  if gIsSa then
    Param := ''
  else
    Param := 'yhbh=' + gUser.yhbh;
  tb := TFDMemTable.Create(nil);
  TJsonUtils.JSONToDataSet(TRequestItf.DbQuery('GetZHPTFunctionByUser',
    ''), tb);
  if tb.Active then
  begin
    tb.First;
    while not tb.Eof do
    begin
      fun.MenuID := tb.FieldByName('MenuID').AsString;
      fun.MenuName := tb.FieldByName('MenuName').AsString;
      fun.FunctionID := tb.FieldByName('FunctionID').AsString;
      fun.FunctionName := tb.FieldByName('FunctionName').AsString;
      if not Result.ContainsKey(fun.MenuID) then
        Result.Add(fun.MenuID, TList<TUserFunction>.Create);
      Result[fun.MenuID].Add(fun);
      tb.Next;
    end;
  end;
  tb.Free;
end;

end.
