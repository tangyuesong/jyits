unit uCommon;

interface

type
  TDBConfig = record
    Host: string;
    Port: string;
    User: string;
    Password: string;
    DbName: string;
  end;

var
  OraConfig: TDBConfig;

implementation

end.
