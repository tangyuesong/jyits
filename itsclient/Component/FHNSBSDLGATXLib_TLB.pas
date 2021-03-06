unit FHNSBSDLGATXLib_TLB;

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
// File generated on 2017/6/4 10:00:54 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Program Files (x86)\Eyeshot6000BSOCX\FhnSBSDlgAtx.ocx (1)
// LIBID: {9B97CFDA-AD9B-4714-A0EB-501223F95BB4}
// LCID: 0
// Helpfile: C:\Program Files (x86)\Eyeshot6000BSOCX\FhnSBSDlgAtx.hlp 
// HelpString: FhnSBSDlgAtx ActiveX Control module
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
  FHNSBSDLGATXLibMajorVersion = 1;
  FHNSBSDLGATXLibMinorVersion = 0;

  LIBID_FHNSBSDLGATXLib: TGUID = '{9B97CFDA-AD9B-4714-A0EB-501223F95BB4}';

  DIID__DFhnSBSDlgAtx: TGUID = '{125924AB-B272-4134-BEC8-519F43806BA6}';
  DIID__DFhnSBSDlgAtxEvents: TGUID = '{A2E830DB-9068-4053-A782-0936F187F066}';
  CLASS_FhnSBSDlgAtx: TGUID = '{2F06B84B-AF96-46C6-A900-E4AE5526ADED}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DFhnSBSDlgAtx = dispinterface;
  _DFhnSBSDlgAtxEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  FhnSBSDlgAtx = _DFhnSBSDlgAtx;


// *********************************************************************//
// DispIntf:  _DFhnSBSDlgAtx
// Flags:     (4112) Hidden Dispatchable
// GUID:      {125924AB-B272-4134-BEC8-519F43806BA6}
// *********************************************************************//
  _DFhnSBSDlgAtx = dispinterface
    ['{125924AB-B272-4134-BEC8-519F43806BA6}']
    function FhnSBSGetMyPath(const reseve1: WideString; reseve2: Integer): WideString; dispid 1;
    function FHNSBSOPENFILE(const path: WideString; resever: Integer): Integer; dispid 2;
    function FHNSBSFINDFILE(const path: WideString; resever: Integer): Integer; dispid 3;
    function FHNSBSCreateDirectory(const spath: WideString; resever: Integer): Integer; dispid 4;
    function FHNSBSDeleteDirectory(const spath: WideString; resever: Integer): Integer; dispid 5;
    function FHNSBSGetDataFormPath(const path: WideString): WideString; dispid 6;
    function FHNSBSWriteFile(const path: WideString; const filename: WideString; 
                             const data: WideString; resever: Integer): Integer; dispid 7;
    function FHNSBSReadFile(const filepath: WideString; resever: Integer): WideString; dispid 8;
    function FhnSBSReadText(const path: WideString; const Reserved1: WideString; Reserved2: Integer): Integer; dispid 9;
  end;

// *********************************************************************//
// DispIntf:  _DFhnSBSDlgAtxEvents
// Flags:     (4096) Dispatchable
// GUID:      {A2E830DB-9068-4053-A782-0936F187F066}
// *********************************************************************//
  _DFhnSBSDlgAtxEvents = dispinterface
    ['{A2E830DB-9068-4053-A782-0936F187F066}']
  end;

implementation

uses System.Win.ComObj;

end.
