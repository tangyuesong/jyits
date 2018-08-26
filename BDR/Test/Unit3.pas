unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, uCommon, uLogger, uSQLHelper,
  FireDAC.Phys.OracleDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle,
  Vcl.StdCtrls, uScanThread, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TForm3 = class(TForm)
    Memo1: TMemo;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FScanThread: TScanThread;
    FOraConn: TFDConnection;
    procedure ServiceStart;
    procedure ServiceStop;
    procedure SQLError(const SQL, Description: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ServiceStop;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  ServiceStart;
end;

procedure TForm3.ServiceStart;
var
  ini: TIniFile;
  oraHost, oraPort, oraSID, oraUser, oraPwd: string;
begin
  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'borderIn.log');
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'configIn.ini');
  QTZHost := ini.ReadString('sys', 'QTZ', '');
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
end;

procedure TForm3.ServiceStop;
begin
  FScanThread.Stop;
  SQLHelper.Connection.Close;
  SQLHelper.Free;
  logger.Free;
end;

procedure TForm3.SQLError(const SQL, Description: string);
begin
  logger.Error(Description + SQL);
end;

end.
