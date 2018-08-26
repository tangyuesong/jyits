unit uRegisterFrame;

interface

uses
  System.Classes;

type

  TRegisterFrame = Class
  public
    class procedure RegisterFrames();
  end;

implementation

uses
  uFrameVioInput, uLock, dxFrames, dxFrame, uFrameVioFH, uFrameVioSH,
  uframeSPDR, uVioTZCLGL, uFrameJJCSY, uFrameSpot, uSpotSearch,
  uToolVioSearch, uToolVioGZGL, UToolVioTXGL, uFrameHBCList, uToolVioJFGL,
  uUnodeVehSearch, UUnodeDrvSearch, UDrvSearch, uVehSearch, uSearchLJ,
  uFrameBlackCheck, uToolbkcj, uFrameJCBK, UPGS, uSearchYJCLKJ,
  uFrameFollowManager, uFrameZFZ, uFrameZFZList, uFrameWFTJ, uFrameLogStat,
  uFrameCrashManager, UToolNocturnal, UWFXWGL, uFrameGCTJ, uFrameVIOLRRYTJ,
  uFrameBetweenManager, uDeviceGL, uToolUserManage, uToolRoleManage,
  UFrameDEPT1, UFrameTJFine, uToolYJQSFK, uPassSearch, uToolDataRoleManage,
  uFrameIndexGCTJ, UFrameTJJKCJ, UFrameTJZDWFXW, UFrameTJJF, UFrameTjNewDrv,
  UFrameTJWF, UFrameTJNewVeh, UFrameNewWF, UFrameForceFeedback, uFrameJianYi,
  uFrameDCWFFeedback, UToolJSRYQZ, uFrameFineFeedback, uFrameSendSms,
  uFrameYXQZFeedback, uFrameJianYiFeedback, UDcwfSearch, uFrameWFCSJETJ,
  uFramZBGL, uFrameFeedbackResult, uFrameYJLKPH, uFrameDrvLog, uPicSearch,
  UdxGridQDZ, uFrameNtzlist, uFrameGCPD, uFrameFirstEnterManager, uVideoSearch,
  uZHPTFunctionRole, uFrameZHPTDeviceRole, uCarFaceCompare, uFrameLogView,
  uFrameLogTotal, uFrameJTPView, uFrameSecurityLogView, uFrameSecurityLogTotal,
  uDialogPolicySetting;

class procedure TRegisterFrame.RegisterFrames();
begin
  RegisterClasses([TFrameVioInput, TFrameVioFH, TFrameVioSH, TframeSPDR, TfLock,
    TfVioTZCLGL, TToolVioSearch, TToolVioGZGL, TFToolVioTXGL, TFrameHBCList,
    TFtoolVioJFGL, TUnodeVehSearch, TUnodeDrvSearch, TFrameDevSearch,
    TFrameLogStat, TFrameVehSearch, TFrameSearchLJ, TFrameBlackCheck,
    Tftoolbkcj, TFrameJCBK, TFramePGS, TFrameTJJCCJ, TSearchYJCLKJ,
    TFrameTJFine, TFrameFollowManager, TFrameJianYi, TFrameCrashManager,
    TFrameBetweenManager, TFrameJJCSY, TFrameFirstEnterManager, TtoolNocturnal,
    TFrameGCTJ, TFrameVIOLRRYTJ, TFDeviceList, TToolUserManage, TToolRoleManage,
    TFrameWFCSJETJ, TFrameSpot, TFrameDCWFFeedback, TFrameDept, TToolYJQSFK,
    TFrameWFXWGL, TFramePassSearch, TToolDataRoleManage, TFrameTJZDWFXW,
    TFrameTJJF, TFrameTJNewDrv, TFrameTJWF, TFrameTJNewVeh, TFrameNewWF,
    TFrameZFZ, TFrameForceFeedback, TFrameSpotSearch, TFrameIndexGCSJ,
    TFrameYXQZFeedback, TFrameZFZList, TFrameJianYiFeedback, TDcwfSearch,
    TFrameFeedbackResult, TFrameYJLKPH, TFrameDrvLog, TFramePicSearch,
    TFToolJSRYQZ, TFrameFineFeedback, TFrameQDZ, TFrameSendSms, TFrameZBGL,
    TFrameNtzlist, TFrameGCPD, TFrameWFTJ, TFrameVideoSearch, TZHPTFunctionRole,
    TFrameZHPTDeviceRole, TFrameCarFaceCompare, TFrameLogView, TFrameLogTotal,
    TFrameJTPView, TFrameSecurityLogTotal, TFrameSecurityLogView,
    TfDialogPolicySetting]);
end;

end.
