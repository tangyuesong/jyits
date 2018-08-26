unit uRmWeb;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants, InvokeRegistry, Rio,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, RmOutAccessWeb, uLogger,
  uJKDefine;

type
  TRmWeb = class
  private
    class function CallWebService(xtlb, jkid, UTF8XmlDoc: string; write: boolean = false): string; static;
  public
    class function qvehbus(json: string): string; static;          //2.1.客运车辆信息核查接口
    class function qstation(json: string): string; static;         //2.2.交警执法站信息读取接口
    class function qstationrelation(json: string): string; static; //2.3.交警执法站关联卡口读取接口
    class function qstationperson(json: string): string; static;   //2.4.交警执法站关联警员信息读取接口

    class function feedback(json: string): string; static;         //3.11.预警反馈信息写入接口
    class function feedbackpic(json: string): string; static;      //3.12.拦截处置图片上传接口
    class function vehcheck(json: string): string; static;         //3.10.车辆检查台账写入接口
  end;

//var
//  RmwebXLH: string = '7A1E1D0D07070304091502010002090200060904020A178C81216D72692E636E';
//  RmwebWSDL: string = 'http://10.43.255.2:9080/rmweb/services/RmOutAccess?wsdl';

implementation

uses uXmlAndJSON;

{ TRmWeb }

class function TRmWeb.CallWebService(xtlb, jkid, UTF8XmlDoc: string; write: boolean): string;
var
  WSResult: string;
  WSIServer: RmJaxRpcOutAccess;
  Rio: THTTPRIO;
begin
  logger.Info(UTF8XmlDoc);
  result := '';
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

class function TRmWeb.qvehbus(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('qvehbus', json);
  result := CallWebService('63', '63Q01', xml);
end;

class function TRmWeb.qstation(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('qstation', json);
//  xml := UTF8Encode(xml);
  result := CallWebService('64', '64Q01', xml);
end;

class function TRmWeb.qstationrelation(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('qstationrelation', json);
  result := CallWebService('64', '64Q02', xml);
end;

class function TRmWeb.qstationperson(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('qstationperson', json);
  result := CallWebService('64', '64Q03', xml);
end;

class function TRmWeb.feedback(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('feedback', json);
  result := CallWebService('64', '64W02', xml, true);
end;

class function TRmWeb.feedbackpic(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('feedbackpic', json);
  result := CallWebService('64', '64W03', xml, true);
end;

class function TRmWeb.vehcheck(json: string): string;
var
  xml: string;
begin
  xml := TXmlAndJSON.JSON2XML('vehcheck', json);
  result := CallWebService('64', '64W01', xml, true);
end;

end.
