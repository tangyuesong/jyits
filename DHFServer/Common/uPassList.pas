unit uPassList;

interface

uses
  SysUtils, Classes, System.Generics.Collections, SyncObjs, DateUtils,
  uGlobal, uTypes;

type
  TPassList = class
  private
    cs: TCriticalSection;
    FLastTime: Double;
    FList: TList<TPass>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(pass: TPass);
  end;

var
  PassList: TPassList;

implementation
uses
  uInterface;
procedure TPassList.Add(pass: TPass);
var
  tmp: TList<TPass>;
begin
  cs.Enter;
  FList.Add(pass);
  if (FList.Count >= 1000)or(now - FLastTime > OneSecond * 20) then
  begin
    FLastTime := now;
    tmp := FList;
    FList := TList<TPass>.Create;  // 避免阻塞所有线程
    cs.Leave;
    Tmypint.SavePass(tmp);
    tmp.Free;
  end
  else
    cs.Leave;
end;

constructor TPassList.Create;
begin
  cs := TCriticalSection.Create;
  FList := TList<TPass>.Create;
  FLastTime := now;
end;

destructor TPassList.Destroy;
begin
  if FList.Count >= 0 then
  begin
    Tmypint.SavePass(FList);
  end;
  FList.Free;
  cs.Free;
  inherited;
end;

end.
