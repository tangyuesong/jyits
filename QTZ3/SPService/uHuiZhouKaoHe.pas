unit uHuiZhouKaoHe;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, IdCustomHTTPServer,DateUtils,
  Graphics, QBAES, IniFiles, Types, IOUtils, Generics.Collections, Windows,
  Generics.Defaults, FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Def,
  FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Expr, FireDAC.Stan.Pool,
  System.Net.HttpClientComponent, Variants, LatLngHelper, uEntity;

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
    FKSSJ, FJSSJ: TDateTime;
  public
    procedure AddGPS(tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    procedure GetKaoHe(tokenKey: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    constructor Create(kssj, jssj: TDateTime);
    destructor Destroy; override;
  end;
var
  gLineList: TList<TLine>;
  gZBDic: TDictionary<string, TZB>;
  gHistory: TDictionary<string, THistory>;

implementation

{ THuiZhouKaoHe }

procedure THuiZhouKaoHe.AddGPS(tokenKey: String; params: TStrings;
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
    his := gHistory[user.yhbh];
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

constructor THuiZhouKaoHe.Create(kssj, jssj: TDateTime);
var
  host, port, dbname, user, password: string;
begin
  FKSSJ := kssj;
  FJSSJ := jssj;
end;

destructor THuiZhouKaoHe.Destroy;
begin

end;

procedure THuiZhouKaoHe.GetKaoHe(tokenKey: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
begin

  //AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(code);
  //AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(bz);
end;

end.
