// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.46.177.139:8181/traffic/ws/dataAnalysis?wsdl
// Encoding : UTF-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (2018/3/28 10:13:01 - - $Rev: 86412 $)
// ************************************************************************ //

unit uDataAnalysis;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:long            - "http://www.w3.org/2001/XMLSchema"[]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : http://www.hikvision.com/traffic/ws/
  // style     : ????
  // use       : ????
  // binding   : DataAnalysisWebServiceServiceSoapBinding
  // service   : DataAnalysisWebServiceService
  // port      : dataAnalysisPort
  // ************************************************************************ //
  dataAnalysis = interface(IInvokable)
  ['{FDED0B47-DB69-4577-D615-4B0A2AFA44F7}']
    function  specTimePassAnalysis(const taskId: string; const crosses: string; const startTime: string; const endTime: string; const pageSize: Integer; const pageNo: Integer
                                   ): string; stdcall;
    function  setGroupFirstEnterCity(const crossAndDirections: string): string; stdcall;
    function  frequencyCrossStatisticByCrossIdAnalysis(const taskId: string; const crosses: string; const startTime: string; const endTime: string; const freSet: Integer; const threshold: Integer; 
                                                       const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  hiddenVehicleAnalysis(const taskId: string; const plateNo: string; const startTime: string; const endTime: string; const crosses: string; const vehicleColor: string; 
                                    const vehicleType: string; const plateColor: string; const plateType: string; const beforeTime: string; const afterTime: string; 
                                    const beforeVal: Integer; const afterVal: Integer; const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  shortTimePassAnalysis(const taskId: string; const crossRef: string; const crosses: string; const startTime: string; const endTime: string; const threshold: Int64; 
                                    const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  crossAggregationAnalysis(const taskId: string; const districts: string; const threshold: Integer; const pageSize: Integer; const pageNo: Integer; const plateColor: Integer
                                       ): string; stdcall;
    function  abnormalTrackAnalysis(const taskId: string; const plateNo: string; const crosses: string; const inStartTime: string; const inEndTime: string; const outStartTime: string; 
                                    const outEndTime: string; const threshold: Integer; const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  trackerAlikeAnalysis(const taskId: string; const plateNos: string; const startTime: string; const endTime: string; const timeThreshold: Integer; const crossThreshold: Integer; 
                                   const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  newHiddenVehicleAnalysis(const taskId: string; const plateNo: string; const startTime: string; const endTime: string; const crosses: string; const vehicleColor: string; 
                                       const vehicleType: string; const plateColor: string; const plateType: string; const gear: string; const pageSize: Integer; 
                                       const pageNo: Integer): string; stdcall;
    function  trackDetectionAnalysis(const taskId: string; const plateNo: string; const startTime: string; const endTime: string; const vehicleType: string; const vehicleColor: string; 
                                     const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  trackerAssociateAnalysis(const taskId: string; const plateNo: string; const crosses: string; const startTime: string; const endTime: string; const timeInterval: Integer; 
                                       const threshold: Integer; const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  frequencyCrossAnalysis(const taskId: string; const crosses: string; const startTime: string; const endTime: string; const freSet: Integer; const threshold: Integer; 
                                     const pageSize: Integer; const pageNo: Integer): string; stdcall;
  end;

function GetdataAnalysis(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): dataAnalysis;


implementation
  uses System.SysUtils;

function GetdataAnalysis(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): dataAnalysis;
const
  defWSDL = 'http://10.46.177.139:8181/traffic/ws/dataAnalysis?wsdl';
  defURL  = '';
  defSvc  = 'DataAnalysisWebServiceService';
  defPrt  = 'dataAnalysisPort';
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
    Result := (RIO as dataAnalysis);
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


initialization
  { dataAnalysis }
  InvRegistry.RegisterInterface(TypeInfo(dataAnalysis), 'http://www.hikvision.com/traffic/ws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(dataAnalysis), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(dataAnalysis), ioSOAP12);

end.