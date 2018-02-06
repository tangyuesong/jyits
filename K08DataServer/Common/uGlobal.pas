unit uGlobal;

interface

uses
  uLogger, uSQLHelper, System.Generics.Collections, Classes, uEntity;

var
  gSQLHelper: TSQLHelper;
  gLogger: TLogger;
  gDBConfig: TDBConfig;
  gHikConfig: THikConfig;
  gDicDevice: TDictionary<string, TDevice>;
  gHeartbeatUrl: String;
  gHeartbeatInterval: Integer;
  gStartTime: String;
  gCJJG: String;
  gTaskMi: string;
  gTaskRunning: Boolean;

implementation

end.
