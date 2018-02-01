unit uXmlAndJSON;

interface

uses
  Windows, Dialogs, System.Classes, SysUtils, Variants, InvokeRegistry, Rio,
  SOAPHTTPClient, Httpapp, IdGlobal, IdHTTP, Provider, WinSock2, System.JSON,
  XMLDoc, XMLIntf, msxml, msxmldom, xmldom, forms, RmOutAccessWeb, ulogger;

type
  TXmlAndJSON = class
  private
    class function ReadXml(node: IXMLNode): string; static;
  public
    class function XML2JSON(xml: string): string; static;
    class function JSON2XML(fun, JSON: string; encoding: string = 'UTF-8')
      : string; static;
  end;

implementation

class function TXmlAndJSON.JSON2XML(fun, JSON: string;
  encoding: string): string;
var
  xml: TXMLDocument;
  pair, key, value: string;
  jo: TJSONObject;
  i, p: integer;
begin
  jo := TJSONObject.ParseJSONValue(JSON) as TJSONObject;
  result := '<?xml version="1.0" encoding="' + encoding + '"?>';
  result := result + '<root>';
  result := result + '<' + fun + '>';
  for i := 0 to jo.Count - 1 do
  begin
    pair := jo.Pairs[i].ToString;
    key := pair.Substring(0, pair.IndexOf(':')).DeQuotedString('"');
    value := pair.Substring(pair.IndexOf(':') + 1).DeQuotedString('"');

    value := httpencode(UTF8Encode(value));
    result := result + '<' + key + '>' + value + '</' + key + '>';
  end;
  result := result + '</' + fun + '>';
  result := result + '</root>';
  jo.Free;
end;

class function TXmlAndJSON.XML2JSON(xml: string): string;
var
  XMLDoc, DocIntf: IXMLDocument;
  nodeList, attrList: IXMLNodeList;
begin
  try
    try
      XMLDoc := TXMLDocument.Create(nil);
      DocIntf := XMLDoc;
    except
      on e: exception do
        logger.Error('TXMLDocument.Create ' + e.Message);
    end;
    try
      XMLDoc.LoadFromXML(xml);
    except
      on e: exception do
        logger.Error('xmlDoc.LoadFromXML ' + e.Message);
    end;
    try
      result := '{' + ReadXml(XMLDoc.DocumentElement) + '}';
    except
      on e: exception do
        logger.Error('ReadXml ' + e.Message);
    end;
    // FreeAndNil(XMLDoc);
  finally
    XMLDoc := nil;
    DocIntf := nil;
  end;
end;

class function TXmlAndJSON.ReadXml(node: IXMLNode): string;
var
  nodeList: IXMLNodeList;
  str, strName, strValue: string;
  i: integer;
  first, InArray, firstNode, lastNode: boolean;
begin
  if node.IsTextElement then
  begin
    strValue := node.NodeValue;
    if strValue = '' then
      strValue := 'null';

    result := '"' + node.NodeName + '":"' + strValue + '"';
    exit;
  end;

  InArray := ((node.NextSibling <> nil) and
    (node.NextSibling.NodeName = node.NodeName)) or
    ((node.PreviousSibling <> nil) and
    (node.PreviousSibling.NodeName = node.NodeName));
  if InArray then
  begin
    firstNode := (node.PreviousSibling = nil) or
      (node.PreviousSibling.NodeName <> node.NodeName); // 数组的第一个
    lastNode := (node.NextSibling = nil) or
      (node.NextSibling.NodeName <> node.NodeName); // 数组的最后一个
    if firstNode then
      str := '"' + node.NodeName + '":[{'
    else
      str := '{';
  end
  else
    str := '"' + node.NodeName + '":{';

  first := true;
  nodeList := node.ChildNodes;
  for i := 0 to nodeList.Count - 1 do
  begin
    if nodeList[i].IsTextElement then
    begin
      strName := nodeList[i].NodeName;
      strValue := nodeList[i].NodeValue;
      if strValue <> '' then
      begin
        if first then
          first := false
        else
          str := str + ',';
        str := str + '"' + strName + '":"' + strValue + '"';
      end;
    end
    else if nodeList[i].HasChildNodes then
    begin
      if first then
        first := false
      else
        str := str + ',';
      str := str + ReadXml(nodeList[i]);
    end;
  end;
  str := str + '}';
  if lastNode then
    str := str + ']';
  result := str;
end;

end.
