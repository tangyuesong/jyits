// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : F:\df.xml
//  >Import : F:\df1.xml
//  >Import : F:\df1.xml>0
//  >Import : F:\df1.xml>1
// Encoding : utf-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (2018/3/8 12:19:51 - - $Rev: 86412 $)
// ************************************************************************ //

unit uDfWsdl;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_ATTR = $0010;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:long            - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:unsignedInt     - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:float           - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]

  ResetConfigReq       = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  SubmitJobReq         = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  TestReq              = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  UpdateJobReq         = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  WSTempInfo           = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSStreamRange        = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSCameraInfo         = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  UpdateUserReq        = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  UpdateConfigReq      = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  TasksReq             = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  QueryJobReq          = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  LogoutReq            = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  StopShowReq          = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  WSResourceInfo       = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSJobStatus          = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSJobInfo            = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSDayTime            = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSTimeRange          = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSTaskInfo           = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSJobQueryCond       = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSDestinationInfo    = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSPlanInfo           = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  LoginRsp             = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  UpdateConfigRsp      = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  UpdateJobRsp         = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  UpdateUserRsp        = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  TaskExecuteLogRsp    = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  TasksRsp             = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  TestRsp              = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  PicAnalysisRsp       = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  QueryJobRsp          = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  PauseJobRsp          = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  LogoutRsp            = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  NodeResourceReq      = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  NodeResourceRsp      = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  StopShowRsp          = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  SubmitJobRsp         = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  StartShowRsp         = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  RecoverJobRsp        = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  ResetConfigRsp       = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  StartShowReq         = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  WSTaskExecuteLog     = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  TaskExecuteLogReq    = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  WSStreamInfo         = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSPageCond           = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSNodeInfo           = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSExecuteTimeRange   = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  GetSourceProgressReq = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  GetResourceReq       = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  GetConfReq           = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  GetConfRsp           = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  JobStatusRsp         = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  LoginReq             = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  GetSourceProgressRsp = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  HeaderReq            = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  DelJobRsp            = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  WSConfig             = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  WSVcaRect            = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  AllocateResourceRsp  = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  GetResourceRsp       = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[Lit][GblElm] }
  WSPreProcRet         = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }
  PicAnalysisReq       = class;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  WSHumanProcRet       = class;                 { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblCplx] }



  // ************************************************************************ //
  // XML       : ResetConfigReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  ResetConfigReq = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : SubmitJobReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  SubmitJobReq = class(TRemotable)
  private
    FjobInfo: WSJobInfo;
  public
    destructor Destroy; override;
  published
    property jobInfo: WSJobInfo  read FjobInfo write FjobInfo;
  end;

  Array_Of_WSConfig = array of WSConfig;        { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSJobStatus = array of WSJobStatus;   { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSTimeRange = array of WSTimeRange;   { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSDestinationInfo = array of WSDestinationInfo;   { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSDayTime = array of WSDayTime;      { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSNodeInfo = array of WSNodeInfo;    { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSTaskExecuteLog = array of WSTaskExecuteLog;   { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSTaskInfo = array of WSTaskInfo;    { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSJobInfo = array of WSJobInfo;      { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSPreProcRet = array of WSPreProcRet;   { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }
  Array_Of_WSHumanProcRet = array of WSHumanProcRet;   { "http://www.hikvision.com.cn/ver1/schema/ivms/"[GblUbnd] }


  // ************************************************************************ //
  // XML       : TestReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  TestReq = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : UpdateJobReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  UpdateJobReq = class(TRemotable)
  private
    FjobInfo: WSJobInfo;
  public
    destructor Destroy; override;
  published
    property jobInfo: WSJobInfo  read FjobInfo write FjobInfo;
  end;



  // ************************************************************************ //
  // XML       : WSTempInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSTempInfo = class(TRemotable)
  private
    FstreamRange: WSStreamRange;
    FstreamRange_Specified: boolean;
    FexeTimeRange: WSTimeRange;
    procedure SetstreamRange(Index: Integer; const AWSStreamRange: WSStreamRange);
    function  streamRange_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property streamRange:  WSStreamRange  Index (IS_OPTN) read FstreamRange write SetstreamRange stored streamRange_Specified;
    property exeTimeRange: WSTimeRange    read FexeTimeRange write FexeTimeRange;
  end;



  // ************************************************************************ //
  // XML       : WSStreamRange, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSStreamRange = class(TRemotable)
  private
    Fstart: string;
    Fend_: string;
  published
    property start: string  read Fstart write Fstart;
    property end_:  string  read Fend_ write Fend_;
  end;



  // ************************************************************************ //
  // XML       : WSCameraInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSCameraInfo = class(TRemotable)
  private
    FcameraDetail: string;
    FcameraDetail_Specified: boolean;
    Fresolution: string;
    Fresolution_Specified: boolean;
    procedure SetcameraDetail(Index: Integer; const Astring: string);
    function  cameraDetail_Specified(Index: Integer): boolean;
    procedure Setresolution(Index: Integer; const Astring: string);
    function  resolution_Specified(Index: Integer): boolean;
  published
    property cameraDetail: string  Index (IS_OPTN) read FcameraDetail write SetcameraDetail stored cameraDetail_Specified;
    property resolution:   string  Index (IS_OPTN) read Fresolution write Setresolution stored resolution_Specified;
  end;



  // ************************************************************************ //
  // XML       : UpdateUserReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  UpdateUserReq = class(TRemotable)
  private
    FuserName: string;
    Fpassword: string;
  published
    property userName: string  read FuserName write FuserName;
    property password: string  read Fpassword write Fpassword;
  end;



  // ************************************************************************ //
  // XML       : UpdateConfigReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  UpdateConfigReq = class(TRemotable)
  private
    Fname_: string;
    Fvalue: string;
  published
    property name_: string  read Fname_ write Fname_;
    property value: string  read Fvalue write Fvalue;
  end;



  // ************************************************************************ //
  // XML       : TasksReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  TasksReq = class(TRemotable)
  private
    FjobId: string;
  published
    property jobId: string  read FjobId write FjobId;
  end;



  // ************************************************************************ //
  // XML       : QueryJobReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  QueryJobReq = class(TRemotable)
  private
    FjobId: string;
    FjobId_Specified: boolean;
    FjobQueryCond: WSJobQueryCond;
    FjobQueryCond_Specified: boolean;
    procedure SetjobId(Index: Integer; const Astring: string);
    function  jobId_Specified(Index: Integer): boolean;
    procedure SetjobQueryCond(Index: Integer; const AWSJobQueryCond: WSJobQueryCond);
    function  jobQueryCond_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property jobId:        string          Index (IS_OPTN) read FjobId write SetjobId stored jobId_Specified;
    property jobQueryCond: WSJobQueryCond  Index (IS_OPTN) read FjobQueryCond write SetjobQueryCond stored jobQueryCond_Specified;
  end;

  RecoverJobReq = array of string;              { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }


  // ************************************************************************ //
  // XML       : LogoutReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  LogoutReq = class(TRemotable)
  private
    Ftoken: string;
  published
    property token: string  read Ftoken write Ftoken;
  end;

  PauseJobReq = array of string;                { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }


  // ************************************************************************ //
  // XML       : StopShowReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  StopShowReq = class(TRemotable)
  private
    FjobId: string;
  published
    property jobId: string  read FjobId write FjobId;
  end;



  // ************************************************************************ //
  // XML       : WSResourceInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSResourceInfo = class(TRemotable)
  private
    FdataSourceType: Integer;
    FanalyzeType: Integer;
    FanalyzeMode: Integer;
    Frate: Integer;
    Ftotal: Integer;
    Fremain: Integer;
    FsingleMaxAbility: Integer;
  published
    property dataSourceType:   Integer  read FdataSourceType write FdataSourceType;
    property analyzeType:      Integer  read FanalyzeType write FanalyzeType;
    property analyzeMode:      Integer  read FanalyzeMode write FanalyzeMode;
    property rate:             Integer  read Frate write Frate;
    property total:            Integer  read Ftotal write Ftotal;
    property remain:           Integer  read Fremain write Fremain;
    property singleMaxAbility: Integer  read FsingleMaxAbility write FsingleMaxAbility;
  end;



  // ************************************************************************ //
  // XML       : WSJobStatus, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSJobStatus = class(TRemotable)
  private
    FjobId: string;
    FstatusType: Integer;
    FerrorCode: Integer;
    FshowStatusType: Integer;
    Fprocess: Double;
  published
    property jobId:          string   read FjobId write FjobId;
    property statusType:     Integer  read FstatusType write FstatusType;
    property errorCode:      Integer  read FerrorCode write FerrorCode;
    property showStatusType: Integer  read FshowStatusType write FshowStatusType;
    property process:        Double   read Fprocess write Fprocess;
  end;



  // ************************************************************************ //
  // XML       : WSJobInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSJobInfo = class(TRemotable)
  private
    FjobId: string;
    FjobId_Specified: boolean;
    FjobName: string;
    FjobType: Integer;
    FdataSourceType: Integer;
    Fpriority: Integer;
    Fsource: string;
    FalgorithmType: Integer;
    FdestinationInfos: Array_Of_WSDestinationInfo;
    FcameraInfo: WSCameraInfo;
    FcameraInfo_Specified: boolean;
    FstreamInfo: WSStreamInfo;
    FplanInfo: WSPlanInfo;
    FplanInfo_Specified: boolean;
    FtempInfo: WSTempInfo;
    FtempInfo_Specified: boolean;
    FruleInfo: string;
    FruleInfo_Specified: boolean;
    FsubmitTime: string;
    Freserve: string;
    Freserve_Specified: boolean;
    procedure SetjobId(Index: Integer; const Astring: string);
    function  jobId_Specified(Index: Integer): boolean;
    procedure SetcameraInfo(Index: Integer; const AWSCameraInfo: WSCameraInfo);
    function  cameraInfo_Specified(Index: Integer): boolean;
    procedure SetplanInfo(Index: Integer; const AWSPlanInfo: WSPlanInfo);
    function  planInfo_Specified(Index: Integer): boolean;
    procedure SettempInfo(Index: Integer; const AWSTempInfo: WSTempInfo);
    function  tempInfo_Specified(Index: Integer): boolean;
    procedure SetruleInfo(Index: Integer; const Astring: string);
    function  ruleInfo_Specified(Index: Integer): boolean;
    procedure Setreserve(Index: Integer; const Astring: string);
    function  reserve_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property jobId:            string                      Index (IS_OPTN) read FjobId write SetjobId stored jobId_Specified;
    property jobName:          string                      read FjobName write FjobName;
    property jobType:          Integer                     read FjobType write FjobType;
    property dataSourceType:   Integer                     read FdataSourceType write FdataSourceType;
    property priority:         Integer                     read Fpriority write Fpriority;
    property source:           string                      read Fsource write Fsource;
    property algorithmType:    Integer                     read FalgorithmType write FalgorithmType;
    property destinationInfos: Array_Of_WSDestinationInfo  Index (IS_UNBD) read FdestinationInfos write FdestinationInfos;
    property cameraInfo:       WSCameraInfo                Index (IS_OPTN) read FcameraInfo write SetcameraInfo stored cameraInfo_Specified;
    property streamInfo:       WSStreamInfo                read FstreamInfo write FstreamInfo;
    property planInfo:         WSPlanInfo                  Index (IS_OPTN) read FplanInfo write SetplanInfo stored planInfo_Specified;
    property tempInfo:         WSTempInfo                  Index (IS_OPTN) read FtempInfo write SettempInfo stored tempInfo_Specified;
    property ruleInfo:         string                      Index (IS_OPTN) read FruleInfo write SetruleInfo stored ruleInfo_Specified;
    property submitTime:       string                      read FsubmitTime write FsubmitTime;
    property reserve:          string                      Index (IS_OPTN) read Freserve write Setreserve stored reserve_Specified;
  end;



  // ************************************************************************ //
  // XML       : WSDayTime, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSDayTime = class(TRemotable)
  private
    Fday: Integer;
    FexeTimeRange: Array_Of_WSTimeRange;
  public
    destructor Destroy; override;
  published
    property day:          Integer               read Fday write Fday;
    property exeTimeRange: Array_Of_WSTimeRange  Index (IS_UNBD) read FexeTimeRange write FexeTimeRange;
  end;



  // ************************************************************************ //
  // XML       : WSTimeRange, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSTimeRange = class(TRemotable)
  private
    FstartTime: string;
    FendTime: string;
    FplanAlgorithmType: Integer;
  published
    property startTime:         string   read FstartTime write FstartTime;
    property endTime:           string   read FendTime write FendTime;
    property planAlgorithmType: Integer  read FplanAlgorithmType write FplanAlgorithmType;
  end;



  // ************************************************************************ //
  // XML       : WSTaskInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSTaskInfo = class(TRemotable)
  private
    FtaskId: string;
    FjobId: string;
    FplanTimeRange: WSExecuteTimeRange;
    FplanTimeRange_Specified: boolean;
    Fprocess: Double;
    FstatusId: Integer;
    FlastStatus: Integer;
    FexecuteNode: string;
    FexecuteNode_Specified: boolean;
    procedure SetplanTimeRange(Index: Integer; const AWSExecuteTimeRange: WSExecuteTimeRange);
    function  planTimeRange_Specified(Index: Integer): boolean;
    procedure SetexecuteNode(Index: Integer; const Astring: string);
    function  executeNode_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property taskId:        string              read FtaskId write FtaskId;
    property jobId:         string              read FjobId write FjobId;
    property planTimeRange: WSExecuteTimeRange  Index (IS_OPTN) read FplanTimeRange write SetplanTimeRange stored planTimeRange_Specified;
    property process:       Double              read Fprocess write Fprocess;
    property statusId:      Integer             read FstatusId write FstatusId;
    property lastStatus:    Integer             read FlastStatus write FlastStatus;
    property executeNode:   string              Index (IS_OPTN) read FexecuteNode write SetexecuteNode stored executeNode_Specified;
  end;



  // ************************************************************************ //
  // XML       : WSJobQueryCond, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSJobQueryCond = class(TRemotable)
  private
    FpageCond: WSPageCond;
    FjobType: Integer;
    FsubmitTimeRange: WSTimeRange;
    FsubmitTimeRange_Specified: boolean;
    Fsource: string;
    Fsource_Specified: boolean;
    procedure SetsubmitTimeRange(Index: Integer; const AWSTimeRange: WSTimeRange);
    function  submitTimeRange_Specified(Index: Integer): boolean;
    procedure Setsource(Index: Integer; const Astring: string);
    function  source_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property pageCond:        WSPageCond   read FpageCond write FpageCond;
    property jobType:         Integer      read FjobType write FjobType;
    property submitTimeRange: WSTimeRange  Index (IS_OPTN) read FsubmitTimeRange write SetsubmitTimeRange stored submitTimeRange_Specified;
    property source:          string       Index (IS_OPTN) read Fsource write Setsource stored source_Specified;
  end;



  // ************************************************************************ //
  // XML       : WSDestinationInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSDestinationInfo = class(TRemotable)
  private
    FdestinationUrl: string;
    FdestinationType: Integer;
    FuserName: string;
    FuserName_Specified: boolean;
    Fpassword: string;
    Fpassword_Specified: boolean;
    Freserve: string;
    Freserve_Specified: boolean;
    procedure SetuserName(Index: Integer; const Astring: string);
    function  userName_Specified(Index: Integer): boolean;
    procedure Setpassword(Index: Integer; const Astring: string);
    function  password_Specified(Index: Integer): boolean;
    procedure Setreserve(Index: Integer; const Astring: string);
    function  reserve_Specified(Index: Integer): boolean;
  published
    property destinationUrl:  string   read FdestinationUrl write FdestinationUrl;
    property destinationType: Integer  read FdestinationType write FdestinationType;
    property userName:        string   Index (IS_OPTN) read FuserName write SetuserName stored userName_Specified;
    property password:        string   Index (IS_OPTN) read Fpassword write Setpassword stored password_Specified;
    property reserve:         string   Index (IS_OPTN) read Freserve write Setreserve stored reserve_Specified;
  end;



  // ************************************************************************ //
  // XML       : WSPlanInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSPlanInfo = class(TRemotable)
  private
    FdaysAgo: Integer;
    FstreamRange: WSStreamRange;
    FstreamRange_Specified: boolean;
    FexeTimeList: Array_Of_WSDayTime;
    procedure SetstreamRange(Index: Integer; const AWSStreamRange: WSStreamRange);
    function  streamRange_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property daysAgo:     Integer             read FdaysAgo write FdaysAgo;
    property streamRange: WSStreamRange       Index (IS_OPTN) read FstreamRange write SetstreamRange stored streamRange_Specified;
    property exeTimeList: Array_Of_WSDayTime  Index (IS_UNBD) read FexeTimeList write FexeTimeList;
  end;



  // ************************************************************************ //
  // XML       : LoginRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  LoginRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    Ftoken: string;
    Ftoken_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
    procedure Settoken(Index: Integer; const Astring: string);
    function  token_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property token:     string   Index (IS_OPTN) read Ftoken write Settoken stored token_Specified;
  end;



  // ************************************************************************ //
  // XML       : UpdateConfigRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  UpdateConfigRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : UpdateJobRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  UpdateJobRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : UpdateUserRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  UpdateUserRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : TaskExecuteLogRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  TaskExecuteLogRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    FtaskExecuteLogs: Array_Of_WSTaskExecuteLog;
    FtaskExecuteLogs_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
    procedure SettaskExecuteLogs(Index: Integer; const AArray_Of_WSTaskExecuteLog: Array_Of_WSTaskExecuteLog);
    function  taskExecuteLogs_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property errorCode:       Integer                    read FerrorCode write FerrorCode;
    property errorMsg:        string                     Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property taskExecuteLogs: Array_Of_WSTaskExecuteLog  Index (IS_OPTN or IS_UNBD or IS_NLBL) read FtaskExecuteLogs write SettaskExecuteLogs stored taskExecuteLogs_Specified;
  end;



  // ************************************************************************ //
  // XML       : TasksRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  TasksRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    FtaskInfos: Array_Of_WSTaskInfo;
    FtaskInfos_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
    procedure SettaskInfos(Index: Integer; const AArray_Of_WSTaskInfo: Array_Of_WSTaskInfo);
    function  taskInfos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property errorCode: Integer              read FerrorCode write FerrorCode;
    property errorMsg:  string               Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property taskInfos: Array_Of_WSTaskInfo  Index (IS_OPTN or IS_UNBD or IS_NLBL) read FtaskInfos write SettaskInfos stored taskInfos_Specified;
  end;



  // ************************************************************************ //
  // XML       : TestRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  TestRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : PicAnalysisRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  PicAnalysisRsp = class(TRemotable)
  private
    FErrorCode: Integer;
    FErrorMsg: string;
    FnTagNum: Integer;
    FstPreProcRet: Array_Of_WSPreProcRet;
    FstPreProcRet_Specified: boolean;
    FstHumanProcRet: Array_Of_WSHumanProcRet;
    FstHumanProcRet_Specified: boolean;
    procedure SetstPreProcRet(Index: Integer; const AArray_Of_WSPreProcRet: Array_Of_WSPreProcRet);
    function  stPreProcRet_Specified(Index: Integer): boolean;
    procedure SetstHumanProcRet(Index: Integer; const AArray_Of_WSHumanProcRet: Array_Of_WSHumanProcRet);
    function  stHumanProcRet_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ErrorCode:      Integer                  read FErrorCode write FErrorCode;
    property ErrorMsg:       string                   read FErrorMsg write FErrorMsg;
    property nTagNum:        Integer                  read FnTagNum write FnTagNum;
    property stPreProcRet:   Array_Of_WSPreProcRet    Index (IS_OPTN or IS_UNBD or IS_NLBL) read FstPreProcRet write SetstPreProcRet stored stPreProcRet_Specified;
    property stHumanProcRet: Array_Of_WSHumanProcRet  Index (IS_OPTN or IS_UNBD or IS_NLBL) read FstHumanProcRet write SetstHumanProcRet stored stHumanProcRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : QueryJobRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  QueryJobRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    FqueryJobs: Array_Of_WSJobInfo;
    FqueryJobs_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
    procedure SetqueryJobs(Index: Integer; const AArray_Of_WSJobInfo: Array_Of_WSJobInfo);
    function  queryJobs_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property errorCode: Integer             read FerrorCode write FerrorCode;
    property errorMsg:  string              Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property queryJobs: Array_Of_WSJobInfo  Index (IS_OPTN or IS_UNBD or IS_NLBL) read FqueryJobs write SetqueryJobs stored queryJobs_Specified;
  end;



  // ************************************************************************ //
  // XML       : PauseJobRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  PauseJobRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : LogoutRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  LogoutRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : NodeResourceReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  NodeResourceReq = class(TRemotable)
  private
    FpageCond: WSPageCond;
    FnodeType: Integer;
    Fonline: Integer;
  public
    destructor Destroy; override;
  published
    property pageCond: WSPageCond  read FpageCond write FpageCond;
    property nodeType: Integer     read FnodeType write FnodeType;
    property online:   Integer     read Fonline write Fonline;
  end;



  // ************************************************************************ //
  // XML       : NodeResourceRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  NodeResourceRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    FnodeList: Array_Of_WSNodeInfo;
    FnodeList_Specified: boolean;
    FtotalCount: Integer;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
    procedure SetnodeList(Index: Integer; const AArray_Of_WSNodeInfo: Array_Of_WSNodeInfo);
    function  nodeList_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property errorCode:  Integer              read FerrorCode write FerrorCode;
    property errorMsg:   string               Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property nodeList:   Array_Of_WSNodeInfo  Index (IS_OPTN or IS_UNBD or IS_NLBL) read FnodeList write SetnodeList stored nodeList_Specified;
    property totalCount: Integer              read FtotalCount write FtotalCount;
  end;



  // ************************************************************************ //
  // XML       : StopShowRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  StopShowRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : SubmitJobRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  SubmitJobRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    FjobId: string;
    FjobId_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
    procedure SetjobId(Index: Integer; const Astring: string);
    function  jobId_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property jobId:     string   Index (IS_OPTN) read FjobId write SetjobId stored jobId_Specified;
  end;



  // ************************************************************************ //
  // XML       : StartShowRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  StartShowRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : RecoverJobRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  RecoverJobRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : ResetConfigRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  ResetConfigRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : StartShowReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  StartShowReq = class(TRemotable)
  private
    FjobId: string;
    Fip: string;
    FstreamPort: Integer;
    FstruPort: Integer;
  published
    property jobId:      string   read FjobId write FjobId;
    property ip:         string   read Fip write Fip;
    property streamPort: Integer  read FstreamPort write FstreamPort;
    property struPort:   Integer  read FstruPort write FstruPort;
  end;



  // ************************************************************************ //
  // XML       : WSTaskExecuteLog, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSTaskExecuteLog = class(TRemotable)
  private
    Fid: Int64;
    FlogId: string;
    FtaskId: string;
    FjobId: string;
    FexecuteDate: string;
    FstartTime: string;
    FstartTime_Specified: boolean;
    FendTime: string;
    FendTime_Specified: boolean;
    FdataSourceType: Integer;
    FdataSourceType_Specified: boolean;
    FstreamStart: string;
    FstreamStart_Specified: boolean;
    FstreamEnd: string;
    FstreamEnd_Specified: boolean;
    FstreamType: Integer;
    FexecuteStartTime: string;
    FexecuteStartTime_Specified: boolean;
    FexecuteEndTime: string;
    FexecuteEndTime_Specified: boolean;
    FexecuteStreamStart: string;
    FexecuteStreamStart_Specified: boolean;
    FexecuteStreamEnd: string;
    FexecuteStreamEnd_Specified: boolean;
    FdayOfPlan: Int64;
    FstreamTime: Int64;
    FstatusId: Integer;
    FexecuteNode: string;
    FstreamRangeType: Integer;
    procedure SetstartTime(Index: Integer; const Astring: string);
    function  startTime_Specified(Index: Integer): boolean;
    procedure SetendTime(Index: Integer; const Astring: string);
    function  endTime_Specified(Index: Integer): boolean;
    procedure SetdataSourceType(Index: Integer; const AInteger: Integer);
    function  dataSourceType_Specified(Index: Integer): boolean;
    procedure SetstreamStart(Index: Integer; const Astring: string);
    function  streamStart_Specified(Index: Integer): boolean;
    procedure SetstreamEnd(Index: Integer; const Astring: string);
    function  streamEnd_Specified(Index: Integer): boolean;
    procedure SetexecuteStartTime(Index: Integer; const Astring: string);
    function  executeStartTime_Specified(Index: Integer): boolean;
    procedure SetexecuteEndTime(Index: Integer; const Astring: string);
    function  executeEndTime_Specified(Index: Integer): boolean;
    procedure SetexecuteStreamStart(Index: Integer; const Astring: string);
    function  executeStreamStart_Specified(Index: Integer): boolean;
    procedure SetexecuteStreamEnd(Index: Integer; const Astring: string);
    function  executeStreamEnd_Specified(Index: Integer): boolean;
  published
    property id:                 Int64    read Fid write Fid;
    property logId:              string   read FlogId write FlogId;
    property taskId:             string   read FtaskId write FtaskId;
    property jobId:              string   read FjobId write FjobId;
    property executeDate:        string   read FexecuteDate write FexecuteDate;
    property startTime:          string   Index (IS_OPTN) read FstartTime write SetstartTime stored startTime_Specified;
    property endTime:            string   Index (IS_OPTN) read FendTime write SetendTime stored endTime_Specified;
    property dataSourceType:     Integer  Index (IS_OPTN) read FdataSourceType write SetdataSourceType stored dataSourceType_Specified;
    property streamStart:        string   Index (IS_OPTN) read FstreamStart write SetstreamStart stored streamStart_Specified;
    property streamEnd:          string   Index (IS_OPTN) read FstreamEnd write SetstreamEnd stored streamEnd_Specified;
    property streamType:         Integer  read FstreamType write FstreamType;
    property executeStartTime:   string   Index (IS_OPTN) read FexecuteStartTime write SetexecuteStartTime stored executeStartTime_Specified;
    property executeEndTime:     string   Index (IS_OPTN) read FexecuteEndTime write SetexecuteEndTime stored executeEndTime_Specified;
    property executeStreamStart: string   Index (IS_OPTN) read FexecuteStreamStart write SetexecuteStreamStart stored executeStreamStart_Specified;
    property executeStreamEnd:   string   Index (IS_OPTN) read FexecuteStreamEnd write SetexecuteStreamEnd stored executeStreamEnd_Specified;
    property dayOfPlan:          Int64    read FdayOfPlan write FdayOfPlan;
    property streamTime:         Int64    read FstreamTime write FstreamTime;
    property statusId:           Integer  read FstatusId write FstatusId;
    property executeNode:        string   read FexecuteNode write FexecuteNode;
    property streamRangeType:    Integer  read FstreamRangeType write FstreamRangeType;
  end;



  // ************************************************************************ //
  // XML       : TaskExecuteLogReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  TaskExecuteLogReq = class(TRemotable)
  private
    FstartExecuteLogId: Int64;
    Flimit: Integer;
  published
    property startExecuteLogId: Int64    read FstartExecuteLogId write FstartExecuteLogId;
    property limit:             Integer  read Flimit write Flimit;
  end;



  // ************************************************************************ //
  // XML       : WSStreamInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSStreamInfo = class(TRemotable)
  private
    FuserName: string;
    FuserName_Specified: boolean;
    FpassWord: string;
    FpassWord_Specified: boolean;
    FstreamType: Integer;
    FstreamUrl: string;
    Fsmart: Boolean;
    FmaxSplitCount: Integer;
    FsplitTime: Int64;
    procedure SetuserName(Index: Integer; const Astring: string);
    function  userName_Specified(Index: Integer): boolean;
    procedure SetpassWord(Index: Integer; const Astring: string);
    function  passWord_Specified(Index: Integer): boolean;
  published
    property userName:      string   Index (IS_OPTN) read FuserName write SetuserName stored userName_Specified;
    property passWord:      string   Index (IS_OPTN) read FpassWord write SetpassWord stored passWord_Specified;
    property streamType:    Integer  read FstreamType write FstreamType;
    property streamUrl:     string   read FstreamUrl write FstreamUrl;
    property smart:         Boolean  read Fsmart write Fsmart;
    property maxSplitCount: Integer  read FmaxSplitCount write FmaxSplitCount;
    property splitTime:     Int64    read FsplitTime write FsplitTime;
  end;



  // ************************************************************************ //
  // XML       : WSPageCond, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSPageCond = class(TRemotable)
  private
    FpageSize: Integer;
    FcurrentPage: Integer;
  published
    property pageSize:    Integer  read FpageSize write FpageSize;
    property currentPage: Integer  read FcurrentPage write FcurrentPage;
  end;



  // ************************************************************************ //
  // XML       : WSNodeInfo, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSNodeInfo = class(TRemotable)
  private
    FnodeId: string;
    FnodeId_Specified: boolean;
    FnodeIp: string;
    FnodeName: string;
    FnodeName_Specified: boolean;
    FtotalResource: Integer;
    FremainResource: Integer;
    FtaskNum: Integer;
    FdiskUsed: Double;
    FdiskTotal: Double;
    FusedCpu: Double;
    FusedMem: Double;
    FmemTotal: Double;
    FonLineStatus: Integer;
    Fdog: Boolean;
    FnodeType: Integer;
    FhaStatus: Integer;
    procedure SetnodeId(Index: Integer; const Astring: string);
    function  nodeId_Specified(Index: Integer): boolean;
    procedure SetnodeName(Index: Integer; const Astring: string);
    function  nodeName_Specified(Index: Integer): boolean;
  published
    property nodeId:         string   Index (IS_OPTN) read FnodeId write SetnodeId stored nodeId_Specified;
    property nodeIp:         string   read FnodeIp write FnodeIp;
    property nodeName:       string   Index (IS_OPTN) read FnodeName write SetnodeName stored nodeName_Specified;
    property totalResource:  Integer  read FtotalResource write FtotalResource;
    property remainResource: Integer  read FremainResource write FremainResource;
    property taskNum:        Integer  read FtaskNum write FtaskNum;
    property diskUsed:       Double   read FdiskUsed write FdiskUsed;
    property diskTotal:      Double   read FdiskTotal write FdiskTotal;
    property usedCpu:        Double   read FusedCpu write FusedCpu;
    property usedMem:        Double   read FusedMem write FusedMem;
    property memTotal:       Double   read FmemTotal write FmemTotal;
    property onLineStatus:   Integer  read FonLineStatus write FonLineStatus;
    property dog:            Boolean  read Fdog write Fdog;
    property nodeType:       Integer  read FnodeType write FnodeType;
    property haStatus:       Integer  read FhaStatus write FhaStatus;
  end;



  // ************************************************************************ //
  // XML       : WSExecuteTimeRange, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSExecuteTimeRange = class(TRemotable)
  private
    FexecTime: WSTimeRange;
    FexecStream: WSStreamRange;
  public
    destructor Destroy; override;
  published
    property execTime:   WSTimeRange    read FexecTime write FexecTime;
    property execStream: WSStreamRange  read FexecStream write FexecStream;
  end;



  // ************************************************************************ //
  // XML       : GetSourceProgressReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  GetSourceProgressReq = class(TRemotable)
  private
    FjobSource: string;
    Ftotal: Integer;
  published
    property jobSource: string   read FjobSource write FjobSource;
    property total:     Integer  read Ftotal write Ftotal;
  end;



  // ************************************************************************ //
  // XML       : GetResourceReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  GetResourceReq = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : GetConfReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  GetConfReq = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : GetConfRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetConfRsp = class(TRemotable)
  private
    Fconfig: Array_Of_WSConfig;
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property config:    Array_Of_WSConfig  Index (IS_UNBD) read Fconfig write Fconfig;
    property errorCode: Integer            read FerrorCode write FerrorCode;
    property errorMsg:  string             Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : JobStatusRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  JobStatusRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    FjobStatus: Array_Of_WSJobStatus;
    FjobStatus_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
    procedure SetjobStatus(Index: Integer; const AArray_Of_WSJobStatus: Array_Of_WSJobStatus);
    function  jobStatus_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property errorCode: Integer               read FerrorCode write FerrorCode;
    property errorMsg:  string                Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property jobStatus: Array_Of_WSJobStatus  Index (IS_OPTN or IS_UNBD or IS_NLBL) read FjobStatus write SetjobStatus stored jobStatus_Specified;
  end;



  // ************************************************************************ //
  // XML       : LoginReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  LoginReq = class(TRemotable)
  private
    FuserName: string;
    Fpassword: string;
  public
    constructor Create; override;
  published
    property userName: string  read FuserName write FuserName;
    property password: string  read Fpassword write Fpassword;
  end;

  JobStatusReq = array of string;               { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }


  // ************************************************************************ //
  // XML       : GetSourceProgressRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetSourceProgressRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    Ftotal: Integer;
    Fremain: Integer;
    Fprogress: Double;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property total:     Integer  read Ftotal write Ftotal;
    property remain:    Integer  read Fremain write Fremain;
    property progress:  Double   read Fprogress write Fprogress;
  end;



  // ************************************************************************ //
  // XML       : HeaderReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  HeaderReq = class(TRemotable)
  private
    Ftoken: string;
    Fversion: string;
  public
    constructor Create; override;
  published
    property token:   string  read Ftoken write Ftoken;
    property version: string  read Fversion write Fversion;
  end;



  // ************************************************************************ //
  // XML       : DelJobRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  DelJobRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : WSConfig, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSConfig = class(TRemotable)
  private
    Fid: Integer;
    Fname_: string;
    Fvalue: string;
    FdefaultValue: string;
    Fmin: string;
    Fmax: string;
    Ftype_: Integer;
    Fmodifiable: Boolean;
  published
    property id:           Integer  read Fid write Fid;
    property name_:        string   read Fname_ write Fname_;
    property value:        string   read Fvalue write Fvalue;
    property defaultValue: string   read FdefaultValue write FdefaultValue;
    property min:          string   read Fmin write Fmin;
    property max:          string   read Fmax write Fmax;
    property type_:        Integer  read Ftype_ write Ftype_;
    property modifiable:   Boolean  read Fmodifiable write Fmodifiable;
  end;



  // ************************************************************************ //
  // XML       : WSVcaRect, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSVcaRect = class(TRemotable)
  private
    Fx: Single;
    Fy: Single;
    Fwidth: Single;
    Fheight: Single;
  published
    property x:      Single  Index (IS_ATTR) read Fx write Fx;
    property y:      Single  Index (IS_ATTR) read Fy write Fy;
    property width:  Single  Index (IS_ATTR) read Fwidth write Fwidth;
    property height: Single  Index (IS_ATTR) read Fheight write Fheight;
  end;



  // ************************************************************************ //
  // XML       : AllocateResourceRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  AllocateResourceRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property errorCode: Integer  read FerrorCode write FerrorCode;
    property errorMsg:  string   Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
  end;

  DelJobReq  = array of string;                 { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }
  AllocateResourceReq = array of WSResourceInfo;   { "http://www.hikvision.com.cn/ver1/ivms/wsdl"[GblElm] }


  // ************************************************************************ //
  // XML       : GetResourceRsp, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  GetResourceRsp = class(TRemotable)
  private
    FerrorCode: Integer;
    FerrorMsg: string;
    FerrorMsg_Specified: boolean;
    Ftotal: Integer;
    Fremain: Integer;
    FresourceInfo: AllocateResourceReq;
    FresourceInfo_Specified: boolean;
    procedure SeterrorMsg(Index: Integer; const Astring: string);
    function  errorMsg_Specified(Index: Integer): boolean;
    procedure SetresourceInfo(Index: Integer; const AAllocateResourceReq: AllocateResourceReq);
    function  resourceInfo_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property errorCode:    Integer              read FerrorCode write FerrorCode;
    property errorMsg:     string               Index (IS_OPTN) read FerrorMsg write SeterrorMsg stored errorMsg_Specified;
    property total:        Integer              read Ftotal write Ftotal;
    property remain:       Integer              read Fremain write Fremain;
    property resourceInfo: AllocateResourceReq  Index (IS_OPTN or IS_UNBD or IS_NLBL) read FresourceInfo write SetresourceInfo stored resourceInfo_Specified;
  end;



  // ************************************************************************ //
  // XML       : WSPreProcRet, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSPreProcRet = class(TRemotable)
  private
    FnTagID: Cardinal;
    FPlateNum: string;
    FnColor: Cardinal;
    FnType: Cardinal;
    FnMainLogo: Cardinal;
    FnSubLogo: Cardinal;
    FnModel: Cardinal;
    FnPilotSB: Cardinal;
    FnCopilotSB: Cardinal;
    FnPilotSV: Cardinal;
    FnCopilotSV: Cardinal;
    FnDangMark: Cardinal;
    FnEnvProSign: Cardinal;
    FnUPhone: Cardinal;
    FnPendant: Cardinal;
    FstTagRect: WSVcaRect;
    FstTagModel: TByteDynArray;
    FextendAttr: string;
  public
    destructor Destroy; override;
  published
    property nTagID:      Cardinal       read FnTagID write FnTagID;
    property PlateNum:    string         read FPlateNum write FPlateNum;
    property nColor:      Cardinal       read FnColor write FnColor;
    property nType:       Cardinal       read FnType write FnType;
    property nMainLogo:   Cardinal       read FnMainLogo write FnMainLogo;
    property nSubLogo:    Cardinal       read FnSubLogo write FnSubLogo;
    property nModel:      Cardinal       read FnModel write FnModel;
    property nPilotSB:    Cardinal       read FnPilotSB write FnPilotSB;
    property nCopilotSB:  Cardinal       read FnCopilotSB write FnCopilotSB;
    property nPilotSV:    Cardinal       read FnPilotSV write FnPilotSV;
    property nCopilotSV:  Cardinal       read FnCopilotSV write FnCopilotSV;
    property nDangMark:   Cardinal       read FnDangMark write FnDangMark;
    property nEnvProSign: Cardinal       read FnEnvProSign write FnEnvProSign;
    property nUPhone:     Cardinal       read FnUPhone write FnUPhone;
    property nPendant:    Cardinal       read FnPendant write FnPendant;
    property stTagRect:   WSVcaRect      read FstTagRect write FstTagRect;
    property stTagModel:  TByteDynArray  read FstTagModel write FstTagModel;
    property extendAttr:  string         read FextendAttr write FextendAttr;
  end;



  // ************************************************************************ //
  // XML       : PicAnalysisReq, global, <element>
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // ************************************************************************ //
  PicAnalysisReq = class(TRemotable)
  private
    FnDataType: Integer;
    FalgorithmType: Integer;
    FstrPicUrl: string;
    FPicData: TByteDynArray;
    FmodelRect: WSVcaRect;
    FmodelRect_Specified: boolean;
    procedure SetmodelRect(Index: Integer; const AWSVcaRect: WSVcaRect);
    function  modelRect_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property nDataType:     Integer        read FnDataType write FnDataType;
    property algorithmType: Integer        read FalgorithmType write FalgorithmType;
    property strPicUrl:     string         read FstrPicUrl write FstrPicUrl;
    property PicData:       TByteDynArray  read FPicData write FPicData;
    property modelRect:     WSVcaRect      Index (IS_OPTN) read FmodelRect write SetmodelRect stored modelRect_Specified;
  end;



  // ************************************************************************ //
  // XML       : WSHumanProcRet, global, <complexType>
  // Namespace : http://www.hikvision.com.cn/ver1/schema/ivms/
  // ************************************************************************ //
  WSHumanProcRet = class(TRemotable)
  private
    FstTagRect: WSVcaRect;
    FstTagModel: TByteDynArray;
    FextendAttr: string;
  public
    destructor Destroy; override;
  published
    property stTagRect:  WSVcaRect      read FstTagRect write FstTagRect;
    property stTagModel: TByteDynArray  read FstTagModel write FstTagModel;
    property extendAttr: string         read FextendAttr write FextendAttr;
  end;


  // ************************************************************************ //
  // Namespace : http://www.hikvision.com.cn/ver1/ivms/wsdl
  // soapAction: http://www.hikvision.com.cn/ver1/ivms/wsdl/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : IVMSWebServiceImpServiceSoapBinding
  // service   : IVMSWebServiceImpService
  // port      : IVMSWebServiceImpPort
  // URL       : http://10.46.177.140:18010/
  // ************************************************************************ //
  IVMSWebService = interface(IInvokable)
  ['{59A5439E-3CAD-0714-D570-2D9E1CD02DBC}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  AllocateResource(const header: HeaderReq; const parameters: AllocateResourceReq): AllocateResourceRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  Test(const header: HeaderReq; const parameters: TestReq): TestRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  StartShow(const header: HeaderReq; const parameters: StartShowReq): StartShowRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  GetJobStatus(const header: HeaderReq; const parameters: JobStatusReq): JobStatusRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  ResetConfig(const header: HeaderReq; const parameters: ResetConfigReq): ResetConfigRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  Logout(const header: HeaderReq; const parameters: LogoutReq): LogoutRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  RecoverJob(const header: HeaderReq; const parameters: RecoverJobReq): RecoverJobRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  PauseJob(const header: HeaderReq; const parameters: PauseJobReq): PauseJobRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  GetSourceProgress(const header: HeaderReq; const parameters: GetSourceProgressReq): GetSourceProgressRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  GetResource(const header: HeaderReq; const parameters: GetResourceReq): GetResourceRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  GetNodeResource(const header: HeaderReq; const parameters: NodeResourceReq): NodeResourceRsp; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    //     - More than one strictly out element was found
    function  Login(const parameters: LoginReq): LoginRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  GetTaskExecuteLog(const header: HeaderReq; const parameters: TaskExecuteLogReq): TaskExecuteLogRsp; stdcall;

    // Cannot unwrap: 
    //     - Input element wrapper name does not match operation's name
    //     - More than one strictly out element was found
    function  EmptyJob(const header: HeaderReq): DelJobRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  UpdateConfig(const header: HeaderReq; const parameters: UpdateConfigReq): UpdateConfigRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  SubmitJob(const header: HeaderReq; const parameters: SubmitJobReq): SubmitJobRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  QueryJob(const header: HeaderReq; const parameters: QueryJobReq): QueryJobRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  StopShow(const header: HeaderReq; const parameters: StopShowReq): StopShowRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  UpdateUser(const header: HeaderReq; const parameters: UpdateUserReq): UpdateUserRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  UpdateJob(const header: HeaderReq; const parameters: UpdateJobReq): UpdateJobRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  GetTasks(const header: HeaderReq; const parameters: TasksReq): TasksRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  GetConfig(const header: HeaderReq; const parameters: GetConfReq): GetConfRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  DelJob(const header: HeaderReq; const parameters: DelJobReq): DelJobRsp; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - More than one strictly out element was found
    function  PicAnalysis(const header: HeaderReq; const parameters: PicAnalysisReq): PicAnalysisRsp; stdcall;
  end;

function GetIVMSWebService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IVMSWebService;


implementation
  uses System.SysUtils;

function GetIVMSWebService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IVMSWebService;
const
  defWSDL = 'F:\df.xml';
  defURL  = 'http://10.46.177.140:18010/';
  defSvc  = 'IVMSWebServiceImpService';
  defPrt  = 'IVMSWebServiceImpPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as IVMSWebService);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor SubmitJobReq.Destroy;
begin
  System.SysUtils.FreeAndNil(FjobInfo);
  inherited Destroy;
end;

destructor UpdateJobReq.Destroy;
begin
  System.SysUtils.FreeAndNil(FjobInfo);
  inherited Destroy;
end;

destructor WSTempInfo.Destroy;
begin
  System.SysUtils.FreeAndNil(FstreamRange);
  System.SysUtils.FreeAndNil(FexeTimeRange);
  inherited Destroy;
end;

procedure WSTempInfo.SetstreamRange(Index: Integer; const AWSStreamRange: WSStreamRange);
begin
  FstreamRange := AWSStreamRange;
  FstreamRange_Specified := True;
end;

function WSTempInfo.streamRange_Specified(Index: Integer): boolean;
begin
  Result := FstreamRange_Specified;
end;

procedure WSCameraInfo.SetcameraDetail(Index: Integer; const Astring: string);
begin
  FcameraDetail := Astring;
  FcameraDetail_Specified := True;
end;

function WSCameraInfo.cameraDetail_Specified(Index: Integer): boolean;
begin
  Result := FcameraDetail_Specified;
end;

procedure WSCameraInfo.Setresolution(Index: Integer; const Astring: string);
begin
  Fresolution := Astring;
  Fresolution_Specified := True;
end;

function WSCameraInfo.resolution_Specified(Index: Integer): boolean;
begin
  Result := Fresolution_Specified;
end;

destructor QueryJobReq.Destroy;
begin
  System.SysUtils.FreeAndNil(FjobQueryCond);
  inherited Destroy;
end;

procedure QueryJobReq.SetjobId(Index: Integer; const Astring: string);
begin
  FjobId := Astring;
  FjobId_Specified := True;
end;

function QueryJobReq.jobId_Specified(Index: Integer): boolean;
begin
  Result := FjobId_Specified;
end;

procedure QueryJobReq.SetjobQueryCond(Index: Integer; const AWSJobQueryCond: WSJobQueryCond);
begin
  FjobQueryCond := AWSJobQueryCond;
  FjobQueryCond_Specified := True;
end;

function QueryJobReq.jobQueryCond_Specified(Index: Integer): boolean;
begin
  Result := FjobQueryCond_Specified;
end;

destructor WSJobInfo.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdestinationInfos)-1 do
    System.SysUtils.FreeAndNil(FdestinationInfos[I]);
  System.SetLength(FdestinationInfos, 0);
  System.SysUtils.FreeAndNil(FcameraInfo);
  System.SysUtils.FreeAndNil(FstreamInfo);
  System.SysUtils.FreeAndNil(FplanInfo);
  System.SysUtils.FreeAndNil(FtempInfo);
  inherited Destroy;
end;

procedure WSJobInfo.SetjobId(Index: Integer; const Astring: string);
begin
  FjobId := Astring;
  FjobId_Specified := True;
end;

function WSJobInfo.jobId_Specified(Index: Integer): boolean;
begin
  Result := FjobId_Specified;
end;

procedure WSJobInfo.SetcameraInfo(Index: Integer; const AWSCameraInfo: WSCameraInfo);
begin
  FcameraInfo := AWSCameraInfo;
  FcameraInfo_Specified := True;
end;

function WSJobInfo.cameraInfo_Specified(Index: Integer): boolean;
begin
  Result := FcameraInfo_Specified;
end;

procedure WSJobInfo.SetplanInfo(Index: Integer; const AWSPlanInfo: WSPlanInfo);
begin
  FplanInfo := AWSPlanInfo;
  FplanInfo_Specified := True;
end;

function WSJobInfo.planInfo_Specified(Index: Integer): boolean;
begin
  Result := FplanInfo_Specified;
end;

procedure WSJobInfo.SettempInfo(Index: Integer; const AWSTempInfo: WSTempInfo);
begin
  FtempInfo := AWSTempInfo;
  FtempInfo_Specified := True;
end;

function WSJobInfo.tempInfo_Specified(Index: Integer): boolean;
begin
  Result := FtempInfo_Specified;
end;

procedure WSJobInfo.SetruleInfo(Index: Integer; const Astring: string);
begin
  FruleInfo := Astring;
  FruleInfo_Specified := True;
end;

function WSJobInfo.ruleInfo_Specified(Index: Integer): boolean;
begin
  Result := FruleInfo_Specified;
end;

procedure WSJobInfo.Setreserve(Index: Integer; const Astring: string);
begin
  Freserve := Astring;
  Freserve_Specified := True;
end;

function WSJobInfo.reserve_Specified(Index: Integer): boolean;
begin
  Result := Freserve_Specified;
end;

destructor WSDayTime.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FexeTimeRange)-1 do
    System.SysUtils.FreeAndNil(FexeTimeRange[I]);
  System.SetLength(FexeTimeRange, 0);
  inherited Destroy;
end;

destructor WSTaskInfo.Destroy;
begin
  System.SysUtils.FreeAndNil(FplanTimeRange);
  inherited Destroy;
end;

procedure WSTaskInfo.SetplanTimeRange(Index: Integer; const AWSExecuteTimeRange: WSExecuteTimeRange);
begin
  FplanTimeRange := AWSExecuteTimeRange;
  FplanTimeRange_Specified := True;
end;

function WSTaskInfo.planTimeRange_Specified(Index: Integer): boolean;
begin
  Result := FplanTimeRange_Specified;
end;

procedure WSTaskInfo.SetexecuteNode(Index: Integer; const Astring: string);
begin
  FexecuteNode := Astring;
  FexecuteNode_Specified := True;
end;

function WSTaskInfo.executeNode_Specified(Index: Integer): boolean;
begin
  Result := FexecuteNode_Specified;
end;

destructor WSJobQueryCond.Destroy;
begin
  System.SysUtils.FreeAndNil(FpageCond);
  System.SysUtils.FreeAndNil(FsubmitTimeRange);
  inherited Destroy;
end;

procedure WSJobQueryCond.SetsubmitTimeRange(Index: Integer; const AWSTimeRange: WSTimeRange);
begin
  FsubmitTimeRange := AWSTimeRange;
  FsubmitTimeRange_Specified := True;
end;

function WSJobQueryCond.submitTimeRange_Specified(Index: Integer): boolean;
begin
  Result := FsubmitTimeRange_Specified;
end;

procedure WSJobQueryCond.Setsource(Index: Integer; const Astring: string);
begin
  Fsource := Astring;
  Fsource_Specified := True;
end;

function WSJobQueryCond.source_Specified(Index: Integer): boolean;
begin
  Result := Fsource_Specified;
end;

procedure WSDestinationInfo.SetuserName(Index: Integer; const Astring: string);
begin
  FuserName := Astring;
  FuserName_Specified := True;
end;

function WSDestinationInfo.userName_Specified(Index: Integer): boolean;
begin
  Result := FuserName_Specified;
end;

procedure WSDestinationInfo.Setpassword(Index: Integer; const Astring: string);
begin
  Fpassword := Astring;
  Fpassword_Specified := True;
end;

function WSDestinationInfo.password_Specified(Index: Integer): boolean;
begin
  Result := Fpassword_Specified;
end;

procedure WSDestinationInfo.Setreserve(Index: Integer; const Astring: string);
begin
  Freserve := Astring;
  Freserve_Specified := True;
end;

function WSDestinationInfo.reserve_Specified(Index: Integer): boolean;
begin
  Result := Freserve_Specified;
end;

destructor WSPlanInfo.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FexeTimeList)-1 do
    System.SysUtils.FreeAndNil(FexeTimeList[I]);
  System.SetLength(FexeTimeList, 0);
  System.SysUtils.FreeAndNil(FstreamRange);
  inherited Destroy;
end;

procedure WSPlanInfo.SetstreamRange(Index: Integer; const AWSStreamRange: WSStreamRange);
begin
  FstreamRange := AWSStreamRange;
  FstreamRange_Specified := True;
end;

function WSPlanInfo.streamRange_Specified(Index: Integer): boolean;
begin
  Result := FstreamRange_Specified;
end;

constructor LoginRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure LoginRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function LoginRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure LoginRsp.Settoken(Index: Integer; const Astring: string);
begin
  Ftoken := Astring;
  Ftoken_Specified := True;
end;

function LoginRsp.token_Specified(Index: Integer): boolean;
begin
  Result := Ftoken_Specified;
end;

constructor UpdateConfigRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure UpdateConfigRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function UpdateConfigRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor UpdateJobRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure UpdateJobRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function UpdateJobRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor UpdateUserRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure UpdateUserRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function UpdateUserRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor TaskExecuteLogRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor TaskExecuteLogRsp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtaskExecuteLogs)-1 do
    System.SysUtils.FreeAndNil(FtaskExecuteLogs[I]);
  System.SetLength(FtaskExecuteLogs, 0);
  inherited Destroy;
end;

procedure TaskExecuteLogRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function TaskExecuteLogRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure TaskExecuteLogRsp.SettaskExecuteLogs(Index: Integer; const AArray_Of_WSTaskExecuteLog: Array_Of_WSTaskExecuteLog);
begin
  FtaskExecuteLogs := AArray_Of_WSTaskExecuteLog;
  FtaskExecuteLogs_Specified := True;
end;

function TaskExecuteLogRsp.taskExecuteLogs_Specified(Index: Integer): boolean;
begin
  Result := FtaskExecuteLogs_Specified;
end;

constructor TasksRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor TasksRsp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtaskInfos)-1 do
    System.SysUtils.FreeAndNil(FtaskInfos[I]);
  System.SetLength(FtaskInfos, 0);
  inherited Destroy;
end;

procedure TasksRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function TasksRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure TasksRsp.SettaskInfos(Index: Integer; const AArray_Of_WSTaskInfo: Array_Of_WSTaskInfo);
begin
  FtaskInfos := AArray_Of_WSTaskInfo;
  FtaskInfos_Specified := True;
end;

function TasksRsp.taskInfos_Specified(Index: Integer): boolean;
begin
  Result := FtaskInfos_Specified;
end;

constructor TestRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure TestRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function TestRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor PicAnalysisRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor PicAnalysisRsp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FstPreProcRet)-1 do
    System.SysUtils.FreeAndNil(FstPreProcRet[I]);
  System.SetLength(FstPreProcRet, 0);
  for I := 0 to System.Length(FstHumanProcRet)-1 do
    System.SysUtils.FreeAndNil(FstHumanProcRet[I]);
  System.SetLength(FstHumanProcRet, 0);
  inherited Destroy;
end;

procedure PicAnalysisRsp.SetstPreProcRet(Index: Integer; const AArray_Of_WSPreProcRet: Array_Of_WSPreProcRet);
begin
  FstPreProcRet := AArray_Of_WSPreProcRet;
  FstPreProcRet_Specified := True;
end;

function PicAnalysisRsp.stPreProcRet_Specified(Index: Integer): boolean;
begin
  Result := FstPreProcRet_Specified;
end;

procedure PicAnalysisRsp.SetstHumanProcRet(Index: Integer; const AArray_Of_WSHumanProcRet: Array_Of_WSHumanProcRet);
begin
  FstHumanProcRet := AArray_Of_WSHumanProcRet;
  FstHumanProcRet_Specified := True;
end;

function PicAnalysisRsp.stHumanProcRet_Specified(Index: Integer): boolean;
begin
  Result := FstHumanProcRet_Specified;
end;

constructor QueryJobRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor QueryJobRsp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FqueryJobs)-1 do
    System.SysUtils.FreeAndNil(FqueryJobs[I]);
  System.SetLength(FqueryJobs, 0);
  inherited Destroy;
end;

procedure QueryJobRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function QueryJobRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure QueryJobRsp.SetqueryJobs(Index: Integer; const AArray_Of_WSJobInfo: Array_Of_WSJobInfo);
begin
  FqueryJobs := AArray_Of_WSJobInfo;
  FqueryJobs_Specified := True;
end;

function QueryJobRsp.queryJobs_Specified(Index: Integer): boolean;
begin
  Result := FqueryJobs_Specified;
end;

constructor PauseJobRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure PauseJobRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function PauseJobRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor LogoutRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure LogoutRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function LogoutRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

destructor NodeResourceReq.Destroy;
begin
  System.SysUtils.FreeAndNil(FpageCond);
  inherited Destroy;
end;

constructor NodeResourceRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor NodeResourceRsp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FnodeList)-1 do
    System.SysUtils.FreeAndNil(FnodeList[I]);
  System.SetLength(FnodeList, 0);
  inherited Destroy;
end;

procedure NodeResourceRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function NodeResourceRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure NodeResourceRsp.SetnodeList(Index: Integer; const AArray_Of_WSNodeInfo: Array_Of_WSNodeInfo);
begin
  FnodeList := AArray_Of_WSNodeInfo;
  FnodeList_Specified := True;
end;

function NodeResourceRsp.nodeList_Specified(Index: Integer): boolean;
begin
  Result := FnodeList_Specified;
end;

constructor StopShowRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure StopShowRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function StopShowRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor SubmitJobRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure SubmitJobRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function SubmitJobRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure SubmitJobRsp.SetjobId(Index: Integer; const Astring: string);
begin
  FjobId := Astring;
  FjobId_Specified := True;
end;

function SubmitJobRsp.jobId_Specified(Index: Integer): boolean;
begin
  Result := FjobId_Specified;
end;

constructor StartShowRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure StartShowRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function StartShowRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor RecoverJobRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure RecoverJobRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function RecoverJobRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor ResetConfigRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure ResetConfigRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function ResetConfigRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure WSTaskExecuteLog.SetstartTime(Index: Integer; const Astring: string);
begin
  FstartTime := Astring;
  FstartTime_Specified := True;
end;

function WSTaskExecuteLog.startTime_Specified(Index: Integer): boolean;
begin
  Result := FstartTime_Specified;
end;

procedure WSTaskExecuteLog.SetendTime(Index: Integer; const Astring: string);
begin
  FendTime := Astring;
  FendTime_Specified := True;
end;

function WSTaskExecuteLog.endTime_Specified(Index: Integer): boolean;
begin
  Result := FendTime_Specified;
end;

procedure WSTaskExecuteLog.SetdataSourceType(Index: Integer; const AInteger: Integer);
begin
  FdataSourceType := AInteger;
  FdataSourceType_Specified := True;
end;

function WSTaskExecuteLog.dataSourceType_Specified(Index: Integer): boolean;
begin
  Result := FdataSourceType_Specified;
end;

procedure WSTaskExecuteLog.SetstreamStart(Index: Integer; const Astring: string);
begin
  FstreamStart := Astring;
  FstreamStart_Specified := True;
end;

function WSTaskExecuteLog.streamStart_Specified(Index: Integer): boolean;
begin
  Result := FstreamStart_Specified;
end;

procedure WSTaskExecuteLog.SetstreamEnd(Index: Integer; const Astring: string);
begin
  FstreamEnd := Astring;
  FstreamEnd_Specified := True;
end;

function WSTaskExecuteLog.streamEnd_Specified(Index: Integer): boolean;
begin
  Result := FstreamEnd_Specified;
end;

procedure WSTaskExecuteLog.SetexecuteStartTime(Index: Integer; const Astring: string);
begin
  FexecuteStartTime := Astring;
  FexecuteStartTime_Specified := True;
end;

function WSTaskExecuteLog.executeStartTime_Specified(Index: Integer): boolean;
begin
  Result := FexecuteStartTime_Specified;
end;

procedure WSTaskExecuteLog.SetexecuteEndTime(Index: Integer; const Astring: string);
begin
  FexecuteEndTime := Astring;
  FexecuteEndTime_Specified := True;
end;

function WSTaskExecuteLog.executeEndTime_Specified(Index: Integer): boolean;
begin
  Result := FexecuteEndTime_Specified;
end;

procedure WSTaskExecuteLog.SetexecuteStreamStart(Index: Integer; const Astring: string);
begin
  FexecuteStreamStart := Astring;
  FexecuteStreamStart_Specified := True;
end;

function WSTaskExecuteLog.executeStreamStart_Specified(Index: Integer): boolean;
begin
  Result := FexecuteStreamStart_Specified;
end;

procedure WSTaskExecuteLog.SetexecuteStreamEnd(Index: Integer; const Astring: string);
begin
  FexecuteStreamEnd := Astring;
  FexecuteStreamEnd_Specified := True;
end;

function WSTaskExecuteLog.executeStreamEnd_Specified(Index: Integer): boolean;
begin
  Result := FexecuteStreamEnd_Specified;
end;

procedure WSStreamInfo.SetuserName(Index: Integer; const Astring: string);
begin
  FuserName := Astring;
  FuserName_Specified := True;
end;

function WSStreamInfo.userName_Specified(Index: Integer): boolean;
begin
  Result := FuserName_Specified;
end;

procedure WSStreamInfo.SetpassWord(Index: Integer; const Astring: string);
begin
  FpassWord := Astring;
  FpassWord_Specified := True;
end;

function WSStreamInfo.passWord_Specified(Index: Integer): boolean;
begin
  Result := FpassWord_Specified;
end;

procedure WSNodeInfo.SetnodeId(Index: Integer; const Astring: string);
begin
  FnodeId := Astring;
  FnodeId_Specified := True;
end;

function WSNodeInfo.nodeId_Specified(Index: Integer): boolean;
begin
  Result := FnodeId_Specified;
end;

procedure WSNodeInfo.SetnodeName(Index: Integer; const Astring: string);
begin
  FnodeName := Astring;
  FnodeName_Specified := True;
end;

function WSNodeInfo.nodeName_Specified(Index: Integer): boolean;
begin
  Result := FnodeName_Specified;
end;

destructor WSExecuteTimeRange.Destroy;
begin
  System.SysUtils.FreeAndNil(FexecTime);
  System.SysUtils.FreeAndNil(FexecStream);
  inherited Destroy;
end;

constructor GetConfRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetConfRsp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fconfig)-1 do
    System.SysUtils.FreeAndNil(Fconfig[I]);
  System.SetLength(Fconfig, 0);
  inherited Destroy;
end;

procedure GetConfRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function GetConfRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor JobStatusRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor JobStatusRsp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FjobStatus)-1 do
    System.SysUtils.FreeAndNil(FjobStatus[I]);
  System.SetLength(FjobStatus, 0);
  inherited Destroy;
end;

procedure JobStatusRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function JobStatusRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure JobStatusRsp.SetjobStatus(Index: Integer; const AArray_Of_WSJobStatus: Array_Of_WSJobStatus);
begin
  FjobStatus := AArray_Of_WSJobStatus;
  FjobStatus_Specified := True;
end;

function JobStatusRsp.jobStatus_Specified(Index: Integer): boolean;
begin
  Result := FjobStatus_Specified;
end;

constructor LoginReq.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor GetSourceProgressRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure GetSourceProgressRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function GetSourceProgressRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor HeaderReq.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor DelJobRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure DelJobRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function DelJobRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor AllocateResourceRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure AllocateResourceRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function AllocateResourceRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

constructor GetResourceRsp.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor GetResourceRsp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FresourceInfo)-1 do
    System.SysUtils.FreeAndNil(FresourceInfo[I]);
  System.SetLength(FresourceInfo, 0);
  inherited Destroy;
end;

procedure GetResourceRsp.SeterrorMsg(Index: Integer; const Astring: string);
begin
  FerrorMsg := Astring;
  FerrorMsg_Specified := True;
end;

function GetResourceRsp.errorMsg_Specified(Index: Integer): boolean;
begin
  Result := FerrorMsg_Specified;
end;

procedure GetResourceRsp.SetresourceInfo(Index: Integer; const AAllocateResourceReq: AllocateResourceReq);
begin
  FresourceInfo := AAllocateResourceReq;
  FresourceInfo_Specified := True;
end;

function GetResourceRsp.resourceInfo_Specified(Index: Integer): boolean;
begin
  Result := FresourceInfo_Specified;
end;

destructor WSPreProcRet.Destroy;
begin
  System.SysUtils.FreeAndNil(FstTagRect);
  inherited Destroy;
end;

destructor PicAnalysisReq.Destroy;
begin
  System.SysUtils.FreeAndNil(FmodelRect);
  inherited Destroy;
end;

procedure PicAnalysisReq.SetmodelRect(Index: Integer; const AWSVcaRect: WSVcaRect);
begin
  FmodelRect := AWSVcaRect;
  FmodelRect_Specified := True;
end;

function PicAnalysisReq.modelRect_Specified(Index: Integer): boolean;
begin
  Result := FmodelRect_Specified;
end;

destructor WSHumanProcRet.Destroy;
begin
  System.SysUtils.FreeAndNil(FstTagRect);
  inherited Destroy;
end;

initialization
  { IVMSWebService }
  InvRegistry.RegisterInterface(TypeInfo(IVMSWebService), 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IVMSWebService), 'http://www.hikvision.com.cn/ver1/ivms/wsdl/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IVMSWebService), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(IVMSWebService), ioLiteral);
  InvRegistry.RegisterInvokeOptions(TypeInfo(IVMSWebService), ioSOAP12);
  { IVMSWebService.AllocateResource }
  InvRegistry.RegisterParamInfo(TypeInfo(IVMSWebService), 'AllocateResource', 'parameters', '',
                                '[ArrayItemName="resourceInfo"]');
  { IVMSWebService.GetJobStatus }
  InvRegistry.RegisterParamInfo(TypeInfo(IVMSWebService), 'GetJobStatus', 'parameters', '',
                                '[ArrayItemName="jobIds"]');
  { IVMSWebService.RecoverJob }
  InvRegistry.RegisterParamInfo(TypeInfo(IVMSWebService), 'RecoverJob', 'parameters', '',
                                '[ArrayItemName="jobIds"]');
  { IVMSWebService.PauseJob }
  InvRegistry.RegisterParamInfo(TypeInfo(IVMSWebService), 'PauseJob', 'parameters', '',
                                '[ArrayItemName="jobIds"]');
  { IVMSWebService.DelJob }
  InvRegistry.RegisterParamInfo(TypeInfo(IVMSWebService), 'DelJob', 'parameters', '',
                                '[ArrayItemName="jobIds"]');
  RemClassRegistry.RegisterXSClass(ResetConfigReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'ResetConfigReq');
  RemClassRegistry.RegisterXSClass(SubmitJobReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'SubmitJobReq');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSConfig), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSConfig');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSJobStatus), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSJobStatus');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSTimeRange), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSTimeRange');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSDestinationInfo), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSDestinationInfo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSDayTime), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSDayTime');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSNodeInfo), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSNodeInfo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSTaskExecuteLog), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSTaskExecuteLog');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSTaskInfo), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSTaskInfo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSJobInfo), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSJobInfo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSPreProcRet), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSPreProcRet');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_WSHumanProcRet), 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'Array_Of_WSHumanProcRet');
  RemClassRegistry.RegisterXSClass(TestReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'TestReq');
  RemClassRegistry.RegisterXSClass(UpdateJobReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'UpdateJobReq');
  RemClassRegistry.RegisterXSClass(WSTempInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSTempInfo');
  RemClassRegistry.RegisterXSClass(WSStreamRange, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSStreamRange');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(WSStreamRange), 'end_', '[ExtName="end"]');
  RemClassRegistry.RegisterXSClass(WSCameraInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSCameraInfo');
  RemClassRegistry.RegisterXSClass(UpdateUserReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'UpdateUserReq');
  RemClassRegistry.RegisterXSClass(UpdateConfigReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'UpdateConfigReq');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(UpdateConfigReq), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterXSClass(TasksReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'TasksReq');
  RemClassRegistry.RegisterXSClass(QueryJobReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'QueryJobReq');
  RemClassRegistry.RegisterXSInfo(TypeInfo(RecoverJobReq), 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'RecoverJobReq');
  RemClassRegistry.RegisterXSClass(LogoutReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'LogoutReq');
  RemClassRegistry.RegisterXSInfo(TypeInfo(PauseJobReq), 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'PauseJobReq');
  RemClassRegistry.RegisterXSClass(StopShowReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'StopShowReq');
  RemClassRegistry.RegisterXSClass(WSResourceInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSResourceInfo');
  RemClassRegistry.RegisterXSClass(WSJobStatus, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSJobStatus');
  RemClassRegistry.RegisterXSClass(WSJobInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSJobInfo');
  RemClassRegistry.RegisterXSClass(WSDayTime, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSDayTime');
  RemClassRegistry.RegisterXSClass(WSTimeRange, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSTimeRange');
  RemClassRegistry.RegisterXSClass(WSTaskInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSTaskInfo');
  RemClassRegistry.RegisterXSClass(WSJobQueryCond, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSJobQueryCond');
  RemClassRegistry.RegisterXSClass(WSDestinationInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSDestinationInfo');
  RemClassRegistry.RegisterXSClass(WSPlanInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSPlanInfo');
  RemClassRegistry.RegisterXSClass(LoginRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'LoginRsp');
  RemClassRegistry.RegisterSerializeOptions(LoginRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(UpdateConfigRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'UpdateConfigRsp');
  RemClassRegistry.RegisterSerializeOptions(UpdateConfigRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(UpdateJobRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'UpdateJobRsp');
  RemClassRegistry.RegisterSerializeOptions(UpdateJobRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(UpdateUserRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'UpdateUserRsp');
  RemClassRegistry.RegisterSerializeOptions(UpdateUserRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(TaskExecuteLogRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'TaskExecuteLogRsp');
  RemClassRegistry.RegisterSerializeOptions(TaskExecuteLogRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(TasksRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'TasksRsp');
  RemClassRegistry.RegisterSerializeOptions(TasksRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(TestRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'TestRsp');
  RemClassRegistry.RegisterSerializeOptions(TestRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(PicAnalysisRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'PicAnalysisRsp');
  RemClassRegistry.RegisterSerializeOptions(PicAnalysisRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(QueryJobRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'QueryJobRsp');
  RemClassRegistry.RegisterSerializeOptions(QueryJobRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(PauseJobRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'PauseJobRsp');
  RemClassRegistry.RegisterSerializeOptions(PauseJobRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(LogoutRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'LogoutRsp');
  RemClassRegistry.RegisterSerializeOptions(LogoutRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(NodeResourceReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'NodeResourceReq');
  RemClassRegistry.RegisterXSClass(NodeResourceRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'NodeResourceRsp');
  RemClassRegistry.RegisterSerializeOptions(NodeResourceRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(StopShowRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'StopShowRsp');
  RemClassRegistry.RegisterSerializeOptions(StopShowRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(SubmitJobRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'SubmitJobRsp');
  RemClassRegistry.RegisterSerializeOptions(SubmitJobRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(StartShowRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'StartShowRsp');
  RemClassRegistry.RegisterSerializeOptions(StartShowRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(RecoverJobRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'RecoverJobRsp');
  RemClassRegistry.RegisterSerializeOptions(RecoverJobRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(ResetConfigRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'ResetConfigRsp');
  RemClassRegistry.RegisterSerializeOptions(ResetConfigRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(StartShowReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'StartShowReq');
  RemClassRegistry.RegisterXSClass(WSTaskExecuteLog, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSTaskExecuteLog');
  RemClassRegistry.RegisterXSClass(TaskExecuteLogReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'TaskExecuteLogReq');
  RemClassRegistry.RegisterXSClass(WSStreamInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSStreamInfo');
  RemClassRegistry.RegisterXSClass(WSPageCond, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSPageCond');
  RemClassRegistry.RegisterXSClass(WSNodeInfo, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSNodeInfo');
  RemClassRegistry.RegisterXSClass(WSExecuteTimeRange, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSExecuteTimeRange');
  RemClassRegistry.RegisterXSClass(GetSourceProgressReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'GetSourceProgressReq');
  RemClassRegistry.RegisterXSClass(GetResourceReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'GetResourceReq');
  RemClassRegistry.RegisterXSClass(GetConfReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'GetConfReq');
  RemClassRegistry.RegisterXSClass(GetConfRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'GetConfRsp');
  RemClassRegistry.RegisterSerializeOptions(GetConfRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(JobStatusRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'JobStatusRsp');
  RemClassRegistry.RegisterSerializeOptions(JobStatusRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(LoginReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'LoginReq');
  RemClassRegistry.RegisterSerializeOptions(LoginReq, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(JobStatusReq), 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'JobStatusReq');
  RemClassRegistry.RegisterXSClass(GetSourceProgressRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'GetSourceProgressRsp');
  RemClassRegistry.RegisterSerializeOptions(GetSourceProgressRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(HeaderReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'HeaderReq');
  RemClassRegistry.RegisterSerializeOptions(HeaderReq, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(DelJobRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'DelJobRsp');
  RemClassRegistry.RegisterSerializeOptions(DelJobRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(WSConfig, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSConfig');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(WSConfig), 'name_', '[ExtName="name"]');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(WSConfig), 'type_', '[ExtName="type"]');
  RemClassRegistry.RegisterXSClass(WSVcaRect, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSVcaRect');
  RemClassRegistry.RegisterXSClass(AllocateResourceRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'AllocateResourceRsp');
  RemClassRegistry.RegisterSerializeOptions(AllocateResourceRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSInfo(TypeInfo(DelJobReq), 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'DelJobReq');
  RemClassRegistry.RegisterXSInfo(TypeInfo(AllocateResourceReq), 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'AllocateResourceReq');
  RemClassRegistry.RegisterXSClass(GetResourceRsp, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'GetResourceRsp');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(GetResourceRsp), 'resourceInfo', '[ArrayItemName="resourceInfo"]');
  RemClassRegistry.RegisterSerializeOptions(GetResourceRsp, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(WSPreProcRet, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSPreProcRet');
  RemClassRegistry.RegisterXSClass(PicAnalysisReq, 'http://www.hikvision.com.cn/ver1/ivms/wsdl', 'PicAnalysisReq');
  RemClassRegistry.RegisterXSClass(WSHumanProcRet, 'http://www.hikvision.com.cn/ver1/schema/ivms/', 'WSHumanProcRet');

end.