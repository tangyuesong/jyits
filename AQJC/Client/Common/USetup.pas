unit USetup;

interface

uses
  System.IniFiles, uGlobal, system.SysUtils, uEntity, uRequestItf, uJsonUtils;

type
  TLZsetup = class
  private
    class function ReadIni: TSetup; static;
    class procedure WriteIni(Value: TSetup); static;
    class function GpyReadIni: TGPY; static;
  //  class procedure GpyWriteIni(value: TGPY); static;
  public
    class property SysSetup: TSetup read ReadIni write WriteIni;
    class property GpySetup: TGPY read GpyReadIni;
  end;

implementation

class function TLZsetup.GpyReadIni: TGPY;
var
  ss: string;
  sys: string;
begin
  if Pos(UpperCase('Windows xp'), UpperCase(TOSVersion.ToString)) > 0 then
    sys := 'xp'
  else if Pos(UpperCase('Windows 7'), UpperCase(TOSVersion.ToString)) > 0 then
    sys := 'win7'
  else if Pos(UpperCase('Windows 10'), UpperCase(TOSVersion.ToString)) > 0 then
    sys := 'win10'
  else
    sys := 'win7';
  ss := TRequestItf.pDbQuery('GetT_GPYSOURCE', 'xtid=' + sys);
  Result := TJsonUtils.JsonToRecord<TGPY>(ss);
end;
{
class procedure TLZsetup.GpyWriteIni(value: TGPY);
var
  fn: string;
  inifn: TIniFile;
begin
  fn := ExtractFilePath(ParamStr(0)) + 'GPYConfig.ini';
  inifn := TIniFile.Create(fn);
  with inifn do
  begin
    // ”∆µ1
    WriteString('video1', 'input', Value.input1);
    WriteInteger('video1', 'idx', Value.idx1);
    WriteInteger('video1', 'index', Value.index1);
    WriteInteger('video1', 'Width', Value.Width1);
    WriteInteger('video1', 'Height', Value.Height1);
    WriteBool('video1', 'zt', Value.sata1);
    WriteInteger('video1', 'zoom', Value.zoom1);
    // ”∆µ2
    WriteString('video2', 'input', Value.input2);
    WriteInteger('video2', 'idx', Value.idx2);
    WriteInteger('video2', 'index', Value.index2);
    WriteInteger('video2', 'Width', Value.Width2);
    WriteInteger('video2', 'Height', Value.Height2);
    WriteBool('video2', 'zt', Value.sata2);
    WriteInteger('video2', 'zoom', Value.zoom2);
    //≈‰÷√
    WriteString('Setup', 'PICURL', Value.PICURL);
    WriteString('Setup', 'FtpHost', Value.FtpHost);
    WriteInteger('Setup', 'FtpPort', Value.FtpPort);

  end;
  inifn.Free;
end;   }

class function TLZsetup.ReadIni: TSetup;
var
  fn: string;
  inifn: TIniFile;
begin
  fn := ExtractFilePath(ParamStr(0)) + 'Config.ini';
  inifn := TIniFile.Create(fn);
  with Result do
  begin
    DBSERVER := inifn.ReadString('DB', 'DBSERVER', '');
    DCSERVER := inifn.ReadString('DB', 'DcSERVER', '');
    DBName := inifn.ReadString('DB', 'DBName', 'YjItsDB');
    DCSERName := inifn.ReadString('DB', 'DCSERName', 'YjItsDB');
    VIOWSDL := inifn.ReadString('SETUP', 'VIOWSDL', '');
    VIOURL := inifn.ReadString('SETUP', 'VIOURL', '');
    VIOSVC := inifn.ReadString('SETUP', 'VIOSVC', '');
    VIOPRT := inifn.ReadString('SETUP', 'VIOPRT', '');
    VIOSN := inifn.ReadString('SETUP', 'VIOSN', '');
    DWDM := inifn.ReadString('SETUP', 'DWDM', '');
    DirDelete := inifn.ReadString('SETUP', 'DIRDELETE', 'd:\pic_delete');
    DirSave := inifn.ReadString('SETUP', 'temppath', 'D:\PIC_SAVE\');
    if not DirSave.EndsWith('\') then
      DirSave := DirSave + '\';
    MapUrl := inifn.ReadString('SETUP', 'MAPURL', 'http://center.gdcztw.com:8088/bmaps.html');
    DFSHOST := inifn.ReadString('SETUP', 'DFSHOST', 'localhost:8088');
    //TDFS.Host := inifn.ReadString('SETUP', 'DFSHOST', 'localhost:8088');
    FtpHost := inifn.ReadString('FTP', 'Host', '');
    FtpPort := inifn.ReadInteger('FTP', 'Port', 21);
    FtpUser := inifn.ReadString('FTP', 'User', '');
    FtpPwd := inifn.ReadString('FTP', 'Password', '');
    DefSbbh := inifn.ReadString('DEVICE', 'DEFSBBH', '10010');

    DiPDbUrl := inifn.ReadString('DI', 'PDBUrl', 'http://10.43.255.22:10085');
    DiDbUrl := inifn.ReadString('DI', 'DBUrl', 'http://10.43.255.22:10086');
    DiSlUrl := inifn.ReadString('DI', 'SLUrl', 'http://10.43.255.22:10087');
    DiRmUrl := inifn.ReadString('DI', 'RMUrl', 'http://10.43.255.22:10088');

    QTZ3Url:= inifn.ReadString('DI', 'QTZ3Url', 'http://10.43.255.8:17115/');

    VideoHost := inifn.ReadString('Video', 'Host', '172.30.10.13');
    VideoPort := inifn.ReadInteger('Video', 'Port', 5060);
    VideoUser := inifn.ReadString('Video', 'User', 'czjjzd');
    VideoPwd := inifn.ReadString('Video', 'Pwd', '123456');

    AppTitle:= inifn.ReadString('SETUP', 'AppTitle', '¿«÷Î÷¥∑®÷˙ ÷');
  end;
  inifn.Free;
end;

class procedure TLZsetup.WriteIni(Value: TSetup);
var
  fn: string;
  inifn: TIniFile;
begin
  fn := ExtractFilePath(ParamStr(0)) + 'Config.ini';
  inifn := TIniFile.Create(fn);
  with inifn do
  begin
    WriteString('SETUP', 'SERVERIP', Value.DBServer);
    WriteString('SETUP', 'SERVERPORT', Value.DBName);
    WriteString('SETUP', 'VIOWSDL', Value.VIOWSDL);
    WriteString('SETUP', 'VIOURL', Value.VIOURL);
    WriteString('SETUP', 'VIOSVC', Value.VIOSVC);
    WriteString('SETUP', 'VIOPRT', Value.VIOPRT);
    WriteString('SETUP', 'VIOSN', Value.VIOSN);
    WriteString('SETUP', 'DWDM', Value.DWDM);
    WriteString('SETUP', 'DIRDELETE', Value.DirDelete);
    WriteString('SETUP', 'DIRSAVE', Value.DirSave);
    WriteString('SETUP', 'MAPURL', Value.MapUrl);
    //WriteString('SETUP', 'DFSHOST', TDFS.HOST);
    WriteString('FTP', 'Host', Value.FtpHost);
    WriteInteger('FTP', 'Port', Value.FtpPort);
    WriteString('FTP', 'User', Value.FtpUser);
    WriteString('FTP', 'Password', Value.FtpPwd);
    WriteString('DEVICE', 'DEFSBBH', Value.DefSbbh);
    WriteString('DI', 'DiDbUrl', Value.DiDbUrl);
    WriteString('DI', 'DiSlUrl', Value.DiSlUrl);
    WriteString('DI', 'DiRmUrl', Value.DiRmUrl);
  end;
  inifn.Free;
end;

end.


