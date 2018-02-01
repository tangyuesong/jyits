// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.43.255.204:9080/rminf/services/Trans?wsdl
//  >Import : http://10.43.255.204:9080/rminf/services/Trans?wsdl>0
// Encoding : UTF-8
// Version  : 1.0
// (2016/11/21 16:48:30 - - $Rev: 76228 $)
// ************************************************************************ //

unit Trans1;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
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
  // !:long            - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://webservice.tfc.tmri.com
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : TransSoapBinding
  // service   : TransService
  // port      : Trans
  // URL       : http://10.43.255.204:9080/rminf/services/Trans
  // ************************************************************************ //
  Trans = interface(IInvokable)
  ['{BA503EC5-D51E-FE02-00AB-F5CAF164F47C}']
    function  InitTrans(const kkbh: string; const fxlx: string; const cdh: Int64; const info: string): Int64; stdcall;
    function  WriteVehicleInfo(const kkbh: string; const fxlx: string; const cdh: Int64; const hphm: string; const hpzl: string; const gcsj: string; 
                               const clsd: Int64; const clxs: Int64; const wfdm: string; const cwkc: Int64; const hpys: string; 
                               const cllx: string; const fzhpzl: string; const fzhphm: string; const fzhpys: string; const clpp: string; 
                               const clwx: string; const csys: string; const tplj: string; const tp1: string; const tp2: string; 
                               const tp3: string; const tztp: string): Int64; stdcall;
    function  QueryLimitSpeed(const kkbh: string; const fxlx: string; const cdh: Int64; const cllx: string): Int64; stdcall;
    function  QuerySyncTime: string; stdcall;
    function  GetLastMessage: string; stdcall;
  end;

function GetTrans(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Trans;


implementation
  uses System.SysUtils;

function GetTrans(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Trans;
const
  defWSDL = 'http://10.43.255.204:9080/rminf/services/Trans?wsdl';
  defURL  = 'http://10.43.255.204:9080/rminf/services/Trans';
  defSvc  = 'TransService';
  defPrt  = 'Trans';
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
    Result := (RIO as Trans);
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
  { Trans }
  InvRegistry.RegisterInterface(TypeInfo(Trans), 'http://webservice.tfc.tmri.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Trans), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(Trans), ioDocument);
  { Trans.InitTrans }
  InvRegistry.RegisterMethodInfo(TypeInfo(Trans), 'InitTrans', '',
                                 '[ReturnName="InitTransReturn"]');
  { Trans.WriteVehicleInfo }
  InvRegistry.RegisterMethodInfo(TypeInfo(Trans), 'WriteVehicleInfo', '',
                                 '[ReturnName="WriteVehicleInfoReturn"]');
  { Trans.QueryLimitSpeed }
  InvRegistry.RegisterMethodInfo(TypeInfo(Trans), 'QueryLimitSpeed', '',
                                 '[ReturnName="QueryLimitSpeedReturn"]');
  { Trans.QuerySyncTime }
  InvRegistry.RegisterMethodInfo(TypeInfo(Trans), 'QuerySyncTime', '',
                                 '[ReturnName="QuerySyncTimeReturn"]');
  { Trans.GetLastMessage }
  InvRegistry.RegisterMethodInfo(TypeInfo(Trans), 'GetLastMessage', '',
                                 '[ReturnName="GetLastMessageReturn"]');

end.