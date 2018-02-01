unit K08Utils;

interface

uses
  Generics.Collections, IdHTTP, Classes, SysUtils, uTypes, uLogger, uGlobal;

type

  TImageInfo = Record
    GCXH: String;
    KDBH: String;
    CDBH: String;
    Url: String;
    PassTime: String;
  End;

  TK08 = Class
  private
    class function HttPPost(AUrl: String; AParams: TStrings;
      var AResult: String): Boolean;
    class function Login(AUser, APwd: String; var AToken: String): Boolean;
    class procedure Logout(AToken: String);
    class function CreateImageJob(AImages: TList<TImageInfo>): Boolean;
  public
    class procedure SaveToK08(list: TList<TPass>);
  end;

implementation

{ TK08 }

class function TK08.CreateImageJob(AImages: TList<TImageInfo>): Boolean;
var
  Params: TStrings;
  token, s, imgStr: String;
  img: TImageInfo;
begin
  Result := False;
  if not Login(DFUser, DFPwd, s) then
    exit;
  if s = '' then
    exit;
  token := s;

  Params := TStringList.create;

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
  Params.Add('               <ivms:destinationUrl>' + K08Url +
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
      + '"targetAttrs":	"{\n\t\"crossing_id\":\t\"' + gDicDevice[img.KDBH].ID +
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
  Params.SaveToFile('c:\aa.txt');
  Result := HttPPost(DFUrl, Params, s);
  Logout(token);
  //logger.Debug(s);
  Params.Free;
end;

class function TK08.Login(AUser, APwd: String; var AToken: String): Boolean;
var
  Params: TStrings;
  token: String;
begin
  AToken := '';
  Result := False;
  Params := TStringList.create;
  Params.Add
    ('<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:wsdl="http://www.hikvision.com.cn/ver1/ivms/wsdl">');
  Params.Add('   <soap:Header/>');
  Params.Add('   <soap:Body>');
  Params.Add('      <wsdl:LoginReq>');
  Params.Add('         <wsdl:userName>' + DFUser + '</wsdl:userName>');
  Params.Add('         <wsdl:password>' + DFPwd + '</wsdl:password>');
  Params.Add('      </wsdl:LoginReq>');
  Params.Add('   </soap:Body>');
  Params.Add('</soap:Envelope>');
  if HttPPost(DFUrl, Params, token) then
  begin
    if pos('<token>', token) > 0 then
      token := copy(token, pos('<token>', token) + 7, Length(token));
    if pos('</token>', token) > 0 then
      AToken := copy(token, 1, pos('</token>', token) - 1);
    Result := True;
  end;
  Params.Free;;
end;

class procedure TK08.Logout(AToken: String);
var
  Params: TStrings;
  s: String;
begin
  Params := TStringList.create;
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
  HttPPost(DFUrl, Params, s);
  Params.Free;
end;

class procedure TK08.SaveToK08(list: TList<TPass>);
var
  pass: TPass;
  imgs: TList<TImageInfo>;
  img: TImageInfo;
begin
  imgs := TList<TImageInfo>.create;
  try
    for pass in list do
    begin
      if pass.cjjg.StartsWith('4451') then
      begin
        img.GCXH := pass.GCXH;
        img.KDBH := pass.KDBH;
        img.CDBH := pass.CDBH;
        img.Url := pass.fwqdz + pass.tp1;
        img.PassTime := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',
          StrToDateTimeDef(pass.gcsj, Now()));
        imgs.Add(img);
      end;
      if imgs.Count > 250 then
      begin
        if CreateImageJob(imgs) then
          logger.Info('Create K08 Job Succeed')
        else
          logger.Error('Create K08 Job Failed');
        imgs.Clear;
      end;
    end;
    if imgs.Count > 0 then
      if CreateImageJob(imgs) then
        logger.Info('Create K08 Job Succeed')
      else
        logger.Error('Create K08 Job Failed');
    logger.Info('SaveK08 OK');
  except
    on e: exception do
      logger.Error('SaveK08 Error ' + e.Message);
  end;
  imgs.Free;
end;

class function TK08.HttPPost(AUrl: String; AParams: TStrings;
  var AResult: String): Boolean;
var
  http: TIdHTTP;
  stream: TMemoryStream;
begin
  AResult := '';
  Result := False;
  http := TIdHTTP.create(nil);
  try
    stream := TMemoryStream.create;
    AParams.SaveToStream(stream);
    AResult := Utf8ToAnsi(http.Post(AUrl, stream));
    Result := True;
  except
    AResult := http.ResponseText;
  end;
  stream.Free;
  http.Disconnect;
  http.Free;
end;

end.
