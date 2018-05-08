unit uUploadTempVio;

interface

uses
  System.Classes, uGlobal, uEntity, Generics.Collections, SysUtils, ActiveX,
  uRequestItf;

type
  TUploadTempVioThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure TUploadTempVioThread.UpdateCaption;
  begin
  Form1.Caption := 'Updated in a thread';
  end;

  or

  Synchronize(
  procedure
  begin
  Form1.Caption := 'Updated in thread via an anonymous method'
  end
  )
  );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ TUploadTempVioThread }

procedure TUploadTempVioThread.Execute;
var
  s, msg: String;
begin
  ActiveX.CoInitialize(nil);
  gLogger.Info('UploadTempVioThread Start');
  while True do
  begin
    s := ' select SYSTEMID from T_VIO_TEMP with(nolock) where bj=''0'' and wfxw<>''13441'' ';
    with gSQLHelper.Query(s) do
    begin
      while not Eof do
      begin
        msg := TRequestItf.DbQuery('UploadTempVio',
          'SYSTEMID=' + Fields[0].AsString);
        gLogger.Info('[UploadTempVioThread][' + Fields[0].AsString + ']' + msg);
        Next;
      end;
      Free;
    end;
    Sleep(2 * 1000);
  end;
end;

end.
