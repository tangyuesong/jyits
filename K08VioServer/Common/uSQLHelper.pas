unit uSQLHelper;

interface

uses
  Classes,Activex, SysUtils,DB, ADODB;

type
  TSQLHelperError = procedure(const SQL, Description: string);

  TSQLHelper = class
  private
    FConnectionstring: string;
    FOnError: TSQLHelperError;
    FDBName: String;
    FDBServer: String;
    FDBUser: String;
    FDBPWD: String;
    FDBType: string;
    function BuildQuery(SQLString: String): TADOQuery;overload;
    function BuildQuery(SQLStringList: TStrings): TADOQuery;overload;
    procedure DoError(const SQL, Description: string);
    procedure SetOnError(const Value: TSQLHelperError);
    procedure SetDBName(const Value: String);
    procedure SetDBPWD(const Value: String);
    procedure SetDBServer(const Value: String);
    procedure SetDBUser(const Value: String);
    procedure SetDBType(const Value: string);
    function GetConnectionString: string;
  public
    constructor Create;overload;
    constructor Create(DBServer, DBDataBase, DBUserName, DBPassword: string);overload;
    constructor Create(AConnectionString: string);overload;
    function GetSinge(SQLString: String):string;overload;
    function GetSinge(fieldName,TableName,where: String):String;overload;
    function GetMaxID(FieldName, TableName: string):integer;
    function ExistsRecord(TableName, where: string):boolean;
    function ExistsTable(TableName: String):boolean;
    function ExecuteSql(SQLString: string):boolean;
    function Query(TableName, where: string; FieldNames: String = '*'):TADOQuery;overload;
    function Query(SQLString: String):TADOQuery;overload;
    function ExecuteSqlTran(SQLStringList: TStrings):boolean;
    function Enabled: boolean;
    property ConnectionString: string read GetConnectionString write FConnectionString;
    property OnError: TSQLHelperError read FOnError write SetOnError;
    property DBUser:String read FDBUser write SetDBUser;
    property DBPWD:String read FDBPWD write SetDBPWD;
    property DBName:String read FDBName write SetDBName;
    property DBServer:String read FDBServer write SetDBServer;
    property DBType: string read FDBType write SetDBType;
  end;

implementation

{TSQLHelper}


function TSQLHelper.BuildQuery(SQLString: String): TADOQuery;
var
  qy: TADOQuery;
begin
  CoInitialize(nil);
  qy := TADOQuery.Create(nil);
  qy.ConnectionString := self.Connectionstring;
  qy.ParamCheck := false;
  qy.CommandTimeout := 0;
  qy.sql.Text := SQLString;
  qy.DisableControls;
  result := qy;
end;

function TSQLHelper.BuildQuery(SQLStringList: TStrings): TADOQuery;
var
  qy: TADOQuery;
begin
  CoInitialize(nil);
  qy := TADOQuery.Create(nil);
  qy.ConnectionString := self.Connectionstring;
  qy.ParamCheck := false;
  qy.CommandTimeout := 0;
  qy.sql.AddStrings(SQLStringList);
  qy.DisableControls;
  result := qy;
end;

function TSQLHelper.ExecuteSql(SQLString: string): boolean;
var
  qy: TADOQuery;
begin
  result := true;
  qy := buildQuery(SqlString);
  try
    qy.execSql;
  except
    on e: Exception do
    begin
      result := false;
      DoError(SqlString, e.Message);
    end;
  end;

  qy.Free;
end;

function TSQLHelper.ExecuteSqlTran(SQLStringList: TStrings): boolean;
var
  qy: TADOQuery;
begin
  result := false;
  qy := BuildQuery(SQLStringList);
  try
    if qy.Connection <> nil then qy.Connection.BeginTrans;
    qy.execSql;
    if qy.Connection <> nil then qy.Connection.CommitTrans;
    result := true;
  except
    on e: Exception do
    begin
      if qy.Connection <> nil then qy.Connection.RollbackTrans;
      DoError(SQLStringList.Text, e.Message);
    end;
  end;
  qy.Free;
end;

function TSQLHelper.ExistsRecord(TableName, where: string): boolean;
var
  qy: TADOQuery;
  s: String;
begin
  result := false;
  s := 'select * from '+TableName+' ';
  if pos('where',where)=0 then s := s+'where ';
  s := s+where;
  qy := Query(s);
  if qy.Active then
  begin
    if not qy.IsEmpty then
      result := true;
  end;
  qy.Free;
end;

function TSQLHelper.ExistsTable(TableName: String): boolean;
var
  qy: TADOQuery;
  database: string;
begin
  result := false;
  database := copy(tablename, 1, pos('.', tablename));
  if database<>'' then
  begin
    tablename := copy(tablename, length(database)+1, length(tablename));
    tablename := copy(tablename,pos('.', tablename)+1, length(tablename));
  end;
  qy := query('select 1 from '+database+'dbo.sysObjects with(NOLOCK) where name='''+tableName+'''');
  if qy.Active then
  begin
    if not qy.IsEmpty then
      result := true;
  end;
  qy.Free;
end;

function TSQLHelper.GetMaxID(FieldName, TableName: string):integer;
var
	strSql: string;
  qy: TADOQuery;
begin
  result := 1;
	strsql := 'select max(' + FieldName + ')+1 from ' + TableName;
  qy := query(strsql);
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

function TSQLHelper.Query(TableName, where,
  FieldNames: String): TADOQuery;
var
  sql: String;
begin
  sql := 'select '+FieldNames+' from '+TableName+' ';
  if pos('where',where)=0 then sql := sql + 'where ';
  sql := sql + where;
  result := query(sql);
end;

function TSQLHelper.Query(SQLString: String): TADOQuery;
begin
  result := BuildQuery(SQLString);
  try
    result.Open;
  except
    on e: Exception do
      DoError(SQLString, e.Message);
  end;
end;

function TSQLHelper.GetSinge(SQLString: String): string;
var
  qy: TADOQuery;
begin
  result := '';
  qy := query(sqlstring);
  if qy.Active then
  begin
    if not qy.IsEmpty then
      if not qy.Fields[0].isnull then
        result := qy.Fields[0].AsString;
  end;
  qy.Close;
  qy.Free;
end;

function TSQLHelper.GetSinge(fieldName, TableName, where: String): String;
var
  qy: TADOQuery;
begin
  result := '';
  qy := query(tablename,where,fieldname);
  if qy.Active then
    if not qy.IsEmpty then
      if not qy.Fields[0].IsNull then
       result := qy.Fields[0].AsString;
  qy.Free;
end;

constructor TSQLHelper.Create(DBServer, DBDataBase, DBUserName,
  DBPassword: string);
begin
  FDBServer := DBServer;
  FDBName := DBDataBase;
  FDBUser := DBUserName;
  FDBPWD := DBPassword;
end;

constructor TSQLHelper.Create(AConnectionString: string);
begin
  self.FConnectionstring := AConnectionString;
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
var
  conn: TADOConnection;
begin
  result := true;
  conn := TADOConnection.Create(nil);
  conn.ConnectionString := Connectionstring;
  conn.LoginPrompt := false;
//  conn.ConnectionTimeout := 2;
  try
    conn.Open;
  except
    result := false;
  end;
  conn.Free;
end;

constructor TSQLHelper.Create;
begin

end;

procedure TSQLHelper.SetDBName(const Value: String);
begin
  if self.FDBUser <> value then
  begin
    FDBName := Value;
    FConnectionString := '';
  end;
end;

procedure TSQLHelper.SetDBPWD(const Value: String);
begin
  if self.FDBUser <> value then
  begin
    FDBPWD := Value;
    FConnectionString := '';
  end;
end;

procedure TSQLHelper.SetDBServer(const Value: String);
begin
  if self.FDBUser <> value then
  begin
    FDBServer := Value;
    FConnectionString := '';
  end;
end;

procedure TSQLHelper.SetDBUser(const Value: String);
begin
  if self.FDBUser <> value then
  begin
    FDBUser := Value;
    FConnectionString := '';
  end;
end;

procedure TSQLHelper.SetDBType(const Value: string);
begin
  FDBType := Value;
end;

function TSQLHelper.GetConnectionString: string;
begin
  if FConnectionString = '' then
  begin
    FConnectionString := 'Provider=SQLOLEDB.1;Password='+FDBPwd
    +';Persist Security Info=True;User ID='+DBUser
    +';Initial Catalog='+DBName
    +';Data Source='+DBServer;
  end;
  Result := FConnectionString;
end;

end.












