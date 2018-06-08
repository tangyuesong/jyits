unit uDM;

interface

uses
  SysUtils, Data.DB, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys.OracleDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.Oracle,FireDAC.Stan.Param,
  FireDAC.Comp.Client, FireDAC.DApt, IniFiles, ActiveX;

type
  TOraHelperError = procedure(const SQL, Description: string) of object;

  TDM = class(TDataModule)
    FDManager1: TFDManager;
    FDConnection1: TFDConnection;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FOnError: TOraHelperError;
    function BuildQuery(SQLString: String): TFDQuery; overload;
    procedure SetOnError(const Value: TOraHelperError);
    procedure DoError(const SQL, Description: string);
    function GetConnection: TFDConnection;
  public
    function GetSinge(SQLString: String): string; overload;
    function ExecuteSql(SQLString: string): boolean;
    function ExecuteSql1(SQLString: string; params: TFDParams): boolean;
    function Query(SQLString: String): TFDQuery; overload;
    function Enabled: boolean;
    property OnError: TOraHelperError read FOnError write SetOnError;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

const
  DefName = 'OraDef';

procedure TDM.DataModuleCreate(Sender: TObject);
var
  oDef: IFDStanConnectionDef;
  ini: TIniFile;
  configFile: string;
  oraHost, oraPort, oraSID, oraUser, oraPwd: string;
begin
  configFile := ExtractFilePath(ParamStr(0)) + 'config.ini';
  if not FileExists(configFile) then
  begin
    DoError('Config File Is Not Found! ', configFile);
    exit;
  end;
  CoInitialize(nil);
  ini := TIniFile.Create(configFile);
  oraHost := ini.ReadString('ORA', 'Host', '');
  oraPort := ini.ReadString('ORA', 'Port', '');
  oraSID := ini.ReadString('ORA', 'SID', '');
  oraUser := ini.ReadString('ORA', 'User', '');
  oraPwd := ini.ReadString('ORA', 'Pwd', '');
  ini.Free;

  oDef := FDManager1.ConnectionDefs.AddConnectionDef;
  oDef.Name := DefName;
  oDef.Params.Add('DriverID=Ora');
  oDef.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [oraHost, oraPort, oraSID]));
  oDef.Params.Add('User_Name=' + oraUser);
  oDef.Params.Add('Password=' + oraPwd);
  oDef.Params.Add('Pooled=True');
  oDef.Params.Add('CharacterSet=UTF8'); // ∑Ò‘Ú÷–Œƒ¬“¬Î
  oDef.MarkPersistent;
  FDManager1.Active := true;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FDManager1.Close;
end;

procedure TDM.SetOnError(const Value: TOraHelperError);
begin
  FOnError := Value;
end;

function TDM.BuildQuery(SQLString: String): TFDQuery;
var
  qy: TFDQuery;
begin
  qy := TFDQuery.Create(nil);
  qy.Connection := self.GetConnection;
  try
    qy.Connection.Open;
  except
    on e: Exception do
    begin
      DoError(SQLString, e.Message);
    end;
  end;
  qy.SQL.Text := SQLString;
  qy.DisableControls;
  result := qy;
end;

function TDM.ExecuteSql(SQLString: string): boolean;
var
  qy: TFDQuery;
begin
  result := false;
  qy := BuildQuery(SQLString);
  if qy.Connection.Connected then
  begin
    try
      qy.ExecSQL;
      result := true;
    except
      on e: Exception do
      begin
        DoError(SQLString, e.Message);
      end;
    end;
  end;
  qy.Close;
  qy.Connection.Close;
  qy.Connection.Free;
  qy.Connection := nil;
  qy.Free;
end;

function TDM.ExecuteSql1(SQLString: string; params: TFDParams): boolean;
var
  qy: TFDQuery;
begin
  result := false;
  qy := BuildQuery(SQLString);
  qy.Params := params;
  if qy.Connection.Connected then
  begin
    try
      qy.ExecSQL;
      result := true;
    except
      on e: Exception do
      begin
        DoError(SQLString, e.Message);
      end;
    end;
  end;
  qy.Close;
  qy.Connection.Close;
  qy.Connection.Free;
  qy.Connection := nil;
  qy.Free;
end;

function TDM.Query(SQLString: String): TFDQuery;
begin
  result := BuildQuery(SQLString);
  if result.Connection.Connected then
  begin
    try
      result.Open;
    except
      on e: Exception do
        DoError(SQLString, e.Message);
    end;
  end;
end;

function TDM.GetSinge(SQLString: String): string;
var
  qy: TFDQuery;
begin
  result := '';
  qy := Query(SQLString);
  if qy.Active then
  begin
    if (not qy.IsEmpty) and (not qy.Fields[0].IsNull) then
      result := qy.Fields[0].AsString;
  end;
  qy.Close;
  qy.Connection.Close;
  qy.Connection.Free;
  qy.Connection := nil;
  qy.Free;
end;

procedure TDM.DoError(const SQL, Description: string);
begin
  if Assigned(FOnError) then
    FOnError(SQL, Description);
end;

function TDM.Enabled: boolean;
var
  conn: TFDConnection;
begin
  conn := GetConnection;
  result := conn.Connected;
  conn.Free;
end;

function TDM.GetConnection: TFDConnection;
begin
  result := TFDConnection.Create(nil);
  result.FetchOptions.Mode := fmAll;
  result.ConnectionDefName := DefName;
  result.LoginPrompt := false;
end;

end.
