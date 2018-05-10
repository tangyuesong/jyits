{ ******************************************************* }
{ }
{ 创建日期: 2008-07-17 }
{ 作    者: 汤岳松 }
{ 描    述: 封装了数据库的一些操作 }
{ }
{ ******************************************************* }
unit uSQLHelper;

interface

uses
  Classes, Activex, SysUtils, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageXML,
  FireDAC.Stan.StorageJSON, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.DApt,
  FireDAC.Phys.ODBCBase;

type
  TSQLHelperError = procedure(const SQL, Description: string) of object;

  TSQLHelper = class
  private
    FOnError: TSQLHelperError;
    FDBName: String;
    FDBServer: String;
    FDBUser: String;
    FDBPWD: String;
    FDBType: string;
    FNT: boolean;
    FConnection: TFDConnection;
    function BuildQuery(SQLString: String): TFDQuery; overload;
    function BuildQuery(SQLStringList: TStrings): TFDQuery; overload;
    procedure DoError(const SQL, Description: string);
    procedure SetOnError(const Value: TSQLHelperError);
    procedure SetDBName(const Value: String);
    procedure SetDBPWD(const Value: String);
    procedure SetDBServer(const Value: String);
    procedure SetDBUser(const Value: String);
    procedure SetDBType(const Value: string);
    function GetConnection: TFDConnection;
  public
    constructor Create; overload;
    constructor Create(DBServer, DBDataBase, DBUserName,
      DBPassword: string); overload;
    destructor Destroy; override;
    function GetSinge(SQLString: String): string; overload;
    function GetSinge(fieldName, TableName, where: String): String; overload;
    function GetMaxID(fieldName, TableName: string): integer;
    function ExistsRecord(TableName, where: string): boolean;
    function ExistsTable(TableName: String): boolean;
    function ExecuteSql(SQLString: string): boolean;
    function ExecuteSql1(SQLString: string; params: TFDParams): boolean;
    function Query(TableName, where: string; FieldNames: String = '*')
      : TFDQuery; overload;
    function Query(SQLString: String): TFDQuery; overload;
    function ExecuteSqlTran(SQLStringList: TStrings): boolean;
    function Enabled: boolean;
    property OnError: TSQLHelperError read FOnError write SetOnError;
    property DBUser: String read FDBUser write SetDBUser;
    property DBPWD: String read FDBPWD write SetDBPWD;
    property DBName: String read FDBName write SetDBName;
    property DBServer: String read FDBServer write SetDBServer;
    property DBType: string read FDBType write SetDBType;
    property NT: boolean read FNT write FNT;
    property Connection: TFDConnection read GetConnection write FConnection;
  end;

implementation

{ TSQLHelper }

function TSQLHelper.BuildQuery(SQLString: String): TFDQuery;
var
  qy: TFDQuery;
begin
  CoInitialize(nil);
  qy := TFDQuery.Create(nil);
  qy.Connection := self.Connection;
  qy.SQL.Text := SQLString;
  qy.DisableControls;
  result := qy;
end;

function TSQLHelper.BuildQuery(SQLStringList: TStrings): TFDQuery;
var
  qy: TFDQuery;
begin
  CoInitialize(nil);
  qy := TFDQuery.Create(nil);
  qy.Connection := self.Connection;
  qy.SQL.AddStrings(SQLStringList);
  qy.DisableControls;
  result := qy;
end;

function TSQLHelper.ExecuteSql(SQLString: string): boolean;
var
  qy: TFDQuery;
begin
  result := false;
  qy := BuildQuery(SQLString);

  if FConnection.Connected then
  begin
    try
      qy.ExecSQL;
      result := true;
    except
      on e: Exception do
      begin
        DoError(SQLString, e.Message);
      end;
    end;
  end;
  qy.Close;
  qy.Free;
end;

function TSQLHelper.ExecuteSql1(SQLString: string; params: TFDParams): boolean;
var
  qy: TFDQuery;
begin
  result := false;
  qy := BuildQuery(SQLString);
  qy.Params := params;
  if FConnection.Connected then
  begin
    try
      qy.ExecSQL;
      result := true;
    except
      on e: Exception do
      begin
        DoError(SQLString, e.Message);
      end;
    end;
  end;
  qy.Close;
  qy.Free;
end;

function TSQLHelper.ExecuteSqlTran(SQLStringList: TStrings): boolean;
var
  qy: TFDQuery;
begin
  result := false;
  qy := BuildQuery(SQLStringList);
  if FConnection.Connected then
  begin
    try
      qy.Connection.StartTransaction;
      qy.ExecSQL;
      qy.Connection.Commit;
      result := true;
    except
      on e: Exception do
      begin
        if qy.Connection <> nil then
          qy.Connection.Rollback;
        DoError(SQLStringList.Text, e.Message);
      end;
    end;
  end;
  qy.Close;
  qy.Free;
end;

function TSQLHelper.ExistsRecord(TableName, where: string): boolean;
var
  qy: TFDQuery;
  s: String;
begin
  result := false;
  s := 'select * from ' + TableName + ' ';
  if pos('where', where) = 0 then
    s := s + 'where ';
  s := s + where;
  qy := Query(s);
  if qy.Active then
  begin
    if not qy.IsEmpty then
      result := true;
  end;
  qy.Close;
  qy.Free;
end;

function TSQLHelper.ExistsTable(TableName: String): boolean;
var
  qy: TFDQuery;
  database: string;
begin
  result := false;
  database := copy(TableName, 1, pos('.', TableName));
  if database <> '' then
  begin
    TableName := copy(TableName, length(database) + 1, length(TableName));
    TableName := copy(TableName, pos('.', TableName) + 1, length(TableName));
  end;
  qy := Query('select * from ' + database + 'dbo.sysObjects where name=''' +
    TableName + '''');
  if qy.Active then
  begin
    if not qy.IsEmpty then
      result := true;
  end;
  qy.Close;
  qy.Free;
end;

function TSQLHelper.GetMaxID(fieldName, TableName: string): integer;
var
  strSql: string;
  qy: TFDQuery;
begin
  result := 1;
  strSql := 'select max(' + fieldName + ')+1 from ' + TableName;
  qy := Query(strSql);
  if qy.Active then
  begin
    if not qy.Fields[0].IsNull then
      try
        result := qy.Fields[0].AsInteger;
      except
        on e: Exception do
          DoError(strSql, e.Message);
      end;
  end;
  qy.Close;
  qy.Free;
end;

function TSQLHelper.Query(TableName, where, FieldNames: String): TFDQuery;
var
  SQL: String;
begin
  SQL := 'select ' + FieldNames + ' from ' + TableName + ' ';
  if pos('where', where) = 0 then
    SQL := SQL + 'where ';
  SQL := SQL + where;
  result := Query(SQL);
end;

function TSQLHelper.Query(SQLString: String): TFDQuery;
begin
  result := BuildQuery(SQLString);
  if FConnection.Connected then
  begin
    try
      result.Open;
    except
      on e: Exception do
        DoError(SQLString, e.Message);
    end;
  end;
end;

function TSQLHelper.GetSinge(SQLString: String): string;
var
  qy: TFDQuery;
begin
  result := '';
  qy := Query(SQLString);
  if qy.Active then
  begin
    if (not qy.IsEmpty) and (not qy.Fields[0].IsNull) then
      result := qy.Fields[0].AsString;
  end;
  qy.Close;
  qy.Free;
end;

function TSQLHelper.GetSinge(fieldName, TableName, where: String): String;
var
  qy: TFDQuery;
begin
  result := '';
  qy := Query(TableName, where, fieldName);
  if qy.Active then
    if not qy.IsEmpty then
      if not qy.Fields[0].IsNull then
        result := qy.Fields[0].AsString;
  qy.Close;
  qy.Free;
end;

constructor TSQLHelper.Create(DBServer, DBDataBase, DBUserName,
  DBPassword: string);
begin
  FDBServer := DBServer;
  FDBName := DBDataBase;
  FDBUser := DBUserName;
  FDBPWD := DBPassword;
  inherited Create;
end;

constructor TSQLHelper.Create();
begin
  FNT := false;
end;

destructor TSQLHelper.Destroy;
begin
  if Assigned(FConnection) then
  begin
    if FConnection.Connected then
      FConnection.Close;
    FConnection.Free;
  end;

  inherited;
end;

procedure TSQLHelper.DoError(const SQL, Description: string);
begin
  if Assigned(FOnError) then
    FOnError(SQL, Description);
end;

procedure TSQLHelper.SetOnError(const Value: TSQLHelperError);
begin
  FOnError := Value;
end;

function TSQLHelper.Enabled: boolean;
begin
  result := GetConnection.Connected;
end;

function TSQLHelper.GetConnection: TFDConnection;
begin
  if not Assigned(FConnection) then
  begin
    FConnection := TFDConnection.Create(nil);
    FConnection.DriverName := 'MSSQL';
    FConnection.Params.Values['DriverID'] := 'MSSQL';
    FConnection.Params.Values['Server'] := self.FDBServer;
    FConnection.Params.Values['Database'] := self.DBName;
    FConnection.Params.Values['user_name'] := self.FDBUser;
    FConnection.Params.Values['password'] := self.FDBPWD;
    if self.FNT then
      FConnection.Params.Values['OSAuthent'] := 'Yes'
    else
      FConnection.Params.Values['OSAuthent'] := 'No';
    FConnection.LoginPrompt := false;
  end;
  if not FConnection.Connected then
  begin
    try
      FConnection.Open;
    except
      on e: Exception do
      begin
        DoError('', e.Message);
      end;
    end;
  end;
  result := FConnection;
end;

procedure TSQLHelper.SetDBName(const Value: String);
begin
  if self.FDBName <> Value then
  begin
    FDBName := Value;
    if Assigned(FConnection) then
      FreeAndNil(FConnection);
  end;
end;

procedure TSQLHelper.SetDBPWD(const Value: String);
begin
  if self.FDBPWD <> Value then
  begin
    FDBPWD := Value;
    if Assigned(FConnection) then
      FreeAndNil(FConnection);
  end;
end;

procedure TSQLHelper.SetDBServer(const Value: String);
begin
  if self.FDBServer <> Value then
  begin
    FDBServer := Value;
    if Assigned(FConnection) then
      FreeAndNil(FConnection);
  end;
end;

procedure TSQLHelper.SetDBUser(const Value: String);
begin
  if self.FDBUser <> Value then
  begin
    FDBUser := Value;
    if Assigned(FConnection) then
      FreeAndNil(FConnection);
  end;
end;

procedure TSQLHelper.SetDBType(const Value: string);
begin
  FDBType := Value;
end;

end.
