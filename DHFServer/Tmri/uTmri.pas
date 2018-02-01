unit uTmri;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants, InvokeRegistry, Rio,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, TmriOutAccess;

type
  TTmri = class
  private
    class function CallWebService(xtlb, jkid, UTF8XmlDoc: string): string; static;
    class function Q01C49(sf, hphm, hpzl: string): string; static;
    class function Q01C21(hphm, hpzl, dabh: string): string; static;
  public
    class function GetVehInfo(hphm, hpzl, dabh: string): string; // 读取机动基本信息
  end;

var
  TmriXLH: string = '781A09090302170408158180E6EFF3E285D1EEE78C97E5B4F9A8AD9FA69BAEDD';
  TmriWSDL: string = 'http://10.40.30.152/trffweb/services/TmriOutAccess?wsdl';

implementation

uses uGlobal;

class function TTmri.CallWebService(xtlb, jkid, UTF8XmlDoc: string): string;
var
  WSIServer: TmriJaxRpcOutAccess;
  Rio: THTTPRIO;
begin
  result := '';
  Rio := THTTPRIO.Create(nil);
  WSIServer := GetTmriJaxRpcOutAccess(true, TmriWSDL, Rio);
  try
    result := WSIServer.queryObjectOut(xtlb, TmriXLH, jkid, UTF8XmlDoc);
    //result := HTTPDecode(result);
  except
    on e: exception do
      logger.Error('[CallWebService]' + e.Message);
  end;
  Rio := nil;
end;

//2.3.1.1.读取机动车基本信息
class function TTmri.GetVehInfo(hphm, hpzl, dabh: string): string;
var
  sf: string;
begin
  sf := copy(hphm, 1, 1);
  if sf = '粤' then
    result := Q01C21(copy(hphm, 2, 100), hpzl, dabh)
  else
    result := Q01C49(sf, copy(hphm, 2, 100), hpzl);
end;

class function TTmri.Q01C21(hphm, hpzl, dabh: string): string;
var
  xml: string;
begin
  result := '';
  xml := '<?xml version="1.0" encoding="GBK"?><root><QueryCondition>';
  if hphm <> '' then
  begin
    xml := xml + '<hpzl>' + httpencode(utf8encode(hpzl)) + '</hpzl>';
    xml := xml + '<hphm>' + httpencode(utf8encode(hphm)) + '</hphm>';
  end
  else if dabh <> '' then
    xml := xml + '<dabh>' + httpencode(utf8encode(dabh)) + '</dabh>'
  else
    exit;
  xml := xml + '</QueryCondition></root>';
  result := CallWebService('01', '01C21', xml);
end;

//2.3.1.13.读取机动车简项信息(全国)
class function TTmri.Q01C49(sf, hphm, hpzl: string): string;
var
  xml: string;
begin
  xml := '<?xml version="1.0" encoding="GBK"?><root><QueryCondition>'
      + '<sf>' + httpencode(utf8encode(sf)) + '</sf>'
      + '<hpzl>' + httpencode(utf8encode(hpzl)) + '</hpzl>'
      + '<hphm>' + httpencode(utf8encode(hphm)) + '</hphm>'
      + '</QueryCondition></root>';
  result := CallWebService('01', '01C49', xml);
end;

end.
