unit uTrans;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants, InvokeRegistry, Rio,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, Trans1, uLogger, uJKDefine;

type
  TTrans = class
  public
    class function WriteVehicleInfo(kkbh, fxlx: string; cdh: Int64; hphm, hpzl,
      gcsj: string; clsd, clxs: Int64; wfdm: string; cwkc: Int64; hpys, cllx,
      fzhpzl, fzhphm, fzhpys, clpp, clwx, csys, tplj, tp1, tp2, tp3,
      tztp: string): Int64; static;
  end;

//var
//  TransXLH: string = '7A1E1D0D070703050C15020100020902000608070301178C812E2972692E636E';
//  TransWSDL: string = 'http://10.43.255.204:9080/rminf/services/Trans?wsdl';

implementation

uses uXmlAndJSON;

{ TTrans }

class function TTrans.WriteVehicleInfo(
  kkbh: string;
  fxlx: string;
  cdh: Int64;
  hphm: string;
  hpzl: string;
  gcsj: string;
  clsd: Int64;
  clxs: Int64;
  wfdm: string;
  cwkc: Int64;
  hpys: string;
  cllx: string;
  fzhpzl: string;
  fzhphm: string;
  fzhpys: string;
  clpp: string;
  clwx: string;
  csys: string;
  tplj: string;
  tp1: string;
  tp2: string;
  tp3: string;
  tztp: string): Int64;
var
  WSIServer: Trans;
  Rio: THTTPRIO;
  info: string;
begin
  result := 0;
  Rio := THTTPRIO.Create(nil);
  WSIServer := Trans1.GetTrans(true, JKDic['62C01'].WSDL, Rio);

  info := '<info><jkid>62C01</jkid><jkxlh>' + JKDic['62C01'].XLH + '</jkxlh></info>';
  try
    result := WSIServer.InitTrans(kkbh, fxlx, cdh, info);
    if result > 0  then
      result := WSIServer.WriteVehicleInfo(kkbh,fxlx,cdh,hphm,hpzl,gcsj,clsd,
        clxs,wfdm,cwkc,hpys,cllx,fzhpzl,fzhphm,fzhpys,clpp,clwx,csys,tplj,
        tp1,tp2,tp3,tztp)
    else
      logger.Warn(Format('WSIServer.InitTrans failed:%d(KKBH:%s FXLX:%s CDH:%d)', [result,kkbh,fxlx,cdh]));
  except
    on e: exception do
      logger.Error('WriteVehicleInfo' + e.Message);
  end;
  Rio := nil;
end;

end.
