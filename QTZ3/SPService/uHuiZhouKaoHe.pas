unit uHuiZhouKaoHe;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, IdCustomHTTPServer, DateUtils,
  Graphics, QBAES, IniFiles, Types, IOUtils, Generics.Collections, Windows,
  Generics.Defaults, FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Def,
  FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Expr, FireDAC.Stan.Pool,
  uRmInf,
  System.Net.HttpClientComponent, Variants, LatLngHelper, uEntity, uOraHelper;

type
  TVio = record
    DWDM: string;
    Force: integer;
    Violation: integer;
    Surveil: integer;
  end;

  TLine = record
    DWDM: string;
    points: TLatLngs;
  end;

  TPosition = record
    DWDM: string;
    Point: TLatLng;
  end;

  TZBTime = record
    KSSJ, JSSJ: TDateTime;
  end;

  TZB = record
    yhbh: string;
    sections: array of TZBTime;
  end;

  THistory = record
    yhbh: string;
    firstOutTime: TDateTime;
    lastTime: TDateTime;
    OnLine: boolean;
    Leaved: boolean;
    LastPoint: TLatLng;
  end;

  THuiZhouKaoHe = Class
  private
    class procedure LoadZBData; static;
    class procedure LoadLineData; static;
    class procedure LoadGPS; static;
    class procedure AddPoint(yhbh, dwdm: string; gxsj: TDateTime; point: TLatlng); static;
    class procedure LoadPosData; static;
  public
    class procedure Init;
    class procedure AddGPS(tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
  end;

var
  gLineList: TList<TLine>;
  gPosList: TList<TPosition>;
  gZBDic: TDictionary<string, TZB>;
  gHistory: TDictionary<string, THistory>;
  gOraHelper: TOraHelper;

implementation

{ THuiZhouKaoHe }

class procedure THuiZhouKaoHe.AddGPS(tokenKey: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);

  function IsZB(yhbh: string): boolean;
  var
    sec: TZBTime;
  begin
    if not gZBDic.ContainsKey(yhbh) then
      exit(false);
    for sec in gZBDic[yhbh].sections do
    begin
      if (sec.KSSJ < now) and (sec.JSSJ > now) then
        exit(true);
    end;
    exit(false);
  end;

  function IsOnLine(DWDM: string; point: TLatLng): boolean;
  var
    line: TLine;
    d: Double;
  begin
    result := false;
    for line in gLineList do
    begin
      if line.DWDM = DWDM then
      begin
        d := point.DistanceToLine(line.points);
        if d < 100 then
          exit(true);
      end;
    end;
  end;

var
  point: TLatLng;
  user: TUser;
  OnLine, moved: boolean;
  his: THistory;
  dis: Double;
begin
  AResponseInfo.ResponseText := TCommon.AssembleSuccessHttpResult('{}');
  if not Assigned(gZBDic) then
  begin
    AResponseInfo.ResponseText := TCommon.AssembleFailedHttpResult
      ('Config Invalid');
    exit;
  end;
  point.lng := StrToFloatDef(params.Values['Longitude'], 0);
  if point.lng = 0 then
    exit;
  point.lat := StrToFloatDef(params.Values['latitude'], 0);
  if point.lat = 0 then
    exit;
  user := gTokenManager.GetToken(tokenKey).user;
  if not IsZB(user.yhbh) then // 非值班时间
  begin
    // AResponseInfo.ResponseText := '非值班时间, 下次值班开始时间为: 10分钟后';
    exit;
  end;
  // point := point.GCJ02ToWGS84;  //坐标系转换
  OnLine := IsOnLine(user.DWDM, point);
  if not gHistory.ContainsKey(user.yhbh) then
  begin
    his.yhbh := user.yhbh;
    his.firstOutTime := now;
    his.lastTime := now;
    his.OnLine := OnLine;
    his.LastPoint := point;
    gHistory.Add(his.yhbh, his);
  end;
  his := gHistory[user.yhbh];
  if not OnLine then
  begin
    // AResponseInfo.ResponseText := '不在线路上';
    if his.OnLine then
      his.firstOutTime := now
    else if (now - his.firstOutTime >= OneMinute * 10) and
      (now - his.firstOutTime < OneMinute * 11) then // 避免不停告警
    begin
      gSQLHelper.ExecuteSql
        ('insert into YJITSDB.dbo.T_PDA_GPS(YHBH,Latitude,Longitude,Distance,Online)values('''
        + user.yhbh + ''',' + point.lat.ToString + ',' + point.lng.ToString +
        ',''0'',''0'')');
      // AResponseInfo.ResponseText := '警告：超过10分钟不在线路上';
    end;
  end
  else
  begin
    dis := 0;
    if his.OnLine then
      dis := his.LastPoint.DistanceTo(point);

    moved := (not his.OnLine) or (dis > 10);
    if moved then
    begin
      // DONE： 保存经纬度信息(YHBH,GXSJ,Lat,Lng,OnLine,dis)
      gSQLHelper.ExecuteSql
        ('insert into YJITSDB.dbo.T_PDA_GPS(YHBH,Latitude,Longitude,Distance,Online)values('''
        + user.yhbh + ''',' + point.lat.ToString + ',' + point.lng.ToString +
        ',' + dis.ToString + ',' + OnLine.ToInteger.ToString + ')');
      his.LastPoint := point;
    end;
  end;
  his.OnLine := OnLine;
  his.lastTime := now;
  gHistory[user.yhbh] := his;
  if user.GPSBH <> '' then
  begin
    TRmInf.police('{"GPSBH":"' + user.GPSBH + '","RYLX":"1","RYBH":"' + user.yhbh
      + '","SBSJ":"' + FormatDateTime('yyyy-mm-dd hh:nn:ss', now) + '","JD":"' +
      point.lng.ToString + '","WD":"' + point.lat.ToString + '"}');
  end;
end;

class procedure THuiZhouKaoHe.Init;
var
  ini: TIniFile;
  host, user, Password, SERVICE_NAME, sid: string;
  port: integer;
begin
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  host := ini.ReadString('Ora', 'Host', '');
  port := ini.ReadInteger('Ora', 'Port', 1521);
  user := ini.ReadString('Ora', 'User_Name', 'rm');
  Password := ini.ReadString('Ora', 'Password', 'rm');
  SERVICE_NAME := ini.ReadString('Ora', 'SERVICE_NAME', '');
  sid := ini.ReadString('Ora', 'SID', '');
  ini.Free;
  if host <> '' then
  begin
    gLineList := TList<TLine>.Create;
    gPosList := TList<TPosition>.Create;
    gZBDic := TDictionary<string, TZB>.Create;
    gHistory := TDictionary<string, THistory>.Create;
    gOraHelper := TOraHelper.Create(host, SERVICE_NAME, sid, user,
      Password, port);
    LoadZBData;
    LoadLineData;
  end;
end;

class procedure THuiZhouKaoHe.LoadZBData;
var
  zb: TZB;
  s, yhbh, qwrq: string;
  kssd, jssd, n: integer;
  date: TDateTime;
  AFormat: TFormatSettings;
begin
  AFormat.ShortDateFormat := 'yyyy-mm-dd';
  AFormat.DateSeparator := '-';
  s := FormatDateTime('yyyymmdd', now);
  s := 'SELECT RYBH,RYXM,QWRQ,KSSD,JSSD FROM SERV_DEPT_SCHEDULE ' +
    'WHERE QWRQ>=''' + s + ''' and JLZT=1 order by RYBH,QWRQ,KSSD';
  zb.yhbh := '';
  with gOraHelper.Query(s) do
  begin
    if not EOF then
      gZBDic.Clear;
    while not EOF do
    begin
      yhbh := FieldByName('RYBH').AsString;
      qwrq := FieldByName('QWRQ').AsString;
      kssd := FieldByName('KSSD').AsInteger;
      jssd := FieldByName('JSSD').AsInteger;
      qwrq := qwrq.Substring(0, 4) + '-' + qwrq.Substring(4, 2) + '-' +
        qwrq.Substring(6, 2);
      date := StrToDateTime(qwrq, AFormat);
      if zb.yhbh <> yhbh then
      begin
        if zb.yhbh <> '' then
          gZBDic.Add(zb.yhbh, zb);
        zb.yhbh := yhbh;
        setlength(zb.sections, 0);
      end;
      n := length(zb.sections);
      setlength(zb.sections, n + 1);
      zb.sections[n].KSSJ := date + kssd * 30 * OneMinute;
      zb.sections[n].JSSJ := date + jssd * 30 * OneMinute;
      Next;
    end;
    if zb.yhbh <> '' then
      gZBDic.Add(zb.yhbh, zb);
    Free;
  end;
end;

class procedure THuiZhouKaoHe.LoadLineData;
var
  s, lonlat: string;
  line: TLine;
  i, n: integer;
  lng, lat: Double;
begin
  s := 'SELECT GLBM,QYZB FROM SERV_PATROL_REGIONAL_AREA WHERE JLZT=1 order by GLBM';
  with gOraHelper.Query(s) do
  begin
    if not EOF then
      gLineList.Clear;

    while not EOF do
    begin
      line.DWDM := FieldByName('GLBM').AsString;
      s := FieldByName('QYZB').AsString;
      if s.StartsWith('LINESTRING') then
      begin
        // LINESTRING(114.416084 23.103077,114.4181 23.10008,114.420395 23.097265)
        setlength(line.points, 0);
        n := 0;
        s := s.Substring(11, s.length - 12);
        for lonlat in s.Split([',']) do
        begin
          i := lonlat.IndexOf(' ');
          lng := StrToFloatDef(lonlat.Substring(0, i), 0);
          lat := StrToFloatDef(lonlat.Substring(i + 1, 20), 0);
          if (lng > 0) and (lat > 0) then
          begin
            setlength(line.points, n + 1);
            line.points[n].lng := lng;
            line.points[n].lat := lat;
            n := n + 1;
          end;
        end;
        gLineList.Add(line);
      end;

      Next;
    end;
    Free;
  end;
end;

class procedure THuiZhouKaoHe.LoadPosData;
var
  s, lonlat: string;
  pst: TPosition;
  i, n: integer;
  lng, lat: Double;
begin
  s := 'SELECT GLBM,WD,JD FROM SERV_PATROL_REGIONAL_POS WHERE JLZT=1 order by GLBM';
  with gOraHelper.Query(s) do
  begin
    if not EOF then
      gPosList.Clear;

    while not EOF do
    begin
      pst.DWDM := FieldByName('GLBM').AsString;
      pst.Point.lat := FieldByName('WD').AsFloat;
      pst.Point.lng := FieldByName('JD').AsFloat;
      gPosList.Add(pst);

      Next;
    end;
    Free;
  end;
end;

class procedure THuiZhouKaoHe.AddPoint(yhbh, dwdm: string; gxsj: TDateTime; point: TLatlng);

  function IsZB(yhbh: string): boolean;
  var
    sec: TZBTime;
  begin
    if not Assigned(gZBDic) then
    begin
      exit(false);
    end;
    if not gZBDic.ContainsKey(yhbh) then
      exit(false);
    for sec in gZBDic[yhbh].sections do
    begin
      if (sec.KSSJ < gxsj) and (sec.JSSJ > gxsj) then
        exit(true);
    end;
    exit(false);
  end;

  function IsOnLine(DWDM: string; point: TLatLng): boolean;
  var
    line: TLine;
    ps: TPosition;
    d: Double;
  begin
    result := false;
    for line in gLineList do
    begin
      if line.DWDM = DWDM then
      begin
        d := point.DistanceToLine(line.points);
        if d < 100 then
          exit(true);
      end;
    end;
    for ps in gPosList do
    begin
      if ps.DWDM = DWDM then
      begin
        d := ps.Point.DistanceTo(point);
        if d < 100 then
          exit(true);
      end;
    end;
  end;

var
  OnLine, moved: boolean;
  his: THistory;
  dis: Double;
begin
  if not IsZB(yhbh) then // 非值班时间
  begin
    // AResponseInfo.ResponseText := '非值班时间, 下次值班开始时间为: 10分钟后';
    exit;
  end;
  // point := point.GCJ02ToWGS84;  //坐标系转换
  OnLine := IsOnLine(DWDM, point);
  if not gHistory.ContainsKey(yhbh) then
  begin
    his.yhbh := yhbh;
    his.firstOutTime := gxsj;
    his.lastTime := gxsj;
    his.OnLine := OnLine;
    his.Leaved := false;
    his.LastPoint := point;
    gHistory.Add(his.yhbh, his);
  end;
  his := gHistory[yhbh];
  if not OnLine then
  begin
    // 不在线路上;
    if his.OnLine then
      his.firstOutTime := gxsj
    else if (not his.Leaved) and (gxsj - his.firstOutTime >= OneMinute * 10) then
    begin
      his.Leaved := true;    // 10分钟不在线才算离开
      gSQLHelper.ExecuteSql
        ('insert into YJITSDB.dbo.T_PDA_GPS(YHBH,Latitude,Longitude,Distance,Online)values('''
        + yhbh + ''',' + point.lat.ToString + ',' + point.lng.ToString +
        ',''0'',''0'')');
    end;
  end
  else
  begin
    his.Leaved := false;
    dis := 0;
    if his.OnLine then
      dis := his.LastPoint.DistanceTo(point);

    moved := (not his.OnLine) or (dis > 10);
    if moved then
    begin
      gSQLHelper.ExecuteSql
        ('insert into YJITSDB.dbo.T_PDA_GPS(YHBH,Latitude,Longitude,Distance,Online)values('''
        + yhbh + ''',' + point.lat.ToString + ',' + point.lng.ToString +
        ',' + dis.ToString + ',' + OnLine.ToInteger.ToString + ')');
      his.LastPoint := point;
    end;
  end;
  his.OnLine := OnLine;
  his.lastTime := gxsj;
  gHistory[yhbh] := his;
end;

class procedure THuiZhouKaoHe.LoadGPS;
var
  sql, yhbh, dwdm: string;
  point: TLatLng;
  gxsj: TDateTime;
begin
  sql := 'select * from CTL_GPS_POLICE where gxsj> order by RYBH,GXSJ';
  with gOraHelper.Query(sql) do
  begin
    while not EOF do
    begin
      yhbh := FieldByName('RYBH').AsString;
      dwdm := FieldByName('DWDM').AsString;
      point.lat := FieldByName('WD').AsFloat;
      point.lng := FieldByName('JD').AsFloat;
      gxsj := FieldByName('gxsj').AsDateTime;
      AddPoint(yhbh, dwdm, gxsj, point);
      Next;
    end;
    Free;
  end;

end;

end.
