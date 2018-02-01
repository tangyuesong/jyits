unit uGlobal;

interface

uses
  uLogger, uSQLHelper, uEntity, System.Generics.Collections, Classes,
  uTokenManager, uWSManager;

const
  //cSaUser = 'sa';
  cSaPwd = 'EB8E560662808ED4FAEA1C8AF016055947C4EF17CFD7AFC5390AA126AB25E2A2';

var
  gSQLHelper: TSQLHelper;
  gLogger: TLogger;
  gConfig: TConfig;
  gUserDic: TDictionary<String, TUser>;
  gActionDic: TDictionary<String, TAction>;
  gHttpDic: TDictionary<String, THttpServer>;
  gK08Hpzl: TDictionary<String, TStrings>;
  gK08Clpp: TDictionary<String, String>;
  gK08Csys: TDictionary<String, String>;
  gDevKDBH: TDictionary<String, String>;
  gDevID: TDictionary<String, String>;
  gHpzl: TDictionary<String, String>;
  gHeartbeatUrl: String;
  gHeartbeatInterval: Integer;
  gHaveK08: Boolean;
  gTokenManager: TTokenManager;
  gSaUsers: TStrings;
  gWSManager: TWSManager;

implementation

end.
