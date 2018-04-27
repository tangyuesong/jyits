unit uMain;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Forms,
  Vcl.StdCtrls, Vcl.Controls, IdHTTP, IdCustomHTTPServer, IdHTTPServer,
  DateUtils, IdContext, IdComponent, IdBaseComponent, IdCustomTCPServer,
  Generics.Collections, IniFiles, uCommon, uLogger, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, IOUtils, FireDAC.Phys.MSSQLDef,Types,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, Vcl.ExtCtrls,System.Hash,
  IdHashMessageDigest, IdServerIOHandler, IdSSL, IdSSLOpenSSL;

type

  Tfrmain = class(TForm)
    IdHTTPServer1: TIdHTTPServer;
    Button1: TButton;
    Timer1: TTimer;
    IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure IdServerIOHandlerSSLOpenSSL1GetPassword(var Password: string);
  private
    FClientCount: integer;
    FSessionDic: TDictionary<string, TToken>;
    FLoginList: TObjectList<TLogin>;
    function GetStream(json: string): TStream;
    procedure DoGetData(ARequestInfo: TIdHTTPRequestInfo;
      AResponseInfo: TIdHTTPResponseInfo);
    function InsertToDB(cmd, body: string): string;
    function GetResponse(sysid: string): string;
    function CheckToken(key: string): boolean;
    function DoLogin(user, pwd, ip: string): boolean;
    function NewToken(login, ip: string): TToken;
    function CheckIP(ip: string): boolean;
    procedure LoadLoginList;
    procedure SQLError(const SQL, Description: string);
    procedure CleanSession;
    function GetConnNum(ip, login: string): integer;
  public
    { Public declarations }
  end;

var
  frmain: Tfrmain;

implementation

uses
  HttpApp, uSQLHelper;

{$R *.dfm}

procedure Tfrmain.Button1Click(Sender: TObject);
var
  ini: TIniFile;
begin
  if Button1.Caption = 'Start' then
  begin
    self.Timer1.Interval := 1000 * 60;
    self.Timer1.Enabled := true;
    FClientCount := 0;
    logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'OB.log');
    FSessionDic := TDictionary<string, TToken>.Create;
    LoadLoginList;
    ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');

    SQLHelper := TSQLHelper.Create();
    SQLHelper.DBServer := ini.ReadString('DB', 'Server', '(local)');
    SQLHelper.DBName := ini.ReadString('DB', 'Name', 'borderdb');
    SQLHelper.DBUser := ini.ReadString('DB', 'User', 'border');
    SQLHelper.DBPWD := ini.ReadString('DB', 'PWD', '@border$');
    ClientTimeOut := ini.ReadInteger('HTTP', 'ClientTimeOut', 10) * OneSecond;
    SessionTimeOut := ini.ReadInteger('HTTP', 'SessionTimeOut', 10) * OneMinute;
    MaxClientCount := ini.ReadInteger('HTTP', 'MaxClientCount', 1000);
    MaxConnNumPeerUser := ini.ReadInteger('HTTP', 'MaxConnNumPeerUser', 10);

    SQLHelper.OnError := SQLError;
    SQLHelper.NT := false;

    IdHTTPServer1.Bindings.Clear;
    IdHTTPServer1.DefaultPort := ini.ReadInteger('HTTP', 'Port', 443);
    IdHTTPServer1.Bindings.Add;
    with IdServerIOHandlerSSLOpenSSL1.SSLOptions do
    begin
      Method := sslvSSLv23;
      RootCertFile := ExtractFilePath(ParamStr(0)) + 'server.crt';
      CertFile := ExtractFilePath(ParamStr(0)) + 'server.crt';
      KeyFile := ExtractFilePath(ParamStr(0)) + 'server.key';
    end;
    IdHTTPServer1.IOHandler := IdServerIOHandlerSSLOpenSSL1;
    IdHTTPServer1.Active := True;

    ini.Free;

    Button1.Caption := 'Stop';
  end
  else
  begin
    self.Timer1.Enabled := false;
    Button1.Caption := 'Start';
    IdHTTPServer1.Active := false;
    SQLHelper.Free;
    FSessionDic.Free;
    FLoginList.Free;
    logger.Free;
  end;
end;

function Tfrmain.GetStream(json: string): TStream;
var
  buf: TBytes;
begin
  result := TMemoryStream.Create;
  buf := TEncoding.UTF8.GetBytes(json);
  result.WriteBuffer(buf, length(buf));
end;

procedure Tfrmain.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
const
  CMDList = 'GETVEHINFO'#9'GETVEHLIST'#9'GETDRVINFO'#9'GETVIOINFO'#9'GETVIOINFO1';
var
  ip, action: string;
begin
  if FClientCount > MaxClientCount then
  begin
    AResponseInfo.ContentText := 'function busy';
    logger.Warn('too much Client!');
    exit;
  end;
  ip := AContext.Connection.Socket.Binding.PeerIP;
  if not CheckIP(ip) then
  begin
    AResponseInfo.ContentText := '';
    logger.Warn('invalid ip: ' + ip);
    exit;
  end;
  Inc(FClientCount);
  action := UpperCase(ARequestInfo.Document.Substring(1));
  logger.Info('Command: [' + ip + '][' + action+']' + ARequestInfo.UnparsedParams);
  if action = 'GETTOKEN' then
  begin
    if DoLogin(ARequestInfo.Params.Values['user'], ARequestInfo.Params.Values['pwd'], ip) then
      AResponseInfo.ContentText := NewToken(ARequestInfo.Params.Values['user'], ip).key
    else
      AResponseInfo.ContentText := '';
  end
  else if action = 'GETPIC' then
  begin
    AResponseInfo.ContentType := 'image/jpeg';
    AResponseInfo.ServeFile(AContext, 'd:\a.jpg');
  end
  else if CMDList.Contains(action) then
  begin
    if CheckToken(ARequestInfo.Params.Values['token']) then
      DoGetData(ARequestInfo, AResponseInfo)
    else
      AResponseInfo.ContentText := '';
  end
  else
    AResponseInfo.ContentText := 'Hi!';
  Dec(FClientCount);
end;

procedure Tfrmain.IdServerIOHandlerSSLOpenSSL1GetPassword(var Password: string);
begin
  Password := '123456';
end;

procedure Tfrmain.DoGetData(ARequestInfo: TIdHTTPRequestInfo;
  AResponseInfo: TIdHTTPResponseInfo);
var
  action, params, body, sysid: string;
begin
  action := ARequestInfo.Document.Substring(1);

  params := ARequestInfo.UnparsedParams;
  sysid := InsertToDB(action, params);
  if sysid <> '' then
  begin
    body := GetResponse(sysid);
    if body <> '' then
    begin
      AResponseInfo.ContentStream := GetStream(body.Substring(1));
    end
    else
      AResponseInfo.ContentText := 'Time Out';
  end
  else
    AResponseInfo.ContentText := 'Error: 1';
end;

function Tfrmain.CheckIP(ip: string): boolean;
var
  login: TLogin;
begin
  result := false;
  for login in FLoginList do
  begin
    if login.ip.Contains(ip) then
    begin
      result := True;
      exit;
    end;
  end;
end;

function Tfrmain.DoLogin(user, pwd, ip: string): boolean;
var
  login: TLogin;
begin
  result := false;
  for login in FLoginList do
  begin
    if login.ip.Contains(ip) and (login.LoginName = user) and (login.pwd = pwd) then
    begin
      result := True;
      exit;
    end;
  end;
  logger.Warn('Login Failed: ' + user + ' ' + pwd);
end;

procedure Tfrmain.CleanSession;
var
  token: TToken;
  key: string;
begin
  for key in FSessionDic.Keys do
  begin
    token := FSessionDic[key];
    if now - token.UpdateTime > SessionTimeOut then
    begin
      FSessionDic.Remove(key);
      token.Free;
    end;
  end;
end;

function Tfrmain.GetConnNum(ip, login: string): integer;
var
  token: TToken;
  key: string;
begin
  result := 0;
  for key in FSessionDic.Keys do
  begin
    token := FSessionDic[key];
    if (token.IP = ip)and(token.Login=login) then
    begin
      inc(result);
    end;
  end;
end;

function Tfrmain.NewToken(login, ip: string): TToken;
begin
  CleanSession;
  result := nil;
  if GetConnNum(ip, login) <= MaxConnNumPeerUser then
  begin
    result := TToken.Create;
    result.key := TGuid.NewGuid.ToString.Replace('{', '').Replace('}', '').Replace('-', '');
    result.LoginTime := now;
    result.UpdateTime := now;
    result.login := login;
    result.ip := ip;
    FSessionDic.Add(result.key, result);
  end
  else
    logger.Warn('too much connections! ' + ip + login);
end;

procedure Tfrmain.SQLError(const SQL, Description: string);
begin
  logger.Error(Description + SQL);
end;

procedure Tfrmain.Timer1Timer(Sender: TObject);
begin
  LoadLoginList;
end;

function Tfrmain.CheckToken(key: string): boolean;
begin
  result := FSessionDic.ContainsKey(key);
  if result then
  begin
    FSessionDic[key].UpdateTime := now;
  end
  else
    logger.Warn('Invalid token key: ' + key);
end;

function Tfrmain.InsertToDB(cmd, body: string): string;
var
  SQL, sysid: string;
  Params: TFDParams;
  Param: TFDParam;
begin
  Params := TFDParams.Create;
  Param := Params.Add;
  Param.Name := 'body';
  Param.Value := body;
  sysid := TGuid.NewGuid.ToString;
  SQL := 'insert into T_IN(SYSID,CMD,BODY,SN)VALUES(''' + sysid + ''',''' + cmd
    + ''',:body,''' + 'SN' + ''')';
  if SQLHelper.ExecuteSql1(SQL, Params) then
    result := sysid
  else
    result := '';
end;

procedure Tfrmain.LoadLoginList;
var
  ss: TStringDynArray;
  s: string;
  tmp: TArray<string>;
  l: TLogin;
begin
  if Assigned(FLoginList) then
    FLoginList.Free;
  FLoginList := TObjectList<TLogin>.Create;
  if FileExists(ExtractFilePath(ParamStr(0)) + 'Users.dat') then
  begin
    ss := TFile.ReadAllLines(ExtractFilePath(ParamStr(0)) + 'Users.dat');
    for s in ss do
    begin
      tmp := s.Split([#9]);
      if length(tmp) = 3 then
      begin
        l := TLogin.Create;
        l.LoginName := tmp[0];
        //l.pwd := THashMD5.GetHashString(tmp[1]);
        l.pwd := tmp[1];
        l.ip := tmp[2];
        FLoginList.Add(l);
      end;
    end;
  end
  else
    logger.Warn('Users.dat is not exists');
end;

function Tfrmain.GetResponse(sysid: string): string;
var
  SQL: string;
  time: Double;
begin
  SQL := 'select ''A'' + BODY from T_OUT where SYSID=''' + sysid + '''';
  time := now;
  while now - time < ClientTimeOut do
  begin
    Sleep(100);
    result := SQLHelper.GetSinge(SQL);
    if result <> '' then
    begin
      SQLHelper.ExecuteSql('DELETE FROM T_OUT WHERE SYSID=''' + sysid + '''');
      exit;
    end;
  end;
  result := '';
end;

end.
