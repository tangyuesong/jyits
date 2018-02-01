unit uJQThread;

interface

uses
  System.Classes, SysUtils, ActiveX, IniFiles,
  FireDAC.Stan.Option, uLogger, Vcl.ExtCtrls, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.OracleDef, FireDAC.Phys.Oracle, DB, ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Def, FireDAC.DApt, FireDAC.Phys, Variants,
  FireDAC.Phys.ODBCBase, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Stan.Async, FireDAC.Comp.Client, uGlobal;

type
  TJQThread = class(TThread)
  private
    FConnOra: TFDConnection;
    function DownLoadData: Boolean;
    function GetConn: boolean;
    function GetFields(tableName: string): string;
    function GetMaxGxsj: double;
    function ImportData(qyOra: TFDQuery): boolean;
    function QueryDataFromOracle: TFDQuery;
    procedure SQLError(const SQL, Description: string);
  protected
    procedure Execute; override;
  public
    constructor Create; overload;
  end;

implementation

{ TJQThread }

constructor TJQThread.Create;
begin
  inherited Create(false);
  FreeOnTerminate := true;
  ActiveX.CoInitialize(nil);
end;

procedure TJQThread.Execute;
var
  tmp: string;
begin
  if gJQOraConfig.DBServer <> '' then
  begin
    gLogger.Info('JQThread Started');
    if GetConn then
    begin
      tmp := gJQOraConfig.DBServer;
      gJQOraConfig.DBServer := '';   // 避免上次还未跑完
      DownLoadData;
      gJQOraConfig.DBServer := tmp;
    end;
    FConnOra.Free;
    gLogger.Info('JQThread Finished');
  end;
end;

function TJQThread.GetConn: boolean;
begin
  result := true;

  FConnOra := TFDConnection.Create(nil);
  FConnOra.Params.Add('DriverID=Ora');
  FConnOra.Params.Add(Format('Database=(DESCRIPTION = (ADDRESS_LIST = ' +
    '(ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))' +
    '(CONNECT_DATA = (SID = %s)))', [gJQOraConfig.DBServer, gJQOraConfig.DBPort.ToString, gJQOraConfig.DBName]));
  FConnOra.Params.Add('User_Name=' + gJQOraConfig.DBUser);
  FConnOra.Params.Add('Password=' + gJQOraConfig.DBPwd);
  FConnOra.Params.Add('CharacterSet=UTF8'); // 否则中文乱码
  FConnOra.LoginPrompt := false;

  try
    FConnOra.Open();
  except
    on e: exception do
    begin
      glogger.Error('GetConn:' + e.Message + FConnOra.Params.Text);
      result := false;
    end;
  end;
end;

function TJQThread.GetMaxGxsj: double;
var
  s: string;
begin
  s := gSQLHelper.GetSinge('select Max(FASJCZ) from T_JingQing');
  if s = '' then
    s := '2014/01/01';
  result := VarToDatetime(s);
end;

function TJQThread.QueryDataFromOracle: TFDQuery;
var
  maxTime: double;
begin
  maxTime := GetMaxGxsj;
  result := TFDQuery.Create(nil);
  result.DisableControls;
  result.Connection := FConnOra;
  result.SQL.Add('select AJBH,SLJJDW,SLJJRY,AJSSJQ,JQLB,RESERVATION05_CN,ZYAQ,FASJCZ FROM PCS_YYK_DATA.YB_ASJ_JQ ');
  result.SQL.Add('WHERE FASJCZ > TO_DATE('''+FormatDateTime('yyyy-mm-dd hh:mm:ss', maxTime)+''',''yyyy-mm-dd hh24:mi:ss'') and ');
  result.SQL.Add('(JQLB = ''04'' or JQLB = ''05'' or RESERVATION05_CN like ''%交通%'' or RESERVATION05_CN like ''%驾驶%'')');  //
  //result.Params.ParamByName('gxsj').AsDateTime := maxTime
  try
    result.Open;
    glogger.Info('QueryQJFromOracle OK');
  except
    on e: exception do
    begin
      glogger.Error('QueryJQFromOracle:' + e.Message + result.SQL.Text);
    end;
  end;
end;

procedure TJQThread.SQLError(const SQL, Description: string);
begin
  glogger.Error(Description + #13 + SQL);
end;

function TJQThread.DownLoadData: Boolean;
var
  qyOra: TFDQuery;
begin
  qyOra := QueryDataFromOracle;

  if not qyOra.Eof then
  begin
    try
      Result:= ImportData(qyOra);
    except
      on e: exception do
      begin
        glogger.Error(e.Message);
        Result:= False;
      end;
    end;
  end;
  qyOra.Free;
end;

function TJQThread.GetFields(tableName: string): string;
var
  i: integer;
begin
  result := '';
  with gSQLHelper.Query('select * from ' + tableName + ' where 1=0') do
  begin
    if Active then
    begin
      for i := 0 to FieldCount - 1 do
      begin
        if (uppercase(Fields[i].fieldname) <> 'SYSTEMID') and (uppercase(Fields[i].fieldname) <> 'BZ') then
        begin
          result := result + ',' + Fields[i].fieldname;
        end;
      end;
      result := result.Substring(1);
    end;
    Free;
  end;
end;

function TJQThread.ImportData(qyOra: TFDQuery): boolean;
var
  ss: tstrings;
  SQL, fieldNames, s: string;
  i: integer;
  fieldArr: TArray<string>;
  gxsj: double;
begin
  SQL := 'if exists(select 1 from sysobjects where name = ''tmp_T_JingQing'')'
     +' drop table tmp_T_JingQing'
     +' select * into tmp_T_JingQing from T_JingQing where 1=0';
  gSQLHelper.ExecuteSql(SQL);

  SQL := 'if exists(select 1 from syscolumns '
    + 'where object_name(id) = ''tmp_T_JingQing'' and name = ''systemid'') '
    + 'alter table tmp_T_JingQing drop column systemid ';
  gSQLHelper.ExecuteSQL(SQL);

  fieldNames := GetFields('tmp_T_JingQing');
  fieldArr := fieldNames.Split([',']);
  ss := TStringList.Create;
  while not qyOra.Eof do
  begin
    s := '';
    for i := 0 to length(fieldArr) - 1 do
    begin
      s := s + ',' + qyOra.FieldByName(fieldArr[i]).AsString.QuotedString
    end;
    ss.Add(',(' + s.Substring(1) + ')');
    if ss.Count = 999 then
    begin
      if gSQLHelper.ExecuteSql('insert into tmp_T_JingQing(' + fieldNames + ')values' + ss.Text.Substring(1)) then
        glogger.Info('[InsertIntoTmp](' + ss.Count.ToString + ', 0) OK ');
      ss.Clear;
    end;
    qyOra.Next;
  end;

  if ss.Count > 0 then
  begin
    if gSQLHelper.ExecuteSql('insert into tmp_T_JingQing(' + fieldNames + ')values' + ss.Text.Substring(1)) then
      glogger.Info('[InsertIntoTmp](' + ss.Count.ToString + ', 0) OK ');

    ss.Clear;
    ss.Add('delete a from T_JingQing a inner join tmp_T_JingQing b ');
    fieldArr := 'AJBH'.Split([',']);
    for i := 0 to Length(fieldArr) - 1 do
    begin
      if i = 0 then
        ss.Add('on a.' + fieldArr[i] + ' = b.' + fieldArr[i])
      else
        ss.Add(' and a.' + fieldArr[i] + ' = b.' + fieldArr[i]);
    end;
    ss.Add('insert into T_JingQing(' + fieldNames + ')');
    ss.Add('select ' + fieldNames + ' from tmp_T_JingQing');
    if gSQLHelper.ExecuteSql(ss.Text) then
      glogger.Info('tmp to data OK ');
  end;
  ss.Free;
  result := true;
end;

end.
