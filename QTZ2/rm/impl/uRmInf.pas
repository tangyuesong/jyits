unit uRmInf;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants, InvokeRegistry, Rio,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, RmOutAccessInf, uLogger,
  uJKDefine;

type
  TRmInf = class
  private
    class function CallWebService(xtlb, jkid, UTF8XmlDoc: string; write: boolean = true): string; static;
  public
    class function surscreen(json: string): string; static;        //3.1.现场违法待筛选写入接口
    class function surexamine(json: string): string; static;       //3.2.非现场违法待审核写入接口
    class function flowequip(json: string): string; static;        //3.3.交通流量信息写入接口
    class function weather(json: string): string; static;          //3.4.交通气象信息写入接口
    class function incident(json: string): string; static;         //3.5.交通事件信息写入接口
    class function inducement(json: string): string; static;       //3.6.交通诱导发布信息写入接口
    class function car(json: string): string; static;              //3.7.警车定位信息写入接口
    class function police(json: string): string; static;           //3.8.单警定位信息接入接口
    class function park(json: string): string; static;             //3.9.停车场车辆信息写入接口
  end;

//var
//  RminfXLH: string = '7A1E1D0D07070304091502010002090200060904020A178C81216D72692E636E';
//  RminfWSDL: string = 'http://10.43.255.204:9080/rminf/services/RmOutAccess?wsdl';

implementation

uses uXmlAndJSON;

{ TRmInf }

class function TRmInf.CallWebService(xtlb, jkid, UTF8XmlDoc: string; write: boolean): string;
var
  WSResult: string;
  WSIServer: RmJaxRpcOutAccess;
  Rio: THTTPRIO;
begin
  result := '';
  JKCounterDic[jkid] := JKCounterDic[jkid] + 1;
  if JKCounterDic[jkid] > JKDic[jkid].NumPerDay then
  begin
    logger.Warn('OutOfCounter');
    exit;
  end;
  Rio := THTTPRIO.Create(nil);
  WSIServer := GetRmJaxRpcOutAccess(true, JKDic[jkid].WSDL, Rio);
  try
    if write then
      WSResult := WSIServer.writeObjectOut(xtlb, JKDic[jkid].XLH, jkid, UTF8XmlDoc)
    else
      WSResult := WSIServer.queryObjectOut(xtlb, JKDic[jkid].XLH, jkid, UTF8XmlDoc);
    WSResult := HTTPDecode(WSResult);
    result := TXmlAndJSON.XML2JSON(WSResult);
  except
    on e: exception do
      logger.Error('[CallWebService]' + e.Message);
  end;
  Rio := nil;
end;

class function TRmInf.surscreen(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('surscreen', json);
  result := CallWebService('60', '60W01', xml);
end;

class function TRmInf.surexamine(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('surexamine', json);
  result := CallWebService('60', '60W02', xml);
end;

class function TRmInf.flowequip(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('flowequip', json);
  result := CallWebService('68', '68W01', xml);
end;

class function TRmInf.weather(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('weather', json);
  result := CallWebService('68', '68W02', xml);
end;

class function TRmInf.incident(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('incident', json);
  result := CallWebService('68', '68W03', xml);
end;

class function TRmInf.inducement(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('inducement', json);
  result := CallWebService('68', '68W04', xml);
end;

class function TRmInf.car(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('car', json);
  result := CallWebService('68', '68W05', xml);
end;

class function TRmInf.police(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('police', json);
  result := CallWebService('68', '68W06', xml);
end;

class function TRmInf.park(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('park', json);
  result := CallWebService('68', '68W07', xml);
end;

end.
