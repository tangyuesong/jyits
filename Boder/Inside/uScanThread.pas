unit uScanThread;

interface

uses
  System.Classes, ActiveX, DB, System.Generics.Collections, System.NetEncoding,
  uCommon, uBllThread;

type
  TScanThread = class(TThread)
  private
    FStoped: boolean;
    procedure Scan;
  protected
    procedure Execute; override;
  public
    constructor Create; overload;
    procedure Stop;
  end;

implementation

{ TScanThread }

constructor TScanThread.Create;
begin
  FreeOnTerminate := true;
  FStoped := false;
  inherited Create(false);
end;

procedure TScanThread.Execute;
begin
  ActiveX.CoInitialize(nil);
  while not FStoped do
  begin
    Scan;
    Sleep(100);
  end;
  ActiveX.CoUninitialize;
end;

procedure TScanThread.Scan;
var
  AIn: TIn;
  list: TList<TIn>;
  stream: TStringStream;
begin
  list := TList<TIn>.Create;
  with SQLHelper.Query('SELECT sysid,cmd,body,text FROM T_IN where rksj>sysdate-1') do  // todo: rksj
  begin
    while not Eof do
    begin
      AIn.SYSID := Fields[0].AsString;
      AIn.CMD := Fields[1].AsString;
      AIn.BODY := Fields[2].AsString;
      //AIn.BODY := TNetEncoding.Base64.Decode(AIn.BODY);
      AIn.LBLOB := '';
      if not Fields[3].IsNull then
      begin
        stream := TStringStream.Create;
        TBlobField(Fields[3]).SaveToStream(stream);
        AIn.LBLOB := stream.DataString;
        stream.Free;
      end;
      list.Add(AIn);
      logger.Info(AIn.CMD + AIn.BODY);
      Next;
    end;
    Close;
    Connection.Close;
    Connection.Free;
    Free;
  end;
  for AIn in list do
  begin
    TBllThread.Create(AIn);
    SQLHelper.ExecuteSql('DELETE FROM T_IN WHERE SYSID=''' + AIn.SYSID + '''');
  end;
  list.Free;
end;

procedure TScanThread.Stop;
begin
  FStoped := true;
end;

end.
