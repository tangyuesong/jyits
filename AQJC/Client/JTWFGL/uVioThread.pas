unit uVioThread;

interface

uses
  System.SysUtils, System.Variants, System.Classes, uEntity, uGlobal, uDM,
  System.Generics.Collections, FireDAC.Comp.Client, uLogger, ActiveX, uCommon;

type
  TVio = class
    SystemID: String;
    VehInfo: TVehInfo;
    VioRecord: TViotemp;
    Downloaded: boolean;
    DoneVehInfo: boolean;
    Doned: boolean;
    Deleted: boolean;
    destructor Destroy; overload;
  end;

  TVioThread = class(TThread)
  private
    FList: TObjectList<TVio>;
    FStoped: boolean;
    FFinished: boolean;
  protected
    procedure Execute; override;
  public
    constructor Create; overload;
    destructor Destroy; override;
    procedure Add(vio: TVio);
    procedure Stop;
    property Finished: boolean read FFinished;
  end;

implementation

{ TVio }

destructor TVio.Destroy;
begin

end;

{ TVioThread }

procedure TVioThread.Add(vio: TVio);
begin
  FList.Add(vio);
  // logger.Trace('[Add]' + vio.VioRecord.SYSTEMID);
end;

constructor TVioThread.Create;
begin
  self.FreeOnTerminate := true;
  FList := TObjectList<TVio>.Create;
  FStoped := false;
  FFinished := false;
  inherited Create;
end;

destructor TVioThread.Destroy;
begin
  FList.Free;
  inherited;
end;

procedure TVioThread.Execute;
var
  i: integer;
  obj: TVio;
  tp, fwqdz: string;
begin
  inherited;
  ActiveX.CoInitialize(nil);
  while not FStoped do
  begin
    i := 0;
    while i < FList.Count do
    begin
      obj := FList[i];
      if obj.Deleted then
      begin
        // logger.Trace('[Remove]' + obj.VioRecord.SYSTEMID);
        FList.Remove(obj);
        Dec(i);
      end
      else
      begin
        if not obj.Downloaded then
        begin
          try
            fwqdz := obj.VioRecord.fwqdz;
            tp := obj.VioRecord.PHOTOFILE1;
            TCommon.GetPic(fwqdz, tp, gSetup.DirSave + '\' + obj.SystemID +
              '_1.jpg');

            tp := obj.VioRecord.PHOTOFILE2;
            if tp <> '' then
            begin
              TCommon.GetPic(fwqdz, tp, gSetup.DirSave + '\' + obj.SystemID +
                '_2.jpg');
            end;

            tp := obj.VioRecord.PHOTOFILE3;
            if tp <> '' then
            begin
              TCommon.GetPic(fwqdz, tp, gSetup.DirSave + '\' + obj.SystemID +
                '_3.jpg');
            end;
            obj.Downloaded := true;
          except
            on e: exception do
              // logger.Error('[ERROR Download]' + obj.VioRecord.SYSTEMID + #13 + e.Message);
          end;
        end;

        if not obj.DoneVehInfo then
        begin
          try
            obj.VehInfo := TCommon.GetVehInfo(obj.VioRecord.hphm,
              obj.VioRecord.hpzl, '');
            obj.DoneVehInfo := true;
          except
            on e: exception do
              // logger.Error('[ERROR GetVehInfo]' + obj.VioRecord.ID + #13 + e.Message);
          end;

        end;
      end;
      inc(i);
    end;
    Sleep(100);
  end;
  FFinished := true;
  ActiveX.CoUninitialize;
end;

procedure TVioThread.Stop;
begin
  FStoped := true;
end;

end.
