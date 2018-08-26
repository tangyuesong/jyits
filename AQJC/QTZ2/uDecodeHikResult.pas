unit uDecodeHikResult;

interface

uses
  SysUtils, Xml.XMLIntf, Xml.XMLDoc, System.Variants, Generics.Collections,
  System.Rtti, QJson, uCommon, uGlobal, uEntity, ActiveX;

Type
  {
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
  }
  TK08VehInfo = Record
    area: String;
    areacode: String;
    cascade: String;
    checkresult: String;
    confidence: String;
    copilot: String;
    crossingid: String;
    dangmark: String;
    datasources: String;
    decoration: String;
    directionindex: String;
    driverposition: String;
    envprosign: String;
    frontchild: String;
    frontconfidence: String;
    frontconfidencedetail: String;
    id: String;
    imagepath: String;
    infolevel: String;
    slabel: String;
    laneno: String;
    mobiledevicelatitude: String;
    mobiledevicelongitude: String;
    multivehicle: String;
    passid: String;
    passtime: String;
    pdvs: String;
    pendant: String;
    picurl_num: String;
    pilotsafebelt: String;
    pilotsunvisor: String;
    plateblong: String;
    platecheckresult: String;
    platecolor: String;
    platediff: String;
    plateno: String;
    platenosimilarity: String;
    plateposition: String;
    plateprovince: String;
    platestate: String;
    platetail: String;
    platetype: String;
    recognitionsign: String;
    sequenceid: String;
    storagetime: String;
    subfeature: String;
    sunroofposition: String;
    tempplateno: String;
    tfsid: String;
    tissuebox: String;
    uphone: String;
    vehiclecolor: String;
    vehiclecolordepth: String;
    vehiclehead: String;
    vehicleisslave: String;
    vehiclelamp: String;
    vehiclelen: String;
    vehiclelogo: String;
    vehiclemodel: String;
    vehiclerect: String;
    vehiclesign: String;
    vehiclespeed: String;
    vehiclestate: String;
    vehiclesublogo: String;
    vehicletype: String;
    vicedriverposition: String;
    vicepilotsafebelt: String;
    vicepilotsunvisor: String;
    videostructure: String;
  end;

  TDFVehInfo = Record
    nTagID: String;
    PlateNum: String;
    nColor: String;
    nType: String;
    nMainLogo: String;
    nSubLogo: String;
    nModel: String;
    nPilotSB: String;
    nCopilotSB: String;
    nPilotSV: String;
    nCopilotSV: String;
    nDangMark: String;
    nEnvProSign: String;
    nUPhone: String;
    nPendant: String;
  End;

  TDecodeHikResult = Class
  private
    class procedure InitVehInfo<T>(rec: Pointer);
    class function GetField(const AName: String; fields: TArray<TRttiField>)
      : TRttiField;
  public
    class function DecodeK08SearchResult(Xml: String; var totalPage: Integer;
      var currentPage: Integer): TList<TK08VehInfo>;
    class function DecodeDFAnalysisOnePicResult(Xml: String): TList<TDFVehInfo>;
    class function DecodeVehStr(vehStr: String): TList<TstPreProcRet>;
    class function DecodeJobStr(jobStr: String): String;
    class function DecodeJobProgress(proStr: String): String;
    class function DecodeCarFaceResult(passStr: String): TList<TK08VehInfo>;
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
  XMLDoc := nil;
  DocIntf := nil;
  rrt := nil;
end;

class function TDecodeHikResult.DecodeJobProgress(proStr: String): String;
var
  m, n: Integer;
  s: String;
begin
  Result := '';
  if pos('<resultCode>0</resultCode>', proStr) > 0 then
  begin
    m := pos('<jsonData>', proStr);
    n := pos('</jsonData>', proStr);
    if (m > 0) and (n > m) then
    begin
      s := copy(proStr, m + 10, n - m - 10);
      Result := TCommon.GetJsonNode('progress', s);
    end;
  end;
end;

class function TDecodeHikResult.DecodeJobStr(jobStr: String): String;
var
  m, n: Integer;
begin
  Result := '';
  if pos('<resultCode>0</resultCode>', jobStr) > 0 then
  begin
    m := pos('<taskID>', jobStr);
    n := pos('</taskID>', jobStr);
    if (m > 0) and (n > m) then
      Result := copy(jobStr, m + 8, n - m - 8);
  end;
end;

class function TDecodeHikResult.DecodeK08SearchResult(Xml: String;
  var totalPage: Integer; var currentPage: Integer): TList<TK08VehInfo>;
var
  I, J: Integer;
  key, value, s, msg: String;
  veh: TK08VehInfo;
  rrt: TRttiRecordType;
  rField: TRttiField;
  fields: TArray<TRttiField>;
  json, Rows, Item: TQJson;
begin
  Result := nil;
  rrt := TRTTIContext.Create.GetType(TypeInfo(TK08VehInfo)).AsRecord;
  fields := rrt.GetFields;
  I := pos('<return>', Xml);
  J := pos('</return>', Xml);
  if (I > 0) and (J > I) then
    s := Trim(copy(Xml, I + 8, J - I - 8))
  else
    Exit;
  json := TQJson.Create;
  try
    json.Parse(s);
    Rows := TCommon.FindJson('msg', json);
    if Rows <> nil then
    begin
      msg := Rows.value;
      if msg = 'success' then
      begin
        Result := TList<TK08VehInfo>.Create;
        totalPage := StrToIntDef(TCommon.GetJsonNode('totalPages', s), 0);
        currentPage := StrToIntDef(TCommon.GetJsonNode('pageNo', s), 0);
        Rows := TCommon.FindJson('rows', json);
        if Rows <> nil then
        begin
          for I := 0 to Rows.Count - 1 do
          begin
            Item := TQJson.Create;
            Item.Parse(Rows.Items[I].value);
            // Item := Rows.Items[I];
            for J := 0 to Item.Count - 1 do
            begin
              key := Item.Items[J].Name;
              value := Item.Items[J].value;
              try
                rField := GetField(key, fields);
                if rField <> nil then
                  rField.SetValue(@veh, TValue.From<string>(value));
              except
                on e: exception do
                  gLogger.Error(e.Message);
              end;
            end;
            if veh.id <> '' then
              Result.Add(veh);
            Item.Free;
          end;
        end;
      end
      else
        gLogger.Error(Rows.ToString);
    end;
  except
    on e: exception do
      gLogger.Error(e.Message);
  end;
  rrt := nil;
  json.Free;
end;

class function TDecodeHikResult.DecodeVehStr(vehStr: String)
  : TList<TstPreProcRet>;
var
  XMLDoc, DocIntf: IXMLDocument;
  rNode, cNode: IXMLNode;
  I, J: Integer;
  key, value: String;
  veh: TstPreProcRet;
  rrt: TRttiRecordType;
  rField: TRttiField;
  fields: TArray<TRttiField>;

  function GetField(const AName: String; fields: TArray<TRttiField>)
    : TRttiField;
  var
    Field: TRttiField;
  begin
    for Field in fields do
      if SameText(Field.Name, AName) then
        Exit(Field);
    Result := nil;
  end;

begin
  ActiveX.CoInitialize(nil);
  Result := nil;
  rrt := TRTTIContext.Create.GetType(TypeInfo(TstPreProcRet)).AsRecord;
  fields := rrt.GetFields;
  XMLDoc := TXMLDocument.Create(nil);
  DocIntf := XMLDoc;
  XMLDoc.LoadFromXML(vehStr);
  rNode := XMLDoc.ChildNodes.Nodes[0];
  rNode := rNode.ChildNodes.Nodes[0];
  rNode := rNode.ChildNodes.Nodes[0];
  rNode := rNode.ChildNodes.Nodes[0];

  if Trim(rNode.ChildValues['ns3:ErrorCode']) = '0' then
  begin
    Result := TList<TstPreProcRet>.Create;
    for I := 0 to rNode.ChildNodes.Count - 1 do
    begin
      if Uppercase(rNode.ChildNodes[I].NodeName) <> Uppercase('ns3:stPreProcRet')
      then
        continue;
      cNode := rNode.ChildNodes[I];
      for J := 0 to cNode.ChildNodes.Count - 1 do
      begin
        key := cNode.ChildNodes[J].NodeName;
        if key.Contains('ns4:') then
          key := key.Replace('ns4:', '');
        if key = 'stTagRect' then
        begin
          veh.stTagRect.Left := cNode.ChildNodes[J].Attributes['x'];
          veh.stTagRect.Top := cNode.ChildNodes[J].Attributes['y'];
          veh.stTagRect.Width := cNode.ChildNodes[J].Attributes['width'];
          veh.stTagRect.Height := cNode.ChildNodes[J].Attributes['height'];
        end
        else
        begin
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
      end;
      if veh.nTagID <> '' then
        Result.Add(veh);
    end;
  end;
  XMLDoc := nil;
  DocIntf := nil;
  rrt := nil;
  ActiveX.CoUninitialize;
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

class function TDecodeHikResult.DecodeCarFaceResult(passStr: String)
  : TList<TK08VehInfo>;
var
  I, J: Integer;
  key, value, s, msg: String;
  veh: TK08VehInfo;
  rrt: TRttiRecordType;
  rField: TRttiField;
  fields: TArray<TRttiField>;
  json, Rows, Item: TQJson;
begin
  Result := nil;
  if not(pos('<resultCode>0</resultCode>', passStr) > 0) then
    Exit;
  rrt := TRTTIContext.Create.GetType(TypeInfo(TK08VehInfo)).AsRecord;
  fields := rrt.GetFields;
  I := pos('<jsonData>', passStr);
  J := pos('</jsonData>', passStr);
  if (I > 0) and (J > I) then
    s := Trim(copy(passStr, I + 10, J - I - 10))
  else
    Exit;
  Result := TList<TK08VehInfo>.Create;
  json := TQJson.Create;
  try
    json.Parse(s);
    Rows := TCommon.FindJson('res', json);
    if Rows <> nil then
    begin
      for I := 0 to Rows.Count - 1 do
      begin
        Item := TQJson.Create;
        Item.Parse(Rows.Items[I].value);
        for J := 0 to Item.Count - 1 do
        begin
          key := Item.Items[J].Name;
          value := Item.Items[J].value;
          try
            rField := GetField(key, fields);
            if rField <> nil then
              rField.SetValue(@veh, TValue.From<string>(value));
          except
            on e: exception do
              gLogger.Error(e.Message);
          end;
        end;
        if veh.plateno <> '' then
          Result.Add(veh);
        Item.Free;
      end;
    end;
  except
    on e: exception do
      gLogger.Error(e.Message);
  end;
  rrt := nil;
  json.Free;
end;

end.
