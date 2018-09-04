unit uVehPass;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, uSolr, uHik, IdCustomHTTPServer,
  FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Def,
  FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Expr, FireDAC.Stan.Pool;

type
  TVehPass = Class
  private
    class function GetSolrPassList(kssj, jssj: Double; kdbh, hphm, hpzl: String;
      currentpage, pagesize: Integer; var totalNum: Integer): string; static;
    class function GetDBPassList(kssj, jssj: Double; kdbh, hphm, hpzl: String;
      currentpage, pagesize: Integer; var totalNum, currentNum: Integer;
      var minGCSJ: Double): string; static;
    class function GetPassListFromOra(kssj, jssj: Double; kdbh, hphm,
      hpzl: String; currentpage, pagesize: Integer; var totalNum: Integer): string; static;
  public
    class procedure GetPassList(kssj, jssj: Double;
      kdbh, hphm, hpzl, vehlogo, vehsublogo, vehcolor, pilotsafebelt,
      vicepilotsafebelt, vehiclesunvisor, vicepilotsunvisor, pendant,
      currentpage, pagesize: String;
      AResponseInfo: TIdHTTPResponseInfo); static;
  end;

implementation

class procedure TVehPass.GetPassList(kssj, jssj: Double;
  kdbh, hphm, hpzl, vehlogo, vehsublogo, vehcolor, pilotsafebelt,
  vicepilotsafebelt, vehiclesunvisor, vicepilotsunvisor, pendant, currentpage,
  pagesize: String; AResponseInfo: TIdHTTPResponseInfo);
var
  s: string;
  totalNum: Integer;
begin
  if (hphm <> '') and (hpzl <> '') then // 白名单
  begin
    s := Format('select 1 from ' + cDBName +
      '.dbo.T_VIO_WHILELIST where zt = 1 and hphm=''%s'' and hpzl=''%s''',
      [hphm, hpzl]);
    s := s + ' and (powertype=3 or powertype=1)';
    s := gSQLHelper.GetSinge(s);
    if s <> '' then
    begin
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('[]');
      exit;
    end;
  end;

  s := '';
  totalNum := 0;
  if (vehlogo + vehsublogo + vehcolor + pilotsafebelt + vicepilotsafebelt +
    vehiclesunvisor + vicepilotsunvisor + pendant <> '') and gConfig.HaveK08
  then
    s := THik.GetK08PassList(FormatDateTime('yyyy-mm-dd', kssj) + 'T' +
      FormatDateTime('hh:mm:ss', kssj) + '.000Z', FormatDateTime('yyyy-mm-dd',
      jssj) + 'T' + FormatDateTime('hh:mm:ss', jssj) + '.000Z', hphm, hpzl,
      kdbh, vehlogo, vehcolor, vehsublogo, pilotsafebelt, vicepilotsafebelt,
      vehiclesunvisor, vicepilotsunvisor, pendant, currentpage,
      pagesize, totalNum)
  else if gConfig.PassOra.IP <> '' then
    s := GetPassListFromOra(kssj, jssj, kdbh, hphm, hpzl,
      StrToIntDef(currentpage, 0), StrToIntDef(pagesize, 30), totalNum)
  else
    s := GetSolrPassList(kssj, jssj, kdbh, hphm, hpzl,
      StrToIntDef(currentpage, 0), StrToIntDef(pagesize, 30), totalNum);

  if s = '' then
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('[]')
  else
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(s,
      IntToStr(totalNum), currentpage, pagesize);
end;

class function TVehPass.GetDBPassList(kssj, jssj: Double;
  kdbh, hphm, hpzl: String; currentpage, pagesize: Integer;
  var totalNum, currentNum: Integer; var minGCSJ: Double): string;
var
  where, s, pass: String;
  start, iTotal: Integer;
begin
  Result := '';
  totalNum := 0;
  currentNum := 0;
  start := currentpage * pagesize;

  where := ' where GCSJ >' + FormatDateTime('yyyy-mm-dd hh:nn:ss', kssj)
    .QuotedString + ' and GCSJ <' + FormatDateTime('yyyy-mm-dd hh:nn:ss', jssj)
    .QuotedString;
  if kdbh <> '' then
    where := where + ' and KDBH = ' + kdbh.QuotedString;
  // if (hphm <> '') and (hpzl <> '') then
  // where := where + ' and HPHM=' + hphm.QuotedString + ' and HPZL=' +
  // hpzl.QuotedString;
  if hphm <> '' then
    where := where + ' and HPHM=' + hphm.QuotedString;
  if hpzl <> '' then
    where := where + ' and HPZL=' + hpzl.QuotedString;
  s := ' select count(1) from ' + cDBName + '.dbo.T_KK_VEH_PASSREC ' + where;
  iTotal := StrToIntDef(gSQLHelper.GetSinge(s), 0);
  minGCSJ := now;

  if iTotal > start then
  begin
    totalNum := iTotal - start;
    s := ' select CJJG, GCXH, KDBH, CDBH, HPZL, GCSJ, CLSD, HPHM,CSYS,CLPP,FWQDZ,TP1,TP2,TP3 '
      + ' from ' + cDBName + '.dbo.T_KK_VEH_PASSREC ' + where +
      ' order by GCSJ desc ' + ' offset ' + IntToStr(start) + ' row fetch next '
      + IntToStr(pagesize) + ' rows only';

    with gSQLHelper.Query(s) do
    begin
      if not Eof then
        currentNum := RecordCount;
      while not Eof do
      begin
        pass := '"cjjg":"' + Fields[0].AsString + '"';
        pass := pass + ',"gcxh":"' + Fields[1].AsString + '"';
        pass := pass + ',"kdbh":"' + Fields[2].AsString + '"';
        pass := pass + ',"cdbh":"' + Fields[3].AsString + '"';
        pass := pass + ',"hpzl":"' + Fields[4].AsString + '"';
        pass := pass + ',"gcsj":"' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
          Fields[5].ASDATETIME) + '"';
        pass := pass + ',"clsd":"' + Fields[6].AsString + '"';
        pass := pass + ',"hphm":"' + Fields[7].AsString + '"';
        pass := pass + ',"csys":"' + Fields[8].AsString + '"';
        pass := pass + ',"clpp":"' + Fields[9].AsString + '"';
        pass := pass + ',"fwqdz":"' + Fields[10].AsString + '"';
        pass := pass + ',"tp1":"' + Fields[11].AsString + '"';
        pass := pass + ',"tp2":"' + Fields[12].AsString + '"';
        pass := pass + ',"tp3":"' + Fields[13].AsString + '"';
        if TCommon.DicDevice.ContainsKey(Fields[2].AsString) then
          pass := pass + ',"sbddmc":"' + TCommon.DicDevice[Fields[2].AsString]
            .SBDDMC + '"'
        else
          pass := pass + ',"sbddmc":""';
        if TCommon.DicHpzlmc.ContainsKey(Fields[4].AsString) then
          pass := pass + ',"hpzlmc":"' + TCommon.DicHpzlmc
            [Fields[4].AsString] + '"'
        else
          pass := pass + ',"hpzlmc":""';
        Result := Result + ',{' + pass + '}';
        if minGCSJ > Fields[5].ASDATETIME then
          minGCSJ := Fields[5].ASDATETIME;
        Next;
      end;
      Free;
    end;
    if Result <> '' then
      Result := '[' + Result.Substring(1) + ']';
  end;
end;

class function TVehPass.GetPassListFromOra(kssj, jssj: Double;
  kdbh, hphm, hpzl: String; currentpage, pagesize: Integer;
  var totalNum: Integer): string;
var
  where, s, pass: String;
  start, iTotal: Integer;
  FOraConn: TFDConnection;
  FOraQuery: TFDQuery;
  procedure Query(sql: string);
  begin
    FOraQuery.Close;
    FOraQuery.SQL.Text := sql;
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      FOraQuery.Open;
      FOraQuery.DisableControls;
    except
      on e: exception do
      begin
        gLogger.Error('[TVehPass.GetPassListFromOra.Query]' + e.Message + ' ' + s);
      end;
    end;
  end;
begin
  FOraConn := TFDConnection.Create(nil);
  FOraConn.FetchOptions.Mode := fmAll;
  FOraConn.Params.Add('DriverID=Ora');
  if gConfig.PassOra.ServiceName <> '' then
    FOraConn.Params.Add
      (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
      + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
      [gConfig.PassOra.IP, gConfig.PassOra.Port, gConfig.PassOra.ServiceName]))
  else
    FOraConn.Params.Add
      (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
      + '(CONNECT_DATA = (SERVER = DEDICATED)(SID = %s)))',
      [gConfig.PassOra.IP, gConfig.PassOra.Port, gConfig.PassOra.SID]));
  FOraConn.Params.Add(Format('User_Name=%s', [gConfig.PassOra.User]));
  FOraConn.Params.Add(Format('Password=%s', [gConfig.PassOra.Pwd]));
  FOraConn.Params.Add('CharacterSet=UTF8'); // 否则中文乱码
  FOraConn.LoginPrompt := false;

  FOraQuery := TFDQuery.Create(nil);
  FOraQuery.DisableControls;
  FOraQuery.Connection := FOraConn;

  Result := '';
  totalNum := 0;
  start := currentpage * pagesize;

  where := ' where GCSJ >to_date(' + FormatDateTime('yyyy-mm-dd hh:nn:ss', kssj)
    .QuotedString + ',''yyyy-mm-dd hh24:mi:ss'') '
    + ' and GCSJ <to_date(' + FormatDateTime('yyyy-mm-dd hh:nn:ss', jssj)
    .QuotedString + ',''yyyy-mm-dd hh24:mi:ss'')';
  if kdbh <> '' then
    where := where + ' and KDBH = ' + kdbh.QuotedString;
  if hphm <> '' then
    where := where + ' and HPHM=' + hphm.QuotedString;
  if hpzl <> '' then
    where := where + ' and HPZL=' + hpzl.QuotedString;
  Query('select count(1) from V_VEH_PASSREC ' + where);
  iTotal := 0;
  if FOraQuery.Active and (not FOraQuery.IsEmpty) and (not FOraQuery.Fields[0].IsNull) then
    iTotal := StrToIntDef(FOraQuery.Fields[0].AsString, 0);

  if iTotal > start then
  begin
    totalNum := iTotal - start;
    s := 'select a1.*,a2.KDMC from ( '
      + ' select '''' as CJJG, GCXH, KDBH, CDBH, HPZL, GCSJ, CLSD, HPHM,CSYS,CLPP,'''' as FWQDZ, TP1,TP2,TP3 '
      + ' from V_VEH_PASSREC ' + where
      + ' order by GCSJ desc) a1,V_CODE_GATE a2 where a1.KDBH=a2.KDBH and rownum >=' + IntToStr(start) + ' and rownum<' + IntToStr(start + pagesize);
    Query(s);
    with FOraQuery do
    begin
      while not Eof do
      begin
        pass := '"cjjg":"' + Fields[0].AsString + '"';
        pass := pass + ',"gcxh":"' + Fields[1].AsString + '"';
        pass := pass + ',"kdbh":"' + Fields[2].AsString + '"';
        pass := pass + ',"cdbh":"' + Fields[3].AsString + '"';
        pass := pass + ',"hpzl":"' + Fields[4].AsString + '"';
        pass := pass + ',"gcsj":"' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
          Fields[5].ASDATETIME) + '"';
        pass := pass + ',"clsd":"' + Fields[6].AsString + '"';
        pass := pass + ',"hphm":"' + Fields[7].AsString + '"';
        pass := pass + ',"csys":"' + Fields[8].AsString + '"';
        pass := pass + ',"clpp":"' + Fields[9].AsString + '"';
        pass := pass + ',"fwqdz":""';
        pass := pass + ',"tp1":"' + Fields[11].AsString + '"';
        pass := pass + ',"tp2":"' + Fields[12].AsString + '"';
        pass := pass + ',"tp3":"' + Fields[13].AsString + '"';
        pass := pass + ',"sbddmc":"' + Fields[14].AsString + '"';
        if TCommon.DicHpzlmc.ContainsKey(Fields[4].AsString) then
          pass := pass + ',"hpzlmc":"' + TCommon.DicHpzlmc
            [Fields[4].AsString] + '"'
        else
          pass := pass + ',"hpzlmc":""';
        Result := Result + ',{' + pass + '}';
        Next;
      end;
    end;
    if Result <> '' then
      Result := '[' + Result.Substring(1) + ']';
  end;
end;

class function TVehPass.GetSolrPassList(kssj, jssj: Double;
  kdbh, hphm, hpzl: String; currentpage, pagesize: Integer;
  var totalNum: Integer): string;
var
  s, pass: string;
  lines: TStrings;
  rownum, dbTotal, solrTotal, currentNum: Integer;
  minGCSJ: Double;
begin
  Result := '';
  if now - jssj > 1 / 12 then // 结束时间在2小时前，只取solr
  begin
    Result := TSolr.GetPassjson(kssj, jssj, kdbh, hphm, hpzl, currentpage,
      pagesize, totalNum);
    exit;
  end
  else if now - kssj < 1 / 12 then // 开始时间在2小时内，只取db
  begin
    Result := GetDBPassList(kssj, jssj, kdbh, hphm, hpzl, currentpage, pagesize,
      totalNum, currentNum, minGCSJ);
    exit;
  end;

  Result := GetDBPassList(kssj, jssj, kdbh, hphm, hpzl, currentpage, pagesize,
    dbTotal, currentNum, minGCSJ);

  if currentNum > 0 then
  begin
    jssj := minGCSJ;
    Result := ',' + copy(Result, 2, Length(Result) - 2); // 去掉中括号
  end;
  rownum := dbTotal;
  if currentNum < pagesize then
  begin
    lines := TSolr.GetPassContent(kssj, jssj, kdbh, hphm, hpzl, currentpage, pagesize,
      solrTotal);
    for s in lines do
    begin
      pass := TSolr.StrToPassjson(s);
      if not Result.Contains(pass) then
      begin
        if rownum < pagesize then
        begin
          Result := Result + ',' + pass;
          rownum := rownum + 1;
        end;
      end
      else
        solrTotal := solrTotal - 1;
    end;
    lines.Free;
  end;

  totalNum := dbTotal + solrTotal; // 非常不准确
  Result := '[' + Result.Substring(1) + ']';
end;

end.
