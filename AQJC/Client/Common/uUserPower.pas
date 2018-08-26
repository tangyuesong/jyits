unit uUserPower;

interface

uses
  System.Generics.Collections, Classes, uRequestItf, uJsonUtils;

type

  TMainMenu = Record
    SystemID: String;
    Caption: String;
    ImageIndex: Integer;
    OrderID: Integer;
  end;

  TChildMenu = Record
    SystemID: String;
    ParentID: String;
    Caption: String;
    ClassType: String;
    ImageIndex: Integer;
    OrderID: Integer;
  end;

  TAppFunction = Record
    SystemID: String;
    ParentID: String;
    ControlName: String;
    Caption: String;
  end;

  TRoleFunction = Record
    SystemID: String;
    RoleID: String;
    FunctionID: String;
  end;

  TRoleDevice = Record
    SystemID: String;
    RoleID: String;
    SBBH: String;
  end;

  TUserPower = Class
  private
    FAllMainMenu: TList<TMainMenu>;
    FAllChildMenu: TDictionary<String, TList<TChildMenu>>;
    FAllFunction: TDictionary<String, TList<TAppFunction>>;

    FAllControl: TDictionary<string, TStrings>;
    FUserMainMenu: TStrings;
    FUserChildMenu: TStrings;
    FUserFunction: TDictionary<string, TStrings>;
    function GetAllControl(): TDictionary<string, TStrings>;
    function GetUserMainMenu(): TStrings;
    function GetUserChildMenu(): TStrings;
    function GetUserFunction(): TDictionary<string, TStrings>;
    function GetAllMainMenu(): TList<TMainMenu>;
    function GetAllChildMenu: TDictionary<String, TList<TChildMenu>>;
    function GetAllFunction: TDictionary<String, TList<TAppFunction>>;
  public
    property AllControl: TDictionary<string, TStrings> read GetAllControl;
    // 程序所有的功能， key为菜单ID， values为ControlName
    property UserMainMenu: TStrings read GetUserMainMenu;
    property UserChildMenu: TStrings read GetUserChildMenu;
    property UserFunction: TDictionary<string, TStrings> read GetUserFunction;

    property AllMainMenu: TList<TMainMenu> read GetAllMainMenu;
    property AllChildMenu: TDictionary < String, TList < TChildMenu >>
      read GetAllChildMenu;
    property AllFunction: TDictionary < String, TList < TAppFunction >>
      read GetAllFunction;
    destructor Destroy; override;
  end;

implementation

uses
  uGlobal;

destructor TUserPower.Destroy;
var
  v: TStrings;
  cmList: TList<TChildMenu>;
  afList: TList<TAppFunction>;
begin
  if FAllControl <> nil then
  begin
    for v in FAllControl.Values do
      v.Free;
    FAllControl.Free;
  end;
  if FUserFunction <> nil then
  begin
    for v in FUserFunction.Values do
      v.Free;
    FUserFunction.Free;
  end;
  if FUserMainMenu <> nil then
    FUserMainMenu.Free;
  if FUserChildMenu <> nil then
    FUserChildMenu.Free;
  if FAllMainMenu <> nil then
    FAllMainMenu.Free;
  if FAllChildMenu <> nil then
  begin
    for cmList in FAllChildMenu.Values do
      cmList.Free;
    FAllChildMenu.Free;
  end;
  if FAllFunction <> nil then
  begin
    for afList in FAllFunction.Values do
      afList.Free;
    FAllFunction.Free;
  end;
  inherited;
end;

function TUserPower.GetAllChildMenu: TDictionary<String, TList<TChildMenu>>;
var
  list: TList<TChildMenu>;
  me: TChildMenu;
begin
  if FAllChildMenu = nil then
  begin
    FAllChildMenu := TDictionary < String, TList < TChildMenu >>.Create;
    list := TJsonUtils.RecordListSort<TChildMenu>
      (TJsonUtils.JsonToRecordList<TChildMenu>
      (TRequestItf.DbQuery('GetS_Menu_Child', 'activate=1')), 'OrderID');
    for me in list do
    begin
      if not FAllChildMenu.ContainsKey(me.ParentID) then
        FAllChildMenu.Add(me.ParentID, TList<TChildMenu>.Create);
      FAllChildMenu[me.ParentID].Add(me);
    end;
    list.Free;
  end;
  Result := FAllChildMenu;
end;

function TUserPower.GetAllControl: TDictionary<string, TStrings>;
var
  list: TList<TAppFunction>;
  me: TAppFunction;
begin
  if FAllControl = nil then
  begin
    FAllControl := TDictionary<string, TStrings>.Create;
    list := TJsonUtils.JsonToRecordList<TAppFunction>
      (TRequestItf.DbQuery('GetAllFunction'));
    for me in list do
    begin
      if not FAllControl.ContainsKey(me.SystemID) then
        FAllControl.Add(me.SystemID, TStringList.Create);
      FAllControl[me.SystemID].Add(me.ControlName);
    end;
    list.Free;
  end;
  Result := FAllControl;
end;

function TUserPower.GetAllFunction: TDictionary<String, TList<TAppFunction>>;
var
  list: TList<TAppFunction>;
  me: TAppFunction;
begin
  if FAllFunction = nil then
  begin
    FAllFunction := TDictionary < String, TList < TAppFunction >>.Create;
    list := TJsonUtils.RecordListSort<TAppFunction>
      (TJsonUtils.JsonToRecordList<TAppFunction>
      (TRequestItf.DbQuery('GetS_Menu_Function', 'Activate=1')), 'Caption');
    for me in list do
    begin
      if not FAllFunction.ContainsKey(me.ParentID) then
        FAllFunction.Add(me.ParentID, TList<TAppFunction>.Create);
      FAllFunction[me.ParentID].Add(me);
    end;
    list.Free;
  end;
  Result := FAllFunction;
end;

function TUserPower.GetAllMainMenu: TList<TMainMenu>;
begin
  if FAllMainMenu = nil then
  begin
    FAllMainMenu := TJsonUtils.RecordListSort<TMainMenu>
      (TJsonUtils.JsonToRecordList<TMainMenu>
      (TRequestItf.DbQuery('GetS_MENU_MAIN', 'activate=1')), 'OrderID');
  end;
  Result := FAllMainMenu
end;

function TUserPower.GetUserChildMenu: TStrings;
var
  list: TList<TChildMenu>;
  me: TChildMenu;
begin
  if FUserChildMenu = nil then
  begin
    FUserChildMenu := TStringList.Create;
    list := TJsonUtils.JsonToRecordList<TChildMenu>
      (TRequestItf.DbQuery('GetUserChildMenu', 'yhbh=' + gUser.YHBH));
    for me in list do
    begin
      if FUserChildMenu.IndexOf(me.SystemID) < 0 then
        FUserChildMenu.Add(me.SystemID);
    end;
    list.Free;
  end;
  Result := FUserChildMenu;
end;

function TUserPower.GetUserFunction: TDictionary<string, TStrings>;
var
  list: TList<TAppFunction>;
  me: TAppFunction;
begin
  if FUserFunction = nil then
  begin
    FUserFunction := TDictionary<string, TStrings>.Create;
    list := TJsonUtils.JsonToRecordList<TAppFunction>
      (TRequestItf.DbQuery('GetUserChildMenu', 'yhbh=' + gUser.YHBH));
    for me in list do
    begin
      if not FUserFunction.ContainsKey(me.SystemID) then
        FUserFunction.Add(me.SystemID, TStringList.Create);
      FUserFunction[me.SystemID].Add(me.ControlName);
    end;
    list.Free;
  end;
  Result := FUserFunction;
end;

function TUserPower.GetUserMainMenu: TStrings;
var
  list: TList<TMainMenu>;
  me: TMainMenu;
begin
  if FUserMainMenu = nil then
  begin
    FUserMainMenu := TStringList.Create;
    list := TJsonUtils.JsonToRecordList<TMainMenu>
      (TRequestItf.DbQuery('GetUserMainMenu', 'yhbh=' + gUser.YHBH));
    for me in list do
      FUserMainMenu.Add(me.SystemID);
    list.Free;
  end;
  Result := FUserMainMenu;
end;

end.
