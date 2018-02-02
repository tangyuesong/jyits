unit u2To5NoEntry;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, wininet, uHik, IDURI;

type
  T2To5NoEntry = class(TThread)
  private
    gvioVeh: TStrings;
    function GetVioSQLs(vehList: TList<TK08VehInfo>; kssj, jssj: string)
      : TStrings;
    function GetTp2(hphm, tp1, kssj, jssj: string): String;
  protected
    procedure Execute; override;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure T2To5NoEntry.UpdateCaption;
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

{ T2To5NoEntry }

procedure T2To5NoEntry.Execute;
var
  Params, SQLs, tmpSQLs: TStrings;
  param, maxPasstime, kssj, jssj: String;
  totalPage, currentPage: Integer;
  vehList: TList<TK08VehInfo>;
  minDate, maxDate, currentDate: TDateTime;
begin
  gLogger.Info('[2To5NoEntry] 2To5NoEntry Thread Start');
  if gThreadConfig.LC25NoEntryDev = '' then
  begin
    gLogger.Info('[2To5NoEntry] 未配置2To5限行抓拍设备');
    gLogger.Info('[2To5NoEntry] 2To5NoEntry Thread End');
    exit;
  end;
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  maxPasstime := THik.GetMaxPassTime('crossingid:(' +
    gThreadConfig.LC25NoEntryDev + ')');
  if maxPasstime = '' then
  begin
    gLogger.Error('[2To5NoEntry] 访问K08失败');
    gLogger.Info('[2To5NoEntry] 2To5NoEntry Thread End');
    ActiveX.CoUninitialize;
    exit;
  end;

  gvioVeh := TStringList.Create;
  SQLs := TStringList.Create;

  minDate := TCommon.StringToDT(gThreadConfig.LC25NoEntryStartDate +
    ' 00:00:00');
  maxDate := TCommon.StringToDT(maxPasstime);
  if maxDate < TCommon.StringToDT(FormatDatetime('yyyy/mm/dd', maxDate) +
    ' 05:00:00') then // 如果最大时间小于今天的5点，那么今天的闯禁行违法就不取
    maxDate := maxDate - 1;

  currentDate := minDate;

  while FormatDatetime('yyyy-mm-dd', currentDate) <=
    FormatDatetime('yyyy-mm-dd', maxDate) do
  begin
    gvioVeh.Clear;
    kssj := FormatDatetime('yyyy-mm-dd', currentDate) + 'T02:00:00.000Z';
    jssj := FormatDatetime('yyyy-mm-dd', currentDate) + 'T05:00:00.000Z';

    param := 'crossingid:(' + gThreadConfig.LC25NoEntryDev + ') AND passtime:(['
      + kssj + ' TO ' + jssj +
      ']) AND vehiclehead:(1) AND platestate:(0) AND vehicletype:(1) AND platecolor:(1)';

    totalPage := 1;
    currentPage := 1;
    while currentPage <= totalPage do
    begin
      gLogger.Info('[2To5NoEntry] Get 2To5NoEntry Date:' +
        FormatDatetime('yyyy/mm/dd', currentDate) + ', Page:' +
        IntToStr(currentPage) + ', TotalPage:' + IntToStr(totalPage));

      try
        Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '100');
        vehList := THik.GetK08PassList(Params, totalPage, currentPage);
        Params.Free;
        if vehList <> nil then
        begin
          tmpSQLs := GetVioSQLs(vehList, kssj, jssj);
          if tmpSQLs.Count > 0 then
            SQLs.AddStrings(tmpSQLs);
          tmpSQLs.Free;
          vehList.Free;
          inc(currentPage);
        end
        else
        begin
          gLogger.Error('[2To5NoEntry] vehList is null');
          break;
        end;
      except
        on e: exception do
        begin
          gLogger.Error(e.Message);
          break;
        end;
      end;
    end;

    if SQLs.Count > 0 then
    begin
      if gSQLHelper.ExecuteSqlTran(SQLs) then
        gLogger.Info('[2To5NoEntry] Save NoEntry Vio Count: ' +
          IntToStr(SQLs.Count))
      else
        gLogger.Error('[2To5NoEntry] Save NoEntry Vio Error');
      SQLs.Clear;
    end
    else
      gLogger.Info('[2To5NoEntry] Save NoEntry Vio Count: 0');

    gThreadConfig.LC25NoEntryStartDate := FormatDatetime('yyyy-mm-dd',
      currentDate + 1);
    TCommon.SaveConfig('Task', 'LC25NoEntryStartDate',
      gThreadConfig.LC25NoEntryStartDate);

    currentDate := currentDate + 1;
  end;

  gLogger.Info('[2To5NoEntry] 2To5NoEntry Thread End');
  SQLs.Free;
  gvioVeh.Free;
  ActiveX.CoUninitialize;
end;

function T2To5NoEntry.GetTp2(hphm, tp1, kssj, jssj: string): String;
var
  Params: TStrings;
  param, tp2: String;
  totalPage, currentPage: Integer;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
begin
  Result := '';
  tp2 := tp1.Replace('1.jpg', '2.jpg');
  if tp1 <> tp2 then
  begin
    if InternetCheckConnection(PChar(tp2), 1, 0) then
    begin
      Result := tp2;
      exit;
    end;
  end;

  param := 'crossingid:(' + gThreadConfig.LC25NoEntryDev + ') AND passtime:([' +
    kssj + ' TO ' + jssj + ']) AND vehiclehead:(1) AND platestate:(0) AND ' +
    'vehicletype:(1) AND platecolor:(1)  AND plateinfono:(' + hphm + ')';

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
      gLogger.Error('[2To5NoEntry] ' + e.Message);
    end;
  end;
end;

function T2To5NoEntry.GetVioSQLs(vehList: TList<TK08VehInfo>;
  kssj, jssj: String): TStrings;
var
  veh: TK08VehInfo;
  s, tp1, tp2, hphm: String;
  dt: TDateTime;
begin
  Result := TStringList.Create;
  for veh in vehList do
  begin
    if gDevList.ContainsKey(veh.crossingid) then
    begin
      dt := TCommon.StringToDT(veh.passtime);
      hphm := veh.plateinfono + '_' + FormatDatetime('yyyymmdd', dt);
      if gvioVeh.IndexOf(hphm) >= 0 then
        continue;
      tp1 := veh.picvehicle;
      tp1 := tp1.Replace('&amp;', '&');
      tp2 := GetTp2(veh.plateinfono, tp1, kssj, jssj);
      if tp2 = '' then
      begin
        gLogger.Info('[2To5NoEntry] not found Photofile2');
        continue;
      end;
      tp1 := TIDURI.URLDecode(tp1);
      tp2 := TIDURI.URLDecode(tp2);
      s := ' insert into T_VIO_TEMP(CJJG, HPHM, HPZL, WFDD, WFXW, WFSJ, CD, PHOTOFILE1, PHOTOFILE2, BJ) values ('
        + gDevList[veh.crossingid].CJJG.QuotedString + ',' +
        veh.plateinfono.QuotedString + ',' + gHpzlList[veh.vehicletype]
        .QuotedString + ',' + gDevList[veh.crossingid].SBBH.QuotedString +
        ',''1344'',' + veh.passtime.QuotedString + ',' + veh.laneid.QuotedString
        + ',' + tp1.QuotedString + ',' + tp2.QuotedString + ',''111'')';
      Result.Add(s);
      gvioVeh.Add(hphm);
    end;
  end;
end;

end.
