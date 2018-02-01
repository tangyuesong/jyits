unit uPassCounter;

interface

uses
  SysUtils, Classes, System.Generics.Collections, SyncObjs, uGlobal;

type
  TSts = class
    Hour: string;
    KDBH: string;
    Num: double;
    gxsj: double;
  end;

  TPassCounter = class
  private
    cs: TCriticalSection;
    FStsDic: TDictionary<string, TSts>;
    procedure LoadStsFromFile;
    procedure SaveStsToFile;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(sbbh, hphm, hpzl: string; gcsj: double);
    procedure SaveSts;
  end;

//var
//  PassCounter: TPassCounter;

implementation

procedure TPassCounter.Add(sbbh, hphm, hpzl: string; gcsj: double);
  function getNum(hpzl, hphm: string): double;
  begin
    if hpzl='07' then
      result := 1
    else if hpzl ='01' then
    begin
      if hphm.Contains('挂') then
        result := 9
      else
        result := 6;
    end
    else
      result := 3;
  end;
var
  hour, key: string;
  obj: TSts;
begin
  hour := formatdatetime('yymmddhh', gcsj);
  key := sbbh + hour;
  if not FStsDic.ContainsKey(key) then
  begin
    obj := TSts.Create;
    obj.kdbh := sbbh;
    obj.hour := hour;
    obj.gxsj := now;
    obj.Num := getNum(hpzl, hphm);
    cs.Enter;
    FStsDic.Add(key, obj);
    cs.Leave;
  end
  else
  begin
    obj := FStsDic[key];
    obj.Num := obj.Num + getNum(hpzl, hphm);
    obj.gxsj := now;
  end;
end;

constructor TPassCounter.Create;
begin
  cs := TCriticalSection.Create;
  FStsDic := TDictionary<string, TSts>.Create;
  self.LoadStsFromFile;
end;

destructor TPassCounter.Destroy;
begin
  self.SaveStsToFile;
  FStsDic.Free;
  cs.Free;
  inherited;
end;

procedure TPassCounter.SaveSts;
var
  obj: TSts;
  key, sqlStr: string;
  d: double;
begin
  cs.Enter;
  d := now;
  sqlStr := '';
  for key in FStsDic.Keys do
  begin
    obj := FStsDic[key];
    if (d - obj.gxsj) * 24 * 60 > 10 then
    begin
      sqlStr := sqlStr +
        'insert into T_KK_VEH_PASSSTS(KDBH, HOUR, NUM)values(''' + obj.kdbh +
        ''',''' + obj.hour + ''',' + trunc(obj.Num).ToString + ')'#10;
      FStsDic.Remove(key);
      obj.Free;
    end;
  end;
  if sqlStr <> '' then
  begin
    SQLHelper.ExecuteSql(sqlStr);
  end;
  SaveStsToFile;
  cs.Leave;
end;

// 保存过车统计到文件，以便下次启动时恢复统计数据
procedure TPassCounter.SaveStsToFile;
var
  key: string;
  ss: TStrings;
  obj: TSts;
begin
  ss := TStringList.Create;
  for key in FStsDic.Keys do
  begin
    obj := FStsDic[key];
    ss.Add(obj.Hour+#9+obj.KDBH+#9+obj.Num.ToString());
  end;
  ss.SaveToFile(ExtractFilePath(ParamStr(0))+'PassCount.dat');
  ss.Free;
end;

procedure TPassCounter.LoadStsFromFile;
var
  s: string;
  ss: TStrings;
  obj: TSts;
  arr: TArray<string>;
begin
  s := ExtractFilePath(ParamStr(0))+'PassCount.dat';
  if FileExists(s) then
  begin
    ss := TStringList.Create;
    ss.LoadFromFile(s);
    for s in ss do
    begin
      obj := TSts.Create;
      arr := s.Split([#9]);
      obj.Hour := arr[0];
      obj.KDBH := arr[1];
      obj.Num := strtofloatdef(arr[2],0);
      obj.gxsj := now;
      FStsDic.Add(obj.KDBH+obj.Hour, obj);
    end;
    ss.Free;
  end;
end;

end.
