unit uWSManager;

interface

uses
  Classes, SysUtils, SyncObjs;

type
  TWSManager = class
  private
    cs: TCriticalSection;
    function UpdateWSBH(wsbh: string; flag: integer): boolean;
  public
    function Apply(yhbh: string; wslb: string; num: integer): string;
    function Rollback(wsbh: string): boolean;
    function Submit(wsbh: string): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  uGlobal;

const
  MinWSBH = '445200100600000';

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

function TWSManager.Apply(yhbh, wslb: string; num: integer): string;
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
  wsbh, xzqh, sql: string;
  i, n: integer;
  ret: string;
begin
  result := '';
  ret := '';
  if (num < 1) or (num > 999) then
  begin
    gLogger.Error('Request num is not invalid: ' + num.ToString);
    exit;
  end;

  cs.Enter;

  //DONE: Get Rollback Records
  with gSQLHelper.Query('select top '+num.ToString+' wsbh from S_WSBH where flag=0') do
  begin
    while not EOF do
    begin
      num := num - 1;
      ret := ret + ',' + Fields[0].AsString;
      Next;
    end;
    Free;
  end;
  if ret <> '' then
  begin
    sql := 'update S_WSBH set flag=1,wslb=''' + wslb + ''',yhbh=''' + yhbh
      + ''' where wsbh in (''' + ret.Substring(1).Replace(',', ''',''') + ''')';
    if not gSQLHelper.ExecuteSql(sql) then
    begin
      cs.Leave;
      exit;
    end;
  end;

  if num > 0 then
  begin
    wsbh := gSQLHelper.GetSinge('select max(WSBH) from S_WSBH');
    if wsbh = '' then
      wsbh := MinWSBH;
    n := strtointdef(wsbh.Substring(6), 0);
    if n > 0 then
    begin
      xzqh := wsbh.Substring(0, 6);
      sql := 'insert into S_WSBH(yhbh, wslb, wsbh)values';
      for i := 1 to num do
      begin
        wsbh := GetWSBH(xzqh, n + i);
        ret := ret + ',' + wsbh;
        if i > 1 then
          sql := sql + ','#13#10;
        sql := sql + '(' + yhbh.QuotedString + ',' + wslb.QuotedString + ',' + wsbh.QuotedString + ')';
      end;
      if gSQLHelper.ExecuteSql(sql) then
      begin
        result := ret.Substring(1);
      end;
    end
    else begin
      gLogger.Fatal('The max WSBH in DB is invalid!');
    end;
  end
  else
    result := ret.Substring(1);
  cs.Leave;
end;

function TWSManager.UpdateWSBH(wsbh: string; flag: integer): boolean;
begin
  result := gSQLHelper.GetSinge('select flag from S_WSBH where wsbh = ' + wsbh.QuotedString) = '1';
  result := result and
    gSQLHelper.ExecuteSql('update S_WSBH set flag='+flag.ToString+', gxsj=getdate() where wsbh = ' + wsbh.QuotedString);
end;

function TWSManager.Rollback(wsbh: string): boolean;
begin
  result := UpdateWSBH(wsbh, 0);
end;

function TWSManager.Submit(wsbh: string): boolean;
begin
  result := UpdateWSBH(wsbh, 2);
end;

end.
