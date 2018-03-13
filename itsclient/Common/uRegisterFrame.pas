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
  uframeSPDR, uVioTZCLGL, uFrameJTPList, uFrameJTPCheck,
  uToolVioSearch, uToolVioGZGL, UToolVioTXGL, uFrameHBCList, uToolVioJFGL,
  uUnodeVehSearch, UUnodeDrvSearch, UDrvSearch, uVehSearch, uSearchLJ,
  uFrameBlackCheck, uToolbkcj, uFrameJCBK, uSearchYJCLKJ,
  uFrameFollowManager, uFrameZFZ, uFrameZFZList, uFrameWFTJ,
  uFrameCrashManager, UToolNocturnal, UWFXWGL, uFrameGCTJ, uFrameVIOLRRYTJ,
  uFrameBetweenManager, uDeviceGL, uToolUserManage, uToolRoleManage,
  UFrameDEPT1, UFrameTJFine, uToolYJQSFK, uPassSearch, uToolDataRoleManage,
  uFrameIndexGCTJ, UFrameTJJKCJ, UFrameTJZDWFXW, UFrameTJJF, UFrameTjNewDrv,
  UFrameTJWF, UFrameTJNewVeh, UFrameNewWF, UFrameForceFeedback, uFrameJianYi,
  uFrameDCWFFeedback, UToolJSRYQZ, uFrameFineFeedback, uFrameSendSms,
  uFrameYXQZFeedback, uFrameJianYiFeedback, UDcwfSearch, uFrameWFCSJETJ,
  uFramZBGL, uFrameFeedbackResult, uFrameYJLKPH, uFrameDrvLog, uPicSearch,
  UdxGridQDZ, uFrameNtzlist, uFrameGCPD, uFrameFirstEnterManager, uVideoSearch,
  uFrameTjWfcl,UFrameSDCLList;

class procedure TRegisterFrame.RegisterFrames();
begin
  RegisterClasses([TFrameVioInput, TFrameVioFH, TFrameVioSH, TframeSPDR, TfLock,
    TfVioTZCLGL, TToolVioSearch, TToolVioGZGL, TFToolVioTXGL, TFrameHBCList,
    TFtoolVioJFGL, TUnodeVehSearch, TUnodeDrvSearch, TFrameDevSearch,
    TFrameVehSearch, TFrameSearchLJ, TFrameBlackCheck, Tftoolbkcj, TFrameJCBK,
    TFrameTJJCCJ, TSearchYJCLKJ, TFrameTJFine, TFrameFollowManager,
    TFrameJianYi, TFrameCrashManager, TFrameBetweenManager, TFrameJTPList,
    TFrameFirstEnterManager, TtoolNocturnal, TFrameGCTJ, TFrameVIOLRRYTJ,
    TFDeviceList, TToolUserManage, TToolRoleManage, TFrameWFCSJETJ,
    TFrameDCWFFeedback, TFrameDept, TToolYJQSFK, TFrameWFXWGL, TFramePassSearch,
    TToolDataRoleManage, TFrameTJZDWFXW, TFrameTJJF, TFrameTJNewDrv, TFrameTJWF,
    TFrameTJNewVeh, TFrameNewWF, TFrameZFZ, TFrameForceFeedback, TFrameJTPCheck,
    TFrameIndexGCSJ, TFrameYXQZFeedback, TFrameZFZList, TFrameJianYiFeedback,
    TDcwfSearch, TFrameFeedbackResult, TFrameYJLKPH, TFrameDrvLog,
    TFramePicSearch, TFToolJSRYQZ, TFrameFineFeedback, TFrameQDZ, TFrameSendSms,
    TFrameZBGL, TFrameNtzlist, TFrameGCPD, TFrameWFTJ, TFrameVideoSearch,
    TFrameTjWfcl,TFrameSDCLList]);
end;

end.
