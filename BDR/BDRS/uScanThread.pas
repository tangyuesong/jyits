unit uScanThread;

interface

uses
  System.Classes, ActiveX, DB, System.Generics.Collections, System.NetEncoding,
  SysUtils, uCommon, uEntity, uBllThread, uDM;

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
  request: TRequest;
  list: TList<TRequest>;
  stream: TStream;
begin
  list := TList<TRequest>.Create;
  with DM.Query('SELECT SYSID,DOCUMENT,HTTP_METHOD,PARAMS,PARAMS_BLOB,POST_STREAM,IS_STREAM,APP_NAME FROM T_REQUEST WHERE RKSJ>SYSDATE-0.2') do  // 3∑÷÷”ƒ⁄
  begin
    while not Eof do
    begin
      request.SYSID := Fields[0].AsString;
      request.DOCUMENT := Fields[1].AsString;
      request.HTTP_METHOD := Fields[2].AsInteger;
      request.PARAMS := '';
      if not Fields[3].IsNull then
        request.PARAMS := Fields[3].AsString;
      if not Fields[4].IsNull then
      begin
        stream := TStringStream.Create;
        TBlobField(Fields[4]).SaveToStream(stream);
        request.PARAMS := TStringStream(stream).DataString;
        stream.Free;
      end;
      request.POST_STREAM := nil;
      if not Fields[5].IsNull then
      begin
        stream := TMemoryStream.Create;
        TBlobField(Fields[5]).SaveToStream(stream);
        request.POST_STREAM := stream;
      end;
      request.IS_STREAM := Fields[6].AsInteger = 1;
      request.AppName := Fields[7].AsString;
      request.AppName := request.AppName.ToUpper;

      list.Add(request);
      logger.Debug(request.DOCUMENT + request.PARAMS);
      Next;
    end;
    Close;
    Connection.Close;
    Connection.Free;
    Connection := nil;
    Free;
  end;
  for request in list do
  begin
    TBllThread.Create(request);
    DM.ExecuteSql('DELETE FROM T_REQUEST WHERE SYSID=''' + request.SYSID + '''');
  end;
  list.Free;
end;

procedure TScanThread.Stop;
begin
  FStoped := true;
end;

end.
