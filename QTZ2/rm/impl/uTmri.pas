unit uTmri;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, TmriOutNewAccess, uLogger,
  uTmriType, uJKDefine;

type

  TTmri = class
  private
    class function CallWebService(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs,
      UTF8XmlDoc: string; write: boolean = false): string; static;
  public
    class function write(param: TTmriParam; JSON: string): string; static;
    class function Query(param: TTmriParam; JSON: string): string; static;
  end;

const
  encoding = 'GBK';

implementation

uses uXmlAndJSON;

class function TTmri.CallWebService(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs,
  UTF8XmlDoc: string; write: boolean = false): string;
var
  WSResult: string;
  WSIServer: TmriJaxRpcOutNewAccess;
  Rio: THTTPRIO;
begin
  result := '';
  Rio := THTTPRIO.Create(nil);
  WSIServer := GetTmriJaxRpcOutNewAccess(true, JKDic[jkid].WSDL, Rio);
  try
    if write then
      WSResult := WSIServer.writeObjectOutNew(xtlb, JKDic[jkid].XLH, jkid,
        JKDic[jkid].CJSQBH, dwjgdm, dwmc, yhbz, yhxm, zdbs, UTF8XmlDoc)
    else
      WSResult := WSIServer.queryObjectOutNew(xtlb, JKDic[jkid].XLH, jkid,
        JKDic[jkid].CJSQBH, dwjgdm, dwmc, yhbz, yhxm, zdbs, UTF8XmlDoc);
    try
      WSResult := HTTPDecode(WSResult);
      logger.Trace('[TTmri.CallWebService]' + UTF8XmlDoc + #10#13 + WSResult);
    except
      on e: exception do
        logger.Error('[CallWebService1]' + e.Message);
    end;
    try
      result := TXmlAndJSON.XML2JSON(WSResult);
    except
      on e: exception do
        logger.Error('[CallWebService2]' + e.Message + ' ' + WSResult + ' ' +
          UTF8XmlDoc);
    end;

  except
    on e: exception do
      logger.Error('[CallWebService]' + e.Message);
  end;
  Rio := nil;
end;

class function TTmri.Query(param: TTmriParam; JSON: string): string;
var
  xml: string;
begin
  if JKDic.ContainsKey(param.jkid) then
  begin
    xml := TXmlAndJSON.JSON2XML(JKDic[param.jkid].JDID, JSON, encoding);
    result := CallWebService(Copy(param.jkid, 1, 2), param.jkid, param.yhbz,
      param.dwmc, param.dwjgdm, param.yhxm, param.zdbs, xml, false);
  end
  else
  begin
    logger.Warn('JKID is not Exists!' + param.jkid);
    result := '';
  end;
end;

class function TTmri.write(param: TTmriParam; JSON: string): string;
var
  xml: string;
begin
  if JKDic.ContainsKey(param.jkid) then
  begin
    xml := TXmlAndJSON.JSON2XML(JKDic[param.jkid].JDID, JSON, encoding);
    result := CallWebService(Copy(param.jkid, 1, 2), param.jkid, param.yhbz,
      param.dwmc, param.dwjgdm, param.yhxm, param.zdbs, xml, true);
  end
  else
  begin
    logger.Warn('JKID is not Exists!' + param.jkid);
    result := '';
  end;
end;

end.
