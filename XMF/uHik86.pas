// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : F:\web service对接描述文档(V5.1).wsdl
//  >Import : F:\web service对接描述文档(V5.1).wsdl>0
// Encoding : UTF-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (2018/3/22 11:50:04 - - $Rev: 86412 $)
// ************************************************************************ //

unit uHik86;

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
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  SynTime              = class;                 { "http://tempuri.org/ns.xsd"[GblElm] }
  SendVehiclePassExResponse = class;            { "http://tempuri.org/ns.xsd"[GblElm] }
  SendAlarmPassEx      = class;                 { "http://tempuri.org/ns.xsd"[GblElm] }
  SendAlarmPassExResponse = class;              { "http://tempuri.org/ns.xsd"[GblElm] }
  SendVehiclePassEx    = class;                 { "http://tempuri.org/ns.xsd"[GblElm] }
  SendDeviceStateResponse = class;              { "http://tempuri.org/ns.xsd"[GblElm] }
  SynTimeResponse      = class;                 { "http://tempuri.org/ns.xsd"[GblElm] }
  SendVehiclePass      = class;                 { "http://tempuri.org/ns.xsd"[GblElm] }
  SendVehiclePassResponse = class;              { "http://tempuri.org/ns.xsd"[GblElm] }
  SendDeviceState      = class;                 { "http://tempuri.org/ns.xsd"[GblElm] }
  SendAlarmPassResponse = class;                { "http://tempuri.org/ns.xsd"[GblElm] }
  SendAlarmPass        = class;                 { "http://tempuri.org/ns.xsd"[GblElm] }



  // ************************************************************************ //
  // XML       : SynTime, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SynTime = class(TRemotable)
  private
  published
  end;



  // ************************************************************************ //
  // XML       : SendVehiclePassExResponse, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendVehiclePassExResponse = class(TRemotable)
  private
    FResPond: string;
  published
    property ResPond: string  read FResPond write FResPond;
  end;



  // ************************************************************************ //
  // XML       : SendAlarmPassEx, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendAlarmPassEx = class(TRemotable)
  private
    FVehicleAlarmInfo: string;
  published
    property VehicleAlarmInfo: string  read FVehicleAlarmInfo write FVehicleAlarmInfo;
  end;



  // ************************************************************************ //
  // XML       : SendAlarmPassExResponse, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendAlarmPassExResponse = class(TRemotable)
  private
    FRespond: string;
  published
    property Respond: string  read FRespond write FRespond;
  end;



  // ************************************************************************ //
  // XML       : SendVehiclePassEx, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendVehiclePassEx = class(TRemotable)
  private
    FVehiclePassInfo: string;
  published
    property VehiclePassInfo: string  read FVehiclePassInfo write FVehiclePassInfo;
  end;



  // ************************************************************************ //
  // XML       : SendDeviceStateResponse, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendDeviceStateResponse = class(TRemotable)
  private
    FResPond: string;
  published
    property ResPond: string  read FResPond write FResPond;
  end;



  // ************************************************************************ //
  // XML       : SynTimeResponse, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SynTimeResponse = class(TRemotable)
  private
    FResPond: string;
  published
    property ResPond: string  read FResPond write FResPond;
  end;



  // ************************************************************************ //
  // XML       : SendVehiclePass, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendVehiclePass = class(TRemotable)
  private
    FVehiclePassInfo: string;
    FPlatePicData: TByteDynArray;
    FCarPic1: TByteDynArray;
    FCarPic2: TByteDynArray;
    FCarPic3: TByteDynArray;
  published
    property VehiclePassInfo: string         read FVehiclePassInfo write FVehiclePassInfo;
    property PlatePicData:    TByteDynArray  read FPlatePicData write FPlatePicData;
    property CarPic1:         TByteDynArray  read FCarPic1 write FCarPic1;
    property CarPic2:         TByteDynArray  read FCarPic2 write FCarPic2;
    property CarPic3:         TByteDynArray  read FCarPic3 write FCarPic3;
  end;



  // ************************************************************************ //
  // XML       : SendVehiclePassResponse, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendVehiclePassResponse = class(TRemotable)
  private
    FResPond: string;
  published
    property ResPond: string  read FResPond write FResPond;
  end;



  // ************************************************************************ //
  // XML       : SendDeviceState, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendDeviceState = class(TRemotable)
  private
    FDeviceState: string;
  published
    property DeviceState: string  read FDeviceState write FDeviceState;
  end;



  // ************************************************************************ //
  // XML       : SendAlarmPassResponse, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendAlarmPassResponse = class(TRemotable)
  private
    FResPond: string;
  published
    property ResPond: string  read FResPond write FResPond;
  end;



  // ************************************************************************ //
  // XML       : SendAlarmPass, global, <element>
  // Namespace : http://tempuri.org/ns.xsd
  // ************************************************************************ //
  SendAlarmPass = class(TRemotable)
  private
    FVehicleAlarmInfo: string;
    FPlatePicData: TByteDynArray;
    FCarPic1: TByteDynArray;
    FCarPic2: TByteDynArray;
    FCarPic3: TByteDynArray;
  published
    property VehicleAlarmInfo: string         read FVehicleAlarmInfo write FVehicleAlarmInfo;
    property PlatePicData:     TByteDynArray  read FPlatePicData write FPlatePicData;
    property CarPic1:          TByteDynArray  read FCarPic1 write FCarPic1;
    property CarPic2:          TByteDynArray  read FCarPic2 write FCarPic2;
    property CarPic3:          TByteDynArray  read FCarPic3 write FCarPic3;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/ns.xsd/Service.wsdl
  // style     : ????
  // use       : ????
  // binding   : Service
  // service   : Service
  // port      : Service
  // ************************************************************************ //
  ServicePortType = interface(IInvokable)
  ['{8E2DE96C-5DB6-7AC3-5737-E869F1646034}']
    function  SendVehiclePass(const parameters: SendVehiclePass): SendVehiclePassResponse; stdcall;
    function  SendAlarmPass(const parameters: SendAlarmPass): SendAlarmPassResponse; stdcall;
    function  SendDeviceState(const parameters: SendDeviceState): SendDeviceStateResponse; stdcall;
    function  SynTime(const parameters: SynTime): SynTimeResponse; stdcall;
    function  SendVehiclePassEx(const parameters: SendVehiclePassEx): SendVehiclePassExResponse; stdcall;
    function  SendAlarmPassEx(const parameters: SendAlarmPassEx): SendAlarmPassExResponse; stdcall;
  end;

function GetServicePortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServicePortType;


implementation
  uses System.SysUtils;

function GetServicePortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServicePortType;
const
  defWSDL = 'F:\web service对接描述文档(V5.1).wsdl';
  defURL  = '';
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
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServicePortType), ioSOAP12);
  RemClassRegistry.RegisterXSClass(SynTime, 'http://tempuri.org/ns.xsd', 'SynTime');
  RemClassRegistry.RegisterXSClass(SendVehiclePassExResponse, 'http://tempuri.org/ns.xsd', 'SendVehiclePassExResponse');
  RemClassRegistry.RegisterXSClass(SendAlarmPassEx, 'http://tempuri.org/ns.xsd', 'SendAlarmPassEx');
  RemClassRegistry.RegisterXSClass(SendAlarmPassExResponse, 'http://tempuri.org/ns.xsd', 'SendAlarmPassExResponse');
  RemClassRegistry.RegisterXSClass(SendVehiclePassEx, 'http://tempuri.org/ns.xsd', 'SendVehiclePassEx');
  RemClassRegistry.RegisterXSClass(SendDeviceStateResponse, 'http://tempuri.org/ns.xsd', 'SendDeviceStateResponse');
  RemClassRegistry.RegisterXSClass(SynTimeResponse, 'http://tempuri.org/ns.xsd', 'SynTimeResponse');
  RemClassRegistry.RegisterXSClass(SendVehiclePass, 'http://tempuri.org/ns.xsd', 'SendVehiclePass');
  RemClassRegistry.RegisterXSClass(SendVehiclePassResponse, 'http://tempuri.org/ns.xsd', 'SendVehiclePassResponse');
  RemClassRegistry.RegisterXSClass(SendDeviceState, 'http://tempuri.org/ns.xsd', 'SendDeviceState');
  RemClassRegistry.RegisterXSClass(SendAlarmPassResponse, 'http://tempuri.org/ns.xsd', 'SendAlarmPassResponse');
  RemClassRegistry.RegisterXSClass(SendAlarmPass, 'http://tempuri.org/ns.xsd', 'SendAlarmPass');

end.