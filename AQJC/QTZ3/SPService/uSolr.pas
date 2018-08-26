unit uSolr;

interface

uses
  SysUtils, Classes, IdHttp, uGlobal, uLogger, uCommon, QJson, StrUtils;

type
  TSolr = class
  public
    class function StrToPassjson(line: string): string; static;
    class function GetPassjson(kssj, jssj: Double; kdbh, hphm, hpzl: String;
      currentpage, pagesize: Integer; var totalNum: Integer): string; static;
    class function GetPassContent(kssj, jssj: Double; kdbh, hphm, hpzl: String;
      currentpage, pagesize: Integer; var totalNum: Integer): TStrings; static;
  end;

implementation

uses System.Net.HttpClientComponent;
{ TSolr }

class function TSolr.GetPassContent(kssj, jssj: Double;
  kdbh, hphm, hpzl: String; currentpage, pagesize: Integer;
  var totalNum: Integer): TStrings;
var
  url, json: string;
  http: TNetHTTPClient;
  i, start: Integer;
  QJson: TQJson;
begin
  Result := TStringList.Create;
  totalNum := 0;
  start := currentpage * pagesize;

  url := gConfig.SolrHome + 'select?start=' + IntToStr(start) + '&rows=' +
    IntToStr(pagesize) + '&q=GCSJ:[' + FormatDateTime('yyyymmddhhmmss', kssj) +
    ' TO ' + FormatDateTime('yyyymmddhhmmss', jssj) + ']';
  if kdbh <> '' then
    url := url + ' AND KDBH:' + kdbh;
  /// if (hphm <> '') and (hpzl <> '') then
  /// url := url + ' AND HPZL_HPHM:' + hpzl + hphm;
  if hphm <> '' then
  begin
    if hpzl = '' then
      hpzl := '02';
    url := url + ' AND HPZL_HPHM:' + hpzl + hphm;
  end;
  url := url + '&fl=content'; // 返回content字段
  url := url + '&wt=json'; // 返回的数据格式

  QJson := TQJson.Create;
  http := TNetHTTPClient.Create(nil);
  try
    json := http.Get(url).ContentAsString;
    totalNum := StrToIntDef(TCommon.GetJsonNode('numFound', json), 30);
    json := TCommon.GetJsonNode('docs', json);
    if json <> '' then
    begin
      QJson.Parse(json);
      for i := 0 to QJson.Count - 1 do
      begin
        json := TCommon.GetJsonNode('content', QJson.Items[i].ToString);
        if json <> '' then
        begin
          if StrUtils.LeftStr(json, 1) = '[' then
            json := json.Substring(1);
          if StrUtils.RightStr(json, 1) = ']' then
            json := Copy(json, 1, Length(json) - 1);
          if StrUtils.LeftStr(json, 1) = '"' then
            json := json.Substring(1);
          if StrUtils.RightStr(json, 1) = '"' then
            json := Copy(json, 1, Length(json) - 1);
        end;
        Result.Add(json);
      end;
    end;
  except
    on e: exception do
      gLogger.Error(e.Message + ' ' + url);
  end;
  http.Free;
  QJson.Free;
end;

class function TSolr.GetPassjson(kssj, jssj: Double; kdbh, hphm, hpzl: String;
  currentpage, pagesize: Integer; var totalNum: Integer): string;
var
  line: string;
  lines: TStrings;
begin
  Result := '';
  lines := GetPassContent(kssj, jssj, kdbh, hphm, hpzl, currentpage, pagesize,
    totalNum);
  if lines.Count > 0 then
  begin
    for line in lines do
      Result := Result + ',' + StrToPassjson(line);
    Result := '[' + Result.Substring(1) + ']';
  end;
  lines.Free;
end;

class function TSolr.StrToPassjson(line: string): string;
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
  end
  else
    gcsj := '';
  Result := '"cjjg":"' + ss[0] + '"';
  Result := Result + ',"gcxh":"' + ss[1] + '"';
  // Result := Result + ',"KKSOURCE":"' + ss[2] + '"';
  Result := Result + ',"kdbh":"' + ss[3] + '"';
  // Result := Result + ',"FXBH":"' + ss[4] + '"';
  Result := Result + ',"cdbh":"' + ss[5] + '"';
  // Result := Result + ',"CDLX":"' + ss[6] + '"';
  Result := Result + ',"hpzl":"' + ss[7] + '"';
  Result := Result + ',"gcsj":"' + gcsj + '"';
  Result := Result + ',"clsd":"' + ss[9] + '"';
  // Result := Result + ',"HPYS":"' + ss[10] + '"';
  // Result := Result + ',"CLLX":"' + ss[11] + '"';
  Result := Result + ',"hphm":"' + ss[12] + '"';
  // Result := Result + ',"CWHPHM":"' + ss[13] + '"';
  // Result := Result + ',"CWHPYS":"' + ss[14] + '"';
  // Result := Result + ',"HPYZ":"' + ss[15] + '"';
  // Result := Result + ',"YRKSJ":"' + ss[16] + '"';
  Result := Result + ',"csys":"' + ss[17] + '"';
  // Result := Result + ',"CLXS":"' + ss[18] + '"';
  Result := Result + ',"clpp":"' + ss[19] + '"';
  // Result := Result + ',"CLWX":"' + ss[20] + '"';
  // Result := Result + ',"XSZT":"' + ss[21] + '"';
  // Result := Result + ',"WFBJ":"' + ss[22] + '"';
  Result := Result + ',"fwqdz":"' + ss[23] + '"';
  Result := Result + ',"tp1":"' + ss[24] + '"';
  Result := Result + ',"tp2":"' + ss[25] + '"';
  Result := Result + ',"tp3":"' + ss[26] + '"';
  {
    Result := Result + ',"TZTP":"' + ss[27] + '"';
    Result := Result + ',"DRTP1":"' + ss[28] + '"';
    Result := Result + ',"DRTP2":"' + ss[29] + '"';
    Result := Result + ',"RKSJ":"' + ss[30] + '"';
    Result := Result + ',"FSBZ":"' + ss[31] + '"';
    Result := Result + ',"ALARM_TYPE":"' + ss[32] + '"';
    Result := Result + ',"ALARM_SRC":"' + ss[33] + '"';
    Result := Result + ',"ALARM_SRC_ID":"' + ss[34] + '"';
    Result := Result + ',"FLAG":"' + ss[35] + '"';
    Result := Result + ',"GXSJ":"' + ss[36] + '"';
    Result := Result + ',"LDBH":"' + ss[37] + '"';
    Result := Result + ',"LKBH":"' + ss[38] + '"';
    Result := Result + ',"ser01":"' + ss[39] + '"';
    Result := Result + ',"SER02":"' + ss[40] + '"';
    Result := Result + ',"SER03":"' + ss[41] + '"';
    Result := Result + ',"SER04":"' + ss[42] + '"';
    Result := Result + ',"SER05":"' + ss[43] + '"';
    Result := Result + ',"SER06":"' + ss[44] + '"';
    Result := Result + ',"SER07":"' + ss[45] + '"';
    Result := Result + ',"SER08":"' + ss[46] + '"';
    Result := Result + ',"SER09":"' + ss[47] + '"';
  }
  if TCommon.DicDevice.ContainsKey(ss[3]) then
    Result := Result + ',"sbddmc":"' + TCommon.DicDevice[ss[3]].SBDDMC + '"'
  else
    Result := Result + ',"sbddmc":""';
  if TCommon.DicHpzlmc.ContainsKey(ss[7]) then
    Result := Result + ',"hpzlmc":"' + TCommon.DicHpzlmc[ss[7]] + '"'
  else
    Result := Result + ',"hpzlmc":""';
  Result := '{' + Result + '}';
end;

end.
