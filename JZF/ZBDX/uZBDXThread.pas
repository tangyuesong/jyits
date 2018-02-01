unit uZBDXThread;

interface

uses
  System.Classes, SysUtils, uGlobal, ActiveX, uRequestItf;

type
  TZBDXThread = class(TThread)
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

  procedure TZBDXThread.UpdateCaption;
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

{ TZBDXThread }

procedure TZBDXThread.Execute;
var
  sms, sjhm, params: String;
begin
  gLogger.Info('Send SMS Started');
  ActiveX.CoInitialize(nil);
  with gSQLHelper.Query('select * from ZB_LIST where ZBSJ=''' +
    FormatDateTime('yyyy-mm-dd', Now() + 1) + '''') do
  begin
    if RecordCount > 0 then
    begin
      sms := '明天是您值班';
      if Trim(FieldByName('ZBLD').AsString) <> '' then
        sms := sms + ',值班领导:' + Trim(FieldByName('ZBLD').AsString);
      if Trim(FieldByName('ZBMJ').AsString) <> '' then
        sms := sms + ',值班民警:' + Trim(FieldByName('ZBMJ').AsString);
      if Trim(FieldByName('ZBXJ').AsString) <> '' then
        sms := sms + ',值班协警:' + Trim(FieldByName('ZBXJ').AsString);
      sms := sms + ',特此提醒';

      sjhm := '';
      if Trim(FieldByName('LDDH').AsString) <> '' then
        sjhm := Trim(FieldByName('LDDH').AsString);
      if Trim(FieldByName('MJDH').AsString) <> '' then
      begin
        if sjhm <> '' then
          sjhm := sjhm + ';';
        sjhm := sjhm + Trim(FieldByName('MJDH').AsString);
      end;
      if Trim(FieldByName('XJDH').AsString) <> '' then
      begin
        if sjhm <> '' then
          sjhm := sjhm + ';';
        sjhm := sjhm + Trim(FieldByName('XJDH').AsString);
      end;

      if sjhm <> '' then
      begin
        params := 'sn=-【交警支队】温馨提示&sjhm=' + sjhm + '&content=' + sms;
        gLogger.Info('Send SMS: ' + params);
        if TRequestItf.DbQuery('SendSMS', params) = '0' then
          gLogger.Error('Send SMS ERROR')
        else
          gLogger.Info('Send SMS SUCC');
      end;
    end;
    Free;
  end;
  ActiveX.CoUninitialize;
  gLogger.Info('Send SMS Ended');
end;

end.
