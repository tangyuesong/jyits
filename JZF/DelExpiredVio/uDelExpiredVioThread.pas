unit uDelExpiredVioThread;

interface

uses
  System.Classes, ActiveX, uGlobal;

type
  TDelExpiredVioThread = class(TThread)
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

  procedure TDelExpiredVioThread.UpdateCaption;
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

{ TDelExpiredVioThread }

procedure TDelExpiredVioThread.Execute;
var
  s: String;
begin
  ActiveX.CoInitialize(nil);
  gLogger.Info('Delete Expired Vio Start');
  s := 'update t_vio_temp set bj=''4'', bz=''过期数据，自动删除'' where datediff(d, wfsj, getdate()) > 15 and bj=''0''';
  if gSQLHelper.ExecuteSql(s) then
    gLogger.Info('Delete OK')
  else
    gLogger.Error('Delete Error');
  gLogger.Info('Delete Expired Vio End');
  ActiveX.CoUninitialize;
end;

end.
