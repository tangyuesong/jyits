unit uZDWFThread;

interface

uses
  System.Classes, uGlobal, SysUtils;

type
  TZDWFThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure TZDWFThread.UpdateCaption;
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

{ TZDWFThread }

procedure TZDWFThread.Execute;
var
  dt: TDateTime;
  ts: TStrings;
begin
  gLogger.Info('ZdwfTotalThread Start');
  dt := Now - 31;
  ts := TStringList.Create;
  ts.Clear;
  ts.Add('delete from t_zdwf_total where date>=' + formatDateTime('yyyymmdd',
    dt).QuotedString);
  ts.Add('insert into t_zdwf_total(fxjg, zqmj, wfxw, date, num)');
  ts.Add('select fxjg, zqmj, mc, date, sum(num) as num from(');
  ts.Add('select fxjg, zqmj, mc, convert(varchar, wfsj, 112) as date , count(1) as num from T_Spot_Force a');
  ts.Add('inner join S_ZDWF b');
  ts.Add('on a.wfxw1=b.wfxw or a.wfxw2=b.wfxw or a.wfxw3=b.wfxw or a.wfxw4=b.wfxw or a.wfxw5=b.wfxw');
  ts.Add('where wfsj>' + formatDateTime('yyyy/mm/dd', dt).QuotedString +
    ' and zt=1 and actived=1');
  ts.Add('group by fxjg, zqmj, mc, convert(varchar, wfsj, 112)');
  ts.Add('union all');
  ts.Add('select fxjg, zqmj, mc, convert(varchar, wfsj, 112) as date , count(1) as num from T_Spot_Violation a');
  ts.Add('inner join S_ZDWF b');
  ts.Add('on a.wfxw=b.wfxw');
  ts.Add('where wfsj>' + formatDateTime('yyyy/mm/dd', dt).QuotedString +
    ' and zt=1 and actived=1');
  ts.Add('group by fxjg, zqmj, mc, convert(varchar, wfsj, 112)');
  ts.Add(') a group by fxjg, zqmj, mc, date');
  gSQLHelper.ExecuteSqlTran(ts);
  ts.Free;
  gLogger.Info('ZdwfTotalThread End');
end;

end.
