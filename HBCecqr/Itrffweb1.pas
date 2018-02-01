// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://10.43.255.10:8080/wsdl/Itrffweb
//  >Import : http://10.43.255.10:8080/wsdl/Itrffweb>0
// Version  : 1.0
// (2016/2/1 9:35:37 - - $Rev: 76228 $)
// ************************************************************************ //

unit Itrffweb1;

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
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  TVoVehInfo           = class;                 { "urn:trffwebIntf"[GblCplx] }
  TVoDrvInfo           = class;                 { "urn:trffwebIntf"[GblCplx] }
  TVoVioPicInfo        = class;                 { "urn:trffwebIntf"[GblCplx] }
  TVoViotxtInfo        = class;                 { "urn:trffwebIntf"[GblCplx] }



  // ************************************************************************ //
  // XML       : TVoVehInfo, global, <complexType>
  // Namespace : urn:trffwebIntf
  // ************************************************************************ //
  TVoVehInfo = class(TRemotable)
  private
    Fzt: string;
    Fsf: string;
    Fhphm: string;
    Fhpzl: string;
    Fclpp1: string;
    Fclxh: string;
    Fclpp2: string;
    Fgcjk: string;
    Fzzg: string;
    Fzzcmc: string;
    Fclsbdh: string;
    Ffdjh: string;
    Fcllx: string;
    Fcsys: string;
    Fsyxz: string;
    Fsfzmhm: string;
    Fsyr: string;
    Fsyq: string;
    Fccdjrq: string;
    Fyxqz: string;
    Fqzbfqz: string;
    Ffzjg: string;
    Fglbm: string;
    Ffprq: string;
    Ffzrq: string;
    Ffdjrq: string;
    Ffhgzrq: string;
    Fbxzzrq: string;
    Fbpcs: string;
    Fbzcs: string;
    Fbdjcs: string;
    Fxzqh: string;
    Fqpzk: string;
    Fhpzk: string;
    Fhbdbqk: string;
    Fccrq: string;
    Fzsxzqh: string;
    Fzsxxdz: string;
    Fyzbm1: string;
    Flxdh: string;
    Fzzz: string;
    Fzzxzqh: string;
    Fzzxxdz: string;
    Fyzbm2: string;
    Fsqdm: string;
    Fclyt: string;
    Fytsx: string;
    Fdzyx: string;
    Fxszbh: string;
    Fsjhm: string;
    Fjyhgbzbh: string;
    Fbz: string;
    Fgxrq: string;
  published
    property zt:       string  read Fzt write Fzt;
    property sf:       string  read Fsf write Fsf;
    property hphm:     string  read Fhphm write Fhphm;
    property hpzl:     string  read Fhpzl write Fhpzl;
    property clpp1:    string  read Fclpp1 write Fclpp1;
    property clxh:     string  read Fclxh write Fclxh;
    property clpp2:    string  read Fclpp2 write Fclpp2;
    property gcjk:     string  read Fgcjk write Fgcjk;
    property zzg:      string  read Fzzg write Fzzg;
    property zzcmc:    string  read Fzzcmc write Fzzcmc;
    property clsbdh:   string  read Fclsbdh write Fclsbdh;
    property fdjh:     string  read Ffdjh write Ffdjh;
    property cllx:     string  read Fcllx write Fcllx;
    property csys:     string  read Fcsys write Fcsys;
    property syxz:     string  read Fsyxz write Fsyxz;
    property sfzmhm:   string  read Fsfzmhm write Fsfzmhm;
    property syr:      string  read Fsyr write Fsyr;
    property syq:      string  read Fsyq write Fsyq;
    property ccdjrq:   string  read Fccdjrq write Fccdjrq;
    property yxqz:     string  read Fyxqz write Fyxqz;
    property qzbfqz:   string  read Fqzbfqz write Fqzbfqz;
    property fzjg:     string  read Ffzjg write Ffzjg;
    property glbm:     string  read Fglbm write Fglbm;
    property fprq:     string  read Ffprq write Ffprq;
    property fzrq:     string  read Ffzrq write Ffzrq;
    property fdjrq:    string  read Ffdjrq write Ffdjrq;
    property fhgzrq:   string  read Ffhgzrq write Ffhgzrq;
    property bxzzrq:   string  read Fbxzzrq write Fbxzzrq;
    property bpcs:     string  read Fbpcs write Fbpcs;
    property bzcs:     string  read Fbzcs write Fbzcs;
    property bdjcs:    string  read Fbdjcs write Fbdjcs;
    property xzqh:     string  read Fxzqh write Fxzqh;
    property qpzk:     string  read Fqpzk write Fqpzk;
    property hpzk:     string  read Fhpzk write Fhpzk;
    property hbdbqk:   string  read Fhbdbqk write Fhbdbqk;
    property ccrq:     string  read Fccrq write Fccrq;
    property zsxzqh:   string  read Fzsxzqh write Fzsxzqh;
    property zsxxdz:   string  read Fzsxxdz write Fzsxxdz;
    property yzbm1:    string  read Fyzbm1 write Fyzbm1;
    property lxdh:     string  read Flxdh write Flxdh;
    property zzz:      string  read Fzzz write Fzzz;
    property zzxzqh:   string  read Fzzxzqh write Fzzxzqh;
    property zzxxdz:   string  read Fzzxxdz write Fzzxxdz;
    property yzbm2:    string  read Fyzbm2 write Fyzbm2;
    property sqdm:     string  read Fsqdm write Fsqdm;
    property clyt:     string  read Fclyt write Fclyt;
    property ytsx:     string  read Fytsx write Fytsx;
    property dzyx:     string  read Fdzyx write Fdzyx;
    property xszbh:    string  read Fxszbh write Fxszbh;
    property sjhm:     string  read Fsjhm write Fsjhm;
    property jyhgbzbh: string  read Fjyhgbzbh write Fjyhgbzbh;
    property bz:       string  read Fbz write Fbz;
    property gxrq:     string  read Fgxrq write Fgxrq;
  end;



  // ************************************************************************ //
  // XML       : TVoDrvInfo, global, <complexType>
  // Namespace : urn:trffwebIntf
  // ************************************************************************ //
  TVoDrvInfo = class(TRemotable)
  private
    Fsfzmmc: string;
    Fsfzmhm: string;
    Fhmcd: string;
    Fxm: string;
    Fxb: string;
    Fcsrq: string;
    Fgj: string;
    Fdjzsxzqh: string;
    Fdjzsxxdz: string;
    Flxzsxzqh: string;
    Flxzsxxdz: string;
    Flxzsyzbm: string;
    Flxdh: string;
    Fzzzm: string;
    Fzjcx: string;
    Fgxsj: string;
    Ffzjg: string;
    Fcclzrq: string;
    Fyxqz: string;
    Fsjhm: string;
  published
    property sfzmmc:   string  read Fsfzmmc write Fsfzmmc;
    property sfzmhm:   string  read Fsfzmhm write Fsfzmhm;
    property hmcd:     string  read Fhmcd write Fhmcd;
    property xm:       string  read Fxm write Fxm;
    property xb:       string  read Fxb write Fxb;
    property csrq:     string  read Fcsrq write Fcsrq;
    property gj:       string  read Fgj write Fgj;
    property djzsxzqh: string  read Fdjzsxzqh write Fdjzsxzqh;
    property djzsxxdz: string  read Fdjzsxxdz write Fdjzsxxdz;
    property lxzsxzqh: string  read Flxzsxzqh write Flxzsxzqh;
    property lxzsxxdz: string  read Flxzsxxdz write Flxzsxxdz;
    property lxzsyzbm: string  read Flxzsyzbm write Flxzsyzbm;
    property lxdh:     string  read Flxdh write Flxdh;
    property zzzm:     string  read Fzzzm write Fzzzm;
    property zjcx:     string  read Fzjcx write Fzjcx;
    property gxsj:     string  read Fgxsj write Fgxsj;
    property fzjg:     string  read Ffzjg write Ffzjg;
    property cclzrq:   string  read Fcclzrq write Fcclzrq;
    property yxqz:     string  read Fyxqz write Fyxqz;
    property sjhm:     string  read Fsjhm write Fsjhm;
  end;



  // ************************************************************************ //
  // XML       : TVoVioPicInfo, global, <complexType>
  // Namespace : urn:trffwebIntf
  // ************************************************************************ //
  TVoVioPicInfo = class(TRemotable)
  private
    Fxh: string;
    Fhpzl: string;
    Fhphm: string;
    Flrsj: string;
    Fjllx: string;
    Fzpstr1: string;
    Fzpstr2: string;
    Fzpstr3: string;
  published
    property xh:     string  read Fxh write Fxh;
    property hpzl:   string  read Fhpzl write Fhpzl;
    property hphm:   string  read Fhphm write Fhphm;
    property lrsj:   string  read Flrsj write Flrsj;
    property jllx:   string  read Fjllx write Fjllx;
    property zpstr1: string  read Fzpstr1 write Fzpstr1;
    property zpstr2: string  read Fzpstr2 write Fzpstr2;
    property zpstr3: string  read Fzpstr3 write Fzpstr3;
  end;



  // ************************************************************************ //
  // XML       : TVoViotxtInfo, global, <complexType>
  // Namespace : urn:trffwebIntf
  // ************************************************************************ //
  TVoViotxtInfo = class(TRemotable)
  private
    Fxh: string;
    Fcjjg: string;
    Fcjjgmc: string;
    Fclfl: string;
    Fhpzl: string;
    Fhphm: string;
    Fjdcsyr: string;
    Fsyxz: string;
    Ffdjh: string;
    Fclsbdh: string;
    Fcsys: string;
    Fclpp: string;
    Fjtfs: string;
    Ffzjg: string;
    Fzsxzqh: string;
    Fzsxxdz: string;
    Fdh: string;
    Flxfs: string;
    Ftzsh: string;
    Ftzbj: string;
    Ftzrq: string;
    Fcjfs: string;
    Fwfsj: string;
    Fwfdd: string;
    Fwfdz: string;
    Fwfxw: string;
    Ffkje: string;
    Fscz: string;
    Fbzz: string;
    Fzqmj: string;
    Fcljg: string;
    Fcljgmc: string;
    Fclsj: string;
    Fclbj: string;
    Fjkfs: string;
    Fjkbj: string;
    Fjkrq: string;
    Fpzbh: string;
    Fwfbh: string;
    Fjdsbh: string;
    Fwsjyw: string;
    Fjdslb: string;
    Fdsr: string;
    Fjbr: string;
    Flrr: string;
    Flrsj: string;
    Fjllx: string;
    Fcldxbj: string;
    Fxrms: string;
    Fjsjg: string;
    Ffsjg: string;
    Fgxsj: string;
    Fbz: string;
  published
    property xh:     string  read Fxh write Fxh;
    property cjjg:   string  read Fcjjg write Fcjjg;
    property cjjgmc: string  read Fcjjgmc write Fcjjgmc;
    property clfl:   string  read Fclfl write Fclfl;
    property hpzl:   string  read Fhpzl write Fhpzl;
    property hphm:   string  read Fhphm write Fhphm;
    property jdcsyr: string  read Fjdcsyr write Fjdcsyr;
    property syxz:   string  read Fsyxz write Fsyxz;
    property fdjh:   string  read Ffdjh write Ffdjh;
    property clsbdh: string  read Fclsbdh write Fclsbdh;
    property csys:   string  read Fcsys write Fcsys;
    property clpp:   string  read Fclpp write Fclpp;
    property jtfs:   string  read Fjtfs write Fjtfs;
    property fzjg:   string  read Ffzjg write Ffzjg;
    property zsxzqh: string  read Fzsxzqh write Fzsxzqh;
    property zsxxdz: string  read Fzsxxdz write Fzsxxdz;
    property dh:     string  read Fdh write Fdh;
    property lxfs:   string  read Flxfs write Flxfs;
    property tzsh:   string  read Ftzsh write Ftzsh;
    property tzbj:   string  read Ftzbj write Ftzbj;
    property tzrq:   string  read Ftzrq write Ftzrq;
    property cjfs:   string  read Fcjfs write Fcjfs;
    property wfsj:   string  read Fwfsj write Fwfsj;
    property wfdd:   string  read Fwfdd write Fwfdd;
    property wfdz:   string  read Fwfdz write Fwfdz;
    property wfxw:   string  read Fwfxw write Fwfxw;
    property fkje:   string  read Ffkje write Ffkje;
    property scz:    string  read Fscz write Fscz;
    property bzz:    string  read Fbzz write Fbzz;
    property zqmj:   string  read Fzqmj write Fzqmj;
    property cljg:   string  read Fcljg write Fcljg;
    property cljgmc: string  read Fcljgmc write Fcljgmc;
    property clsj:   string  read Fclsj write Fclsj;
    property clbj:   string  read Fclbj write Fclbj;
    property jkfs:   string  read Fjkfs write Fjkfs;
    property jkbj:   string  read Fjkbj write Fjkbj;
    property jkrq:   string  read Fjkrq write Fjkrq;
    property pzbh:   string  read Fpzbh write Fpzbh;
    property wfbh:   string  read Fwfbh write Fwfbh;
    property jdsbh:  string  read Fjdsbh write Fjdsbh;
    property wsjyw:  string  read Fwsjyw write Fwsjyw;
    property jdslb:  string  read Fjdslb write Fjdslb;
    property dsr:    string  read Fdsr write Fdsr;
    property jbr:    string  read Fjbr write Fjbr;
    property lrr:    string  read Flrr write Flrr;
    property lrsj:   string  read Flrsj write Flrsj;
    property jllx:   string  read Fjllx write Fjllx;
    property cldxbj: string  read Fcldxbj write Fcldxbj;
    property xrms:   string  read Fxrms write Fxrms;
    property jsjg:   string  read Fjsjg write Fjsjg;
    property fsjg:   string  read Ffsjg write Ffsjg;
    property gxsj:   string  read Fgxsj write Fgxsj;
    property bz:     string  read Fbz write Fbz;
  end;


  // ************************************************************************ //
  // Namespace : urn:trffwebIntf-Itrffweb
  // soapAction: urn:trffwebIntf-Itrffweb#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : Itrffwebbinding
  // service   : Itrffwebservice
  // port      : ItrffwebPort
  // URL       : http://10.43.255.10:8080/soap/Itrffweb
  // ************************************************************************ //
  Itrffweb = interface(IInvokable)
  ['{BE44AFDE-2105-5246-04A5-757D2F27D67D}']
    function  GetVehInfo(const Sf: string; const hphm: string; const hpzl: string): TVoVehInfo; stdcall;
    function  GetDrvInfo(const sfzhm: string): TVoDrvInfo; stdcall;
    function  GetVioTxtInfo(const xh: string): TVoViotxtInfo; stdcall;
    function  GetvioPicinfo(const xh: string): TVoVioPicInfo; stdcall;
    function  GetVioxml(const hphm: string; const hpzl: string): string; stdcall;
  end;

function GetItrffweb(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Itrffweb;


implementation
  uses System.SysUtils;

function GetItrffweb(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Itrffweb;
const
  defWSDL = 'http://10.43.255.10:8080/wsdl/Itrffweb';
  defURL  = 'http://10.43.255.10:8080/soap/Itrffweb';
  defSvc  = 'Itrffwebservice';
  defPrt  = 'ItrffwebPort';
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
    Result := (RIO as Itrffweb);
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
  { Itrffweb }
  InvRegistry.RegisterInterface(TypeInfo(Itrffweb), 'urn:trffwebIntf-Itrffweb', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Itrffweb), 'urn:trffwebIntf-Itrffweb#%operationName%');
  RemClassRegistry.RegisterXSClass(TVoVehInfo, 'urn:trffwebIntf', 'TVoVehInfo');
  RemClassRegistry.RegisterXSClass(TVoDrvInfo, 'urn:trffwebIntf', 'TVoDrvInfo');
  RemClassRegistry.RegisterXSClass(TVoVioPicInfo, 'urn:trffwebIntf', 'TVoVioPicInfo');
  RemClassRegistry.RegisterXSClass(TVoViotxtInfo, 'urn:trffwebIntf', 'TVoViotxtInfo');

end.