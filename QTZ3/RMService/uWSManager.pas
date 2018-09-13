unit uWSManager;

interface

uses
  Classes, SysUtils, SyncObjs;

type
  TWSManager = class
  private
    cs: TCriticalSection;
    class function UpdateWSBH(wsbh: string; flag: integer): boolean;
  public
    function Apply(yhbh, xzqh, wsbb, wslb: string; num: integer): string;
    function ApplyQWSG(yhbh, xzqh: String; num: integer): String;
    class function Rollback(wsbh: string): boolean;
    class function Submit(wsbh: string): boolean;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  uGlobal;

const
  MinWSBH = '445100100600000';

  { TWSManager }

constructor TWSManager.Create;
begin
  cs := TCriticalSection.Create;
end;

destructor TWSManager.Destroy;
begin
  cs.Free;
  inherited;
end;

function TWSManager.ApplyQWSG(yhbh, xzqh: String; num: integer): String;
  function GetWSBH(xzqh: string; k: Int64): string;
  var
    s: string;
  begin
    s := k.ToString;
    if s.Length < 9 then
      s := StringOfChar('0', 9 - s.Length) + s;
    result := xzqh + s;
  end;

var
  wsbh, sql: string;
  i: integer;
  n: Int64;
  ret: string;
begin
  result := '';
  if (num < 1) or (num > 999) then
  begin
    gLogger.Error('Request num is not invalid: ' + num.ToString);
    exit;
  end;

  ret := '';
  with gSQLHelper.Query('select top ' + num.ToString + ' wsbh from ' + cDBName +
    '.dbo.S_WSBH where flag=1 and xzqh=''' + xzqh + ''' and yhbh=''' + yhbh +
    ''' and wsbb=''QWSG''') do
  begin
    while not EOF do
    begin
      num := num - 1;
      ret := ret + ',' + Fields[0].AsString;
      Next;
    end;
    Free;
  end;

  if num > 0 then
  begin
    cs.Enter;
    wsbh := gSQLHelper.GetSinge('select max(WSBH) from ' + cDBName +
      '.dbo.S_WSBH where xzqh=''' + xzqh + ''' and wsbb=''QWSG''');
    if wsbh = '' then
    begin
      // gLogger.Error('No min WSBH in DB for : ' + xzqh);
      // cs.Leave;
      // exit;
      wsbh := xzqh + '520183000000';
    end;
    n := strtoint64def(wsbh.Substring(6), 0);
    if n > 0 then
    begin
      xzqh := wsbh.Substring(0, 6);
      sql := 'insert into ' + cDBName +
        '.dbo.S_WSBH(yhbh,wslb,wsbh,xzqh,wsbb)values';
      for i := 1 to num do
      begin
        wsbh := GetWSBH(xzqh, n + i);
        ret := ret + ',' + wsbh;
        if i > 1 then
          sql := sql + ','#13#10;
        sql := sql + '(' + yhbh.QuotedString + ',''9'',' + wsbh.QuotedString +
          ',' + xzqh.QuotedString + ',''QWSG'')';
      end;
      if gSQLHelper.ExecuteSql(sql) then
      begin
        result := ret.Substring(1);
      end;
    end
    else
    begin
      gLogger.Fatal('The max WSBH in DB is invalid!');
    end;
    cs.Leave;
  end
  else
    result := ret.Substring(1);
end;

function TWSManager.Apply(yhbh, xzqh, wsbb, wslb: String; num: integer): string;
  function GetWSBH(xzqh: string; k: integer): string;
  var
    s: string;
  begin
    s := k.ToString;
    if s.Length < 9 then
      s := StringOfChar('0', 9 - s.Length) + s;
    result := xzqh + s;
  end;

var
  wsbh, sql: string;
  i, n: integer;
  ret: string;
begin
  result := '';
  if (num < 1) or (num > 999) then
  begin
    gLogger.Error('Request num is not invalid: ' + num.ToString);
    exit;
  end;

  ret := '';
  with gSQLHelper.Query('select top ' + num.ToString + ' wsbh from ' + cDBName +
    '.dbo.S_WSBH where flag=1 and xzqh=''' + xzqh + ''' and yhbh=''' + yhbh +
    ''' and wsbb=''' + wsbb + '''') do
  begin
    while not EOF do
    begin
      num := num - 1;
      ret := ret + ',' + Fields[0].AsString;
      Next;
    end;
    Free;
  end;

  if num > 0 then
  begin
    cs.Enter;
    wsbh := gSQLHelper.GetSinge('select max(WSBH) from ' + cDBName +
      '.dbo.S_WSBH where xzqh=''' + xzqh + ''' and wsbb=''' + wsbb + '''');
    if wsbh = '' then
    begin
      gLogger.Error('No min WSBH in DB for : ' + xzqh);
      cs.Leave;
      exit;
    end;
    n := strtointdef(wsbh.Substring(6), 0);
    if n > 0 then
    begin
      xzqh := wsbh.Substring(0, 6);
      sql := 'insert into ' + cDBName +
        '.dbo.S_WSBH(yhbh,wslb,wsbh,xzqh,wsbb)values';
      for i := 1 to num do
      begin
        wsbh := GetWSBH(xzqh, n + i);
        ret := ret + ',' + wsbh;
        if i > 1 then
          sql := sql + ','#13#10;
        sql := sql + '(' + yhbh.QuotedString + ',' + wslb.QuotedString + ',' +
          wsbh.QuotedString + ',' + xzqh.QuotedString + ',' +
          wsbb.QuotedString + ')';
      end;
      if gSQLHelper.ExecuteSql(sql) then
      begin
        result := ret.Substring(1);
      end;
    end
    else
    begin
      gLogger.Fatal('The max WSBH in DB is invalid!');
    end;
    cs.Leave;
  end
  else
    result := ret.Substring(1);
end;

class function TWSManager.UpdateWSBH(wsbh: string; flag: integer): boolean;
begin
  result := gSQLHelper.GetSinge('select flag from ' + cDBName +
    '.dbo.S_WSBH where wsbh = ' + wsbh.QuotedString) = '1';
  result := result and gSQLHelper.ExecuteSql('update ' + cDBName +
    '.dbo.S_WSBH set flag=' + flag.ToString + ', gxsj=getdate() where wsbh = ' +
    wsbh.QuotedString);
end;

class function TWSManager.Rollback(wsbh: string): boolean;
begin
  result := UpdateWSBH(wsbh, 0);
end;

class function TWSManager.Submit(wsbh: string): boolean;
begin
  result := UpdateWSBH(wsbh, 2);
end;

end.
