unit uDFS;

interface

uses
  System.SysUtils, System.Classes, Generics.Collections, uPassRec, uGlobal,
  uRequestItf;

type
  TDFS = class
  private
    class function GetPassRecList(params: String)
      : TObjectList<TPassRec>; static;
    class procedure SortList(list: TObjectList<TPassRec>); static;
  public
    class function SelectPassRecByHPHM(HPZL, HPHM: string;
      startTime, endTime: Double): TObjectList<TPassRec>; static;
    class function SelectPassRecByKDBH(KDBH: string; startTime, endTime: Double)
      : TObjectList<TPassRec>; static;
    class function GetRecentPassRec(KDBH: string; after: Double)
      : TPassRec; static;
    class function GetPassRec(HPZL, HPHM: string; time: Double)
      : TPassRec; static;
    class function GetPassRecListFromK08(params: String)
      : TObjectList<TPassRec>; static;
  end;

implementation

{ TDFS }

class function TDFS.SelectPassRecByHPHM(HPZL, HPHM: string;
  startTime, endTime: Double): TObjectList<TPassRec>;
var
  s: String;
begin
  s := 'HPHM=' + HPHM + '&HPZL=' + HPZL + '&begin_GCSJ=' +
    FormatDateTime('yyyymmddhhmmss', startTime) + '&end_GCSJ=' +
    FormatDateTime('yyyymmddhhmmss', endTime);
  result := GetPassRecList(s);
end;

class function TDFS.SelectPassRecByKDBH(KDBH: string;
  startTime, endTime: Double): TObjectList<TPassRec>;
var
  s: String;
begin
  s := 'KDBH=' + KDBH + '&begin_GCSJ=' + FormatDateTime('yyyymmddhhmmss',
    startTime) + '&end_GCSJ=' + FormatDateTime('yyyymmddhhmmss', endTime);
  result := GetPassRecList(s);
end;

class procedure TDFS.SortList(list: TObjectList<TPassRec>);
var
  i, j: integer;
  tmp: TPassRec;
begin
  list.OwnsObjects := false;
  for i := 0 to list.Count - 2 do
  begin
    for j := i + 1 to list.Count - 1 do
    begin
      if list[i].GCSJ < list[j].GCSJ then
      begin
        tmp := list[i];
        list[i] := list[j];
        list[j] := tmp;
      end;
    end;
  end;
  list.OwnsObjects := true;
end;

class function TDFS.GetPassRecList(params: String): TObjectList<TPassRec>;
var
  json, s: string;
  obj: TPassRec;
  ss: TArray<string>;
begin
  result := TObjectList<TPassRec>.Create;
  try
    json := TRequestItf.DbQuery('GetPassList', params);
    if json <> '' then
    begin
      ss := json.Split(['}']);
      for s in ss do
      begin
        if s.Length > 10 then
        begin
          obj := TPassRec.FromJson(s + '}');
          result.Add(obj);
        end;
      end;
    end
    else
      gLogger.Info('PassList is null ');
  except
  end;
end;

class function TDFS.GetPassRecListFromK08(params: String)
  : TObjectList<TPassRec>;
var
  json, s: string;
  obj: TPassRec;
  ss: TArray<string>;
begin
  result := TObjectList<TPassRec>.Create;
  try
    json := TRequestItf.DbQuery('GetK08PassList', params);
    if json <> '' then
    begin
      ss := json.Split(['}']);
      for s in ss do
      begin
        if s.Length > 10 then
        begin
          obj := TPassRec.FromJson(s + '}');
          result.Add(obj);
        end;
      end;
    end
    else
      gLogger.Info('PassList is null ');
  except
  end;
end;

class function TDFS.GetRecentPassRec(KDBH: string; after: Double): TPassRec;
var
  list: TObjectList<TPassRec>;
  i: integer;
begin
  result := nil;
  list := TDFS.SelectPassRecByKDBH(KDBH, after, now);
  if list.Count > 0 then
  begin
    result := list[0];
    for i := 1 to list.Count - 1 do
    begin
      if list[i].GCSJ > result.GCSJ then
      begin
        result := list[i];
      end;
    end;
    list.OwnsObjects := false;
    list.Remove(result);
    list.OwnsObjects := true;
  end;
  list.Free;
end;

class function TDFS.GetPassRec(HPZL, HPHM: string; time: Double): TPassRec;
var
  list: TObjectList<TPassRec>;
begin
  result := nil;
  list := TDFS.SelectPassRecByHPHM(HPZL, HPHM, time - 0.0001, time + 0.0001);
  if list.Count > 0 then
  begin
    list.OwnsObjects := false;
    result := list[list.Count - 1];
    list.Delete(list.Count - 1);
    list.OwnsObjects := true;
  end;
  list.Free;
end;

end.
