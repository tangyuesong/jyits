unit uVioSBThread;

interface

uses
  System.Classes, SysUtils, uGlobal, Generics.Collections, uHik, uEntity,
  uDecodeHikResult, ActiveX;

type
  TVioSBThread = class(TThread)
  private
    function GetPicVehInfo(url: String): TDFVehInfo;
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

  procedure TVioSBThread.UpdateCaption;
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

{ TVioSBThread }

procedure TVioSBThread.Execute;
var
  s: String;
  sqls: TStrings;
  veh: TDFVehInfo;
begin
  ActiveX.CoInitialize(nil);
  gLogger.Info('VioSBThread Start');
  sqls := TStringList.Create;
  while True do
  begin
    s := ' select SYSTEMID, FWQDZ + PHOTOFILE1 as url from T_VIO_TEMP with(nolock) where bj = ''0'' and '
      + ' (hphm is null or HPHM = '''') and WFDD = ''民警抓拍'' and FWQDZ + PHOTOFILE1 is not null ';
    with gSQLHelper.Query(s) do
    begin
      while not Eof do
      begin
        veh := GetPicVehInfo(FieldByName('url').AsString);
        if veh.PlateNum <> '' then
          sqls.Add(' update T_VIO_TEMP set HPHM=''' + veh.PlateNum +
            ''' where SYSTEMID=''' + FieldByName('SYSTEMID').AsString + ''' ')
        else
          sqls.Add(' update T_VIO_TEMP set HPHM=''车牌'' where SYSTEMID=''' +
            FieldByName('SYSTEMID').AsString + ''' ');

        if sqls.Count > 10 then
        begin
          gLogger.Info('[VioSBThread] HPHM Records:' + sqls.Count.ToString);
          gSQLHelper.ExecuteSqlTran(sqls);
          sqls.Clear;
        end;
        Next;
      end;
      if sqls.Count > 0 then
      begin
        gLogger.Info('[VioSBThread] HPHM Records:' + sqls.Count.ToString);
        gSQLHelper.ExecuteSqlTran(sqls);
        sqls.Clear;
      end;
      Free;
    end;
    Sleep(60 * 1000);
  end;
end;

function TVioSBThread.GetPicVehInfo(url: String): TDFVehInfo;
var
  msg: String;
  Vehs: TList<TDFVehInfo>;
  veh: TDFVehInfo;
begin
  Result.PlateNum := '';
  Vehs := THik.DFAnalysisOnePic(url, msg);
  if (Vehs <> nil) and (Vehs.Count > 0) then
  begin
    for veh in Vehs do
    begin
      if veh.PlateNum = '车牌' then
        continue
      else
      begin
        Result := veh;
        break;
      end;
    end;
  end;
end;

end.
