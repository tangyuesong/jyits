unit uHuiZhouKaoHe;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, IdCustomHTTPServer,DateUtils,
  Graphics, QBAES, IniFiles, Types, IOUtils, Generics.Collections, Windows,
  Generics.Defaults, FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Def,
  FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Expr, FireDAC.Stan.Pool,
  System.Net.HttpClientComponent, Variants, LatLngHelper, uEntity, uOraHelper;

type
  TVio = record
    DWDM: string;
    Force: integer;
    Violation: integer;
    Surveil: integer;
  end;

  TLine = record
    dwdm: string;
    points: TLatLngs;
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
    LastPoint: TLatLng;
  end;

  THuiZhouKaoHe = Class
  private
    class procedure LoadZBData; static;
    class procedure LoadLineData; static;
  public
    class procedure Init;
    class procedure AddGPS(tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure GetKaoHe(tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
  end;

var
  gLineList: TList<TLine>;
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
    result := false;
    if not gZBDic.ContainsKey(YHBH) then
      exit;
    for sec in gZBDic[YHBH].Sections do
    begin
      if (sec.KSSJ < now)and(sec.JSSJ > now) then
        result := true;
    end;
  end;

  function IsOnLine(dwdm: string; point: TLatLng): boolean;
  var
    line: TLine;
    d: Double;
  begin
    result := false;
    for line in gLineList do
    begin
      if line.dwdm = DWDM then
      begin
        d := point.DistanceToLine(line.Points);
        if d < 100 then
          exit(true);
      end;
    end;
  end;

var
  point: TLatLng;
  user: TUser;
  onLine, moved: boolean;
  his: THistory;
  dis: Double;
begin
  point.lng := StrToFloatDef(params.Values['lng'], 0);
  if point.lng = 0 then
    exit;
  point.lat := StrToFloatDef(params.Values['lat'], 0);
  if point.lat = 0 then
    exit;
  user := gTokenManager.GetToken(tokenKey).User;
  if not IsZB(user.yhbh) then   // 非值班时间
  begin
    // AResponseInfo.ResponseText := '非值班时间, 下次值班开始时间为: 10分钟后';
    exit;
  end;

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
    AResponseInfo.ResponseText := '不在线路上';
    if his.OnLine then
      his.firstOutTime := now
    else if (now - his.firstOutTime > OneMinute * 10)
      and (now - his.firstOutTime < OneMinute * 13) then  // 避免不停告警
    begin
      // AResponseInfo.ResponseText := '警告：超过10分钟不在线路上';
    end;
  end
  else begin
    AResponseInfo.ResponseText := 'OK';
    dis := 0;
    if his.OnLine then
      dis := his.LastPoint.DistanceTo(point);

    moved := (not his.OnLine) or (dis > 10);
    if moved then
    begin
      // TODO： 保存经纬度信息(YHBH,GXSJ,Lat,Lng,OnLine,dis)
      gSQLHelper.ExecuteSql('insert into T_PDA_GPS(YHBH,Latitude,Longitude,Distance,Online)values('''
        + user.yhbh + ''',' + point.lat.ToString + ',' + point.lng.ToString + ',' + dis.ToString + ','
        + OnLine.ToInteger.ToString + ')');
      his.LastPoint := point;
    end;
  end;
  his.OnLine := OnLine;
  his.lastTime := now;
  gHistory[user.yhbh] := his;
end;

class procedure THuiZhouKaoHe.GetKaoHe(tokenKey: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
begin

  //AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(code);
  //AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(bz);
end;

class procedure THuiZhouKaoHe.Init;
var
  ini: TIniFile;
  host, user, Password, SERVICE_NAME, sid: string;
  port: integer;
begin
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  Host := ini.ReadString('Ora', 'Host', '');
  Port := ini.ReadInteger('Ora', 'Port', 1521);
  User := ini.ReadString('Ora', 'User_Name', 'rm');
  Password := ini.ReadString('Ora', 'Password', 'rm');
  SERVICE_NAME := ini.ReadString('Ora', 'SERVICE_NAME', '');
  SID := ini.ReadString('Ora', 'SID', '');
  ini.Free;

  gLineList := TList<TLine>.Create;
  gZBDic := TDictionary<string, TZB>.Create;
  gHistory := TDictionary<string, THistory>.Create;
  gOraHelper := TOraHelper.Create(host, service_name, sid, user, password, port);
  LoadZBData;
  LoadLineData;
end;

class procedure THuiZhouKaoHe.LoadZBData;
var
  zb: TZB;
  s, yhbh, qwrq: string;
  kssd, jssd, n: integer;
  date: TDateTime;
  AFormat: TFormatSettings;
begin
  AFormat.ShortDateFormat := 'yyyymmdd';
  s := FormatDateTime('yyyymmdd', now);
  s := 'SELECT RYBH,RYXM,QWRQ,KSSD,JSSD FROM SERV_DEPT_SCHEDULE ' +
    'WHERE QWRQ>''' + s + ''' and JLZT=1';
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
  lng, lat: double;
begin
  with gOraHelper.Query('SELECT GLBM,QYZB FROM SERV_PATROL_REGIONAL_AREA WHERE JLZT=1') do
  begin
    if not EOF then
      gLineList.Clear;

    while not EOF do
    begin
      line.dwdm := FieldByName('GLBM').AsString;
      s := FieldByName('QYZB').AsString;
      if s.StartsWith('LINESTRING') then
      begin
        //LINESTRING(114.416084 23.103077,114.4181 23.10008,114.420395 23.097265)
        SetLength(line.points, 0);
        n := 0;
        s := s.Substring(12, s.Length - 12);
        for lonlat in s.Split([',']) do
        begin
          i := lonlat.IndexOf(' ');
          lng := strtofloatdef(lonlat.Substring(0, i), 0);
          lat := strtofloatdef(lonlat.Substring(i + 1, 20), 0);
          if (lng > 0)and(lat > 0) then
          begin
            n := n + 1;
            SetLength(line.points, n);
            line.points[n].lng := lng;
            line.points[n].lat := lat;
          end;
        end;
        gLineList.Add(line);
      end;

      Next;
    end;
    Free;
  end;
end;

end.
