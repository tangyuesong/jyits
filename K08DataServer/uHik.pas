unit uHik;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, uEntity;

type
  THik = class
  private
    FToken: String;
    function DFLogin: String;
    procedure DFLogout;
    function HttPPost(AUrl: String; AParams: TStrings; var AResult: String;
      AEncoding: TEncoding = nil): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function DFCreateImageJob(AImages: TList<TImageInfo>): String;
    function GetJobProcess(jobid: String): Integer;
    property Token: String read DFLogin;
  end;

implementation

constructor THik.Create;
begin
  FToken := '';
end;

destructor THik.Destroy;
begin
  DFLogout;
  inherited;
end;

function THik.DFCreateImageJob(AImages: TList<TImageInfo>): String;
var
  Params: TStrings;
  s, imgStr: String;
  img: TImageInfo;
begin
  Result := '';
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  if Token = '' then
    exit;

  Params := TStringList.Create;

  Params.Add
    ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl" xmlns:ivms="http://www.hikvision.com.cn/ver1/schema/ivms/">');
  Params.Add('   <soap:Header>');
  Params.Add('      <wsdl:HeaderReq>');
  Params.Add('         <wsdl:token>' + Token + '</wsdl:token>');
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
  Params.Add('               <ivms:destinationType>11</ivms:destinationType>');
  // Params.Add('               <ivms:destinationType>17</ivms:destinationType>');

  Params.Add('            </ivms:destinationInfos>');
  Params.Add('            <ivms:streamInfo>');
  Params.Add('               <ivms:streamType>2</ivms:streamType>');
  imgStr := '               <ivms:streamUrl>images://{"imageInfos":	[';
  for img in AImages do
  begin
    imgStr := imgStr + '{"data":"' + img.Url + '",' +
      '"dataType":1,"id":"dddddddddddddd","LaneNO":1,"plate":"' + img.HPHM +
      '","vehicleDir":0,' + '"targetAttrs":"{\n\t\"crossing_id\":\t\"' +
      gDicDevice[img.KDBH].ID + '\",\n\t\"pass_id\":\t\"' + img.GCXH +
      '\",\n\t\"lane_no\":\t\"' + img.CDBH + '\",\n\t\"pass_time\":\t\"' +
      img.PassTime + '\"\n}"},'
  end;
  imgStr := copy(imgStr, 1, Length(imgStr) - 1) +
    '],"operate":524287,"targetNum":1,"plateRegMode":	0}</ivms:streamUrl>';
  Params.Add(imgStr);
  Params.Add('               <ivms:smart>false</ivms:smart>');
  Params.Add('               <ivms:maxSplitCount>0</ivms:maxSplitCount>');
  Params.Add('               <ivms:splitTime>0</ivms:splitTime>');
  Params.Add('            </ivms:streamInfo>');
  Params.Add('         </wsdl:jobInfo>');
  Params.Add('      </wsdl:SubmitJobReq>');
  Params.Add('   </soap:Body>');
  Params.Add('</soap:Envelope>');
  if HttPPost(gHikConfig.DFUrl, Params, s) then
  begin
    gLogger.Debug(s);
    Result := TDecodeHikResult.DecodeDFSubJobResult(s);
  end;
  Params.Free;
  ActiveX.CoUninitialize;
end;

function THik.DFLogin: String;
var
  Params: TStrings;
  s: String;
begin
  if FToken = '' then
  begin
    Params := TStringList.Create;
    Params.Add
      ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl">');
    Params.Add('   <soap:Header/>');
    Params.Add('   <soap:Body>');
    Params.Add('      <wsdl:LoginReq>');
    Params.Add('         <wsdl:userName>' + gHikConfig.DFUser +
      '</wsdl:userName>');
    Params.Add('         <wsdl:password>' + gHikConfig.DFPwd +
      '</wsdl:password>');
    Params.Add('      </wsdl:LoginReq>');
    Params.Add('   </soap:Body>');
    Params.Add('</soap:Envelope>');
    if HttPPost(gHikConfig.DFUrl, Params, s) then
    begin
      if pos('<token>', s) > 0 then
        FToken := copy(s, pos('<token>', s) + 7, Length(s));
      if (FToken <> '') and (pos('</token>', FToken) > 0) then
        FToken := copy(FToken, 1, pos('</token>', FToken) - 1)
      else
        FToken := '';
    end;
    Params.Free;
  end;
  Result := FToken;
  if FToken = '' then
    gLogger.Error('Get token error');
end;

procedure THik.DFLogout;
var
  Params: TStrings;
  s: String;
begin
  if FToken <> '' then
  begin
    Params := TStringList.Create;
    Params.Add
      ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl">');
    Params.Add('   <soap:Header>');
    Params.Add('      <wsdl:HeaderReq>');
    Params.Add('         <wsdl:token>' + FToken + '</wsdl:token>');
    Params.Add('         <wsdl:version>1.2</wsdl:version>');
    Params.Add('      </wsdl:HeaderReq>');
    Params.Add('   </soap:Header>');
    Params.Add('   <soap:Body>');
    Params.Add('      <wsdl:LogoutReq>');
    Params.Add('         <wsdl:token>' + FToken + '</wsdl:token>');
    Params.Add('      </wsdl:LogoutReq>');
    Params.Add('   </soap:Body>');
    Params.Add('</soap:Envelope>');
    HttPPost(gHikConfig.DFUrl, Params, s);
    Params.Free;
  end;
end;

function THik.GetJobProcess(jobid: String): Integer;
var
  Params: TStrings;
  s: String;
begin
  Result := 0;
  Params := TStringList.Create;
  Params.Add
    ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl">');
  Params.Add('   <soap:Header>');
  Params.Add('      <wsdl:HeaderReq>');
  Params.Add('         <wsdl:token>' + Token + '</wsdl:token>');
  Params.Add('         <wsdl:version>1.2</wsdl:version>');
  Params.Add('      </wsdl:HeaderReq>');
  Params.Add('   </soap:Header>');
  Params.Add('   <soap:Body>');
  Params.Add('      <wsdl:JobStatusReq>');
  Params.Add('         <wsdl:jobIds>' + jobid + '</wsdl:jobIds>');
  Params.Add('      </wsdl:JobStatusReq>');
  Params.Add('   </soap:Body>');
  Params.Add('</soap:Envelope>');
  if HttPPost(gHikConfig.DFUrl, Params, s) then
  begin
    if pos('<ns2:errorCode>113</ns2:errorCode>', s) > 0 then // 作业id不存在
      Result := 100
    else if pos('<ns2:process>100.0</ns2:process>', s) > 0 then
      Result := 100
    else if pos('<ns2:errorCode>106</ns2:errorCode>', s) > 0 then // token过期
      FToken := '';
  end;
  Params.Free;
end;

function THik.HttPPost(AUrl: String; AParams: TStrings; var AResult: String;
  AEncoding: TEncoding = nil): Boolean;
var
  http: TIdHTTP;
  stream: TMemoryStream;
  i: Integer;
begin
  AResult := '';
  Result := false;
  i := 0;
  while (i < 2) and not Result do
  begin
    http := TIdHTTP.Create(nil);
    try
      stream := TMemoryStream.Create;
      if AEncoding = nil then
        AParams.SaveToStream(stream)
      else
        AParams.SaveToStream(stream, AEncoding);
      AResult := Utf8ToAnsi(http.Post(AUrl, stream));
      Result := True;
    except
      on e: exception do
      begin
        gLogger.Error('[HttpPost]' + e.Message);
        AResult := http.ResponseText;
        inc(i);
      end;
    end;
    stream.Free;
    http.Disconnect;
    http.Free;
  end;
end;

end.
