unit uCommon;

interface
uses
  uSQLHelper, uLogger;

type
  TIn = record
    SYSID: string;
    CMD: string;
    BODY: string;
    MSG: string;
    LBLOB: string;
    SN: string;
    IPADDRESS: string;
    UPDATETIME: Double;
  end;

var
  SQLHelper: TSQLHelper;
  logger: TLogger;
  QTZHost: string;

implementation

end.
