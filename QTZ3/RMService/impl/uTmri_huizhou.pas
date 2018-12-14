unit uTmri_huizhou;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, Ehlservice, uLogger,
  uTmriType, uJKDefine;

type

  TTmri_huizhou = class
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

class function TTmri_huizhou.CallWebService(xtlb, jkid, yhbz, dwmc, dwjgdm,
  yhxm, zdbs, UTF8XmlDoc: string; write: boolean = false): string;
var
  WSResult: string;
  WSIServer: EHLServiceSoap;
begin
  result := '';
  WSIServer := GetEHLServiceSoap(true, JKDic[jkid].WSDL);
  try
    if write then
      WSResult := WSIServer.writeObjectOut(jkid, UTF8XmlDoc)
    else
      WSResult := WSIServer.queryObjectOut(jkid, JKDic[jkid].CJSQBH,
        UTF8XmlDoc);
    try
      WSResult := HTTPDecode(WSResult);
      logger.Trace('[TTmri.CallWebService]' + UTF8XmlDoc + #10#13 + WSResult);
    except
      on e: exception do
        logger.Trace('[CallWebService1]' + e.Message);
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
end;

class function TTmri_huizhou.Query(param: TTmriParam; JSON: string): string;
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

class function TTmri_huizhou.write(param: TTmriParam; JSON: string): string;
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
