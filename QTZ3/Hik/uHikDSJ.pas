unit uHikDSJ;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  DateUtils, ActiveX, uEntity, Windows, QJson;

type

  TmodeInfo = Record
    modeRect: TRect;
    hashData: String;
  End;

  TstPreProcRet = Record
    nTagID: String;
    PlateNum: String;
    nColor: String;
    nType: String;
    nMainLogo: String;
    nSubLogo: String;
    nModel: String;
    nPilotSB: String;
    nCopilotSB: String;
    nPilotSV: String;
    nCopilotSV: String;
    nDangMark: String;
    nEnvProSign: String;
    nUPhone: String;
    nPendant: String;
    stTagRect: TRect;
    stTagModel: String;
  End;

  THikDSJ = class
  private
    class function HttPPost(AUrl: String; AParams: TStrings;
      var AResult: String; AEncoding: TEncoding = nil): Boolean;
    class function GetCarFaceJobParam(passTimeStart, passTimeEnd, crossingIdSet,
      picData: String; stDetectRect, stROIRect: TRect;
      modelCmpThreadhold, modelTopN, ROICmpThreadhold, ROITopN, vehiclelogo,
      vehiclesublogo, vehiclehead, vehiclemodel: String; modeInfo: TmodeInfo)
      : TStrings;
    class function DecodeDarkKnightResult(xml: String): String;
    class function DecodeTrackerAssociateResult(xml: String): String;
    class function DecodefootHoldsResult(xml: String): String;
    class function GetMoreLikeThisParam(param: TDictionary<string, String>;
      page, pageSize: string): TStrings; static;
    class function GetHPZL(HPLX, HPYS, HPHM, CLLX: string): string;
  public
    class function picAnalysis(picStr: WideString): String;
    class function submitCarFaceCompareJob(passTimeStart, passTimeEnd,
      crossingIdSet, picData: String; stDetectRect, stROIRect: TRect;
      modelCmpThreadhold, modelTopN, ROICmpThreadhold, ROITopN, vehiclelogo,
      vehiclesublogo, vehiclehead, vehiclemodel: String;
      modeInfo: TmodeInfo): String;
    class function getJobResultByTaskId(taskid: String): String;
    class function getJobFinalResultByTaskId(taskid: String): String;
    class function footHoldsByTrackAndTime(plateno, startTime, endTime,
      pageSize, pageNo: String): String;
    class function darkKnightAnalysis(startTime, endTime, crosses, pageSize,
      pageNo: String): String;
    class function trackerAssociateAnalysis(plateno, startTime, endTime,
      timeInterval, threshold, crosses, pageSize, pageNo: String): String;
    class function moreLikeThis(param: TDictionary<string, String>;
      page, pageSize: String): String; static;
  end;

implementation

uses
  uDecodeHikResult;

{ THikDSJ }

class function THikDSJ.GetHPZL(HPLX, HPYS, HPHM, CLLX: string): string;
begin
  if (HPHM = '车牌') or (HPHM = '未识别') or (HPHM = '未识别牌') or (HPHM = '未识别车牌') or
    (HPHM.Length <= 0) then
    exit('44');
  if (HPYS = '5') and ((CLLX = '1') or (CLLX = '2') or (CLLX = '10')) then
    exit('51');
  if HPYS = '5' then
    exit('52');
  if (HPHM.Length >= 2) and (HPHM.Substring(0, 1) = 'W') and
    (HPHM.Substring(1, 1) = 'J') then
    exit('31');
  if HPLX = '0' then
    exit('99')
  else if HPLX = '1' then
  begin
    if HPYS = '2' then
      exit('02')
    else if HPYS = '1' then
    begin
      if HPHM.Contains('学') then
        exit('16')
      else
        exit('01');
    end
    else if HPYS = '0' then
      exit('23');
  end
  else if HPLX = '2' then
    exit('23')
  else if HPLX = '3' then
    exit('32')
  else if HPLX = '4' then
    exit('31')
  else if HPLX = '5' then
    exit('32')
  else if HPLX = '7' then
  begin
    if HPYS = '1' then
      exit('01')
    else if HPYS = '0' then
      exit('02');
  end
  else if HPLX = '8' then
  begin
    if HPHM.Contains('挂') then
      exit('15')
    else
      exit('01');
  end
  else if HPLX = '9' then
    exit('32')
  else if HPLX = '10' then
    exit('03')
  else if HPLX = '11' then
    exit('99')
  else if HPLX = '12' then
    exit('99')
  else if HPLX = '13' then
    exit('13')
  else if HPLX = '14' then
    exit('14')
  else if HPLX = '15' then
    exit('15')
  else if HPLX = '16' then
  begin
    if HPYS = '1' then
      exit('07')
    else if HPYS = '2' then
      exit('08');
  end
  else if HPLX = '17' then
    exit('52')
  else if HPLX = '100' then
    exit('16')
  else if HPLX = '101' then
    exit('22')
  else if HPLX = '102' then
    exit('15')
  else if HPLX = '103' then
    exit('04')
  else if HPLX = '104' then
  begin
    if HPHM.Contains('港') then
      exit('26')
    else if HPHM.Contains('澳') then
      exit('27');
  end
  else if HPLX = '105' then
  begin
    exit('20');
  end;
  exit('99');
end;

class function THikDSJ.moreLikeThis(param: TDictionary<string, String>;
  page, pageSize: String): String;
var
  Params: TStrings;
  s, h, clpp, hpzl, kdbh, HPHM: String;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
  totalPage, currentPage: Integer;
begin
  Result := '';
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);

  Params := GetMoreLikeThisParam(param, page, pageSize);

  // gLogger.Info(Params.Text);
  // gLogger.Info(gConfig.HikConfig.moreLikeThisHBase);

  if HttPPost(gConfig.HikConfig.moreLikeThisHBase, Params, s, TEncoding.UTF8)
  then
  begin
    try
      gLogger.Info(s);
      vehList := TDecodeHikResult.DecodeMoreLikeThieResult(s, totalPage,
        currentPage);
    except
      gLogger.Error(s);
    end;
    if (vehList <> nil) and (vehList.Count > 0) then
    begin
      for veh in vehList do
      begin
        if veh.plateno <> '' then
          HPHM := veh.plateno
        else
          HPHM := veh.plateinfo;

        s := '"hphm":"' + HPHM + '",';

        {
          if gHpzl.ContainsKey(veh.vehicletype) then
          hpzl := gHpzl[veh.vehicletype]
          else
          hpzl := veh.vehicletype;
          s := s + '"hpzl":"' + hpzl + '",';
        }
        hpzl := GetHPZL(veh.platetype, veh.platecolor, HPHM, veh.vehicletype);
        s := s + '"hpzl":"' + hpzl + '",';

        if TCommon.DicHpzlMC.ContainsKey(hpzl) then
          s := s + '"hpzlmc":"' + TCommon.DicHpzlMC[hpzl] + '",'
        else
          s := s + '"hpzlmc":"",';

        s := s + '"gcsj":"' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
          DateUtils.IncMilliSecond(25569.3333333333,
          StrToInt64(veh.passtime))) + '",';

        kdbh := veh.crossingid;
        s := s + '"kdbh":"' + kdbh + '",';

        if gPassDevice.ContainsKey(kdbh) then
          s := s + '"sbddmc":"' + gPassDevice[kdbh] + '",'
        else
          s := s + '"sbddmc":"",';

        clpp := veh.vehiclelogo + '-' + veh.vehiclesublogo;
        if gK08Clpp.ContainsKey(clpp) then
          s := s + '"clpp":"' + gK08Clpp[clpp] + '",'
        else if gK08Clpp.ContainsKey(veh.vehiclelogo + '-0') then
          s := s + '"clpp":"' + gK08Clpp[veh.vehiclelogo + '-0'] + '",'
        else
          s := s + '"clpp":"' + clpp + '",';

        if gK08Csys.ContainsKey(veh.vehiclecolor) then
          s := s + '"csys":"' + gK08Csys[veh.vehiclecolor] + '",'
        else
          s := s + '"csys":"' + veh.vehiclecolor + '",';
        s := '{' + s + '"cdbh":"' + veh.laneno + '","clsd":"' + veh.vehiclespeed
          + '","fwqdz":"","tp1":"' + gConfig.PicUrl + veh.imagepath + '"}';

        Result := Result + ',' + s;
      end;
      Result := '[' + Result.Substring(1) + ']';
      vehList.Free;
    end
  end;
  Params.Free;
  ActiveX.CoUninitialize;
end;

class function THikDSJ.GetMoreLikeThisParam(param: TDictionary<string, String>;
  page, pageSize: string): TStrings;
var
  key: String;
begin
  Result := TStringList.Create;
  {
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
    Result.Add('           <cursorMark>*</cursorMark>');
    Result.Add('           <sortColumn>passtime</sortColumn>');
    Result.Add('           <sortMethod>desc</sortMethod>');
    Result.Add('         </arg0>');
    Result.Add('      </ws:moreLikeThis>');
    Result.Add('   </soapenv:Body>');
    Result.Add('</soapenv:Envelope>');
  }

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

class function THikDSJ.darkKnightAnalysis(startTime, endTime, crosses, pageSize,
  pageNo: String): String;
var
  Url: String;
  Params: TStrings;
begin
  Result := '';
  Url := gConfig.HikConfig.analysisExtra;
  if crosses = '' then
    crosses := 'ALL';

  Params := TStringList.Create;
  Params.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/traffic/ws/">');
  Params.Add('   <soapenv:Header/>');
  Params.Add('   <soapenv:Body>');
  Params.Add('      <ws:darkKnightAnalysis>');
  Params.Add('         <plateNo>ALL</plateNo>');
  Params.Add('         <exceptPlateNo>ALL</exceptPlateNo>');
  Params.Add('         <startTime>' + startTime + '</startTime>');
  Params.Add('         <endTime>' + endTime + '</endTime>');
  Params.Add('         <crosses>' + crosses + '</crosses>');
  Params.Add('         <year>ALL</year>');
  Params.Add('         <vehicleLogo>ALL</vehicleLogo>');
  Params.Add('         <vehicleSubLogo>ALL</vehicleSubLogo>');
  Params.Add('         <plateColor>ALL</plateColor>');
  Params.Add('         <vehicleType>ALL</vehicleType>');
  Params.Add('         <pageSize>' + pageSize + '</pageSize>');
  Params.Add('         <pageNo>' + pageNo + '</pageNo>');
  Params.Add('      </ws:darkKnightAnalysis>');
  Params.Add('   </soapenv:Body>');
  Params.Add('</soapenv:Envelope>');
  gLogger.Info(Params.Text);
  if not HttPPost(Url, Params, Result, TEncoding.UTF8) then
    Result := ''
  else
  begin
    gLogger.Info('[darkKnightAnalysis] Result: ' + Result);
    Result := DecodeDarkKnightResult(Result);
  end;
  Params.Free;
end;

class function THikDSJ.GetCarFaceJobParam(passTimeStart, passTimeEnd,
  crossingIdSet, picData: String; stDetectRect, stROIRect: TRect;
  modelCmpThreadhold, modelTopN, ROICmpThreadhold, ROITopN, vehiclelogo,
  vehiclesublogo, vehiclehead, vehiclemodel: String; modeInfo: TmodeInfo)
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
  if vehiclehead <> '' then
    Params.Add('            <vehicleHead>' + vehiclehead + '</vehicleHead>');
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

class function THikDSJ.getJobFinalResultByTaskId(taskid: String): String;
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
  gLogger.Info('[getJobFinalResultByTaskId] Result: ' + Result);
  Params.Free;
end;

class function THikDSJ.getJobResultByTaskId(taskid: String): String;
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
  Params.Add('      <ws:getJobResultByTaskId>');
  Params.Add('         <taskId>' + taskid + '</taskId>');
  Params.Add('      </ws:getJobResultByTaskId>');
  Params.Add('   </soapenv:Body>');
  Params.Add('</soapenv:Envelope>');

  if not HttPPost(Url, Params, Result, TEncoding.UTF8) then
    Result := '';
  gLogger.Info('[getJobResultByTaskId] Result: ' + Result);
  Params.Free;
end;

class function THikDSJ.HttPPost(AUrl: String; AParams: TStrings;
  var AResult: String; AEncoding: TEncoding): Boolean;
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
    on e: exception do
    begin
      gLogger.Error(e.Message);
      AResult := UTF8Decode(http.ResponseText);
    end;
  end;
  stream.Free;
  http.Disconnect;
  http.Free;
end;

class function THikDSJ.DecodeDarkKnightResult(xml: String): String;
var
  i, j: Integer;
  s, clpp, hpzl: String;
  Rows, json: TQJson;
begin
  Result := '';
  i := pos('<return', xml);
  if i <= 0 then
    exit;
  s := Trim(copy(xml, i + 7, Length(xml)));
  s := Trim(copy(s, pos('>', s) + 1, Length(s)));
  j := pos('</return>', s);
  if j <= 0 then
    exit;
  s := Trim(copy(s, 1, j - 1));
  if TCommon.GetJsonNode('msg', s) <> '查询成功' then
    exit;
  json := TQJson.Create;
  try
    json.Parse(s);
    Rows := TCommon.FindJson('rows', json);
    if Rows <> nil then
    begin
      for i := 0 to Rows.Count - 1 do
      begin
        s := '{"id":"' + TCommon.GetJsonNode('id', Rows.Items[i].value) + '",' +
          '"passtime":"' + TCommon.GetJsonNode('passtime', Rows.Items[i].value)
          + '","picurl":"' + gConfig.PicUrl + TCommon.GetJsonNode('picurl',
          Rows.Items[i].value) + '",' + '"hphm":"' +
          TCommon.GetJsonNode('plateno', Rows.Items[i].value) + '",' +
          '"total":"' + TCommon.GetJsonNode('total',
          Rows.Items[i].value) + '",';

        clpp := TCommon.GetJsonNode('vehiclelogo', Rows.Items[i].value);
        if gK08Clpp.ContainsKey(clpp) then
          clpp := gK08Clpp[clpp]
        else if gK08Clpp.ContainsKey(clpp + '-0') then
          clpp := gK08Clpp[clpp + '-0'];
        s := s + '"clpp":"' + clpp + '",';

        hpzl := TCommon.GetJsonNode('vehicletype', Rows.Items[i].value);
        if gHpzl.ContainsKey(hpzl) then
          hpzl := gHpzl[hpzl];
        s := s + '"hpzl":"' + hpzl + '",';

        if TCommon.DicHpzlMC.ContainsKey(hpzl) then
          s := s + '"hpzlmc":"' + TCommon.DicHpzlMC[hpzl] + '"}'
        else
          s := s + '"hpzlmc":""}';

        if Result <> '' then
          Result := Result + ',';
        Result := Result + s;
      end;
      Result := '[' + Result + ']';
    end;
  except
    on e: exception do
      gLogger.Error(e.Message);
  end;
  json.Free;
end;

class function THikDSJ.DecodefootHoldsResult(xml: String): String;
var
  i, j: Integer;
  s, clpp, hpzl, kdbh: String;
  Rows, json: TQJson;
begin
  Result := '';
  i := pos('<return', xml);
  if i <= 0 then
    exit;
  s := Trim(copy(xml, i + 7, Length(xml)));
  s := Trim(copy(s, pos('>', s) + 1, Length(s)));
  j := pos('</return>', s);
  if j <= 0 then
    exit;
  s := Trim(copy(s, 1, j - 1));
  if TCommon.GetJsonNode('msg', s) <> '查询成功' then
    exit;
  json := TQJson.Create;
  try
    json.Parse(s);
    Rows := TCommon.FindJson('rows', json);
    if Rows <> nil then
    begin
      for i := 0 to Rows.Count - 1 do
      begin
        s := '{"gcsj":"' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
          DateUtils.IncMilliSecond(25569.3333333333,
          StrToInt64(TCommon.GetJsonNode('passtime', Rows.Items[i].value)))) +
          '","picurl":"' + gConfig.PicUrl + TCommon.GetJsonNode('imagepath',
          Rows.Items[i].value) + '",' + '"hphm":"' +
          TCommon.GetJsonNode('plateno', Rows.Items[i].value) + '","latitude":"'
          + TCommon.GetJsonNode('latitude', Rows.Items[i].value) +
          '","longitude":"' + TCommon.GetJsonNode('longitude',
          Rows.Items[i].value) + '",';

        kdbh := TCommon.GetJsonNode('crossingid', Rows.Items[i].value);
        s := s + '"kdbh":"' + kdbh + '",';

        if gPassDevice.ContainsKey(kdbh) then
          s := s + '"sbddmc":"' + gPassDevice[kdbh] + '",'
        else
          s := s + '"sbddmc":"",';

        clpp := TCommon.GetJsonNode('vehiclelogo', Rows.Items[i].value);
        if gK08Clpp.ContainsKey(clpp) then
          clpp := gK08Clpp[clpp]
        else if gK08Clpp.ContainsKey(clpp + '-0') then
          clpp := gK08Clpp[clpp + '-0'];
        s := s + '"clpp":"' + clpp + '",';

        hpzl := TCommon.GetJsonNode('vehicletype', Rows.Items[i].value);
        if gHpzl.ContainsKey(hpzl) then
          hpzl := gHpzl[hpzl];
        s := s + '"hpzl":"' + hpzl + '",';

        if TCommon.DicHpzlMC.ContainsKey(hpzl) then
          s := s + '"hpzlmc":"' + TCommon.DicHpzlMC[hpzl] + '"}'
        else
          s := s + '"hpzlmc":""}';

        if Result <> '' then
          Result := Result + ',';
        Result := Result + s;
      end;
      Result := '[' + Result + ']';
    end;
  except
    on e: exception do
      gLogger.Error(e.Message);
  end;
  json.Free;
end;

class function THikDSJ.DecodeTrackerAssociateResult(xml: String): String;
var
  i, j: Integer;
  s, csys, clpp, hpzl, kdbh, Info, jsonString: String;
  Rows, json, Item: TQJson;
begin
  Result := '';
  i := pos('<return', xml);
  if i <= 0 then
    exit;
  s := Trim(copy(xml, i + 7, Length(xml)));
  s := Trim(copy(s, pos('>', s) + 1, Length(s)));
  j := pos('</return>', s);
  if j <= 0 then
    exit;
  s := Trim(copy(s, 1, j - 1));
  if TCommon.GetJsonNode('msg', s) <> '查询成功' then
    exit;
  json := TQJson.Create;
  try
    json.Parse(s);
    Rows := TCommon.FindJson('rows', json);
    if Rows <> nil then
    begin
      for i := 0 to Rows.Count - 1 do
      begin
        s := '{"count":"' + TCommon.GetJsonNode('count', Rows.Items[i].value) +
          '","id":"' + TCommon.GetJsonNode('id', Rows.Items[i].value) +
          '","info":[';
        Item := TQJson.Create;
        Item.Parse(TCommon.GetJsonNode('info', Rows.Items[i].value));
        for j := 0 to Item.Count - 1 do
        begin
          jsonString := Item.Items[j].value;
          Info := '{"gcsj":"' + FormatDateTime('yyyy/mm/dd hh:nn:ss',
            DateUtils.IncMilliSecond(25569.3333333333,
            StrToInt64(TCommon.GetJsonNode('passtime', jsonString)))) + '",' +
            '"hphm":"' + TCommon.GetJsonNode('plateno', jsonString) + '",';

          hpzl := TCommon.GetJsonNode('vehicletype', jsonString);
          if gHpzl.ContainsKey(hpzl) then
            hpzl := gHpzl[hpzl];
          Info := Info + '"hpzl":"' + hpzl + '",';

          if TCommon.DicHpzlMC.ContainsKey(hpzl) then
            Info := Info + '"hpzlmc":"' + TCommon.DicHpzlMC[hpzl] + '",'
          else
            Info := Info + '"hpzlmc":"",';

          kdbh := TCommon.GetJsonNode('crossingid', jsonString);
          Info := Info + '"kdbh":"' + kdbh + '",';

          if gPassDevice.ContainsKey(kdbh) then
            Info := Info + '"sbddmc":"' + gPassDevice[kdbh] + '",'
          else
            Info := Info + '"sbddmc":"",';

          clpp := TCommon.GetJsonNode('vehiclelogo', jsonString) + '-' +
            TCommon.GetJsonNode('vehiclesublogo', jsonString);
          if gK08Clpp.ContainsKey(clpp) then
            Info := Info + '"clpp":"' + gK08Clpp[clpp] + '",'
          else if gK08Clpp.ContainsKey(TCommon.GetJsonNode('vehiclelogo',
            jsonString) + '-0') then
            Info := Info + '"clpp":"' + gK08Clpp
              [TCommon.GetJsonNode('vehiclelogo', jsonString) + '-0'] + '",'
          else
            Info := Info + '"clpp":"' + clpp + '",';

          csys := TCommon.GetJsonNode('vehiclecolor', jsonString);
          if gK08Csys.ContainsKey(csys) then
            Info := Info + '"csys":"' + gK08Csys[csys] + '",'
          else
            Info := Info + '"csys":"' + csys + '",';
          Info := Info + '"picurl":"' + gConfig.PicUrl +
            TCommon.GetJsonNode('imagepath', jsonString) + '"}';
          if j > 0 then
            s := s + ',';
          s := s + Info;
        end;
        Item.Free;
        s := s + ']}';
        if Result <> '' then
          Result := Result + ',';
        Result := Result + s;
      end;
    end;
    Result := '[' + Result + ']';
  except
    on e: exception do
      gLogger.Error(e.Message);
  end;
  json.Free;
end;

class function THikDSJ.footHoldsByTrackAndTime(plateno, startTime, endTime,
  pageSize, pageNo: String): String;
var
  Url: String;
  Params: TStrings;
begin
  Result := '';
  Url := gConfig.HikConfig.analysisExtra;

  Params := TStringList.Create;
  Params.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/traffic/ws/">');
  Params.Add('   <soapenv:Header/>');
  Params.Add('   <soapenv:Body>');
  Params.Add('      <ws:footHoldsByTrackAndTime>');
  Params.Add('         <plateNo>' + plateno + '</plateNo>');
  Params.Add('         <plateColor>ALL</plateColor>');
  Params.Add('         <plateType>ALL</plateType>');
  Params.Add('         <startTime>' + startTime + '</startTime>');
  Params.Add('         <endTime>' + endTime + '</endTime>');
  Params.Add('         <timeTrack>2</timeTrack>');
  Params.Add('         <taskId/>');
  Params.Add('         <pageSize>' + pageSize + '</pageSize>');
  Params.Add('         <pageNo>' + pageNo + '</pageNo>');
  Params.Add('      </ws:footHoldsByTrackAndTime>');
  Params.Add('   </soapenv:Body>');
  Params.Add('</soapenv:Envelope>');
  gLogger.Info(Params.Text);
  if not HttPPost(Url, Params, Result, TEncoding.UTF8) then
    Result := ''
  else
  begin
    gLogger.Info('[footHoldsByTrackAndTime] Result: ' + Result);
    Result := DecodefootHoldsResult(Result);
  end;
  Params.Free;
end;

class function THikDSJ.picAnalysis(picStr: WideString): String;
var
  Url: String;
  Params: TStrings;
  b: Boolean;
begin
  Result := '';
  Url := gConfig.HikConfig.picAnalysis;
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
  b := HttPPost(Url, Params, Result, TEncoding.UTF8);
  gLogger.Info('[picAnalysis] Result: ' + Result);
  if not b then
    Result := '';
  Params.Free;
end;

class function THikDSJ.submitCarFaceCompareJob(passTimeStart, passTimeEnd,
  crossingIdSet, picData: String; stDetectRect, stROIRect: TRect;
  modelCmpThreadhold, modelTopN, ROICmpThreadhold, ROITopN, vehiclelogo,
  vehiclesublogo, vehiclehead, vehiclemodel: String;
  modeInfo: TmodeInfo): String;
var
  Params: TStrings;
begin
  Params := GetCarFaceJobParam(passTimeStart, passTimeEnd, crossingIdSet,
    picData, stDetectRect, stROIRect, modelCmpThreadhold, modelTopN,
    ROICmpThreadhold, ROITopN, vehiclelogo, vehiclesublogo, vehiclehead,
    vehiclemodel, modeInfo);
  if not HttPPost(gConfig.HikConfig.CarFace, Params, Result, TEncoding.UTF8)
  then
    Result := '';
  gLogger.Info('[submitCarFaceCompareJob] Result: ' + Result);
  Params.Free;

end;

class function THikDSJ.trackerAssociateAnalysis(plateno, startTime, endTime,
  timeInterval, threshold, crosses, pageSize, pageNo: String): String;
var
  Url: String;
  Params: TStrings;
begin
  Result := '';
  if crosses = '' then
    crosses := 'ALL';

  Url := gConfig.HikConfig.dataAnalysis;
  Params := TStringList.Create;
  Params.Add
    ('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ws="http://www.hikvision.com/traffic/ws/">');
  Params.Add('   <soapenv:Header/>');
  Params.Add('   <soapenv:Body>');
  Params.Add('      <ws:trackerAssociateAnalysis>');
  Params.Add('         <taskId/>');
  Params.Add('         <plateNo>' + plateno + '</plateNo>');
  Params.Add('         <crosses>' + crosses + '</crosses>');
  Params.Add('         <startTime>' + startTime + '</startTime>');
  Params.Add('         <endTime>' + endTime + '</endTime>');
  Params.Add('         <timeInterval>' + timeInterval + '</timeInterval>');
  Params.Add('         <threshold>' + threshold + '</threshold>');
  Params.Add('         <pageSize>' + pageSize + '</pageSize>');
  Params.Add('         <pageNo>' + pageNo + '</pageNo>');
  Params.Add('      </ws:trackerAssociateAnalysis>');
  Params.Add('   </soapenv:Body>');
  Params.Add('</soapenv:Envelope>');
  gLogger.Info(Params.Text);
  if not HttPPost(Url, Params, Result, TEncoding.UTF8) then
    Result := ''
  else
  begin
    gLogger.Info('[trackerAssociateAnalysis] Result: ' + Result);
    Result := DecodeTrackerAssociateResult(Result);
  end;
  Params.Free;
end;

end.
