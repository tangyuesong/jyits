unit uGlobal;

interface

uses
  uLogger, uSQLHelper, uEntity, uTokenManager, uWSManager;

const
  cSaPwd = 'EB8E560662808ED4FAEA1C8AF016055947C4EF17CFD7AFC5390AA126AB25E2A2';
  cDBName = 'L2Test';
  cUserKey = 'lgm1224,./';

var
  gSQLHelper: TSQLHelper;
  gLogger: TLogger;
  gConfig: TConfig;
  gTokenManager: TTokenManager;
  gWSManager: TWSManager;

implementation

end.
