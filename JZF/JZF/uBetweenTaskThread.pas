unit uBetweenTaskThread;

interface

uses
  System.Classes, ActiveX, System.Generics.Collections,
  System.Generics.Defaults,
  SysUtils, uDFS, uPassRec, uGlobal;

type
  TBetweenParam = class
    TaskID: string;
    TaskName: string;
    SBBH1: string;
    SBBH2: string;
    BeginTime: double;
    EndTime: double;
    Interval: double;
  end;

  TGCRecord = record
    SBBH: string;
    GCSJ: double;
  end;

  TBetweenTaskThread = class(TThread)
  private
    FTaskId: string;
    function LoadParamList: TBetweenParam;
    procedure SaveResult(dic: TDictionary<string, TList<TGCRecord>>;
      AStatus: String; interval: double);
    procedure GetPassRec(sbbhs: string; BeginTime, EndTime: double;
      data: TDictionary < string, TList < TGCRecord >> );
    procedure CleanData(SBBH1, SBBH2: string; data: TDictionary < string,
      TList < TGCRecord >> );
    procedure Clean(sbbhs: string; list: TList<TGCRecord>);
  protected
    procedure Execute; override;
  public
    constructor Create(TaskID: string); overload;
  end;

implementation

{ TBetweenTaskThread }

constructor TBetweenTaskThread.Create(TaskID: string);
begin
  self.FreeOnTerminate := true;
  ActiveX.CoInitialize(nil);
  FTaskId := TaskID;
  inherited Create(false);
end;

procedure TBetweenTaskThread.GetPassRec(sbbhs: string;
  BeginTime, EndTime: double; data: TDictionary < string,
  TList < TGCRecord >> );
var
  sbbhArr: TArray<string>;
  SBBH, key: string;
  PassRecList: TObjectList<TPassRec>;
  pass: TPassRec;
  gr: TGCRecord;
  sTime, eTime: double;
begin
  sbbhArr := sbbhs.Split([',']);
  for SBBH in sbbhArr do
  begin
    sTime := BeginTime;
    eTime := EndTime;
    if eTime - sTime > 1 then
      eTime := trunc(sTime + 1);
    while sTime < eTime do
    begin
      PassRecList := TDFS.SelectPassRecByKDBH(SBBH, sTime, eTime);
      // 按天取数，避免OutOfMemory
      for pass in PassRecList do
      begin
        if pass.HPHM <> '-' then
        begin
          key := pass.HPZL + '_' + pass.HPHM;
          gr.SBBH := pass.KDBH;
          gr.GCSJ := pass.GCSJ;
          if not data.ContainsKey(key) then
          begin
            data.Add(key, TList<TGCRecord>.Create);
          end;
          data[key].Add(gr);
        end;
      end;
      sTime := eTime;
      eTime := eTime + 1;
      if eTime > EndTime then
        eTime := EndTime;
    end;
    PassRecList.Free;
  end;
end;

procedure TBetweenTaskThread.CleanData(SBBH1, SBBH2: string;
  data: TDictionary < string, TList < TGCRecord >> );
var
  key, sbbhs: string;
begin
  sbbhs := SBBH1 + ',' + SBBH2;
  for key in data.Keys do
  begin
    Clean(sbbhs, data[key]);
  end;
end;

procedure TBetweenTaskThread.Clean(sbbhs: string; list: TList<TGCRecord>);
  procedure Sort(list: TList<TGCRecord>);
  var
    i, j: integer;
    o: TGCRecord;
  begin
    for i := 0 to list.Count - 2 do
    begin
      for j := i + 1 to list.Count - 1 do
      begin
        if list[i].GCSJ > list[j].GCSJ then
        begin
          o := list[i];
          list[i] := list[j];
          list[j] := o;
        end;
      end;
    end;
  end;

var
  arr: TArray<string>;
  b: boolean;
  i, p, n: integer;
begin
  Sort(list);
  arr := sbbhs.Split([',']);
  n := length(arr);
  p := 0;
  // 按 Sbbhs 的顺序 排列 list
  while p <= list.Count - n do
  begin
    b := true;
    for i := 0 to n - 1 do
    begin
      if list[p + i].SBBH <> arr[i] then
      begin
        b := false;
        break;
      end;
    end;

    if not b then
      list.Delete(p)
    else
      p := p + n;
  end;
  for i := p to list.Count - 1 do
  begin
    list.Delete(p);
  end;
end;

procedure TBetweenTaskThread.Execute;
var
  param: TBetweenParam;
  data: TDictionary<string, TList<TGCRecord>>;
  key: string;
begin
  gLogger.Info('[' + FTaskId + ']BetweenTask Start');
  try
    data := TDictionary < string, TList < TGCRecord >>.Create;
    param := LoadParamList;
    GetPassRec(param.SBBH1 + ',' + param.SBBH2, param.BeginTime,
      param.EndTime, data);
    CleanData(param.SBBH1, param.SBBH2, data);
    SaveResult(data, '完成', param.Interval);
  except
    on e: exception do
    begin
      SaveResult(nil, '分析失败,' + e.Message, 0);
      gLogger.Error('[' + FTaskId + ']BetweenTask Error ' + e.Message);
    end;
  end;

  for key in data.Keys do
  begin
    data[key].Free;
  end;
  data.Free;
  gLogger.Info('[' + FTaskId + ']BetweenTask End');
end;

procedure TBetweenTaskThread.SaveResult
  (dic: TDictionary<string, TList<TGCRecord>>; AStatus: String; interval: double);
var
  key, HPHM, HPZL: string;
  list: TList<TGCRecord>;
  item: TGCRecord;
  s: String;
begin
  s := '';
  if AStatus = '完成' then
  begin
    for key in dic.Keys do
    begin
      list := dic[key];
      if list[list.Count-1].GCSJ - list[0].GCSJ < interval then
      begin
        HPZL := copy(key, 1, pos('_', key) - 1);
        HPHM := copy(key, pos('_', key) + 1, 100);
        for item in list do
        begin
          s := s + ' insert into T_Analyse_BetweenTask_Result(SystemID, taskId, HPHM, HPZL, SBBH, GCSJ) '
            + ' values(''' + TGuid.NewGuid.ToString + ''',''' + FTaskId + ''','''
            + HPHM + ''',''' + HPZL + ''',''' + item.SBBH + ''',''' +
            FormatDatetime('yyyy/mm/dd hh:mm:ss', item.GCSJ) + ''') ';
        end;
      end;
    end;
    s := s + ' update T_Analyse_BetweenTask set Status=''完成'',FinishTime=getdate() where SystemId='''
      + FTaskId + '''';
  end
  else
    s := s + ' update T_Analyse_BetweenTask set Status=' + AStatus.QuotedString
      + ',FinishTime=getdate() where SystemId=''' + FTaskId + '''';
  gSQLHelper.ExecuteSql(s);
end;

function TBetweenTaskThread.LoadParamList: TBetweenParam;
var
  s: String;
begin
  result := TBetweenParam.Create;
  s := ' select TaskName, SBBH1, SBBH2, BeginTime, EndTime, interval from T_Analyse_BetweenTask '
    + ' where SystemId=''' + FTaskId + '''';
  with gSQLHelper.Query(s) do
  begin
    if not Eof then
    begin
      result.TaskID := FTaskId;
      result.TaskName := Fields[0].AsString;
      result.SBBH1 := Fields[1].AsString;
      result.SBBH2 := Fields[2].AsString;
      result.BeginTime := Fields[3].AsDateTime;
      result.EndTime := Fields[4].AsDateTime;
      result.Interval := Fields[5].AsFloat;
      Next;
    end;
    Free;
  end;
end;

end.
