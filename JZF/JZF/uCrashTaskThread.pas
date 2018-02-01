unit uCrashTaskThread;

interface

uses
  System.Classes, ActiveX, System.Generics.Collections,
  SysUtils, uPassRec, uGlobal, ADODB, uDFS;

type
  TCrashParam = class
    SBBH: string;
    BeginTime: double;
    EndTime: double;
  end;

  TCrashTaskResult = class
    HPHM: string;
    HPZL: string;
    Rate: double;
    SBBHList: TStrings;
  end;

  TCrashTaskThread = class(TThread)
  private
    FTaskId: string;
    FRate: double;
    function LoadParamList: TObjectList<TCrashParam>;
    function GetAllHphm(paramList: TList<TCrashParam>)
      : TDictionary<string, TCrashTaskResult>;
    function GetTopNHphm(allHphmDic: TDictionary<string, TCrashTaskResult>;
      Rate: double): TList<TCrashTaskResult>;
    procedure SaveResult(list: TList<TCrashTaskResult>; AStatus: string);
  protected
    procedure Execute; override;
  public
    constructor Create(taskid: string; Rate: double); overload;
  end;

implementation

{ TCrashTaskThread }

constructor TCrashTaskThread.Create(taskid: string; Rate: double);
begin
  self.FreeOnTerminate := true;
  ActiveX.CoInitialize(nil);
  FTaskId := taskid;
  FRate := Rate;
  inherited Create(false);
end;

procedure TCrashTaskThread.Execute;
var
  paramList: TObjectList<TCrashParam>;
  allHphmDic: TDictionary<string, TCrashTaskResult>;
  topNHphmList: TList<TCrashTaskResult>;
  key: string;
  ctr: TCrashTaskResult;
begin
  gLogger.Info('[' + FTaskId + ']CrashTask Start');
  try
    paramList := LoadParamList;
    allHphmDic := GetAllHphm(paramList);
    topNHphmList := GetTopNHphm(allHphmDic, FRate);
    SaveResult(topNHphmList, '完成');
  except
    on e: exception do
    begin
      SaveResult(nil, '分析失败,' + e.Message);
      gLogger.Error('[' + FTaskId + ']CrashTask Error ' + e.Message);
    end;
  end;

  for key in allHphmDic.Keys do
  begin
    ctr := allHphmDic[key];
    ctr.SBBHList.Free;
    ctr.Free;
  end;

  allHphmDic.Free;
  topNHphmList.Free;
  paramList.Free;
  gLogger.Info('[' + FTaskId + ']CrashTask End');
end;

procedure TCrashTaskThread.SaveResult(list: TList<TCrashTaskResult>;
  AStatus: string);
var
  ctr: TCrashTaskResult;
  s: String;
begin
  s := '';
  if AStatus = '完成' then
  begin
    for ctr in list do
      s := s + ' insert into T_Analyse_CrashTask_Result(taskId, HPHM, HPZL, HitCount, HitRate, SBBH) '
        + ' values(''' + FTaskId + ''',''' + ctr.HPHM + ''',''' + ctr.HPZL +
        ''',''' + inttostr(ctr.SBBHList.Count) + ''',''' +
        Format('%.2f', [ctr.Rate]) + ''',''' + ctr.SBBHList.Text + ''')';
    s := s + ' update T_Analyse_CrashTask set Status=''完成'',FinishTime=getdate() where SystemId='''
      + FTaskId + '''';
  end
  else
    s := ' update T_Analyse_CrashTask set Status=' + AStatus.QuotedString +
      ',FinishTime=getdate() where SystemId=''' + FTaskId + '''';
  gSQLHelper.ExecuteSql(s);
end;

function TCrashTaskThread.GetTopNHphm(allHphmDic
  : TDictionary<string, TCrashTaskResult>; Rate: double)
  : TList<TCrashTaskResult>;
  function GetIndex(list: TList<TCrashTaskResult>;
    ctr: TCrashTaskResult): integer;
  begin
    if ctr.Rate > Rate then
    begin
      result := 0;
      while (result < list.Count) and (ctr.Rate < list[result].Rate) do
        result := result + 1;
    end
    else
      result := -1;
  end;

var
  key: string;
  ctr: TCrashTaskResult;
  index: integer;
begin
  result := TList<TCrashTaskResult>.Create;
  for key in allHphmDic.Keys do
  begin
    ctr := allHphmDic[key];
    index := GetIndex(result, ctr);
    if index >= 0 then
    begin
      result.Insert(index, ctr);
    end;
  end;

  while result.Count > 100 do
  begin
    result.Delete(result.Count - 1);
  end;
end;

function TCrashTaskThread.GetAllHphm(paramList: TList<TCrashParam>)
  : TDictionary<string, TCrashTaskResult>;
var
  param: TCrashParam;
  PassRecList: System.Generics.Collections.TObjectList<TPassRec>;
  pass: TPassRec;
  tmp: TCrashTaskResult;
  paramIndex: integer;
begin
  result := TDictionary<string, TCrashTaskResult>.Create;
  paramIndex := 0;
  for param in paramList do
  begin
    paramIndex := paramIndex + 1;
    PassRecList := TDFS.SelectPassRecByKDBH(param.SBBH, param.BeginTime,
      param.EndTime);
    for pass in PassRecList do
    begin
      if pass.HPHM <> '-' then
      begin
        if not result.ContainsKey(pass.HPHM + pass.HPZL) then
        begin
          tmp := TCrashTaskResult.Create;
          tmp.HPHM := pass.HPHM;
          tmp.HPZL := pass.HPZL;
          tmp.SBBHList := TStringList.Create;
          tmp.SBBHList.Add(paramIndex.ToString + '-' + param.SBBH);
          result.Add(pass.HPHM + pass.HPZL, tmp);
        end
        else
        begin
          tmp := result[pass.HPHM + pass.HPZL];
          if tmp.SBBHList.IndexOf(paramIndex.ToString + '-' + param.SBBH) = -1
          then
          begin
            tmp.SBBHList.Add(paramIndex.ToString + '-' + param.SBBH);
          end;
        end;
        tmp.Rate := tmp.SBBHList.Count * 100 / paramList.Count;
      end;
    end;
  end;
end;

function TCrashTaskThread.LoadParamList: TObjectList<TCrashParam>;
var
  param: TCrashParam;
  s: String;
begin
  result := TObjectList<TCrashParam>.Create;
  s := ' select SBBH,BeginTime,EndTime from T_Analyse_CrashTask_Input ' +
    ' where taskid=''' + FTaskId + '''';
  with gSQLHelper.Query(s) do
  begin
    while not Eof do
    begin
      param := TCrashParam.Create;
      param.SBBH := Fields[0].AsString;
      param.BeginTime := Fields[1].AsDateTime;
      param.EndTime := Fields[2].AsDateTime;
      result.Add(param);
      Next;
    end;
    Free;
  end;
end;

end.
