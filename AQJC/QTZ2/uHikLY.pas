unit uHikLY;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, uEntity, Soap.EncdDecd;

type

  THikLY = class
  private
    class function GetIntelligentSearchParam(AParams: TStrings): TStrings;
    class function HttPPost(AUrl: String; AStream: TStream;
      var AResult: String): Boolean;
  public
    class function IntelligentSearch(postStream: TStream): String;
  end;

implementation

{ THikLY }

class function THikLY.IntelligentSearch(postStream: TStream): String;
var
  // Params: TStrings;
  s, url: String;
begin
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  Result := '';
  if (gConfig.HikConfig.LYUrl = '') or (gConfig.HikConfig.LYHttpConverter = '')
    or (gConfig.HikConfig.LYUser = '') or (gConfig.HikConfig.LYPwd = '') then
    exit;

  // Params := GetIntelligentSearchParam(AParams);
  // Params := TStringList.Create;
  // Params.Add(UTF8Encode(paramStr.Replace(#13#10, '')));

  url := EncodeString(gConfig.HikConfig.LYUrl +
    '/ISAPI/SDT/Management/IntelligentSearch?format=json').Replace(#13#10, '');

  url := gConfig.HikConfig.LYHttpConverter + '/request?url=' + url +
    '&username=' + gConfig.HikConfig.LYUser + '&password=' +
    gConfig.HikConfig.LYPwd;

  if HttPPost(url, postStream, s) then
    Result := s;
  // Params.Free;
  ActiveX.CoUninitialize;
end;

class function THikLY.GetIntelligentSearchParam(AParams: TStrings): TStrings;
var
  ResultPosition, MaxResults, startTime, endTime, targetType: String;
  ts: TStrings;
  haveParam: Boolean;
begin
  Result := TStringList.Create;
  if AParams.IndexOfName('searchResultPosition') >= 0 then
    ResultPosition := AParams.Values['searchResultPosition']
  else
    exit;
  if AParams.IndexOfName('MaxResults') >= 0 then
    MaxResults := AParams.Values['MaxResults']
  else
    exit;
  if AParams.IndexOfName('startTime') >= 0 then
    startTime := AParams.Values['startTime']
  else
    exit;
  if AParams.IndexOfName('endTime') >= 0 then
    endTime := AParams.Values['endTime']
  else
    exit;

  ResultPosition := IntToStr(StrToIntDef(ResultPosition, 0) *
    StrToIntDef(MaxResults, 30));
  MaxResults := IntToStr(StrToIntDef(MaxResults, 30));
  targetType := '';
  ts := TStringList.Create;
  Result.Add('{');
  Result.Add('	"searchResultPosition": ' + ResultPosition + ',');
  // ��ʼλ��
  Result.Add('	"maxResults": ' + MaxResults + ','); // ÿҳ��С
  Result.Add('	"startTime":"' + startTime + '",');
  Result.Add('	"endTime":"' + endTime + '",');
  // if AParams.IndexOfName('choiceChannel') >= 0 then
  // Result.Add
  // ('	"choiceChannel":[{"channelID":"26c92893d2a94bc1840451b78444e0f9"}],');  //��ص���
  if AParams.IndexOfName('targetType') >= 0 then
  begin
    targetType := AParams.Values['targetType'];
    Result.Add('	"targetType ":"' + targetType + '",');
  end;
  // ������������: human-����, vehicle-������, twoWheelVehicle-���ֳ�, threeWheelVehicle-���ֳ�,
  if AParams.IndexOfName('targetSize') >= 0 then
    Result.Add('	"targetSize":"' + AParams.Values['targetSize'] + '",');
  // Ŀ��ߴ��Сunknown δ֪big ��medium ��small С
  if AParams.IndexOfName('direction') >= 0 then
    Result.Add('	"direction":"' + AParams.Values['direction'] + '",');
  // Ŀ�귽��unknown δ֪up ��down ��left ��right ��
  if AParams.IndexOfName('speed') >= 0 then
    Result.Add('	"speed":"' + AParams.Values['speed'] + '"');
  // Ŀ���ٶ�unknown δ֪fast ��medium ��slow ��
  if (targetType = '') or (targetType = 'human') then
  begin
    ts.Clear;
    haveParam := False;
    ts.Add('	,"humanInfo":{'); // ���������Ϣ, targetType Ϊhuman ʱ��Ч*/
    if AParams.IndexOfName('ageGroup') >= 0 then
    begin
      ts.Add('		"ageGroup": "' + AParams.Values['ageGroup'] + '",');
      // ����� unknown δ֪child ����young ����middle ����old ����
      haveParam := True;
    end;
    if AParams.IndexOfName('gender') >= 0 then
    begin
      ts.Add('		"gender": "' + AParams.Values['gender'] + '",');
      // �Ա� unknown δ֪male ��female Ů
      haveParam := True;
    end;
    if AParams.IndexOfName('glass') >= 0 then
    begin
      ts.Add('		"glass": "' + AParams.Values['glass'] + '",'); // �Ƿ���۾�
      haveParam := True;
    end;
    if AParams.IndexOfName('bag') >= 0 then
    begin
      ts.Add('		"bag":"' + AParams.Values['bag'] + '",'); // �Ƿ񱳰�
      haveParam := True;
    end;
    if AParams.IndexOfName('hat') >= 0 then
    begin
      ts.Add('		"hat":"' + AParams.Values['hat'] + '",'); // �Ƿ��ñ��
      haveParam := True;
    end;
    if AParams.IndexOfName('mask') >= 0 then
    begin
      ts.Add('		"mask":"' + AParams.Values['mask'] + '",'); // �Ƿ������
      haveParam := True;
    end;
    if AParams.IndexOfName('jacketType') >= 0 then
    begin
      ts.Add('		"jacketType":"' + AParams.Values['jacketType'] + '",');
      haveParam := True;
    end;
    // �������� unknown δ֪shortSleeve ����longSleeve ����
    if AParams.IndexOfName('trousersType') >= 0 then
    begin
      ts.Add('		"trousersType":"' + AParams.Values['trousersType'] + '",');
      haveParam := True;
    end;
    // unknown δ֪shortTrousers �̿�longTrousers ����skirt ȹ��
    if AParams.IndexOfName('hairStyle') >= 0 then
    begin
      ts.Add('		"hairStyle":"' + AParams.Values['hairStyle'] + '",');
      haveParam := True;
    end;
    // unknown δ֪ shortHair �̷�longHair ����
    if AParams.IndexOfName('jacketColor') >= 0 then
    begin
      ts.Add('		"jacketColor":"' + AParams.Values['jacketColor'] + '",');
      haveParam := True;
    end;
    // ������ɫ
    if AParams.IndexOfName('trousersColor') >= 0 then
    begin
      ts.Add('		"trousersColor":"' + AParams.Values['jacketColor'] + '",');
      haveParam := True;
    end;
    // ������ɫ
    if AParams.IndexOfName('ride') >= 0 then
    begin
      ts.Add('		"ride":"' + AParams.Values['ride'] + '",'); // �Ƿ��ﳵ
      haveParam := True;
    end;
    if AParams.IndexOfName('things') >= 0 then
    begin
      ts.Add('		"things":"' + AParams.Values['things'] + '",'); // �Ƿ��ණ��
      haveParam := True;
    end;
    if AParams.IndexOfName('cyclingType') >= 0 then
    begin
      ts.Add('		"cyclingType":"' + AParams.Values['cyclingType'] + '",');
      haveParam := True;
    end;
    // �ﳵ����unknown δ֪bicycle ���г�motorcycle Ħ�г����綯����threeWheelVehicle ���ֳ�
    if AParams.IndexOfName('cyclingPersonNumber') >= 0 then
    begin
      ts.Add('		"cyclingPersonNumber":' + AParams.Values
        ['cyclingPersonNumber'] + ',');
      // �ﳵ����unknown δ֪ onePerson ����multiplePersons ����
      haveParam := True;
    end;
    if haveParam then
    begin
      ts[ts.Count - 1] := copy(ts[ts.Count - 1], 1,
        Length(ts[ts.Count - 1]) - 1);
      ts.Add('	}');
      Result.AddStrings(ts);
    end;
  end;
  if (targetType = '') or (targetType = 'vehicle') then
  begin
    haveParam := False;
    ts.Clear;
    ts.Add('	,"vehicleInfo":{');
    if AParams.IndexOfName('license') >= 0 then
    begin
      ts.Add('		"license": "' + AParams.Values['license'] + '",'); // ���ƺ�
      haveParam := True;
    end;
    if AParams.IndexOfName('plateType') >= 0 then
    begin
      ts.Add('		"plateType":"' + AParams.Values['plateType'] + '",'); // ��������
      haveParam := True;
    end;
    if AParams.IndexOfName('vehicleColor') >= 0 then
    begin
      ts.Add('		"vehicleColor": "' + AParams.Values['vehicleColor'] + '",');
      // ������ɫ
      haveParam := True;
    end;
    if AParams.IndexOfName('plateColor') >= 0 then
    begin
      ts.Add('		"plateColor": "' + AParams.Values['plateColor'] + '",');
      // ������ɫ
      haveParam := True;
    end;
    if AParams.IndexOfName('vehicleType') >= 0 then
    begin
      ts.Add('		"vehicleType":"' + AParams.Values['vehicleType'] + '",');
      // ��������
      haveParam := True;
    end;
    if AParams.IndexOfName('vehicleLogo') >= 0 then
    begin
      ts.Add('		"vehicleLogo":' + AParams.Values['vehicleLogo']);
      haveParam := True;
    end;
    if AParams.IndexOfName('vehicleSubLogo') >= 0 then
    begin
      ts.Add('		"vehicleSubLogo":' + AParams.Values['vehicleSubLogo']);
      haveParam := True;
    end;
    if AParams.IndexOfName('pilotSafebelt') >= 0 then
    begin
      ts.Add('		"pilotSafebelt": "' + AParams.Values['pilotSafebelt'] + '",');
      // ��ʻԱ��ȫ��
      haveParam := True;
    end;
    if AParams.IndexOfName('pilotSunvisor') >= 0 then
    begin
      ts.Add('		"pilotSunvisor": "' + AParams.Values['pilotSunvisor'] + '",');
      // ����ʻ������
      haveParam := True;
    end;
    if AParams.IndexOfName('uphone') >= 0 then
    begin
      ts.Add('		"uphone": "' + AParams.Values['uphone'] + '",'); // ��绰
      haveParam := True;
    end;
    if AParams.IndexOfName('dangmark') >= 0 then
    begin
      ts.Add('		"dangmark": "' + AParams.Values['dangmark'] + '",'); // Σ��Ʒ��
      haveParam := True;
    end;
    if AParams.IndexOfName('envprosign') >= 0 then
    begin
      ts.Add('		"envprosign": "' + AParams.Values['envprosign'] + '",');
      // �Ʊ공 unknown δ֪ green �̱�yellow �Ʊ�
      haveParam := True;
    end;
    if haveParam then
    begin
      ts[ts.Count - 1] := copy(ts[ts.Count - 1], 1,
        Length(ts[ts.Count - 1]) - 1);
      ts.Add('	}');
      Result.AddStrings(ts);
    end;
  end;
  if (targetType = '') or (targetType = 'twoWheelVehicle') then
  begin
    haveParam := False;
    ts.Clear;
    ts.Add('	,"twoWheelVehicle":{');
    if AParams.IndexOfName('ageGroup') >= 0 then
    begin
      ts.Add('		"ageGroup": "' + AParams.Values['ageGroup'] + '", ');
      haveParam := True;
    end;
    if AParams.IndexOfName('gender') >= 0 then
    begin
      ts.Add('		"gender": "' + AParams.Values['gender'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('glass') >= 0 then
    begin
      ts.Add('		"glass": "' + AParams.Values['glass'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('bag') >= 0 then
    begin
      ts.Add('		"bag":"' + AParams.Values['bag'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('hat') >= 0 then
    begin
      ts.Add('		"hat":"' + AParams.Values['hat'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('mask') >= 0 then
    begin
      ts.Add('		"mask":"' + AParams.Values['mask'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('jacketType') >= 0 then
    begin
      ts.Add('		"jacketType":"' + AParams.Values['jacketType'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('hair') >= 0 then
    begin
      ts.Add('		"hair":"' + AParams.Values['hair'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('jacketColor') >= 0 then
    begin
      ts.Add('		"jacketColor":"' + AParams.Values['jacketColor'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('cyclingType') >= 0 then
    begin
      ts.Add('		"cyclingType":"' + AParams.Values['cyclingType'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('cyclingPersonNumber') >= 0 then
    begin
      ts.Add('		"cyclingPersonNumber":' + AParams.Values
        ['cyclingPersonNumber'] + ',');
      haveParam := True;
    end;
    if haveParam then
    begin
      ts[ts.Count - 1] := copy(ts[ts.Count - 1], 1,
        Length(ts[ts.Count - 1]) - 1);
      ts.Add('	}');
      Result.AddStrings(ts);
    end;
  end;
  if (targetType = '') or (targetType = 'threeWheelVehicle') then
  begin
    haveParam := False;
    ts.Clear;
    ts.Add('	,"threeWheelVehicle":{');
    if AParams.IndexOfName('ageGroup') >= 0 then
    begin
      ts.Add('		"ageGroup": "' + AParams.Values['ageGroup'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('gender') >= 0 then
    begin
      ts.Add('		"gender": "' + AParams.Values['gender'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('glass') >= 0 then
    begin
      ts.Add('		"glass": "' + AParams.Values['glass'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('bag') >= 0 then
    begin
      ts.Add('		"bag":"' + AParams.Values['bag'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('hat') >= 0 then
    begin
      ts.Add('		"hat":"' + AParams.Values['hat'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('mask') >= 0 then
    begin
      ts.Add('		"mask":"' + AParams.Values['mask'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('jacketType') >= 0 then
    begin
      ts.Add('		"jacketType":"' + AParams.Values['jacketType'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('hair') >= 0 then
    begin
      ts.Add('		"hair":"' + AParams.Values['hair'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('jacketColor') >= 0 then
    begin
      ts.Add('		"jacketColor":"' + AParams.Values['jacketColor'] + '",');
      haveParam := True;
    end;
    if AParams.IndexOfName('cyclingPersonNumber') >= 0 then
    begin
      ts.Add('		"cyclingPersonNumber":' + AParams.Values
        ['cyclingPersonNumber'] + ',');
      haveParam := True;
    end;
    if haveParam then
    begin
      ts[ts.Count - 1] := copy(ts[ts.Count - 1], 1,
        Length(ts[ts.Count - 1]) - 1);
      ts.Add('	}');
      Result.AddStrings(ts);
    end;
  end;
  Result.Add('}');
  ts.Free;
end;

class function THikLY.HttPPost(AUrl: String; AStream: TStream;
  var AResult: String): Boolean;
var
  http: TIdHTTP;
  response: TStringStream;
begin
  AResult := '';
  Result := False;
  http := TIdHTTP.Create(nil);
  try
    response := TStringStream.Create();
    http.Post(AUrl, AStream, response);
    AResult := UTF8Decode(response.DataString);
    Result := True;
  except
    AResult := UTF8Decode(http.ResponseText);
  end;
  http.Disconnect;
  http.Free;
end;

end.
