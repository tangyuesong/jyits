unit uHumanFace;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  DateUtils, ActiveX, uEntity, Windows, QJson;

type

  THumanFace = class
  private
  public
    class function GetHumanFaceCompare(AParams: TStrings;
      var AMsg: String): String;
    class function GetAlgorithm(AParams: TStrings; var AMsg: String): String;
    class function GetRepositories(AParams: TStrings; var AMsg: String): String;
  end;

implementation

{ THikHumanFace }

class function THumanFace.GetHumanFaceCompare(AParams: TStrings;
  var AMsg: String): String;
var
  i: Integer;
  data: TStringStream;
  s, JSON, algorithmId, repositoryId: String;
  http: TIdHttp;
begin
  s := '';
  AMsg := '';
  http := TIdHttp.Create(nil);
  data := TStringStream.Create;
  for i := 0 to AParams.Count - 1 do
    s := s + '"' + AParams.Names[i] + '":"' + AParams.ValueFromIndex[i] + '",';
  if s <> '' then
    s := '{' + s.Substring(1) + '}';
  try
    data.WriteString(s);
    Result := http.Post(gConfig.HumanfaceUrl + '/GetHumanFaceCompare', data);
  except
    on e: exception do
      AMsg := e.Message;
  end;
  data.Free;
  http.Free;
end;

class function THumanFace.GetRepositories(AParams: TStrings;
  var AMsg: String): String;
var
  http: TIdHttp;
begin
  AMsg := '';
  http := TIdHttp.Create(nil);
  try
    Result := http.Get(gConfig.HumanfaceUrl + '/GetRepositories');
  except
    on e: exception do
      AMsg := 'Õ¯¬Áπ ’œ';
  end;
  http.Disconnect;
  http.Free;
end;

class function THumanFace.GetAlgorithm(AParams: TStrings;
  var AMsg: String): String;
var
  http: TIdHttp;
begin
  AMsg := '';
  http := TIdHttp.Create(nil);
  try
    Result := http.Get(gConfig.HumanfaceUrl + '/GetAlgorithm');
  except
    on e: exception do
      AMsg := 'Õ¯¬Áπ ’œ';
  end;
  http.Disconnect;
  http.Free;
end;

end.
