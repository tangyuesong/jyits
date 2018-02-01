unit uQTZHelper;

interface

uses
  SysUtils, DateUtils, System.Net.HttpClientComponent;

type
  TQTZHelper = class
  private
    class var Token: string;
    class var FHome: string;
    class function Get(const url: string): string; static;
    class procedure InitToken; static;
  public
    class function Request(const action, params: string): string; static;
    class property Home: string read FHome write FHome;
  end;

implementation
uses uLogger;
{ TQTZHelper }

class function TQTZHelper.Get(const url: string): string;
var
  http: TNetHTTPClient;
begin
  http := TNetHTTPClient.Create(nil);
  try
    result := http.Get(url).ContentAsString;
  except
    on e: exception do
    begin
      result := '';
      logger.Error(e.Message + ' ' + url);
    end;
  end;
  http.Free;
end;

class procedure TQTZHelper.InitToken;
var
  json: string;
begin
  json := Get(Home + '/login?user=sa&pwd=EB8E560662808ED4FAEA1C8AF016055947C4EF17CFD7AFC5390AA126AB25E2A2');
  if json <> '' then
  begin
    Token := json;
  end;
end;

class function TQTZHelper.Request(const action, params: string): string;
  function Rqst(const action, params: string): string;
  var
    url: string;
  begin
    if params <> '' then
      url := Home + '/' + action + '?' + params + '&token=' + Token
    else
      url := Home + '/' + action + '?token=' + Token;

    result := Get(url);
  end;
begin
  result := Rqst(action, params);
  if result.Contains('invalid token') then
  begin
    InitToken;
    result := Rqst(action, params);
  end;
end;

end.
