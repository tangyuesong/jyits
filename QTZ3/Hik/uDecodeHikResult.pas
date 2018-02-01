unit uDecodeHikResult;

interface

uses
  SysUtils, Xml.XMLIntf, Xml.XMLDoc, System.Variants, Generics.Collections,
  System.Rtti;

Type

  TK08VehInfo = Record
    vicepilotsafebelt: String;
    platecolor: String;
    passtimerange: String;
    vehicleisslave: String;
    vehcolordepth: String;
    imageserverid: String;
    vmodelh: String;
    HIGHLIGHTCOLS: String;
    vehiclespeed: String;
    vehiclelen: String;
    vehiclehead: String;
    id: String;
    passid: String;
    directionindex: String;
    vehiclestate: String;
    vehicleid: String;
    uphone: String;
    vehiclesublogoall: String;
    vehicleinfo: String;
    vehiclelogo: String;
    dangmark: String;
    vehiclemodel: String;
    vehiclecolor: String;
    plateinfo: String;
    passtime: String;
    plateinfono: String;
    DOC_ID: String;
    vehicleinfolevel: String;
    pilotsafebelt: String;
    laneid: String;
    envprosign: String;
    vehiclemodelall: String;
    picvehicle: String;
    crossingid: String;
    vicepilotsunvisor: String;
    vehicletype: String;
    HITCOLS: String;
    vehiclesunvisor: String;
    platetype: String;
    vehiclesublogo: String;
    pendant: String;
    vmodely: String;
    platestate: String;
    vmodelw: String;
    vmodelx: String;
    ENTITYNAME: String;
  end;

  TDFVehInfo = Record
    nTagID: String; // Ŀ��ID
    PlateNum: String; // ����
    nColor: String; // ������ɫ
    nType: String; // ����
    nMainLogo: String; // ��Ʒ��
    nSubLogo: String; // ��Ʒ��
    nModel: String; // �����
    nPilotSB: String; // ����ʻ��ȫ��       0δ֪ 1δϵ  2ϵ
    nCopilotSB: String; // ����ʻ��ȫ��
    nPilotSV: String; // ����ʻ������       0δ֪ 1�� 2��
    nCopilotSV: String; // ����ʻ������
    nDangMark: String; // Σ��Ʒ��־    0δ֪ 1�� 2��
    nEnvProSign: String; // �Ʊ공        0δ֪ 1�̱� 2�Ʊ�
    nUPhone: String; // ���ֻ�        0δ֪ 1���ֻ� 2δ��
    nPendant: String; // �Ҽ�          0δ֪ 1�� 2��
    clpp: String; // Ʒ��������
  End;

  TDecodeHikResult = Class
  private
    class procedure InitVehInfo<T>(rec: Pointer);
    class function GetField(const AName: String; fields: TArray<TRttiField>)
      : TRttiField;
  public
    class function DecodeK08SearchResult(Xml: String; var totalPage: Integer;
      var currentPage: Integer; var totalNum: Integer): TList<TK08VehInfo>;
    class function DecodeDFAnalysisOnePicResult(Xml: String): TList<TDFVehInfo>;
  end;

implementation

{ TDecodeK08Result }

class function TDecodeHikResult.GetField(const AName: string;
  fields: TArray<TRttiField>): TRttiField;
var
  Field: TRttiField;
begin
  for Field in fields do
    if SameText(Field.Name, AName) then
      Exit(Field);
  Result := nil;
end;

class function TDecodeHikResult.DecodeDFAnalysisOnePicResult(Xml: String)
  : TList<TDFVehInfo>;
var
  XMLDoc, DocIntf: IXMLDocument;
  rNode, cNode: IXMLNode;
  I, J: Integer;
  key, value: String;
  veh: TDFVehInfo;
  rrt: TRttiRecordType;
  rField: TRttiField;
  fields: TArray<TRttiField>;
begin
  Result := nil;
  rrt := TRTTIContext.Create.GetType(TypeInfo(TDFVehInfo)).AsRecord;
  fields := rrt.GetFields;
  XMLDoc := TXMLDocument.Create(nil);
  DocIntf := XMLDoc;
  try
    XMLDoc.LoadFromXML(Xml);
    rNode := XMLDoc.ChildNodes.Nodes[0];
    rNode := rNode.ChildNodes.Nodes[0];
    rNode := rNode.ChildNodes.Nodes[0];
    if Trim(rNode.ChildValues['ErrorCode']) = '0' then
    begin
      Result := TList<TDFVehInfo>.Create;
      for I := 0 to rNode.ChildNodes.Count - 1 do
      begin
        if Uppercase(rNode.ChildNodes[I].NodeName) <> Uppercase('stPreProcRet')
        then
          continue;
        InitVehInfo<TDFVehInfo>(@veh);
        cNode := rNode.ChildNodes[I];
        for J := 0 to cNode.ChildNodes.Count - 1 do
        begin
          key := cNode.ChildNodes[J].NodeName;
          if key.Contains('ns2:') then
            key := key.Replace('ns2:', '');
          rField := GetField(key, fields);
          if rField <> nil then
          begin
            if cNode.ChildNodes[J].NodeValue <> null then
              value := cNode.ChildNodes[J].NodeValue
            else
              value := '';
            rField.SetValue(@veh, TValue.From<string>(value));
          end;
        end;
        if veh.nTagID <> '' then
          Result.Add(veh);
      end;
    end;
  finally
    XMLDoc := nil;
    DocIntf := nil;
    rrt := nil;
  end;
end;

class function TDecodeHikResult.DecodeK08SearchResult(Xml: String;
  var totalPage: Integer; var currentPage: Integer; var totalNum: Integer)
  : TList<TK08VehInfo>;
var
  XMLDoc, DocIntf: IXMLDocument;
  rNode, cNode: IXMLNode;
  I, J: Integer;
  key, value: String;
  veh: TK08VehInfo;
  rrt: TRttiRecordType;
  rField: TRttiField;
  fields: TArray<TRttiField>;
begin
  Result := nil;
  rrt := TRTTIContext.Create.GetType(TypeInfo(TK08VehInfo)).AsRecord;
  fields := rrt.GetFields;
  XMLDoc := TXMLDocument.Create(nil);
  DocIntf := XMLDoc;
  XMLDoc.LoadFromXML(Xml);
  rNode := XMLDoc.ChildNodes.Nodes[0];
  rNode := rNode.ChildNodes.Nodes[0];
  rNode := rNode.ChildNodes.Nodes[0];
  rNode := rNode.ChildNodes.Nodes[0];
  if Trim(rNode.ChildValues['resultCode']) = '0' then
  begin
    Result := TList<TK08VehInfo>.Create;
    rNode := rNode.ChildNodes.FindNode('resultList');
    totalNum := StrToInt(rNode.ChildValues['totalNum']);
    totalPage := StrToInt(rNode.ChildValues['totalPage']);
    currentPage := StrToInt(rNode.ChildValues['currentPage']);
    rNode := rNode.ChildNodes.FindNode('genSearchResult');
    if rNode <> nil then
    begin
      for I := 0 to rNode.ChildNodes.Count - 1 do // map
      begin
        InitVehInfo<TK08VehInfo>(@veh);
        cNode := rNode.ChildNodes[I];
        for J := 0 to cNode.ChildNodes.Count - 1 do // entry
        begin
          key := cNode.ChildNodes[J].ChildValues['key'];
          if cNode.ChildNodes[J].ChildNodes.FindNode('value') <> nil then
            value := Trim(cNode.ChildNodes[J].ChildNodes.FindNode('value').Text)
          else
            value := '0';
          try
            rField := GetField(key, fields);
            if rField <> nil then
              rField.SetValue(@veh, TValue.From<string>(value));
          except

          end;
        end;
        if veh.id <> '' then
          Result.Add(veh);
      end;
    end;
  end;
  XMLDoc := nil;
  DocIntf := nil;
  rrt := nil;
end;

class procedure TDecodeHikResult.InitVehInfo<T>(rec: Pointer);
var
  rrt: TRttiRecordType;
  rField: TRttiField;
begin
  rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
  for rField in rrt.GetFields do
    rField.SetValue(rec, TValue.From<string>(''));
  rrt := nil;
end;

end.
