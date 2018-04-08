unit uPilotsafebeltThread;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, wininet, uHik, IDURI;

type
  TPilotsafebeltThread = class(TThread)
  private
    gVioVeh: TStrings; // 防止重复写入，主键为 hphm_yyyymmdd, 只保存5000条
    function GetVioSQLs(vehList: TList<TK08VehInfo>): TStrings;
    function GetSecondPic(hphm, hpzl, url, wfxw: String;
      wfsj: TDateTime): String;
  protected
    procedure Execute; override;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure TPilotsafebeltThread.UpdateCaption;
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

{ TPilotsafebeltThread }

procedure TPilotsafebeltThread.Execute;
var
  Params, SQLs, tmpSQLs: TStrings;
  s, EndTime: String;
  maxPasstime: TDateTime;
  totalPage, currentPage: Integer;
  currentTime: TDateTime;
  vehList: TList<TK08VehInfo>;
  param: TDictionary<string, String>;
begin
  gLogger.Info('[Pilotsafebelt] PilotsafebeltThread Start');
  if gThreadConfig.PilotsafebeltDev = '' then
  begin
    gLogger.Info('[Pilotsafebelt] 未配置安全带设备');
    gLogger.Info('[Pilotsafebelt] PilotsafebeltThread Stop');
    exit;
  end;
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  SQLs := TStringList.Create;
  gVioVeh := TStringList.Create;
  param := TDictionary<string, String>.Create;
  while True do
  begin
    param.Clear;
    param.Add('crossingid', gThreadConfig.PilotsafebeltDev);
    param.Add('passtime', gThreadConfig.PilotsafebeltStartTime + ',' +
      formatdatetime('yyyy-mm-dd hh:nn:ss', Now()));
    maxPasstime := THik.GetMaxPassTime(param);
    if maxPasstime = 0 then
    begin
      gLogger.Error('[Pilotsafebelt] 访问K08失败');
      Sleep(10 * 60000);
      continue;
    end;

    while gVioVeh.Count > 5000 do
      gVioVeh.Delete(0);

    currentTime := maxPasstime - DateUtils.OneHour;
    EndTime := formatdatetime('yyyy-mm-dd hh:nn:ss', currentTime);

    if EndTime <= gThreadConfig.PilotsafebeltStartTime then
    begin
      gLogger.Error('[Pilotsafebelt] 没有最新的数据');
      Sleep(10 * 60000);
      continue;
    end;

    param.Clear;
    param.Add('crossingid', gThreadConfig.PilotsafebeltDev);
    param.Add('passtime', gThreadConfig.PilotsafebeltStartTime + ',' + EndTime);
    param.Add('q',
      'platestate:(0) AND (pilotsafebelt:(1) OR vicepilotsafebelt:(1))');

    totalPage := 1;
    currentPage := 1;
    while currentPage <= totalPage do
    begin
      gLogger.Info('[Pilotsafebelt] Get Vio StartTime:' +
        gThreadConfig.PilotsafebeltStartTime + ', EndTime:' + EndTime +
        ', Page:' + IntToStr(currentPage) + ', TotalPage:' +
        IntToStr(totalPage));
      // k08是分页返回的，有可能查询中间某页出错，那么就无法知道哪些违法已经入库，
      // 所以只要查询某一页出错，当次查询的所有违法都不保存

      try
        Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '100');
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
          gLogger.Error('[Pilotsafebelt] vehList is null');
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
        gThreadConfig.PilotsafebeltStartTime :=
          formatdatetime('yyyy-mm-dd hh:nn:ss', currentTime);
        TCommon.SaveConfig('Task', 'PilotsafebeltStartTime',
          gThreadConfig.PilotsafebeltStartTime);
        gLogger.Info('[Pilotsafebelt] Save Pilotsafebelt Vio Count: ' +
          IntToStr(SQLs.Count));
      end
      else
        gLogger.Error('[Pilotsafebelt] Save Pilotsafebelt Vio Error');
      SQLs.Clear;
    end
    else
      gLogger.Info('[Pilotsafebelt] Save Pilotsafebelt Vio Count: 0');
    Sleep(10 * 60000);
  end;
  gLogger.Info('[Pilotsafebelt] PilotsafebeltThread Stop');
  SQLs.Free;
  gVioVeh.Free;
  param.Free;
  ActiveX.CoUninitialize;
end;

function TPilotsafebeltThread.GetSecondPic(hphm, hpzl, url, wfxw: String;
  wfsj: TDateTime): String;
var
  param: TDictionary<string, String>;
  Params: TStrings;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
  c, t: Integer;
begin
  Result := '';
  param := TDictionary<string, String>.Create;
  param.Add('passtime', formatdatetime('yyyy-mm-dd', wfsj) + ' 00:00:00,' +
    formatdatetime('yyyy-mm-dd', wfsj + 1) + ' 00:00:00');
  param.Add('plateno', hphm);
  param.Add('vehicletype', hpzl);
  if wfxw = '6011' then
    param.Add('pilotsafebelt', '1')
  else
    param.Add('vicepilotsafebelt', '1');

  Params := THik.GetK08SearchParam(param, '1', '2');
  vehList := THik.GetK08PassList(Params, c, t);
  if (vehList <> nil) and (vehList.Count > 0) then
  begin
    for veh in vehList do
    begin
      if veh.imagepath <> url then
      begin
        Result := veh.imagepath;
        break;
      end;
    end;
    vehList.Free;
  end;
  param.Free;
  Params.Free;
end;

function TPilotsafebeltThread.GetVioSQLs(vehList: TList<TK08VehInfo>): TStrings;
var
  veh: TK08VehInfo;
  s, tp1, tp2, wfxw, hphm: String;
  dt: TDateTime;
begin
  Result := TStringList.Create;
  for veh in vehList do
  begin
    if gDevList.ContainsKey(veh.crossingid) and
      (gHpzlList[veh.vehicletype] <> '07') then
    begin
      dt := DateUtils.IncMilliSecond(25569.3333333333,
        StrToInt64(veh.PassTime));
      hphm := veh.plateinfo + '_' + formatdatetime('yyyymmdd', dt);
      if gVioVeh.IndexOf(hphm) >= 0 then
        continue;
      if veh.pilotsafebelt = '1' then
        wfxw := '6011'
      else if veh.vicepilotsafebelt = '1' then
        wfxw := '7012'
      else
        continue;

      tp1 := veh.imagepath;
      tp2 := GetSecondPic(veh.plateinfo, veh.vehicletype, tp1, wfxw, dt);
      if tp2 = '' then
      begin
        gLogger.Info('[Pilotsafebelt]' + veh.plateinfo +
          ' not found Photofile2');
        continue;
      end;

      tp1 := tp1.Replace('&amp;', '&');
      tp2 := tp2.Replace('&amp;', '&');
      tp1 := TIdURI.URLDecode(tp1);
      tp2 := TIdURI.URLDecode(tp2);

      s := ' insert into T_VIO_TEMP(CJJG, HPHM, HPZL, WFDD, WFXW, WFSJ, CD, PHOTOFILE1, PHOTOFILE2, BJ) values ('
        + gDevList[veh.crossingid].CJJG.QuotedString + ',' +
        veh.plateinfo.QuotedString + ',' + gHpzlList[veh.vehicletype]
        .QuotedString + ',' + gDevList[veh.crossingid].SBBH.QuotedString + ',' +
        wfxw.QuotedString + ',' + formatdatetime('yyyy/mm/dd hh:nn:ss', dt)
        .QuotedString + ',' + veh.laneno.QuotedString + ',' + tp1.QuotedString +
        ',' + tp2.QuotedString + ',''0'')';
      Result.Add(s);
      gVioVeh.Add(hphm)
    end;
  end;
end;

end.
