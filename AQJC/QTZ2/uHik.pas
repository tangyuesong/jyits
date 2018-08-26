unit uHik;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, uEntity, Windows;

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
    class function GetK08SearchParam(param: TDictionary<string, String>;
      page, pageSize: string): TStrings;
    class function HttPPost(AUrl: String; AParams: TStrings;
      var AResult: String; AEncoding: TEncoding = nil): Boolean;
    class function DFLogin(AUser, APwd: String; var AToken: String): Boolean;
    class procedure DFLogout(AToken: String);
  public
    class function DFCreateImageJob(AImages: TList<TImageInfo>): Boolean;
    class function DFAnalysisOnePic(Url: String; var AMsg: String)
      : TList<TDFVehInfo>; overload;
    class function DFAnalysisOnePic(Url: String): String; overload;
    class function GetK08VehInfo(hphm, hpzl: String): String;
    class function GetK08PassList(param: TDictionary<string, String>;
      page, pageSize: String): String;
    class function submitCarFaceCompareJob(passTimeStart, passTimeEnd,
      crossingIdSet, picData: String; stDetectRect, stROIRect: TRect;
      modelCmpThreadhold, modelTopN, ROICmpThreadhold, ROITopN, vehiclelogo,
      vehiclesublogo, vehicleHead, vehiclemodel: String;
      modeInfo: TmodeInfo): String;
    class function Query(Params: TStrings): String;
    class function picAnalysis(picStr: WideString): String;
    class function getJobResultByTaskId(taskid: String): String;
    class function getJobFinalResultByTaskId(taskid: String): String;
    class function GetCarFaceJobParam(passTimeStart, passTimeEnd, crossingIdSet,
      picData: String; stDetectRect, stROIRect: TRect;
      modelCmpThreadhold, modelTopN, ROICmpThreadhold, ROITopN, vehiclelogo,
      vehiclesublogo, vehicleHead, vehiclemodel: String; modeInfo: TmodeInfo)
      : TStrings;
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
    if not DFLogin(gConfig.HikConfig.DFUser, gConfig.HikConfig.DFPwd, s) then
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
  Result.Add('      <ws:moreLikeThisCustomized>');
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
  Result.Add('           <cursorMark>*</cursorMark>');
  Result.Add('           <sortColumn>passtime</sortColumn>');
  Result.Add('           <sortMethod>desc</sortMethod>');
  Result.Add('         </arg0>');
  Result.Add('      </ws:moreLikeThisCustomized>');
  Result.Add('   </soapenv:Body>');
  Result.Add('</soapenv:Envelope>');
end;

class function THik.GetK08PassList(param: TDictionary<string, String>;
  page, pageSize: String): String;
var
  Params: TStrings;
  s, h, clpp: String;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
  totalPage, currentPage: Integer;
begin
  Result := '';
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);

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
      begin
        s := '"HPHM":"' + veh.plateno + '",';
        if gHpzl.ContainsKey(veh.vehicletype) then
          s := s + '"HPZL":"' + gHpzl[veh.vehicletype] + '"'
        else
          s := s + '"HPZL":"' + veh.vehicletype + '"';
        s := s + ',"GCSJ":"' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
          DateUtils.IncMilliSecond(25569.3333333333,
          StrToInt64(veh.PassTime))) + '",';

        if gHikID.ContainsKey(veh.crossingid) then
          s := s + '"KDBH":"' + gHikID[veh.crossingid] + '"'
        else if gDevID.ContainsKey(veh.crossingid) then
          s := s + '"KDBH":"' + gDevID[veh.crossingid] + '"'
        else
          s := s + '"KDBH":"' + veh.crossingid + '"';

        clpp := veh.vehiclelogo + '-' + veh.vehiclesublogo;
        if gK08Clpp.ContainsKey(clpp) then
          s := s + ',"CLPP":"' + gK08Clpp[clpp] + '"'
        else if gK08Clpp.ContainsKey(veh.vehiclelogo + '-0') then
          s := s + ',"CLPP":"' + gK08Clpp[veh.vehiclelogo + '-0'] + '"'
        else
          s := s + ',"CLPP":"' + clpp + '"';

        if gK08Csys.ContainsKey(veh.vehiclecolor) then
          s := s + ',"CSYS":"' + gK08Csys[veh.vehiclecolor] + '"'
        else
          s := s + ',"CSYS":"' + veh.vehiclecolor + '"';
        s := '{' + s + ',"CDBH":"' + veh.laneno + '","CLSD":"' +
          veh.vehiclespeed + '","FWQDZ":"","TP1":"http://10.43.255.8:18088' +
          veh.imagepath + '&appname=PIC&isstream=1"}';

        Result := Result + ',' + s;
      end;
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
  param: TDictionary<string, String>;
  s, hpzls, clpp: String;
  vehList: TList<TK08VehInfo>;
  totalPage, currentPage: Integer;
begin
  Result := '';
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  param := TDictionary<string, String>.Create;

  if gK08Hpzl.ContainsKey(hpzl) then
  begin
    for s in gK08Hpzl[hpzl] do
      hpzls := hpzls + ' ' + s;
  end;
  param.Add('plateno', hphm);
  param.Add('vehicletype', hpzls.Substring(1));
  Params := GetK08SearchParam(param, '1', '1');
  param.Free;

  if HttPPost(gConfig.HikConfig.K08SearchURL, Params, s, TEncoding.UTF8) then
  begin
    vehList := TDecodeHikResult.DecodeK08SearchResult(s, totalPage,
      currentPage);
    if (vehList <> nil) and (vehList.Count > 0) then
    begin
      clpp := vehList[0].vehiclelogo + '-' + vehList[0].vehiclesublogo;
      if gK08Clpp.ContainsKey(clpp) then
        Result := '"CLPP":"' + gK08Clpp[clpp] + '"'
      else if gK08Clpp.ContainsKey(vehList[0].vehiclelogo + '-0') then
        Result := 'CLPP:"' + gK08Clpp[vehList[0].vehiclelogo + '-0'] + '"'
      else
        Result := '"CLPP":"' + clpp + '"';
      if gK08Csys.ContainsKey(vehList[0].vehiclecolor) then
        Result := Result + ',"CSYS":"' + gK08Csys[vehList[0].vehiclecolor] + '"'
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
  http.ConnectTimeout := 30000;
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

class function THik.picAnalysis(picStr: WideString): String;
var
  Url: String;
  Params: TStrings;
begin
  Result := '';
  Url := gConfig.HikConfig.picAnalysis;;
  Params := TStringList.Create;
  Params.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/traffic/ws/">');
  Params.Add('<soapenv:Header/>');
  Params.Add('<soapenv:Body>');
  Params.Add('   <ws:picAnalysis>');
  Params.Add('      <nDataType>0</nDataType>');
  Params.Add('      <picData>' + picStr + '</picData>');
  Params.Add('      <algorithmType>770</algorithmType>');
  Params.Add('   </ws:picAnalysis>');
  Params.Add('</soapenv:Body>');
  Params.Add('</soapenv:Envelope>');

  if not HttPPost(Url, Params, Result, TEncoding.UTF8) then
    Result := '';
  Params.Free;
end;

class function THik.Query(Params: TStrings): String;
begin
  if not HttPPost(gConfig.HikConfig.CarFace, Params, Result, TEncoding.UTF8)
  then
    Result := '';
end;

class function THik.GetCarFaceJobParam(passTimeStart, passTimeEnd,
  crossingIdSet, picData: String; stDetectRect, stROIRect: TRect;
  modelCmpThreadhold, modelTopN, ROICmpThreadhold, ROITopN, vehiclelogo,
  vehiclesublogo, vehicleHead, vehiclemodel: String; modeInfo: TmodeInfo)
  : TStrings;
var
  Params: TStrings;
begin
  Params := TStringList.Create;
  Params.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/traffic/ws/">');
  Params.Add('   <soapenv:Header/>');
  Params.Add('   <soapenv:Body>');
  Params.Add('      <ws:submitCarFaceCompareJob>');
  Params.Add('         <carFaceParam>');
  if crossingIdSet <> '' then
    Params.Add('            <crossingIdSet>' + crossingIdSet +
      '</crossingIdSet>');

  Params.Add('            <modelInfo>');
  Params.Add('               <hashData>' + modeInfo.hashData + '</hashData>');
  Params.Add('               <modelRect>');
  Params.Add('                  <x>' + modeInfo.modeRect.Left.ToString
    + '</x>');
  Params.Add('                  <y>' + modeInfo.modeRect.Top.ToString + '</y>');
  Params.Add('                  <width>' + modeInfo.modeRect.Width.ToString +
    '</width>');
  Params.Add('                  <height>' + modeInfo.modeRect.Height.ToString +
    '</height>');
  Params.Add('               </modelRect>');
  Params.Add('            </modelInfo>');
  if modelTopN <> '' then
    Params.Add('            <modelTopN>' + modelTopN + '</modelTopN>');
  Params.Add('            <passTimeEnd>' + passTimeEnd + '</passTimeEnd>');
  Params.Add('            <passTimeStart>' + passTimeStart +
    '</passTimeStart>');
  Params.Add('            <picData>' + picData + '</picData>');
  Params.Add('            <modelCmpThreadhold>' + modelCmpThreadhold +
    '</modelCmpThreadhold>');
  if ROICmpThreadhold <> '' then
    Params.Add('            <ROICmpThreadhold>' + ROICmpThreadhold +
      '</ROICmpThreadhold>');
  if ROITopN <> '' then
    Params.Add('            <ROITopN>' + ROITopN + '</ROITopN>');
  Params.Add('            <stDetectRect>');
  Params.Add('               <x>' + stDetectRect.Left.ToString + '</x>');
  Params.Add('               <y>' + stDetectRect.Top.ToString + '</y>');
  Params.Add('               <width>' + stDetectRect.Width.ToString +
    '</width>');
  Params.Add('               <height>' + stDetectRect.Height.ToString +
    '</height>');
  Params.Add('            </stDetectRect>');
  if stROIRect.Width * stROIRect.Height > 0 then
  begin
    Params.Add('            <stROIRect>');
    Params.Add('               <x>' + stROIRect.Left.ToString + '</x>');
    Params.Add('               <y>' + stROIRect.Top.ToString + '</y>');
    Params.Add('               <width>' + stROIRect.Width.ToString +
      '</width>');
    Params.Add('               <height>' + stROIRect.Height.ToString +
      '</height>');
    Params.Add('            </stROIRect>');
  end;
  if vehiclesublogo <> '' then
    Params.Add('            <subVehicleLogo>' + vehiclesublogo +
      '</subVehicleLogo>');
  if vehicleHead <> '' then
    Params.Add('            <vehicleHead>' + vehicleHead + '</vehicleHead>');
  if vehiclelogo <> '' then
    Params.Add('            <vehicleLogo>' + vehiclelogo + '</vehicleLogo>');
  if vehiclemodel <> '' then
    Params.Add('            <vehicleModel>' + vehiclemodel + '</vehicleModel>');
  Params.Add('         </carFaceParam>');
  Params.Add('      </ws:submitCarFaceCompareJob>');
  Params.Add('   </soapenv:Body>');
  Params.Add('</soapenv:Envelope>');
  Result := Params;
end;

class function THik.submitCarFaceCompareJob(passTimeStart, passTimeEnd,
  crossingIdSet, picData: String; stDetectRect, stROIRect: TRect;
  modelCmpThreadhold, modelTopN, ROICmpThreadhold, ROITopN, vehiclelogo,
  vehiclesublogo, vehicleHead, vehiclemodel: String;
  modeInfo: TmodeInfo): String;
var
  Params: TStrings;
begin
  Params := GetCarFaceJobParam(passTimeStart, passTimeEnd, crossingIdSet,
    picData, stDetectRect, stROIRect, modelCmpThreadhold, modelTopN,
    ROICmpThreadhold, ROITopN, vehiclelogo, vehiclesublogo, vehicleHead,
    vehiclemodel, modeInfo);
  if not HttPPost(gConfig.HikConfig.CarFace, Params, Result, TEncoding.UTF8)
  then
    Result := '';
  Params.Free;
end;

class function THik.getJobFinalResultByTaskId(taskid: String): String;
var
  Url: String;
  Params: TStrings;
begin
  Result := '';
  Url := gConfig.HikConfig.CarFace;
  Params := TStringList.Create;
  Params.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/traffic/ws/">');
  Params.Add('   <soapenv:Header/>');
  Params.Add('   <soapenv:Body>');
  Params.Add('      <ws:getJobFinalResultByTaskId>');
  Params.Add('         <taskId>' + taskid + '</taskId>');
  Params.Add('      </ws:getJobFinalResultByTaskId>');
  Params.Add('   </soapenv:Body>');
  Params.Add('</soapenv:Envelope>');

  if not HttPPost(Url, Params, Result, TEncoding.UTF8) then
    Result := '';
  Params.Free;
end;

class function THik.getJobResultByTaskId(taskid: String): String;
var
  Url: String;
  Params: TStrings;
begin
  Result := '';
  Url := gConfig.HikConfig.CarFace;
  Params := TStringList.Create;
  Params := TStringList.Create;
  Params.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/traffic/ws/">');
  Params.Add('   <soapenv:Header/>');
  Params.Add('   <soapenv:Body>');
  Params.Add('      <ws:getJobResultByTaskId>');
  Params.Add('         <taskId>' + taskid + '</taskId>');
  Params.Add('      </ws:getJobResultByTaskId>');
  Params.Add('   </soapenv:Body>');
  Params.Add('</soapenv:Envelope>');

  if not HttPPost(Url, Params, Result, TEncoding.UTF8) then
    Result := '';
  Params.Free;
end;

end.
