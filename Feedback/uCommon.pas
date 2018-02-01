unit uCommon;

interface
uses uQTZHelper;
type
  TDBConfig = record
    Host: string;
    Port: string;
    User: string;
    Password: string;
    DbName: string;
  end;

var
  SqlConfig, OraConfig: TDBConfig;
  gQTZHelper: TQTZHelper;

implementation

end.
