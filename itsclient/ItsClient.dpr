program ItsClient;
{$I ItsClient.inc }

uses
  Vcl.Forms,
  Winapi.Windows,
  Vcl.Dialogs,
  wxoExec in 'Common\wxoExec.pas' {,
    uMain in 'uMain.pas' {FrmMain},
  uMain in 'Main\uMain.pas' {FrameBaseView},
  uDM in 'Common\uDM.pas' {DM: TDataModule},
  uLoginWeb in 'Main\uLoginWeb.pas' {FrmLoginWeb},
  uLogin in 'Main\uLogin.pas' {FrmLogin},
  uVioThread in 'JTWFGL\uVioThread.pas',
  dxFrame in 'BaseFrame\dxFrame.pas' {dxFrame: TFrame},
  dxFrames in 'BaseFrame\dxFrames.pas',
  dxGridFrame in 'BaseFrame\dxGridFrame.pas' {dxGridFrame: TFrame},
  uGlobal in 'Common\uGlobal.pas',
  Udictionary in 'Common\Udictionary.pas',
  uJsonUtils in 'Common\uJsonUtils.pas',
  USetup in 'Common\USetup.pas',
  uRequestItf in 'Common\uRequestItf.pas',
  dxToolGridFrame in 'BaseFrame\dxToolGridFrame.pas' {ToolGridFrame: TFrame},
  cLockVio in 'Common\cLockVio.pas',
  dxDialogBase in 'BaseFrame\dxDialogBase.pas' {dxDialogBaseFrame: TFrame},
  uEntity in 'Common\uEntity.pas',
  uCommon in 'Common\uCommon.pas',
  uColumnGenerator in 'Common\uColumnGenerator.pas',
  uLookUpDataSource in 'Common\uLookUpDataSource.pas',
  uFrameSelectDev in 'JTWFGL\uFrameSelectDev.pas' {FrameSelectDev: TFrame},
  uFrameVioInput in 'JTWFGL\uFrameVioInput.pas' {FrameVioInput},
  UFrameWmd in 'JTWFGL\UFrameWmd.pas' {FrameWmd: TFrame},
  uLock in 'JTWFGL\uLock.pas' {fLock: TFrame},
  uVioTZCLGL in 'JTWFGL\uVioTZCLGL.pas' {fVioTZCLGL: TFrame},
  UToolVioGZGL in 'JTWFGL\UToolVioGZGL.pas' {ToolVioGZGL: TFrame},
  UFrameWFGZ in 'JTWFGL\UFrameWFGZ.pas' {FrameWFGZ: TFrame},
  UToolVioTXGL in 'JTWFGL\UToolVioTXGL.pas' {FToolVIOTXGL: TFrame},
  UFrameTXGL in 'JTWFGL\UFrameTXGL.pas' {FrameTXGL: TFrame},
  UToolVioJFGL in 'JTWFGL\UToolVioJFGL.pas' {FToolVioJFGL: TFrame},
  UFrameVioJFGL in 'JTWFGL\UFrameVioJFGL.pas' {FrameVioJFGL: TFrame},
  UFrameHBCList in 'JTWFGL\UFrameHBCList.pas' {FrameHBCList: TFrame},
  dxImport in 'BaseFrame\dxImport.pas' {dxImportDialog: TFrame},
  uFrameHBCImport in 'JTWFGL\uFrameHBCImport.pas' {FrameImportHBC: TFrame},
  uFrameHBCEdit in 'JTWFGL\uFrameHBCEdit.pas' {FrameHBCEdit: TFrame},
  uFrameBz in 'JTWFGL\uFrameBz.pas' {frameBz: TFrame},
  UDrvSearch in 'ZHXXCX\UDrvSearch.pas' {FrameDevSearch: TFrame},
  UVehSearch in 'ZHXXCX\UVehSearch.pas' {FrameVehSearch: TFrame},
  uFrameSPDR in 'JTWFGL\uFrameSPDR.pas' {frameSPDR: TFrame},
  uFrameJCBK in 'BKGJGL\uFrameJCBK.pas' {FrameJCBK: TFrame},
  UToolBKCJ in 'BKGJGL\UToolBKCJ.pas' {FToolBKCJ: TFrame},
  uFrameVioFH in 'JTWFGL\uFrameVioFH.pas' {FrameVioFH: TFrame},
  UFrameJFVideo in 'JTWFGL\UFrameJFVideo.pas' {FrameJFVideo: TFrame},
  UFrameJFFTP in 'JTWFGL\UFrameJFFTP.pas' {dxDialogBaseFrame3: TFrame},
  uFrameBlackCheck in 'BKGJGL\uFrameBlackCheck.pas' {FrameBlackCheck: TFrame},
  UFrameBKCJ in 'BKGJGL\UFrameBKCJ.pas' {FrameBKCJ: TFrame},
  USearchYJCLKJ in 'BKGJGL\USearchYJCLKJ.pas' {SearchYJCLKJ: TFrame},
  UToolYJQSFK in 'BKGJGL\UToolYJQSFK.pas' {ToolYJQSFK: TFrame},
  dxpicdata in 'BaseFrame\dxpicdata.pas' {dxFramePicData: TFrame},
  uToolVioSearch in 'JTWFGL\uToolVioSearch.pas' {ToolVioSearch: TFrame},
  uFrameFeedback in 'BKGJGL\uFrameFeedback.pas' {FrameFeedback: TFrame},
  uRegisterFrame in 'Common\uRegisterFrame.pas',
  uFrameVioEdit in 'JTWFGL\uFrameVioEdit.pas' {FrameVioEdit: TFrame},
  UFrameJFPic in 'JTWFGL\UFrameJFPic.pas' {FrameJFPic: TFrame},
  UFrameDeviceEdit in 'XTYXGL\UFrameDeviceEdit.pas' {FrameDeviceEdit: TFrame},
  UFrameWFXWEdit in 'XTYXGL\UFrameWFXWEdit.pas' {FrameWFXWEdit: TFrame},
  UWFXWGL in 'XTYXGL\UWFXWGL.pas' {FrameWFXWGL: TFrame},
  USearchLJ in 'ZHXXCX\USearchLJ.pas' {FrameSearchLJ: TFrame},
  UUnodeVehSearch in 'ZHXXCX\UUnodeVehSearch.pas' {UnodeVehSearch: TFrame},
  UUnodeDrvSearch in 'ZHXXCX\UUnodeDrvSearch.pas' {UnodeDrvSearch: TFrame},
  uPassSearch in 'ZHXXCX\uPassSearch.pas' {FramePassSearch: TFrame},
  dxFrameStat in 'BaseFrame\dxFrameStat.pas' {FrameStat: TFrame},
  UFrameTJFine in 'SJTJFX\UFrameTJFine.pas' {FrameStat1: TFrame},
  uUserPower in 'Common\uUserPower.pas',
  uToolUserManage in 'XTYXGL\uToolUserManage.pas' {ToolUserManage: TFrame},
  uToolRoleManage in 'XTYXGL\uToolRoleManage.pas' {ToolRoleManage: TFrame},
  uToolDataRoleManage in 'XTYXGL\uToolDataRoleManage.pas' {ToolDataRoleManage: TFrame},
  UDeviceGL in 'XTYXGL\UDeviceGL.pas' {FDeviceList: TFrame},
  cxGridStrs in 'Common\cxGridStrs.pas',
  uFrameRoleEdit in 'XTYXGL\uFrameRoleEdit.pas' {FrameRoleEdit: TFrame},
  uFrameRoleUserEdit in 'XTYXGL\uFrameRoleUserEdit.pas' {FrameRoleUserEdit: TFrame},
  uFrameDataRoleEdit in 'XTYXGL\uFrameDataRoleEdit.pas' {FrameDataRoleEdit: TFrame},
  uFrameDataRoleUserEdit in 'XTYXGL\uFrameDataRoleUserEdit.pas' {FrameDataRoleUserEdit: TFrame},
  uDialogUserEdit in 'XTYXGL\uDialogUserEdit.pas' {fDialogUserEdit: TFrame},
  uFrameSetUserRole in 'XTYXGL\uFrameSetUserRole.pas' {FrameSetUserRole: TFrame},
  uFrameSetUserDataRole in 'XTYXGL\uFrameSetUserDataRole.pas' {FrameSetUserDataRole: TFrame},
  UFrameTJZDWFXW in 'SJTJFX\UFrameTJZDWFXW.pas' {FrameTJZDWFXW: TFrame},
  UFrameTJJF in 'SJTJFX\UFrameTJJF.pas' {FrameTJJF: TFrame},
  UFrameTjNewDrv in 'SJTJFX\UFrameTjNewDrv.pas' {FrameTJNewDrv: TFrame},
  UFrameTJWF in 'SJTJFX\UFrameTJWF.pas' {FrameTJWF: TFrame},
  UFrameTJNewVeh in 'SJTJFX\UFrameTJNewVeh.pas' {FrameTJNewVeh: TFrame},
  UFrameNewWF in 'SJTJFX\UFrameNewWF.pas' {FrameNewWF: TFrame},
  uModifyPwd in 'Main\uModifyPwd.pas' {frmModifyPwd},
  uLogger in 'Common\uLogger.pas',
  UFrameDEPT1 in 'XTYXGL\UFrameDEPT1.pas' {FrameDept: TFrame},
  LatLngHelper in 'Common\LatLngHelper.pas',
  QBAes in 'Common\QBAes.pas',
  UnitFrameCustom in 'BaseFrame\UnitFrameCustom.pas' {CustomInfoFrame: TFrame},
  JsProcessor in 'Common\JsProcessor.pas',
  Ucxgridfileds in 'Common\Ucxgridfileds.pas',
  ElAES in 'Common\ElAES.pas',
  uFrameSign in 'BKGJGL\uFrameSign.pas' {FrameSign: TFrame},
  uFrameTaskManager in 'DataAnalyse\uFrameTaskManager.pas' {FrameTaskManager: TFrame},
  UToolNocturnal in 'DataAnalyse\UToolNocturnal.pas' {ToolNocturnal: TFrame},
  uFrameCrashManager in 'DataAnalyse\uFrameCrashManager.pas' {FrameCrashManager: TFrame},
  uFrameBetweenManager in 'DataAnalyse\uFrameBetweenManager.pas' {FrameBetweenManager: TFrame},
  uFrameFollowManager in 'DataAnalyse\uFrameFollowManager.pas' {FrameFollowManager: TFrame},
  UFrameAddCrash in 'DataAnalyse\UFrameAddCrash.pas' {FrameAddCrash: TFrame},
  UFrameAddBetween in 'DataAnalyse\UFrameAddBetween.pas' {FrameAddBetween: TFrame},
  UFrameAddFollow in 'DataAnalyse\UFrameAddFollow.pas' {FrameAddFollow: TFrame},
  uFrameVIOLRRYTJ in 'SJTJFX\uFrameVIOLRRYTJ.pas' {FrameVIOLRRYTJ: TFrame},
  uFrameGCTJ in 'SJTJFX\uFrameGCTJ.pas' {FrameGCTJ: TFrame},
  HeatmapItem in 'Common\HeatmapItem.pas',
  dxSkin in 'Common\dxSkin.pas',
  uFrameInput in 'BKGJGL\uFrameInput.pas' {FrameInput: TFrame},
  cxCalendar in 'BaseFrame\cxCalendar.pas',
  uFrameForceFeedback in 'BKGJGL\uFrameForceFeedback.pas' {FrameForceFeedback: TFrame},
  uFrameFeedbackBase in 'BKGJGL\uFrameFeedbackBase.pas' {FrameFeedbackBase: TFrame},
  UFrameIndexGCTJ in 'SJTJFX\UFrameIndexGCTJ.pas' {FrameIndexGCSJ: TFrame},
  UFrameTJJKCJ in 'SJTJFX\UFrameTJJKCJ.pas' {FrameTJJCCJ: TFrame},
  uFrameLogin in 'Main\uFrameLogin.pas' {FrameLogin: TFrame},
  uFrameSignBase in 'BKGJGL\uFrameSignBase.pas' {FrameSignBase: TFrame},
  uFrameDevicePic in 'Main\uFrameDevicePic.pas' {FrameDevicePic: TFrame},
  sfContnrs in 'Common\sfContnrs.pas',
  uFrameYXQZFeedback in 'BKGJGL\uFrameYXQZFeedback.pas' {FrameYXQZFeedback: TFrame},
  uFrameJianYiFeedback in 'BKGJGL\uFrameJianYiFeedback.pas' {FrameJianYiFeedback: TFrame},
  UDcwfSearch in 'ZHXXCX\UDcwfSearch.pas' {DcwfSearch: TFrame},
  uFrameResult in 'DataAnalyse\uFrameResult.pas' {FrameResult: TFrame},
  UFrameWFCSJETJ in 'SJTJFX\UFrameWFCSJETJ.pas' {FrameWFCSJETJ: TFrame},
  uFrameDCWFFeedback in 'BKGJGL\uFrameDCWFFeedback.pas' {FrameDCWFFeedback: TFrame},
  uFrameFeedbackResult in 'BKGJGL\uFrameFeedbackResult.pas' {FrameFeedbackResult: TFrame},
  uFrameYJLKPH in 'DataAnalyse\uFrameYJLKPH.pas' {FrameYJLKPH: TFrame},
  uFrameTJJFDetail in 'SJTJFX\uFrameTJJFDetail.pas' {FrameTJJFDetail: TFrame},
  uFrameDrvLog in 'SJTJFX\uFrameDrvLog.pas' {FrameDrvLog: TFrame},
  uPicSearch in 'ZHXXCX\uPicSearch.pas' {FramePicSearch: TFrame},
  UToolJSRYQZ in 'JTWFGL\UToolJSRYQZ.pas' {FToolJSRYQZ: TFrame},
  UFrameJSRYQZ in 'JTWFGL\UFrameJSRYQZ.pas' {FrameJSRYQZ: TFrame},
  UFrameJSRPic in 'JTWFGL\UFrameJSRPic.pas' {FrameJSRPic: TFrame},
  uFrameFineFeedback in 'BKGJGL\uFrameFineFeedback.pas' {FrameFineFeedback: TFrame},
  uFrameWait in 'Main\uFrameWait.pas' {FrameWait: TFrame},
  uFrameVideo in 'Main\uFrameVideo.pas' {FrameVideo: TFrame},
  FHNSBSATXLib_TLB in 'Component\FHNSBSATXLib_TLB.pas',
  FHNSBSDLGATXLib_TLB in 'Component\FHNSBSDLGATXLib_TLB.pas',
  FHZWNDOCXLib_TLB in 'Component\FHZWNDOCXLib_TLB.pas',
  UdxGridQDZ in 'ZHGL\UdxGridQDZ.pas' {FrameQDZ: TFrame},
  UFrameQDZGL in 'ZHGL\UFrameQDZGL.pas' {FrameQDZGL: TFrame},
  UFrameQDZRYSBSP in 'ZHGL\UFrameQDZRYSBSP.pas' {FrameQDZRYSBSP: TFrame},
  uFrameSendSms in 'ZHGL\uFrameSendSms.pas' {frameSendSms: TFrame},
  uFrameAddSms in 'ZHGL\uFrameAddSms.pas' {FrameAddSms: TFrame},
  uFrameNtzlist in 'ZHGL\uFrameNtzlist.pas' {FrameNtzlist: TFrame},
  uFrameNtzEdit in 'ZHGL\uFrameNtzEdit.pas' {FrameNtzEdit: TFrame},
  UFrameRYGL in 'ZHGL\UFrameRYGL.pas' {FrameRYGL: TFrame},
  UFrameQDZSB in 'ZHGL\UFrameQDZSB.pas' {FrameQDZSB: TFrame},
  UFrameQDZSP in 'ZHGL\UFrameQDZSP.pas' {FrameQDZSP: TFrame},
  UFrameMap in 'Common\UFrameMap.pas' {FrameMap: TFrame},
  uFrameQDZViewBase in 'ZHGL\View\uFrameQDZViewBase.pas' {FrameQDZViewBase: TFrame},
  uFrameQDZView in 'ZHGL\View\uFrameQDZView.pas' {FrameQDZView: TFrame},
  uFrameQDZViewDev in 'ZHGL\View\uFrameQDZViewDev.pas' {FrameQDZViewDev: TFrame},
  uFramZBGL in 'ZHGL\uFramZBGL.pas' {FrameZBGL: TFrame},
  uFrameCreateZBList in 'ZHGL\uFrameCreateZBList.pas' {FrameCreateZBList: TFrame},
  uFrameZBGL_RY in 'ZHGL\uFrameZBGL_RY.pas' {FrameZBGL_RY: TFrame},
  uFrameRYEdit in 'ZHGL\uFrameRYEdit.pas' {FrameRYEdit: TFrame},
  uFrameQDZDlg in 'Main\uFrameQDZDlg.pas' {FrameQDZDlg: TFrame},
  dxViodata in 'BKGJGL\dxViodata.pas' {dxFrameVioData: TFrame},
  uFrameVioSH in 'JTWFGL\uFrameVioSH.pas' {FrameVioSH: TFrame},
  uFrameAddNocturnal in 'DataAnalyse\uFrameAddNocturnal.pas' {FrameAddNocturnal: TFrame},
  uUpdate in 'Main\uUpdate.pas' {frmUpdate},
  uFrameZFZ in 'BKGJGL\uFrameZFZ.pas' {FrameZFZ: TFrame},
  uFrameZFZList in 'BKGJGL\uFrameZFZList.pas' {FrameZFZList: TFrame},
  uFrameInputWS in 'BKGJGL\uFrameInputWS.pas' {FrameInputWS: TFrame},
  uFrameGCPD in 'DataAnalyse\uFrameGCPD.pas' {FrameGCPD: TFrame},
  UFrameAddFirstEnter in 'DataAnalyse\UFrameAddFirstEnter.pas' {FrameAddFirstEnter: TFrame},
  uFrameFirstEnterManager in 'DataAnalyse\uFrameFirstEnterManager.pas' {FrameFirstEnterManager: TFrame},
  uFrameWFTJ in 'SJTJFX\uFrameWFTJ.pas' {FrameWFTJ: TFrame},
  uFrameJianYi in 'XCWFGL\uFrameJianYi.pas' {FrameJianYi: TFrame},
  uVideoSearch in 'ZHXXCX\uVideoSearch.pas' {FrameVideoSearch: TFrame},
  uFrameMainMap in 'Main\uFrameMainMap.pas' {FrameMainMap: TFrame},
  uFrameAlarmVehImport in 'BKGJGL\uFrameAlarmVehImport.pas',
  uFrameZDTotal in 'SJTJFX\uFrameZDTotal.pas' {FrameZDTotal: TFrame};

{$R *.res}

var
  b: Boolean;

begin
  try
    Application.Initialize;
    b := False;
    TCommon.AppInitialization;
    Application.Title := gSetup.AppTitle;
    Application.CreateForm(TDM, DM);
  // Application.CreateForm(TfrmUpdate, frmUpdate);
{$IFDEF WEBXONE}
    FrmloginWeb := TFrmloginWeb.Create(Application);
    FrmloginWeb.ShowModal;
    // FrmloginWeb.FrameLogin.edtUser.Text := _wxoGetUrl;
    if FrmloginWeb.Tag > 0 then
      b := True
    else
      wxoClose;
    FrmloginWeb.Free;
{$ELSE}
    Application.MainFormOnTaskbar := True;
    b := CheckLogin;
{$ENDIF}
    if b then
    begin
      TCommon.InitSetup;
      TLZDictionary.InitSetupDic;
      TLookUpDataSource.InitDataSource;
      Application.CreateForm(TFrmMain, FrmMain);
    end;
    Application.Run;
    TCommon.AppFinalization;
  except
  end;

end.
