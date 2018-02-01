// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : d:\aa.xml
//  >Import : d:\aa.xml>0
// Encoding : UTF-8
// Version  : 1.0
// (2017/8/3 16:02:53 - - $Rev: 86412 $)
// ************************************************************************ //

unit uHoleService;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNQL = $0008;


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
  // Namespace : http://ws.sunshine.com
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : HoleServiceSoapBinding
  // service   : HoleService
  // port      : HoleServicePort
  // URL       : http://10.43.244.44:9080/jcbktrans/services/hole
  // ************************************************************************ //
  HoleService = interface(IInvokable)
  ['{CBBE9A6C-4DD0-5F77-45F2-02AB2AD1622E}']
    function  initTrans(const gateId: string; const directId: string; const wayId: string; const initKey: string): string; stdcall;
    function  writeVehicleInfo(const gateId: string; const directionId: string; const driverWayId: string; const driverWayType: string; const licenseType: string; const passTime: string; 
                               const speed: Int64; const licenseColor: string; const carType: string; const license: string; const backLicense: string; 
                               const backLicenseColor: string; const identical: string; const carColor: string; const limitSpeed: Int64; const carBrand: string; 
                               const carShape: string; const travelStatus: string; const violationFlag: string; const picPath1: string; const picPath2: string; 
                               const picPath3: string; const featurePic: string; const driverPic: string; const copilotPic: string; const sendFlag: string
                               ): string; stdcall;
    function  querySyncTime: string; stdcall;
    function  updateGateDirectStatus(const gateId: string; const directId: string; const status: string): string; stdcall;
  end;

function GetHoleService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): HoleService;


implementation
  uses System.SysUtils;

function GetHoleService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): HoleService;
const
  defWSDL = 'd:\aa.xml';
  defURL  = 'http://10.43.244.44:9080/jcbktrans/services/hole';
  defSvc  = 'HoleService';
  defPrt  = 'HoleServicePort';
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
    Result := (RIO as HoleService);
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
  { HoleService }
  InvRegistry.RegisterInterface(TypeInfo(HoleService), 'http://ws.sunshine.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(HoleService), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(HoleService), ioDocument);
  { HoleService.initTrans }
  InvRegistry.RegisterMethodInfo(TypeInfo(HoleService), 'initTrans', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'initTrans', 'gateId', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'initTrans', 'directId', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'initTrans', 'wayId', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'initTrans', 'initKey', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'initTrans', 'return', '',
                                '', IS_UNQL);
  { HoleService.writeVehicleInfo }
  InvRegistry.RegisterMethodInfo(TypeInfo(HoleService), 'writeVehicleInfo', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'gateId', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'directionId', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'driverWayId', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'driverWayType', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'licenseType', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'passTime', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'speed', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'licenseColor', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'carType', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'license', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'backLicense', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'backLicenseColor', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'identical', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'carColor', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'limitSpeed', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'carBrand', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'carShape', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'travelStatus', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'violationFlag', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'picPath1', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'picPath2', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'picPath3', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'featurePic', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'driverPic', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'copilotPic', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'sendFlag', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'writeVehicleInfo', 'return', '',
                                '', IS_UNQL);
  { HoleService.querySyncTime }
  InvRegistry.RegisterMethodInfo(TypeInfo(HoleService), 'querySyncTime', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'querySyncTime', 'return', '',
                                '', IS_UNQL);
  { HoleService.updateGateDirectStatus }
  InvRegistry.RegisterMethodInfo(TypeInfo(HoleService), 'updateGateDirectStatus', '',
                                 '[ReturnName="return"]', IS_OPTN or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'updateGateDirectStatus', 'gateId', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'updateGateDirectStatus', 'directId', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'updateGateDirectStatus', 'status', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(HoleService), 'updateGateDirectStatus', 'return', '',
                                '', IS_UNQL);

end.