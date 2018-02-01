unit uKKAlarm;

interface

uses
  System.Classes, uGlobal, uEntity, uHik, Generics.Collections, SysUtils,
  uDecodeHikResult;

type
  TKKAlarmThread = class(TThread)
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

  procedure TKKAlarmThread.UpdateCaption;
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

{ TKKAlarmThread }

procedure TKKAlarmThread.Execute;
var
  b: Boolean;
  s, msg: String;
  sqls: TStrings;
  Vehs: TList<TDFVehInfo>;
  veh: TDFVehInfo;
begin
  gLogger.Info('KKAlarmThread Start');
  sqls := TStringList.Create;
  while True do
  begin
    s := ' select * from [dbo].[T_KK_ALARM] with(nolock) ' +
      ' where bkzl=''自动布控'' and (BKLX=''02'' or BKLX=''03'') and ischeck=''0'' and zt=''0'' and vioUrl>'''' ';
    with gSQLHelper.Query(s) do
    begin
      while not Eof do
      begin
        msg := '';
        Vehs := THik.DFAnalysisOnePic(FieldByName('VioUrl').AsString, msg);
        if (Vehs <> nil) and (Vehs.Count > 0) then
        begin
          b := False;
          for veh in Vehs do
          begin
            if veh.PlateNum = FieldByName('HPHM').AsString then
            begin
              b := True;
              break;
            end;
          end;

          if b then
            sqls.Add(' update T_KK_ALARM set IsCheck=''1'', K08CheckResult=''OK'' where SYSTEMID='''
              + FieldByName('SYSTEMID').AsString + ''' ')
          else
          begin
            sqls.Add(' delete from T_KK_ALARM  where SYSTEMID=''' +
              FieldByName('SYSTEMID').AsString + ''' ');
            sqls.Add(' insert into T_KK_ALARM_ERROR(KDBH, URL) values (''' +
              FieldByName('KDBH').AsString + ''',''' + FieldByName('VioUrl')
              .AsString + ''')');
          end;
        end
        else if (Vehs <> nil) and (Vehs.Count = 0) then
          sqls.Add(' update T_KK_ALARM set IsCheck=''1'', K08CheckResult=''未识别出车辆'' where SYSTEMID='''
            + FieldByName('SYSTEMID').AsString + ''' ');
        if sqls.Count > 10 then
        begin
          gLogger.Info('Check Records:' + sqls.Count.ToString);
          gSQLHelper.ExecuteSqlTran(sqls);
          sqls.Clear;
        end;
        if Vehs <> nil then
          FreeAndNil(Vehs);
        Next;
      end;
      if sqls.Count > 0 then
      begin
        gLogger.Info('Check Records:' + sqls.Count.ToString);
        gSQLHelper.ExecuteSqlTran(sqls);
        sqls.Clear;
      end;
      Free;
    end;
    Sleep(60 * 1000);
  end;
end;

end.
