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
    class function HttPPost(AUrl: String; AParams: TStrings;
      var AResult: String; AEncoding: TEncoding = nil): Boolean;
    class function DFLogin(AUser, APwd: String; var AToken: String): Boolean;
    class procedure DFLogout(AToken: String);
  public
    class function GetK08SearchParam(param: TDictionary<string, String>;
      page, pageSize: string): TStrings;
    class function DFCreateImageJob(AImages: TList<TImageInfo>): Boolean;
    class function DFAnalysisOnePic(Url: String; var AMsg: String)
      : TList<TDFVehInfo>; overload;
    class function DFAnalysisOnePic(Url: String): String; overload;
    class function GetK08PassList(AParams: TStrings; var totalPage: Integer;
      var currentPage: Integer): TList<TK08VehInfo>;
    class function GetMaxPassTime(param: TDictionary<string, String>)
      : TDateTime;
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
  Params := TStringList.Create;
  try
    if not DFLogin(gHikConfig.DFUser, gHikConfig.DFPwd, s) then
      exit;
    if s = '' then
      exit;
    token := s;

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
    if HttPPost(gHikConfig.DFUrl, Params, s) then
    begin
      Result := TDecodeHikResult.DecodeDFAnalysisOnePicResult(s);
    end
    else
    begin
      glogger.Error(s);
      AMsg := s;
    end;
    DFLogout(token);
  except
    on e: exception do
    begin
      glogger.Error(e.Message);
      AMsg := e.Message;
    end;
  end;
  Params.Free;
  ActiveX.CoUninitialize;
end;

class function THik.DFAnalysisOnePic(Url: String): String;
var
  msg: String;
  ls: TList<TDFVehInfo>;
begin
  Result := '';
  ls := DFAnalysisOnePic(Url, msg);
  if ls <> nil then
    Result := TCommon.RecordListToJSON<TDFVehInfo>(ls);
end;

class function THik.DFCreateImageJob(AImages: TList<TImageInfo>): Boolean;
var
  Params: TStrings;
  token, s, imgStr: String;
  img: TImageInfo;
begin
  Result := False;
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  if not DFLogin(gHikConfig.DFUser, gHikConfig.DFPwd, s) then
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
  Params.Add('               <ivms:destinationUrl>' + gHikConfig.K08SaveUrl +
    '</ivms:destinationUrl>');
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
  Result := HttPPost(gHikConfig.DFUrl, Params, s);
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
  if HttPPost(gHikConfig.DFUrl, Params, token) then
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
  HttPPost(gHikConfig.DFUrl, Params, s);
  Params.Free;
end;

class function THik.GetK08PassList(AParams: TStrings; var totalPage: Integer;
  var currentPage: Integer): TList<TK08VehInfo>;
var
  s: String;
begin
  Result := nil;
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);

  if HttPPost(gHikConfig.K08SearchURL, AParams, s, TEncoding.UTF8) then
  begin
    try
      Result := TDecodeHikResult.DecodeK08SearchResult(s, totalPage,
        currentPage);
    except
      glogger.Error(s);
    end;
  end;
  ActiveX.CoUninitialize;
end;

class function THik.GetK08SearchParam(param: TDictionary<string, String>;
  page, pageSize: string): TStrings;
var
  key: String;
begin
  Result := TStringList.Create;
  Result.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/traffic/ws/">');
  Result.Add('   <soapenv:Header/>');
  Result.Add('   <soapenv:Body>');
  Result.Add('      <ws:moreLikeThis>');
  Result.Add('         <arg0>');
  Result.Add('            <beanId>pass</beanId>');
  Result.Add('            <currentPage>' + page + '</currentPage>');
  Result.Add('            <pageSize>' + pageSize + '</pageSize>');
  for key in param.Keys do
  begin
    if key = 'q' then
    begin
      Result.Add('             <q>' + param[key] + '</q>');
    end
    else
    begin
      Result.Add('             <fieldOptions>');
      Result.Add('               <filedName>' + key + '</filedName>');
      Result.Add('               <keyWords>' + param[key] + '</keyWords>');
      Result.Add('             </fieldOptions>');
    end;
  end;
  Result.Add('           <sortColumn>passtime</sortColumn>');
  Result.Add('           <sortMethod>desc</sortMethod>');
  Result.Add('         </arg0>');
  Result.Add('      </ws:moreLikeThis>');
  Result.Add('   </soapenv:Body>');
  Result.Add('</soapenv:Envelope>');
end;

class function THik.GetMaxPassTime(param: TDictionary<string, String>)
  : TDateTime;
var
  Params: TStrings;
  vehList: TList<TK08VehInfo>;
  c, t: Integer;
begin
  Result := 0;
  if not param.ContainsKey('vehicletype') then
    param.Add('vehicletype', '3');
  Params := GetK08SearchParam(param, '1', '1');
  vehList := GetK08PassList(Params, c, t);
  if (vehList <> nil) and (vehList.Count > 0) then
  begin
    Result := DateUtils.IncMilliSecond(25569.3333333333,
      StrToInt64(vehList[0].PassTime));
    vehList.Free;
  end;
  Params.Free;
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
