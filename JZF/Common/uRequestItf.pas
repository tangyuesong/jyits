unit uRequestItf;

interface

uses
  IdHttp, SysUtils, HttpApp, Soap.EncdDecd, IdURI, Classes;

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
    class function GetToken(): String;
  public
    class function RmQuery(action, param: String): String;
    class function DbQuery(action: String; param: String = ''): String;
    class function GetRmMessage(json: String): TRmMessage; static;
  end;

implementation

uses uGlobal;

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

class function TRequestItf.RmQuery(action, param: String): String;
begin
  Result := Query(gConfig.QTZRM, action, param);
end;

class function TRequestItf.Query(url, action, param: String): String;
var
  http: TIdHttp;
  s: string;
  i: integer;
begin
  Result := '';
  http := TIdHttp.Create(nil);
  try
    if gToken = '' then
      gToken := GetToken;
    i := 0;
    while i < 2 do
    begin
      if param <> '' then
        s := param + '&token=' + gToken
      else
        s := 'token=' + gToken;

      s := EncodeString(s);
      s := s.Replace(#13#10, '');
      s := url + '/' + action + '?' + s;
      s := http.Get(s);
      if Trim(s) = 'invalid token' then
      begin
        inc(i);
        gToken := GetToken;
      end
      else
      begin
        Result := s;
        break;
      end;
    end;
  except
  end;
  http.Free;
end;

class function TRequestItf.DbQuery(action, param: String): String;
begin
  Result := Query(gConfig.QTZDB, action, param);
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

class function TRequestItf.GetToken: String;
var
  http: TIdHttp;
  url, s: string;
begin
  Result := '';
  http := TIdHttp.Create(nil);
  try
    s := 'user=sa&pwd=EB8E560662808ED4FAEA1C8AF016055947C4EF17CFD7AFC5390AA126AB25E2A2';
    s := EncodeString(s);
    s := s.Replace(#13#10, '');
    url := gConfig.QTZDB + '/Login?' + s;
    Result := http.Get(url);
  except
  end;
  http.Free;
end;

end.
