unit uTmri;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants, TmriOutAccess1,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, TmriOutNewAccess, uLogger,
  uJKDefine;

type

  TTmriParam = record
    jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs: string;
  end;

  TTmri = class
  private
    class function CallWebService(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc: string; write: boolean = false): string; static;
    class function CallWebService1(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc: string; write: boolean): string; static;
    class function CallWebService0(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc: string; write: boolean): string; static;
  public
    class function Write(param: TTmriParam; json: string): string; static;
    class function Query(param: TTmriParam; json: string): string; static;
  end;

const
  encoding = 'GBK';
implementation

uses uXmlAndJSON;

class function TTmri.CallWebService(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs,
  UTF8XmlDoc: string; write: boolean): string;
begin
  result := '';
  JKCounterDic[jkid] := JKCounterDic[jkid] + 1;
  if JKCounterDic[jkid] > JKDic[jkid].NumPerDay then
  begin
    logger.Warn('OutOfCounter');
    exit;
  end;
  if JKDic[jkid].Flag = 1 then
    result := CallWebService1(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc, write)
  else
    result := CallWebService0(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc, write);
end;

class function TTmri.CallWebService0(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc: string; write: boolean): string;
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
      WSResult := WSIServer.writeObjectOut(xtlb, JKDic[jkid].XLH, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc)
    else
      WSResult := WSIServer.queryObjectOut(xtlb, JKDic[jkid].XLH, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc);
    try
      WSResult := HTTPDecode(WSResult);
    except
      on e: exception do
        logger.Error('[CallWebService1]' + e.Message + ' ' + wsresult);
    end;
    try
      result := TXmlAndJSON.XML2JSON(WSResult);
    except
      on e: exception do
        logger.Error('[CallWebService2]' + e.Message + ' ' + wsresult);
    end;

  except
    on e: exception do
      logger.Error('[CallWebService]' + e.Message);
  end;
  Rio := nil;
end;

class function TTmri.CallWebService1(xtlb, jkid, yhbz, dwmc, dwjgdm, yhxm, zdbs, UTF8XmlDoc: string; write: boolean): string;
var
  WSResult: string;
  WSIServer: TmriOutAccess;
  Rio: THTTPRIO;
begin
  result := '';
  Rio := THTTPRIO.Create(nil);
  WSIServer := GetTmriOutAccess(true, JKDic[jkid].WSDL, Rio);
  try
    if write then
      WSResult := WSIServer.writeObjectOut(xtlb, JKDic[jkid].XLH, jkid, UTF8XmlDoc)
    else
      WSResult := WSIServer.queryObjectOut(xtlb, JKDic[jkid].XLH, jkid, UTF8XmlDoc);
    try
      WSResult := HTTPDecode(WSResult);
    except
      on e: exception do
        logger.Error('[CallWebService11]' + e.Message + ' ' + wsresult);
    end;
    try
      result := TXmlAndJSON.XML2JSON(WSResult);
    except
      on e: exception do
        logger.Error('[CallWebService12]' + e.Message + ' ' + wsresult);
    end;

  except
    on e: exception do
      logger.Error('[CallWebService1]' + e.Message);
  end;
  Rio := nil;
end;

class function TTmri.Query(param: TTmriParam; json: string): string;
var
  xml: string;
begin
  if JKDic.ContainsKey(param.jkid) then
  begin
    xml := TXmlAndJson.JSON2XML(JKDic[param.jkid].JDID, json, encoding);
    result := CallWebService(Copy(param.jkid, 1, 2), param.jkid, param.yhbz,
      param.dwmc, param.dwjgdm, param.yhxm, param.zdbs, xml, false);
  end
  else
    result := '';
end;

class function TTmri.Write(param: TTmriParam; json: string): string;
var
  xml: string;
begin
  if JKDic.ContainsKey(param.jkid) then
  begin
    xml := TXmlAndJson.JSON2XML(JKDic[param.jkid].JDID, json, encoding);
    result := CallWebService(Copy(param.jkid, 1, 2), param.jkid, param.yhbz,
      param.dwmc, param.dwjgdm, param.yhxm, param.zdbs, xml, true);
  end
  else
    result := '';
end;

end.
