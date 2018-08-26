// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.46.177.139:8181/traffic/ws/police?wsdl
//  >Import : http://10.46.177.139:8181/traffic/ws/police?wsdl>0
// Encoding : UTF-8
// Codegen  : [wfForceSOAP12+]
// Version  : 1.0
// (2018/4/10 16:57:01 - - $Rev: 86412 $)
// ************************************************************************ //

unit uPolice;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  mltClientHRequest    = class;                 { "http://www.hikvision.com/traffic/ws/"[GblCplx] }
  groupSearchRequest   = class;                 { "http://www.hikvision.com/traffic/ws/"[GblCplx] }
  mltClientFieldOption = class;                 { "http://www.hikvision.com/traffic/ws/"[GblCplx] }

  Array_Of_mltClientFieldOption = array of mltClientFieldOption;   { "http://www.hikvision.com/traffic/ws/"[GblUbnd] }


  // ************************************************************************ //
  // XML       : mltClientHRequest, global, <complexType>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  mltClientHRequest = class(TRemotable)
  private
    FbeanId: string;
    FbeanId_Specified: boolean;
    FcurrentPage: Integer;
    FcurrentPage_Specified: boolean;
    FcursorMark: string;
    FcursorMark_Specified: boolean;
    FcursorNum: Integer;
    FfieldOptions: Array_Of_mltClientFieldOption;
    FfieldOptions_Specified: boolean;
    Ffq: string;
    Ffq_Specified: boolean;
    FhbaseTableName: string;
    FhbaseTableName_Specified: boolean;
    FpageSize: Integer;
    FpageSize_Specified: boolean;
    Fq: string;
    Fq_Specified: boolean;
    FsortColumn: string;
    FsortColumn_Specified: boolean;
    FsortMethod: string;
    FsortMethod_Specified: boolean;
    procedure SetbeanId(Index: Integer; const Astring: string);
    function  beanId_Specified(Index: Integer): boolean;
    procedure SetcurrentPage(Index: Integer; const AInteger: Integer);
    function  currentPage_Specified(Index: Integer): boolean;
    procedure SetcursorMark(Index: Integer; const Astring: string);
    function  cursorMark_Specified(Index: Integer): boolean;
    procedure SetfieldOptions(Index: Integer; const AArray_Of_mltClientFieldOption: Array_Of_mltClientFieldOption);
    function  fieldOptions_Specified(Index: Integer): boolean;
    procedure Setfq(Index: Integer; const Astring: string);
    function  fqSpecified(Index: Integer): boolean;
    procedure SethbaseTableName(Index: Integer; const Astring: string);
    function  hbaseTableName_Specified(Index: Integer): boolean;
    procedure SetpageSize(Index: Integer; const AInteger: Integer);
    function  pageSize_Specified(Index: Integer): boolean;
    procedure Setq(Index: Integer; const Astring: string);
    function  q_Specified(Index: Integer): boolean;
    procedure SetsortColumn(Index: Integer; const Astring: string);
    function  sortColumn_Specified(Index: Integer): boolean;
    procedure SetsortMethod(Index: Integer; const Astring: string);
    function  sortMethod_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property beanId:         string                         Index (IS_OPTN) read FbeanId write SetbeanId stored beanId_Specified;
    property currentPage:    Integer                        Index (IS_OPTN) read FcurrentPage write SetcurrentPage stored currentPage_Specified;
    property cursorMark:     string                         Index (IS_OPTN) read FcursorMark write SetcursorMark stored cursorMark_Specified;
    property cursorNum:      Integer                        read FcursorNum write FcursorNum;
    property fieldOptions:   Array_Of_mltClientFieldOption  Index (IS_OPTN or IS_UNBD) read FfieldOptions write SetfieldOptions stored fieldOptions_Specified;
    property pfq:             string                         Index (IS_OPTN) read Ffq write Setfq stored fqSpecified;
    property hbaseTableName: string                         Index (IS_OPTN) read FhbaseTableName write SethbaseTableName stored hbaseTableName_Specified;
    property pageSize:       Integer                        Index (IS_OPTN) read FpageSize write SetpageSize stored pageSize_Specified;
    property q:              string                         Index (IS_OPTN) read Fq write Setq stored q_Specified;
    property sortColumn:     string                         Index (IS_OPTN) read FsortColumn write SetsortColumn stored sortColumn_Specified;
    property sortMethod:     string                         Index (IS_OPTN) read FsortMethod write SetsortMethod stored sortMethod_Specified;
  end;



  // ************************************************************************ //
  // XML       : groupSearchRequest, global, <complexType>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  groupSearchRequest = class(mltClientHRequest)
  private
    FgroupType: string;
    FgroupType_Specified: boolean;
    procedure SetgroupType(Index: Integer; const Astring: string);
    function  groupType_Specified(Index: Integer): boolean;
  published
    property groupType: string  Index (IS_OPTN) read FgroupType write SetgroupType stored groupType_Specified;
  end;



  // ************************************************************************ //
  // XML       : mltClientFieldOption, global, <complexType>
  // Namespace : http://www.hikvision.com/traffic/ws/
  // ************************************************************************ //
  mltClientFieldOption = class(TRemotable)
  private
    FfiledName: string;
    FfiledName_Specified: boolean;
    FkeyWords: string;
    FkeyWords_Specified: boolean;
    procedure SetfiledName(Index: Integer; const Astring: string);
    function  filedName_Specified(Index: Integer): boolean;
    procedure SetkeyWords(Index: Integer; const Astring: string);
    function  keyWords_Specified(Index: Integer): boolean;
  published
    property filedName: string  Index (IS_OPTN) read FfiledName write SetfiledName stored filedName_Specified;
    property keyWords:  string  Index (IS_OPTN) read FkeyWords write SetkeyWords stored keyWords_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://www.hikvision.com/traffic/ws/
  // style     : ????
  // use       : ????
  // binding   : PoliceServiceSoapBinding
  // service   : PoliceService
  // port      : policePort
  // ************************************************************************ //
  police = interface(IInvokable)
  ['{3EFCEEC1-605C-D4DB-A86D-F1BC8A71272C}']
    function  mostActiveVehicleSummary(const taskId: string; const startTime: string; const endTime: string; const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  trackerIdentifyAnalysis(const taskId: string; const trackerArgs: string; const frontThreshold: Integer; const backThreshold: Integer; const threshold: Integer; const pageSize: Integer;
                                      const pageNo: Integer): string; stdcall;
    function  crossAggregationAnalysis(const taskId: string; const districts: string; const threshold: Integer; const pageSize: Integer; const pageNo: Integer; const plateColor: Integer
                                       ): string; stdcall;
    function  consecutiveFoulsAnalysis(const taskId: string; const plateNos: string; const startTime: string; const endTime: string; const freSet: Integer; const threshold: Integer; 
                                       const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  vehicleGroupStatistics(const taskId: string; const sort: string; const statisticsType: Integer; const startTime: string; const endTime: string; const pageSize: Integer;
                                     const pageNo: Integer): string; stdcall;
    function  trackerLawAnalysis(const taskId: string; const plateNos: string; const startDate: string; const endDate: string; const plateColor: Integer; const crossIds: string;
                                 const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  frequencyVehicleAnalysis(const taskId: string; const plateNos: string; const startTime: string; const endTime: string; const freSet: Integer; const threshold: Integer; 
                                       const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  policeDataAnalysis(const taskId: string; const startDate: string; const endDate: string; const more: string; const pageSize: Integer; const pageNo: Integer
                                 ): string; stdcall;
    function  nightVehicleAnalysis(const taskId: string; const crossIds: string; const plateNos: string; const startDate: string; const endDate: string; const startTime: string;
                                   const endTime: string; const vehicleTypes: string; const vehicleLogos: string; const vehicleSublogos: string; const vehicleModels: string;
                                   const freSet: Integer; const threshold: Integer; const pageSize: Integer; const pageNo: Integer): string; stdcall;
    function  groupSearch(const arg0: groupSearchRequest): string; stdcall;
  end;

function Getpolice(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): police;


implementation
  uses System.SysUtils;

function Getpolice(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): police;
const
  defWSDL = 'http://10.46.177.139:8181/traffic/ws/police?wsdl';
  defURL  = '';
  defSvc  = 'PoliceService';
  defPrt  = 'policePort';
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
    Result := (RIO as police);
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


destructor mltClientHRequest.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FfieldOptions)-1 do
    System.SysUtils.FreeAndNil(FfieldOptions[I]);
  System.SetLength(FfieldOptions, 0);
  inherited Destroy;
end;

procedure mltClientHRequest.SetbeanId(Index: Integer; const Astring: string);
begin
  FbeanId := Astring;
  FbeanId_Specified := True;
end;

function mltClientHRequest.beanId_Specified(Index: Integer): boolean;
begin
  Result := FbeanId_Specified;
end;

procedure mltClientHRequest.SetcurrentPage(Index: Integer; const AInteger: Integer);
begin
  FcurrentPage := AInteger;
  FcurrentPage_Specified := True;
end;

function mltClientHRequest.currentPage_Specified(Index: Integer): boolean;
begin
  Result := FcurrentPage_Specified;
end;

procedure mltClientHRequest.SetcursorMark(Index: Integer; const Astring: string);
begin
  FcursorMark := Astring;
  FcursorMark_Specified := True;
end;

function mltClientHRequest.cursorMark_Specified(Index: Integer): boolean;
begin
  Result := FcursorMark_Specified;
end;

procedure mltClientHRequest.SetfieldOptions(Index: Integer; const AArray_Of_mltClientFieldOption: Array_Of_mltClientFieldOption);
begin
  FfieldOptions := AArray_Of_mltClientFieldOption;
  FfieldOptions_Specified := True;
end;

function mltClientHRequest.fieldOptions_Specified(Index: Integer): boolean;
begin
  Result := FfieldOptions_Specified;
end;

procedure mltClientHRequest.Setfq(Index: Integer; const Astring: string);
begin
  Ffq := Astring;
  Ffq_Specified := True;
end;

function mltClientHRequest.fqSpecified(Index: Integer): boolean;
begin
  Result := Ffq_Specified;
end;

procedure mltClientHRequest.SethbaseTableName(Index: Integer; const Astring: string);
begin
  FhbaseTableName := Astring;
  FhbaseTableName_Specified := True;
end;

function mltClientHRequest.hbaseTableName_Specified(Index: Integer): boolean;
begin
  Result := FhbaseTableName_Specified;
end;

procedure mltClientHRequest.SetpageSize(Index: Integer; const AInteger: Integer);
begin
  FpageSize := AInteger;
  FpageSize_Specified := True;
end;

function mltClientHRequest.pageSize_Specified(Index: Integer): boolean;
begin
  Result := FpageSize_Specified;
end;

procedure mltClientHRequest.Setq(Index: Integer; const Astring: string);
begin
  Fq := Astring;
  Fq_Specified := True;
end;

function mltClientHRequest.q_Specified(Index: Integer): boolean;
begin
  Result := Fq_Specified;
end;

procedure mltClientHRequest.SetsortColumn(Index: Integer; const Astring: string);
begin
  FsortColumn := Astring;
  FsortColumn_Specified := True;
end;

function mltClientHRequest.sortColumn_Specified(Index: Integer): boolean;
begin
  Result := FsortColumn_Specified;
end;

procedure mltClientHRequest.SetsortMethod(Index: Integer; const Astring: string);
begin
  FsortMethod := Astring;
  FsortMethod_Specified := True;
end;

function mltClientHRequest.sortMethod_Specified(Index: Integer): boolean;
begin
  Result := FsortMethod_Specified;
end;

procedure groupSearchRequest.SetgroupType(Index: Integer; const Astring: string);
begin
  FgroupType := Astring;
  FgroupType_Specified := True;
end;

function groupSearchRequest.groupType_Specified(Index: Integer): boolean;
begin
  Result := FgroupType_Specified;
end;

procedure mltClientFieldOption.SetfiledName(Index: Integer; const Astring: string);
begin
  FfiledName := Astring;
  FfiledName_Specified := True;
end;

function mltClientFieldOption.filedName_Specified(Index: Integer): boolean;
begin
  Result := FfiledName_Specified;
end;

procedure mltClientFieldOption.SetkeyWords(Index: Integer; const Astring: string);
begin
  FkeyWords := Astring;
  FkeyWords_Specified := True;
end;

function mltClientFieldOption.keyWords_Specified(Index: Integer): boolean;
begin
  Result := FkeyWords_Specified;
end;

initialization
  { police }
  InvRegistry.RegisterInterface(TypeInfo(police), 'http://www.hikvision.com/traffic/ws/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(police), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(police), ioSOAP12);
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_mltClientFieldOption), 'http://www.hikvision.com/traffic/ws/', 'Array_Of_mltClientFieldOption');
  RemClassRegistry.RegisterXSClass(mltClientHRequest, 'http://www.hikvision.com/traffic/ws/', 'mltClientHRequest');
  RemClassRegistry.RegisterXSClass(groupSearchRequest, 'http://www.hikvision.com/traffic/ws/', 'groupSearchRequest');
  RemClassRegistry.RegisterXSClass(mltClientFieldOption, 'http://www.hikvision.com/traffic/ws/', 'mltClientFieldOption');

end.