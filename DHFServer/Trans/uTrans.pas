unit uTrans;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants, InvokeRegistry, Rio,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, Trans1;

type
  TTrans = class
  public
    class function WriteVehicleInfo(kkbh, fxlx: string; cdh: Int64; hphm, hpzl,
      gcsj: string; clsd, clxs: Int64; wfdm: string; cwkc: Int64; hpys, cllx,
      fzhpzl, fzhphm, fzhpys, clpp, clwx, csys, tplj, tp1, tp2, tp3,
      tztp: string): Int64; static;
  end;

var
  TransXLH: string = '7A1E1D0D070703050C15020100020902000608070301178C812E2972692E636E';
  TransWSDL: string = 'http://10.43.255.204:9080/rminf/services/Trans?wsdl';

implementation

uses uGlobal;

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
  WSIServer := Trans1.GetTrans(true, TransWSDL, Rio);

  info := '<info><jkid>62C01</jkid><jkxlh>' + TransXLH + '</jkxlh></info>';
  try
    result := WSIServer.InitTrans(kkbh, fxlx, cdh, info);
    if result > 0  then
    begin
      result := WSIServer.WriteVehicleInfo(kkbh,fxlx,cdh,hphm,hpzl,gcsj,clsd,
        clxs,wfdm,cwkc,hpys,cllx,fzhpzl,fzhphm,fzhpys,clpp,clwx,csys,tplj,
        tp1,tp2,tp3,tztp);
      if result <= 0 then
        logger.Warn('WriteVehicleInfo[' + kkbh+']: ' + result.ToString());
    end
    else begin
      if not gUnknowDevice.ContainsKey(kkbh + fxlx + cdh.ToString) then
      begin
        gUnknowDevice.Add(kkbh + fxlx + cdh.ToString, true);
        logger.Warn(Format('WSIServer.InitTrans failed:%d(KKBH:%s FXLX:%s CDH:%d)', [result,kkbh,fxlx,cdh]));
      end;
    end;
  except
    on e: exception do
      logger.Error('WriteVehicleInfo' + e.Message);
  end;
  Rio := nil;
end;

end.
