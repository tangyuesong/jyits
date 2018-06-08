unit uMainSvc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, IniFiles, uScanThread,
  IdContext, IdCustomHTTPServer, FireDAC.Phys.OracleDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.Oracle, IdBaseComponent, IdComponent,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Generics.Collections;

type
  TBDRSSvc = class(TService)
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDConnection1: TFDConnection;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    FScanThread: TScanThread;
    procedure SQLError(const SQL, Description: string);
  public
    function GetServiceController: TServiceController; override;
  end;

var
  BDRSSvc: TBDRSSvc;

implementation

uses
  uCommon, uLogger, uDM;

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
  strings: TStrings;
  s: string;
begin
  logger := TLogger.Create(ExtractFilePath(ParamStr(0)) + 'border.log');

  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  logger.Level := ini.ReadInteger('sys', 'logLevel', 2);

  Application.CreateForm(TDM, DM);
  DM.OnError := self.SQLError;

  Apps := TDictionary<string, string>.Create;
  strings := TStringList.Create;
  ini.ReadSection('APP', strings);
  for s in strings do
  begin
    if not Apps.ContainsKey(s.ToUpper) then
      Apps.Add(s.ToUpper, ini.ReadString('APP', s, ''));
  end;
  strings.Free;

  ini.Free;

  FScanThread := TScanThread.Create;
  logger.Info('start');
end;

procedure TBDRSSvc.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  FScanThread.Stop;
  Sleep(1000);
  logger.Info('stop');
  logger.Free;
end;

procedure TBDRSSvc.SQLError(const SQL, Description: string);
begin
  logger.Error(Description + SQL);
end;

end.
