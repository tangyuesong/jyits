{*******************************************************}
{                                                       }
{       创建日期: 2008-07-17                            }
{       作    者: 汤岳松                                }
{       描    述: 封装了数据库的一些操作                }
{                                                       }
{*******************************************************}
unit uOraHelper;

interface

uses
  Classes,Activex, SysUtils,DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageXML,
  FireDAC.Stan.StorageJSON, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.DApt, FireDAC.Phys.ODBCBase;

type
  TOraHelperError = procedure(const SQL, Description: string) of object;

  TOraHelper = class
  private
    FOnError: TOraHelperError;
    FSERVICE_NAME, FSID: String;
    FDBHost: String;
    FDBPort: integer;
    FDBUser: String;
    FDBPWD: String;
    FNT: boolean;
    FConnection: TFDConnection;
    function BuildQuery(SQLString: String): TFDQuery;overload;
    function BuildQuery(SQLStringList: TStrings): TFDQuery;overload;
    procedure DoError(const SQL, Description: string);
    procedure SetOnError(const Value: TOraHelperError);
    function GetConnection: TFDConnection;
  public
    constructor Create(DBHost, Service_name, SID, DBUserName, DBPassword: string; DBPort: integer = 1521);overload;
    destructor Destroy;override;
    function GetSinge(SQLString: String):string;overload;
    function GetSinge(fieldName,TableName,where: String):String;overload;
    function GetMaxID(FieldName, TableName: string):integer;
    function ExistsRecord(TableName, where: string):boolean;
    function ExistsTable(TableName: String):boolean;
    function ExecuteSql(SQLString: string):boolean;
    function Query(TableName, where: string; FieldNames: String = '*'):TFDQuery;overload;
    function Query(SQLString: String):TFDQuery;overload;
    function ExecuteSqlTran(SQLStringList: TStrings):boolean;
    function Enabled: boolean;
    property OnError: TOraHelperError read FOnError write SetOnError;
    property NT: boolean read FNT write FNT;
    property Connection: TFDConnection read GetConnection;
  end;

implementation

{TOraHelper}


function TOraHelper.BuildQuery(SQLString: String): TFDQuery;
var
  qy: TFDQuery;
begin
  CoInitialize(nil);
  qy := TFDQuery.Create(nil);
  qy.Connection := self.Connection;
  qy.sql.Text := SQLString;
  qy.DisableControls;
  result := qy;
end;

function TOraHelper.BuildQuery(SQLStringList: TStrings): TFDQuery;
var
  qy: TFDQuery;
begin
  CoInitialize(nil);
  qy := TFDQuery.Create(nil);
  qy.Connection := self.Connection;
  qy.sql.AddStrings(SQLStringList);
  qy.DisableControls;
  result := qy;
end;

function TOraHelper.ExecuteSql(SQLString: string): boolean;
var
  qy: TFDQuery;
begin
  result := true;
  qy := buildQuery(SqlString);
  try
    qy.ExecSQL;
  except
    on e: Exception do
    begin
      result := false;
      DoError(SqlString, e.Message);
    end;
  end;

  qy.Free;
end;

function TOraHelper.ExecuteSqlTran(SQLStringList: TStrings): boolean;
var
  qy: TFDQuery;
begin
  result := false;
  qy := BuildQuery(SQLStringList);
  try
    if qy.Connection <> nil then qy.Connection.StartTransaction;
    qy.ExecSQL;
    if qy.Connection <> nil then qy.Connection.Commit;
    result := true;
  except
    on e: Exception do
    begin
      if qy.Connection <> nil then qy.Connection.Rollback;
      DoError(SQLStringList.Text, e.Message);
    end;
  end;
  qy.Free;
end;

function TOraHelper.ExistsRecord(TableName, where: string): boolean;
var
  qy: TFDQuery;
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

function TOraHelper.ExistsTable(TableName: String): boolean;
var
  qy: TFDQuery;
  database: string;
begin
  result := false;
  database := copy(tablename, 1, pos('.', tablename));
  if database<>'' then
  begin
    tablename := copy(tablename, length(database)+1, length(tablename));
    tablename := copy(tablename,pos('.', tablename)+1, length(tablename));
  end;
  qy := query('select * from '+database+'dbo.sysObjects where name='''+tableName+'''');
  if qy.Active then
  begin
    if not qy.IsEmpty then
      result := true;
  end;
  qy.Free;
end;

function TOraHelper.GetMaxID(FieldName, TableName: string):integer;
var
	strSql: string;
  qy: TFDQuery;
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
	
function TOraHelper.Query(TableName, where,
  FieldNames: String): TFDQuery;
var
  sql: String;
begin
  sql := 'select '+FieldNames+' from '+TableName+' ';
  if pos('where',where)=0 then sql := sql + 'where ';
  sql := sql + where;
  result := query(sql);
end;

function TOraHelper.Query(SQLString: String): TFDQuery;
begin
  result := BuildQuery(SQLString);
  try
    result.Open;
  except
    on e: Exception do
      DoError(SQLString, e.Message);
  end;
end;

function TOraHelper.GetSinge(SQLString: String): string;
var
  qy: TFDQuery;
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

function TOraHelper.GetSinge(fieldName, TableName, where: String): String;
var
  qy: TFDQuery;
begin
  result := '';
  qy := query(tablename,where,fieldname);
  if qy.Active then
    if not qy.IsEmpty then
      if not qy.Fields[0].IsNull then
       result := qy.Fields[0].AsString;
  qy.Free;
end;

constructor TOraHelper.Create(DBHost, SERVICE_NAME, SID, DBUserName,
  DBPassword: string; DBPort: integer);
begin
  FDBHost := DBHost;
  FSERVICE_NAME := SERVICE_NAME;
  FSID := SID;
  FDBUser := DBUserName;
  FDBPWD := DBPassword;
  FDBPort := DBPort;
  inherited Create;
end;

destructor TOraHelper.Destroy;
begin
  if Assigned(FConnection) then
  begin
    if FConnection.Connected then
      FConnection.Close;
    FConnection.Free;
  end;

  inherited;
end;

procedure TOraHelper.DoError(const SQL, Description: string);
begin
  if Assigned(FOnError) then
    FOnError(SQL, Description);
end;

procedure TOraHelper.SetOnError(const Value: TOraHelperError);
begin
  FOnError := Value;
end;

function TOraHelper.Enabled: boolean;
begin
  result := GetConnection.Connected;
end;

function TOraHelper.GetConnection: TFDConnection;
begin
  if not Assigned(FConnection) then
  begin
    FConnection := TFDConnection.Create(nil);
    FConnection.FetchOptions.Mode := fmAll;
    FConnection.Params.Add('DriverID=Ora');
    if FSERVICE_NAME <> '' then
    begin
      FConnection.Params.Add
        (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
        + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
        [FDBHost, FDBPort.ToString, FSERVICE_NAME]));
    end
    else if FSID <> '' then
      FConnection.Params.Add
        (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
        + '(CONNECT_DATA = (SERVER = DEDICATED)(SID = %s)))',
        [FDBHost, FDBPort.ToString, FSID]))
    else
      DoError('', 'ora config error');

    FConnection.Params.Add(Format('User_Name=%s', [FDBUser]));
    FConnection.Params.Add(Format('Password=%s', [FDBPWD]));
    FConnection.Params.Add('CharacterSet=UTF8'); // 否则中文乱码
    FConnection.LoginPrompt := false;
  end;
  if not FConnection.Connected then
  begin
    try
      FConnection.Open;
    except
      on e: exception do
      begin
        DoError('', e.Message);
      end;
    end;
  end;
  result := FConnection;
end;

end.












