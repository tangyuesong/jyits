unit uSMS;

interface

uses
  SysUtils, Classes, IniFiles, uSQLHelper, uCommon, IdHttp, MessageDigest_5,
  System.Types, uGlobal, Web.HTTPApp;

type
  TSMS = class
  private
    class var dbHelper: TSQLHelper;
    class procedure InitSMS(); static;
    class procedure SendSMSByHttp(sj, content: string);
  public
    class function SendSMS(sn, sjhm, content: string): boolean; static;
  end;

implementation

{ TSMS }

class procedure TSMS.SendSMSByHttp(sj, content: string);
  function GetToken: string;
  var
    md5: IMD5;
    s: string;
  begin
    s := formatdatetime('yymmdd', now) + '*echotech';
    md5 := GetMD5;
    md5.Init;
    md5.Update(TByteDynArray(RawByteString(s)), length(s));
    result := md5.AsString.ToLower;
  end;

var
  token, url: string;
  http: TIdHttp;
  stream: TStream;
begin
  token := GetToken;
  url := Format(gConfig.SMSUrl, [token, sj, HTTPEncode(content)]);
  http := TIdHttp.Create(nil);
  stream := TMemoryStream.Create;
  http.Post(url, stream);
  http.Free;
  stream.Free;
end;

class procedure TSMS.InitSMS;
var
  host, db, user, pwd: string;
  ini: TIniFile;
begin
  ini := TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Config.ini');
  host := ini.ReadString('BorderDB', 'server', ''); // 10.43.235.222,1133
  if host <> '' then
  begin
    db := ini.ReadString('BorderDB', 'dbname', 'borderdb');
    user := ini.ReadString('BorderDB', 'user', 'zasms');
    pwd := ini.ReadString('BorderDB', 'pwd', 'zasms');

    dbHelper := TSQLHelper.Create(host, db, user, pwd);
    dbHelper.OnError := uCommon.SQLError;
  end;
  ini.Free;
end;

class function TSMS.SendSMS(sn, sjhm, content: string): boolean;
begin
  Result:= True;
  if gConfig.SMSUrl <> '' then
    SendSMSByHttp(sjhm, content)
  else
  begin
    if dbHelper = nil then
      InitSMS;
    if Trim(sn) = '' then
      sn := '¼©²é²¼¿Ø';
    if (dbHelper <> nil) and (sjhm <> '') and (content <> '') then
    begin
      result := dbHelper.ExecuteSql
        ('insert into [borderdb].[dbo].[T_OUT] (sn,body,msg) ' + ' values(' +
        sn.QuotedString + ',' + sjhm.Replace(',', ';').QuotedString + ',' +
        content.QuotedString + ')');
    end;
  end;
end;

end.
