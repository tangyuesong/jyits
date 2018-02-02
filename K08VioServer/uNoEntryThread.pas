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
    function GetTp2(dt, hphm, sbid, tp1: string): String;
  protected
    procedure Execute; override;
  end;

implementation

{ TNoEntryThread }

procedure TNoEntryThread.Execute;
var
  Params, SQLs, tmpSQLs: TStrings;
  param, s, EndTime, maxPasstime: String;
  totalPage, currentPage: Integer;
  currentTime: TDateTime;
  vehList: TList<TK08VehInfo>;
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
    maxPasstime := THik.GetMaxPassTime('crossingid:(' +
      gThreadConfig.NoEntryDev + ')');
    if maxPasstime = '' then
    begin
      gLogger.Error('[NoEntry] 访问K08失败');
      Sleep(10 * 60000);
      continue;
    end;

    while gVioVeh.Count > 5000 do
      gVioVeh.Delete(0);

    currentTime := TCommon.StringToDT(maxPasstime) - DateUtils.OneHour;
    EndTime := FormatDatetime('yyyy-mm-dd', currentTime) + 'T' +
      FormatDatetime('hh:nn:ss', currentTime) + '.999Z';

    param := 'crossingid:(' + gThreadConfig.NoEntryDev + ') AND passtime:([' +
      gThreadConfig.NoEntryStartTime + ' TO ' + EndTime +
      ']) AND platecolor:(1)  AND vehicletype:(2) AND platetype:(8 102) AND platestate:(0)';

    totalPage := 1;
    currentPage := 1;
    while currentPage <= totalPage do
    begin
      gLogger.Info('[NoEntry] Get NoEntry StartTime:' +
        gThreadConfig.NoEntryStartTime + ', EndTime:' + EndTime + ', Page:' +
        IntToStr(currentPage) + ', TotalPage:' + IntToStr(totalPage));

      try
        Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '30');
        vehList := THik.GetK08PassList(Params, totalPage, currentPage);
        Params.Free;
        if vehList <> nil then
        begin
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
        gThreadConfig.NoEntryStartTime := FormatDatetime('yyyy-mm-dd',
          currentTime) + 'T' + FormatDatetime('hh:nn:ss', currentTime)
          + '.000Z';
        TCommon.SaveConfig('Task', 'NoEntryStartTime',
          gThreadConfig.NoEntryStartTime);
        gLogger.Info('[NoEntry] Save NoEntry Vio Count: ' +
          IntToStr(SQLs.Count));
      end
      else
        gLogger.Error('[NoEntry] Save NoEntry Vio Error');
      SQLs.Clear;
    end
    else
      gLogger.Info('[NoEntry] Save NoEntry Vio Count: 0');
    Sleep(10 * 60000);
  end;
  gLogger.Info('[NoEntry] NoEntryThread Stop');
  SQLs.Free;
  gVioVeh.Free;
  ActiveX.CoUninitialize;
end;

function TNoEntryThread.GetTp2(dt, hphm, sbid, tp1: string): String;
var
  Params: TStrings;
  param: String;
  totalPage, currentPage: Integer;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
begin
  Result := '';

  param := 'crossingid:(' + sbid + ') AND ' + dt +
    ' AND platecolor:(1)  AND vehicletype:(2) AND platetype:(8 102) AND platestate:(0) AND plateinfono:('
    + hphm + ')';

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
        if Trim(veh.picvehicle) = Trim(tp1) then
          continue;
        Result := veh.picvehicle;
        Result := Result.Replace('&amp;', '&');
      end;
    end;
  except
    on e: exception do
    begin
      gLogger.Error('[NoEntry] ' + e.Message);
    end;
  end;
end;

function TNoEntryThread.GetVioSQLs(vehList: TList<TK08VehInfo>): TStrings;
var
  veh: TK08VehInfo;
  s, tp1, Tp2, dtParam, hphm: String;
  dt: TDateTime;
begin
  Result := TStringList.Create;
  for veh in vehList do
  begin
    if gDevList.ContainsKey(veh.crossingid) then
    begin
      dt := TCommon.StringToDT(veh.passtime);
      hphm := veh.plateinfono + '_' + FormatDatetime('yyyymmdd', dt);
      if gVioVeh.IndexOf(hphm) >= 0 then
        continue;

      tp1 := veh.picvehicle;
      tp1 := tp1.Replace('&amp;', '&');
      dtParam := FormatDatetime('yyyy-mm-dd', dt - DateUtils.OneMinute) + 'T' +
        FormatDatetime('hh:nn:ss', dt - DateUtils.OneMinute) + '.000Z';
      dtParam := dtParam + ' TO ' + FormatDatetime('yyyy-mm-dd',
        dt + DateUtils.OneMinute) + 'T' + FormatDatetime('hh:nn:ss',
        dt + DateUtils.OneMinute) + '.999Z';
      dtParam := 'passtime:([' + dtParam + '])';

      Tp2 := GetTp2(dtParam, veh.plateinfono, veh.crossingid, tp1);
      if Tp2 = '' then
      begin
        gLogger.Info('[NoEntry] not found Photofile2');
        continue;
      end;
      tp1 := TIDURI.URLDecode(tp1);
      Tp2 := TIDURI.URLDecode(Tp2);
      s := ' insert into T_VIO_TEMP(CJJG, HPHM, HPZL, WFDD, WFXW, WFSJ, CD, PHOTOFILE1, PHOTOFILE2, BJ) values ('
        + gDevList[veh.crossingid].CJJG.QuotedString + ',' +
        veh.plateinfono.QuotedString + ',' + gHpzlList[veh.vehicletype]
        .QuotedString + ',' + gDevList[veh.crossingid].SBBH.QuotedString +
        ',''1344'',' + veh.passtime.QuotedString + ',' + veh.laneid.QuotedString
        + ',' + tp1.QuotedString + ',' + Tp2.QuotedString + ',''0'')';
      Result.Add(s);
      gVioVeh.Add(hphm);
    end;
  end;

end;

end.
