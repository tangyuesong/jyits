unit uGlobal;

interface

uses
  uEntity, SysUtils, Classes, Messages, uLogger, uUserPower;

const
  TVIS_CHECKED = $2000;
  key = 'lgm1224,./';
  Expostkey = 'sky,./840112';
  sdxFirstSelectedSkinName = 'Blue';

  UM_Back = WM_USER + 110;

var
  gSetup: Tsetup;
  gGpySetup: TGPY;
  gClientIP: string;
  gUser: TUser;
  gLogger: TLogger;
  gUserPower: TUserPower;
  gIsSa: Boolean = False;
  gHaveK08: Boolean;
  gIsLogout: Boolean = False;
  gToken: String = '';

implementation

end.
