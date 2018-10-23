unit uHik;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, uEntity;

type

  TImageInfo = Record
    GCXH: String;
    KDBH: String;
    CDBH: String;
    Url: String;
    PassTime: String;
  End;

  THik = class
  private
    class var FK08Hpzl: TDictionary<String, TStrings>;
    class var FTYHpzl: TDictionary<String, String>;
    class var FK08Clpp: TDictionary<String, String>;
    class var FK08Csys: TDictionary<String, String>;
    class var FDevID: TDictionary<String, String>;
    class function GetK08SearchParam(param, page, pageSize: string): TStrings;
    class function HttPPost(AUrl: String; AParams: TStrings;
      var AResult: String; AEncoding: TEncoding = nil): Boolean;
    class function GetK08Hpzl(): TDictionary<String, TStrings>; static;
    class function GetHpzl(): TDictionary<String, String>; static;
    class function GetK08Clpp(): TDictionary<String, String>; static;
    class function GetK08Csys(): TDictionary<String, String>; static;
    class function GetDevID(): TDictionary<String, String>; static;
    class function AssemblePassjson(veh: TK08VehInfo): String;
  public
    class property K08Hpzl: TDictionary<String, TStrings> read GetK08Hpzl;
    class property TYHpzl: TDictionary<String, String> read GetHpzl;
    class property K08Clpp: TDictionary<String, String> read GetK08Clpp;
    class property K08Csys: TDictionary<String, String> read GetK08Csys;
    class property DevID: TDictionary<String, String> read GetDevID;

    class function GetK08VehInfo(hphm, hpzl: String): String;
    class function GetK08PassList(kssj, jssj, hphm, hpzl, KDBH, clpp, csys,
      clpp1, aqd, aqd1, zyb, zyb1, gj, page, pageSize: string;
      var totalNum: Integer): String;
  end;

implementation

class function THik.AssemblePassjson(veh: TK08VehInfo): String;
var
  KDBH, hpzl: String;
begin
  Result := '"cjjg":""';
  Result := Result + ',"gcxh":"' + veh.passid + '"';

  if DevID.ContainsKey(veh.crossingid) then
    KDBH := DevID[veh.crossingid]
  else
    KDBH := veh.crossingid;

  Result := Result + ',"kdbh":"' + KDBH + '"';
  Result := Result + ',"cdbh":"' + veh.laneno + '"';

  if TYHpzl.ContainsKey(veh.vehicletype) then
    hpzl := TYHpzl[veh.vehicletype]
  else
    hpzl := veh.vehicletype;

  Result := Result + ',"hpzl":"' + hpzl + '"';
  Result := Result + ',"gcsj":"' + veh.PassTime + '"';
  Result := Result + ',"clsd":"' + veh.vehiclespeed + '"';
  Result := Result + ',"hphm": " ' + veh.plateno + '"';

  if K08Csys.ContainsKey(veh.vehiclecolor) then
    Result := Result + ',"csys":"' + K08Csys[veh.vehiclecolor] + '"'
  else
    Result := Result + ',"csys":"' + veh.vehiclecolor + '"';

  if K08Clpp.ContainsKey(veh.vehiclesublogo) then
    Result := Result + ',"clpp":"' + K08Clpp[veh.vehiclesublogo] + '"'
  else if K08Clpp.ContainsKey(veh.vehiclelogo + '-0') then
    Result := Result + ',"clpp":"' + K08Clpp[veh.vehiclelogo + '-0'] + '"'
  else
    Result := Result + ',"clpp":"' + veh.vehiclesublogo + '"';

  Result := Result + ',"fwqdz":""';
  Result := Result + ',"tp1":"' + veh.imagepath + '"';
  Result := Result + ',"tp2":""';
  Result := Result + ',"tp3":""';
  if TCommon.DicDevice.ContainsKey(KDBH) then
    Result := Result + ',"sbddmc":"' + TCommon.DicDevice[KDBH].SBDDMC + '"'
  else
    Result := Result + ',"sbddmc":""';
  if TCommon.DicHpzlmc.ContainsKey(hpzl) then
    Result := Result + ',"hpzlmc":"' + TCommon.DicHpzlmc[hpzl] + '"'
  else
    Result := Result + ',"hpzlmc":""';
  Result := '{' + Result + '}';
end;

class function THik.GetK08SearchParam(param, page, pageSize: string): TStrings;
var
  iPage: Integer;
begin
  iPage := StrToIntDef(page, 0);
  iPage := iPage + 1;
  Result := TStringList.Create;
  Result.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/kms/ws/">');
  Result.Add('   <soapenv:Header/>');
  Result.Add('   <soapenv:Body>');
  Result.Add('      <ws:moreLikeThis>');
  Result.Add('         <arg0>');
  Result.Add('            <appCode>ivms8200_hare</appCode>');
  Result.Add('            <beanId>pass</beanId>');
  Result.Add('            <currentPage>' + IntToStr(iPage) + '</currentPage>');
  Result.Add('            <pageSize>' + pageSize + '</pageSize>');
  Result.Add('            <password>vlss</password>');
  Result.Add('            <q>' + param + '</q>');
  Result.Add('            <tableName>BayonetVehiclePass</tableName>');
  Result.Add('            <userName>vlss</userName>');
  Result.Add('         </arg0>');
  Result.Add('      </ws:moreLikeThis>');
  Result.Add('   </soapenv:Body>');
  Result.Add('</soapenv:Envelope>');
end;

class function THik.GetDevID: TDictionary<String, String>;
begin
  if FDevID = nil then
    FDevID := TCommon.GetDevID;
  Result := FDevID;
end;

class function THik.GetHpzl: TDictionary<String, String>;
begin
  if FTYHpzl = nil then
    FTYHpzl := TCommon.GetHpzl;
  Result := FTYHpzl;
end;

class function THik.GetK08Clpp: TDictionary<String, String>;
begin
  if FK08Clpp = nil then
    FK08Clpp := TCommon.GetK08Clpp;
  Result := FK08Clpp;
end;

class function THik.GetK08Csys: TDictionary<String, String>;
begin
  if FK08Csys = nil then
    FK08Csys := TCommon.GetK08Csys;
  Result := FK08Csys;
end;

class function THik.GetK08Hpzl: TDictionary<String, TStrings>;
begin
  if FK08Hpzl = nil then
    FK08Hpzl := TCommon.GetK08Hpzl;
  Result := FK08Hpzl;
end;

class function THik.GetK08PassList(kssj, jssj, hphm, hpzl, KDBH, clpp, csys,
  clpp1, aqd, aqd1, zyb, zyb1, gj, page, pageSize: string;
  var totalNum: Integer): String;
var
  Params: TStrings;
  param, s, h: String;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
  totalPage, currentPage: Integer;
begin
  Result := '';
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);

  param := 'passtime:([' + kssj + ' TO ' + jssj + '])';
  if (KDBH <> '') and TCommon.DicDevice.ContainsKey(KDBH) then
    param := param + ' AND crossingid:(' + TCommon.DicDevice[KDBH].ID + ')';
  if hphm <> '' then
    param := param + ' AND plateinfono:(' + hphm + ')';

  if (hpzl <> '') and (K08Hpzl.ContainsKey(hpzl)) then
  begin
    for s in K08Hpzl[hpzl] do
      h := h + ' ' + s;
    param := param + ' AND vehicletype:(' + h.Substring(1) + ')';
  end
  else if hpzl <> '' then
    param := param + ' AND vehicletype:(' + hpzl + ')';

  if clpp <> '' then
    param := param + ' AND vehiclelogo:(' + clpp + ')';
  if csys <> '' then
    param := param + ' AND vehiclecolor:(' + csys + ')';
  if clpp1 <> '' then
    param := param + ' AND vehiclesublogo:(' + clpp1 + ')';
  if aqd <> '' then
    param := param + ' AND pilotsafebelt:(' + aqd + ')';
  if aqd1 <> '' then
    param := param + ' AND vicepilotsafebelt:(' + aqd1 + ')';
  if zyb <> '' then
    param := param + ' AND vehiclesunvisor:(' + zyb + ')';
  if zyb1 <> '' then
    param := param + ' AND vicepilotsunvisor:(' + zyb1 + ')';
  if gj <> '' then
    param := param + ' AND pendant:(' + gj + ')';
  param := '(' + param + ')';

  Params := GetK08SearchParam(param, page, pageSize);

  if HttPPost(gConfig.HikConfig.moreLikeThisHBase, Params, s, TEncoding.UTF8)
  then
  begin
    try
      vehList := TDecodeHikResult.DecodeK08SearchResult(s, totalPage,
        currentPage);
    except
      glogger.Error(s);
    end;
    if (vehList <> nil) and (vehList.Count > 0) then
    begin
      for veh in vehList do
        Result := Result + ',' + AssemblePassjson(veh);
      Result := '[' + Result.Substring(1) + ']';
      vehList.Free;
    end
  end;
  Params.Free;
  ActiveX.CoUninitialize;
end;

class function THik.GetK08VehInfo(hphm, hpzl: String): String;
var
  Params: TStrings;
  param, s: String;
  vehList: TList<TK08VehInfo>;
  totalPage, currentPage, totalNum: Integer;
begin
  Result := '';
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);

  if K08Hpzl.ContainsKey(hpzl) then
  begin
    for s in K08Hpzl[hpzl] do
      param := param + ' ' + s;
  end;
  param := '(vehicletype:(' + param.Substring(1) + ') AND plateinfono:(' +
    hphm + '))';

  Params := GetK08SearchParam(param, '1', '1');

  if HttPPost(gConfig.HikConfig.moreLikeThisHBase, Params, s, TEncoding.UTF8)
  then
  begin
    vehList := TDecodeHikResult.DecodeK08SearchResult(s, totalPage,
      currentPage);
    if (vehList <> nil) and (vehList.Count > 0) then
    begin
      if K08Clpp.ContainsKey(vehList[0].vehiclesublogo) then
        Result := '"CLPP":"' + K08Clpp[vehList[0].vehiclesublogo] + '"'
      else if K08Clpp.ContainsKey(vehList[0].vehiclelogo + '-0') then
        Result := 'CLPP:"' + K08Clpp[vehList[0].vehiclelogo + '-0'] + '"'
      else
        Result := '"CLPP":"' + vehList[0].vehiclesublogo + '"';
      if K08Csys.ContainsKey(vehList[0].vehiclecolor) then
        Result := Result + ',"CSYS":"' + K08Csys[vehList[0].vehiclecolor] + '"'
      else
        Result := Result + ',"CSYS":"' + vehList[0].vehiclecolor + '"';
      Result := '[{' + Result + '}]';
      vehList.Free;
    end
  end;

  Params.Free;
  ActiveX.CoUninitialize;
end;

class function THik.HttPPost(AUrl: String; AParams: TStrings;
  var AResult: String; AEncoding: TEncoding = nil): Boolean;
var
  http: TIdHTTP;
  stream: TMemoryStream;
  response: TStream;
  bytes: TBytes;
begin
  AResult := '';
  Result := False;
  http := TIdHTTP.Create(nil);
  stream := TMemoryStream.Create;
  try
    if AEncoding = nil then
      AParams.SaveToStream(stream)
    else
      AParams.SaveToStream(stream, AEncoding);
    response := TMemoryStream.Create();
    http.Post(AUrl, stream, response);
    SetLength(bytes, response.Size);
    response.Seek(0, TSeekOrigin.soBeginning);
    response.ReadBuffer(bytes, response.Size);
    response.Free;
    AResult := TEncoding.UTF8.GetString(bytes);
    Result := True;
  except
    AResult := UTF8Decode(http.ResponseText);
  end;
  stream.Free;
  http.Disconnect;
  http.Free;
end;

end.
