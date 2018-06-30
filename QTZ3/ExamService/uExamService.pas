unit uExamService;

interface

uses
  System.Classes, Types, IOUtils, SysUtils, Generics.Collections, Windows,
  Generics.Defaults, FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Def,
  FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Expr, FireDAC.Stan.Pool,
  System.Net.HttpClientComponent, DateUtils, Variants, IniFiles, uGlobal;

type
  TExamService = class
  private
    FOraConn: TFDConnection;
    FOraQuery: TFDQuery;
    constructor Create;
    destructor Destroy; override;
    function GetData: string;
  public
    class function GetExamData: string; static;
  end;

implementation

{ TExamService }

constructor TExamService.Create;
var
  host, port, sid, user, pwd: string;
begin
  with TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini') do
  begin
    host := ReadString('exam', 'host', '');
    port := ReadString('exam', 'Port', '1521');
    sid := ReadString('exam', 'sid', '');
    User := ReadString('exam', 'User', '');
    Pwd := ReadString('exam', 'Pwd', '');
    Free;
  end;
  FOraConn := TFDConnection.Create(nil);
  FOraConn.FetchOptions.Mode := fmAll;
  FOraConn.Params.Add('DriverID=Ora');
  FOraConn.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [Host, Port, sid]));
  FOraConn.Params.Add(Format('User_Name=%s', [User]));
  FOraConn.Params.Add(Format('Password=%s', [pwd]));
  FOraConn.Params.Add('CharacterSet=UTF8'); // ·ñÔòÖÐÎÄÂÒÂë
  FOraConn.LoginPrompt := false;

  FOraQuery := TFDQuery.Create(nil);
  FOraQuery.DisableControls;
  FOraQuery.Connection := FOraConn;
end;

destructor TExamService.Destroy;
begin
  FOraQuery.Free;
  FOraConn.Free;
  inherited;
end;

class function TExamService.GetExamData: string;
begin
  with TExamService.Create do
  begin
    result := GetData;
    Free;
  end;
end;

function TExamService.GetData: string;
begin
  result := '';
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT A.KCDM,B.KCMC,COUNT(*) AS ZRS,SUM(2-HGBJ) AS HG,SUM(HGBJ-1) AS BHG ');
    SQL.Add('FROM EXAM_KS_RESULT A INNER JOIN EXAM_KCDM B ON A.KCDM=B.KCDM ');
    SQL.Add('WHERE KSSJ>TRUNC(SYSDATE) GROUP BY A.KCDM, B.KCMC ');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
      DisableControls;
      while not EOF do
      begin
        result := result +
          Format(',{"KCDM":"%s","KCMC":"%s","ZRS":"%s","HG":"%s","BHG":"%s"}',
          [Fields[0].AsString,
          Fields[1].AsString,
          Fields[2].AsString,
          Fields[3].AsString,
          Fields[4].AsString]);

        Next;
      end;
      Close;
    except
      on e: exception do
      begin
        gLogger.Error('[TExamService.GetExamInfo]:' + e.Message);
      end;
    end;
  end;
  if result <> '' then
    result := '[' + result.Substring(1) + ']';
end;

end.
