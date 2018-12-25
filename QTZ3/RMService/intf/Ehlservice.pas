// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\项目\惠州\Ehlservice.xml
//  >Import : D:\项目\惠州\Ehlservice.xml>0
// Encoding : utf-8
// Version  : 1.0
// (2018/9/5 8:48:35 - - $Rev: 86412 $)
// ************************************************************************ //

unit Ehlservice;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
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



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : EHLServiceSoap
  // service   : EHLService
  // port      : EHLServiceSoap
  // URL       : http://10.47.186.132:8987/Ehlservice.asmx
  // ************************************************************************ //
  EHLServiceSoap = interface(IInvokable)
  ['{DF782946-46A2-2E11-BA61-1A0BFCDF6754}']
    function  queryObjectOut(const jkid: string; const sycj: string; const QueryXmlDoc: string): string; stdcall;
    function  writeObjectOut(const jkid: string; const QueryXmlDoc: string): string; stdcall;
  end;

function GetEHLServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): EHLServiceSoap;


implementation
  uses System.SysUtils;

function GetEHLServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): EHLServiceSoap;
const
  defWSDL = 'D:\项目\惠州\Ehlservice.xml';
  defURL  = 'http://10.47.186.132:8987/Ehlservice.asmx';
  defSvc  = 'EHLService';
  defPrt  = 'EHLServiceSoap';
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
    Result := (RIO as EHLServiceSoap);
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
  { EHLServiceSoap }
  InvRegistry.RegisterInterface(TypeInfo(EHLServiceSoap), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(EHLServiceSoap), 'http://tempuri.org/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(EHLServiceSoap), ioDocument);
  { EHLServiceSoap.queryObjectOut }
  InvRegistry.RegisterMethodInfo(TypeInfo(EHLServiceSoap), 'queryObjectOut', '',
                                 '[ReturnName="queryObjectOutResult"]', IS_OPTN);
  { EHLServiceSoap.writeObjectOut }
  InvRegistry.RegisterMethodInfo(TypeInfo(EHLServiceSoap), 'writeObjectOut', '',
                                 '[ReturnName="writeObjectOutResult"]', IS_OPTN);

end.