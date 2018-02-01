// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.40.30.152/trffweb/services/TmriOutAccess?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (2016/11/21 17:18:06 - - $Rev: 76228 $)
// ************************************************************************ //

unit TmriOutAccess;

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
  // Namespace : http://endpoint.axis.framework.tmri.com
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : TmriOutAccessSoapBinding
  // service   : TmriJaxRpcOutAccessService
  // port      : TmriOutAccess
  // URL       : http://10.40.30.152/trffweb/services/TmriOutAccess
  // ************************************************************************ //
  TmriJaxRpcOutAccess = interface(IInvokable)
  ['{5DDEE31A-2995-7A61-4B0F-AD25541AFF58}']
    function  queryObjectOut(const xtlb: string; const jkxlh: string; const jkid: string; const UTF8XmlDoc: string): string; stdcall;
    function  writeObjectOut(const xtlb: string; const jkxlh: string; const jkid: string; const UTF8XmlDoc: string): string; stdcall;
  end;

function GetTmriJaxRpcOutAccess(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): TmriJaxRpcOutAccess;


implementation
  uses System.SysUtils;

function GetTmriJaxRpcOutAccess(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): TmriJaxRpcOutAccess;
const
  defWSDL = 'http://10.40.30.152/trffweb/services/TmriOutAccess?wsdl';
  defURL  = 'http://10.40.30.152/trffweb/services/TmriOutAccess';
  defSvc  = 'TmriJaxRpcOutAccessService';
  defPrt  = 'TmriOutAccess';
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
    Result := (RIO as TmriJaxRpcOutAccess);
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
  { TmriJaxRpcOutAccess }
  InvRegistry.RegisterInterface(TypeInfo(TmriJaxRpcOutAccess), 'http://endpoint.axis.framework.tmri.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(TmriJaxRpcOutAccess), '');

end.