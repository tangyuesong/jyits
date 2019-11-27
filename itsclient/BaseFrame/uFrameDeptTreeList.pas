unit uFrameDeptTreeList;

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
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, StrUtils,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, FireDAC.Comp.Client,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutContainer, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxClasses, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, uDictionary, uEntity, uRequestItf, uJsonUtils, uGlobal;

type
  TFrameDeptTreeList = class(TdxDialogBaseFrame)
    tree: TcxTreeList;
    cxTreeList1Column2: TcxTreeListColumn;
    cxTreeList1Column3: TcxTreeListColumn;
    treeUserColumn4: TcxTreeListColumn;
    dxLayoutItem1: TdxLayoutItem;
  private
    //FCheckGroupType: cxTL.TcxTreeListNodeCheckGroupType;
    function GetSelectedDept: TDept;
    procedure SetSelectedDept(const Value: TDept);
    function FindNode(key: string; node: TcxTreeListNode): TcxTreeListNode;
  public
    procedure AfterConstruction; override;
    //property CheckGroupType: cxTL.TcxTreeListNodeCheckGroupType read FCheckGroupType write FCheckGroupType;
    property Selected: TDept read GetSelectedDept write SetSelectedDept;
  end;

var
  FrameDeptTreeList: TFrameDeptTreeList;

implementation

{$R *.dfm}

{ TFrameDeptTreeList }

procedure TFrameDeptTreeList.AfterConstruction;
  function GetParentNode(dwdm: string; node: TcxTreeListNode = nil): TcxTreeListNode;
  var
    i: integer;
  begin
    if node = nil then
    begin
      for i := 0 to tree.Count - 1 do
      begin
        if tree.Items[i].Texts[1] = dwdm then
          exit(tree.Items[i])
        else begin
          result := GetParentNode(dwdm, tree.Items[i]);
          if result <> nil then
            exit;
        end;
      end;
    end
    else begin
      for i := 0 to node.Count - 1 do
      begin
        if node.Items[i].Texts[1] = dwdm then
          exit(node.Items[i])
        else begin
          result := GetParentNode(dwdm, node.Items[i]);
          if result <> nil then
            exit;
        end;
      end;
    end;
    result := nil;
  end;
var
  dept: TDept;
  pNode, node: TcxTreeListNode;
  s: string;
  tb: TFDMemTable;
begin
  inherited;
  tree.Clear;
  s := TRequestItf.DbQuery('GetS_DEPT', 'Like_DWDM=' + LeftStr(gUser.DWDM, 4)+'&bj=1&IsJJ=1&ORDERBY=DWDM');
  if s = '' then exit;

  tb := TFDMemTable.Create(nil);
  TJsonUtils.JSONToDataSet(s, tb, '');
  with tb do
  begin
    while not Eof do
    begin
      dept.PDWDM := FieldByName('PDWDM').AsString;
      dept.DWDM := FieldByName('DWDM').AsString;
      dept.DWMC := FieldByName('DWMC').AsString;
      pNode := GetParentNode(dept.PDWDM);
      if pNode = nil then
        node := tree.Add
      else
        node := pNode.AddChild;
      //node.CheckGroupType := cxTL.TcxTreeListNodeCheckGroupType.ncgRadioGroup;// self.CheckGroupType;
      node.Texts[0] := dept.DWMC;
      node.Texts[1] := dept.DWDM;

      Next;
    end;
    Free;
  end;
  if tree.Count > 0 then
    tree.Items[0].Expand(false);
end;

function TFrameDeptTreeList.GetSelectedDept: TDept;
begin
  result.DWDM := '';
  result.DWMC := '';
  if tree.SelectionCount > 0 then
  begin
    result.DWDM := tree.Selections[0].Texts[1];
    result.DWMC := tree.Selections[0].Texts[0];
  end;
end;

procedure TFrameDeptTreeList.SetSelectedDept(const Value: TDept);
var
  node: TcxTreeListNode;
begin
  node := FindNode(Value.DWDM, nil);
  if node <> nil then
  begin
    tree.Select(node);
  end;
end;

function TFrameDeptTreeList.FindNode(key: string; node: TcxTreeListNode): TcxTreeListNode;
var
  i: integer;
begin
  result := nil;
  if node = nil then
  begin
    for i := 0 to tree.Count - 1 do
    begin
      if tree.Items[i].Texts[0].Contains(key) or tree.Items[i].Texts[1].Contains(key) then
        result := tree.Items[i]
      else
        result := FindNode(key, tree.Items[i]);
      if result <> nil then
        exit;
    end;
  end
  else begin
    for i := 0 to node.Count - 1 do
    begin
      if node.Items[i].Texts[0].Contains(key) or node.Items[i].Texts[1].Contains(key) then
        result := node.Items[i]
      else
        result := FindNode(key, node.Items[i]);

      if result <> nil then
        exit;
    end;
  end;
end;


end.
