unit uBaseThread;

interface

uses
  Classes, ActiveX;

type
  TBaseThread = class(TThread)
  private
    FPaused: boolean;
    FReallyPaused: boolean;
    procedure Execute; override;
  protected
    FSleep: integer;
    procedure Perform; virtual; abstract;
    procedure AfterTerminate; virtual; abstract;
    procedure Prepare; virtual; abstract;
  public
    constructor Create; overload;
    procedure Pause;
    procedure GoOn;
    function Paused: boolean;
  end;

implementation

{ TBaseThread }

constructor TBaseThread.Create;
begin
  ActiveX.CoInitialize(nil);
  self.FreeOnTerminate := false;
  FPaused := false;
  FReallyPaused := false;
  FSleep := 100;
  inherited;
end;

procedure TBaseThread.Execute;
begin
  Prepare;
  while not Terminated do
  begin
    if not FPaused then
    begin
      Perform;
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

function TBaseThread.Paused: boolean;
begin
  result := FReallyPaused;
end;

procedure TBaseThread.GoOn;
begin
  FPaused := false;
  FReallyPaused := false;
end;

end.
