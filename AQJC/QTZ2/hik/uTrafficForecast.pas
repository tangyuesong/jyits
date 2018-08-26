// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.46.177.139:8181/traffic/ws/trafficForecast?wsdl
//  >Import : http://10.46.177.139:8181/traffic/ws/trafficForecast?wsdl>0
// Encoding : UTF-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (2018/4/11 16:19:38 - - $Rev: 86412 $)
// ************************************************************************ //

unit uTrafficForecast;

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

  responseInfo2        = class;                 { "http://www.hikvision.com/traffic/ws/"[GblCplx] }
  ResponseInfo         = class;                 { "http://www.hikvision.com/traffic/ws/"[GblElm] }



  // ************************************************************************ //
  // XML       : responseInfo, global, <complexType>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  responseInfo2 = class(TRemotable)
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
  // XML       : ResponseInfo, global, <element>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  ResponseInfo = class(responseInfo2)
  private
  published
  end;


  // ************************************************************************ //
  // Namespace : http://www.hikvision.com/traffic/ws/
  // style     : ????
  // use       : ????
  // binding   : TrafficForecastWebServiceServiceSoapBinding
  // service   : TrafficForecastWebServiceService
  // port      : trafficForecastWSPort
  // ************************************************************************ //
  trafficForecastWS = interface(IInvokable)
  ['{B4645DE0-5EE0-8CBA-752A-CEB367B6B646}']
    function  forecastCrossFlow(const crossSet: string; const startTime: string; const endTime: string): responseInfo2; stdcall;
  end;

function GettrafficForecastWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): trafficForecastWS;


implementation
  uses System.SysUtils;

function GettrafficForecastWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): trafficForecastWS;
const
  defWSDL = 'http://10.46.177.139:8181/traffic/ws/trafficForecast?wsdl';
  defURL  = '';
  defSvc  = 'TrafficForecastWebServiceService';
  defPrt  = 'trafficForecastWSPort';
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
    Result := (RIO as trafficForecastWS);
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


procedure responseInfo2.SeterrorDetails(Index: Integer; const Astring: string);
begin
  FerrorDetails := Astring;
  FerrorDetails_Specified := True;
end;

function responseInfo2.errorDetails_Specified(Index: Integer): boolean;
begin
  Result := FerrorDetails_Specified;
end;

initialization
  { trafficForecastWS }
  InvRegistry.RegisterInterface(TypeInfo(trafficForecastWS), 'http://www.hikvision.com/traffic/ws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(trafficForecastWS), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(trafficForecastWS), ioSOAP12);
  RemClassRegistry.RegisterXSClass(responseInfo2, 'http://www.hikvision.com/traffic/ws/', 'responseInfo2', 'responseInfo');
  RemClassRegistry.RegisterXSClass(ResponseInfo, 'http://www.hikvision.com/traffic/ws/', 'ResponseInfo');

end.