// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.46.177.139:8181/traffic/ws/profile?wsdl
// Encoding : UTF-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (2018/4/11 16:05:01 - - $Rev: 86412 $)
// ************************************************************************ //

unit uProfile;

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
  // Namespace : http://www.hikvision.com/traffic/ws/
  // style     : ????
  // use       : ????
  // binding   : VehicleProfileServiceSoapBinding
  // service   : VehicleProfileService
  // port      : vehicleProfilePort
  // ************************************************************************ //
  vehicleProfile = interface(IInvokable)
  ['{52362454-644E-C948-6F1F-E7CF4D29D255}']
    function  query(const dataJson: string): string; stdcall;
  end;

function GetvehicleProfile(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): vehicleProfile;


implementation
  uses System.SysUtils;

function GetvehicleProfile(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): vehicleProfile;
const
  defWSDL = 'http://10.46.177.139:8181/traffic/ws/profile?wsdl';
  defURL  = '';
  defSvc  = 'VehicleProfileService';
  defPrt  = 'vehicleProfilePort';
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
    Result := (RIO as vehicleProfile);
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
  { vehicleProfile }
  InvRegistry.RegisterInterface(TypeInfo(vehicleProfile), 'http://www.hikvision.com/traffic/ws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(vehicleProfile), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(vehicleProfile), ioSOAP12);

end.