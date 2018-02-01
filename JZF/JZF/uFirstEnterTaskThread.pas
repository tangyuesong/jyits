unit uFirstEnterTaskThread;

interface

uses
  System.Classes, ActiveX, System.Generics.Collections,
  SysUtils, DateUtils;

type
  TFirstEnterEntity = class
    TaskId: string;
    TaskName: string;
    SBBH: string;
    BeginTime: TDateTime;
    EndTime: TDateTime;
    Days: integer;
  end;

  TFirstEnterTaskThread = class(TThread)
  private
    FTask: TFirstEnterEntity;
  protected
    procedure Execute; override;
  public
    constructor Create(AEntity: TFirstEnterEntity); overload;
  end;

implementation

uses
  uGlobal;

{ TFirstEnterTaskThread }

constructor TFirstEnterTaskThread.Create(AEntity: TFirstEnterEntity);
begin
  self.FreeOnTerminate := true;
  ActiveX.CoInitialize(nil);
  FTask := AEntity;
  inherited Create(false);
end;

procedure TFirstEnterTaskThread.Execute;
begin
  gLogger.Info('[' + FTask.TaskId + ']FirstEnterTask Start');
  gSQLHelper.ExecuteSql('getFirstEnter '''
    + FTask.TaskID + ''','''
    + FormatDateTime('yyyy/mm/dd', FTask.BeginTime) + ''','''
    + FormatDateTime('yyyy/mm/dd', FTask.EndTime) + ''','''
    + FTask.SBBH +''','
    + FTask.Days.ToString);
  gLogger.Info('[' + FTask.TaskId + ']FirstEnterTask Start');
  FTask.Free;
end;

end.
