unit uJsonUtils;

interface

uses
  FireDAC.Comp.Client, System.JSON, System.SysUtils, Data.DB, System.Rtti,
  System.Classes, Generics.Collections, Variants;

type
  TJSONUtils = Class
  private
    Class function CreateTableColumns(AJv: TJSONValue;
      ATable: TFDMemTable): Boolean;
  public
    Class function JSONToDataSet(AJSON: String; ATable: TFDMemTable;
      AIndexField: String = ''; AIsCreateCol: Boolean = True;
      Options: TIndexOptions = [ixDescending]): Boolean;
    class function ObjectToJSON(obj: TObject): string; static;
    class function ObjectListToJSON<T: Class>(list: TList<T>): string; static;
    Class function JsonToObject<T: Class>(JSON: string): T;
    Class function JsonToObjectList<T: Class>(JSON: String): TList<T>;
    Class procedure DecodeRmResultHead(JSON: String; var code: String;
      var rownum: String);

    class function RecordToJSON<T>(rec: Pointer): string; static;
    class function RecordListToJSON<T>(list: TList<T>): string; static;

    class function JsonToRecord<T>(JSON: string): T; static;
    class function JsonToRecordList<T>(JSON: string): TList<T>; static;

    class function AddObjToTable(tb: TFDMemTable; obj: TObject): Boolean;
    class function TableToRecord<T>(ATable: TFDMemTable): T; static;
    class function TableToRecordList<T>(ATable: TFDMemTable): TList<T>; static;
    class function AppendRecordToTable<T>(rec: Pointer; ATable: TFDMemTable)
      : Boolean; static;
    class function RecordListToTable<T>(list: TList<T>; ATable: TFDMemTable)
      : Boolean; static;
    class function GetJsonSingleValue(JSON, Field: String): String;
    class function ObjectToString(obj: TObject): String;
    class function RecordToString<T>(rec: Pointer): string; static;
    class function RecordListSort<T>(list: TList<T>; sortCol: String;
      Options: TIndexOptions = [ixPrimary]): TList<T>;
  end;

implementation

class function TJSONUtils.AddObjToTable(tb: TFDMemTable; obj: TObject): Boolean;
var
  rType: TRttiType;
  arr: TArray<TRttiField>;
  Field: TRttiField;
  FRTTICtx: TRTTIContext;
begin
  if obj = nil then
    exit;

  try
    rType := FRTTICtx.GetType(obj.ClassType);
    arr := rType.GetFields;

    if not tb.Active then
    begin
      for Field in arr do
      begin
        tb.FieldDefs.Add(Field.Name, ftString, 128, false);
      end;
      tb.CreateDataSet;
    end;

    tb.append;
    for Field in arr do
    begin
      if tb.FindField(Field.Name) = nil then
        continue;
      tb.FieldByName(Field.Name).Value := Field.GetValue(obj).ToString;
    end;
    tb.Post;
    rType.Free;
  except
  end;
end;

Class function TJSONUtils.JsonToObjectList<T>(JSON: String): TList<T>;
var
  ja: TJSONArray;
  jv: TJSONValue;
  rec: T;
begin
  Result := TList<T>.Create;

  if JSON = '' then
    exit;

  try
    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      for jv in ja do
      begin
        rec := JsonToObject<T>('[' + jv.ToJSON + ']');
        Result.Add(rec);
      end;
    end;
    ja.Free;
  except
  end;
end;

Class procedure TJSONUtils.DecodeRmResultHead(JSON: String; var code: String;
  var rownum: String);
var
  head, item: string;
  tmpTs: TStrings;
  i: integer;
begin
  tmpTs := TStringList.Create;
  tmpTs.Delimiter := ',';
  if pos('"head":{', JSON) > 0 then
  begin
    JSON := copy(JSON, pos('"head":{', JSON) + 8, length(JSON));
    head := copy(JSON, 1, pos('}', JSON) - 1);
    JSON := copy(JSON, pos('}', JSON) + 1, length(JSON));
    head := StringReplace(head, '"', '', [rfReplaceAll]);
    tmpTs.DelimitedText := head;
    for i := 0 to tmpTs.Count - 1 do
    begin
      if pos('code', tmpTs[i]) = 1 then
        code := Trim(copy(tmpTs[i], pos(':', tmpTs[i]) + 1, 10))
      else if pos('rownum', tmpTs[i]) = 1 then
        rownum := Trim(copy(tmpTs[i], pos(':', tmpTs[i]) + 1, 10));
    end;
  end;
  tmpTs.Free;
end;

Class function TJSONUtils.JsonToObject<T>(JSON: string): T;
var
  FRTTICtx: TRTTIContext;
  rType: TRttiType;
  tit: TRttiInstanceType;
  rField: TRttiField;
  ja: TJSONArray;
  jv: TJSONValue;
  ji: TJSONValue;
  v: TValue;
  obj: TObject;
  s: string;
begin
  if JSON = '' then
    exit;
  try
    rType := FRTTICtx.GetType(T);
    tit := rType.AsInstance;
    // obj := tit.NewInstance;
    v := tit.GetMethod('Create').Invoke(T, []);
    obj := v.AsObject;

    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      for jv in ja do
      begin
        for ji in TJSONArray(jv) do
        begin
          rField := rType.GetField(TJSONPair(ji).JsonString.Value);
          if rField = nil then
            continue;
          s := TJSONPair(ji).JsonValue.Value;
          if (rField.FieldType.TypeKind = tkUString) or
            (rField.FieldType.TypeKind = tkString) then
            rField.SetValue(obj, TValue.From<string>(s))
          else if rField.FieldType.TypeKind = tkInteger then
            rField.SetValue(obj, TValue.From<integer>(strtointdef(s, 0)))
          else if rField.FieldType.TypeKind = tkFloat then
          begin
            if s.Contains('/') or s.Contains('-') or s.Contains(':') then
              rField.SetValue(obj, TValue.From<double>(VarToDateTime(s)))
            else
              rField.SetValue(obj, TValue.From<double>(strtofloatdef(s, 0)));
          end;
        end;
      end;
      ja.Free;
    end;
    rType.Free;
  except
  end;
  Result := obj as T;
end;

Class function TJSONUtils.JsonToRecord<T>(JSON: string): T;
var
  rrt: TRttiRecordType;
  rField: TRttiField;
  ja: TJSONArray;
  jv: TJSONValue;
  ji: TJSONValue;
  s: string;
  v: TValue;
begin
  if JSON = '' then
    exit;
  try
    rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      for jv in ja do
      begin
        for ji in TJSONArray(jv) do
        begin
          rField := rrt.GetField(TJSONPair(ji).JsonString.Value);
          if rField = nil then
            continue;
          s := TJSONPair(ji).JsonValue.Value;
          if (rField.FieldType.TypeKind = tkUString) or
            (rField.FieldType.TypeKind = tkString) then
            v := TValue.From<string>(s)
          else if rField.FieldType.TypeKind = tkInteger then
            v := TValue.From<integer>(strtointdef(s, 0))
          else if rField.FieldType.TypeKind = tkInt64 then
            v := TValue.From<Int64>(strtointdef(s, 0))
          else if rField.FieldType.TypeKind = tkFloat then
          begin
            if s.Contains('/') or s.Contains('-') or s.Contains(':') then
              v := TValue.From<double>(VarToDateTime(s))
            else
              v := TValue.From<double>(strtofloatdef(s, 0));
          end
          else if rField.FieldType.TypeKind = tkEnumeration then
            v := TValue.From<Boolean>(StrToBoolDef(s, false))
          else
            v := TValue.From<string>(s);
          rField.SetValue(@Result, v);
        end;
      end;
      ja.Free;
    end;
  except
  end;
end;

Class function TJSONUtils.JsonToRecordList<T>(JSON: string): TList<T>;
var
  ja: TJSONArray;
  jv: TJSONValue;
  rec: T;
begin
  Result := TList<T>.Create;

  if JSON = '' then
    exit;

  try
    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      for jv in ja do
      begin
        rec := JsonToRecord<T>('[' + jv.ToJSON + ']');
        Result.Add(rec);
      end;
      ja.Free;
    end;
  except
  end;
end;

class function TJSONUtils.GetJsonSingleValue(JSON, Field: String): String;
begin
  Result := '';
  if pos('"' + UpperCase(Field) + '":"', UpperCase(JSON)) > 0 then
  begin
    JSON := copy(JSON, pos('"' + UpperCase(Field) + '":"', UpperCase(JSON)) +
      length('"' + Field + '":"'), length(JSON));
    if pos('"', JSON) > 1 then
      Result := copy(JSON, 1, pos('"', JSON) - 1);
  end;
end;

class function TJSONUtils.ObjectToJSON(obj: TObject): string;
var
  rType: TRttiType;
  arr: TArray<TRttiField>;
  Field: TRttiField;
  FRTTICtx: TRTTIContext;
begin
  rType := FRTTICtx.GetType(obj.ClassType);
  arr := rType.GetFields;
  for Field in arr do
  begin
    if Field.GetValue(obj).ToString <> '' then
      Result := Result + ',"' + Field.Name + '":"' + Field.GetValue(obj)
        .ToString + '"';
  end;
  Result := '{' + Result.Substring(1) + '}';
  rType.Free;
end;

class function TJSONUtils.ObjectToString(obj: TObject): String;
var
  rType: TRttiType;
  arr: TArray<TRttiField>;
  Field: TRttiField;
  FRTTICtx: TRTTIContext;
begin
  rType := FRTTICtx.GetType(obj.ClassType);
  arr := rType.GetFields;
  for Field in arr do
  begin
    if Field.GetValue(obj).ToString <> '' then
      Result := Result + '&' + Field.Name + '=' + Field.GetValue(obj).ToString;
  end;
  Result := Result.Substring(1);
  rType.Free;
end;

class function TJSONUtils.RecordToJSON<T>(rec: Pointer): string;
var
  rrt: TRttiRecordType;
  arr: TArray<TRttiField>;
  Field: TRttiField;
  FRTTICtx: TRTTIContext;
  s: string;
begin
  rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
  arr := rrt.GetFields;
  for Field in arr do
  begin
    s := Field.GetValue(rec).ToString;
    if s <> '' then
      Result := Result + ',"' + Field.Name + '":"' + s + '"';
  end;
  Result := '{' + Result.Substring(1) + '}';
end;

class function TJSONUtils.RecordToString<T>(rec: Pointer): string;
var
  rrt: TRttiRecordType;
  arr: TArray<TRttiField>;
  Field: TRttiField;
  FRTTICtx: TRTTIContext;
  s: string;
begin
  rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
  arr := rrt.GetFields;
  for Field in arr do
  begin
    s := Field.GetValue(rec).ToString;
    if s <> '' then
      Result := Result + '&' + Field.Name + '=' + s;
  end;
  Result := Result.Substring(1);
end;

class function TJSONUtils.RecordListToJSON<T>(list: TList<T>): string;
var
  item: T;
  s: string;
begin
  for item in list do
  begin
    s := RecordToJSON<T>(@item);
    Result := ',' + Result;
  end;
  if Result <> '' then
  begin
    Result := Result.Substring(1);
    Result := '[' + Result + ']';
  end;
end;

class function TJSONUtils.ObjectListToJSON<T>(list: TList<T>): string;
var
  obj: T;
begin
  if (list <> nil) and (list.Count > 0) then
  begin
    for obj in list do
    begin
      Result := Result + ',' + ObjectToJSON(obj);
    end;
    Result := '[' + Result.Substring(1) + ']';
  end;
end;

Class function TJSONUtils.CreateTableColumns(AJv: TJSONValue;
  ATable: TFDMemTable): Boolean;
var
  ji: TJSONValue;
begin
  Result := True;
  try
    ATable.FieldDefs.Clear;
    for ji in TJSONArray(AJv) do
    begin
      if ATable.FieldDefs.IndexOf(TJSONPair(ji).JsonString.Value) < 0 then
      begin
        if TJSONPair(ji).JsonString.Value = '×ÜÊý' then
          ATable.FieldDefs.Add(TJSONPair(ji).JsonString.Value,
            ftInteger, 0, false)
        else
          ATable.FieldDefs.Add(TJSONPair(ji).JsonString.Value, ftString,
            4000, false);
      end;
    end;
  except
    Result := false;
  end;
end;

Class function TJSONUtils.JSONToDataSet(AJSON: String; ATable: TFDMemTable;
  AIndexField: String = ''; AIsCreateCol: Boolean = True;
  Options: TIndexOptions = [ixDescending]): Boolean;
var
  ja: TJSONArray;
  jv: TJSONValue;
  ji: TJSONValue;
  colName: String;
begin
  Result := false;
  if ATable = nil then
    exit;
  ATable.Close;
  if AJSON = '' then
    exit;

  try
    ja := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJSON), 0)
      as TJSONArray;
    if ja <> nil then
    begin
      ATable.DisableControls;
      if AIsCreateCol then
      begin
        if ja.Count > 0 then
        begin
          if not CreateTableColumns(ja.Items[0], ATable) then
            exit;
          if AIndexField <> '' then
          begin
            ATable.IndexDefs.Clear;
            ATable.IndexDefs.Add('index', AIndexField, Options);
            ATable.IndexName := 'index';
          end;
        end;
        ATable.CreateDataSet();
      end
      else
        ATable.Open;
      for jv in ja do
      begin
        ATable.append;
        for ji in TJSONArray(jv) do
        begin
          colName := TJSONPair(ji).JsonString.Value;
          if ATable.FieldDefs.IndexOf(colName) >= 0 then
            ATable.FieldByName(colName).AsString := TJSONPair(ji)
              .JsonValue.Value;
        end;
        ATable.Post;
      end;
      Result := True;
      ATable.First;
      ATable.EnableControls;
      ja.Free;
    end;
  except
  end;
end;

class function TJSONUtils.TableToRecord<T>(ATable: TFDMemTable): T;
var
  rrt: TRttiRecordType;
  rField: TRttiField;
  f: TField;
  v: TValue;
begin
  if (ATable = nil) or (not ATable.Active) then
    exit;
  rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
  for f in ATable.Fields do
  begin
    if f.IsNull or (f.AsString = '') then
      continue;
    rField := rrt.GetField(f.FieldName);
    if rField = nil then
      continue;
    case rField.FieldType.TypeKind of
      tkUString, tkString:
        v := TValue.From<string>(f.AsString);
      tkInteger:
        v := TValue.From<integer>(f.AsInteger);
      tkInt64:
        v := TValue.From<Int64>(f.AsInteger);
      tkFloat:
        v := TValue.From<double>(f.AsFloat);
      tkEnumeration:
        v := TValue.From<Boolean>(f.AsBoolean);
    else
      v := TValue.From<string>(f.AsString);
    end;
    rField.SetValue(@Result, v);
  end;
end;

class function TJSONUtils.TableToRecordList<T>(ATable: TFDMemTable): TList<T>;
var
  rec: T;
begin
  Result := TList<T>.Create;
  if (ATable = nil) or (not ATable.Active) then
    exit;
  ATable.DisableControls;
  ATable.First;
  while not ATable.Eof do
  begin
    rec := TableToRecord<T>(ATable);
    Result.Add(rec);
    ATable.Next;
  end;
  ATable.EnableControls;
end;

class function TJSONUtils.RecordListToTable<T>(list: TList<T>;
  ATable: TFDMemTable): Boolean;
var
  rrt: TRttiRecordType;
  arr: TArray<TRttiField>;
  Field: TRttiField;
  FRTTICtx: TRTTIContext;
  s: string;
  rec: T;
begin
  Result := false;
  rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
  arr := rrt.GetFields;
  ATable.Close;
  ATable.FieldDefs.Clear;
  for Field in arr do
  begin
    if (Field.FieldType.TypeKind = tkUString) or
      (Field.FieldType.TypeKind = tkString) then
      ATable.FieldDefs.Add(Field.Name, ftString, 255, false)
    else if (Field.FieldType.TypeKind = tkInteger) or
      (Field.FieldType.TypeKind = tkInt64) then
      ATable.FieldDefs.Add(Field.Name, ftInteger, 0, false)
    else if Field.FieldType.TypeKind = tkFloat then
      ATable.FieldDefs.Add(Field.Name, ftFloat, 0, false)
    else
      ATable.FieldDefs.Add(Field.Name, ftString, 255, false);
  end;
  ATable.Open;
  ATable.DisableControls;
  if list <> nil then
  begin
    for rec in list do
      AppendRecordToTable<T>(@rec, ATable);
  end;
  ATable.First;
  ATable.EnableControls;
  Result := True;
end;

class function TJSONUtils.RecordListSort<T>(list: TList<T>; sortCol: String;
  Options: TIndexOptions): TList<T>;
var
  rrt: TRttiRecordType;
  arr: TArray<TRttiField>;
  Field: TRttiField;
  s, v: string;
  index: integer;
  colType: TTypeKind;
  rec, rec1: T;
  findCol: Boolean;
begin
  Result := nil;
  if list = nil then
    exit;
  findCol := false;
  rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
  arr := rrt.GetFields;
  for Field in arr do
  begin
    if UpperCase(Field.Name) = UpperCase(sortCol) then
    begin
      findCol := True;
      colType := Field.FieldType.TypeKind;
      break;
    end;
  end;

  if not findCol then
  begin
    Result := list;
    exit;
  end;

  Result := TList<T>.Create;
  for rec in list do
  begin
    if Result.Count = 0 then
    begin
      Result.Add(rec);
      continue;
    end;
    v := Field.GetValue(@rec).ToString;
    index := 0;
    if Options = [ixDescending] then // µ¹Ðò
    begin
      for rec1 in Result do
      begin
        if colType = tkInteger then
        begin
          if StrToInt(v) > StrToInt(Field.GetValue(@rec1).ToString) then
          begin
            Result.Insert(index, rec);
            break;
          end;
        end
        else if v > Field.GetValue(@rec1).ToString then
        begin
          Result.Insert(index, rec);
          break;
        end;
        inc(index);
      end;
      if index = Result.Count then
      begin
        Result.Add(rec);
      end;
    end
    else
    begin
      for rec1 in Result do
      begin
        if colType = tkInteger then
        begin
          if StrToInt(v) < StrToInt(Field.GetValue(@rec1).ToString) then
          begin
            Result.Insert(index, rec);
            break;
          end;
        end
        else if v < Field.GetValue(@rec1).ToString then
        begin
          Result.Insert(index, rec);
          break;
        end;
        inc(index);
      end;
      if index = Result.Count then
      begin
        Result.Add(rec);
      end;
    end;
  end;
  list.Free;
end;

class function TJSONUtils.AppendRecordToTable<T>(rec: Pointer;
  ATable: TFDMemTable): Boolean;
var
  rrt: TRttiRecordType;
  rField: TRttiField;
  f: TField;
  v: TValue;
begin
  Result := false;
  if (ATable = nil) or (not ATable.Active) then
    exit;
  ATable.append;
  ATable.Edit;
  rrt := TRTTIContext.Create.GetType(TypeInfo(T)).AsRecord;
  for f in ATable.Fields do
  begin
    rField := rrt.GetField(f.FieldName);
    if rField = nil then
      continue;
    f.Value := rField.GetValue(rec).AsVariant;
    { if (rField.FieldType.TypeKind = tkUString)or(rField.FieldType.TypeKind = tkString) then
      f.Value := rField.GetValue(rec).AsString
      else if rField.FieldType.TypeKind = tkInteger then
      f.Value := rField.GetValue(rec).AsInteger
      else if rField.FieldType.TypeKind = tkInt64 then
      f.Value := rField.GetValue(rec).AsInteger
      else if rField.FieldType.TypeKind = tkFloat then
      f.Value := rField.GetValue(rec).AsCurrency
      else
      f.Value := rField.GetValue(rec).AsString;
    }
  end;
  ATable.Post;
end;

end.
