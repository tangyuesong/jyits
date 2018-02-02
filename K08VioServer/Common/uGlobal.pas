unit uGlobal;

interface

uses
  uLogger, uSQLHelper, System.Generics.Collections, Classes;

type
  TDBConfig = Record
    DBServer: String;
    DBPort: Integer;
    DBUser: String;
    DBPwd: String;
    DBName: String;
  end;

  TDevice = Record
    ID: String;
    SBBH: String;
    CJJG: String;
  end;

  THikConfig = Record
    K08SearchURL: String;
    K08SaveUrl: String;
    DFUrl: String;
    DFUser: String;
    DFPwd: String;
  End;

  TThreadConfig = Record
    PilotsafebeltThreadRun: Boolean;
    NoEntryThreadRun: Boolean;
    LC25NoEntryThreadRun: Boolean;
    PilotsafebeltStartTime: String;
    NoEntryStartTime: String;
    LC25NoEntryStartDate: String;
    PilotsafebeltDev: String;
    NoEntryDev: String;
    LC25NoEntryDev: String;
  End;

var
  gSQLHelper: TSQLHelper;
  gLogger: TLogger;
  gDBConfig: TDBConfig;
  gHikConfig: THikConfig;
  gThreadConfig: TThreadConfig;
  gDevList: TDictionary<string, TDevice>;
  gHpzlList: TDictionary<string, String>;
  gHpzl: TDictionary<String, String>;
  gK08Hpzl: TDictionary<String, TStrings>;
  gK08Clpp: TDictionary<String, String>;
  gK08Csys: TDictionary<String, String>;
  gDevKDBH: TDictionary<String, String>;
  gDevID: TDictionary<String, String>;
  gHeartbeatUrl: String;
  gHeartbeatInterval: Integer;

implementation

end.
