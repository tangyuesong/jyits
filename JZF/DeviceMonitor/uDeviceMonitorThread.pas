unit uDeviceMonitorThread;

interface

uses
  System.Classes, SysUtils, ActiveX, uLogger, uGlobal, uRequestItf;

type
  TDeviceMonitorThread = class(TThread)
  private
  protected
    procedure Execute; override;
  public

  end;

implementation

{ TDeviceMonitorThread }

procedure TDeviceMonitorThread.Execute;
var
  s, xzqh: string;
begin
  FreeOnTerminate := true;
  ActiveX.CoInitialize(nil);
  if gDeviceMonitorSJHM.Count > 0 then
  begin
    gLogger.Info('DeviceMonitorThread Started');
    with gSQLHelper.Query('p_DeviceStatusMonitor') do
    begin
      while not Eof do
      begin
        xzqh := Copy(FieldByName('SBDDMC').AsString, 1, 6);
        if gDeviceMonitorSJHM.ContainsKey(xzqh) then
        begin
          s := FieldByName('SBDDMC').AsString + #13#10 + FieldByName('SBBH')
            .AsString + #13#10 + FieldByName('GXSJ').AsString;
          TRequestItf.DbQuery('SendSMS', 'sn=…Ë±∏“Ï≥£&sjhm=' + gDeviceMonitorSJHM
            [xzqh] + '&content=' + s);
        end;
        Next;
      end;
      Free;
    end;
    gLogger.Info('DeviceMonitorThread Finished');
  end;
end;

end.
