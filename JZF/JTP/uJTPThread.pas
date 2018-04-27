unit uJTPThread;

interface

uses
  System.Classes, SysUtils, Generics.Collections, ActiveX, IniFiles, DateUtils,
  uGlobal, uHik, uDecodeHikResult;

type
  TJTPThread = class(TThread)
  private
    FVehInfoDic: TDictionary<string, TVehInfo>;
    procedure Foo;
    procedure Check(item: TK08VehInfo);
    function GetLastTime: string;
    procedure SaveLastTime(value: string);
    procedure LoadVehInfo;
    procedure SaveJTP(item: TK08VehInfo; bklx: string);
    procedure LoadK08CLPP;
    procedure LoadK08HPZL;
  protected
    procedure Execute; override;
  public
    constructor Create; overload;
  end;

implementation

{ TJTPThread }

constructor TJTPThread.Create;
begin
  inherited Create(false);
end;

procedure TJTPThread.Execute;
begin
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  JTPRunning := true;
  FreeOnTerminate := true;
  gLogger.Info('[JTPThread] Start');
  LoadVehInfo;
  LoadK08HPZL;
  LoadK08CLPP;
  foo;
  FVehInfoDic.Free;
  JTPRunning := false;
  gLogger.Info('[JTPThread] Finished');
  ActiveX.CoUninitialize;
end;

procedure TJTPThread.Foo;
var
  Params: TStrings;
  lastTime, EndTime: String;
  currentPage,totalPage: Integer;
  item: TK08VehInfo;
  vehList: TList<TK08VehInfo>;
  param: TDictionary<string, String>;
  first: boolean;
begin
  lastTime := GetLastTime;
  EndTime := formatdatetime('yyyy-mm-dd hh:nn:ss', now);
  param := TDictionary<string, String>.Create;
  param.Add('passtime', lastTime + ',' + EndTime);
  currentPage := 1;
  totalPage := 1;
  first := true;
  while currentPage <= totalPage do
  begin
    Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '1000');
    vehList := THik.GetK08PassList(Params, totalPage, currentPage);
    Params.Free;
    glogger.Info('[JTP]currentPage/totalPage:' + currentPage.ToString + '/' + totalPage.ToString);
    if (vehList = nil) or (vehList.Count = 0) then
      break;
    if first then
    begin
      first := false;
      lastTime := formatdatetime('yyyy-mm-dd hh:nn:ss', DateUtils.IncMilliSecond(25569.3333333333, StrToInt64(vehList[0].PassTime)));
      SaveLastTime(lastTime);
    end;

    for item in vehList do
    begin
      Check(item);
    end;
    vehList.Free;
    Inc(currentPage);
  end;
  param.Free;
end;

procedure TJTPThread.Check(item: TK08VehInfo);
  function Equal(s1, s2: string): boolean;
  var
    i, j: Integer;
  begin
    result := false;
    for i := 1 to s1.Length - 1 do
    begin
      for j := 1 to s2.Length - 1 do
      begin
        if s1[i] + s1[i+1] = s2[j] + s2[j+1] then
          exit(true);
      end;
    end;
  end;
var
  vehinfo: TVehInfo;
  key: string;
begin
  if not item.plateinfo.StartsWith('таV') then exit;

  if gK08HPZL.ContainsKey(item.vehicletype) then
    item.vehicletype := gK08HPZL[item.vehicletype]
  else
    exit;
  if gK08CLPP.ContainsKey(item.vehiclelogo + item.vehiclesublogo) then
    item.vehiclelogo := gK08CLPP[item.vehiclelogo + item.vehiclesublogo]
  else
    exit;

  key := item.plateinfo + item.vehicletype;
  if FVehInfoDic.ContainsKey(key) then
  begin
    vehinfo := FVehInfoDic[key];
    if not Equal(vehInfo.CLPP, item.vehiclelogo) then
    begin
      SaveJTP(item, '02');
    end;
  end
  else
    SaveJTP(item, '03');
end;

procedure TJTPThread.SaveJTP(item: TK08VehInfo; bklx: string);
var
  sql: string;
begin
  sql := 'if not exists(select 1 from T_KK_ALARM where hphm=''' + item.plateinfo
    + ''' and hpzl=''' + item.vehicletype + ''' and bklx=''' + bklx + ''')'
    + 'insert into T_KK_ALARM(BKXH,HPHM,HPZL,BKLX,BKR,ZT,UploadStatus,CLPP,CSYS,CLLX,BZ,vioUrl)'
    + 'values(''' + FormatDateTime('yyyymmddhhmmsszzz', now) + ''','''
    + item.plateinfo + ''',''' + item.vehicletype + ''',''' + bklx
    + ''',''JTPSvc'',''1'',''2'',''' + item.vehiclelogo + ''','''
    + item.vehiclecolor + ''',''нч'',''JTP'',''' + item.imagepath +''')';
  gSQLHelper.ExecuteSql(sql);
  //glogger.Info('[JTP]' + item.plateinfo);
end;

function TJTPThread.GetLastTime: string;
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Config.ini') do
  begin
    result := ReadString('JTP', 'LastTime', FormatDatetime('yyyy-mm-dd hh:nn:ss', now - OneMinute * 10));
    Free;
  end;
end;

procedure TJTPThread.SaveLastTime(value: string);
begin
  with TIniFile.Create(ExtractFilePath(Paramstr(0)) + 'Config.ini') do
  begin
    WriteString('JTP', 'LastTime', value);
    Free;
  end;
end;

procedure TJTPThread.LoadVehInfo;
var
  sql, key: string;
  item: TVehInfo;
begin
  if FVehInfoDic = nil then
  begin
    FVehInfoDic := TDictionary<string, TVehInfo>.Create;
    sql := 'select hphm,hpzl,clpp1,csys from T_VIO_VEHICLE '
      + 'where hpzl=''02'' or hpzl=''01'' ';
    with gSQLHelper.Query(sql) do
    begin
      while not eof do
      begin
        item.HPHM := Fields[0].AsString;
        item.HPZL := Fields[1].AsString;
        item.CLPP := Fields[2].AsString;
        item.CSYS := Fields[3].AsString;
        key := item.HPHM + item.HPZL;
        if not FVehInfoDic.ContainsKey(key) then
          FVehInfoDic.Add(key, item);
        Next;
      end;
      Free;
    end;
    gLogger.Info('[JTPThread] LoadVehInfo OK');
  end;

end;

procedure TJTPThread.LoadK08CLPP;
var
  sql, key: string;
begin
  if gK08CLPP = nil then
  begin
    gK08Clpp := TDictionary<String, String>.Create;
    sql := 'select distinct vehiclelogo,Vehiclesublogo,mc from [dbo].[D_K08_CLPP]';
    with gSQLHelper.Query(sql) do
    begin
      while not Eof do
      begin
        key := Fields[0].AsString + Fields[1].AsString;
        if not gK08CLPP.ContainsKey(key) then
          gK08Clpp.Add(key, Fields[2].AsString);
        Next;
      end;
      Free;
    end;
  end;
end;

procedure TJTPThread.LoadK08Hpzl;
begin
  if gK08Hpzl = nil then
  begin
    gK08Hpzl := TDictionary<String, String>.Create;
    with gSQLHelper.Query('select DM,MineKey from D_K08 where FLBH=''HPZL''') do
    begin
      while not Eof do
      begin
        gK08Hpzl.Add(Fields[0].AsString, Fields[1].AsString);
        Next;
      end;
      Free;
    end;
  end;
end;

end.
