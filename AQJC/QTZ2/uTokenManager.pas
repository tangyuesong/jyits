unit uTokenManager;

interface

uses
  SysUtils, uEntity, Generics.Collections, DateUtils;

type
  TLogin = class
  public
    LoginName: string;
    IP: string;
    Pwd: string;
  end;

  TToken = class
  public
    Login: string;
    IP: string;
    Key: string;
    LoginTime: Double;
    UPDATETIME: Double;
  end;

  TTokenManager = class
  private
    FSessionDic: TDictionary<string, TToken>;
    FSessionTimeOut: Double;
    procedure CleanSession;
    function GetExistsToken(IP, Login: string): TToken;
  public
    constructor Create;
    destructor Destroy;
    function NewToken(Login, IP: string): TToken;
    function CheckToken(Key, IP: string): boolean;
    function GetToken(Key: String): TToken;
  published
    property Sessions: TDictionary<string, TToken> read FSessionDic;
    property SessionTimeOut: Double read FSessionTimeOut write FSessionTimeOut;
  end;

implementation

uses
  uGlobal;

constructor TTokenManager.Create;
begin
  FSessionDic := TDictionary<string, TToken>.Create;
  SessionTimeOut := OneMinute * 30;
end;

destructor TTokenManager.Destroy;
begin
  FSessionDic.Free;
end;

procedure TTokenManager.CleanSession;
var
  token: TToken;
  Key: string;
begin
  for Key in FSessionDic.Keys do
  begin
    token := FSessionDic[Key];
    if now - token.UPDATETIME > SessionTimeOut then
    begin
      FSessionDic.Remove(Key);
      token.Free;
    end;
  end;
end;

function TTokenManager.GetExistsToken(IP, Login: string): TToken;
var
  token: TToken;
  Key: string;
begin
  result := nil;
  for Key in FSessionDic.Keys do
  begin
    token := FSessionDic[Key];
    if (token.Login = Login) and
      ((token.IP = IP) or (gSaUsers.IndexOf(Login) >= 0)) then
    begin
      result := token;
      result.UPDATETIME := now;
    end
    else if token.Login = Login then
      FSessionDic.Remove(Key);
  end;
end;

function TTokenManager.GetToken(Key: String): TToken;
begin
  result := nil;
  if FSessionDic.ContainsKey(Key) then
    result := FSessionDic[Key];
end;

function TTokenManager.NewToken(Login, IP: string): TToken;
begin
  CleanSession;
  result := GetExistsToken(IP, Login);
  if result = nil then
  begin
    result := TToken.Create;
    result.Key := TGuid.NewGuid.ToString.Replace('{', '').Replace('}', '')
      .Replace('-', '');
    result.LoginTime := now;
    result.UPDATETIME := now;
    result.Login := Login;
    result.IP := IP;
    FSessionDic.Add(result.Key, result);
  end;
end;

function TTokenManager.CheckToken(Key, IP: string): boolean;
begin
  result := FSessionDic.ContainsKey(Key);
  result := result and ((FSessionDic[Key].IP = IP) or
    (gSaUsers.IndexOf(FSessionDic[Key].Login) >= 0));
  if result then
  begin
    FSessionDic[Key].UPDATETIME := now;
  end;
end;

end.
