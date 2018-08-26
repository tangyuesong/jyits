unit uTokenManager;

interface

uses
  SysUtils, uEntity, Generics.Collections, DateUtils;

type
  TToken = class
  public
    Login: string;
    IP: string;
    Key: string;
    LoginTime: Double;
    UpdateTime: Double;
    User: TUser;
    IsSys: Boolean;
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
    function CheckToken(Key, IP: string): Boolean;
    function GetToken(Key: String): TToken;
  published
    property SessionTimeOut: Double read FSessionTimeOut write FSessionTimeOut;
  end;

implementation

uses
  uCommon, uGlobal;

constructor TTokenManager.Create;
var
  token: TToken;
begin
  FSessionDic := TDictionary<string, TToken>.Create;
  SessionTimeOut := OneMinute * 30;
  token := TToken.Create;
  token.Login := 'sjtb20180629';
  token.IP := '127.0.0.1';
  token.Key := '9CC0E31FD9F648519AC79239B018F1A6';
  token.LoginTime := Now;
  token.UpdateTime := Now;
  token.User.DWDM := gConfig.DWDM;
  token.User.YHXM := 'admin';
  token.IsSys := True;
  FSessionDic.Add(token.Key, token);
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
    if (not token.IsSys) and (Now - token.UpdateTime > SessionTimeOut) then
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
      ((token.IP = IP) or (TCommon.SaUsers.IndexOf(Login) >= 0)) then
      result := token
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
    result.LoginTime := Now;

    result.Login := Login;
    result.IP := IP;
    result.IsSys := False;
    FSessionDic.Add(result.Key, result);
  end;
  result.UpdateTime := Now;
end;

function TTokenManager.CheckToken(Key, IP: string): Boolean;
begin
  result := FSessionDic.ContainsKey(Key);
  if result then
  begin
    if not FSessionDic[Key].IsSys then
      result := (FSessionDic[Key].IP = IP) or
        (TCommon.SaUsers.IndexOf(FSessionDic[Key].Login) >= 0);
  end;
  if result then
    FSessionDic[Key].UpdateTime := Now;
end;

end.
