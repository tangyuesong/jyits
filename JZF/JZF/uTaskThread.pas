unit uTaskThread;

interface

uses
  System.Classes, Variants, uGlobal, uBetweenTaskThread, uCrashTaskThread,
  uFollowTaskThread, uFirstEnterTaskThread;

type
  TTaskThread = class(TThread)
  private
    procedure DoBetweenTask(AIsFirstRun: Boolean);
    procedure DoCrashTask(AIsFirstRun: Boolean);
    procedure DoFollowTask(AIsFirstRun: Boolean);
    procedure DoFirstEnterTask(AIsFirstRun: Boolean);
  protected
    procedure Execute; override;
  end;

implementation

{ TTaskThread }

procedure TTaskThread.DoBetweenTask(AIsFirstRun: Boolean);
var
  s: string;
begin
  s := ' select SystemID from T_Analyse_BetweenTask ' +
    ' where Status = ''待分析'' ';
  if AIsFirstRun then
    s := s + ' or Status=''分析中'' ';
  with gSQLHelper.Query(s) do
  begin
    while not Eof do
    begin
      if gSQLHelper.ExecuteSql
        ('update T_Analyse_BetweenTask set Status=''分析中'' where SystemID=''' +
        Fields[0].AsString + '''') then
        TBetweenTaskThread.Create(Fields[0].AsString);
      Next;
    end;
    Free;
  end;
end;

procedure TTaskThread.DoCrashTask(AIsFirstRun: Boolean);
var
  s: String;
begin
  s := 'select SystemID, Rate from T_Analyse_CrashTask ' +
    ' where Status = ''待分析'' ';
  if AIsFirstRun then
    s := s + ' or Status=''分析中'' ';
  with gSQLHelper.Query(s) do
  begin
    while not Eof do
    begin
      if gSQLHelper.ExecuteSql
        ('update T_Analyse_CrashTask set Status=''分析中'' where SystemID=''' +
        Fields[0].AsString + '''') then
        TCrashTaskThread.Create(Fields[0].AsString, Fields[1].AsFloat);
      Next;
    end;
    Free;
  end;
end;

procedure TTaskThread.DoFollowTask(AIsFirstRun: Boolean);
var
  s: String;
  item: TFollowEntity;
begin
  s := 'select * from T_Analyse_FollowTask where Status = ''待分析'' ';
  if AIsFirstRun then
    s := s + ' or Status=''分析中'' ';
  with gSQLHelper.Query(s) do
  begin
    while not Eof do
    begin
      s := 'update T_Analyse_FollowTask set Status=''分析中'' where SystemID='''
        + FieldByName('SYSTEMID').AsString + '''';
      if gSQLHelper.ExecuteSql(s) then
      begin
        item := TFollowEntity.Create;
        item.TaskID := FieldByName('SYSTEMID').AsString;
        item.TaskName := FieldByName('TaskName').AsString;
        item.HPHM := FieldByName('HPHM').AsString;
        item.HPZL := FieldByName('HPZL').AsString;
        item.BeginTime := VarToDateTime(FieldByName('BeginTime').AsString);
        item.EndTime := VarToDateTime(FieldByName('EndTime').AsString);
        item.Rate := FieldByName('Rate').AsFloat;
        item.K08 := FieldByName('K08').AsInteger = 1;
        TFollowTaskThread.Create(item);
      end;
      Next;
    end;
    Free;
  end;
end;

procedure TTaskThread.DoFirstEnterTask(AIsFirstRun: Boolean);
var
  s: String;
  item: TFirstEnterEntity;
begin
  s := 'select * from T_Analyse_FirstEnterTask where Status = ''待分析'' ';
  if AIsFirstRun then
    s := s + ' or Status=''分析中'' ';
  with gSQLHelper.Query(s) do
  begin
    while not Eof do
    begin
      s := 'update T_Analyse_FirstEnterTask set Status=''分析中'' where SystemID='''
        + FieldByName('SYSTEMID').AsString + '''';
      if gSQLHelper.ExecuteSql(s) then
      begin
        item := TFirstEnterEntity.Create;
        item.TaskID := FieldByName('SYSTEMID').AsString;
        item.TaskName := FieldByName('TaskName').AsString;
        item.SBBH := FieldByName('SBBH').AsString;
        item.BeginTime := VarToDateTime(FieldByName('BeginTime').AsString);
        item.EndTime := VarToDateTime(FieldByName('EndTime').AsString);
        item.Days := FieldByName('Days').AsInteger;
        TFirstEnterTaskThread.Create(item);
      end;
      Next;
    end;
    Free;
  end;
end;

procedure TTaskThread.Execute;
var
  IsFirstRun: Boolean;
begin
  IsFirstRun := True;
  while True do
  begin
    DoBetweenTask(IsFirstRun);
    DoCrashTask(IsFirstRun);
    DoFollowTask(IsFirstRun);
    DoFirstEnterTask(IsFirstRun);
    IsFirstRun := False;
    Sleep(60 * 1000);
  end;
end;

end.
