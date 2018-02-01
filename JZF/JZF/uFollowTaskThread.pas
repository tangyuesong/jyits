unit uFollowTaskThread;

interface

uses
  System.Classes, ActiveX, System.Generics.Collections,
  SysUtils, DateUtils, uDFS, uPassRec;

const
  GCSJOffset = OneMinute * 5;

type
  TFollowEntity = class
    TaskId: string;
    TaskName: string;
    HPHM: string;
    HPZL: string;
    BeginTime: TDateTime;
    EndTime: TDateTime;
    Rate: double;
    K08: boolean;
  end;

  TFollowParam = class
    SBBH: string;
    BeginTime: double;
    EndTime: double;
  end;

  TFollowTaskResult = class
    HPHM: string;
    HPZL: string;
    CLPP: string;
    CSYS: string;
    Rate: double;
    SBBHList: TStrings;
  end;

  TFollowTaskThread = class(TThread)
  private
    FTask: TFollowEntity;
    function LoadParamList: TObjectList<TFollowParam>;
    function GetAllHphm(paramList: TList<TFollowParam>)
      : TDictionary<string, TFollowTaskResult>;
    function GetAllHphmK08(
      paramList: TList<TFollowParam>): TDictionary<string, TFollowTaskResult>;
    function GetTopNHphm(allHphmDic: TDictionary<string, TFollowTaskResult>;
      Rate: double): TList<TFollowTaskResult>;
    procedure SaveResult(list: TList<TFollowTaskResult>;
      AStatus: string = '完成');
  protected
    procedure Execute; override;
  public
    constructor Create(AEntity: TFollowEntity); overload;
  end;

implementation

uses
  uGlobal;

{ TFollowTaskThread }

constructor TFollowTaskThread.Create(AEntity: TFollowEntity);
begin
  self.FreeOnTerminate := true;
  ActiveX.CoInitialize(nil);
  FTask := AEntity;
  inherited Create(false);
end;

procedure TFollowTaskThread.Execute;
var
  paramList: TObjectList<TFollowParam>;
  allHphmDic: TDictionary<string, TFollowTaskResult>;
  topNHphmList: TList<TFollowTaskResult>;
  key: string;
  ctr: TFollowTaskResult;
begin
  gLogger.Info('[' + FTask.TaskId + ']FollowTask Start');
  paramList := LoadParamList;
  try
    if FTask.K08 then
      allHphmDic := GetAllHphmK08(paramList)
    else
      allHphmDic := GetAllHphm(paramList);
    topNHphmList := GetTopNHphm(allHphmDic, FTask.Rate);
    SaveResult(topNHphmList);
  except
    on e: exception do
    begin
      SaveResult(topNHphmList, '分析失败,' + e.Message);
      gLogger.Error('[' + FTask.TaskId + ']FollowTask Error ' + e.Message);
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
  gLogger.Info('[' + FTask.TaskId + ']FollowTask Start');
  FTask.Free;
end;

procedure TFollowTaskThread.SaveResult(list: TList<TFollowTaskResult>;
  AStatus: string);
var
  ctr: TFollowTaskResult;
  s: String;
begin
  s := '';
  if AStatus = '完成' then
  begin
    for ctr in list do
    begin
      s := s + ' insert into T_Analyse_FollowTask_Result(taskId, HPHM, HPZL, CLPP, CSYS, HitCount, HitRate) '
        + ' values(''' + FTask.TaskId + ''',''' + ctr.HPHM + ''',''' + ctr.HPZL + ''','''
        + ctr.CLPP + ''',''' + ctr.CSYS +
        ''',''' + inttostr(ctr.SBBHList.Count) + ''',''' +
        Format('%.2f', [ctr.Rate]) + ''')';
    end;
    s := s + ' update T_Analyse_FollowTask set Status=''完成'',FinishTime=getdate() where SystemId='''
      + FTask.TaskId + '''';
  end
  else
    s := ' update T_Analyse_FollowTask set Status=' + AStatus.QuotedString +
      ',FinishTime=getdate() where SystemId=''' + FTask.TaskId + '''';
  gSQLHelper.ExecuteSql(s);
end;

function TFollowTaskThread.GetTopNHphm(allHphmDic
  : TDictionary<string, TFollowTaskResult>; Rate: double)
  : TList<TFollowTaskResult>;
  function GetIndex(list: TList<TFollowTaskResult>;
    ctr: TFollowTaskResult): integer;
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
  ctr: TFollowTaskResult;
  index: integer;
begin
  result := TList<TFollowTaskResult>.Create;
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

function TFollowTaskThread.GetAllHphm(paramList: TList<TFollowParam>)
  : TDictionary<string, TFollowTaskResult>;
var
  param: TFollowParam;
  PassRecList: System.Generics.Collections.TObjectList<TPassRec>;
  pass: TPassRec;
  tmp: TFollowTaskResult;
  paramIndex: integer;
  kdbh, kssj, jssj, s: string;
begin
  result := TDictionary<string, TFollowTaskResult>.Create;
  paramIndex := 0;
  for param in paramList do
  begin
    paramIndex := paramIndex + 1;
    PassRecList := TDFS.SelectPassRecByKDBH(param.SBBH, param.BeginTime, param.EndTime);
    for pass in PassRecList do
    begin
      if (pass.HPHM <> '-') and (pass.HPHM <> FTask.HPHM) then
      begin
        if not result.ContainsKey(pass.HPHM + pass.HPZL) then
        begin
          tmp := TFollowTaskResult.Create;
          tmp.HPHM := pass.HPHM;
          tmp.HPZL := pass.HPZL;
          tmp.CLPP := pass.CLPP;
          tmp.CSYS := pass.CSYS;
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

function TFollowTaskThread.GetAllHphmK08(paramList: TList<TFollowParam>)
  : TDictionary<string, TFollowTaskResult>;
var
  param: TFollowParam;
  PassRecList: System.Generics.Collections.TObjectList<TPassRec>;
  pass: TPassRec;
  tmp: TFollowTaskResult;
  paramIndex: integer;
  kssj, jssj, s, key: string;
begin
  result := TDictionary<string, TFollowTaskResult>.Create;
  paramIndex := 0;
  for param in paramList do
  begin
    paramIndex := paramIndex + 1;
    kssj := formatdatetime('yyyy-mm-dd hh:mm:ss.zzz', param.BeginTime);
    kssj := kssj.Replace(' ', 'T') + 'Z';
    jssj := formatdatetime('yyyy-mm-dd hh:mm:ss.zzz', param.EndTime);
    jssj := jssj.Replace(' ', 'T') + 'Z';
    s := 'kssj='+kssj +'&jssj='+jssj+'&page=1&pagesize=10000&kdbh=' + param.SBBH;
    PassRecList := TDFS.GetPassRecListFromK08(s);

    for pass in PassRecList do
    begin
      if (pass.CSYS <> '') and (pass.CLPP <> '') then
      begin
        key := pass.CLPP + pass.CSYS;
        if not result.ContainsKey(key) then
        begin
          tmp := TFollowTaskResult.Create;
          tmp.HPHM := pass.HPHM;
          tmp.HPZL := pass.HPZL;
          tmp.CLPP := pass.CLPP;
          tmp.CSYS := pass.CSYS;
          tmp.SBBHList := TStringList.Create;
          tmp.SBBHList.Add(paramIndex.ToString + '-' + param.SBBH);
          result.Add(key, tmp);
        end
        else
        begin
          tmp := result[key];
          if tmp.SBBHList.IndexOf(paramIndex.ToString + '-' + param.SBBH) = -1 then
          begin
            tmp.SBBHList.Add(paramIndex.ToString + '-' + param.SBBH);
          end;
          if not tmp.HPHM.Contains(pass.HPHM) then
          begin
            tmp.HPHM := tmp.HPHM + ',' + pass.HPHM;
          end;
        end;
        tmp.Rate := tmp.SBBHList.Count * 100 / paramList.Count;
      end;
    end;
  end;
end;

function TFollowTaskThread.LoadParamList: TObjectList<TFollowParam>;
var
  param: TFollowParam;
  passList: TObjectList<TPassRec>;
  pass: TPassRec;
begin
  result := TObjectList<TFollowParam>.Create;
  passList := TDFS.SelectPassRecByHPHM(FTask.HPZL, FTask.HPHM, FTask.BeginTime, FTask.EndTime);
  for pass in passList do
  begin
    param := TFollowParam.Create;
    param.SBBH := pass.KDBH;
    param.BeginTime := pass.GCSJ - GCSJOffset;
    param.EndTime := pass.GCSJ + GCSJOffset;
    result.Add(param);
  end;
  passList.Free;
end;

end.
