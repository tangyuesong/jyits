// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.40.30.110/trffweb/services/TmriOutNewAccess?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (2017/12/19 9:51:06 - - $Rev: 86412 $)
// ************************************************************************ //

unit TmriOutNewAccess;

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
  // binding   : TmriOutNewAccessSoapBinding
  // service   : TmriJaxRpcOutNewAccessService
  // port      : TmriOutNewAccess
  // URL       : http://10.40.30.110/trffweb/services/TmriOutNewAccess
  // ************************************************************************ //
  TmriJaxRpcOutNewAccess = interface(IInvokable)
  ['{ED7BD653-BD23-A298-BC7D-4D1D30686C41}']
    function  queryObjectOut(const xtlb: string; const jkxlh: string; const jkid: string; const yhbz: string; const dwmc: string; const dwjgdm: string; 
                             const yhxm: string; const zdbs: string; const UTF8XmlDoc: string): string; stdcall;
    function  queryObjectOutNew(const xtlb: string; const jkxlh: string; const jkid: string; const cjsqbh: string; const dwjgdm: string; const dwmc: string; 
                                const yhbz: string; const yhxm: string; const zdbs: string; const UTF8XmlDoc: string): string; stdcall;
    function  writeObjectOut(const xtlb: string; const jkxlh: string; const jkid: string; const yhbz: string; const dwmc: string; const dwjgdm: string; 
                             const yhxm: string; const zdbs: string; const UTF8XmlDoc: string): string; stdcall;
    function  writeObjectOutNew(const xtlb: string; const jkxlh: string; const jkid: string; const cjsqbh: string; const dwjgdm: string; const dwmc: string; 
                                const yhbz: string; const yhxm: string; const zdbs: string; const UTF8XmlDoc: string): string; stdcall;
  end;

function GetTmriJaxRpcOutNewAccess(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): TmriJaxRpcOutNewAccess;


implementation
  uses System.SysUtils;

function GetTmriJaxRpcOutNewAccess(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): TmriJaxRpcOutNewAccess;
const
  defWSDL = 'http://10.40.30.110/trffweb/services/TmriOutNewAccess?wsdl';
  defURL  = 'http://10.40.30.110/trffweb/services/TmriOutNewAccess';
  defSvc  = 'TmriJaxRpcOutNewAccessService';
  defPrt  = 'TmriOutNewAccess';
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
    Result := (RIO as TmriJaxRpcOutNewAccess);
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
  { TmriJaxRpcOutNewAccess }
  InvRegistry.RegisterInterface(TypeInfo(TmriJaxRpcOutNewAccess), 'http://endpoint.axis.framework.tmri.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(TmriJaxRpcOutNewAccess), '');

end.