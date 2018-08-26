// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.46.177.139:8181/traffic/ws/dataStatistics?wsdl
//  >Import : http://10.46.177.139:8181/traffic/ws/dataStatistics?wsdl>0
// Encoding : UTF-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (2018/3/28 10:10:08 - - $Rev: 86412 $)
// ************************************************************************ //

unit uDataStatistics;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:long            - "http://www.w3.org/2001/XMLSchema"[Gbl]

  statisticsResults2   = class;                 { "http://www.hikvision.com/traffic/ws/"[GblCplx] }
  StatisticsResults    = class;                 { "http://www.hikvision.com/traffic/ws/"[GblElm] }
  statisticsResultsNoTime2 = class;             { "http://www.hikvision.com/traffic/ws/"[GblCplx] }
  StatisticsResultsNoTime = class;              { "http://www.hikvision.com/traffic/ws/"[GblElm] }

  Array_Of_string = array of string;            { "http://www.w3.org/2001/XMLSchema"[GblUbnd] }


  // ************************************************************************ //
  // XML       : statisticsResults, global, <complexType>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  statisticsResults2 = class(TRemotable)
  private
    Fresults: string;
    Fresults_Specified: boolean;
    FsumResults: string;
    FsumResults_Specified: boolean;
    Ftimeconsuming: Int64;
    Fmsg: string;
    Fmsg_Specified: boolean;
    Fret: Integer;
    Fversion: string;
    Fversion_Specified: boolean;
    FtotalRecords: Int64;
    FcrossingId: Integer;
    procedure Setresults(Index: Integer; const Astring: string);
    function  results_Specified(Index: Integer): boolean;
    procedure SetsumResults(Index: Integer; const Astring: string);
    function  sumResults_Specified(Index: Integer): boolean;
    procedure Setmsg(Index: Integer; const Astring: string);
    function  msg_Specified(Index: Integer): boolean;
    procedure Setversion(Index: Integer; const Astring: string);
    function  version_Specified(Index: Integer): boolean;
  published
    property results:       string   Index (IS_OPTN) read Fresults write Setresults stored results_Specified;
    property sumResults:    string   Index (IS_OPTN) read FsumResults write SetsumResults stored sumResults_Specified;
    property timeconsuming: Int64    read Ftimeconsuming write Ftimeconsuming;
    property msg:           string   Index (IS_OPTN) read Fmsg write Setmsg stored msg_Specified;
    property ret:           Integer  read Fret write Fret;
    property version:       string   Index (IS_OPTN) read Fversion write Setversion stored version_Specified;
    property totalRecords:  Int64    read FtotalRecords write FtotalRecords;
    property crossingId:    Integer  read FcrossingId write FcrossingId;
  end;



  // ************************************************************************ //
  // XML       : StatisticsResults, global, <element>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  StatisticsResults = class(statisticsResults2)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : statisticsResultsNoTime, global, <complexType>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  statisticsResultsNoTime2 = class(TRemotable)
  private
    Fresults: string;
    Fresults_Specified: boolean;
    Frs: Array_Of_string;
    Frs_Specified: boolean;
    Ftimeconsuming: Int64;
    Fmsg: string;
    Fmsg_Specified: boolean;
    Fret: Integer;
    Fversion: string;
    Fversion_Specified: boolean;
    FtotalRecords: Int64;
    procedure Setresults(Index: Integer; const Astring: string);
    function  results_Specified(Index: Integer): boolean;
    procedure Setrs(Index: Integer; const AArray_Of_string: Array_Of_string);
    function  rs_Specified(Index: Integer): boolean;
    procedure Setmsg(Index: Integer; const Astring: string);
    function  msg_Specified(Index: Integer): boolean;
    procedure Setversion(Index: Integer; const Astring: string);
    function  version_Specified(Index: Integer): boolean;
  published
    property results:       string           Index (IS_OPTN) read Fresults write Setresults stored results_Specified;
    property rs:            Array_Of_string  Index (IS_OPTN or IS_UNBD) read Frs write Setrs stored rs_Specified;
    property timeconsuming: Int64            read Ftimeconsuming write Ftimeconsuming;
    property msg:           string           Index (IS_OPTN) read Fmsg write Setmsg stored msg_Specified;
    property ret:           Integer          read Fret write Fret;
    property version:       string           Index (IS_OPTN) read Fversion write Setversion stored version_Specified;
    property totalRecords:  Int64            read FtotalRecords write FtotalRecords;
  end;



  // ************************************************************************ //
  // XML       : StatisticsResultsNoTime, global, <element>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  StatisticsResultsNoTime = class(statisticsResultsNoTime2)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://www.hikvision.com/traffic/ws/
  // style     : ????
  // use       : ????
  // binding   : DataStatisticsWebServiceServiceSoapBinding
  // service   : DataStatisticsWebServiceService
  // port      : dataStatisticsPort
  // ************************************************************************ //
  dataStatistics = interface(IInvokable)
  ['{B020789E-F9D0-1249-69FD-7EE635B8AF0A}']
    function  vehiclePassCompare(const crossIds: string; const directionIndex: string; const vehicleBelong: string; const vehicleType: string; const setTime: string): statisticsResults2; stdcall;
    function  vehiclePassSummary(const startTime: string; const endTime: string; const crossIds: string; const directionIndex: string; const reportType: Integer; const statisticsType: Integer; 
                                 const vehicleBelong: string; const vehicleType: string): statisticsResults2; stdcall;
    function  vehicleAlarmSummaryByAction(const crossIds: string; const startTime: string; const endTime: string; const violativeAction: string; const reportType: Integer): statisticsResultsNoTime2; stdcall;
    function  vehicleTrackSummary(const crossIds: string; const plateColor: string; const plateType: string; const timeLists: string; const statisticsType: string; const vehicleType: string; 
                                  const vehicleBelong: string; const vehicleSpeed: string; const vehicleLen: string; const vehicleColorDepth: string; const vehicleColor: string
                                  ): statisticsResults2; stdcall;
    function  vehicleAlarmProcessSummaryByAction(const startTime: string; const endTime: string; const crossIds: string; const plateType: string; const vehicleColorDepth: string; const vehicleType: string; 
                                                 const plateColor: string; const vehicleColor: string; const laneNo: string; const directionIndex: string; const violativeAction: string
                                                 ): statisticsResultsNoTime2; stdcall;
    function  vehicleAlarmProcessSummary(const startTime: string; const endTime: string; const crossIds: string; const plateType: string; const vehicleColorDepth: string; const vehicleType: string; 
                                         const plateColor: string; const vehicleColor: string; const laneNo: string; const directionIndex: string): statisticsResultsNoTime2; stdcall;
    function  propertiesStatistics(const taskId: string; const sort: string; const statisticsType: string; const startTime: string; const endTime: string; const pageSize: Integer; 
                                   const pageNo: Integer): string; stdcall;
    function  vehicleAlarmSummary(const crossIds: string; const startTime: string; const endTime: string; const vehicleType: string; const reportType: Integer): statisticsResultsNoTime2; stdcall;
    function  vehiclePassSpecTimeSummary(const crossIds: string; const startTime: string; const endTime: string; const setTime: string; const vehicleBelong: string; const vehicleType: string; 
                                         const directionIndex: string): statisticsResults2; stdcall;
  end;

function GetdataStatistics(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): dataStatistics;


implementation
  uses System.SysUtils;

function GetdataStatistics(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): dataStatistics;
const
  defWSDL = 'http://10.46.177.139:8181/traffic/ws/dataStatistics?wsdl';
  defURL  = '';
  defSvc  = 'DataStatisticsWebServiceService';
  defPrt  = 'dataStatisticsPort';
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
    Result := (RIO as dataStatistics);
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


procedure statisticsResults2.Setresults(Index: Integer; const Astring: string);
begin
  Fresults := Astring;
  Fresults_Specified := True;
end;

function statisticsResults2.results_Specified(Index: Integer): boolean;
begin
  Result := Fresults_Specified;
end;

procedure statisticsResults2.SetsumResults(Index: Integer; const Astring: string);
begin
  FsumResults := Astring;
  FsumResults_Specified := True;
end;

function statisticsResults2.sumResults_Specified(Index: Integer): boolean;
begin
  Result := FsumResults_Specified;
end;

procedure statisticsResults2.Setmsg(Index: Integer; const Astring: string);
begin
  Fmsg := Astring;
  Fmsg_Specified := True;
end;

function statisticsResults2.msg_Specified(Index: Integer): boolean;
begin
  Result := Fmsg_Specified;
end;

procedure statisticsResults2.Setversion(Index: Integer; const Astring: string);
begin
  Fversion := Astring;
  Fversion_Specified := True;
end;

function statisticsResults2.version_Specified(Index: Integer): boolean;
begin
  Result := Fversion_Specified;
end;

procedure statisticsResultsNoTime2.Setresults(Index: Integer; const Astring: string);
begin
  Fresults := Astring;
  Fresults_Specified := True;
end;

function statisticsResultsNoTime2.results_Specified(Index: Integer): boolean;
begin
  Result := Fresults_Specified;
end;

procedure statisticsResultsNoTime2.Setrs(Index: Integer; const AArray_Of_string: Array_Of_string);
begin
  Frs := AArray_Of_string;
  Frs_Specified := True;
end;

function statisticsResultsNoTime2.rs_Specified(Index: Integer): boolean;
begin
  Result := Frs_Specified;
end;

procedure statisticsResultsNoTime2.Setmsg(Index: Integer; const Astring: string);
begin
  Fmsg := Astring;
  Fmsg_Specified := True;
end;

function statisticsResultsNoTime2.msg_Specified(Index: Integer): boolean;
begin
  Result := Fmsg_Specified;
end;

procedure statisticsResultsNoTime2.Setversion(Index: Integer; const Astring: string);
begin
  Fversion := Astring;
  Fversion_Specified := True;
end;

function statisticsResultsNoTime2.version_Specified(Index: Integer): boolean;
begin
  Result := Fversion_Specified;
end;

initialization
  { dataStatistics }
  InvRegistry.RegisterInterface(TypeInfo(dataStatistics), 'http://www.hikvision.com/traffic/ws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(dataStatistics), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(dataStatistics), ioSOAP12);
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_string), 'http://www.w3.org/2001/XMLSchema', 'Array_Of_string');
  RemClassRegistry.RegisterXSClass(statisticsResults2, 'http://www.hikvision.com/traffic/ws/', 'statisticsResults2', 'statisticsResults');
  RemClassRegistry.RegisterXSClass(StatisticsResults, 'http://www.hikvision.com/traffic/ws/', 'StatisticsResults');
  RemClassRegistry.RegisterXSClass(statisticsResultsNoTime2, 'http://www.hikvision.com/traffic/ws/', 'statisticsResultsNoTime2', 'statisticsResultsNoTime');
  RemClassRegistry.RegisterXSClass(StatisticsResultsNoTime, 'http://www.hikvision.com/traffic/ws/', 'StatisticsResultsNoTime');

end.