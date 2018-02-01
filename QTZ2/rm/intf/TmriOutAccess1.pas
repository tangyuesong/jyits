// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : E:\TmriOutAccess.xml
// Encoding : UTF-8
// Version  : 1.0
// (2018/1/24 18:30:00 - - $Rev: 86412 $)
// ************************************************************************ //

unit TmriOutAccess1;

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
  // Namespace : http://ws.trffweb.qy.com
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : TmriOutAccessSoapBinding
  // service   : TmriOutAccessService
  // port      : TmriOutAccess
  // URL       : http://10.46.160.195:9080/trffweb/services/TmriOutAccess
  // ************************************************************************ //
  TmriOutAccess = interface(IInvokable)
  ['{ACA06D61-BE03-CD48-582A-16AFBE463BBC}']
    function  queryObjectOut(const xtlb: string; const jkxlh: string; const jkid: string; const QueryXmlDoc: string): string; stdcall;
    function  writeObjectOut(const xtlb: string; const jkxlh: string; const jkid: string; const WriteXmlDoc: string): string; stdcall;
    function  queryObjectOutNew(const xtlb: string; const jkxlh: string; const jkid: string; const yhbz: string; const dwmc: string; const dwjgdm: string; 
                                const yhxm: string; const zdbs: string; const UTF8XmlDoc: string): string; stdcall;
    function  writeObjectOutNew(const xtlb: string; const jkxlh: string; const jkid: string; const yhbz: string; const dwmc: string; const dwjgdm: string; 
                                const yhxm: string; const zdbs: string; const UTF8XmlDoc: string): string; stdcall;
  end;

function GetTmriOutAccess(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): TmriOutAccess;


implementation
  uses System.SysUtils;

function GetTmriOutAccess(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): TmriOutAccess;
const
  defWSDL = 'E:\TmriOutAccess.xml';
  defURL  = 'http://10.46.160.195:9080/trffweb/services/TmriOutAccess';
  defSvc  = 'TmriOutAccessService';
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
    Result := (RIO as TmriOutAccess);
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
  { TmriOutAccess }
  InvRegistry.RegisterInterface(TypeInfo(TmriOutAccess), 'http://ws.trffweb.qy.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(TmriOutAccess), '');

end.