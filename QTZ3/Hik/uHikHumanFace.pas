unit uHikHumanFace;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  DateUtils, ActiveX, uEntity, Windows, QJson;

type
  THuman = Record
    human_crednum: String; // 证件号
    face_picurl: String; // 人脸url
    human_name: String; // 姓名
    similarity: String; // 相似度
  End;

  THikHumanFace = class
  private
    class function GetHumanFaceResult(AUrl: String; var AMsg: String): String;
    class function GetBlackFaceResult(AUrl: String; var AMsg: String): String;
    class function getFaceModelFromUrl(AUrl: String; var AMsg: String): String;
    class function GetResult(ANode, AResult: String; var AMsg: String): String;
    class function DecodeResult(AResult: String): String;
  public
    class function GetHumanFaceCompareResult(AParams: TStrings;
      var AMsg: String): String;
  end;

implementation

{ THikHumanFace }

class function THikHumanFace.DecodeResult(AResult: String): String;
var
  humanList: TList<THuman>;
  human: THuman;
  s: String;
begin
  Result := '';
  humanList := TCommon.JsonToRecordList<THuman>(AResult);
  for human in humanList do
  begin
    s := '{"human_name":"' + human.human_name + '","human_crednum":"' +
      human.human_crednum + '","face_picurl":"' + human.face_picurl +
      '","similarity":"' + human.similarity + '"}';
    Result := Result + ',' + s;
  end;
  if Result <> '' then
    Result := '[' + Result.Substring(1) + ']'
  else
    Result := '[]';
end;

class function THikHumanFace.GetBlackFaceResult(AUrl: String;
  var AMsg: String): String;
var
  http: TIdHttp;
  s, url, modeldata, taskId, data: String;
  process: Real;
  params: TStrings;
  n: Integer;
begin
  modeldata := getFaceModelFromUrl(AUrl, AMsg);
  if modeldata = '' then
    exit;
  http := TIdHttp.Create(nil);
  http.HandleRedirects:= True;
  params := TStringList.Create;
  params.Add('modelData=' + modeldata);
  params.Add('blacklistIds=-1');
  url := gConfig.HikConfig.HumanFace +
    '/face-web/ws/rest/BlackListInfoApply/submitBlackFaceCompareJob';
  s := http.Post(url, params);

  taskId := GetResult('taskId', s, AMsg);
  if (taskId <> '') and (AMsg = '') then
  begin
    n := 0;
    while n < 30 do
    begin
      url := gConfig.HikConfig.HumanFace +
        '/face-web/ws/rest/BlackListInfoApply/getBlackCompareResultByPage?taskId='
        + taskId + '&pageNum=1&pageSize=5';
      s := http.Get(url);
      process := StrToFloatDef(GetResult('process', s, AMsg), -1);
      if process = 1 then
      begin
        AMsg := '';
        data := GetResult('data', s, AMsg);
        if (data <> '') and (AMsg = '') then
          Result := DecodeResult(data);
        break;
      end
      else
        Sleep(1000);
      inc(n);
    end;
  end;
  params.Free;
  http.Disconnect;
  http.Free;
end;

class function THikHumanFace.GetHumanFaceResult(AUrl: String;
  var AMsg: String): String;
var
  http: TIdHttp;
  s, url, modeldata, taskId, data: String;
  process: Real;
  params: TStrings;
  n: Integer;
  b: Boolean;
begin
  modeldata := getFaceModelFromUrl(AUrl, AMsg);
  if modeldata = '' then
    exit;
  http := TIdHttp.Create(nil);
  http.HandleRedirects:= True;
  params := TStringList.Create;
  params.Add('faceModel=' + modeldata);
  params.Add('facelibIds=-1');
  url := gConfig.HikConfig.HumanFace +
    '/face-web/ws/rest/FaceLibApply/submitHumanFaceCompareJob';
  s := http.Post(url, params);

  taskId := GetResult('taskId', s, AMsg);
  if (taskId <> '') and (AMsg = '') then
  begin
    n := 0;
    b := False;
    while n < 30 do
    begin
      url := gConfig.HikConfig.HumanFace +
        '/face-web/ws/rest/FaceLibApply/getJobCompareResultByPage?taskId=' +
        taskId + '&pageNum=1&pageSize=1';
      s := http.Get(url);
      process := StrToFloatDef(GetResult('process', s, AMsg), -1);
      if process = 1 then
      begin
        b := AMsg = '';
        break;
      end
      else
        Sleep(1000);
      inc(n);
    end;
  end;

  if b then
  begin
    url := gConfig.HikConfig.HumanFace +
      '/face-web/ws/rest/FaceLibApply/getJobCompareFinalResultByPage?taskId=' +
      taskId + '&pageNum=1&pageSize=5';
    s := http.Get(url);
    data := GetResult('data', s, AMsg);
    if (data <> '') and (AMsg = '') then
      Result := DecodeResult(data);
  end;
  params.Free;
  http.Disconnect;
  http.Free;
end;

class function THikHumanFace.GetResult(ANode, AResult: String;
  var AMsg: String): String;
var
  resultCode: String;
begin
  Result := '';
  resultCode := TCommon.GetJsonNode('resultCode', AResult);
  if resultCode = '' then
    AMsg := '云分析连接失败'
  else if resultCode = '0' then
    Result := TCommon.GetJsonNode(ANode, AResult)
  else
    AMsg := TCommon.GetJsonNode('msg', AResult);
end;

class function THikHumanFace.getFaceModelFromUrl(AUrl: String;
  var AMsg: String): String;
var
  http: TIdHttp;
  s, url: String;
begin
  url := gConfig.HikConfig.HumanFace +
    '/face-web/ws/rest/CommApply/getFaceModelFromUrl?faceUrl=' + AUrl;
  http := TIdHttp.Create(nil);
  http.HandleRedirects:= True;
  s := http.Get(url);
  Result := GetResult('modeldata', s, AMsg);
  http.Disconnect;
  http.Free;
end;

class function THikHumanFace.GetHumanFaceCompareResult(AParams: TStrings;
  var AMsg: String): String;
var
  url, lx: String;
begin
  url := AParams.Values['pic'];
  url := TCommon.FtpPic(url);
  if url = '' then
  begin
    AMsg := '不是有效的图片';
    exit;
  end;
  lx := AParams.Values['type'];
  if lx = '2' then
    Result := GetBlackFaceResult(url, AMsg)
  else
    Result := GetHumanFaceResult(url, AMsg);
end;

end.
