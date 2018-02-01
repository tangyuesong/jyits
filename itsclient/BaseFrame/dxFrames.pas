unit dxFrames;

interface

uses
  Classes, Forms, SysUtils, dxFrame, Controls;

type

  TdxFrameClass = Class of TFrame;

  TdxFrameInfo = class
  private
    FSystemID: String;
    FCaption: string;
    FCustomFrameClass: TdxFrameClass;
    FFrame: TFrame;
    FID: Integer;
    FImageIndex: Integer;
    FSideBarFirstAdditionalGroupIndex: Integer;
    FSideBarGroupIndex: Integer;
    FSideBarSecondAdditionalGroupIndex: Integer;
    function GetActive: Boolean;
  protected
  public
    constructor Create(ID: Integer; ClassType: TdxFrameClass; Caption: string;
      ImageIndex, SideBarGroupIndex1, SideBarGroupIndex2, SideBarGroupIndex3
      : Integer; SystemID: String);
    procedure CreateFrame(AOwner: TComponent);
    procedure DestroyFrame;
    procedure HideFrame;
    procedure ShowFrame(AParent: TWinControl);

    property Active: Boolean read GetActive;
    property Caption: string read FCaption;
    property ID: Integer read FID write FID;
    property SystemID: String read FSystemID write FSystemID;
    property SideBarGroupIndex: Integer read FSideBarGroupIndex;
    property SideBarFirstAdditionalGroupIndex: Integer
      read FSideBarFirstAdditionalGroupIndex;
    property SideBarSecondAdditionalGroupIndex: Integer
      read FSideBarSecondAdditionalGroupIndex;
    property ImageIndex: Integer read FImageIndex;
    property Frame: TFrame read FFrame;
  end;

  TdxFrameManager = class
  private
    FActiveFrameInfo: TdxFrameInfo;
    FFrameInfoList: TList;
    function GetActiveFrame: TFrame;
    function GetCount: Integer;
    function GetItem(Index: Integer): TdxFrameInfo;
    procedure AddNewItem(ANewItem: TdxFrameInfo);
  protected
    constructor CreateInstance;
    class function AccessInstance(Request: Integer): TdxFrameManager;
  public
    constructor Create;
    destructor Destroy; override;
    class function Instance: TdxFrameManager;
    class procedure ReleaseInstance;

    procedure RegisterFrame(FrameID: Integer; ClassType: TdxFrameClass;
      Caption: string; ImageIndex, SideBarGroupIndex1, SideBarGroupIndex2,
      SideBarGroupIndex3: Integer; SystemID: String);
    function ShowFrame(FrameID: Integer; Parent: TWinControl): TFrame;
    function GetFrameInfoByID(FrameID: Integer): TdxFrameInfo;
    function GetFrameInfoByCaption(ACaption: String): TdxFrameInfo;
    property ActiveFrame: TFrame read GetActiveFrame;
    property ActiveFrameInfo: TdxFrameInfo read FActiveFrameInfo
      write FActiveFrameInfo;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TdxFrameInfo read GetItem; default;
  end;

function dxFrameManager: TdxFrameManager;

implementation

function dxFrameManager: TdxFrameManager;
begin
  Result := TdxFrameManager.Instance;
end;

{ TdxFrameInfo }

constructor TdxFrameInfo.Create(ID: Integer; ClassType: TdxFrameClass;
  Caption: string; ImageIndex, SideBarGroupIndex1, SideBarGroupIndex2,
  SideBarGroupIndex3: Integer; SystemID: String);
begin
  inherited Create;
  FID := ID;
  FCustomFrameClass := ClassType;
  FCaption := Caption;
  FImageIndex := ImageIndex;
  FSideBarFirstAdditionalGroupIndex := SideBarGroupIndex1;
  FSideBarGroupIndex := SideBarGroupIndex2;
  FSideBarSecondAdditionalGroupIndex := SideBarGroupIndex3;
  FSystemID := SystemID;
end;

function TdxFrameInfo.GetActive: Boolean;
begin
  Result := Self = dxFrameManager.ActiveFrameInfo;
end;

procedure TdxFrameInfo.CreateFrame(AOwner: TComponent);
begin
  FFrame := FCustomFrameClass.Create(AOwner);
  FFrame.Align := alClient;
  // FFrame .Caption := FCaption;
end;

procedure TdxFrameInfo.DestroyFrame;
begin
  FFrame.Free;
  FFrame := nil;
end;

procedure TdxFrameInfo.HideFrame;
begin
  // FFrame.ChangeVisibility(False);
end;

procedure TdxFrameInfo.ShowFrame(AParent: TWinControl);
begin
  CreateFrame(AParent);
  FFrame.Parent := AParent;
  FFrame.Visible := True;
  // FFrame.ChangeVisibility(True);
end;

{ TdxFrameManager }

constructor TdxFrameManager.Create;
begin
  inherited Create;
  raise Exception.CreateFmt
    ('Can not create the second instance of the object %s', [ClassName]);
end;

destructor TdxFrameManager.Destroy;
var
  I: Integer;
begin
  if AccessInstance(0) = Self then
    AccessInstance(2);
  for I := 0 to Count - 1 do
    Items[I].Free;
  FFrameInfoList.Free;
  inherited Destroy;
end;

function TdxFrameManager.GetActiveFrame: TFrame;
begin
  if ActiveFrameInfo <> nil then
    Result := ActiveFrameInfo.Frame
  else
    Result := nil;
end;

function TdxFrameManager.GetCount: Integer;
begin
  Result := FFrameInfoList.Count;
end;

function TdxFrameManager.GetItem(Index: Integer): TdxFrameInfo;
begin
  Result := TdxFrameInfo(FFrameInfoList.Items[Index]);
end;

procedure TdxFrameManager.AddNewItem(ANewItem: TdxFrameInfo);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if Items[I].ID > ANewItem.ID then
    begin
      FFrameInfoList.Insert(I, Pointer(ANewItem));
      Exit;
    end;
  FFrameInfoList.Add(Pointer(ANewItem));
end;

constructor TdxFrameManager.CreateInstance;
begin
  inherited Create;
  FFrameInfoList := TList.Create;
end;

var
  FInstance: TdxFrameManager = nil;

class function TdxFrameManager.AccessInstance(Request: Integer)
  : TdxFrameManager;
begin
  case Request of
    0:
      ;
    1:
      if not Assigned(FInstance) then
        FInstance := CreateInstance;
    2:
      FInstance := nil;
  else
    raise Exception.CreateFmt('The access code %d is illegal', [Request]);
  end;
  Result := FInstance;
end;

function TdxFrameManager.GetFrameInfoByCaption(ACaption: String): TdxFrameInfo;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := Items[I];
    if Items[I].Caption = ACaption then
      Exit;
  end;
  Result := nil;
end;

function TdxFrameManager.GetFrameInfoByID(FrameID: Integer): TdxFrameInfo;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
  begin
    Result := Items[I];
    if Items[I].ID = FrameID then
      Exit;
  end;
  Result := nil;
end;

class function TdxFrameManager.Instance: TdxFrameManager;
begin
  Result := AccessInstance(1);
end;

class procedure TdxFrameManager.ReleaseInstance;
begin
  AccessInstance(0).Free;
end;

procedure TdxFrameManager.RegisterFrame(FrameID: Integer;
  ClassType: TdxFrameClass; Caption: string; ImageIndex, SideBarGroupIndex1,
  SideBarGroupIndex2, SideBarGroupIndex3: Integer; SystemID: String);
var
  FI: TdxFrameInfo;
begin
  FI := TdxFrameInfo.Create(FrameID, ClassType, Caption, ImageIndex,
    SideBarGroupIndex1, SideBarGroupIndex2, SideBarGroupIndex3, SystemID);
  AddNewItem(FI);
end;

function TdxFrameManager.ShowFrame(FrameID: Integer;
  Parent: TWinControl): TFrame;
var
  FrameInfo: TdxFrameInfo;
begin
  FrameInfo := GetFrameInfoByID(FrameID);
  if FrameInfo <> nil then
  begin
    FrameInfo.ShowFrame(Parent);
    Result := FrameInfo.Frame;
  end;
end;

initialization

finalization

TdxFrameManager.ReleaseInstance;

end.
