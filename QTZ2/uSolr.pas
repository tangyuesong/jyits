unit uSolr;

interface

uses
  SysUtils, Classes, IdHttp, uGlobal, uLogger;

type
  TSolr = class
  public
    class function GetPass(line: string): string; static;
    class function Query(params: TStrings): string; static;
    class function GetPassList(params: TStrings): TStrings; static;
  end;

implementation
uses System.Net.HttpClientComponent;
{ TSolr }

class function TSolr.GetPassList(params: TStrings): TStrings;
var
  url, json, s, line, q, ss: string;
  http: TNetHTTPClient;
  i: Integer;
begin
  if (params.Values['start'] <> '') and (params.Values['rows'] <> '') then
  begin
    params.Values['start'] := inttostr(strtointdef(params.Values['start'], 0) * strtointdef(params.Values['rows'], 30));
  end;
  result := TStringList.Create;
  // param := 'q=KDHB:10001 AND HPZL_HPHM=02ิมU88888 AND GCSJ=2016-10-01'
  url := gConfig.SolrHome + 'select?q=';
  for i := 0 to params.Count - 1 do
  begin
    s := params.Names[i].ToLower;
    if 'start rows'.Contains(s) then
      ss := ss + '&' + params[i]
    else if s.StartsWith('begin_') then
      q := q + ' AND ' + s.Substring(6).ToUpper + ':[' + params.ValueFromIndex[i]
        + ' TO ' + params.Values['end_' + s.Substring(6)] + ']'
    else if s.StartsWith('end_') then
    begin

    end
    else if s = 'hphm' then
      q := q + ' AND HPZL_HPHM:' + params.Values['hpzl'] + params.Values['hphm']
    else if s = 'hpzl' then
    begin

    end
    else if (s = 'orderby')or(s = 'orderby_asc') then
    begin
      //ss := ss + '&sort=' + params.ValueFromIndex[i].ToUpper + ' asc';
    end
    else if s = 'orderby_desc' then
    begin
      //ss := ss + '&sort=' + params.ValueFromIndex[i].ToUpper + ' desc';
    end
    else
      q := q + ' AND ' + params.Names[i].ToUpper + ':' + params.ValueFromIndex[i];
  end;
  url := url + q.Substring(5);
  if ss <> '' then
    url := url + ss;

  if not url.Contains('&fl=') then
    url := url + '&fl=content';
  if not url.Contains('&rows=') then
    url := url + '&rows=100000';
  if not url.Contains('&wt=') then
    url := url + '&wt=json';
  http := TNetHTTPClient.Create(nil);
  try
    json := http.Get(url).ContentAsString;
    if json.Contains('"docs":') then
    begin
      for s in json.Split(['"content":']) do
      begin
        if s.StartsWith('["') then
        begin
          line := s.Substring(2);
          line := line.Substring(0, line.IndexOf('"'));
          result.Add(line);
        end;
      end;
    end;
  except
    on e: exception do
      gLogger.Error(e.Message + ' ' + url);
  end;
  http.Free;
end;

class function TSolr.Query(params: TStrings): string;
var
  line: string;
  lines: TStrings;
begin
  result := '';
  lines := GetPassList(params);
  if lines.Count > 0 then
  begin
    for line in lines do
      result := result + ',' + GetPass(line);
    result := '[' + result.Substring(1) + ']';
  end;
  lines.Free;
end;

class function TSolr.GetPass(line: string): string;
var
  ss: TArray<string>;
  s, gcsj: string;
begin
  ss := line.Split(['\t']);
  if ss[8] <> '' then
  begin
    s := ss[8];
    gcsj := s.Substring(0, 4) + '/' + s.Substring(4, 2) + '/' +
      s.Substring(6, 2) + ' ' + s.Substring(8, 2) + ':' + s.Substring(10, 2) +
      ':' + s.Substring(12);
  end;
  result := '{"CJJG":"' + ss[0] + '"';
  // if ss[1] <> '' then
  result := result + ',"GCXH":"' + ss[1] + '"';
  // if ss[2] <> '' then
  result := result + ',"KKSOURCE":"' + ss[2] + '"';
  // if ss[3] <> '' then
  result := result + ',"KDBH":"' + ss[3] + '"';
  // if ss[4] <> '' then
  result := result + ',"FXBH":"' + ss[4] + '"';
  // if ss[5] <> '' then
  result := result + ',"CDBH":"' + ss[5] + '"';
  // if ss[6] <> '' then
  result := result + ',"CDLX":"' + ss[6] + '"';
  // if ss[7] <> '' then
  result := result + ',"HPZL":"' + ss[7] + '"';
  // if ss[8] <> '' then
  result := result + ',"GCSJ":"' + gcsj + '"';
  // if ss[9] <> '' then
  result := result + ',"CLSD":"' + ss[9] + '"';
  // if ss[10] <> '' then
  result := result + ',"HPYS":"' + ss[10] + '"';
  // if ss[11] <> '' then
  result := result + ',"CLLX":"' + ss[11] + '"';
  // if ss[12] <> '' then
  result := result + ',"HPHM":"' + ss[12] + '"';
  // if ss[13] <> '' then
  result := result + ',"CWHPHM":"' + ss[13] + '"';
  // if ss[14] <> '' then
  result := result + ',"CWHPYS":"' + ss[14] + '"';
  // if ss[15] <> '' then
  result := result + ',"HPYZ":"' + ss[15] + '"';
  // if ss[16] <> '' then
  result := result + ',"YRKSJ":"' + ss[16] + '"';
  // if ss[17] <> '' then
  result := result + ',"CSYS":"' + ss[17] + '"';
  // if ss[18] <> '' then
  result := result + ',"CLXS":"' + ss[18] + '"';
  // if ss[19] <> '' then
  result := result + ',"CLPP":"' + ss[19] + '"';
  // if ss[20] <> '' then
  result := result + ',"CLWX":"' + ss[20] + '"';
  // if ss[21] <> '' then
  result := result + ',"XSZT":"' + ss[21] + '"';
  // if ss[22] <> '' then
  result := result + ',"WFBJ":"' + ss[22] + '"';
  // if ss[23] <> '' then
  result := result + ',"FWQDZ":"' + ss[23] + '"';
  // if ss[24] <> '' then
  result := result + ',"TP1":"' + ss[24] + '"';
  // if ss[25] <> '' then
  result := result + ',"TP2":"' + ss[25] + '"';
  // if ss[26] <> '' then
  result := result + ',"TP3":"' + ss[26] + '"';
  // if ss[27] <> '' then
  result := result + ',"TZTP":"' + ss[27] + '"';
  // if ss[28] <> '' then
  result := result + ',"DRTP1":"' + ss[28] + '"';
  // if ss[29] <> '' then
  result := result + ',"DRTP2":"' + ss[29] + '"';
  // if ss[30] <> '' then
  result := result + ',"RKSJ":"' + ss[30] + '"';
  // if ss[31] <> '' then
  result := result + ',"FSBZ":"' + ss[31] + '"';
  // if ss[32] <> '' then
  result := result + ',"ALARM_TYPE":"' + ss[32] + '"';
  // if ss[33] <> '' then
  result := result + ',"ALARM_SRC":"' + ss[33] + '"';
  // if ss[34] <> '' then
  result := result + ',"ALARM_SRC_ID":"' + ss[34] + '"';
  // if ss[35] <> '' then
  result := result + ',"FLAG":"' + ss[35] + '"';
  // if ss[36] <> '' then
  result := result + ',"GXSJ":"' + ss[36] + '"';
  // if ss[37] <> '' then
  result := result + ',"LDBH":"' + ss[37] + '"';
  // if ss[38] <> '' then
  result := result + ',"LKBH":"' + ss[38] + '"';
  // if ss[39] <> '' then
  result := result + ',"ser01":"' + ss[39] + '"';
  // if ss[40] <> '' then
  result := result + ',"SER02":"' + ss[40] + '"';
  // if ss[41] <> '' then
  result := result + ',"SER03":"' + ss[41] + '"';
  // if ss[42] <> '' then
  result := result + ',"SER04":"' + ss[42] + '"';
  // if ss[43] <> '' then
  result := result + ',"SER05":"' + ss[43] + '"';
  // if ss[44] <> '' then
  result := result + ',"SER06":"' + ss[44] + '"';
  // if ss[45] <> '' then
  result := result + ',"SER07":"' + ss[45] + '"';
  // if ss[46] <> '' then
  result := result + ',"SER08":"' + ss[46] + '"';
  // if ss[47] <> '' then
  result := result + ',"SER09":"' + ss[47] + '"';
  result := result + '}';
end;

end.
