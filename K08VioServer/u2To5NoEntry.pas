unit u2To5NoEntry;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, wininet, uHik, IDURI;

type
  T2To5NoEntry = class(TThread)
  private
    gvioVeh: TDictionary<string, boolean>;
    function GetVioSQLs(vehList: TList<TK08VehInfo>; kssj, jssj: string)
      : TStrings;
    function GetTp2(hphm, tp1, kssj, jssj: string): String;
    procedure LoadWhiteVeh;
  protected
    procedure Execute; override;
  end;

implementation

{ T2To5NoEntry }

procedure T2To5NoEntry.Execute;
var
  Params, SQLs, tmpSQLs: TStrings;
  kssj, jssj: String;
  totalPage, currentPage: Integer;
  vehList: TList<TK08VehInfo>;
  minDate, maxDate, currentDate: TDateTime;
  param: TDictionary<string, String>;
begin
  gLogger.Info('[2To5NoEntry] 2To5NoEntry Thread Start');
  if gThreadConfig.LC25NoEntryDev = '' then
  begin
    gLogger.Info('[2To5NoEntry] 未配置2To5限行抓拍设备');
    gLogger.Info('[2To5NoEntry] 2To5NoEntry Thread End');
    exit;
  end;
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);

  param := TDictionary<string, String>.Create;
  param.Add('crossingid', gThreadConfig.LC25NoEntryDev);
  param.Add('passtime', gThreadConfig.LC25NoEntryStartDate + ' 00:00:00,' +
    formatdatetime('yyyy-mm-dd hh:nn:ss', Now()));
  maxDate := THik.GetMaxPassTime(param);
  if maxDate = 0 then
  begin
    gLogger.Error('[2To5NoEntry] 访问K08失败');
    gLogger.Info('[2To5NoEntry] 2To5NoEntry Thread End');
    ActiveX.CoUninitialize;
    exit;
  end;

  gvioVeh := TDictionary<string, boolean>.Create;
  LoadWhiteVeh;
  SQLs := TStringList.Create;

  minDate := TCommon.StringToDT(gThreadConfig.LC25NoEntryStartDate +
    ' 00:00:00');
  if maxDate < TCommon.StringToDT(formatdatetime('yyyy/mm/dd', maxDate) +
    ' 05:00:00') then // 如果最大时间小于今天的5点，那么今天的闯禁行违法就不取
    maxDate := maxDate - 1;

  currentDate := minDate;
  while formatdatetime('yyyy-mm-dd', currentDate) <=
    formatdatetime('yyyy-mm-dd', maxDate) do
  begin
    gvioVeh.Clear;
    kssj := formatdatetime('yyyy-mm-dd', currentDate) + ' 02:00:00';
    jssj := formatdatetime('yyyy-mm-dd', currentDate) + ' 05:00:00';
    param.Clear;
    param.Add('crossingid', gThreadConfig.LC25NoEntryDev);
    param.Add('passtime', kssj + ',' + jssj);
    param.Add('vehiclehead', '1');
    param.Add('platestate', '0');
    param.Add('vehicletype', '1');
    param.Add('platecolor', '1');

    totalPage := 1;
    currentPage := 1;
    while currentPage <= totalPage do
    begin
      gLogger.Info('[2To5NoEntry] Get 2To5NoEntry Date:' + kssj + ', Page:' +
        IntToStr(currentPage) + ', TotalPage:' + IntToStr(totalPage));

      try
        Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '100');
        gLogger.Info(Params.Text);
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

    gThreadConfig.LC25NoEntryStartDate := formatdatetime('yyyy-mm-dd',
      currentDate + 1);
    TCommon.SaveConfig('Task', 'LC25NoEntryStartDate',
      gThreadConfig.LC25NoEntryStartDate);

    currentDate := currentDate + 1;
  end;
  param.Free;
  gLogger.Info('[2To5NoEntry] 2To5NoEntry Thread End');
  SQLs.Free;
  gvioVeh.Free;
  ActiveX.CoUninitialize;
end;

function T2To5NoEntry.GetTp2(hphm, tp1, kssj, jssj: string): String;
var
  Params: TStrings;
  tp2: String;
  totalPage, currentPage: Integer;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
  param: TDictionary<string, String>;
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

  param := TDictionary<string, String>.Create;
  param.Add('crossingid', gThreadConfig.LC25NoEntryDev);
  param.Add('passtime', kssj + ',' + jssj);
  param.Add('vehiclehead', '1');
  param.Add('platestate', '0');
  param.Add('vehicletype', '1');
  param.Add('platecolor', '1');
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
        if Trim(veh.imagepath) = Trim(tp1) then
          continue;
        Result := veh.imagepath;
      end;
      vehList.Free;
    end;
  except
    on e: exception do
    begin
      gLogger.Error('[2To5NoEntry] ' + e.Message);
    end;
  end;
  param.Free;
end;

function T2To5NoEntry.GetVioSQLs(vehList: TList<TK08VehInfo>;
  kssj, jssj: String): TStrings;
var
  veh: TK08VehInfo;
  s, tp1, tp2, hphm, hpzl: String;
  dt: TDateTime;
begin
  Result := TStringList.Create;
  for veh in vehList do
  begin
    if gDevList.ContainsKey(veh.crossingid) then
    begin
      dt := DateUtils.IncMilliSecond(25569.3333333333,
        StrToInt64(veh.PassTime));
      hphm := veh.plateinfo + '_' + formatdatetime('yyyymmdd', dt);
      if not gHpzlList.ContainsKey(veh.vehicletype) then
        continue;
      hpzl := gHpzlList[veh.vehicletype];
      if gvioVeh.ContainsKey(hphm + hpzl) then
        continue;
      tp1 := veh.imagepath;
      tp2 := GetTp2(veh.plateinfo, tp1, kssj, jssj);
      if tp2 = '' then
      begin
        gLogger.Info('[2To5NoEntry] not found Photofile2');
        continue;
      end;
      tp1 := tp1.Replace('&amp;', '&');
      tp2 := tp2.Replace('&amp;', '&');
      tp1 := TIDURI.URLDecode(tp1);
      tp2 := TIDURI.URLDecode(tp2);
      s := ' insert into T_VIO_TEMP(CJJG, HPHM, HPZL, WFDD, WFXW, WFSJ, CD, PHOTOFILE1, PHOTOFILE2, BJ) values ('
        + gDevList[veh.crossingid].CJJG.QuotedString + ',' +
        veh.plateinfo.QuotedString + ',' + hpzl.QuotedString + ',' +
        gDevList[veh.crossingid].SBBH.QuotedString + ',''1344'',' +
        formatdatetime('yyyy-mm-dd hh:nn:ss', dt).QuotedString + ',' +
        veh.laneno.QuotedString + ',' + tp1.QuotedString + ',' +
        tp2.QuotedString + ',''0'')';
      Result.Add(s);
      gvioVeh.Add(hphm + hpzl, true);
    end;
  end;
end;

procedure T2To5NoEntry.LoadWhiteVeh;
begin
  with gSQLHelper.Query('select hphm+hpzl from T_Veh_JinXing_White') do
  begin
    if not gvioVeh.ContainsKey(Fields[0].AsString) then
      gvioVeh.Add(Fields[0].AsString, true);
  end;
end;

end.
