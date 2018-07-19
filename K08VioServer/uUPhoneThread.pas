unit uUPhoneThread;

interface

uses
  System.Classes, Generics.Collections, IdHTTP, SysUtils, uGlobal, uCommon,
  uDecodeHikResult, DateUtils, ActiveX, wininet, uHik, IDURI, StrUtils;

type
  TUPhoneThread = class(TThread)
  private
    gVioVeh: TStrings;
    function GetVioSQLs(vehList: TList<TK08VehInfo>): TStrings;
    function GetTp2(dt: TDateTime; hphm, vehType, tp1: string): String;
  protected
    procedure Execute; override;
  end;

implementation

{ TUPhoneThread }

procedure TUPhoneThread.Execute;
var
  Params, SQLs, tmpSQLs: TStrings;
  EndTime: String;
  totalPage, currentPage: Integer;
  currentTime, maxPasstime: TDateTime;
  vehList: TList<TK08VehInfo>;
  param: TDictionary<string, String>;
begin
  gLogger.Info('[UPhone] UPhoneThread Start');
  ActiveX.CoInitializeEx(nil, COINIT_MULTITHREADED);
  gVioVeh := TStringList.Create;
  SQLs := TStringList.Create;
  while True do
  begin
    param := TDictionary<string, String>.Create;
    param.Add('passtime', gThreadConfig.UPhoneStartTime + ',' +
      formatdatetime('yyyy-mm-dd hh:nn:ss', Now()));

    maxPasstime := THik.GetMaxPassTime(param);
    if maxPasstime = 0 then
    begin
      gLogger.Error('[UPhone] ·ÃÎÊK08Ê§°Ü');
      Sleep(10 * 60000);
      continue;
    end;

    while gVioVeh.Count > 5000 do
      gVioVeh.Delete(0);

    currentTime := maxPasstime - DateUtils.OneHour;
    EndTime := formatdatetime('yyyy-mm-dd hh:nn:ss', currentTime);
    if gThreadConfig.UPhoneStartTime < EndTime then
    begin
      param.Clear;
      param.Add('passtime', gThreadConfig.UPhoneStartTime + ',' + EndTime);
      param.Add('uphone', '1');
      totalPage := 1;
      currentPage := 1;
      while currentPage <= totalPage do
      begin
        gLogger.Info('[UPhone] Get UPhone StartTime:' +
          gThreadConfig.UPhoneStartTime + ', EndTime:' + EndTime + ', Page:' +
          IntToStr(currentPage) + ', TotalPage:' + IntToStr(totalPage));

        try
          Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '100');
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
            gLogger.Error('[UPhone] vehList is null');
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
          gThreadConfig.UPhoneStartTime := formatdatetime('yyyy-mm-dd hh:mm:ss',
            currentTime);
          TCommon.SaveConfig('Task', 'UPhoneStartTime',
            gThreadConfig.UPhoneStartTime);
          gLogger.Info('[UPhone] Save UPhone Vio Count: ' +
            IntToStr(SQLs.Count));
        end
        else
          gLogger.Error('[UPhone] Save UPhone Vio Error');
        SQLs.Clear;
      end
      else
        gLogger.Info('[UPhone] Save UPhone Vio Count: 0');
      param.Free;
    end;
    Sleep(10 * 60000);
  end;
  gLogger.Info('[UPhone] UPhoneThread Stop');
  SQLs.Free;
  gVioVeh.Free;
  ActiveX.CoUninitialize;
end;

function TUPhoneThread.GetTp2(dt: TDateTime;
  hphm, vehType, tp1: string): String;
var
  Params: TStrings;
  param: TDictionary<string, String>;
  totalPage, currentPage: Integer;
  vehList: TList<TK08VehInfo>;
  veh: TK08VehInfo;
  passtime: string;
begin
  Result := '';
  passtime := formatdatetime('yyyy-mm-dd 00:00:00', dt) + ',' +
    formatdatetime('yyyy-mm-dd 00:00:00', dt + 1);
  param := TDictionary<string, String>.Create;

  param.Add('passtime', passtime);
  param.Add('plateno', hphm);
  param.Add('vehicletype', vehType);

  totalPage := 1;
  currentPage := 1;

  try
    Params := THik.GetK08SearchParam(param, IntToStr(currentPage), '5');
    vehList := THik.GetK08PassList(Params, totalPage, currentPage);
    Params.Free;
    if (vehList <> nil) and (vehList.Count > 0) then
    begin
      for veh in vehList do
      begin
        if Trim(veh.imagepath) <> Trim(tp1) then
        begin
          Result := veh.imagepath;
          break;
        end;
      end;
      vehList.Free;
    end;
  except
    on e: exception do
    begin
      gLogger.Error('[UPhone] ' + e.Message);
    end;
  end;
  param.Free;
end;

function TUPhoneThread.GetVioSQLs(vehList: TList<TK08VehInfo>): TStrings;
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
      if LeftStr(gDevList[veh.crossingid].CJJG, 6) = '445281' then
        continue;

      dt := DateUtils.IncMilliSecond(25569.3333333333,
        StrToInt64(veh.passtime));

      hphm := veh.plateinfo + '_' + formatdatetime('yyyymmdd', dt);
      if gVioVeh.IndexOf(hphm) >= 0 then
        continue;

      tp1 := veh.imagepath;
      Tp2 := GetTp2(dt, veh.plateinfo, veh.vehicletype, tp1);
      if Tp2 = '' then
      begin
        gLogger.Info('[UPhone] not found Photofile2');
        continue;
      end;
      tp1 := tp1.Replace('&amp;', '&');
      Tp2 := Tp2.Replace('&amp;', '&');
      tp1 := TIDURI.URLDecode(tp1);
      Tp2 := TIDURI.URLDecode(Tp2);
      s := ' insert into T_VIO_TEMP(CJJG, HPHM, HPZL, WFDD, WFXW, WFSJ, CD, PHOTOFILE1, PHOTOFILE2, BJ) values ('
        + gDevList[veh.crossingid].CJJG.QuotedString + ',' +
        veh.plateinfo.QuotedString + ',' + gHpzlList[veh.vehicletype]
        .QuotedString + ',' + gDevList[veh.crossingid].SBBH.QuotedString +
        ',''1223'',' + formatdatetime('yyyy-mm-dd hh:mm:ss', dt).QuotedString +
        ',' + veh.laneno.QuotedString + ',' + tp1.QuotedString + ',' +
        Tp2.QuotedString + ',''0'')';
      Result.Add(s);
      gVioVeh.Add(hphm);
    end;
  end;

end;

end.
