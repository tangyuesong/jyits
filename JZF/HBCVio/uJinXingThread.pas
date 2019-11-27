unit uJinXingThread;

interface

uses
  System.Classes, SysUtils, ActiveX, uGlobal;

type
  TJinXingConfig = record
    FType, FName, FFieldName, FStartTime, FEndTime, FWFXW: string;
  end;
  TJinXingThread = class(TThread)
  private
    FConfig: TJinXingConfig;
    procedure SaveVioInfo(tbName, hphm, hpzl, gcrq: String);
    function LoadConfig(aType: string): boolean;
  protected
    procedure Execute; override;
  public
    Constructor Create(jinXingType: integer);
  end;

implementation

{ TJinXingThread }

constructor TJinXingThread.Create(jinXingType: integer);
begin
  FConfig.FType := jinXingType.ToString;
  inherited Create(false);
end;

procedure TJinXingThread.Execute;
var
  s, hphm, hpzl, gcrq, tbName: String;
begin
  ActiveX.CoInitialize(nil);
  FreeOnTerminate := true;
  if not LoadConfig(FConfig.FType) then
  begin
    exit;
  end;
  FormatDatetime('hh', Now() - 3 / 24);
  tbName := gConfig.DBNamePass + '.dbo.T_KK_VEH_PASSREC_' + FormatDatetime('yyyymmdd',
    Now() - 3 / 24);
  gLogger.Info('JinXingThread Start [' + FConfig.FName + ']');
  if gSQLHelper.ExistsTable(tbName) then
  begin
    s := ' select a.HPHM, a.HPZL, convert(varchar(10), a.gcsj, 120) as GCRQ from '
      + tbName + ' a inner join '+gConfig.DBName+'.dbo.T_Veh_JinXing b ' +
      ' on b.type='+FConfig.FType+' and b.ZT=1 and a.HPHM = b.HPHM and a.HPZL = b.HPZL ' +
      ' inner join '+gConfig.DBName+'.dbo.S_Device d ' +
      ' on d.'+FConfig.FFieldName+' = 1 and a.CJJG = d.CJJG and a.KDBH = d.SBBH ' +
      ' left join '+gConfig.DBName+'.dbo.T_VIO_TEMP c ' +
      ' on a.HPHM = c.HPHM and a.HPZL = c.HPZL and c.WFXW = '''+FConfig.FWFXW+''' ' +
      ' and convert(varchar(10), a.gcsj, 120) = convert(varchar(10), c.wfsj, 120) ' +
      ' where c.HPHM is null and convert(varchar(5), a.gcsj, 8) between ''' +
      FConfig.FStartTime + ''' and ''' + FConfig.FEndTime + '''' +
      ' group by a.HPHM, a.HPZL, convert(varchar(10), a.gcsj, 120) having count(1) > 1 ';
    with gSQLHelper.Query(s) do
    begin
      while not Eof do
      begin
        hphm := Fields[0].AsString;
        hpzl := Fields[1].AsString;
        gcrq := Fields[2].AsString;
        SaveVioInfo(tbName, hphm, hpzl, gcrq);
        Next;
      end;
      Free;
    end;
  end
  else
    gLogger.Error(tbName + ' is not exists');
  gLogger.Info('JinXingThread End [' + FConfig.FName + ']');
  ActiveX.CoUninitialize;
end;

function TJinXingThread.LoadConfig(aType: string): boolean;
var
  sql: string;
begin
  result := false;
  sql := 'select startTime,endTime,WFXW,FieldName,Name from '
    + gConfig.DBName + '.dbo.T_Veh_JinXing_Time where zt = 1 and type=' + aType;
  with gSQLHelper.Query(sql) do
  begin
    if not EOF then
    begin
      FConfig.FStartTime := Fields[0].AsString;
      FConfig.FEndTime := Fields[1].AsString;
      FConfig.FWFXW := Fields[2].AsString;
      FConfig.FFieldName := Fields[3].AsString;
      FConfig.FName := Fields[4].AsString;
      result := true;
    end;

    Free;
  end;
end;

procedure TJinXingThread.SaveVioInfo(tbName, hphm, hpzl, gcrq: String);
var
  s, wfdd, cjjg, wfsj, cd, tp1, tp2: String;
begin
  gLogger.Info('save WNJ vio ' + hphm + ' ' + hpzl + ' ' + gcrq);
  wfdd := '';
  tp1 := '';
  tp2 := '';
  s := ' select KDBH, GCSJ from ' + tbName + ' a ' +
    ' inner join '+gConfig.DBName+'.dbo.S_Device d ' +
    ' on a.CJJG = d.CJJG and a.KDBH = d.SBBH and d.'+FConfig.FFieldName+' = 1 where hphm='
    + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString +
    ' and convert(varchar(10), gcsj, 120)=' + gcrq.QuotedString +
    ' group by KDBH, GCSJ having count(1) > 1 ';
  // 尽量同一路口的两张照片
  with gSQLHelper.Query(s) do
  begin
    if RecordCount > 0 then
    begin
      wfdd := Fields[0].AsString;
      wfsj := Fields[1].AsString;
    end;
    Free;
  end;

  if wfdd <> '' then // 存在同一路口的两张图片
  begin
    with gSQLHelper.Query('select * from ' + tbName + ' where  hphm=' +
      hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString + ' and gcsj = ' +
      wfsj.QuotedString + ' and KDBH = ' + wfdd.QuotedString) do
    begin
      while not Eof do
      begin
        if tp1 = '' then
        begin
          cjjg := FieldByName('cjjg').AsString;
          cd := FieldByName('CDBH').AsString;
          tp1 := Trim(FieldByName('FWQDZ').AsString) +
            Trim(FieldByName('Tp1').AsString);
        end
        else
        begin
          tp2 := Trim(FieldByName('FWQDZ').AsString) +
            Trim(FieldByName('Tp1').AsString);
          break;
        end;
        Next;
      end;
      Free;
    end;
  end;

  if tp2 = '' then
  begin
    tp1 := '';
    s := ' select a.* from ' + tbName + ' a ' +
      ' inner join '+gConfig.DBName+'.dbo.S_Device d ' +
      ' on a.CJJG = d.CJJG and a.KDBH = d.SBBH and d.'+FConfig.FFieldName+' = 1 ' +
      ' where hphm=' + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString +
      ' and convert(varchar(10), gcsj, 120)=' + gcrq.QuotedString +
      ' order by GCSJ desc ';
    with gSQLHelper.Query(s) do
    begin
      while not Eof do
      begin
        if tp1 = '' then
        begin
          cjjg := FieldByName('cjjg').AsString;
          wfdd := FieldByName('KDBH').AsString;
          wfsj := FieldByName('GCSJ').AsString;
          cd := FieldByName('CDBH').AsString;
          tp1 := Trim(FieldByName('FWQDZ').AsString) +
            Trim(FieldByName('TP1').AsString);
        end
        else
        begin
          tp2 := Trim(FieldByName('FWQDZ').AsString) +
            Trim(FieldByName('TP1').AsString);
          break;
        end;
        Next;
      end;
      Free;
    end;
  end;

  s := ' insert into '+gConfig.DBName+'.dbo.T_VIO_TEMP(cjjg, hphm, hpzl, wfdd, wfsj, wfxw, cd, photofile1, photofile2, bj) values ('
    + cjjg.QuotedString + ',' + hphm.QuotedString + ',' + hpzl.QuotedString +
    ',' + wfdd.QuotedString + ',' + wfsj.QuotedString + ','+FConfig.FWFXW.QuotedString+',' +
    cd.QuotedString + ',' + tp1.QuotedString + ',' + tp2.QuotedString +
    ',''0'')';
  if gSQLHelper.ExecuteSql(s) then
    gLogger.Info('save ' + FConfig.FName + ' vio successed [' + hphm + ']')
  else
    gLogger.Error('save ' + FConfig.FName + ' vio failed [' + hphm + ']');
end;

end.
