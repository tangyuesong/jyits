// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : D:\test\QPX7EFKV.xml
//  >Import : D:\test\QPX7EFKV.xml>0
// Encoding : UTF-8
// Version  : 1.0
// (2018/3/22 18:28:52 - - $Rev: 86412 $)
// ************************************************************************ //

unit uHik86;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_NLBL = $0004;
  IS_UNQL = $0008;
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
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]



  // ************************************************************************ //
  // Namespace : http://tempuri.org/ns.xsd/Service.wsdl
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : Service
  // service   : Service
  // port      : Service
  // URL       : http://localhost:80
  // ************************************************************************ //
  ServicePortType = interface(IInvokable)
  ['{8E2DE96C-5DB6-7AC3-5737-E869F1646034}']
    function  SendVehiclePass(const VehiclePassInfo: string; const PlatePicData: TByteDynArray; const CarPic1: TByteDynArray; const CarPic2: TByteDynArray; const CarPic3: TByteDynArray): string; stdcall;
    function  SendAlarmPass(const VehicleAlarmInfo: string; const PlatePicData: TByteDynArray; const CarPic1: TByteDynArray; const CarPic2: TByteDynArray; const CarPic3: TByteDynArray): string; stdcall;
    function  SendDeviceState(const DeviceState: string): string; stdcall;
    function  SynTime: string; stdcall;
    function  SendVehiclePassEx(const VehiclePassInfo: string): string; stdcall;
    function  SendAlarmPassEx(const VehicleAlarmInfo: string): string; stdcall;
  end;

function GetServicePortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServicePortType;


implementation
  uses System.SysUtils;

function GetServicePortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServicePortType;
const
  defWSDL = 'D:\test\QPX7EFKV.xml';
  defURL  = 'http://localhost:80';
  defSvc  = 'Service';
  defPrt  = 'Service';
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
    Result := (RIO as ServicePortType);
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
  { ServicePortType }
  InvRegistry.RegisterInterface(TypeInfo(ServicePortType), 'http://tempuri.org/ns.xsd/Service.wsdl', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServicePortType), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServicePortType), ioDocument);
  { ServicePortType.SendVehiclePass }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServicePortType), 'SendVehiclePass', '',
                                 '[ReturnName="ResPond", RequestNS="http://tempuri.org/ns.xsd", ResponseNS="http://tempuri.org/ns.xsd"]', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendVehiclePass', 'VehiclePassInfo', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendVehiclePass', 'PlatePicData', '',
                                '', IS_NLBL or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendVehiclePass', 'CarPic1', '',
                                '', IS_NLBL or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendVehiclePass', 'CarPic2', '',
                                '', IS_NLBL or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendVehiclePass', 'CarPic3', '',
                                '', IS_NLBL or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendVehiclePass', 'ResPond', '',
                                '', IS_UNQL);
  { ServicePortType.SendAlarmPass }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServicePortType), 'SendAlarmPass', '',
                                 '[ReturnName="ResPond", RequestNS="http://tempuri.org/ns.xsd", ResponseNS="http://tempuri.org/ns.xsd"]', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendAlarmPass', 'VehicleAlarmInfo', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendAlarmPass', 'PlatePicData', '',
                                '', IS_NLBL or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendAlarmPass', 'CarPic1', '',
                                '', IS_NLBL or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendAlarmPass', 'CarPic2', '',
                                '', IS_NLBL or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendAlarmPass', 'CarPic3', '',
                                '', IS_NLBL or IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendAlarmPass', 'ResPond', '',
                                '', IS_UNQL);
  { ServicePortType.SendDeviceState }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServicePortType), 'SendDeviceState', '',
                                 '[ReturnName="ResPond", RequestNS="http://tempuri.org/ns.xsd", ResponseNS="http://tempuri.org/ns.xsd"]', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendDeviceState', 'DeviceState', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendDeviceState', 'ResPond', '',
                                '', IS_UNQL);
  { ServicePortType.SynTime }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServicePortType), 'SynTime', '',
                                 '[ReturnName="ResPond", RequestNS="http://tempuri.org/ns.xsd", ResponseNS="http://tempuri.org/ns.xsd"]', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SynTime', 'ResPond', '',
                                '', IS_UNQL);
  { ServicePortType.SendVehiclePassEx }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServicePortType), 'SendVehiclePassEx', '',
                                 '[ReturnName="ResPond", RequestNS="http://tempuri.org/ns.xsd", ResponseNS="http://tempuri.org/ns.xsd"]', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendVehiclePassEx', 'VehiclePassInfo', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendVehiclePassEx', 'ResPond', '',
                                '', IS_UNQL);
  { ServicePortType.SendAlarmPassEx }
  InvRegistry.RegisterMethodInfo(TypeInfo(ServicePortType), 'SendAlarmPassEx', '',
                                 '[ReturnName="Respond", RequestNS="http://tempuri.org/ns.xsd", ResponseNS="http://tempuri.org/ns.xsd"]', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendAlarmPassEx', 'VehicleAlarmInfo', '',
                                '', IS_UNQL);
  InvRegistry.RegisterParamInfo(TypeInfo(ServicePortType), 'SendAlarmPassEx', 'Respond', '',
                                '', IS_UNQL);

end.