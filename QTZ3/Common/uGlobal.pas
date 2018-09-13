unit uGlobal;

interface

uses
  uLogger, uSQLHelper, uEntity, uTokenManager, uWSManager,
  System.Generics.Collections, Classes;

const
  cSaPwd = 'EB8E560662808ED4FAEA1C8AF016055947C4EF17CFD7AFC5390AA126AB25E2A2';
  cDBName = 'YjItsDB';
  cUserKey = 'lgm1224,./';

var
  gSQLHelper: TSQLHelper;
  gLogger: TLogger;
  gConfig: TConfig;
  gTokenManager: TTokenManager;
  gWSManager: TWSManager;
  gHpzl: TDictionary<String, String>;
  gK08Hpzl: TDictionary<String, TStrings>;
  gK08Clpp: TDictionary<String, String>;
  gK08Csys: TDictionary<String, String>;
  gHikID: TDictionary<String, String>;
  gDevKDBH: TDictionary<String, String>;
  gDevID: TDictionary<String, String>;

implementation

end.
