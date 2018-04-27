unit uMain;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Forms,
  Vcl.StdCtrls, Vcl.Controls, IdHTTP, IdCustomHTTPServer, IdHTTPServer,
  IniFiles, IdContext, IdComponent, IdBaseComponent, IdCustomTCPServer,
  uScanThread, uCache;

type
  Tfrmain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FScanThread: TScanThread;
    procedure SQLError(const SQL, Description: string);
  public

  end;

var
  frmain: Tfrmain;

implementation

uses
  uCommon, uSQLHelper, uLogger, uInterface, uPublic;
{$R *.dfm}
{ Tfrmain }

procedure Tfrmain.Button1Click(Sender: TObject);
var
  ini: TIniFile;
  dbname, dbuser, dbpwd, dbserver: string;
begin
  if Button1.Caption = 'Start' then
  begin
    logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'BD.log');
    ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
    SQLHelper := TSQLHelper.Create;
    SQLHelper.OnError := SQLError;
    SQLHelper.DBServer := ini.ReadString('DB', 'Server', '10.43.235.222,1133');
    SQLHelper.DBName := ini.ReadString('DB', 'Name', 'borderdb');
    SQLHelper.DBUser := ini.ReadString('DB', 'User', 'border');
    SQLHelper.DBPWD := ini.ReadString('DB', 'PWD', '@border$');
    SQLHelper.NT := false;

    SQLHelperIts := TSQLHelper.Create;
    SQLHelperIts.OnError := SQLError;
    SQLHelperIts.DBServer := ini.ReadString('DBIts', 'Server', '10.43.255.8');
    SQLHelperIts.DBName := ini.ReadString('DBIts', 'Name', 'YjItsDb');
    SQLHelperIts.DBUser := ini.ReadString('DBIts', 'User', 'vioadmin');
    SQLHelperIts.DBPWD := ini.ReadString('DBIts', 'PWD', 'lgm1224,./');
    SQLHelperIts.NT := false;
    ini.Free;
    logger.Info('Cache.Create');
    Cache := TCache.Create;
    logger.Info('Scan.Create');
    FScanThread := TScanThread.Create;

    Button1.Caption := 'Stop';
  end
  else
  begin
    Button1.Caption := 'Start';
    FScanThread.Stop;
    Sleep(10000);
    Cache.Free;
    SQLHelper.Free;
    logger.Free;
  end;
end;

procedure Tfrmain.Button2Click(Sender: TObject);
var
  drv: TDrvInfo;
begin
  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'BDaaaaaaaa.log');
  drv := trff.QueryDrvInfo('430611198109134511');
  logger.Info('SFZMHM: '+drv.sfzmhm);
  logger.Info('XM: '+drv.xm);
  logger.Free;
end;

procedure Tfrmain.SQLError(const SQL, Description: string);
begin
  logger.Error(Description + SQL);
end;

end.
