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
    class function DFLogin(AUser, APwd: String; var AToken: String): Boolean;
    class procedure DFLogout(AToken: String);
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

    class function DFCreateImageJob(AImages: TList<TImageInfo>): Boolean;
    class function DFAnalysisOnePic(Url: String; var AMsg: String)
      : TList<TDFVehInfo>; overload;
    class function DFAnalysisOnePic(Url: String): String; overload;
    class function GetK08VehInfo(hphm, hpzl: String): String;
    class function GetK08PassList(kssj, jssj, hphm, hpzl, KDBH, clpp, csys,
      clpp1, aqd, aqd1, zyb, zyb1, gj, page, pageSize: string;
      var totalNum: Integer): String;
  end;

implementation

class function THik.DFAnalysisOnePic(Url: String; var AMsg: String)
  : TList<TDFVehInfo>;
var
  Params: TStrings;
  token, s: String;
begin
  Result := nil;
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  if not DFLogin(gConfig.HikConfig.DFUser, gConfig.HikConfig.DFPwd, s) then
    exit;
  if s = '' then
    exit;
  token := s;
  Params := TStringList.Create;
  Params.Add
    ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl">');
  Params.Add('   <soap:Header>');
  Params.Add('      <wsdl:HeaderReq>');
  Params.Add('         <wsdl:token>' + token + '</wsdl:token>');
  Params.Add('         <wsdl:version>1.2</wsdl:version>');
  Params.Add('      </wsdl:HeaderReq>');
  Params.Add('   </soap:Header>');
  Params.Add('   <soap:Body>');
  Params.Add('      <wsdl:PicAnalysisReq>');
  Params.Add('         <wsdl:nDataType>1</wsdl:nDataType>');
  Params.Add('         <wsdl:algorithmType>258</wsdl:algorithmType>');
  Params.Add('         <wsdl:strPicUrl>' + Url + '</wsdl:strPicUrl>');
  Params.Add('         <wsdl:PicData>cid:1211963137164</wsdl:PicData>');
  Params.Add('      </wsdl:PicAnalysisReq>');
  Params.Add('   </soap:Body>');
  Params.Add('</soap:Envelope>');
  if HttPPost(gConfig.HikConfig.DFUrl, Params, s) then
  begin
    Result := TDecodeHikResult.DecodeDFAnalysisOnePicResult(s);
  end
  else
  begin
    glogger.Error(s);
    AMsg := s;
  end;
  DFLogout(token);
  Params.Free;
  ActiveX.CoUninitialize;
end;

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

class function THik.DFAnalysisOnePic(Url: String): String;
var
  msg, logo: String;
  ls, ls1: TList<TDFVehInfo>;
  i: Integer;
  veh: TDFVehInfo;
begin
  Result := '';
  ls := DFAnalysisOnePic(Url, msg);
  if ls <> nil then
  begin
    ls1 := TList<TDFVehInfo>.Create;
    for i := 0 to ls.Count - 1 do
    begin
      veh := ls[i];
      logo := ls[i].nMainLogo + '-' + ls[i].nSubLogo;
      if K08Clpp.ContainsKey(logo) then
        veh.nMainLogo := K08Clpp[logo]
      else
        veh.nMainLogo := logo;
      ls1.Add(veh);
    end;
    Result := TCommon.RecordListToJSON<TDFVehInfo>(ls1);
    ls1.Free;
    ls.Free;
  end;
end;

class function THik.DFCreateImageJob(AImages: TList<TImageInfo>): Boolean;
var
  Params: TStrings;
  token, s, imgStr: String;
  img: TImageInfo;
begin
  Result := False;
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  if not DFLogin(gConfig.HikConfig.DFUser, gConfig.HikConfig.DFPwd, s) then
    exit;
  if s = '' then
    exit;
  token := s;

  Params := TStringList.Create;

  Params.Add
    ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl" xmlns:ivms="http://www.hikvision.com.cn/ver1/schema/ivms/">');
  Params.Add('   <soap:Header>');
  Params.Add('      <wsdl:HeaderReq>');
  Params.Add('         <wsdl:token>' + token + '</wsdl:token>');
  Params.Add('         <wsdl:version>1.2</wsdl:version>');
  Params.Add('      </wsdl:HeaderReq>');
  Params.Add('   </soap:Header>');
  Params.Add('   <soap:Body>');
  Params.Add('      <wsdl:SubmitJobReq>');
  Params.Add('         <wsdl:jobInfo>');
  Params.Add('            <ivms:jobName>job_' +
    FormatDateTime('yyyymmddhhnnsszzz', Now()) + '</ivms:jobName>');
  Params.Add('            <ivms:jobType>2</ivms:jobType>');
  Params.Add('            <ivms:dataSourceType>2</ivms:dataSourceType>');
  Params.Add('            <ivms:priority>30</ivms:priority>');
  Params.Add('            <ivms:source>test111</ivms:source>');
  Params.Add('            <ivms:algorithmType>770</ivms:algorithmType>');
  Params.Add('            <!--1 or more repetitions:-->');
  Params.Add('            <ivms:destinationInfos>');
  Params.Add('               <ivms:destinationUrl>' +
    gConfig.HikConfig.K08SaveUrl + '</ivms:destinationUrl>');
  Params.Add('               <ivms:destinationType>17</ivms:destinationType>');
  Params.Add('            </ivms:destinationInfos>');
  Params.Add('            <ivms:streamInfo>');
  Params.Add('               <ivms:streamType>2</ivms:streamType>');
  imgStr := '               <ivms:streamUrl>images://{"imageInfos":	[';
  for img in AImages do
  begin
    imgStr := imgStr + '{"data":	"' + img.Url + '",' +
      '"dataType":	1,"id":	"dddddddddddddd","LaneNO":	1,"plate":	"","vehicleDir":	0,'
      + '"targetAttrs":	"{\n\t\"crossing_id\":\t\"' + img.KDBH +
      '\",\n\t\"pass_id\":\t\"' + img.GCXH + '\",\n\t\"lane_no\":\t\"' +
      img.CDBH + '\",\n\t\"pass_time\":\t\"' + img.PassTime + '\"\n}"},'
  end;
  imgStr := copy(imgStr, 1, Length(imgStr) - 1) +
    '],"operate":524287,"targetNum":100,"plateRegMode":	0}</ivms:streamUrl>';
  Params.Add(imgStr);
  Params.Add('               <ivms:smart>false</ivms:smart>');
  Params.Add('               <ivms:maxSplitCount>0</ivms:maxSplitCount>');
  Params.Add('               <ivms:splitTime>0</ivms:splitTime>');
  Params.Add('            </ivms:streamInfo>');
  Params.Add('         </wsdl:jobInfo>');
  Params.Add('      </wsdl:SubmitJobReq>');
  Params.Add('   </soap:Body>');
  Params.Add('</soap:Envelope>');
  Result := HttPPost(gConfig.HikConfig.DFUrl, Params, s);
  DFLogout(token);
  glogger.Debug(s);
  Params.Free;
  ActiveX.CoUninitialize;
end;

class function THik.DFLogin(AUser, APwd: String; var AToken: String): Boolean;
var
  Params: TStrings;
  token: String;
begin
  AToken := '';
  Result := False;
  Params := TStringList.Create;
  Params.Add
    ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl">');
  Params.Add('   <soap:Header/>');
  Params.Add('   <soap:Body>');
  Params.Add('      <wsdl:LoginReq>');
  Params.Add('         <wsdl:userName>' + AUser + '</wsdl:userName>');
  Params.Add('         <wsdl:password>' + APwd + '</wsdl:password>');
  Params.Add('      </wsdl:LoginReq>');
  Params.Add('   </soap:Body>');
  Params.Add('</soap:Envelope>');
  if HttPPost(gConfig.HikConfig.DFUrl, Params, token) then
  begin
    if pos('<token>', token) > 0 then
      token := copy(token, pos('<token>', token) + 7, Length(token));
    if pos('</token>', token) > 0 then
      AToken := copy(token, 1, pos('</token>', token) - 1);
    Result := True;
  end;
  Params.Free;
end;

class procedure THik.DFLogout(AToken: String);
var
  Params: TStrings;
  s: String;
begin
  Params := TStringList.Create;
  Params.Add
    ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl">');
  Params.Add('   <soap:Header>');
  Params.Add('      <wsdl:HeaderReq>');
  Params.Add('         <wsdl:token>' + AToken + '</wsdl:token>');
  Params.Add('         <wsdl:version>1.2</wsdl:version>');
  Params.Add('      </wsdl:HeaderReq>');
  Params.Add('   </soap:Header>');
  Params.Add('   <soap:Body>');
  Params.Add('      <wsdl:LogoutReq>');
  Params.Add('         <wsdl:token>' + AToken + '</wsdl:token>');
  Params.Add('      </wsdl:LogoutReq>');
  Params.Add('   </soap:Body>');
  Params.Add('</soap:Envelope>');
  HttPPost(gConfig.HikConfig.DFUrl, Params, s);
  Params.Free;
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

  if HttPPost(gConfig.HikConfig.K08SearchURL, Params, s, TEncoding.UTF8) then
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

  if HttPPost(gConfig.HikConfig.K08SearchURL, Params, s, TEncoding.UTF8) then
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
