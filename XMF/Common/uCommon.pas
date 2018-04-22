unit uCommon;

interface

uses
  SysUtils, IOUtils, Generics.Collections, IniFiles, DB, IdHttp, Classes,
  Types, uGlobal, uLogger, uTypes, uPassList;

function Initialize: boolean;
procedure Finalizat;

implementation

procedure SQLError(const SQL, Description: string);
begin
  logger.Error(Description + #13#10 + SQL);
end;

procedure LoadHikKKMY;
var
  ss: TStringDynArray;
  s, key, value: string;
  i: integer;
begin
  HikKKMYDic := TDictionary<string, string>.Create;
  s := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), 'KKMY.ini');
  if TFile.Exists(s) then
  begin
    ss := TFile.ReadAllLines(s);
    for s in ss do
    begin
      i := s.IndexOf(#9);
      if i>0 then
      begin
        key := s.Substring(0, i);
        value := s.Substring(i + 1, 100);
        if not HikKKMYDic.ContainsKey(key) then
          HikKKMYDic.Add(key, value);
      end;
    end;
  end;
end;

procedure LoadFXDic;
var
  ss: TStringDynArray;
  s, key, value: string;
  i: integer;
begin
  FXDic := TDictionary<string, string>.Create;
  s := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), 'FX.ini');
  if TFile.Exists(s) then
  begin
    ss := TFile.ReadAllLines(s);
    for s in ss do
    begin
      i := s.IndexOf(#9);
      if i>0 then
      begin
        key := s.Substring(0, i);
        value := s.Substring(i + 1, 100);
        if not FXDic.ContainsKey(key) then
          FXDic.Add(key, value);
      end;
    end;
  end
  else begin
    FXDic.Add('由东向西', '13');
    FXDic.Add('由南向北', '24');
    FXDic.Add('由西向东', '31');
    FXDic.Add('由北向南', '42');
  end;
end;

function Initialize: boolean;
var
  appPath, logPath: string;
  ini: TIniFile;
  host, db, user, pwd: string;
begin
  result := true;
  appPath := TPath.GetDirectoryName(ParamStr(0));
  logPath := TPath.Combine(appPath, 'log');
  if not TDirectory.Exists(logPath) then
    TDirectory.CreateDirectory(logPath);
  logPath := TPath.Combine(logPath, 'xmf.log');
  logger := TLogger.Create(logPath);
  logger.Info('Application Initialize');

  ini:= TIniFile.Create(TPath.Combine(appPath, 'Config.ini'));
  Url := ini.ReadString('sys', 'url', '');
  Hik86Url := ini.ReadString('sys', 'Hik86Url', '');
  Second := ini.ReadInteger('sys', 'Second', 10);
  RePostCount := ini.ReadInteger('sys', 'RePostCount', 5);
  ini.Free;

  PassList := TPassList.Create;
  LoadHikKKMY;
  LoadFXDic;

  if url = '' then
  begin
    logger.Error('XMFS Url is empty!');
    result := false;
  end;
end;

procedure Finalizat;
begin
  PassList.Free;
  logger.Info('Application Finalizat');
  logger.Free;
end;

end.

