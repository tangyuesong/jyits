// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.46.177.139:8181/traffic/ws/analysisExtra?wsdl
//  >Import : http://10.46.177.139:8181/traffic/ws/analysisExtra?wsdl>0
// Encoding : UTF-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (2018/3/29 18:01:37 - - $Rev: 86412 $)
// ************************************************************************ //

unit uAnalysisExtra;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:long            - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  collectResponseInfo2 = class;                 { "http://www.hikvision.com/traffic/ws/"[GblCplx] }
  CollectResponseInfo  = class;                 { "http://www.hikvision.com/traffic/ws/"[GblElm] }



  // ************************************************************************ //
  // XML       : collectResponseInfo, global, <complexType>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  collectResponseInfo2 = class(TRemotable)
  private
    FresultCode: Integer;
    Fmsg: string;
    FtimeConsuming: Int64;
    FerrorDetails: string;
    FerrorDetails_Specified: boolean;
    procedure SeterrorDetails(Index: Integer; const Astring: string);
    function  errorDetails_Specified(Index: Integer): boolean;
  published
    property resultCode:    Integer  read FresultCode write FresultCode;
    property msg:           string   read Fmsg write Fmsg;
    property timeConsuming: Int64    read FtimeConsuming write FtimeConsuming;
    property errorDetails:  string   Index (IS_OPTN) read FerrorDetails write SeterrorDetails stored errorDetails_Specified;
  end;



  // ************************************************************************ //
  // XML       : CollectResponseInfo, global, <element>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  CollectResponseInfo = class(collectResponseInfo2)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://www.hikvision.com/traffic/ws/
  // style     : ????
  // use       : ????
  // binding   : AnalysisExtraServiceSoapBinding
  // service   : AnalysisExtraService
  // port      : analysisExtraPort
  // ************************************************************************ //
  analysisExtra = interface(IInvokable)
  ['{7865CF39-727E-7E86-1D98-ADDD5F7CBDEF}']
    function  setGroupFirstEnterCity(const crossAndDirections: string): string; stdcall;
    function  updateSingleVehicleBestTimePolice(const startCrossingId: Integer; const endCrossingId: Integer; const customTime: Integer; const isUsed: string): string; stdcall;
    function  updateSingleVehicleBestTime(const startCrossingId: Integer; const endCrossingId: Integer; const customTime: Integer; const isUsed: Integer): string; stdcall;
    function  addModelControl(const datajson: string): collectResponseInfo2; stdcall;
    function  getVehicleBestTimePolice(const startCrossingId: Integer; const endCrossingId: Integer; const argumentTime: Integer; const operator: string; const isUsed: string; const pageSize: Integer; 
                                       const pageNo: Integer): string; stdcall;
    function  newFirstEnterCityAnalysis(const plateNo: string; const vehicleLogo: string; const vehicleSubLogo: string; const plateColor: string; const plateType: string; const vehicleType: string; 
                                        const vehicleColor: string; const startTime: string; const endTime: string; const recallTime: Integer; const exceptPlateNo: string; 
                                        const taskId: string; const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  listModelControl(const threshold: string; const controlId: string; const vehicleLogo: string; const vehicleSublogo: string; const vehicleType: string; const vehicleColor: string; 
                               const pageSize: Integer; const pageNo: Integer): collectResponseInfo2; stdcall;
    function  fakePlateAnalysis(const taskId: string; const plateNo: string; const startTime: string; const endTime: string; const pageSize: Integer; const pageNo: Integer
                                ): string; stdcall;
    function  updateMoreVehicleUsed(const startCrossingId: Integer; const endCrossingId: Integer; const argumentTime: Integer; const operator: Integer; const isUsed: Integer; const flag: Integer
                                    ): string; stdcall;
    function  checkFakePlate(const plateNo: string; const fakeids: string; const checkResult: string; const reason: string): string; stdcall;
    function  firstEnterCityAnalysis(const plateNo: string; const vehicleLogo: string; const plateColor: string; const plateType: string; const vehicleType: string; const vehicleColor: string; 
                                     const startTime: string; const endTime: string; const recallTime: Integer; const exceptPlateNo: string; const taskId: string; 
                                     const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  falsePlateAnalysis(const plateNo: string; const startDate: string; const endDate: string; const threshold: Integer; const checkResult: string; const plateColor: string; 
                                 const resType: Integer; const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  newfakePlateAnalysis(const plateNo: string; const startDate: string; const endDate: string; const threshold: Integer; const checkResult: string; const plateColor: string; 
                                   const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  firstEnterCityAnalysis3(const plateNo: string; const vehicleLogo: string; const plateColor: string; const plateType: string; const vehicleType: string; const vehicleColor: string; 
                                      const startTime: string; const endTime: string; const recallTime: Integer; const exceptPlateNo: string; const taskId: string; 
                                      const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  updateMoreVehicleUsedPolice(const startCrossingId: Integer; const endCrossingId: Integer; const argumentTime: Integer; const operator: string; const isUsed: string; const flag: Integer
                                          ): string; stdcall;
    function  checkFalsePlate(const falseids: string; const checkResult: string; const reason: string): string; stdcall;
    function  getVehicleBestTime(const startCrossingId: Integer; const endCrossingId: Integer; const argumentTime: Integer; const operator: Integer; const isUsed: Integer; const pageSize: Integer; 
                                 const pageNo: Integer): string; stdcall;
    function  newFootHoldsByTrack(const plateNo: string; const plateColor: string; const startTime: string; const endTime: string; const threshold: Integer; const taskId: string; 
                                  const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  delModelControl(const controlId: string): collectResponseInfo2; stdcall;
    function  footHoldsByTrack(const plateNo: string; const plateColor: string; const startTime: string; const endTime: string; const taskId: string; const pageSize: Integer; 
                               const pageNo: Integer): string; stdcall;
  end;

function GetanalysisExtra(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): analysisExtra;


implementation
  uses System.SysUtils;

function GetanalysisExtra(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): analysisExtra;
const
  defWSDL = 'http://10.46.177.139:8181/traffic/ws/analysisExtra?wsdl';
  defURL  = '';
  defSvc  = 'AnalysisExtraService';
  defPrt  = 'analysisExtraPort';
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
    Result := (RIO as analysisExtra);
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


procedure collectResponseInfo2.SeterrorDetails(Index: Integer; const Astring: string);
begin
  FerrorDetails := Astring;
  FerrorDetails_Specified := True;
end;

function collectResponseInfo2.errorDetails_Specified(Index: Integer): boolean;
begin
  Result := FerrorDetails_Specified;
end;

initialization
  { analysisExtra }
  InvRegistry.RegisterInterface(TypeInfo(analysisExtra), 'http://www.hikvision.com/traffic/ws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(analysisExtra), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(analysisExtra), ioSOAP12);
  RemClassRegistry.RegisterXSClass(collectResponseInfo2, 'http://www.hikvision.com/traffic/ws/', 'collectResponseInfo2', 'collectResponseInfo');
  RemClassRegistry.RegisterXSClass(CollectResponseInfo, 'http://www.hikvision.com/traffic/ws/', 'CollectResponseInfo');

end.