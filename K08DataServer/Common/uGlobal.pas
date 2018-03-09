unit uGlobal;

interface

uses
  uLogger, uSQLHelper, System.Generics.Collections, Classes, uEntity,
  uPassReader;

var
  gSQLHelper: TSQLHelper;
  gLogger: TLogger;
  gDBConfig: TDBConfig;
  gHikConfig: THikConfig;
  gDicDevice: TDictionary<string, TDevice>;
  gHeartbeatUrl: String;
  gHeartbeatInterval: Integer;
  gStartTime: String;
  gJobNum: Integer;
  gPassReader: TPassReader;

implementation

end.
