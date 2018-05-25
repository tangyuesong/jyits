unit uMainSvc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, IniFiles, uScanThread,
  IdContext, IdCustomHTTPServer, FireDAC.Phys.OracleDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.Oracle, IdBaseComponent, IdComponent,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

type
  TBDRSSvc = class(TService)
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDConnection1: TFDConnection;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    FScanThread: TScanThread;
    FOraConn: TFDConnection;
    procedure SQLError(const SQL, Description: string);
  public
    function GetServiceController: TServiceController; override;
  end;

var
  BDRSSvc: TBDRSSvc;

implementation

uses
  uCommon, uSQLHelper, uLogger;

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  BDRSSvc.Controller(CtrlCode);
end;

function TBDRSSvc.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TBDRSSvc.ServiceStart(Sender: TService; var Started: Boolean);
var
  ini: TIniFile;
  oraHost, oraPort, oraSID, oraUser, oraPwd: string;
begin
  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'border.log');
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  QTZHost := ini.ReadString('sys', 'QTZ', '');
  logger.Level := ini.ReadInteger('sys', 'logLevel', 2);
  oraHost := ini.ReadString('ORA', 'Host', '');
  oraPort := ini.ReadString('ORA', 'Port', '');
  oraSID := ini.ReadString('ORA', 'SID', '');
  oraUser := ini.ReadString('ORA', 'User', '');
  oraPwd := ini.ReadString('ORA', 'Pwd', '');
  FOraConn := TFDConnection.Create(nil);
  FOraConn.FetchOptions.Mode := fmAll;
  FOraConn.Params.Add('DriverID=Ora');
  FOraConn.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [oraHost, oraPort, oraSID]));
  FOraConn.Params.Add(Format('User_Name=%s', [oraUser]));
  FOraConn.Params.Add(Format('Password=%s', [oraPwd]));
  FOraConn.Params.Add('CharacterSet=UTF8'); // ∑Ò‘Ú÷–Œƒ¬“¬Î
  FOraConn.LoginPrompt := false;
  SQLHelper := TSQLHelper.Create;
  SQLHelper.Connection := FOraConn;
  SQLHelper.OnError := self.SQLError;
  ini.Free;
  FScanThread := TScanThread.Create;
  logger.Info('start');
end;

procedure TBDRSSvc.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  FScanThread.Stop;
  Sleep(1000);
  SQLHelper.Free;
  logger.Info('stop');
  logger.Free;
end;

procedure TBDRSSvc.SQLError(const SQL, Description: string);
begin
  logger.Error(Description + SQL);
end;

end.
