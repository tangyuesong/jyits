unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, uMainThread, uLogger, uCommon,
  Vcl.StdCtrls, FireDAC.Phys.OracleDef, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.Oracle;

type
  TForm1 = class(TForm)
    Button1: TButton;
    fdphysrcldrvrlnk1: TFDPhysOracleDriverLink;
    procedure Button1Click(Sender: TObject);
  private
    FThread: TMainThread;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ini: TIniFile;
begin

  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'log\Feedback.log');
  logger.Info('Service Started');
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  oraConfig.Host := ini.ReadString('Ora', 'Host', '10.43.255.208');
  oraConfig.Port := ini.ReadString('Ora', 'Port', '1521');
  oraConfig.User := ini.ReadString('Ora', 'User_Name', 'rm');
  oraConfig.Password := ini.ReadString('Ora', 'Password', 'rm');
  oraConfig.DbName := ini.ReadString('Ora', 'SERVICE_NAME', 'jczhpt');

  sqlConfig.Host := ini.ReadString('Sql', 'Host', '10.43.255.22');
  sqlConfig.User := ini.ReadString('Sql', 'User_Name', 'vioadmin');
  sqlConfig.Password := ini.ReadString('Sql', 'Password', 'lgm1224,./');
  sqlConfig.DbName := ini.ReadString('Sql', 'SERVICE_NAME', 'yjitsdb');

  gQTZHelper.Home := ini.ReadString('QTZ', 'Home', 'http://10.43.255.8:20088');

  //QTZHome := ini.ReadString('QTZ', 'Home', 'http://10.43.255.22:20088');

  ini.Free;
  FThread := TMainThread.Create();
  Button1.Enabled := false;
  Button1.Caption := 'ÒÑÆô¶¯';
end;

end.
