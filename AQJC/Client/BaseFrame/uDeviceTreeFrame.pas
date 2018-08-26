unit uDeviceTreeFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Vcl.ComCtrls,
  sTreeView, Vcl.StdCtrls, sEdit, Vcl.Buttons, FireDAC.Comp.Client, Generics.Collections,
  Vcl.ExtCtrls, sPanel, System.ImageList, Vcl.ImgList, uGlobal;

type
  TDevice = class
    DWDM: string;
    PDWDM: string;
    DWMC: string;
    SBBH: string;
    SBMC: string;
    LKBH: string;
    LKMC: string;
    LDBH: string;
    Status: boolean;
  end;

  TDeviceTreeFrame = class(TFrame)
    SpeedButton1: TSpeedButton;
    edit: TsEdit;
    Timer1: TTimer;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    tree: TsTreeViewEx;
    ImageList1: TImageList;
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure treeClick(Sender: TObject);
    procedure editKeyPress(Sender: TObject; var Key: Char);
  private
    FBranchList: array of string;
    FDeviceList: TObjectList<TDevice>;
    FSBLX: integer;
    FSBBHToChecked: string;
    FCheckedDic: TDictionary<integer, boolean>;
    FLocation: boolean;
    function GetChangedItem: TTreeNode;
    procedure GenerateTree;
    procedure GetCheckedItems(list: TList<TDevice>; node: TTreeNode);
    procedure SetChildsChecked(parentNode: TTreeNode; checked: boolean);
    procedure SetSBLX(const Value: integer);
    function Find(SBBH: string; node: TTreeNode): TTreeNode;
  public
    procedure AfterConstruction; override;   //类似OnCreate事件
    procedure BeforeDestruction; override;   //类型OnDestroy事件
    function CheckedItems: TList<TDevice>;
    function CheckedSBBH: string;
    procedure SetChecked(SBBH: string);
  published
    property SBLX: integer read FSBLX write SetSBLX;
    property Location: boolean read FLocation write FLocation;
  end;

implementation

{$R *.dfm}

{ TDeviceTreeFrame }

procedure TDeviceTreeFrame.AfterConstruction;
begin
  inherited;
  FDeviceList := TObjectList<TDevice>.Create;
  FCheckedDic := TDictionary<integer, boolean>.Create;
end;

procedure TDeviceTreeFrame.BeforeDestruction;
begin
  inherited;
  FDeviceList.Free;
  FCheckedDic.Free;
end;

function TDeviceTreeFrame.CheckedItems: TList<TDevice>;
begin
  result := TList<TDevice>.Create;
  GetCheckedItems(result, tree.Items.GetFirstNode);
end;

function TDeviceTreeFrame.CheckedSBBH: string;
var
  list: TList<TDevice>;
  device: TDevice;
begin
  result := '';
  list := CheckedItems;
  for device in list do
  begin
    result := result + ',' + device.SBBH;
  end;
  if result <> '' then
    result := result.Substring(1);
  list.Free;
end;

procedure TDeviceTreeFrame.editKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SpeedButton1Click(nil);
  end;
end;

procedure TDeviceTreeFrame.GetCheckedItems(list: TList<TDevice>;
  node: TTreeNode);
var
  child: TTreeNode;
begin
  if node = nil then exit;
  
  if node.HasChildren then
  begin
    child := node.getFirstChild;
    while child <> nil do
    begin
      GetCheckedItems(list, child);
      child := node.GetNextChild(child);
    end;
  end
  else begin
    if tree.GetChecked(node) then
      list.Add(TDevice(node.Data));
  end;
end;

procedure TDeviceTreeFrame.GenerateTree;
  procedure SetData(node: TTreeNode; bh: string);
  var
    i: integer;
  begin
    i := Length(FBranchList);
    SetLength(FBranchList, i+1);
    FBranchList[i] := bh;
    node.Data := Pointer(FBranchList[i]);
  end;
  function GetParentNode(parentNode: TTreeNode; pbh, bh, mc: string): TTreeNode;
  var
    s, ps: string;
  begin
    if parentNode=nil then
    begin
      result := tree.Items.Add(nil, mc);
      SetData(result, bh);
    end
    else begin
      result := parentNode;
      s := PChar(parentNode.Data);
      if s <> bh then
      begin
        if s = pbh then
        begin
          result := tree.Items.AddChild(parentNode, mc);
          SetData(result, bh);
        end
        else
          result := GetParentNode(result.Parent, pbh, bh, mc);
      end;
    end;
    result.ImageIndex := 0;
  end;
var
  parentNode, lkNode, devNode: TTreeNode;
  device: TDevice;
  dwdm: string;
begin
  tree.ReadOnly := false;
  tree.Items.BeginUpdate;
  tree.Items.Clear;
  FDeviceList.Clear;
  FCheckedDic.Clear;
  parentNode := nil;
  lkNode := nil;
  dwdm := gUser.Dwdm;
  while dwdm.Substring(dwdm.Length-1) = '0' do
    dwdm := dwdm.Substring(0, dwdm.Length - 1);
  with TFDQuery.Create(nil) do
  begin
    Connection := dm.conServer;
    SQL.Add('select a.CJJG,a.SBBH,a.SBDDMC,isnull(a.LKBH,'''') as LKBH, ');
    SQL.Add('isnull(a.LKMC, ''未命名路口'') as LKMC, ');
    SQL.Add('isnull(a.LDBH,''未编号路段'') as LDBH, ');
    SQL.Add('b.PDWDM, b.DWMC,datediff(minute,c.GXSJ,getdate()) as minutes');
    SQL.Add('from S_DEVICE a ');
    SQL.Add('left join S_DEPT b on CJJG=DWDM ');
    SQL.Add('left join S_DEVICE_TYPE c on a.sbbh=c.sbbh');
    SQL.Add('where a.QYZT=''1'' and a.CJJG like '''+dwdm+'%''');
    if (SBLX = 1) or (SBLX = 2) then
    begin
      SQL.Add(' and a.SBLX = ''' + SBLX.ToString() + ''' ');
    end;
    if FLocation then
    begin
      SQL.Add(' and a.SBJD>0 ');
    end;

    if self.edit.Text<>'' then
      SQL.Add('and a.SBBH+a.SBDDMC like ''%'+self.edit.Text+'%'' ');
    SQL.Add('order by a.CJJG, a.LKMC, a.SBDDMC ');
    open;
    DisableControls;
    while not eof do
    begin
      device := TDevice.Create;
      device.DWDM := Fields[0].AsString;
      device.SBBH := Fields[1].AsString;
      device.SBMC := Fields[2].AsString;
      device.LKBH := Fields[3].AsString;
      device.LKMC := Fields[4].AsString;
      device.LDBH := Fields[5].AsString;
      device.PDWDM := Fields[6].AsString;
      device.DWMC := Fields[7].AsString;
      device.Status := (not Fields[8].IsNull) and (Fields[8].AsInteger < 30);
      parentNode := GetParentNode(parentNode, device.PDWDM, device.DWDM, device.DWMC);
      if (lkNode = nil) or (lkNode.Text <> device.LKMC) or (lkNode.Parent <> parentNode) then
      begin
        lkNode := tree.Items.AddChild(parentNode, device.LKMC);
        lkNode.ImageIndex := 0;
      end;
      devNode := tree.Items.AddChildObject(lkNode, device.SBMC, device);
      if device.Status then
        devNode.ImageIndex := 0
      else
        devNode.ImageIndex := 1;
      FDeviceList.Add(device);

      Next;
    end;
    Free;
  end;
  parentNode := tree.Items.GetFirstNode;
  if parentNode <> nil then
  begin
    parentNode.Expanded := true;
    //if parentNode.HasChildren then
    //  parentNode.getFirstChild.Expanded := true;
  end;
  tree.Items.EndUpdate;
  tree.ReadOnly := true;
end;

procedure TDeviceTreeFrame.SpeedButton1Click(Sender: TObject);
begin
  self.GenerateTree;
end;

procedure TDeviceTreeFrame.Timer1Timer(Sender: TObject);
var
  node: TTreeNode;
begin
  self.GenerateTree;
  if FSBBHToChecked <> '' then
  begin
    node := Find(FSBBHToChecked, tree.Items.GetFirstNode);
    if node <> nil then
    begin
      tree.SetChecked(node, true);
      while node.Parent <> nil do
      begin
        node.Parent.Expanded := true;
        node := node.Parent;
      end;
    end;
  end;
  Timer1.Enabled := false;
end;

procedure TDeviceTreeFrame.treeClick(Sender: TObject);
var
  checked: boolean;
  node: TTreeNode;
begin
  node := GetChangedItem;
  if node <> nil then
  begin
    checked := tree.GetChecked(node);
    SetChildsChecked(node, checked);
  end;
end;

function TDeviceTreeFrame.GetChangedItem: TTreeNode;
var
  node: TTreeNode;
begin
  for node in tree.Items do
  begin
    if FCheckedDic.ContainsKey(integer(node.ItemId)) <> tree.GetChecked(node) then
    begin
      result := node;
      exit;
    end;
  end;
  result := nil;
end;

procedure TDeviceTreeFrame.SetChildsChecked(parentNode: TTreeNode; checked: boolean);
var
  node: TTreeNode;
begin
  if checked then
  begin
    if not FCheckedDic.ContainsKey(integer(parentNode.ItemId)) then
      FCheckedDic.Add(integer(parentNode.ItemId), true);
  end
  else
    FCheckedDic.Remove(integer(parentNode.ItemId));
  node := parentNode.getFirstChild;
  while node <> nil do
  begin
    tree.SetChecked(node, checked);
    SetChildsChecked(node, checked);
    node := parentNode.GetNextChild(node);
  end;
end;

procedure TDeviceTreeFrame.SetSBLX(const Value: integer);
begin
  FSBLX := Value;
end;

procedure TDeviceTreeFrame.SetChecked(SBBH: string);
begin
  FSBBHToChecked := SBBH;
end;

function TDeviceTreeFrame.Find(SBBH: string; node: TTreeNode): TTreeNode;
var
  child: TTreeNode;
begin
  result := nil;
  if node = nil then exit;
  if node.HasChildren then
  begin
    child := node.getFirstChild;
    while child <> nil do
    begin
      result := Find(SBBH, child);
      if result <> nil then exit;
      child := node.GetNextChild(child);
    end;
  end
  else if TDevice(node.Data).SBBH = SBBH then
  begin
    result := node;
  end
end;

end.
