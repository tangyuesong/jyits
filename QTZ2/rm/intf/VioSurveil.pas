// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.46.160.195:9080/jyvio/services/VioSurveil?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (2018/5/21 11:53:01 - - $Rev: 86412 $)
// ************************************************************************ //

unit VioSurveil;

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
  // Namespace : http://services.xzx.com
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : VioSurveilSoapBinding
  // service   : VioSurveilServicesService
  // port      : VioSurveil
  // URL       : http://10.46.160.195:9080/jyvio/services/VioSurveil
  // ************************************************************************ //
  VioSurveilServices = interface(IInvokable)
  ['{063692D2-6479-B222-134D-718CCB3A355D}']
    function  QueryVehInfo(const SN: string; const XmlDoc: string): string; stdcall;
    function  QueryDrvInfo(const SN: string; const XmlDoc: string): string; stdcall;
    function  WriteVioSurveil(const SN: string; const XmlDoc: string): string; stdcall;
    function  WriteVioSurveil_Tmp(const SN: string; const XmlDoc: string): string; stdcall;
    function  QueryViolationInfo(const SN: string; const XmlDoc: string): string; stdcall;
    function  QuerySurveilInfo(const SN: string; const XmlDoc: string): string; stdcall;
    function  QueryViosurveilInfoByCphm(const hphm: string; const hpzl: string): string; stdcall;
  end;

function GetVioSurveilServices(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): VioSurveilServices;


implementation
  uses System.SysUtils;

function GetVioSurveilServices(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): VioSurveilServices;
const
  defWSDL = 'http://10.46.160.195:9080/jyvio/services/VioSurveil?wsdl';
  defURL  = 'http://10.46.160.195:9080/jyvio/services/VioSurveil';
  defSvc  = 'VioSurveilServicesService';
  defPrt  = 'VioSurveil';
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
    Result := (RIO as VioSurveilServices);
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
  { VioSurveilServices }
  InvRegistry.RegisterInterface(TypeInfo(VioSurveilServices), 'http://services.xzx.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(VioSurveilServices), '');

end.