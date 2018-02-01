unit uBaseThread;

interface

uses
  Classes, SysUtils, ActiveX;

type
  TThreadStatus = (tsRunning, tsPaused, tsFinished, tsDead);

  TBaseThread = class(TThread)
  private
    FLastTime: double;
    FDuration: double;
    procedure Execute; override;
    function GetStatus: TThreadStatus;
  protected
    FReallyPaused: boolean;
    FPaused: boolean;
    FSleep: integer;
    procedure Perform; virtual; abstract;
    procedure AfterTerminate; virtual; abstract;
    procedure Prepare; virtual; abstract;
  public
    constructor Create; overload;
    procedure Pause;
    procedure GoOn;
    property Status: TThreadStatus read GetStatus;
  end;

implementation

{ TBaseThread }

constructor TBaseThread.Create;
begin
  ActiveX.CoInitialize(nil);
  self.FreeOnTerminate := false;
  FPaused := false;
  FReallyPaused := false;
  FSleep := 1000;
  FDuration := 0;
  inherited;
end;

procedure TBaseThread.Execute;
var
  d: double;
begin
  Prepare;
  while not Terminated do
  begin
    FLastTime := now;
    if not FPaused then
    begin
      d := now;
      Perform;
      d := now - d;
      if FDuration < d then
        FDuration := d;
    end
    else
      FReallyPaused := true;
    Sleep(FSleep);
  end;
  AfterTerminate;
end;

procedure TBaseThread.Pause;
begin
  FPaused := true;
end;

function TBaseThread.GetStatus: TThreadStatus;
begin
  if self.Finished then exit(tsFinished);
  if self.FReallyPaused then exit(tsPaused);
  if now - FLastTime >  FSleep/1000/60/60/24 + FDuration * 2 then exit(tsDead);
  exit(tsRunning);
end;

procedure TBaseThread.GoOn;
begin
  FPaused := false;
  FReallyPaused := false;
end;

end.
