unit uVehPass;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, uSolr, uHik, IdCustomHTTPServer;

type
  TVehPass = Class
  private
    class function GetSolrPassList(kssj, jssj: Double; kdbh, hphm, hpzl: String;
      currentpage, pagesize: Integer; var totalNum: Integer): string; static;
    class function GetDBPassList(kssj, jssj: Double; kdbh, hphm, hpzl: String;
      currentpage, pagesize: Integer; var totalNum, currentNum: Integer;
      var minGCSJ: Double): string; static;
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
  start: Integer;
begin
  Result := '';
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
  totalNum := StrToIntDef(gSQLHelper.GetSinge(s), 0);
  minGCSJ := now;
  if totalNum > 0 then
  begin
    s := ' select CJJG, GCXH, KDBH, CDBH, HPZL, GCSJ, CLSD, HPHM,CSYS,CLPP,FWQDZ,TP1,TP2,TP3 '
      + ' from ' + cDBName + '.dbo.T_KK_VEH_PASSREC ' + where +
      ' order by GCSJ desc ' + ' offset ' + IntToStr(start) + ' row fetch next '
      + IntToStr(pagesize) + ' rows only';

    with gSQLHelper.Query(s) do
    begin
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
    lines := TSolr.GetPassContent(kssj, jssj, kdbh, hphm, hpzl, 0, pagesize,
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
