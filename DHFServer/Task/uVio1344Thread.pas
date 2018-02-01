unit uVio1344Thread;

interface

uses
  Classes, SysUtils, Generics.Collections, Variants, ActiveX, uTypes, uLogger,
  uGlobal, uCommon, uTmri;

type
  TVio1344Thread = class(TThread)
  private
    FStoped: boolean;
    FQueue: TQueue<TVioTemp>;
    function GetCllx(hphm, hpzl: string): string;
    procedure SaveVio(vio: TVioTemp);
  protected
    procedure Execute; override;
  public
    constructor Create(); overload;
    destructor Destroy; override;
    procedure Push(AVio: TVioTemp);
    procedure Stop;
  end;

var
  vio1344Thread: TVio1344Thread;

implementation

{ TMyThread }

constructor TVio1344Thread.Create();
begin
  FQueue := TQueue<TVioTemp>.Create;
  FStoped := false;
  inherited Create(false);
end;

destructor TVio1344Thread.Destroy;
begin
  FQueue.Free;
  inherited;
end;

procedure TVio1344Thread.Execute;
var
  vio: TVioTemp;
  cllx: string;
begin
  ActiveX.CoInitialize(nil);
  logger.Info('Vio1344Thread start');
  while not FStoped do
  begin
    while FQueue.Count > 0 do
    begin
      vio := FQueue.Dequeue;
      cllx := GetCllx(vio.hphm, vio.hpzl);
      if (Pos('H1', cllx) > 0) or (Pos('H2', cllx) > 0) then
      begin
        logger.Debug('[1344]' + vio.HPHM + ' ' + vio.HPZL + ' ' + cllx);
        vio.WFXW := '1344';
        SaveVio(vio);
      end;
    end;

    Sleep(1000);
  end;
end;

function TVio1344Thread.GetCllx(hphm, hpzl: string): string;
var
  json: string;
begin
  result := 'X99';
  if TmriXLH <> '' then
  begin
    json := TTmri.GetVehInfo(hphm,hpzl,'');
    if json <> '' then
    begin
      result := json.Substring(json.IndexOf('<cllx>') + 6, 3);
      logger.Trace(result + #9 + json);
    end;
  end;
end;

procedure TVio1344Thread.Push(AVio: TVioTemp);
begin
  FQueue.Enqueue(AVio);
end;

procedure TVio1344Thread.SaveVio(vio: TVioTemp);
var
  SQL: string;
begin
  SQL := 'insert into t_vio_temp (cjjg,hphm,hpzl,csys,clpp,wfdd,wfxw,wfsj,cd,xzsd,zdxs,zgxs,sjsd,PHOTOFILE1,PHOTOFILE2,PHOTOFILE3,FWQDZ,BJ)'
    + ' values ' + '(' + vio.CJJG.QuotedString + ',' + vio.hphm.QuotedString +
    ',' + vio.hpzl.QuotedString + ',' + vio.CSYS.QuotedString + ',' +
    vio.CLPP.QuotedString + ',' + vio.WFDD.QuotedString + ',' +
    vio.WFXW.QuotedString + ',' +
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', vio.WFSJ)) + ',' +
    vio.CD.QuotedString + ',' + IntToStr(vio.XZSD) + ',' + IntToStr(vio.ZGXS) +
    ',' + IntToStr(vio.ZDXS) + ',' + vio.SJSD.ToString() + ',' +
    vio.PHOTOFILE1.QuotedString + ',' + vio.PHOTOFILE2.QuotedString + ',' +
    vio.PHOTOFILE3.QuotedString + ',' + vio.fwqdz.QuotedString + ',''0'')';
  sqlhelper.ExecuteSql(SQL);
end;

procedure TVio1344Thread.Stop;
begin
  FStoped := true;
end;

end.
