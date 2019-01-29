unit uRequestItf;

interface

uses
  IdHttp, SysUtils, HttpApp, Soap.EncdDecd, IdURI,
  Classes, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent;

type
  TRmMessage = record
    code: string;
    msg: string;
    rownum: string;
  end;

  TRequestItf = Class
  private
    class function Query(url, action, param: String): String;
    class function ReplaceUnsafeChars(const s: String): String;
  public
    class function RmQuery(action, param: String): String;
    class function DbQuery(action: String; param: String = ''): String;
    class function pDbQuery(action: String; param: String = ''): String;
    class function GetRmMessage(json: String): TRmMessage; static;
  end;

implementation

uses uGlobal, uMain;

class function TRequestItf.ReplaceUnsafeChars(const s: String): String;
var
  i: integer;
begin
  Result := s.Replace('*', '');
  Result := Result.Replace('<', '');
  Result := Result.Replace('>', '');
  Result := Result.Replace('#', '');
  Result := Result.Replace('%', '');
  Result := Result.Replace('|', '');
  Result := Result.Replace('\', '');
  Result := Result.Replace('^', '');
  Result := Result.Replace('`', '');
end;

class function TRequestItf.Query(url, action, param: String): String;
var
  http: TNetHTTPClient;
  s: string;
begin
  Result := '';
  if not gIsLogout then
  begin
    http := TNetHTTPClient.Create(nil);
    try
      if UpperCase(action) <> 'LOGIN' then
      begin
        if param <> '' then
          param := param + '&token=' + gToken
        else
          param := 'token=' + gToken;
      end;
      param := EncodeString(param);
      param := param.Replace(#13#10, '');
      s := url + '/' + action + '?' + param;
      Result := http.Get(s).ContentAsString;
    except
    end;
    http.Free;
    if (UpperCase(Result) = 'LOGOUT') or (UpperCase(Result) = 'INVALID TOKEN')
    then
    begin
      if Assigned(frmMain) then
      begin
        gIsLogout := True;
        frmMain.LogOut;
      end;
      Result := '';
    end;
  end;
end;

class function TRequestItf.RmQuery(action, param: String): String;
begin
  Result := Query(gSetup.DiRmUrl, action, param);
end;

class function TRequestItf.DbQuery(action, param: String): String;
begin
  Result := Query(gSetup.DiDbUrl, action, param);
end;

class function TRequestItf.pDbQuery(action, param: String): String;
begin
  Result := Query(gSetup.DiPDbUrl, action, param);
end;

Class function TRequestItf.GetRmMessage(json: String): TRmMessage;
var
  head, item: string;
  tmpTs: TStrings;
  i: integer;
begin
  tmpTs := TStringList.Create;
  tmpTs.Delimiter := ',';
  if pos('"head":{', json) > 0 then
  begin
    json := copy(json, pos('"head":{', json) + 8, length(json));
    head := copy(json, 1, pos('}', json) - 1);
    json := copy(json, pos('}', json) + 1, length(json));
    head := StringReplace(head, '"', '', [rfReplaceAll]);
    tmpTs.DelimitedText := head;
    for i := 0 to tmpTs.Count - 1 do
    begin
      if pos('code', tmpTs[i]) = 1 then
        Result.code := Trim(copy(tmpTs[i], pos(':', tmpTs[i]) + 1, 10))
      else if pos('rownum', tmpTs[i]) = 1 then
        Result.rownum := Trim(copy(tmpTs[i], pos(':', tmpTs[i]) + 1, 10))
      else if pos('message', tmpTs[i]) = 1 then
        Result.msg := Trim(copy(tmpTs[i], pos(':', tmpTs[i]) + 1, 1000));
    end;
  end;
  tmpTs.Free;
end;

end.
