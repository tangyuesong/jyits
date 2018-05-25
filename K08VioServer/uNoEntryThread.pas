unit uNoEntryThread;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, wininet, uHik, IDURI;

type
  TNoEntryThread = class(TThread)
  private
    gVioVeh: TStrings; // 防止重复写入，主键为 hphm_yyyymmdd, 只保存5000条
    function GetVioSQLs(vehList: TList<TK08VehInfo>): TStrings;
    function GetTp2(dt: TDateTime; hphm, tp1: string): String;
  protected
    procedure Execute; override;
  end;

implementation

{ TNoEntryThread }

procedure TNoEntryThread.Execute;
var
  Params, SQLs, tmpSQLs: TStrings;
  EndTime: String;
  totalPage, currentPage: Integer;
  currentTime, maxPasstime: TDateTime;
  vehList: TList<TK08VehInfo>;
  param: TDictionary<string, String>;
begin
  gLogger.Info('[NoEntry] NoEntryThread Start');
  if gThreadConfig.NoEntryDev = '' then
  begin
    gLogger.Info('[NoEntry] 未配置限行抓拍设备');
    gLogger.Info('[NoEntry] NoEntryThread Stop');
    exit;
  end;
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  gVioVeh := TStringList.Create;
  SQLs := TStringList.Create;
  while True do
  begin
    param := TDictionary<string, String>.Create;
    param.Add('crossingid', gThreadConfig.NoEntryDev);
    param.Add('passtime', gThreadConfig.NoEntryStartTime + ',' + formatdatetime('yyyy-mm-dd hh:nn:ss', Now()));

    maxPasstime := THik.GetMaxPassTime(param);
    if maxPasstime = 0 then
    begin
      gLogger.Error('[NoEntry] 访问K08失败');
      Sleep(10 * 60000);
      continue;
    end;

    while gVioVeh.Count > 5000 do
      gVioVeh.Delete(0);

    currentTime := maxPasstime - DateUtils.OneHour;
    EndTime := formatdatetime('yyyy-mm-dd hh:nn:ss', currentTime);

    param.Clear;
    param.Add('crossingid', gThreadConfig.NoEntryDev);
    param.Add('passtime', gThreadConfig.NoEntryStartTime + ',' + EndTime);
    param.Add('platecolor', '1');
    param.Add('vehicletype', '2');
    //param.Add('platetype', '8 102');
    param.Add('platestate', '0');

    totalPage := 1;
    currentPage := 1;
    while currentPage <= totalPage do
    begin
      gLogger.Info('[NoEntry] Get NoEntry StartTime:' +
        gThreadConfig.NoEntryStartTime + ', EndTime:' + EndTime + ', Page:' +
        IntToStr(currentPage) + ', TotalPage:' + IntToStr(totalPage));

      try
        Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '30');
        gLogger.Debug(Params.Text);
        vehList := THik.GetK08PassList(Params, totalPage, currentPage);
        Params.Free;
        if vehList <> nil then
        begin
          gLogger.Debug(vehList.Count.ToString);
          tmpSQLs := GetVioSQLs(vehList);
          if tmpSQLs.Count > 0 then
            SQLs.AddStrings(tmpSQLs);
          tmpSQLs.Free;
          vehList.Free;
          inc(currentPage);
        end
        else
        begin
          gLogger.Error('[NoEntry] vehList is null');
          SQLs.Clear;
          break;
        end;
      except
        on e: exception do
        begin
          gLogger.Error(e.Message);
          SQLs.Clear;
          break;
        end;
      end;
    end;
    if SQLs.Count > 0 then
    begin
      if gSQLHelper.ExecuteSqlTran(SQLs) then
      begin
        currentTime := currentTime + DateUtils.OneSecond;
        gThreadConfig.NoEntryStartTime := FormatDatetime('yyyy-mm-dd hh:mm:ss', currentTime);
        TCommon.SaveConfig('Task', 'NoEntryStartTime', gThreadConfig.NoEntryStartTime);
        gLogger.Info('[NoEntry] Save NoEntry Vio Count: ' + IntToStr(SQLs.Count));
      end
      else
        gLogger.Error('[NoEntry] Save NoEntry Vio Error');
      SQLs.Clear;
    end
    else
      gLogger.Info('[NoEntry] Save NoEntry Vio Count: 0');
    param.Free;
    Sleep(10 * 60000);
  end;
  gLogger.Info('[NoEntry] NoEntryThread Stop');
  SQLs.Free;
  gVioVeh.Free;
  ActiveX.CoUninitialize;
end;

function TNoEntryThread.GetTp2(dt: TDateTime; hphm, tp1: string): String;
var
  Params: TStrings;
  param: TDictionary<string, String>;
  totalPage, currentPage: Integer;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
  passtime: string;
begin
  Result := '';
  passtime := FormatDatetime('yyyy-mm-dd hh:nn:ss', dt)
    + ',' + FormatDatetime('yyyy-mm-dd 00:00:00', dt + 1);
  param := TDictionary<string, String>.Create;
  //param.Add('crossingid', gThreadConfig.NoEntryDev);
  param.Add('passtime', passtime);
  param.Add('platecolor', '1');
  param.Add('vehicletype', '2');
  //param.Add('platetype', '8 102');
  param.Add('platestate', '0');
  param.Add('plateno', hphm);

  totalPage := 1;
  currentPage := 1;

  try
    Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '100');
    vehList := THik.GetK08PassList(Params, totalPage, currentPage);
    Params.Free;
    if (vehList <> nil) and (vehList.Count > 0) then
    begin
      for veh in vehList do
      begin
        if Trim(veh.imagepath) <> Trim(tp1) then
        begin
          Result := veh.imagepath;
          Result := Result.Replace('&amp;', '&');
        end;
      end;
      vehList.Free;
    end;
  except
    on e: exception do
    begin
      gLogger.Error('[NoEntry] ' + e.Message);
    end;
  end;
  param.Free;
end;

function TNoEntryThread.GetVioSQLs(vehList: TList<TK08VehInfo>): TStrings;
var
  veh: TK08VehInfo;
  s, tp1, Tp2, hphm: String;
  dt: TDateTime;
begin
  Result := TStringList.Create;
  for veh in vehList do
  begin
    if gDevList.ContainsKey(veh.crossingid) then
    begin
      dt := DateUtils.IncMilliSecond(25569.3333333333, StrToInt64(veh.PassTime));
      hphm := veh.plateinfo + '_' + FormatDatetime('yyyymmdd', dt);
      if gVioVeh.IndexOf(hphm) >= 0 then
        continue;

      tp1 := veh.imagepath;
      tp1 := tp1.Replace('&amp;', '&');

      Tp2 := GetTp2(dt, veh.plateinfo, tp1);
      if Tp2 = '' then
      begin
        gLogger.Info('[NoEntry] not found Photofile2');
        continue;
      end;
      tp1 := TIDURI.URLDecode(tp1);
      Tp2 := TIDURI.URLDecode(Tp2);
      s := ' insert into T_VIO_TEMP(CJJG, HPHM, HPZL, WFDD, WFXW, WFSJ, CD, PHOTOFILE1, PHOTOFILE2, BJ) values ('
        + gDevList[veh.crossingid].CJJG.QuotedString + ',' +
        veh.plateinfo.QuotedString + ',' + gHpzlList[veh.vehicletype]
        .QuotedString + ',' + gDevList[veh.crossingid].SBBH.QuotedString +
        ',''1344'',' + FormatDateTime('yyyy-mm-dd hh:mm:ss', dt).QuotedString
        + ',' + veh.laneno.QuotedString
        + ',' + tp1.QuotedString + ',' + Tp2.QuotedString + ',''0'')';
      Result.Add(s);
      gVioVeh.Add(hphm);
    end;
  end;

end;

end.
