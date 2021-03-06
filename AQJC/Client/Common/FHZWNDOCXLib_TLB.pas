unit FHZWNDOCXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 2017/6/4 10:05:45 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\Eyeshot6000BSOCX\FhzWndOcx.ocx (1)
// LIBID: {0465F10B-090E-460C-B952-CFB1C7A106CF}
// LCID: 0
// Helpfile: C:\Program Files (x86)\Eyeshot6000BSOCX\FhzWndOcx.hlp 
// HelpString: FhzWndOcx ActiveX Control module
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleCtrls, Vcl.OleServer, Winapi.ActiveX;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  FHZWNDOCXLibMajorVersion = 1;
  FHZWNDOCXLibMinorVersion = 0;

  LIBID_FHZWNDOCXLib: TGUID = '{0465F10B-090E-460C-B952-CFB1C7A106CF}';

  DIID__DFhzWndOcx: TGUID = '{AAF83E10-8F89-4A00-841D-DCB94F0171B1}';
  DIID__DFhzWndOcxEvents: TGUID = '{76AA552C-5E06-4D74-9B84-144DB69E16F0}';
  CLASS_FhzWndOcx: TGUID = '{A6886767-12F1-4C24-B172-BB66DADFB457}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DFhzWndOcx = dispinterface;
  _DFhzWndOcxEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  FhzWndOcx = _DFhzWndOcx;


// *********************************************************************//
// DispIntf:  _DFhzWndOcx
// Flags:     (4112) Hidden Dispatchable
// GUID:      {AAF83E10-8F89-4A00-841D-DCB94F0171B1}
// *********************************************************************//
  _DFhzWndOcx = dispinterface
    ['{AAF83E10-8F89-4A00-841D-DCB94F0171B1}']
    function FhzWndInitial: Integer; dispid 1;
    function FhzWndFlash: Integer; dispid 2;
    function FhzWndShowPicture(const path: WideString; reserse: Integer): Integer; dispid 3;
    function FhzWndFullScream(isFull: WordBool; reserve: Integer): Integer; dispid 4;
    function FhzWndDestroyWindow(hWnd: Integer; reserve: Integer): Integer; dispid 5;
    function FhzWndSetWinType(windowtype: Integer; resever: Integer): Integer; dispid 6;
    procedure AboutBox; dispid -552;
    function FhzWndLoadUrl(const url: WideString; const resevr: WideString; resevr1: Integer): Integer; dispid 7;
    function FhzWndGraspUrlMap(const DstPath: WideString; const resvr: WideString; 
                               const resvr1: WideString; resvr2: Integer; resvr3: Integer): Integer; dispid 8;
  end;

// *********************************************************************//
// DispIntf:  _DFhzWndOcxEvents
// Flags:     (4096) Dispatchable
// GUID:      {76AA552C-5E06-4D74-9B84-144DB69E16F0}
// *********************************************************************//
  _DFhzWndOcxEvents = dispinterface
    ['{76AA552C-5E06-4D74-9B84-144DB69E16F0}']
    procedure FhzWndOnMouseEvent(const describe: WideString; handle: Integer; 
                                 const sparam: WideString); dispid 1;
    procedure FhzWndLoginEvent(ErrorCode: Integer); dispid 2;
    procedure FhzWndIvsPicEvent(const PicPath: WideString; const CaeeResOrgCode: WideString; 
                                PicTime: Integer; const Reserved1: WideString; Reserved2: Integer); dispid 3;
    procedure FhzWndVgPicEvent(const PicPath: WideString; const CaeeResOrgCode: WideString; 
                               PicTime: Integer; const Reserved1: WideString; Reserved2: Integer); dispid 4;
    procedure FhzWndAbsPicEvent(const PicPath: WideString; const CaeeResOrgCode: WideString; 
                                PicTime: Integer; const Reserved1: WideString; Reserved2: Integer); dispid 5;
    procedure FhzWndFcPicEvent(const PicPath: WideString; const CaeeResOrgCode: WideString; 
                               PicTime: Integer; const Reserved1: WideString; Reserved2: Integer); dispid 6;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TFhzWndOcx
// Help String      : FhzWndOcx Control
// Default Interface: _DFhzWndOcx
// Def. Intf. DISP? : Yes
// Event   Interface: _DFhzWndOcxEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TFhzWndOcxFhzWndOnMouseEvent = procedure(ASender: TObject; const describe: WideString; 
                                                             handle: Integer; 
                                                             const sparam: WideString) of object;
  TFhzWndOcxFhzWndLoginEvent = procedure(ASender: TObject; ErrorCode: Integer) of object;
  TFhzWndOcxFhzWndIvsPicEvent = procedure(ASender: TObject; const PicPath: WideString; 
                                                            const CaeeResOrgCode: WideString; 
                                                            PicTime: Integer; 
                                                            const Reserved1: WideString; 
                                                            Reserved2: Integer) of object;
  TFhzWndOcxFhzWndVgPicEvent = procedure(ASender: TObject; const PicPath: WideString; 
                                                           const CaeeResOrgCode: WideString; 
                                                           PicTime: Integer; 
                                                           const Reserved1: WideString; 
                                                           Reserved2: Integer) of object;
  TFhzWndOcxFhzWndAbsPicEvent = procedure(ASender: TObject; const PicPath: WideString; 
                                                            const CaeeResOrgCode: WideString; 
                                                            PicTime: Integer; 
                                                            const Reserved1: WideString; 
                                                            Reserved2: Integer) of object;
  TFhzWndOcxFhzWndFcPicEvent = procedure(ASender: TObject; const PicPath: WideString; 
                                                           const CaeeResOrgCode: WideString; 
                                                           PicTime: Integer; 
                                                           const Reserved1: WideString; 
                                                           Reserved2: Integer) of object;

  TFhzWndOcx = class(TOleControl)
  private
    FOnFhzWndOnMouseEvent: TFhzWndOcxFhzWndOnMouseEvent;
    FOnFhzWndLoginEvent: TFhzWndOcxFhzWndLoginEvent;
    FOnFhzWndIvsPicEvent: TFhzWndOcxFhzWndIvsPicEvent;
    FOnFhzWndVgPicEvent: TFhzWndOcxFhzWndVgPicEvent;
    FOnFhzWndAbsPicEvent: TFhzWndOcxFhzWndAbsPicEvent;
    FOnFhzWndFcPicEvent: TFhzWndOcxFhzWndFcPicEvent;
    FIntf: _DFhzWndOcx;
    function  GetControlInterface: _DFhzWndOcx;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function FhzWndInitial: Integer;
    function FhzWndFlash: Integer;
    function FhzWndShowPicture(const path: WideString; reserse: Integer): Integer;
    function FhzWndFullScream(isFull: WordBool; reserve: Integer): Integer;
    function FhzWndDestroyWindow(hWnd: Integer; reserve: Integer): Integer;
    function FhzWndSetWinType(windowtype: Integer; resever: Integer): Integer;
    procedure AboutBox;
    function FhzWndLoadUrl(const url: WideString; const resevr: WideString; resevr1: Integer): Integer;
    function FhzWndGraspUrlMap(const DstPath: WideString; const resvr: WideString; 
                               const resvr1: WideString; resvr2: Integer; resvr3: Integer): Integer;
    property  ControlInterface: _DFhzWndOcx read GetControlInterface;
    property  DefaultInterface: _DFhzWndOcx read GetControlInterface;
  published
    property Anchors;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property OnFhzWndOnMouseEvent: TFhzWndOcxFhzWndOnMouseEvent read FOnFhzWndOnMouseEvent write FOnFhzWndOnMouseEvent;
    property OnFhzWndLoginEvent: TFhzWndOcxFhzWndLoginEvent read FOnFhzWndLoginEvent write FOnFhzWndLoginEvent;
    property OnFhzWndIvsPicEvent: TFhzWndOcxFhzWndIvsPicEvent read FOnFhzWndIvsPicEvent write FOnFhzWndIvsPicEvent;
    property OnFhzWndVgPicEvent: TFhzWndOcxFhzWndVgPicEvent read FOnFhzWndVgPicEvent write FOnFhzWndVgPicEvent;
    property OnFhzWndAbsPicEvent: TFhzWndOcxFhzWndAbsPicEvent read FOnFhzWndAbsPicEvent write FOnFhzWndAbsPicEvent;
    property OnFhzWndFcPicEvent: TFhzWndOcxFhzWndFcPicEvent read FOnFhzWndFcPicEvent write FOnFhzWndFcPicEvent;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses System.Win.ComObj;

procedure TFhzWndOcx.InitControlData;
const
  CEventDispIDs: array [0..5] of DWORD = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $00000006);
  CControlData: TControlData2 = (
    ClassID:      '{A6886767-12F1-4C24-B172-BB66DADFB457}';
    EventIID:     '{76AA552C-5E06-4D74-9B84-144DB69E16F0}';
    EventCount:   6;
    EventDispIDs: @CEventDispIDs;
    LicenseKey:   nil (*HR:$80004005*);
    Flags:        $00000000;
    Version:      500);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := UIntPtr(@@FOnFhzWndOnMouseEvent) - UIntPtr(Self);
end;

procedure TFhzWndOcx.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DFhzWndOcx;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TFhzWndOcx.GetControlInterface: _DFhzWndOcx;
begin
  CreateControl;
  Result := FIntf;
end;

function TFhzWndOcx.FhzWndInitial: Integer;
begin
  Result := DefaultInterface.FhzWndInitial;
end;

function TFhzWndOcx.FhzWndFlash: Integer;
begin
  Result := DefaultInterface.FhzWndFlash;
end;

function TFhzWndOcx.FhzWndShowPicture(const path: WideString; reserse: Integer): Integer;
begin
  Result := DefaultInterface.FhzWndShowPicture(path, reserse);
end;

function TFhzWndOcx.FhzWndFullScream(isFull: WordBool; reserve: Integer): Integer;
begin
  Result := DefaultInterface.FhzWndFullScream(isFull, reserve);
end;

function TFhzWndOcx.FhzWndDestroyWindow(hWnd: Integer; reserve: Integer): Integer;
begin
  Result := DefaultInterface.FhzWndDestroyWindow(hWnd, reserve);
end;

function TFhzWndOcx.FhzWndSetWinType(windowtype: Integer; resever: Integer): Integer;
begin
  Result := DefaultInterface.FhzWndSetWinType(windowtype, resever);
end;

procedure TFhzWndOcx.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

function TFhzWndOcx.FhzWndLoadUrl(const url: WideString; const resevr: WideString; resevr1: Integer): Integer;
begin
  Result := DefaultInterface.FhzWndLoadUrl(url, resevr, resevr1);
end;

function TFhzWndOcx.FhzWndGraspUrlMap(const DstPath: WideString; const resvr: WideString; 
                                      const resvr1: WideString; resvr2: Integer; resvr3: Integer): Integer;
begin
  Result := DefaultInterface.FhzWndGraspUrlMap(DstPath, resvr, resvr1, resvr2, resvr3);
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TFhzWndOcx]);
end;

end.
