unit uJGThread;

interface

uses
  System.Classes, uGlobal, System.Generics.Collections, SysUtils;

type
  TJGThread = class(TThread)
  private
    function LoadKpi: TDictionary<String, String>;
  protected
    procedure Execute; override;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure TJGThread.UpdateCaption;
  begin
  Form1.Caption := 'Updated in a thread';
  end;

  or

  Synchronize(
  procedure
  begin
  Form1.Caption := 'Updated in thread via an anonymous method'
  end
  )
  );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ TJGThread }

procedure TJGThread.Execute;
var
  i: Integer;
  kpiid, kssj, jssj, cmd, sj, fxjg, kpinum, zqmj, wfxw: String;
  dicKPI: TDictionary<String, String>;
  dt: TDateTime;
  ts: TStrings;
begin
  gLogger.Info('SpotTotalThread Start');
  ts := TStringList.Create;
  dicKPI := LoadKpi;
  dt := Now;
  for i := 0 to 30 do
  begin
    kssj := FormatDateTime('yyyy-mm-dd', dt - i);
    jssj := FormatDateTime('yyyy-mm-dd', dt + 1 - i);
    sj := FormatDateTime('yyyymmdd', dt - i);
    for kpiid in dicKPI.Keys do
    begin
      ts.Clear;
      ts.Add('delete from t_jg_total where date=' + sj.QuotedString +
        ' and  kpiid=' + kpiid.QuotedString);
      cmd := dicKPI[kpiid] + ' @kssj=' + kssj.QuotedString + ',@jssj=' +
        jssj.QuotedString;
      with gSQLHelper.Query(cmd) do
      begin
        while not Eof do
        begin
          kpinum := FieldByName('num').AsString;
          fxjg := FieldByName('dwdm').AsString;
          zqmj := FieldByName('zqmj').AsString;
          wfxw := FieldByName('wfxw').AsString;

          ts.Add('insert into t_jg_total(date,fxjg,kpiid,tasknum,zqmj,wfxw) values ('
            + sj.QuotedString + ',' + fxjg.QuotedString + ',' +
            kpiid.QuotedString + ',' + kpinum.QuotedString + ',' +
            zqmj.QuotedString + ',' + wfxw.QuotedString + ')');
          Next;
        end;
        Free;
      end;
      gSQLHelper.ExecuteSqlTran(ts);
    end;
  end;
  dicKPI.Free;
  ts.Free;
  gLogger.Info('SpotTotalThread End');
end;

function TJGThread.LoadKpi: TDictionary<String, String>;
begin
  Result := TDictionary<String, String>.Create;
  with gSQLHelper.Query('select systemid, sql from s_jg_kpi where Actived=1') do
  begin
    while not Eof do
    begin
      Result.Add(Fields[0].AsString, 'QTZ3Test.dbo.' + Fields[1].AsString);
      Next;
    end;
    Free;
  end;
end;

end.
