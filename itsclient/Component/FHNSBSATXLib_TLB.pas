unit FHNSBSATXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 2017/6/4 10:08:43 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\Eyeshot6000BSOCX\FhnSBSAtx.ocx (1)
// LIBID: {D3A123CA-0551-4A83-B94B-79447D447064}
// LCID: 0
// Helpfile: C:\Program Files (x86)\Eyeshot6000BSOCX\FhnSBSAtx.hlp 
// HelpString: FhnSBSAtx ActiveX Control module
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Parameter 'type' of _DFhnSBSAtx.FhnSBSChannelInfoDlg changed to 'type_'
//   Hint: Parameter 'type' of _DFhnSBSAtx.FhzIsOpen changed to 'type_'
//   Hint: Parameter 'type' of _DFhnSBSAtx.FhnSBSSliteFlash changed to 'type_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleCtrls, Vcl.OleServer, Winapi.ActiveX;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  FHNSBSATXLibMajorVersion = 1;
  FHNSBSATXLibMinorVersion = 0;

  LIBID_FHNSBSATXLib: TGUID = '{D3A123CA-0551-4A83-B94B-79447D447064}';

  DIID__DFhnSBSAtx: TGUID = '{2B1B50DB-6EA0-4C86-B7B4-52771FB3AA86}';
  DIID__DFhnSBSAtxEvents: TGUID = '{8CA340B9-7DB4-41B9-B66E-88F101546E4E}';
  CLASS_FhnSBSAtx: TGUID = '{B8052A2C-4D10-40B8-8A77-455900FF64F5}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DFhnSBSAtx = dispinterface;
  _DFhnSBSAtxEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  FhnSBSAtx = _DFhnSBSAtx;


// *********************************************************************//
// DispIntf:  _DFhnSBSAtx
// Flags:     (4112) Hidden Dispatchable
// GUID:      {2B1B50DB-6EA0-4C86-B7B4-52771FB3AA86}
// *********************************************************************//
  _DFhnSBSAtx = dispinterface
    ['{2B1B50DB-6EA0-4C86-B7B4-52771FB3AA86}']
    property FhnPropPtzStep: Integer dispid 1;
    property FhnPropCapPath: WideString dispid 2;
    property FhnPropRecPath: WideString dispid 3;
    function FhnSBSInitial(const serverip: WideString; serverport: Smallint): Integer; dispid 4;
    function FhnSBSLogin(const UserName: WideString; const PassWord: WideString): Integer; dispid 5;
    function FhnSBSRTVideoReq(const PUID: WideString; ChannelNo: Integer; 
                              const ChannelName: WideString; Reserved1: Integer; Reserved2: Integer): Integer; dispid 6;
    function FhnSBSPTZReq(OperateID: Integer; Reserved1: Integer; Reserved2: Integer): Integer; dispid 7;
    function FhnSBSSpeakReq(const PUID: WideString; ChannelNo: Integer; const PUName: WideString; 
                            Reserved1: Integer; Reserved2: Integer): Integer; dispid 8;
    function FhnSBSRecordPlay(const PUID: WideString; ChannelNo: Integer; StoreType: Integer; 
                              const FileName: WideString; Reserved1: Integer; Reserved2: Integer): Integer; dispid 9;
    function FhnSBSRecordQeury(const PUID: WideString; ChannelNo: Integer; StoreType: Integer; 
                               FileType: Integer; StartTime: Integer; EndTime: Integer; 
                               ReceivedNum: Integer; Reserved: Integer; Reserved1: Integer): Integer; dispid 10;
    function FhnSBSDestoy: Integer; dispid 11;
    function FhnSBSLogOut: Integer; dispid 12;
    function FhnSBSGetDisplayParam(const PUID: WideString; ChannelNo: Integer): Integer; dispid 13;
    function FhnSBSSetDisplayParam(const PUID: WideString; ChannelNo: Integer; Contrast: Integer; 
                                   Bright: Integer; Hue: Integer; Saturation: Integer): Integer; dispid 14;
    function FhnSBSGetVersion: WideString; dispid 15;
    function FhnSBSSetServerVersion(version: Smallint): WordBool; dispid 16;
    function FhnSBSInitial2(const serverip: WideString; serverport: Smallint; 
                            const serverid: WideString): Integer; dispid 17;
    function FhnSBSSetDisplayParam2(const PUID: WideString; ChannelNo: Integer; Contrast: Integer; 
                                    Bright: Integer; Hue: Integer; Saturation: Integer; 
                                    Whiteness: Integer): Integer; dispid 18;
    procedure FhnSBSSetDeviceList(const DeviceListStr: WideString; Reserved: Integer); dispid 19;
    function FHNSBSParamSet(const PUID: WideString; ChannelNo: Integer; ChannelType: Integer; 
                            OperateID: Integer; Reserved1: Integer; Reserved2: Integer): Integer; dispid 20;
    function FhnSBSPictureQuery(const PUID: WideString; ChannelNo: Integer; StoryType: Integer; 
                                FileType: Integer; StartTime: Integer; EndTime: Integer; 
                                ReceiveNum: Integer; QueryCount: Integer): Integer; dispid 21;
    procedure FhnSBSTestStartVideo(channelnum: Smallint); dispid 22;
    function FhnSBSGroupQuery: Integer; dispid 23;
    function FhnSBSPulistQuery(GroupID: Integer): Integer; dispid 24;
    function FhnSBSPuInfoQuery(const PUID: WideString): Integer; dispid 25;
    procedure FHNSBSLocalConfigSet; dispid 26;
    procedure FHNSBSPwdChange; dispid 27;
    function FhnSBSAllGroupQuery: Integer; dispid 28;
    function FhnSBSGisRTVideoReq(x: Smallint; y: Smallint; const PUID: WideString; 
                                 ChannelNo: Integer; const ChannelName: WideString; 
                                 Reserved1: Integer; Reserved2: Integer): Integer; dispid 29;
    procedure FhnSBSTestRecordPlay; dispid 30;
    function FhnSBSGetPreset(const PUID: WideString; ChannelNo: Integer): Integer; dispid 31;
    function FhnSBSCallPreset(const PUID: WideString; ChannelNo: Integer; 
                              const ChannelName: WideString; PresetIndex: Smallint; 
                              Reserved1: Integer; Reserved2: Integer): Integer; dispid 32;
    function FHNSBSGetChannel(const PUID: WideString): Integer; dispid 33;
    function FhnSBSAlarmReport(const PUID: WideString; ChannelNo: Integer; AlarmType: Integer; 
                               const AlarmTime: WideString; const UserData: WideString; 
                               Reserved1: Integer; Reserved2: Integer): Integer; dispid 34;
    function FhnSBSRecDownload(PUID: {NOT_OLEAUTO(PWideChar)}OleVariant; ChannelNo: Integer; 
                               DownloadType: Integer; FileName: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                               StartTime: Integer; EndTime: Integer; 
                               DownloadName: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                               StoreType: Integer; FileType: Integer; Reserved: Integer): Integer; dispid 35;
    function FhnSBSBroadcastReq(const PuidList: WideString; ChannelNo: Integer; 
                                AudioFormat: Integer; Reserved1: Integer; Reserved2: Integer): Integer; dispid 36;
    function FhnSBSBroadcastStop(BroadcastHandle: Integer; Reserved1: Integer; Reserved2: Integer): Integer; dispid 37;
    function FhnSBSMatrixReq(const PUID: WideString; ChannelNo: Integer; 
                             const ChannelName: WideString; const DUID: WideString; 
                             DuChannelNo: Integer; Reserved1: Integer; Reserved2: Integer): Integer; dispid 38;
    function FhnSBSMatrixStop(const PUID: WideString; ChannelNo: Integer; 
                              const ChannelName: WideString; const DUID: WideString; 
                              DuChannelNo: Integer; Reserved1: Integer; Reserved2: Integer): Integer; dispid 39;
    function FhnSBSMatrixQuery(const DUID: WideString; DuChannelNo: Integer; Reserved1: Integer; 
                               Reserved2: Integer): Integer; dispid 40;
    function FhnSBSSpeakQuery(const UserData: WideString; Reserved1: Integer; Reserved2: Integer): Integer; dispid 41;
    function FhnSBSPlayVideo(hWnd: Integer; const PUID: WideString; ChannelNo: Integer): Integer; dispid 42;
    function FhnSBSStopVideo(CallID: Integer): Integer; dispid 43;
    function FhnSBSPlayVideoEx(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                               Reserved1: Integer; Reserved2: Integer): Integer; dispid 44;
    function FhnSBSPTZControl(const PUID: WideString; ChannelNo: Integer; OperateID: Integer; 
                              Param1: Integer; Param2: Integer): Integer; dispid 45;
    function FhnSBSStartLocalRecord(CallID: Integer): Integer; dispid 46;
    function FhnSBSStopLocalRecord(CallID: Integer): Integer; dispid 47;
    function FhnSBSServerCap(const PUID: WideString; ChannelNo: Integer): Integer; dispid 48;
    function FhnSBSStartServerRecord(const PUID: WideString; ChannelNo: Integer): Integer; dispid 49;
    function FhnSBSPlayRecordByTime(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                                    StartTime: Integer; EndTime: Integer; StoreType: Integer; 
                                    FileType: Integer; Reserved: Integer): Integer; dispid 50;
    function FhnSBSStopPlayRecord(CallID: Integer): Integer; dispid 51;
    function FhnSBSSpeak(const PUID: WideString; ChannelNo: Integer): Integer; dispid 52;
    function FhnSBSBroadcast(const PuidList: WideString; ChannelNo: Integer; AudioFormat: Integer): Integer; dispid 53;
    function FhnSBSStopAudio(CallID: Integer): Integer; dispid 54;
    function FhnSBSLoginEx(const UserName: WideString; const PassWord: WideString): Integer; dispid 55;
    function FhnSBSPictureDownLoad(const FileName: WideString; const loadpath: WideString): Integer; dispid 56;
    function FhnSBSStartRecordAudio: Integer; dispid 57;
    function FhnSBSStopRecordAudio: Integer; dispid 58;
    function FHNSBSStartRecordPlay(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                                   StoreType: Integer; const FileName: WideString; 
                                   Reserved1: Integer; Reserved2: Integer): Integer; dispid 59;
    procedure FhnSBSChannelInfoDlg(const PUID: WideString; channelid: Integer; type_: Integer); dispid 60;
    function FhnSBSGroupOnly: Integer; dispid 61;
    function FHNSBSGetVideoEncodeReq(const PUID: WideString; ChannelNo: Integer): Integer; dispid 62;
    function FHNSBSSetVideoEncodeReq(const PUID: WideString; ChannelNo: Integer; BitRate: Integer; 
                                     BitRateType: Integer; EncodeMode: Integer; FrameRate: Integer; 
                                     IFrameInterval: Integer; ImageSize: Integer; 
                                     PicQuality: Integer): Integer; dispid 63;
    function FhnSBSLocalCap(CallID: Integer; CapType: Integer; const FileName: WideString): Integer; dispid 64;
    function FhnSBSStoptServerRecord(const PUID: WideString; ChannelNo: Integer): Integer; dispid 65;
    function FhnSBSSetOsdDisplay(const PUID: WideString; ChannelNo: Integer; bitmapX: Integer; 
                                 bitmapY: Integer; bitmapTextX: Integer; bitmapTextY: Integer; 
                                 bitmapTimeEnable: WordBool; bitmapTextEnable: WordBool; 
                                 const bitmapText: WideString): Integer; dispid 66;
    function FhnSBSGetPresetNode(const PUID: WideString; ChannelNo: Integer; Handle: Integer): Integer; dispid 67;
    function FhnSBSAddPresetNode(const PUID: WideString; ChannelNo: Integer; NewIndex: Integer; 
                                 const NewName: WideString): Integer; dispid 68;
    function FhnSBSDeletePresetNode(const PUID: WideString; ChannelNo: Integer; DeleteIndex: Integer): Integer; dispid 69;
    function FhnSBSCallPresetNode(const PUID: WideString; ChannelNo: Integer; CallIndex: Integer): Integer; dispid 70;
    function FhnSBSGetCruiseNode(const PUID: WideString; ChannelNo: Integer): Integer; dispid 71;
    function FhnSBSSetCruiseNode(const PUID: WideString; ChannelNo: Integer; 
                                 const CruiseData: WideString): Integer; dispid 72;
    function FhnSBSStartCruise(const PUID: WideString; ChannelNo: Integer): Integer; dispid 73;
    function FhnSBSStopCruise(const PUID: WideString; ChannelNo: Integer): Integer; dispid 74;
    function GetFhnCtlHandle: Integer; dispid 75;
    function FhnSBSVideoInfo(const PUID: WideString; Channel: Integer; Reserved1: Integer): Integer; dispid 76;
    function FHNSBSRecordControlPlay(lRecHandle: Integer; Operate: Integer; Speed: Integer; 
                                     totoalRecTime: Integer; Rerver1: Integer): Integer; dispid 77;
    function FhnSBSPictureServrCap(const PUID: WideString; ChannelNo: Integer; capQuality: Integer; 
                                   capSize: Integer; capTimes: Integer; reserve1: Integer; 
                                   reserve2: Integer): Integer; dispid 78;
    function fhnGetLongTime(const time: WideString): Integer; dispid 79;
    function FhnSBSNvrGroupRecQuery(CurSwitchTemplate: Integer; uFileType: Integer; 
                                    uStoreType: Integer; const sPuInfo: WideString; 
                                    beginTime: Integer; EndTime: Integer; uQueryStart: Integer; 
                                    uQueryNum: Integer; _lParam: Integer; const _sParam: WideString): Integer; dispid 80;
    function FHNSBSGetVodCurrTime(VODVideoHandle: Integer; const sParam: WideString): Integer; dispid 81;
    function FhnSBSGetOsdDisplay(const PUID: WideString; Channel: Integer; reserve: Integer; 
                                 reserve1: Integer): Integer; dispid 82;
    function FhnSBSQueryAlmPic(const PUID: WideString; ChannelNo: Integer; PicStorePos: Integer; 
                               const AlarmId: WideString; Rerver1: Integer; Rerver2: Integer; 
                               const Rerver3: WideString): Integer; dispid 83;
    function FhnSBSLoadDownRecordByTime(const PUID: WideString; ChannelNo: Integer;
                                        StartTime: Integer; EndTime: Integer; 
                                        const LoaddownPath: WideString; const Reserved: WideString; 
                                        Reserved1: Integer; Reserved2: Integer): Integer; dispid 84;
    function FhnSBSGetRecordReq(const PUID: WideString; ChannelNo: Integer; ChannelType: Integer; 
                                IsPu: Integer; const Resverd: WideString; Resverd1: Integer): Integer; dispid 85;
    function FhnSBSSetRecordReq(const PUID: WideString; ChannelNo: Integer; StoreType: Integer; 
                                const data: WideString; enable1: Integer; const data1: WideString; 
                                enable2: Integer; const data2: WideString; enable3: Integer; 
                                const data3: WideString; const reseved: WideString; 
                                reseved1: Integer): Integer; dispid 86;
    function FhnSBSParamQueryRecordState(const PUID: WideString; ChannelNo: Integer; 
                                         StoreType: Integer; Reserved: Integer; 
                                         const Reserved1: WideString): Integer; dispid 87;
    function FHNSBSGetDownloadPecent(handler: Integer; const reseved: WideString; reseved1: Integer): Integer; dispid 88;
    function FhnSBSQueryAlmRec(const PUID: WideString; ChannelNo: Integer; 
                               const AlarmId: WideString; StoreType: Integer; Rerver1: Integer; 
                               Rerver2: Integer; const Rerver3: WideString): Integer; dispid 89;
    function FhnSBSGetMyPath(const reseve1: WideString; reseve2: Integer): WideString; dispid 90;
    function FhnSBSRecordPlayByURL(const SFileUrl: WideString; hWnd: Integer; StartTime: Integer; 
                                   EndTime: Integer; Resver: Integer; const Resver1: WideString): Integer; dispid 91;
    function FhnSBSAutoPresetNode(const PUID: WideString; ChannelNo: Integer; Index: Integer; 
                                  ResetTime: Integer): Integer; dispid 92;
    function FhnSBSGetRecPath: WideString; dispid 93;
    function FhnSBSSetRecPath(const path: WideString): Integer; dispid 94;
    function FHNSBSOPENFILE(const path: WideString; resever: Integer): Integer; dispid 95;
    function FHNSBSFINDFILE(const path: WideString; resever: Integer): Integer; dispid 96;
    function FhnSBSStartLocalRecordEx(const path: WideString; CallID: Integer): Integer; dispid 97;
    function FhnSBSLocalCapEx(CallID: Integer; CapType: Integer; const fullfilename: WideString): Integer; dispid 98;
    function FhnSBSWriteText(const path: WideString; const FileName: WideString; 
                             const data: WideString; const Reserved1: WideString; Reserved2: Integer): Integer; dispid 99;
    function FhnSBSCreateDirectory(const path: WideString; const Reserved1: WideString; 
                                   Reserved2: Integer): Integer; dispid 100;
    function FhnSBSDeleteDirectory(const path: WideString; const Reserved1: WideString; 
                                   Reserved2: Integer): Integer; dispid 101;
    function FhnSBSGetOcxDirectory(const Reserved1: WideString; Reserved2: Integer): WideString; dispid 102;
    function FhnSBSReadText(const FileName: WideString; const Reserved1: WideString; 
                            Reserved2: Integer): Integer; dispid 103;
    function FhnSBSReadFileData(const FileName: WideString; const Reserved1: WideString; 
                                Reserved2: Integer): Integer; dispid 104;
    function FhnSBSQueryStrategyList(const ivmID: WideString; const PUID: WideString; 
                                     ChannelNo: Integer; const Reserved1: WideString; 
                                     const Reserved2: WideString; Reserved3: Integer; 
                                     Reserved4: Integer): Integer; dispid 105;
    function FhnSBSDeleteStrategyList(const ivmID: WideString; const StrategyId: WideString; 
                                      const PUID: WideString; ChannelNo: Integer; 
                                      const Reserved1: WideString; Reserved2: Integer): Integer; dispid 106;
    function FhnSBSGetIvsReq(const Reserved1: WideString; Reserved2: Integer): Integer; dispid 107;
    function FhnSBSSetRule(const ivmID: WideString; const PUID: WideString; ChannelNo: Integer; 
                           AlorgType: Integer; const Reserved1: WideString; 
                           const Reserved2: WideString; Reserved3: Integer; Reserved4: Integer): Integer; dispid 108;
    function FhnSBSOcxFileUpload(const s8ServerFileName: WideString; 
                                 const s8LocalFilePath: WideString; reserve1: Integer; 
                                 reserve2: Integer): WideString; dispid 109;
    function FhnSBSOcxFileDownload(const s8ServerFileName: WideString; 
                                   const s8LocalFileName: WideString; const reserve1: WideString; 
                                   reserve2: Integer): Integer; dispid 110;
    function FhnSBSUpDownFileOcxInitial(const s8ServerAddr: WideString; s16ServerPort: Integer; 
                                        const s8WorkDir: WideString; const reserve1: WideString; 
                                        reserve2: Integer): Integer; dispid 111;
    function FhnSBSDestroyUpDownFile(const reserve1: WideString; reserve2: Integer): Integer; dispid 112;
    function FhnSBSCaseArchiveRequest(const PUID: WideString; ChannelNo: Integer; 
                                      StartTime: Integer; EndTime: Integer; iCaseType: Integer; 
                                      const CaseTitle: WideString; const CaseDescribe: WideString; 
                                      const RecUrl: WideString; 
                                      IdmIp: {NOT_OLEAUTO(PWideChar)}OleVariant; IdmPort: Integer; 
                                      const Reserved1: WideString; Reserved2: Integer): Integer; dispid 113;
    function FhnSBSGetCasePrecent(const Caseid: WideString; const IdmIp: WideString; 
                                  IdmPort: Integer; const Reserved1: WideString; Reserved2: Integer): Integer; dispid 114;
    function FHNSBSimgFormatTransform(const pathIn: WideString; const pathOut: WideString; 
                                      widOut: Integer; heiOut: Integer; const resever: WideString; 
                                      resever1: Integer; resever2: Integer): Integer; dispid 115;
    function FHNSBSGetLocRecTotalTime(const FileName: WideString): Integer; dispid 116;
    function FhzSBSShowIvs(const IdsIp: WideString; IdsPort: Integer; const PicPath: WideString; 
                           const RecInfo: WideString; RecType: Integer; StartTime: Integer; 
                           EndTime: Integer; const Reserved1: WideString; Reserved2: Integer; 
                           const Reserved3: WideString; Reserved4: Integer): Integer; dispid 117;
    function FhzSBSShowVg(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                          const PicPath: WideString; const RecInfo: WideString; RecType: Integer; 
                          StartTime: Integer; EndTime: Integer; const Reserved1: WideString; 
                          Reserved2: Integer; const Reserved3: WideString; Reserved4: Integer): Integer; dispid 118;
    function FhzSBSShowFc(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                          const PicPath: WideString; const RecInfo: WideString; RecType: Integer; 
                          StartTime: Integer; EndTime: Integer; const Reserved1: WideString; 
                          Reserved2: Integer; const Reserved3: WideString; Reserved4: Integer): Integer; dispid 119;
    function FhzSBSShowAbs(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                           const PicPath: WideString; const RecInfo: WideString; RecType: Integer; 
                           StartTime: Integer; EndTime: Integer; const Reserved1: WideString; 
                           Reserved2: Integer; const Reserved3: WideString; Reserved4: Integer): Integer; dispid 120;
    function FhzSBSHideIvs(const Reserved1: WideString; Reserved2: Integer): Integer; dispid 121;
    function FhzSBSHideFc(const Reserved1: WideString; Reserved2: Integer): Integer; dispid 122;
    function FhzWndHideVg(const Reserved1: WideString; Reserved2: Integer): Integer; dispid 123;
    function FhzWndHideAbs(const Reserved1: WideString; Reserved2: Integer): Integer; dispid 124;
    function FhzSBSInitSdk(const Reserved1: WideString; Reserved2: Integer): Integer; dispid 125;
    function FhzSBSDestroy(const Reserved1: WideString; Reserved2: Integer): Integer; dispid 126;
    procedure AboutBox; dispid -552;
    function FhnSBSAvxToAvi(const pFilePath: WideString; Reserved1: Integer; 
                            const Reserved2: WideString): Integer; dispid 128;
    function FhnSBSPlayRecordByTimeEX(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                                      StartTime: Integer; EndTime: Integer; StoreType: Integer; 
                                      FileType: Integer; ProtocolType: Integer; TransType: Integer; 
                                      Resver: Integer; const Resver1: WideString): Integer; dispid 129;
    function FhnVideoConverter(const StcPathName: WideString; const DstPathName: WideString; 
                               VideoType: Integer; const Revers: WideString; rever2: Integer): Integer; dispid 130;
    function FhzIsOpen(type_: Integer; resever: Integer): Integer; dispid 131;
    function FhnSBSGetAutoPresetNode(const PUID: WideString; ChannelNo: Integer; UserData: Integer; 
                                     reseve: Integer; const reseve1: WideString): Integer; dispid 132;
    function FhnSBSSlice(const PUID: WideString; ChannelNo: Integer; const CaseUrl: WideString; 
                         CaseType: Integer; CasewhetherHandle: Integer; Caseattribute: Integer; 
                         lStartTime: Integer; lFinishTime: Integer; const resever: WideString; 
                         const resever1: WideString; resever2: Integer; resever3: Integer): Integer; dispid 133;
    function FhnSBSSliteFlash(type_: Integer; time1: Integer; time2: Integer; time3: Integer; 
                              time4: Integer; const reseve: WideString; const resever2: WideString): Integer; dispid 134;
    function FhnGetVideoConverterPer(Handle: Integer; Reserver1: Integer; 
                                     const Reserver2: WideString): Double; dispid 135;
  end;

// *********************************************************************//
// DispIntf:  _DFhnSBSAtxEvents
// Flags:     (4096) Dispatchable
// GUID:      {8CA340B9-7DB4-41B9-B66E-88F101546E4E}
// *********************************************************************//
  _DFhnSBSAtxEvents = dispinterface
    ['{8CA340B9-7DB4-41B9-B66E-88F101546E4E}']
    procedure FhnSBSLoginEvent(ErrorCode: Integer); dispid 1;
    procedure FhnSBSDeviceOnlineEvent(const PUID: WideString; Online: WordBool); dispid 2;
    procedure FhnSBSRecordQueryEvent(ErrorCode: Integer; const FileList: WideString); dispid 3;
    procedure FhnSBSGotAlm(const AlmStr: WideString; Reserved: Integer); dispid 4;
    procedure FhnSBSOfflineEvent(ErrorCode: Integer; const FileList: WideString); dispid 5;
    procedure FhnSBSGotDisplayParam(Contrast: Integer; Bright: Integer; Hue: Integer; 
                                    Saturation: Integer); dispid 6;
    procedure FhnSBSGetParamResp(Contrast: Integer; Bright: Integer; Hue: Integer; 
                                 Saturation: Integer; errcode: Integer); dispid 7;
    procedure FhnSBSSetDisplayResp(errcode: Integer); dispid 8;
    procedure FhnSBSPuStateNotify(const StateStr: WideString; Reserved: Integer); dispid 9;
    procedure FhnSBSNameChangeEvent(const PUID: WideString; ChannelNo: Integer; 
                                    ChannelType: Integer; const NewName: WideString); dispid 10;
    procedure FhnSBSLogoutEvent(Reserved: Integer); dispid 11;
    procedure FhnSBSPTZResp(ErrorCode: Integer; Reserved: Integer); dispid 12;
    procedure FhnSBSQueryPicEvent(ErrorCode: Integer; const Result: WideString; Reserved: Integer); dispid 13;
    procedure FhnSBSGroupQueryEvent(ErrorCode: Integer; const Group: WideString); dispid 14;
    procedure FhnSBSPulistQueryEvent(ErrorCode: Integer; const Pulist: WideString); dispid 15;
    procedure FhnSBSPuInfoQueryEvent(ErrorCode: Integer; const PuInfo: WideString); dispid 16;
    procedure FhnSBSAllGroupQueryEvent(ErrorCode: Integer; const Group: WideString); dispid 17;
    procedure FhnSBSAllPulistQueryEvent(ErrorCode: Integer; const Pulist: WideString); dispid 18;
    procedure FhnSBSAllPuInfoQueryEvent(ErrorCode: Integer; const PuInfo: WideString); dispid 19;
    procedure FhnSBSWindowLeftClickedEvent(const PUID: WideString; channelnum: Smallint); dispid 20;
    procedure FhnSBSGetPresetEvent(const presetXml: WideString); dispid 21;
    procedure FHNSBSQueryFinishEvent(const mdbpath: WideString; const userid: WideString); dispid 22;
    procedure FhnSBSGetGpinChannelEvent(const gpinchannelinfo: WideString); dispid 23;
    procedure FhnSBSRecordDownloadEvent(recFiles: Integer; UserData: Integer); dispid 24;
    procedure FhnSBSBroadcastStateEvent(const PUID: WideString; ChannelNo: Integer; 
                                        BroadcastState: Integer); dispid 25;
    procedure FhnSBSMatrixQueryEvent(ErrorCode: Integer; const Result: WideString; Reserved: Integer); dispid 26;
    procedure FhnSBSSpeakQueryEvent(const PUID: WideString; ChannelNo: Integer; 
                                    const PUName: WideString; Reserved1: Integer; Reserved2: Integer); dispid 27;
    procedure FhnSBSPlayRecordEvent(ErrorCode: Integer; hWnd: Integer; CallID: Integer); dispid 28;
    procedure FhnSBSDownLoadPicEvent(const wParam: WideString; const lParam: WideString); dispid 29;
    procedure FhnSBSRecordPalyEvent(wParam: Integer; const lParam: WideString); dispid 30;
    procedure FhnSBSVideoStateNotifyEvent(CallID: Integer; notifycode: Integer); dispid 31;
    procedure FhnSBSGetEncodeResp(BitRate: Smallint; BitRateType: Smallint; EncodeMode: Smallint; 
                                  FrameRate: Smallint; IFrameInterval: Smallint; 
                                  ImageSize: Smallint; PicQuality: Smallint; errcode: Smallint); dispid 32;
    procedure FhnSBSGetEncodeRespEvent(const PUID: WideString; channelid: Smallint; 
                                       BitRate: Integer; BitRateType: Integer; EncodeMode: Integer; 
                                       FrameRate: Integer; IFrameInterval: Integer; 
                                       ImageSize: Integer; PicQuality: Integer; errcode: Integer); dispid 33;
    procedure FhnSBSServerRecordEvent(ErrorCode: Integer; const FileList: WideString); dispid 34;
    procedure FhnSBSServerRecordStopEvent(ErrorCode: Integer; const FileList: WideString); dispid 35;
    procedure FhnSBSSetOsdDisplayEvent(ErrorCode: Integer; const FileList: WideString); dispid 36;
    procedure FhnSBSAddPresetNodeEvent(ErrorCode: Integer; const FileList: WideString); dispid 37;
    procedure FhnSBSDeletePresetNodeEvent(ErrorCode: Integer; const FileList: WideString); dispid 38;
    procedure FhnSBSCallPresetNodeEvent(ErrorCode: Integer; const FileList: WideString); dispid 39;
    procedure FhnSBSGetCruiseEvent(ErrorCode: Integer; const FileList: WideString); dispid 40;
    procedure FhnSBSSetCruiseEvent(ErrorCode: Integer; const FileList: WideString); dispid 41;
    procedure FhnSBSPTZResultEvent(ErrorCode: Integer; const Descrip: WideString); dispid 42;
    procedure FhnSBSBroadcastStartEvent(ErrorCode: Integer; const data: WideString); dispid 43;
    procedure FhnSBSSpeakStartEvent(ErrorCode: Integer; const data: WideString); dispid 44;
    procedure FhnSBSGetChannelInfoEvent(flux: Single; FrameRate: Integer; 
                                        PUID: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                                        Reserved1: Integer; Reserved2: Integer; Reserved3: Integer); dispid 45;
    procedure FhnSBSPictureServrCapEvent(ErrorCode: Integer; const data: WideString); dispid 46;
    procedure FhnSBSNvrGroupRecQueryEvent(ErrorCode: Integer; const Result: WideString; 
                                          Reserved: Integer); dispid 47;
    procedure FhnSBSGetOsdDisplayEvent(ErrorCode: Integer; timeX: Integer; timeY: Integer; 
                                       timeEnable: WordBool; const text: WideString; 
                                       textX: Integer; textY: Integer; textEnable: WordBool); dispid 48;
    procedure FhnSBSSetEncodeRespEvent(errcode: Integer; const reserve: WideString; 
                                       reserve1: Integer); dispid 49;
    procedure FhnSBSLoadRecordEvent(ErrorCode: Integer; hWnd: Integer; CallID: Integer; 
                                    Resver: Integer; const reserve: WideString); dispid 50;
    procedure FhnSBSGetRecordTacticsRespEvent(nErrorCode: Integer; const data: WideString; 
                                              const Resverd: WideString; Resverd1: Integer); dispid 51;
    procedure FhnSBSSetRecordTacticsRespEvent(nErrorCode: Integer; const data: WideString; 
                                              const Resverd: WideString; Resverd1: Integer); dispid 52;
    procedure FhnSBSQueryPlatRecStatusEvent(nEorrocode: Integer; const data: WideString; 
                                            const resever: WideString; resever1: Integer); dispid 53;
    procedure FhnSBSAlarmRecEvent(ErrorCode: Integer; hWnd: Integer; CallID: Integer; 
                                  Resver: Integer; const Resver1: WideString); dispid 54;
    procedure FhnSBSAutoPresetEvent(ErrorCode: Integer; const Describ: WideString); dispid 55;
    procedure FhnSBSQueryCapEvent(ErrorCode: Integer; const PUID: WideString; channelnum: Integer; 
                                  reserve: Integer); dispid 56;
    procedure FhnSBSReadTestEvent(errcode: Integer; const test: WideString); dispid 57;
    procedure FhnSBSGetStrategyListEvent(ErrorCode: Integer; const PUID: WideString; 
                                         ChannelNo: Integer; const text: WideString; 
                                         const Reserved1: WideString; Reserved2: Integer); dispid 58;
    procedure FhnSBSDeleteStrategyListEvent(ErrorCode: Integer; const Reserved1: WideString; 
                                            Reserved2: Integer); dispid 59;
    procedure FhnSBSSetRuleEvent(ErrorCode: Integer; Reserved1: Smallint; Reserved2: Integer); dispid 60;
    procedure FhnSBSGetIvsEvent(ErrorCode: Integer; const ivmID: WideString; 
                                const IvmName: WideString; const IvmIP: WideString; 
                                IvmStatus: Integer; const Reserved1: WideString; 
                                const Reserved2: WideString); dispid 61;
    procedure FhnSBSGetIvsinfoEvent(ErrorCode: Integer; const text: WideString; 
                                    const Reserved1: WideString; Reserved2: Integer); dispid 62;
    procedure FhnSBSGetCaseinfoEvent(ErrorCode: Integer; const Reserved1: WideString; 
                                     const Caseid: WideString; Reserved2: Integer); dispid 63;
    procedure FhnSBSOcxFileDisposalCBEvent(s16MsgType: Integer; s16ErrCode: Integer; 
                                           const s8FileName: WideString; 
                                           const s8FileID: WideString; s16Process: Integer; 
                                           const reserve1: WideString; reserve2: Integer); dispid 64;
    procedure FhnSBSGetCasePrecentEvent(ErrorCode: Integer; const Caseid: WideString; 
                                        precent: Integer; const Reserved1: WideString; 
                                        const Reserved2: WideString; Reserved3: Integer; 
                                        Reserved4: Integer); dispid 65;
    procedure FhzWndIvsPicEvent(const PicPath: WideString; const CaeeResOrgCode: WideString; 
                                PicTime: Integer; const Reserved1: WideString; Reserved2: Integer); dispid 66;
    procedure FhzWndVgPicEvent(const PicPath: WideString; const CaeeResOrgCode: WideString; 
                               PicTime: Integer; const Reserved1: WideString; Reserved2: Integer); dispid 67;
    procedure FhzWndAbsPicEvent(const PicPath: WideString; const CaeeResOrgCode: WideString; 
                                PicTime: Integer; const Reserved1: WideString; Reserved2: Integer); dispid 68;
    procedure FhzWndFcPicEvent(const PicPath: WideString; const CaeeResOrgCode: WideString; 
                               PicTime: Integer; const Reserved1: WideString; Reserved2: Integer); dispid 69;
    procedure FhnSBSVideoStateNotifyEventEx(CallID: Integer; notifycode: Integer; 
                                            UserData: Integer; const resever1: WideString); dispid 70;
    procedure FhnSBSAvxToAviEnvent(errocod: Integer; Handle: Integer; resecver: Integer; 
                                   const resecver1: WideString); dispid 71;
    procedure FireFhnSBSGetAutoPresetEvent(errercode: Integer; UserData: Integer; reseve: Integer; 
                                           const reseve1: WideString); dispid 72;
    procedure FhnSBSSliceEvent(StartTime: Integer; EndTime: Integer; const reseve: WideString; 
                               const reseve1: WideString; reseve2: Integer; reseve3: Integer); dispid 73;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TFhnSBSAtx
// Help String      : FhnSBSAtx Control
// Default Interface: _DFhnSBSAtx
// Def. Intf. DISP? : Yes
// Event   Interface: _DFhnSBSAtxEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TFhnSBSAtxFhnSBSLoginEvent = procedure(ASender: TObject; ErrorCode: Integer) of object;
  TFhnSBSAtxFhnSBSDeviceOnlineEvent = procedure(ASender: TObject; const PUID: WideString; 
                                                                  Online: WordBool) of object;
  TFhnSBSAtxFhnSBSRecordQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                 const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSGotAlm = procedure(ASender: TObject; const AlmStr: WideString; Reserved: Integer) of object;
  TFhnSBSAtxFhnSBSOfflineEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                             const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSGotDisplayParam = procedure(ASender: TObject; Contrast: Integer; Bright: Integer; 
                                                                Hue: Integer; Saturation: Integer) of object;
  TFhnSBSAtxFhnSBSGetParamResp = procedure(ASender: TObject; Contrast: Integer; Bright: Integer; 
                                                             Hue: Integer; Saturation: Integer; 
                                                             errcode: Integer) of object;
  TFhnSBSAtxFhnSBSSetDisplayResp = procedure(ASender: TObject; errcode: Integer) of object;
  TFhnSBSAtxFhnSBSPuStateNotify = procedure(ASender: TObject; const StateStr: WideString; 
                                                              Reserved: Integer) of object;
  TFhnSBSAtxFhnSBSNameChangeEvent = procedure(ASender: TObject; const PUID: WideString; 
                                                                ChannelNo: Integer; 
                                                                ChannelType: Integer; 
                                                                const NewName: WideString) of object;
  TFhnSBSAtxFhnSBSLogoutEvent = procedure(ASender: TObject; Reserved: Integer) of object;
  TFhnSBSAtxFhnSBSPTZResp = procedure(ASender: TObject; ErrorCode: Integer; Reserved: Integer) of object;
  TFhnSBSAtxFhnSBSQueryPicEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                              const Result: WideString; 
                                                              Reserved: Integer) of object;
  TFhnSBSAtxFhnSBSGroupQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                const Group: WideString) of object;
  TFhnSBSAtxFhnSBSPulistQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                 const Pulist: WideString) of object;
  TFhnSBSAtxFhnSBSPuInfoQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                 const PuInfo: WideString) of object;
  TFhnSBSAtxFhnSBSAllGroupQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                   const Group: WideString) of object;
  TFhnSBSAtxFhnSBSAllPulistQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                    const Pulist: WideString) of object;
  TFhnSBSAtxFhnSBSAllPuInfoQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                    const PuInfo: WideString) of object;
  TFhnSBSAtxFhnSBSWindowLeftClickedEvent = procedure(ASender: TObject; const PUID: WideString; 
                                                                       channelnum: Smallint) of object;
  TFhnSBSAtxFhnSBSGetPresetEvent = procedure(ASender: TObject; const presetXml: WideString) of object;
  TFhnSBSAtxFHNSBSQueryFinishEvent = procedure(ASender: TObject; const mdbpath: WideString; 
                                                                 const userid: WideString) of object;
  TFhnSBSAtxFhnSBSGetGpinChannelEvent = procedure(ASender: TObject; const gpinchannelinfo: WideString) of object;
  TFhnSBSAtxFhnSBSRecordDownloadEvent = procedure(ASender: TObject; recFiles: Integer; 
                                                                    UserData: Integer) of object;
  TFhnSBSAtxFhnSBSBroadcastStateEvent = procedure(ASender: TObject; const PUID: WideString; 
                                                                    ChannelNo: Integer; 
                                                                    BroadcastState: Integer) of object;
  TFhnSBSAtxFhnSBSMatrixQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                 const Result: WideString; 
                                                                 Reserved: Integer) of object;
  TFhnSBSAtxFhnSBSSpeakQueryEvent = procedure(ASender: TObject; const PUID: WideString; 
                                                                ChannelNo: Integer; 
                                                                const PUName: WideString; 
                                                                Reserved1: Integer; 
                                                                Reserved2: Integer) of object;
  TFhnSBSAtxFhnSBSPlayRecordEvent = procedure(ASender: TObject; ErrorCode: Integer; hWnd: Integer; 
                                                                CallID: Integer) of object;
  TFhnSBSAtxFhnSBSDownLoadPicEvent = procedure(ASender: TObject; const wParam: WideString; 
                                                                 const lParam: WideString) of object;
  TFhnSBSAtxFhnSBSRecordPalyEvent = procedure(ASender: TObject; wParam: Integer; 
                                                                const lParam: WideString) of object;
  TFhnSBSAtxFhnSBSVideoStateNotifyEvent = procedure(ASender: TObject; CallID: Integer; 
                                                                      notifycode: Integer) of object;
  TFhnSBSAtxFhnSBSGetEncodeResp = procedure(ASender: TObject; BitRate: Smallint; 
                                                              BitRateType: Smallint; 
                                                              EncodeMode: Smallint; 
                                                              FrameRate: Smallint; 
                                                              IFrameInterval: Smallint; 
                                                              ImageSize: Smallint; 
                                                              PicQuality: Smallint; 
                                                              errcode: Smallint) of object;
  TFhnSBSAtxFhnSBSGetEncodeRespEvent = procedure(ASender: TObject; const PUID: WideString; 
                                                                   channelid: Smallint; 
                                                                   BitRate: Integer; 
                                                                   BitRateType: Integer; 
                                                                   EncodeMode: Integer; 
                                                                   FrameRate: Integer; 
                                                                   IFrameInterval: Integer; 
                                                                   ImageSize: Integer; 
                                                                   PicQuality: Integer; 
                                                                   errcode: Integer) of object;
  TFhnSBSAtxFhnSBSServerRecordEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                  const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSServerRecordStopEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                      const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSSetOsdDisplayEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                   const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSAddPresetNodeEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                   const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSDeletePresetNodeEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                      const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSCallPresetNodeEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                    const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSGetCruiseEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                               const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSSetCruiseEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                               const FileList: WideString) of object;
  TFhnSBSAtxFhnSBSPTZResultEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                               const Descrip: WideString) of object;
  TFhnSBSAtxFhnSBSBroadcastStartEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                    const data: WideString) of object;
  TFhnSBSAtxFhnSBSSpeakStartEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                const data: WideString) of object;
  TFhnSBSAtxFhnSBSGetChannelInfoEvent = procedure(ASender: TObject; flux: Single; 
                                                                    FrameRate: Integer; 
                                                                    PUID: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                                                                    Reserved1: Integer; 
                                                                    Reserved2: Integer; 
                                                                    Reserved3: Integer) of object;
  TFhnSBSAtxFhnSBSPictureServrCapEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                     const data: WideString) of object;
  TFhnSBSAtxFhnSBSNvrGroupRecQueryEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                      const Result: WideString; 
                                                                      Reserved: Integer) of object;
  TFhnSBSAtxFhnSBSGetOsdDisplayEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                   timeX: Integer; timeY: Integer; 
                                                                   timeEnable: WordBool; 
                                                                   const text: WideString; 
                                                                   textX: Integer; textY: Integer; 
                                                                   textEnable: WordBool) of object;
  TFhnSBSAtxFhnSBSSetEncodeRespEvent = procedure(ASender: TObject; errcode: Integer; 
                                                                   const reserve: WideString; 
                                                                   reserve1: Integer) of object;
  TFhnSBSAtxFhnSBSLoadRecordEvent = procedure(ASender: TObject; ErrorCode: Integer; hWnd: Integer; 
                                                                CallID: Integer; Resver: Integer; 
                                                                const reserve: WideString) of object;
  TFhnSBSAtxFhnSBSGetRecordTacticsRespEvent = procedure(ASender: TObject; nErrorCode: Integer; 
                                                                          const data: WideString; 
                                                                          const Resverd: WideString; 
                                                                          Resverd1: Integer) of object;
  TFhnSBSAtxFhnSBSSetRecordTacticsRespEvent = procedure(ASender: TObject; nErrorCode: Integer; 
                                                                          const data: WideString; 
                                                                          const Resverd: WideString; 
                                                                          Resverd1: Integer) of object;
  TFhnSBSAtxFhnSBSQueryPlatRecStatusEvent = procedure(ASender: TObject; nEorrocode: Integer; 
                                                                        const data: WideString; 
                                                                        const resever: WideString; 
                                                                        resever1: Integer) of object;
  TFhnSBSAtxFhnSBSAlarmRecEvent = procedure(ASender: TObject; ErrorCode: Integer; hWnd: Integer; 
                                                              CallID: Integer; Resver: Integer; 
                                                              const Resver1: WideString) of object;
  TFhnSBSAtxFhnSBSAutoPresetEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                const Describ: WideString) of object;
  TFhnSBSAtxFhnSBSQueryCapEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                              const PUID: WideString; 
                                                              channelnum: Integer; reserve: Integer) of object;
  TFhnSBSAtxFhnSBSReadTestEvent = procedure(ASender: TObject; errcode: Integer; 
                                                              const test: WideString) of object;
  TFhnSBSAtxFhnSBSGetStrategyListEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                     const PUID: WideString; 
                                                                     ChannelNo: Integer; 
                                                                     const text: WideString; 
                                                                     const Reserved1: WideString; 
                                                                     Reserved2: Integer) of object;
  TFhnSBSAtxFhnSBSDeleteStrategyListEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                        const Reserved1: WideString; 
                                                                        Reserved2: Integer) of object;
  TFhnSBSAtxFhnSBSSetRuleEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                             Reserved1: Smallint; Reserved2: Integer) of object;
  TFhnSBSAtxFhnSBSGetIvsEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                            const ivmID: WideString; 
                                                            const IvmName: WideString; 
                                                            const IvmIP: WideString; 
                                                            IvmStatus: Integer; 
                                                            const Reserved1: WideString; 
                                                            const Reserved2: WideString) of object;
  TFhnSBSAtxFhnSBSGetIvsinfoEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                const text: WideString; 
                                                                const Reserved1: WideString; 
                                                                Reserved2: Integer) of object;
  TFhnSBSAtxFhnSBSGetCaseinfoEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                 const Reserved1: WideString; 
                                                                 const Caseid: WideString; 
                                                                 Reserved2: Integer) of object;
  TFhnSBSAtxFhnSBSOcxFileDisposalCBEvent = procedure(ASender: TObject; s16MsgType: Integer; 
                                                                       s16ErrCode: Integer; 
                                                                       const s8FileName: WideString; 
                                                                       const s8FileID: WideString; 
                                                                       s16Process: Integer; 
                                                                       const reserve1: WideString; 
                                                                       reserve2: Integer) of object;
  TFhnSBSAtxFhnSBSGetCasePrecentEvent = procedure(ASender: TObject; ErrorCode: Integer; 
                                                                    const Caseid: WideString; 
                                                                    precent: Integer; 
                                                                    const Reserved1: WideString; 
                                                                    const Reserved2: WideString; 
                                                                    Reserved3: Integer; 
                                                                    Reserved4: Integer) of object;
  TFhnSBSAtxFhzWndIvsPicEvent = procedure(ASender: TObject; const PicPath: WideString; 
                                                            const CaeeResOrgCode: WideString; 
                                                            PicTime: Integer; 
                                                            const Reserved1: WideString; 
                                                            Reserved2: Integer) of object;
  TFhnSBSAtxFhzWndVgPicEvent = procedure(ASender: TObject; const PicPath: WideString; 
                                                           const CaeeResOrgCode: WideString; 
                                                           PicTime: Integer; 
                                                           const Reserved1: WideString; 
                                                           Reserved2: Integer) of object;
  TFhnSBSAtxFhzWndAbsPicEvent = procedure(ASender: TObject; const PicPath: WideString; 
                                                            const CaeeResOrgCode: WideString; 
                                                            PicTime: Integer; 
                                                            const Reserved1: WideString; 
                                                            Reserved2: Integer) of object;
  TFhnSBSAtxFhzWndFcPicEvent = procedure(ASender: TObject; const PicPath: WideString; 
                                                           const CaeeResOrgCode: WideString; 
                                                           PicTime: Integer; 
                                                           const Reserved1: WideString; 
                                                           Reserved2: Integer) of object;
  TFhnSBSAtxFhnSBSVideoStateNotifyEventEx = procedure(ASender: TObject; CallID: Integer; 
                                                                        notifycode: Integer; 
                                                                        UserData: Integer; 
                                                                        const resever1: WideString) of object;
  TFhnSBSAtxFhnSBSAvxToAviEnvent = procedure(ASender: TObject; errocod: Integer; Handle: Integer; 
                                                               resecver: Integer; 
                                                               const resecver1: WideString) of object;
  TFhnSBSAtxFireFhnSBSGetAutoPresetEvent = procedure(ASender: TObject; errercode: Integer; 
                                                                       UserData: Integer; 
                                                                       reseve: Integer; 
                                                                       const reseve1: WideString) of object;
  TFhnSBSAtxFhnSBSSliceEvent = procedure(ASender: TObject; StartTime: Integer; EndTime: Integer; 
                                                           const reseve: WideString; 
                                                           const reseve1: WideString; 
                                                           reseve2: Integer; reseve3: Integer) of object;

  TFhnSBSAtx = class(TOleControl)
  private
    FOnFhnSBSLoginEvent: TFhnSBSAtxFhnSBSLoginEvent;
    FOnFhnSBSDeviceOnlineEvent: TFhnSBSAtxFhnSBSDeviceOnlineEvent;
    FOnFhnSBSRecordQueryEvent: TFhnSBSAtxFhnSBSRecordQueryEvent;
    FOnFhnSBSGotAlm: TFhnSBSAtxFhnSBSGotAlm;
    FOnFhnSBSOfflineEvent: TFhnSBSAtxFhnSBSOfflineEvent;
    FOnFhnSBSGotDisplayParam: TFhnSBSAtxFhnSBSGotDisplayParam;
    FOnFhnSBSGetParamResp: TFhnSBSAtxFhnSBSGetParamResp;
    FOnFhnSBSSetDisplayResp: TFhnSBSAtxFhnSBSSetDisplayResp;
    FOnFhnSBSPuStateNotify: TFhnSBSAtxFhnSBSPuStateNotify;
    FOnFhnSBSNameChangeEvent: TFhnSBSAtxFhnSBSNameChangeEvent;
    FOnFhnSBSLogoutEvent: TFhnSBSAtxFhnSBSLogoutEvent;
    FOnFhnSBSPTZResp: TFhnSBSAtxFhnSBSPTZResp;
    FOnFhnSBSQueryPicEvent: TFhnSBSAtxFhnSBSQueryPicEvent;
    FOnFhnSBSGroupQueryEvent: TFhnSBSAtxFhnSBSGroupQueryEvent;
    FOnFhnSBSPulistQueryEvent: TFhnSBSAtxFhnSBSPulistQueryEvent;
    FOnFhnSBSPuInfoQueryEvent: TFhnSBSAtxFhnSBSPuInfoQueryEvent;
    FOnFhnSBSAllGroupQueryEvent: TFhnSBSAtxFhnSBSAllGroupQueryEvent;
    FOnFhnSBSAllPulistQueryEvent: TFhnSBSAtxFhnSBSAllPulistQueryEvent;
    FOnFhnSBSAllPuInfoQueryEvent: TFhnSBSAtxFhnSBSAllPuInfoQueryEvent;
    FOnFhnSBSWindowLeftClickedEvent: TFhnSBSAtxFhnSBSWindowLeftClickedEvent;
    FOnFhnSBSGetPresetEvent: TFhnSBSAtxFhnSBSGetPresetEvent;
    FOnFHNSBSQueryFinishEvent: TFhnSBSAtxFHNSBSQueryFinishEvent;
    FOnFhnSBSGetGpinChannelEvent: TFhnSBSAtxFhnSBSGetGpinChannelEvent;
    FOnFhnSBSRecordDownloadEvent: TFhnSBSAtxFhnSBSRecordDownloadEvent;
    FOnFhnSBSBroadcastStateEvent: TFhnSBSAtxFhnSBSBroadcastStateEvent;
    FOnFhnSBSMatrixQueryEvent: TFhnSBSAtxFhnSBSMatrixQueryEvent;
    FOnFhnSBSSpeakQueryEvent: TFhnSBSAtxFhnSBSSpeakQueryEvent;
    FOnFhnSBSPlayRecordEvent: TFhnSBSAtxFhnSBSPlayRecordEvent;
    FOnFhnSBSDownLoadPicEvent: TFhnSBSAtxFhnSBSDownLoadPicEvent;
    FOnFhnSBSRecordPalyEvent: TFhnSBSAtxFhnSBSRecordPalyEvent;
    FOnFhnSBSVideoStateNotifyEvent: TFhnSBSAtxFhnSBSVideoStateNotifyEvent;
    FOnFhnSBSGetEncodeResp: TFhnSBSAtxFhnSBSGetEncodeResp;
    FOnFhnSBSGetEncodeRespEvent: TFhnSBSAtxFhnSBSGetEncodeRespEvent;
    FOnFhnSBSServerRecordEvent: TFhnSBSAtxFhnSBSServerRecordEvent;
    FOnFhnSBSServerRecordStopEvent: TFhnSBSAtxFhnSBSServerRecordStopEvent;
    FOnFhnSBSSetOsdDisplayEvent: TFhnSBSAtxFhnSBSSetOsdDisplayEvent;
    FOnFhnSBSAddPresetNodeEvent: TFhnSBSAtxFhnSBSAddPresetNodeEvent;
    FOnFhnSBSDeletePresetNodeEvent: TFhnSBSAtxFhnSBSDeletePresetNodeEvent;
    FOnFhnSBSCallPresetNodeEvent: TFhnSBSAtxFhnSBSCallPresetNodeEvent;
    FOnFhnSBSGetCruiseEvent: TFhnSBSAtxFhnSBSGetCruiseEvent;
    FOnFhnSBSSetCruiseEvent: TFhnSBSAtxFhnSBSSetCruiseEvent;
    FOnFhnSBSPTZResultEvent: TFhnSBSAtxFhnSBSPTZResultEvent;
    FOnFhnSBSBroadcastStartEvent: TFhnSBSAtxFhnSBSBroadcastStartEvent;
    FOnFhnSBSSpeakStartEvent: TFhnSBSAtxFhnSBSSpeakStartEvent;
    FOnFhnSBSGetChannelInfoEvent: TFhnSBSAtxFhnSBSGetChannelInfoEvent;
    FOnFhnSBSPictureServrCapEvent: TFhnSBSAtxFhnSBSPictureServrCapEvent;
    FOnFhnSBSNvrGroupRecQueryEvent: TFhnSBSAtxFhnSBSNvrGroupRecQueryEvent;
    FOnFhnSBSGetOsdDisplayEvent: TFhnSBSAtxFhnSBSGetOsdDisplayEvent;
    FOnFhnSBSSetEncodeRespEvent: TFhnSBSAtxFhnSBSSetEncodeRespEvent;
    FOnFhnSBSLoadRecordEvent: TFhnSBSAtxFhnSBSLoadRecordEvent;
    FOnFhnSBSGetRecordTacticsRespEvent: TFhnSBSAtxFhnSBSGetRecordTacticsRespEvent;
    FOnFhnSBSSetRecordTacticsRespEvent: TFhnSBSAtxFhnSBSSetRecordTacticsRespEvent;
    FOnFhnSBSQueryPlatRecStatusEvent: TFhnSBSAtxFhnSBSQueryPlatRecStatusEvent;
    FOnFhnSBSAlarmRecEvent: TFhnSBSAtxFhnSBSAlarmRecEvent;
    FOnFhnSBSAutoPresetEvent: TFhnSBSAtxFhnSBSAutoPresetEvent;
    FOnFhnSBSQueryCapEvent: TFhnSBSAtxFhnSBSQueryCapEvent;
    FOnFhnSBSReadTestEvent: TFhnSBSAtxFhnSBSReadTestEvent;
    FOnFhnSBSGetStrategyListEvent: TFhnSBSAtxFhnSBSGetStrategyListEvent;
    FOnFhnSBSDeleteStrategyListEvent: TFhnSBSAtxFhnSBSDeleteStrategyListEvent;
    FOnFhnSBSSetRuleEvent: TFhnSBSAtxFhnSBSSetRuleEvent;
    FOnFhnSBSGetIvsEvent: TFhnSBSAtxFhnSBSGetIvsEvent;
    FOnFhnSBSGetIvsinfoEvent: TFhnSBSAtxFhnSBSGetIvsinfoEvent;
    FOnFhnSBSGetCaseinfoEvent: TFhnSBSAtxFhnSBSGetCaseinfoEvent;
    FOnFhnSBSOcxFileDisposalCBEvent: TFhnSBSAtxFhnSBSOcxFileDisposalCBEvent;
    FOnFhnSBSGetCasePrecentEvent: TFhnSBSAtxFhnSBSGetCasePrecentEvent;
    FOnFhzWndIvsPicEvent: TFhnSBSAtxFhzWndIvsPicEvent;
    FOnFhzWndVgPicEvent: TFhnSBSAtxFhzWndVgPicEvent;
    FOnFhzWndAbsPicEvent: TFhnSBSAtxFhzWndAbsPicEvent;
    FOnFhzWndFcPicEvent: TFhnSBSAtxFhzWndFcPicEvent;
    FOnFhnSBSVideoStateNotifyEventEx: TFhnSBSAtxFhnSBSVideoStateNotifyEventEx;
    FOnFhnSBSAvxToAviEnvent: TFhnSBSAtxFhnSBSAvxToAviEnvent;
    FOnFireFhnSBSGetAutoPresetEvent: TFhnSBSAtxFireFhnSBSGetAutoPresetEvent;
    FOnFhnSBSSliceEvent: TFhnSBSAtxFhnSBSSliceEvent;
    FIntf: _DFhnSBSAtx;
    function  GetControlInterface: _DFhnSBSAtx;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function FhnSBSInitial(const serverip: WideString; serverport: Smallint): Integer;
    function FhnSBSLogin(const UserName: WideString; const PassWord: WideString): Integer;
    function FhnSBSRTVideoReq(const PUID: WideString; ChannelNo: Integer; 
                              const ChannelName: WideString; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSPTZReq(OperateID: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSSpeakReq(const PUID: WideString; ChannelNo: Integer; const PUName: WideString; 
                            Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSRecordPlay(const PUID: WideString; ChannelNo: Integer; StoreType: Integer; 
                              const FileName: WideString; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSRecordQeury(const PUID: WideString; ChannelNo: Integer; StoreType: Integer; 
                               FileType: Integer; StartTime: Integer; EndTime: Integer; 
                               ReceivedNum: Integer; Reserved: Integer; Reserved1: Integer): Integer;
    function FhnSBSDestoy: Integer;
    function FhnSBSLogOut: Integer;
    function FhnSBSGetDisplayParam(const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSSetDisplayParam(const PUID: WideString; ChannelNo: Integer; Contrast: Integer; 
                                   Bright: Integer; Hue: Integer; Saturation: Integer): Integer;
    function FhnSBSGetVersion: WideString;
    function FhnSBSSetServerVersion(version: Smallint): WordBool;
    function FhnSBSInitial2(const serverip: WideString; serverport: Smallint; 
                            const serverid: WideString): Integer;
    function FhnSBSSetDisplayParam2(const PUID: WideString; ChannelNo: Integer; Contrast: Integer; 
                                    Bright: Integer; Hue: Integer; Saturation: Integer; 
                                    Whiteness: Integer): Integer;
    procedure FhnSBSSetDeviceList(const DeviceListStr: WideString; Reserved: Integer);
    function FHNSBSParamSet(const PUID: WideString; ChannelNo: Integer; ChannelType: Integer; 
                            OperateID: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSPictureQuery(const PUID: WideString; ChannelNo: Integer; StoryType: Integer; 
                                FileType: Integer; StartTime: Integer; EndTime: Integer; 
                                ReceiveNum: Integer; QueryCount: Integer): Integer;
    procedure FhnSBSTestStartVideo(channelnum: Smallint);
    function FhnSBSGroupQuery: Integer;
    function FhnSBSPulistQuery(GroupID: Integer): Integer;
    function FhnSBSPuInfoQuery(const PUID: WideString): Integer;
    procedure FHNSBSLocalConfigSet;
    procedure FHNSBSPwdChange;
    function FhnSBSAllGroupQuery: Integer;
    function FhnSBSGisRTVideoReq(x: Smallint; y: Smallint; const PUID: WideString; 
                                 ChannelNo: Integer; const ChannelName: WideString; 
                                 Reserved1: Integer; Reserved2: Integer): Integer;
    procedure FhnSBSTestRecordPlay;
    function FhnSBSGetPreset(const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSCallPreset(const PUID: WideString; ChannelNo: Integer; 
                              const ChannelName: WideString; PresetIndex: Smallint; 
                              Reserved1: Integer; Reserved2: Integer): Integer;
    function FHNSBSGetChannel(const PUID: WideString): Integer;
    function FhnSBSAlarmReport(const PUID: WideString; ChannelNo: Integer; AlarmType: Integer; 
                               const AlarmTime: WideString; const UserData: WideString; 
                               Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSRecDownload(PUID: {NOT_OLEAUTO(PWideChar)}OleVariant; ChannelNo: Integer; 
                               DownloadType: Integer; FileName: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                               StartTime: Integer; EndTime: Integer; 
                               DownloadName: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                               StoreType: Integer; FileType: Integer; Reserved: Integer): Integer;
    function FhnSBSBroadcastReq(const PuidList: WideString; ChannelNo: Integer; 
                                AudioFormat: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSBroadcastStop(BroadcastHandle: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSMatrixReq(const PUID: WideString; ChannelNo: Integer; 
                             const ChannelName: WideString; const DUID: WideString; 
                             DuChannelNo: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSMatrixStop(const PUID: WideString; ChannelNo: Integer; 
                              const ChannelName: WideString; const DUID: WideString; 
                              DuChannelNo: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSMatrixQuery(const DUID: WideString; DuChannelNo: Integer; Reserved1: Integer; 
                               Reserved2: Integer): Integer;
    function FhnSBSSpeakQuery(const UserData: WideString; Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSPlayVideo(hWnd: Integer; const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSStopVideo(CallID: Integer): Integer;
    function FhnSBSPlayVideoEx(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                               Reserved1: Integer; Reserved2: Integer): Integer;
    function FhnSBSPTZControl(const PUID: WideString; ChannelNo: Integer; OperateID: Integer; 
                              Param1: Integer; Param2: Integer): Integer;
    function FhnSBSStartLocalRecord(CallID: Integer): Integer;
    function FhnSBSStopLocalRecord(CallID: Integer): Integer;
    function FhnSBSServerCap(const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSStartServerRecord(const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSPlayRecordByTime(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                                    StartTime: Integer; EndTime: Integer; StoreType: Integer; 
                                    FileType: Integer; Reserved: Integer): Integer;
    function FhnSBSStopPlayRecord(CallID: Integer): Integer;
    function FhnSBSSpeak(const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSBroadcast(const PuidList: WideString; ChannelNo: Integer; AudioFormat: Integer): Integer;
    function FhnSBSStopAudio(CallID: Integer): Integer;
    function FhnSBSLoginEx(const UserName: WideString; const PassWord: WideString): Integer;
    function FhnSBSPictureDownLoad(const FileName: WideString; const loadpath: WideString): Integer;
    function FhnSBSStartRecordAudio: Integer;
    function FhnSBSStopRecordAudio: Integer;
    function FHNSBSStartRecordPlay(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                                   StoreType: Integer; const FileName: WideString; 
                                   Reserved1: Integer; Reserved2: Integer): Integer;
    procedure FhnSBSChannelInfoDlg(const PUID: WideString; channelid: Integer; type_: Integer);
    function FhnSBSGroupOnly: Integer;
    function FHNSBSGetVideoEncodeReq(const PUID: WideString; ChannelNo: Integer): Integer;
    function FHNSBSSetVideoEncodeReq(const PUID: WideString; ChannelNo: Integer; BitRate: Integer; 
                                     BitRateType: Integer; EncodeMode: Integer; FrameRate: Integer; 
                                     IFrameInterval: Integer; ImageSize: Integer; 
                                     PicQuality: Integer): Integer;
    function FhnSBSLocalCap(CallID: Integer; CapType: Integer; const FileName: WideString): Integer;
    function FhnSBSStoptServerRecord(const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSSetOsdDisplay(const PUID: WideString; ChannelNo: Integer; bitmapX: Integer; 
                                 bitmapY: Integer; bitmapTextX: Integer; bitmapTextY: Integer; 
                                 bitmapTimeEnable: WordBool; bitmapTextEnable: WordBool; 
                                 const bitmapText: WideString): Integer;
    function FhnSBSGetPresetNode(const PUID: WideString; ChannelNo: Integer; Handle: Integer): Integer;
    function FhnSBSAddPresetNode(const PUID: WideString; ChannelNo: Integer; NewIndex: Integer; 
                                 const NewName: WideString): Integer;
    function FhnSBSDeletePresetNode(const PUID: WideString; ChannelNo: Integer; DeleteIndex: Integer): Integer;
    function FhnSBSCallPresetNode(const PUID: WideString; ChannelNo: Integer; CallIndex: Integer): Integer;
    function FhnSBSGetCruiseNode(const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSSetCruiseNode(const PUID: WideString; ChannelNo: Integer; 
                                 const CruiseData: WideString): Integer;
    function FhnSBSStartCruise(const PUID: WideString; ChannelNo: Integer): Integer;
    function FhnSBSStopCruise(const PUID: WideString; ChannelNo: Integer): Integer;
    function GetFhnCtlHandle: Integer;
    function FhnSBSVideoInfo(const PUID: WideString; Channel: Integer; Reserved1: Integer): Integer;
    function FHNSBSRecordControlPlay(lRecHandle: Integer; Operate: Integer; Speed: Integer; 
                                     totoalRecTime: Integer; Rerver1: Integer): Integer;
    function FhnSBSPictureServrCap(const PUID: WideString; ChannelNo: Integer; capQuality: Integer; 
                                   capSize: Integer; capTimes: Integer; reserve1: Integer; 
                                   reserve2: Integer): Integer;
    function fhnGetLongTime(const time: WideString): Integer;
    function FhnSBSNvrGroupRecQuery(CurSwitchTemplate: Integer; uFileType: Integer; 
                                    uStoreType: Integer; const sPuInfo: WideString; 
                                    beginTime: Integer; EndTime: Integer; uQueryStart: Integer; 
                                    uQueryNum: Integer; _lParam: Integer; const _sParam: WideString): Integer;
    function FHNSBSGetVodCurrTime(VODVideoHandle: Integer; const sParam: WideString): Integer;
    function FhnSBSGetOsdDisplay(const PUID: WideString; Channel: Integer; reserve: Integer; 
                                 reserve1: Integer): Integer;
    function FhnSBSQueryAlmPic(const PUID: WideString; ChannelNo: Integer; PicStorePos: Integer; 
                               const AlarmId: WideString; Rerver1: Integer; Rerver2: Integer; 
                               const Rerver3: WideString): Integer;
    function FhnSBSLoadDownRecordByTime(const PUID: WideString; ChannelNo: Integer; 
                                        StartTime: Integer; EndTime: Integer; 
                                        const LoaddownPath: WideString; const Reserved: WideString; 
                                        Reserved1: Integer): Integer;
    function FhnSBSGetRecordReq(const PUID: WideString; ChannelNo: Integer; ChannelType: Integer; 
                                IsPu: Integer; const Resverd: WideString; Resverd1: Integer): Integer;
    function FhnSBSSetRecordReq(const PUID: WideString; ChannelNo: Integer; StoreType: Integer; 
                                const data: WideString; enable1: Integer; const data1: WideString; 
                                enable2: Integer; const data2: WideString; enable3: Integer; 
                                const data3: WideString; const reseved: WideString; 
                                reseved1: Integer): Integer;
    function FhnSBSParamQueryRecordState(const PUID: WideString; ChannelNo: Integer; 
                                         StoreType: Integer; Reserved: Integer; 
                                         const Reserved1: WideString): Integer;
    function FHNSBSGetDownloadPecent(handler: Integer; const reseved: WideString; reseved1: Integer): Integer;
    function FhnSBSQueryAlmRec(const PUID: WideString; ChannelNo: Integer; 
                               const AlarmId: WideString; StoreType: Integer; Rerver1: Integer; 
                               Rerver2: Integer; const Rerver3: WideString): Integer;
    function FhnSBSGetMyPath(const reseve1: WideString; reseve2: Integer): WideString;
    function FhnSBSRecordPlayByURL(const SFileUrl: WideString; hWnd: Integer; StartTime: Integer; 
                                   EndTime: Integer; Resver: Integer; const Resver1: WideString): Integer;
    function FhnSBSAutoPresetNode(const PUID: WideString; ChannelNo: Integer; Index: Integer; 
                                  ResetTime: Integer): Integer;
    function FhnSBSGetRecPath: WideString;
    function FhnSBSSetRecPath(const path: WideString): Integer;
    function FHNSBSOPENFILE(const path: WideString; resever: Integer): Integer;
    function FHNSBSFINDFILE(const path: WideString; resever: Integer): Integer;
    function FhnSBSStartLocalRecordEx(const path: WideString; CallID: Integer): Integer;
    function FhnSBSLocalCapEx(CallID: Integer; CapType: Integer; const fullfilename: WideString): Integer;
    function FhnSBSWriteText(const path: WideString; const FileName: WideString; 
                             const data: WideString; const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhnSBSCreateDirectory(const path: WideString; const Reserved1: WideString; 
                                   Reserved2: Integer): Integer;
    function FhnSBSDeleteDirectory(const path: WideString; const Reserved1: WideString; 
                                   Reserved2: Integer): Integer;
    function FhnSBSGetOcxDirectory(const Reserved1: WideString; Reserved2: Integer): WideString;
    function FhnSBSReadText(const FileName: WideString; const Reserved1: WideString; 
                            Reserved2: Integer): Integer;
    function FhnSBSReadFileData(const FileName: WideString; const Reserved1: WideString; 
                                Reserved2: Integer): Integer;
    function FhnSBSQueryStrategyList(const ivmID: WideString; const PUID: WideString; 
                                     ChannelNo: Integer; const Reserved1: WideString; 
                                     const Reserved2: WideString; Reserved3: Integer; 
                                     Reserved4: Integer): Integer;
    function FhnSBSDeleteStrategyList(const ivmID: WideString; const StrategyId: WideString; 
                                      const PUID: WideString; ChannelNo: Integer; 
                                      const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhnSBSGetIvsReq(const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhnSBSSetRule(const ivmID: WideString; const PUID: WideString; ChannelNo: Integer; 
                           AlorgType: Integer; const Reserved1: WideString; 
                           const Reserved2: WideString; Reserved3: Integer; Reserved4: Integer): Integer;
    function FhnSBSOcxFileUpload(const s8ServerFileName: WideString; 
                                 const s8LocalFilePath: WideString; reserve1: Integer; 
                                 reserve2: Integer): WideString;
    function FhnSBSOcxFileDownload(const s8ServerFileName: WideString; 
                                   const s8LocalFileName: WideString; const reserve1: WideString; 
                                   reserve2: Integer): Integer;
    function FhnSBSUpDownFileOcxInitial(const s8ServerAddr: WideString; s16ServerPort: Integer; 
                                        const s8WorkDir: WideString; const reserve1: WideString; 
                                        reserve2: Integer): Integer;
    function FhnSBSDestroyUpDownFile(const reserve1: WideString; reserve2: Integer): Integer;
    function FhnSBSCaseArchiveRequest(const PUID: WideString; ChannelNo: Integer; 
                                      StartTime: Integer; EndTime: Integer; iCaseType: Integer; 
                                      const CaseTitle: WideString; const CaseDescribe: WideString; 
                                      const RecUrl: WideString; 
                                      IdmIp: {NOT_OLEAUTO(PWideChar)}OleVariant; IdmPort: Integer; 
                                      const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhnSBSGetCasePrecent(const Caseid: WideString; const IdmIp: WideString; 
                                  IdmPort: Integer; const Reserved1: WideString; Reserved2: Integer): Integer;
    function FHNSBSimgFormatTransform(const pathIn: WideString; const pathOut: WideString; 
                                      widOut: Integer; heiOut: Integer; const resever: WideString; 
                                      resever1: Integer; resever2: Integer): Integer;
    function FHNSBSGetLocRecTotalTime(const FileName: WideString): Integer;
    function FhzSBSShowIvs(const IdsIp: WideString; IdsPort: Integer; const PicPath: WideString; 
                           const RecInfo: WideString; RecType: Integer; StartTime: Integer; 
                           EndTime: Integer; const Reserved1: WideString; Reserved2: Integer; 
                           const Reserved3: WideString; Reserved4: Integer): Integer;
    function FhzSBSShowVg(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                          const PicPath: WideString; const RecInfo: WideString; RecType: Integer; 
                          StartTime: Integer; EndTime: Integer; const Reserved1: WideString; 
                          Reserved2: Integer; const Reserved3: WideString; Reserved4: Integer): Integer;
    function FhzSBSShowFc(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                          const PicPath: WideString; const RecInfo: WideString; RecType: Integer; 
                          StartTime: Integer; EndTime: Integer; const Reserved1: WideString; 
                          Reserved2: Integer; const Reserved3: WideString; Reserved4: Integer): Integer;
    function FhzSBSShowAbs(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                           const PicPath: WideString; const RecInfo: WideString; RecType: Integer; 
                           StartTime: Integer; EndTime: Integer; const Reserved1: WideString; 
                           Reserved2: Integer; const Reserved3: WideString; Reserved4: Integer): Integer;
    function FhzSBSHideIvs(const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhzSBSHideFc(const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhzWndHideVg(const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhzWndHideAbs(const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhzSBSInitSdk(const Reserved1: WideString; Reserved2: Integer): Integer;
    function FhzSBSDestroy(const Reserved1: WideString; Reserved2: Integer): Integer;
    procedure AboutBox;
    function FhnSBSAvxToAvi(const pFilePath: WideString; Reserved1: Integer; 
                            const Reserved2: WideString): Integer;
    function FhnSBSPlayRecordByTimeEX(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                                      StartTime: Integer; EndTime: Integer; StoreType: Integer; 
                                      FileType: Integer; ProtocolType: Integer; TransType: Integer; 
                                      Resver: Integer; const Resver1: WideString): Integer;
    function FhnVideoConverter(const StcPathName: WideString; const DstPathName: WideString; 
                               VideoType: Integer; const Revers: WideString; rever2: Integer): Integer;
    function FhzIsOpen(type_: Integer; resever: Integer): Integer;
    function FhnSBSGetAutoPresetNode(const PUID: WideString; ChannelNo: Integer; UserData: Integer; 
                                     reseve: Integer; const reseve1: WideString): Integer;
    function FhnSBSSlice(const PUID: WideString; ChannelNo: Integer; const CaseUrl: WideString; 
                         CaseType: Integer; CasewhetherHandle: Integer; Caseattribute: Integer; 
                         lStartTime: Integer; lFinishTime: Integer; const resever: WideString; 
                         const resever1: WideString; resever2: Integer; resever3: Integer): Integer;
    function FhnSBSSliteFlash(type_: Integer; time1: Integer; time2: Integer; time3: Integer; 
                              time4: Integer; const reseve: WideString; const resever2: WideString): Integer;
    function FhnGetVideoConverterPer(Handle: Integer; Reserver1: Integer; 
                                     const Reserver2: WideString): Double;
    property  ControlInterface: _DFhnSBSAtx read GetControlInterface;
    property  DefaultInterface: _DFhnSBSAtx read GetControlInterface;
  published
    property Anchors;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property FhnPropPtzStep: Integer index 1 read GetIntegerProp write SetIntegerProp stored False;
    property FhnPropCapPath: WideString index 2 read GetWideStringProp write SetWideStringProp stored False;
    property FhnPropRecPath: WideString index 3 read GetWideStringProp write SetWideStringProp stored False;
    property OnFhnSBSLoginEvent: TFhnSBSAtxFhnSBSLoginEvent read FOnFhnSBSLoginEvent write FOnFhnSBSLoginEvent;
    property OnFhnSBSDeviceOnlineEvent: TFhnSBSAtxFhnSBSDeviceOnlineEvent read FOnFhnSBSDeviceOnlineEvent write FOnFhnSBSDeviceOnlineEvent;
    property OnFhnSBSRecordQueryEvent: TFhnSBSAtxFhnSBSRecordQueryEvent read FOnFhnSBSRecordQueryEvent write FOnFhnSBSRecordQueryEvent;
    property OnFhnSBSGotAlm: TFhnSBSAtxFhnSBSGotAlm read FOnFhnSBSGotAlm write FOnFhnSBSGotAlm;
    property OnFhnSBSOfflineEvent: TFhnSBSAtxFhnSBSOfflineEvent read FOnFhnSBSOfflineEvent write FOnFhnSBSOfflineEvent;
    property OnFhnSBSGotDisplayParam: TFhnSBSAtxFhnSBSGotDisplayParam read FOnFhnSBSGotDisplayParam write FOnFhnSBSGotDisplayParam;
    property OnFhnSBSGetParamResp: TFhnSBSAtxFhnSBSGetParamResp read FOnFhnSBSGetParamResp write FOnFhnSBSGetParamResp;
    property OnFhnSBSSetDisplayResp: TFhnSBSAtxFhnSBSSetDisplayResp read FOnFhnSBSSetDisplayResp write FOnFhnSBSSetDisplayResp;
    property OnFhnSBSPuStateNotify: TFhnSBSAtxFhnSBSPuStateNotify read FOnFhnSBSPuStateNotify write FOnFhnSBSPuStateNotify;
    property OnFhnSBSNameChangeEvent: TFhnSBSAtxFhnSBSNameChangeEvent read FOnFhnSBSNameChangeEvent write FOnFhnSBSNameChangeEvent;
    property OnFhnSBSLogoutEvent: TFhnSBSAtxFhnSBSLogoutEvent read FOnFhnSBSLogoutEvent write FOnFhnSBSLogoutEvent;
    property OnFhnSBSPTZResp: TFhnSBSAtxFhnSBSPTZResp read FOnFhnSBSPTZResp write FOnFhnSBSPTZResp;
    property OnFhnSBSQueryPicEvent: TFhnSBSAtxFhnSBSQueryPicEvent read FOnFhnSBSQueryPicEvent write FOnFhnSBSQueryPicEvent;
    property OnFhnSBSGroupQueryEvent: TFhnSBSAtxFhnSBSGroupQueryEvent read FOnFhnSBSGroupQueryEvent write FOnFhnSBSGroupQueryEvent;
    property OnFhnSBSPulistQueryEvent: TFhnSBSAtxFhnSBSPulistQueryEvent read FOnFhnSBSPulistQueryEvent write FOnFhnSBSPulistQueryEvent;
    property OnFhnSBSPuInfoQueryEvent: TFhnSBSAtxFhnSBSPuInfoQueryEvent read FOnFhnSBSPuInfoQueryEvent write FOnFhnSBSPuInfoQueryEvent;
    property OnFhnSBSAllGroupQueryEvent: TFhnSBSAtxFhnSBSAllGroupQueryEvent read FOnFhnSBSAllGroupQueryEvent write FOnFhnSBSAllGroupQueryEvent;
    property OnFhnSBSAllPulistQueryEvent: TFhnSBSAtxFhnSBSAllPulistQueryEvent read FOnFhnSBSAllPulistQueryEvent write FOnFhnSBSAllPulistQueryEvent;
    property OnFhnSBSAllPuInfoQueryEvent: TFhnSBSAtxFhnSBSAllPuInfoQueryEvent read FOnFhnSBSAllPuInfoQueryEvent write FOnFhnSBSAllPuInfoQueryEvent;
    property OnFhnSBSWindowLeftClickedEvent: TFhnSBSAtxFhnSBSWindowLeftClickedEvent read FOnFhnSBSWindowLeftClickedEvent write FOnFhnSBSWindowLeftClickedEvent;
    property OnFhnSBSGetPresetEvent: TFhnSBSAtxFhnSBSGetPresetEvent read FOnFhnSBSGetPresetEvent write FOnFhnSBSGetPresetEvent;
    property OnFHNSBSQueryFinishEvent: TFhnSBSAtxFHNSBSQueryFinishEvent read FOnFHNSBSQueryFinishEvent write FOnFHNSBSQueryFinishEvent;
    property OnFhnSBSGetGpinChannelEvent: TFhnSBSAtxFhnSBSGetGpinChannelEvent read FOnFhnSBSGetGpinChannelEvent write FOnFhnSBSGetGpinChannelEvent;
    property OnFhnSBSRecordDownloadEvent: TFhnSBSAtxFhnSBSRecordDownloadEvent read FOnFhnSBSRecordDownloadEvent write FOnFhnSBSRecordDownloadEvent;
    property OnFhnSBSBroadcastStateEvent: TFhnSBSAtxFhnSBSBroadcastStateEvent read FOnFhnSBSBroadcastStateEvent write FOnFhnSBSBroadcastStateEvent;
    property OnFhnSBSMatrixQueryEvent: TFhnSBSAtxFhnSBSMatrixQueryEvent read FOnFhnSBSMatrixQueryEvent write FOnFhnSBSMatrixQueryEvent;
    property OnFhnSBSSpeakQueryEvent: TFhnSBSAtxFhnSBSSpeakQueryEvent read FOnFhnSBSSpeakQueryEvent write FOnFhnSBSSpeakQueryEvent;
    property OnFhnSBSPlayRecordEvent: TFhnSBSAtxFhnSBSPlayRecordEvent read FOnFhnSBSPlayRecordEvent write FOnFhnSBSPlayRecordEvent;
    property OnFhnSBSDownLoadPicEvent: TFhnSBSAtxFhnSBSDownLoadPicEvent read FOnFhnSBSDownLoadPicEvent write FOnFhnSBSDownLoadPicEvent;
    property OnFhnSBSRecordPalyEvent: TFhnSBSAtxFhnSBSRecordPalyEvent read FOnFhnSBSRecordPalyEvent write FOnFhnSBSRecordPalyEvent;
    property OnFhnSBSVideoStateNotifyEvent: TFhnSBSAtxFhnSBSVideoStateNotifyEvent read FOnFhnSBSVideoStateNotifyEvent write FOnFhnSBSVideoStateNotifyEvent;
    property OnFhnSBSGetEncodeResp: TFhnSBSAtxFhnSBSGetEncodeResp read FOnFhnSBSGetEncodeResp write FOnFhnSBSGetEncodeResp;
    property OnFhnSBSGetEncodeRespEvent: TFhnSBSAtxFhnSBSGetEncodeRespEvent read FOnFhnSBSGetEncodeRespEvent write FOnFhnSBSGetEncodeRespEvent;
    property OnFhnSBSServerRecordEvent: TFhnSBSAtxFhnSBSServerRecordEvent read FOnFhnSBSServerRecordEvent write FOnFhnSBSServerRecordEvent;
    property OnFhnSBSServerRecordStopEvent: TFhnSBSAtxFhnSBSServerRecordStopEvent read FOnFhnSBSServerRecordStopEvent write FOnFhnSBSServerRecordStopEvent;
    property OnFhnSBSSetOsdDisplayEvent: TFhnSBSAtxFhnSBSSetOsdDisplayEvent read FOnFhnSBSSetOsdDisplayEvent write FOnFhnSBSSetOsdDisplayEvent;
    property OnFhnSBSAddPresetNodeEvent: TFhnSBSAtxFhnSBSAddPresetNodeEvent read FOnFhnSBSAddPresetNodeEvent write FOnFhnSBSAddPresetNodeEvent;
    property OnFhnSBSDeletePresetNodeEvent: TFhnSBSAtxFhnSBSDeletePresetNodeEvent read FOnFhnSBSDeletePresetNodeEvent write FOnFhnSBSDeletePresetNodeEvent;
    property OnFhnSBSCallPresetNodeEvent: TFhnSBSAtxFhnSBSCallPresetNodeEvent read FOnFhnSBSCallPresetNodeEvent write FOnFhnSBSCallPresetNodeEvent;
    property OnFhnSBSGetCruiseEvent: TFhnSBSAtxFhnSBSGetCruiseEvent read FOnFhnSBSGetCruiseEvent write FOnFhnSBSGetCruiseEvent;
    property OnFhnSBSSetCruiseEvent: TFhnSBSAtxFhnSBSSetCruiseEvent read FOnFhnSBSSetCruiseEvent write FOnFhnSBSSetCruiseEvent;
    property OnFhnSBSPTZResultEvent: TFhnSBSAtxFhnSBSPTZResultEvent read FOnFhnSBSPTZResultEvent write FOnFhnSBSPTZResultEvent;
    property OnFhnSBSBroadcastStartEvent: TFhnSBSAtxFhnSBSBroadcastStartEvent read FOnFhnSBSBroadcastStartEvent write FOnFhnSBSBroadcastStartEvent;
    property OnFhnSBSSpeakStartEvent: TFhnSBSAtxFhnSBSSpeakStartEvent read FOnFhnSBSSpeakStartEvent write FOnFhnSBSSpeakStartEvent;
    property OnFhnSBSGetChannelInfoEvent: TFhnSBSAtxFhnSBSGetChannelInfoEvent read FOnFhnSBSGetChannelInfoEvent write FOnFhnSBSGetChannelInfoEvent;
    property OnFhnSBSPictureServrCapEvent: TFhnSBSAtxFhnSBSPictureServrCapEvent read FOnFhnSBSPictureServrCapEvent write FOnFhnSBSPictureServrCapEvent;
    property OnFhnSBSNvrGroupRecQueryEvent: TFhnSBSAtxFhnSBSNvrGroupRecQueryEvent read FOnFhnSBSNvrGroupRecQueryEvent write FOnFhnSBSNvrGroupRecQueryEvent;
    property OnFhnSBSGetOsdDisplayEvent: TFhnSBSAtxFhnSBSGetOsdDisplayEvent read FOnFhnSBSGetOsdDisplayEvent write FOnFhnSBSGetOsdDisplayEvent;
    property OnFhnSBSSetEncodeRespEvent: TFhnSBSAtxFhnSBSSetEncodeRespEvent read FOnFhnSBSSetEncodeRespEvent write FOnFhnSBSSetEncodeRespEvent;
    property OnFhnSBSLoadRecordEvent: TFhnSBSAtxFhnSBSLoadRecordEvent read FOnFhnSBSLoadRecordEvent write FOnFhnSBSLoadRecordEvent;
    property OnFhnSBSGetRecordTacticsRespEvent: TFhnSBSAtxFhnSBSGetRecordTacticsRespEvent read FOnFhnSBSGetRecordTacticsRespEvent write FOnFhnSBSGetRecordTacticsRespEvent;
    property OnFhnSBSSetRecordTacticsRespEvent: TFhnSBSAtxFhnSBSSetRecordTacticsRespEvent read FOnFhnSBSSetRecordTacticsRespEvent write FOnFhnSBSSetRecordTacticsRespEvent;
    property OnFhnSBSQueryPlatRecStatusEvent: TFhnSBSAtxFhnSBSQueryPlatRecStatusEvent read FOnFhnSBSQueryPlatRecStatusEvent write FOnFhnSBSQueryPlatRecStatusEvent;
    property OnFhnSBSAlarmRecEvent: TFhnSBSAtxFhnSBSAlarmRecEvent read FOnFhnSBSAlarmRecEvent write FOnFhnSBSAlarmRecEvent;
    property OnFhnSBSAutoPresetEvent: TFhnSBSAtxFhnSBSAutoPresetEvent read FOnFhnSBSAutoPresetEvent write FOnFhnSBSAutoPresetEvent;
    property OnFhnSBSQueryCapEvent: TFhnSBSAtxFhnSBSQueryCapEvent read FOnFhnSBSQueryCapEvent write FOnFhnSBSQueryCapEvent;
    property OnFhnSBSReadTestEvent: TFhnSBSAtxFhnSBSReadTestEvent read FOnFhnSBSReadTestEvent write FOnFhnSBSReadTestEvent;
    property OnFhnSBSGetStrategyListEvent: TFhnSBSAtxFhnSBSGetStrategyListEvent read FOnFhnSBSGetStrategyListEvent write FOnFhnSBSGetStrategyListEvent;
    property OnFhnSBSDeleteStrategyListEvent: TFhnSBSAtxFhnSBSDeleteStrategyListEvent read FOnFhnSBSDeleteStrategyListEvent write FOnFhnSBSDeleteStrategyListEvent;
    property OnFhnSBSSetRuleEvent: TFhnSBSAtxFhnSBSSetRuleEvent read FOnFhnSBSSetRuleEvent write FOnFhnSBSSetRuleEvent;
    property OnFhnSBSGetIvsEvent: TFhnSBSAtxFhnSBSGetIvsEvent read FOnFhnSBSGetIvsEvent write FOnFhnSBSGetIvsEvent;
    property OnFhnSBSGetIvsinfoEvent: TFhnSBSAtxFhnSBSGetIvsinfoEvent read FOnFhnSBSGetIvsinfoEvent write FOnFhnSBSGetIvsinfoEvent;
    property OnFhnSBSGetCaseinfoEvent: TFhnSBSAtxFhnSBSGetCaseinfoEvent read FOnFhnSBSGetCaseinfoEvent write FOnFhnSBSGetCaseinfoEvent;
    property OnFhnSBSOcxFileDisposalCBEvent: TFhnSBSAtxFhnSBSOcxFileDisposalCBEvent read FOnFhnSBSOcxFileDisposalCBEvent write FOnFhnSBSOcxFileDisposalCBEvent;
    property OnFhnSBSGetCasePrecentEvent: TFhnSBSAtxFhnSBSGetCasePrecentEvent read FOnFhnSBSGetCasePrecentEvent write FOnFhnSBSGetCasePrecentEvent;
    property OnFhzWndIvsPicEvent: TFhnSBSAtxFhzWndIvsPicEvent read FOnFhzWndIvsPicEvent write FOnFhzWndIvsPicEvent;
    property OnFhzWndVgPicEvent: TFhnSBSAtxFhzWndVgPicEvent read FOnFhzWndVgPicEvent write FOnFhzWndVgPicEvent;
    property OnFhzWndAbsPicEvent: TFhnSBSAtxFhzWndAbsPicEvent read FOnFhzWndAbsPicEvent write FOnFhzWndAbsPicEvent;
    property OnFhzWndFcPicEvent: TFhnSBSAtxFhzWndFcPicEvent read FOnFhzWndFcPicEvent write FOnFhzWndFcPicEvent;
    property OnFhnSBSVideoStateNotifyEventEx: TFhnSBSAtxFhnSBSVideoStateNotifyEventEx read FOnFhnSBSVideoStateNotifyEventEx write FOnFhnSBSVideoStateNotifyEventEx;
    property OnFhnSBSAvxToAviEnvent: TFhnSBSAtxFhnSBSAvxToAviEnvent read FOnFhnSBSAvxToAviEnvent write FOnFhnSBSAvxToAviEnvent;
    property OnFireFhnSBSGetAutoPresetEvent: TFhnSBSAtxFireFhnSBSGetAutoPresetEvent read FOnFireFhnSBSGetAutoPresetEvent write FOnFireFhnSBSGetAutoPresetEvent;
    property OnFhnSBSSliceEvent: TFhnSBSAtxFhnSBSSliceEvent read FOnFhnSBSSliceEvent write FOnFhnSBSSliceEvent;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

procedure TFhnSBSAtx.InitControlData;
const
  CEventDispIDs: array [0..72] of DWORD = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $00000006,
    $00000007, $00000008, $00000009, $0000000A, $0000000B, $0000000C,
    $0000000D, $0000000E, $0000000F, $00000010, $00000011, $00000012,
    $00000013, $00000014, $00000015, $00000016, $00000017, $00000018,
    $00000019, $0000001A, $0000001B, $0000001C, $0000001D, $0000001E,
    $0000001F, $00000020, $00000021, $00000022, $00000023, $00000024,
    $00000025, $00000026, $00000027, $00000028, $00000029, $0000002A,
    $0000002B, $0000002C, $0000002D, $0000002E, $0000002F, $00000030,
    $00000031, $00000032, $00000033, $00000034, $00000035, $00000036,
    $00000037, $00000038, $00000039, $0000003A, $0000003B, $0000003C,
    $0000003D, $0000003E, $0000003F, $00000040, $00000041, $00000042,
    $00000043, $00000044, $00000045, $00000046, $00000047, $00000048,
    $00000049);
  CControlData: TControlData2 = (
    ClassID:      '{B8052A2C-4D10-40B8-8A77-455900FF64F5}';
    EventIID:     '{8CA340B9-7DB4-41B9-B66E-88F101546E4E}';
    EventCount:   73;
    EventDispIDs: @CEventDispIDs;
    LicenseKey:   nil (*HR:$80004005*);
    Flags:        $00000000;
    Version:      500);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := UIntPtr(@@FOnFhnSBSLoginEvent) - UIntPtr(Self);
end;

procedure TFhnSBSAtx.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DFhnSBSAtx;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TFhnSBSAtx.GetControlInterface: _DFhnSBSAtx;
begin
  CreateControl;
  Result := FIntf;
end;

function TFhnSBSAtx.FhnSBSInitial(const serverip: WideString; serverport: Smallint): Integer;
begin
  Result := DefaultInterface.FhnSBSInitial(serverip, serverport);
end;

function TFhnSBSAtx.FhnSBSLogin(const UserName: WideString; const PassWord: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSLogin(UserName, PassWord);
end;

function TFhnSBSAtx.FhnSBSRTVideoReq(const PUID: WideString; ChannelNo: Integer; 
                                     const ChannelName: WideString; Reserved1: Integer; 
                                     Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSRTVideoReq(PUID, ChannelNo, ChannelName, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSPTZReq(OperateID: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSPTZReq(OperateID, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSSpeakReq(const PUID: WideString; ChannelNo: Integer; 
                                   const PUName: WideString; Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSSpeakReq(PUID, ChannelNo, PUName, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSRecordPlay(const PUID: WideString; ChannelNo: Integer; 
                                     StoreType: Integer; const FileName: WideString; 
                                     Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSRecordPlay(PUID, ChannelNo, StoreType, FileName, Reserved1, 
                                              Reserved2);
end;

function TFhnSBSAtx.FhnSBSRecordQeury(const PUID: WideString; ChannelNo: Integer; 
                                      StoreType: Integer; FileType: Integer; StartTime: Integer; 
                                      EndTime: Integer; ReceivedNum: Integer; Reserved: Integer; 
                                      Reserved1: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSRecordQeury(PUID, ChannelNo, StoreType, FileType, StartTime, 
                                               EndTime, ReceivedNum, Reserved, Reserved1);
end;

function TFhnSBSAtx.FhnSBSDestoy: Integer;
begin
  Result := DefaultInterface.FhnSBSDestoy;
end;

function TFhnSBSAtx.FhnSBSLogOut: Integer;
begin
  Result := DefaultInterface.FhnSBSLogOut;
end;

function TFhnSBSAtx.FhnSBSGetDisplayParam(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGetDisplayParam(PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSSetDisplayParam(const PUID: WideString; ChannelNo: Integer; 
                                          Contrast: Integer; Bright: Integer; Hue: Integer; 
                                          Saturation: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSSetDisplayParam(PUID, ChannelNo, Contrast, Bright, Hue, 
                                                   Saturation);
end;

function TFhnSBSAtx.FhnSBSGetVersion: WideString;
begin
  Result := DefaultInterface.FhnSBSGetVersion;
end;

function TFhnSBSAtx.FhnSBSSetServerVersion(version: Smallint): WordBool;
begin
  Result := DefaultInterface.FhnSBSSetServerVersion(version);
end;

function TFhnSBSAtx.FhnSBSInitial2(const serverip: WideString; serverport: Smallint; 
                                   const serverid: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSInitial2(serverip, serverport, serverid);
end;

function TFhnSBSAtx.FhnSBSSetDisplayParam2(const PUID: WideString; ChannelNo: Integer; 
                                           Contrast: Integer; Bright: Integer; Hue: Integer; 
                                           Saturation: Integer; Whiteness: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSSetDisplayParam2(PUID, ChannelNo, Contrast, Bright, Hue, 
                                                    Saturation, Whiteness);
end;

procedure TFhnSBSAtx.FhnSBSSetDeviceList(const DeviceListStr: WideString; Reserved: Integer);
begin
  DefaultInterface.FhnSBSSetDeviceList(DeviceListStr, Reserved);
end;

function TFhnSBSAtx.FHNSBSParamSet(const PUID: WideString; ChannelNo: Integer; 
                                   ChannelType: Integer; OperateID: Integer; Reserved1: Integer; 
                                   Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSParamSet(PUID, ChannelNo, ChannelType, OperateID, Reserved1, 
                                            Reserved2);
end;

function TFhnSBSAtx.FhnSBSPictureQuery(const PUID: WideString; ChannelNo: Integer; 
                                       StoryType: Integer; FileType: Integer; StartTime: Integer; 
                                       EndTime: Integer; ReceiveNum: Integer; QueryCount: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSPictureQuery(PUID, ChannelNo, StoryType, FileType, StartTime, 
                                                EndTime, ReceiveNum, QueryCount);
end;

procedure TFhnSBSAtx.FhnSBSTestStartVideo(channelnum: Smallint);
begin
  DefaultInterface.FhnSBSTestStartVideo(channelnum);
end;

function TFhnSBSAtx.FhnSBSGroupQuery: Integer;
begin
  Result := DefaultInterface.FhnSBSGroupQuery;
end;

function TFhnSBSAtx.FhnSBSPulistQuery(GroupID: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSPulistQuery(GroupID);
end;

function TFhnSBSAtx.FhnSBSPuInfoQuery(const PUID: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSPuInfoQuery(PUID);
end;

procedure TFhnSBSAtx.FHNSBSLocalConfigSet;
begin
  DefaultInterface.FHNSBSLocalConfigSet;
end;

procedure TFhnSBSAtx.FHNSBSPwdChange;
begin
  DefaultInterface.FHNSBSPwdChange;
end;

function TFhnSBSAtx.FhnSBSAllGroupQuery: Integer;
begin
  Result := DefaultInterface.FhnSBSAllGroupQuery;
end;

function TFhnSBSAtx.FhnSBSGisRTVideoReq(x: Smallint; y: Smallint; const PUID: WideString; 
                                        ChannelNo: Integer; const ChannelName: WideString; 
                                        Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGisRTVideoReq(x, y, PUID, ChannelNo, ChannelName, Reserved1, 
                                                 Reserved2);
end;

procedure TFhnSBSAtx.FhnSBSTestRecordPlay;
begin
  DefaultInterface.FhnSBSTestRecordPlay;
end;

function TFhnSBSAtx.FhnSBSGetPreset(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGetPreset(PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSCallPreset(const PUID: WideString; ChannelNo: Integer; 
                                     const ChannelName: WideString; PresetIndex: Smallint; 
                                     Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSCallPreset(PUID, ChannelNo, ChannelName, PresetIndex, Reserved1, 
                                              Reserved2);
end;

function TFhnSBSAtx.FHNSBSGetChannel(const PUID: WideString): Integer;
begin
  Result := DefaultInterface.FHNSBSGetChannel(PUID);
end;

function TFhnSBSAtx.FhnSBSAlarmReport(const PUID: WideString; ChannelNo: Integer; 
                                      AlarmType: Integer; const AlarmTime: WideString; 
                                      const UserData: WideString; Reserved1: Integer; 
                                      Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSAlarmReport(PUID, ChannelNo, AlarmType, AlarmTime, UserData, 
                                               Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSRecDownload(PUID: {NOT_OLEAUTO(PWideChar)}OleVariant; ChannelNo: Integer; 
                                      DownloadType: Integer; 
                                      FileName: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                                      StartTime: Integer; EndTime: Integer; 
                                      DownloadName: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                                      StoreType: Integer; FileType: Integer; Reserved: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSRecDownload(PUID, ChannelNo, DownloadType, FileName, StartTime, 
                                               EndTime, DownloadName, StoreType, FileType, Reserved);
end;

function TFhnSBSAtx.FhnSBSBroadcastReq(const PuidList: WideString; ChannelNo: Integer; 
                                       AudioFormat: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSBroadcastReq(PuidList, ChannelNo, AudioFormat, Reserved1, 
                                                Reserved2);
end;

function TFhnSBSAtx.FhnSBSBroadcastStop(BroadcastHandle: Integer; Reserved1: Integer; 
                                        Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSBroadcastStop(BroadcastHandle, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSMatrixReq(const PUID: WideString; ChannelNo: Integer; 
                                    const ChannelName: WideString; const DUID: WideString; 
                                    DuChannelNo: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSMatrixReq(PUID, ChannelNo, ChannelName, DUID, DuChannelNo, 
                                             Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSMatrixStop(const PUID: WideString; ChannelNo: Integer; 
                                     const ChannelName: WideString; const DUID: WideString; 
                                     DuChannelNo: Integer; Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSMatrixStop(PUID, ChannelNo, ChannelName, DUID, DuChannelNo, 
                                              Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSMatrixQuery(const DUID: WideString; DuChannelNo: Integer; 
                                      Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSMatrixQuery(DUID, DuChannelNo, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSSpeakQuery(const UserData: WideString; Reserved1: Integer; 
                                     Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSSpeakQuery(UserData, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSPlayVideo(hWnd: Integer; const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSPlayVideo(hWnd, PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSStopVideo(CallID: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStopVideo(CallID);
end;

function TFhnSBSAtx.FhnSBSPlayVideoEx(hWnd: Integer; const PUID: WideString; ChannelNo: Integer; 
                                      Reserved1: Integer; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSPlayVideoEx(hWnd, PUID, ChannelNo, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSPTZControl(const PUID: WideString; ChannelNo: Integer; 
                                     OperateID: Integer; Param1: Integer; Param2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSPTZControl(PUID, ChannelNo, OperateID, Param1, Param2);
end;

function TFhnSBSAtx.FhnSBSStartLocalRecord(CallID: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStartLocalRecord(CallID);
end;

function TFhnSBSAtx.FhnSBSStopLocalRecord(CallID: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStopLocalRecord(CallID);
end;

function TFhnSBSAtx.FhnSBSServerCap(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSServerCap(PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSStartServerRecord(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStartServerRecord(PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSPlayRecordByTime(hWnd: Integer; const PUID: WideString; 
                                           ChannelNo: Integer; StartTime: Integer; 
                                           EndTime: Integer; StoreType: Integer; FileType: Integer; 
                                           Reserved: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSPlayRecordByTime(hWnd, PUID, ChannelNo, StartTime, EndTime, 
                                                    StoreType, FileType, Reserved);
end;

function TFhnSBSAtx.FhnSBSStopPlayRecord(CallID: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStopPlayRecord(CallID);
end;

function TFhnSBSAtx.FhnSBSSpeak(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSSpeak(PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSBroadcast(const PuidList: WideString; ChannelNo: Integer; 
                                    AudioFormat: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSBroadcast(PuidList, ChannelNo, AudioFormat);
end;

function TFhnSBSAtx.FhnSBSStopAudio(CallID: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStopAudio(CallID);
end;

function TFhnSBSAtx.FhnSBSLoginEx(const UserName: WideString; const PassWord: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSLoginEx(UserName, PassWord);
end;

function TFhnSBSAtx.FhnSBSPictureDownLoad(const FileName: WideString; const loadpath: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSPictureDownLoad(FileName, loadpath);
end;

function TFhnSBSAtx.FhnSBSStartRecordAudio: Integer;
begin
  Result := DefaultInterface.FhnSBSStartRecordAudio;
end;

function TFhnSBSAtx.FhnSBSStopRecordAudio: Integer;
begin
  Result := DefaultInterface.FhnSBSStopRecordAudio;
end;

function TFhnSBSAtx.FHNSBSStartRecordPlay(hWnd: Integer; const PUID: WideString; 
                                          ChannelNo: Integer; StoreType: Integer; 
                                          const FileName: WideString; Reserved1: Integer; 
                                          Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSStartRecordPlay(hWnd, PUID, ChannelNo, StoreType, FileName, 
                                                   Reserved1, Reserved2);
end;

procedure TFhnSBSAtx.FhnSBSChannelInfoDlg(const PUID: WideString; channelid: Integer; type_: Integer);
begin
  DefaultInterface.FhnSBSChannelInfoDlg(PUID, channelid, type_);
end;

function TFhnSBSAtx.FhnSBSGroupOnly: Integer;
begin
  Result := DefaultInterface.FhnSBSGroupOnly;
end;

function TFhnSBSAtx.FHNSBSGetVideoEncodeReq(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSGetVideoEncodeReq(PUID, ChannelNo);
end;

function TFhnSBSAtx.FHNSBSSetVideoEncodeReq(const PUID: WideString; ChannelNo: Integer; 
                                            BitRate: Integer; BitRateType: Integer; 
                                            EncodeMode: Integer; FrameRate: Integer; 
                                            IFrameInterval: Integer; ImageSize: Integer; 
                                            PicQuality: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSSetVideoEncodeReq(PUID, ChannelNo, BitRate, BitRateType, 
                                                     EncodeMode, FrameRate, IFrameInterval, 
                                                     ImageSize, PicQuality);
end;

function TFhnSBSAtx.FhnSBSLocalCap(CallID: Integer; CapType: Integer; const FileName: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSLocalCap(CallID, CapType, FileName);
end;

function TFhnSBSAtx.FhnSBSStoptServerRecord(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStoptServerRecord(PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSSetOsdDisplay(const PUID: WideString; ChannelNo: Integer; 
                                        bitmapX: Integer; bitmapY: Integer; bitmapTextX: Integer; 
                                        bitmapTextY: Integer; bitmapTimeEnable: WordBool; 
                                        bitmapTextEnable: WordBool; const bitmapText: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSSetOsdDisplay(PUID, ChannelNo, bitmapX, bitmapY, bitmapTextX, 
                                                 bitmapTextY, bitmapTimeEnable, bitmapTextEnable, 
                                                 bitmapText);
end;

function TFhnSBSAtx.FhnSBSGetPresetNode(const PUID: WideString; ChannelNo: Integer; Handle: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGetPresetNode(PUID, ChannelNo, Handle);
end;

function TFhnSBSAtx.FhnSBSAddPresetNode(const PUID: WideString; ChannelNo: Integer; 
                                        NewIndex: Integer; const NewName: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSAddPresetNode(PUID, ChannelNo, NewIndex, NewName);
end;

function TFhnSBSAtx.FhnSBSDeletePresetNode(const PUID: WideString; ChannelNo: Integer; 
                                           DeleteIndex: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSDeletePresetNode(PUID, ChannelNo, DeleteIndex);
end;

function TFhnSBSAtx.FhnSBSCallPresetNode(const PUID: WideString; ChannelNo: Integer; 
                                         CallIndex: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSCallPresetNode(PUID, ChannelNo, CallIndex);
end;

function TFhnSBSAtx.FhnSBSGetCruiseNode(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGetCruiseNode(PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSSetCruiseNode(const PUID: WideString; ChannelNo: Integer; 
                                        const CruiseData: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSSetCruiseNode(PUID, ChannelNo, CruiseData);
end;

function TFhnSBSAtx.FhnSBSStartCruise(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStartCruise(PUID, ChannelNo);
end;

function TFhnSBSAtx.FhnSBSStopCruise(const PUID: WideString; ChannelNo: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStopCruise(PUID, ChannelNo);
end;

function TFhnSBSAtx.GetFhnCtlHandle: Integer;
begin
  Result := DefaultInterface.GetFhnCtlHandle;
end;

function TFhnSBSAtx.FhnSBSVideoInfo(const PUID: WideString; Channel: Integer; Reserved1: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSVideoInfo(PUID, Channel, Reserved1);
end;

function TFhnSBSAtx.FHNSBSRecordControlPlay(lRecHandle: Integer; Operate: Integer; Speed: Integer; 
                                            totoalRecTime: Integer; Rerver1: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSRecordControlPlay(lRecHandle, Operate, Speed, totoalRecTime, 
                                                     Rerver1);
end;

function TFhnSBSAtx.FhnSBSPictureServrCap(const PUID: WideString; ChannelNo: Integer; 
                                          capQuality: Integer; capSize: Integer; capTimes: Integer; 
                                          reserve1: Integer; reserve2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSPictureServrCap(PUID, ChannelNo, capQuality, capSize, capTimes, 
                                                   reserve1, reserve2);
end;

function TFhnSBSAtx.fhnGetLongTime(const time: WideString): Integer;
begin
  Result := DefaultInterface.fhnGetLongTime(time);
end;

function TFhnSBSAtx.FhnSBSNvrGroupRecQuery(CurSwitchTemplate: Integer; uFileType: Integer; 
                                           uStoreType: Integer; const sPuInfo: WideString; 
                                           beginTime: Integer; EndTime: Integer; 
                                           uQueryStart: Integer; uQueryNum: Integer; 
                                           _lParam: Integer; const _sParam: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSNvrGroupRecQuery(CurSwitchTemplate, uFileType, uStoreType, 
                                                    sPuInfo, beginTime, EndTime, uQueryStart, 
                                                    uQueryNum, _lParam, _sParam);
end;

function TFhnSBSAtx.FHNSBSGetVodCurrTime(VODVideoHandle: Integer; const sParam: WideString): Integer;
begin
  Result := DefaultInterface.FHNSBSGetVodCurrTime(VODVideoHandle, sParam);
end;

function TFhnSBSAtx.FhnSBSGetOsdDisplay(const PUID: WideString; Channel: Integer; reserve: Integer; 
                                        reserve1: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGetOsdDisplay(PUID, Channel, reserve, reserve1);
end;

function TFhnSBSAtx.FhnSBSQueryAlmPic(const PUID: WideString; ChannelNo: Integer; 
                                      PicStorePos: Integer; const AlarmId: WideString; 
                                      Rerver1: Integer; Rerver2: Integer; const Rerver3: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSQueryAlmPic(PUID, ChannelNo, PicStorePos, AlarmId, Rerver1, 
                                               Rerver2, Rerver3);
end;

function TFhnSBSAtx.FhnSBSLoadDownRecordByTime(const PUID: WideString; ChannelNo: Integer; 
                                               StartTime: Integer; EndTime: Integer; 
                                               const LoaddownPath: WideString; 
                                               const Reserved: WideString; Reserved1: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSLoadDownRecordByTime(PUID, ChannelNo, StartTime, EndTime,
                                                        LoaddownPath, Reserved, Reserved1, 1);
end;

function TFhnSBSAtx.FhnSBSGetRecordReq(const PUID: WideString; ChannelNo: Integer; 
                                       ChannelType: Integer; IsPu: Integer; 
                                       const Resverd: WideString; Resverd1: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGetRecordReq(PUID, ChannelNo, ChannelType, IsPu, Resverd, 
                                                Resverd1);
end;

function TFhnSBSAtx.FhnSBSSetRecordReq(const PUID: WideString; ChannelNo: Integer; 
                                       StoreType: Integer; const data: WideString; 
                                       enable1: Integer; const data1: WideString; enable2: Integer; 
                                       const data2: WideString; enable3: Integer; 
                                       const data3: WideString; const reseved: WideString; 
                                       reseved1: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSSetRecordReq(PUID, ChannelNo, StoreType, data, enable1, data1, 
                                                enable2, data2, enable3, data3, reseved, reseved1);
end;

function TFhnSBSAtx.FhnSBSParamQueryRecordState(const PUID: WideString; ChannelNo: Integer; 
                                                StoreType: Integer; Reserved: Integer; 
                                                const Reserved1: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSParamQueryRecordState(PUID, ChannelNo, StoreType, Reserved, 
                                                         Reserved1);
end;

function TFhnSBSAtx.FHNSBSGetDownloadPecent(handler: Integer; const reseved: WideString; 
                                            reseved1: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSGetDownloadPecent(handler, reseved, reseved1);
end;

function TFhnSBSAtx.FhnSBSQueryAlmRec(const PUID: WideString; ChannelNo: Integer; 
                                      const AlarmId: WideString; StoreType: Integer; 
                                      Rerver1: Integer; Rerver2: Integer; const Rerver3: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSQueryAlmRec(PUID, ChannelNo, AlarmId, StoreType, Rerver1, 
                                               Rerver2, Rerver3);
end;

function TFhnSBSAtx.FhnSBSGetMyPath(const reseve1: WideString; reseve2: Integer): WideString;
begin
  Result := DefaultInterface.FhnSBSGetMyPath(reseve1, reseve2);
end;

function TFhnSBSAtx.FhnSBSRecordPlayByURL(const SFileUrl: WideString; hWnd: Integer; 
                                          StartTime: Integer; EndTime: Integer; Resver: Integer; 
                                          const Resver1: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSRecordPlayByURL(SFileUrl, hWnd, StartTime, EndTime, Resver, 
                                                   Resver1);
end;

function TFhnSBSAtx.FhnSBSAutoPresetNode(const PUID: WideString; ChannelNo: Integer; 
                                         Index: Integer; ResetTime: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSAutoPresetNode(PUID, ChannelNo, Index, ResetTime);
end;

function TFhnSBSAtx.FhnSBSGetRecPath: WideString;
begin
  Result := DefaultInterface.FhnSBSGetRecPath;
end;

function TFhnSBSAtx.FhnSBSSetRecPath(const path: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSSetRecPath(path);
end;

function TFhnSBSAtx.FHNSBSOPENFILE(const path: WideString; resever: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSOPENFILE(path, resever);
end;

function TFhnSBSAtx.FHNSBSFINDFILE(const path: WideString; resever: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSFINDFILE(path, resever);
end;

function TFhnSBSAtx.FhnSBSStartLocalRecordEx(const path: WideString; CallID: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSStartLocalRecordEx(path, CallID);
end;

function TFhnSBSAtx.FhnSBSLocalCapEx(CallID: Integer; CapType: Integer; 
                                     const fullfilename: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSLocalCapEx(CallID, CapType, fullfilename);
end;

function TFhnSBSAtx.FhnSBSWriteText(const path: WideString; const FileName: WideString; 
                                    const data: WideString; const Reserved1: WideString; 
                                    Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSWriteText(path, FileName, data, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSCreateDirectory(const path: WideString; const Reserved1: WideString; 
                                          Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSCreateDirectory(path, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSDeleteDirectory(const path: WideString; const Reserved1: WideString; 
                                          Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSDeleteDirectory(path, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSGetOcxDirectory(const Reserved1: WideString; Reserved2: Integer): WideString;
begin
  Result := DefaultInterface.FhnSBSGetOcxDirectory(Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSReadText(const FileName: WideString; const Reserved1: WideString; 
                                   Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSReadText(FileName, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSReadFileData(const FileName: WideString; const Reserved1: WideString; 
                                       Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSReadFileData(FileName, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSQueryStrategyList(const ivmID: WideString; const PUID: WideString; 
                                            ChannelNo: Integer; const Reserved1: WideString; 
                                            const Reserved2: WideString; Reserved3: Integer; 
                                            Reserved4: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSQueryStrategyList(ivmID, PUID, ChannelNo, Reserved1, Reserved2, 
                                                     Reserved3, Reserved4);
end;

function TFhnSBSAtx.FhnSBSDeleteStrategyList(const ivmID: WideString; const StrategyId: WideString; 
                                             const PUID: WideString; ChannelNo: Integer; 
                                             const Reserved1: WideString; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSDeleteStrategyList(ivmID, StrategyId, PUID, ChannelNo, 
                                                      Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSGetIvsReq(const Reserved1: WideString; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGetIvsReq(Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSSetRule(const ivmID: WideString; const PUID: WideString; 
                                  ChannelNo: Integer; AlorgType: Integer; 
                                  const Reserved1: WideString; const Reserved2: WideString; 
                                  Reserved3: Integer; Reserved4: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSSetRule(ivmID, PUID, ChannelNo, AlorgType, Reserved1, Reserved2, 
                                           Reserved3, Reserved4);
end;

function TFhnSBSAtx.FhnSBSOcxFileUpload(const s8ServerFileName: WideString; 
                                        const s8LocalFilePath: WideString; reserve1: Integer; 
                                        reserve2: Integer): WideString;
begin
  Result := DefaultInterface.FhnSBSOcxFileUpload(s8ServerFileName, s8LocalFilePath, reserve1, 
                                                 reserve2);
end;

function TFhnSBSAtx.FhnSBSOcxFileDownload(const s8ServerFileName: WideString; 
                                          const s8LocalFileName: WideString; 
                                          const reserve1: WideString; reserve2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSOcxFileDownload(s8ServerFileName, s8LocalFileName, reserve1, 
                                                   reserve2);
end;

function TFhnSBSAtx.FhnSBSUpDownFileOcxInitial(const s8ServerAddr: WideString; 
                                               s16ServerPort: Integer; const s8WorkDir: WideString; 
                                               const reserve1: WideString; reserve2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSUpDownFileOcxInitial(s8ServerAddr, s16ServerPort, s8WorkDir, 
                                                        reserve1, reserve2);
end;

function TFhnSBSAtx.FhnSBSDestroyUpDownFile(const reserve1: WideString; reserve2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSDestroyUpDownFile(reserve1, reserve2);
end;

function TFhnSBSAtx.FhnSBSCaseArchiveRequest(const PUID: WideString; ChannelNo: Integer; 
                                             StartTime: Integer; EndTime: Integer; 
                                             iCaseType: Integer; const CaseTitle: WideString; 
                                             const CaseDescribe: WideString; 
                                             const RecUrl: WideString; 
                                             IdmIp: {NOT_OLEAUTO(PWideChar)}OleVariant; 
                                             IdmPort: Integer; const Reserved1: WideString; 
                                             Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSCaseArchiveRequest(PUID, ChannelNo, StartTime, EndTime, 
                                                      iCaseType, CaseTitle, CaseDescribe, RecUrl, 
                                                      IdmIp, IdmPort, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSGetCasePrecent(const Caseid: WideString; const IdmIp: WideString; 
                                         IdmPort: Integer; const Reserved1: WideString; 
                                         Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSGetCasePrecent(Caseid, IdmIp, IdmPort, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FHNSBSimgFormatTransform(const pathIn: WideString; const pathOut: WideString; 
                                             widOut: Integer; heiOut: Integer; 
                                             const resever: WideString; resever1: Integer; 
                                             resever2: Integer): Integer;
begin
  Result := DefaultInterface.FHNSBSimgFormatTransform(pathIn, pathOut, widOut, heiOut, resever, 
                                                      resever1, resever2);
end;

function TFhnSBSAtx.FHNSBSGetLocRecTotalTime(const FileName: WideString): Integer;
begin
  Result := DefaultInterface.FHNSBSGetLocRecTotalTime(FileName);
end;

function TFhnSBSAtx.FhzSBSShowIvs(const IdsIp: WideString; IdsPort: Integer; 
                                  const PicPath: WideString; const RecInfo: WideString; 
                                  RecType: Integer; StartTime: Integer; EndTime: Integer; 
                                  const Reserved1: WideString; Reserved2: Integer; 
                                  const Reserved3: WideString; Reserved4: Integer): Integer;
begin
  Result := DefaultInterface.FhzSBSShowIvs(IdsIp, IdsPort, PicPath, RecInfo, RecType, StartTime, 
                                           EndTime, Reserved1, Reserved2, Reserved3, Reserved4);
end;

function TFhnSBSAtx.FhzSBSShowVg(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                                 const PicPath: WideString; const RecInfo: WideString; 
                                 RecType: Integer; StartTime: Integer; EndTime: Integer; 
                                 const Reserved1: WideString; Reserved2: Integer; 
                                 const Reserved3: WideString; Reserved4: Integer): Integer;
begin
  Result := DefaultInterface.FhzSBSShowVg(hWnd, IdsIp, IdsPort, PicPath, RecInfo, RecType, 
                                          StartTime, EndTime, Reserved1, Reserved2, Reserved3, 
                                          Reserved4);
end;

function TFhnSBSAtx.FhzSBSShowFc(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                                 const PicPath: WideString; const RecInfo: WideString; 
                                 RecType: Integer; StartTime: Integer; EndTime: Integer; 
                                 const Reserved1: WideString; Reserved2: Integer; 
                                 const Reserved3: WideString; Reserved4: Integer): Integer;
begin
  Result := DefaultInterface.FhzSBSShowFc(hWnd, IdsIp, IdsPort, PicPath, RecInfo, RecType, 
                                          StartTime, EndTime, Reserved1, Reserved2, Reserved3, 
                                          Reserved4);
end;

function TFhnSBSAtx.FhzSBSShowAbs(hWnd: Integer; const IdsIp: WideString; IdsPort: Integer; 
                                  const PicPath: WideString; const RecInfo: WideString; 
                                  RecType: Integer; StartTime: Integer; EndTime: Integer; 
                                  const Reserved1: WideString; Reserved2: Integer; 
                                  const Reserved3: WideString; Reserved4: Integer): Integer;
begin
  Result := DefaultInterface.FhzSBSShowAbs(hWnd, IdsIp, IdsPort, PicPath, RecInfo, RecType, 
                                           StartTime, EndTime, Reserved1, Reserved2, Reserved3, 
                                           Reserved4);
end;

function TFhnSBSAtx.FhzSBSHideIvs(const Reserved1: WideString; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhzSBSHideIvs(Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhzSBSHideFc(const Reserved1: WideString; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhzSBSHideFc(Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhzWndHideVg(const Reserved1: WideString; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhzWndHideVg(Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhzWndHideAbs(const Reserved1: WideString; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhzWndHideAbs(Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhzSBSInitSdk(const Reserved1: WideString; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhzSBSInitSdk(Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhzSBSDestroy(const Reserved1: WideString; Reserved2: Integer): Integer;
begin
  Result := DefaultInterface.FhzSBSDestroy(Reserved1, Reserved2);
end;

procedure TFhnSBSAtx.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

function TFhnSBSAtx.FhnSBSAvxToAvi(const pFilePath: WideString; Reserved1: Integer; 
                                   const Reserved2: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSAvxToAvi(pFilePath, Reserved1, Reserved2);
end;

function TFhnSBSAtx.FhnSBSPlayRecordByTimeEX(hWnd: Integer; const PUID: WideString; 
                                             ChannelNo: Integer; StartTime: Integer; 
                                             EndTime: Integer; StoreType: Integer; 
                                             FileType: Integer; ProtocolType: Integer; 
                                             TransType: Integer; Resver: Integer; 
                                             const Resver1: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSPlayRecordByTimeEX(hWnd, PUID, ChannelNo, StartTime, EndTime, 
                                                      StoreType, FileType, ProtocolType, TransType, 
                                                      Resver, Resver1);
end;

function TFhnSBSAtx.FhnVideoConverter(const StcPathName: WideString; const DstPathName: WideString; 
                                      VideoType: Integer; const Revers: WideString; rever2: Integer): Integer;
begin
  Result := DefaultInterface.FhnVideoConverter(StcPathName, DstPathName, VideoType, Revers, rever2);
end;

function TFhnSBSAtx.FhzIsOpen(type_: Integer; resever: Integer): Integer;
begin
  Result := DefaultInterface.FhzIsOpen(type_, resever);
end;

function TFhnSBSAtx.FhnSBSGetAutoPresetNode(const PUID: WideString; ChannelNo: Integer; 
                                            UserData: Integer; reseve: Integer; 
                                            const reseve1: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSGetAutoPresetNode(PUID, ChannelNo, UserData, reseve, reseve1);
end;

function TFhnSBSAtx.FhnSBSSlice(const PUID: WideString; ChannelNo: Integer; 
                                const CaseUrl: WideString; CaseType: Integer; 
                                CasewhetherHandle: Integer; Caseattribute: Integer; 
                                lStartTime: Integer; lFinishTime: Integer; 
                                const resever: WideString; const resever1: WideString; 
                                resever2: Integer; resever3: Integer): Integer;
begin
  Result := DefaultInterface.FhnSBSSlice(PUID, ChannelNo, CaseUrl, CaseType, CasewhetherHandle, 
                                         Caseattribute, lStartTime, lFinishTime, resever, resever1, 
                                         resever2, resever3);
end;

function TFhnSBSAtx.FhnSBSSliteFlash(type_: Integer; time1: Integer; time2: Integer; 
                                     time3: Integer; time4: Integer; const reseve: WideString; 
                                     const resever2: WideString): Integer;
begin
  Result := DefaultInterface.FhnSBSSliteFlash(type_, time1, time2, time3, time4, reseve, resever2);
end;

function TFhnSBSAtx.FhnGetVideoConverterPer(Handle: Integer; Reserver1: Integer; 
                                            const Reserver2: WideString): Double;
begin
  Result := DefaultInterface.FhnGetVideoConverterPer(Handle, Reserver1, Reserver2);
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TFhnSBSAtx]);
end;

end.
