// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.43.255.204:9080/rminf/services/RmOutAccess?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (2016/11/17 8:22:29 - - $Rev: 76228 $)
// ************************************************************************ //

unit RmOutAccessInf;

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
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : http://endpoint.axis.rm.tmri.com
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : RmOutAccessSoapBinding
  // service   : RmJaxRpcOutAccessService
  // port      : RmOutAccess
  // URL       : http://10.43.255.204:9080/rminf/services/RmOutAccess
  // ************************************************************************ //
  RmJaxRpcOutAccess = interface(IInvokable)
  ['{A9EB3117-834A-F166-817E-C3FC5C02DE45}']
    function  queryObjectOut(const xtlb: string; const jkxlh: string; const jkid: string; const UTF8XmlDoc: string): string; stdcall;
    function  writeObjectOut(const xtlb: string; const jkxlh: string; const jkid: string; const UTF8XmlDoc: string): string; stdcall;
  end;

function GetRmJaxRpcOutAccess(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): RmJaxRpcOutAccess;


implementation
  uses System.SysUtils;

function GetRmJaxRpcOutAccess(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): RmJaxRpcOutAccess;
const
  defWSDL = 'http://10.43.255.204:9080/rminf/services/RmOutAccess?wsdl';
  defURL  = 'http://10.43.255.204:9080/rminf/services/RmOutAccess';
  defSvc  = 'RmJaxRpcOutAccessService';
  defPrt  = 'RmOutAccess';
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
    Result := (RIO as RmJaxRpcOutAccess);
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
  { RmJaxRpcOutAccess }
  InvRegistry.RegisterInterface(TypeInfo(RmJaxRpcOutAccess), 'http://endpoint.axis.rm.tmri.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RmJaxRpcOutAccess), '');

end.