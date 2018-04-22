unit uRmService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IniFiles, IdContext, uLogger, HTTPApp, uTmri, uRmweb,
  uRminf, uTrans, ActiveX, IdURI, IdHttp, StrUtils, uLockVio,
  IdSSLOpenSSL, uTokenManager, uGlobal, uCommon, QJson;

type

  TRmService = class
  private
    class function ParamsToJson(params: TStrings; exceptName: string = '')
      : string; static;
    class procedure DoGetVehInfo(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoGetDrvInfo(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoWriteVio(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoRminf(action: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoRmweb(action: String; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DoWriteVehicleInfo(params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure GetVioPic(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo); static;
    class function DoQeury(token: TToken; params: TStrings): String;
    class function DoWrite(token: TToken; params: TStrings): String;
    class procedure GetViolationInfo(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure SaveSimpleVio(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure SaveDutySimple(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure SaveForceVio(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure WriteSG(token: TToken; params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
  public
    class function GetVehInfo(token: TToken; hphm, hpzl: String): String;
    class function GetDrvInfo(token: TToken; params: TStrings): String;
    class function GetVioInfoByDrv(token: TToken; params: TStrings): String;
    class procedure DoRM(action, tokenKey: String; params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
  end;

var
  RmService: TRmService;

implementation

class function TRmService.ParamsToJson(params: TStrings;
  exceptName: string = ''): string;
var
  first: Boolean;
  i: Integer;
begin
  first := True;
  result := '{';
  exceptName := exceptName.ToLower;
  for i := 0 to params.Count - 1 do
  begin
    if (not exceptName.Contains(',' + params.Names[i].ToLower + ',')) and
      (params.Names[i] <> '') and (params.ValueFromIndex[i] <> '') then
    begin
      if first then
      begin
        result := result + '"' + params.Names[i].ToLower + '":"' +
          params.ValueFromIndex[i] + '"';
        first := false;
      end
      else
        result := result + ',"' + params.Names[i].ToLower + '":"' +
          params.ValueFromIndex[i] + '"';
    end;
  end;
  result := result + '}';
end;

class procedure TRmService.DoGetDrvInfo(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: String;
begin
  json := GetDrvInfo(token, params);
  if (json = '-1') or (json = '') then // 查询6合1失败
    json := TCommon.QueryDrvInfo(params.Values['SFZMHM'],
      params.Values['DABH']);
  if (json = '-1') or (json = '') then
    json := '{}';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
end;

class procedure TRmService.DoGetVehInfo(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  json := GetVehInfo(token, params.Values['HPHM'], params.Values['HPZL']);
  if (json = '-1') or (json = '') then // 如果查询6合1失败，查询本地复制库
    json := TCommon.QueryVehInfo(params.Values['HPHM'], params.Values['HPZL']);
  if (json = '-1') or (json = '') then
    json := '{}';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
end;

class procedure TRmService.DoWriteVio(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, flag: string;
  tp: TTmriParam;
begin
  json := params.Values['vio'];
  flag := params.Values['flag'];
  if flag = '0' then
    tp := TCommon.GetTmriParam('04C52', token)
  else
    tp := TCommon.GetTmriParam('04C53', token);
  AResponseInfo.ContentText := TTmri.Write(tp, json);
end;

class procedure TRmService.DoWriteVehicleInfo(params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  kkbh: string;
  fxlx: string;
  cdh: Int64;
  hphm: string;
  hpzl: string;
  gcsj: string;
  clsd: Int64;
  clxs: Int64;
  wfdm: string;
  cwkc: Int64;
  hpys: string;
  cllx: string;
  fzhpzl: string;
  fzhphm: string;
  fzhpys: string;
  clpp: string;
  clwx: string;
  csys: string;
  tplj: string;
  tp1: string;
  tp2: string;
  tp3: string;
  tztp: string;
  rst: Int64;
begin
  try
    kkbh := params.Values['kkbh'];
    fxlx := params.Values['fxlx'];
    cdh := strtointdef(params.Values['cdh'], 0);
    hphm := params.Values['hphm'];
    hpzl := params.Values['hpzl'];
    gcsj := params.Values['gcsj'];
    clsd := strtointdef(params.Values['clsd'], 0);
    clxs := strtointdef(params.Values['clxs'], 0);
    wfdm := params.Values['wfdm'];
    cwkc := strtointdef(params.Values['cwkc'], 0);
    hpys := params.Values['hpys'];
    cllx := params.Values['cllx'];
    fzhpzl := params.Values['fzhpzl'];
    fzhphm := params.Values['fzhphm'];
    fzhpys := params.Values['fzhpys'];
    clpp := params.Values['clpp'];
    clwx := params.Values['clwx'];
    csys := params.Values['csys'];
    tplj := params.Values['tplj'];
    tp1 := params.Values['tp1'];
    tp2 := params.Values['tp2'];
    tp3 := params.Values['tp3'];
    tztp := params.Values['tztp'];

    rst := TTrans.WriteVehicleInfo(kkbh, fxlx, cdh, hphm, hpzl, gcsj, clsd,
      clxs, wfdm, cwkc, hpys, cllx, fzhpzl, fzhphm, fzhpys, clpp, clwx, csys,
      tplj, tp1, tp2, tp3, tztp);
    AResponseInfo.ContentText := rst.ToString();
  except
    on e: Exception do
      logger.Error(e.Message);
  end;
end;

class procedure TRmService.DoRmweb(action: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  action := LowerCase(action);
  json := ParamsToJson(params);

  if action = 'qvehbus' then
    json := TRmweb.qvehbus(json)
  else if action = 'qstation' then
    json := TRmweb.qstation(json)
  else if action = 'qstationrelation' then
    json := TRmweb.qstationrelation(json)
  else if action = 'qstationperson' then
    json := TRmweb.qstationperson(json)
  else if action = 'feedback' then
    json := TRmweb.feedback(json)
  else if action = 'feedbackpic' then
    json := TRmweb.feedbackpic(json)
  else if action = 'vehcheck' then
    json := TRmweb.vehcheck(json);
  AResponseInfo.ContentText := json;
end;

class procedure TRmService.DoRminf(action: String; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json: string;
begin
  action := LowerCase(action);
  json := ParamsToJson(params);

  if action = 'surscreen' then
    json := TRminf.surscreen(json)
  else if action = 'surexamine' then
    json := TRminf.surexamine(json)
  else if action = 'flowequip' then
    json := TRminf.flowequip(json)
  else if action = 'weather' then
    json := TRminf.weather(json)
  else if action = 'incident' then
    json := TRminf.incident(json)
  else if action = 'inducement' then
    json := TRminf.inducement(json)
  else if action = 'car' then
    json := TRminf.car(json)
  else if action = 'police' then
    json := TRminf.police(json)
  else if action = 'park' then
    json := TRminf.park(json);
  AResponseInfo.ContentText := json;
end;

class function TRmService.DoQeury(token: TToken; params: TStrings): String;
var
  json: string;
  tmriParam: TTmriParam;
begin
  tmriParam := TCommon.GetTmriParam(params.Values['JKID'], token);
  json := ParamsToJson(params, ',JKID,');
  json := TTmri.Query(tmriParam, json);
  result := json;
end;

class function TRmService.DoWrite(token: TToken; params: TStrings): String;
var
  json: string;
  tmriParam: TTmriParam;
begin
  tmriParam := TCommon.GetTmriParam(params.Values['JKID'], token);
  json := ParamsToJson(params, ',JKID,');
  gLogger.Info('[DoWrite]' + json);
  json := TTmri.Write(tmriParam, json);
  result := json;
end;

class procedure TRmService.GetVioPic(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, xh, hphm, hpzl, wfsj, sjson: string;
  QJson: TQJson;
  i: Integer;
  t: Int64;
  sj: TDatetime;
begin
  try
    xh := params.Values['xh'];
    if xh = '' then
    begin
      hphm := Uppercase(params.Values['HPHM']);
      hpzl := params.Values['hpzl'];
      wfsj := params.Values['wfsj'];
      if (hphm = '') or (hpzl = '') or (wfsj = '') then
      begin
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('parameter error');
        exit;
      end;
      t := StrToInt64Def(wfsj, 0);
      if t = 0 then
      begin
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('parameter error');
        exit;
      end
      else
        sj := TCommon.GetRealDatetime(t);

      params.Add('JKID=04C03');
      json := DoQeury(token, params);

      json := TCommon.GetJsonNode('viosurveil', json);
      QJson := TQJson.Create;
      QJson.Parse(json);
      for i := 0 to QJson.Count - 1 do
      begin
        if FormatDatetime('yyyy-mm-dd hh:nn', sj)
          = LeftStr(TCommon.GetJsonNode('wfsj', QJson.Items[i].ToString), 16)
        then
        begin
          xh := TCommon.GetJsonNode('xh', QJson.Items[i].ToString);
          break;
        end;
      end;
      QJson.Free;
    end;

    if xh <> '' then
    begin
      params.Clear;
      params.Add('xh=' + xh);
      params.Add('JKID=04C04');
      sjson := DoQeury(token, params);
      json := TCommon.GetJsonNode('viojdczp', sjson);
      if json = '' then
      begin
        gLogger.Info(sjson);
        json := '[]';
      end;
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
    end
    else
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('[]');
  except
    on e: Exception do
    begin
      gLogger.Error(e.Message);
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(e.Message);
    end;
  end;
end;

class procedure TRmService.DoRM(action, tokenKey: String; params: TStrings;
  isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
const
  rmweb = ',QVEHBUS,QSTATION,QSTATIONRELATION,QSTATIONPERSON,FEEDBACK,FEEDBACKPIC,VEHCHECK,';
  rminf = ',SURSCREEN,SUREXAMINE,FLOWEQUIP,WEATHER,INCIDENT,INDUCEMENT,CAR,POLICE,PARK,';
var
  wsbh, wslb, num, json, sjson: string;
  token: TToken;
begin
  ActiveX.CoInitialize(nil);

  token := gTokenManager.GetToken(tokenKey);

  if action = Uppercase('GetVehInfo') then
  begin
    DoGetVehInfo(token, params, AResponseInfo);
  end
  else if action = Uppercase('GetDrvInfo') then
  begin
    DoGetDrvInfo(token, params, AResponseInfo);
  end
  else if action = Uppercase('GetVioInfoByDrv') then
  begin
    json := GetVioInfoByDrv(token, params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  end
  else if action = Uppercase('GetVioPicinfo') then
  begin
    GetVioPic(token, params, AResponseInfo);
  end
  else if action = Uppercase('GetVioInfoByVeh') then
  begin
    params.Add('JKID=04C03');
    sjson := DoQeury(token, params);
    gLogger.Info(sjson);
    json := TCommon.GetJsonNode('viosurveil', sjson);
    if json = '' then
    begin
      gLogger.Info(sjson);
      json := '[]';
    end
    else
      json := TCommon.AddWfxwmc(json);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  end
  else if action = Uppercase('WriteVio') then
  begin
    DoWriteVio(token, params, AResponseInfo);
  end
  else if action = Uppercase('WriteVehicleInfo') then
  begin
    DoWriteVehicleInfo(params, AResponseInfo);
  end
  // 六合一 查询
  else if action = 'QUERY' then
  begin
    AResponseInfo.ContentText := DoQeury(token, params);
  end
  // 六合一 写入
  else if action = 'WRITE' then
  begin
    AResponseInfo.ContentText := DoWrite(token, params);
  end
  // 集中指挥平台 查询
  else if rmweb.Contains(action) then
  begin
    DoRmweb(action, params, AResponseInfo);
  end
  // 集中指挥平台 写入
  else if rminf.Contains(action) then
  begin
    DoRminf(action, params, AResponseInfo);
  end
  // 文书管理 begin
  else if action = 'APPLYWSBH' then
  begin
    wslb := params.Values['wslb'];
    num := params.Values['num'];
    wsbh := gWSManager.Apply(token.Login, wslb, strtointdef(num, 0));
    wsbh := '{"wsbh":"' + wsbh + '"}';
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(wsbh);
  end
  else if action = 'SUBMITWSBH' then
  begin
    wsbh := params.Values['wsbh'];
    if gWSManager.Submit(wsbh) then
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('');
  end
  else if action = 'ROLLBACKWSBH' then
  begin
    wsbh := params.Values['wsbh'];
    if gWSManager.Rollback(wsbh) then
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('');
  end
  // 文书管理 end
  else if action = 'GETVIOLATIONINFO' then
  begin
    GetViolationInfo(token, params, AResponseInfo);
  end
  else if action = 'SAVESIMPLEVIO' then
  begin
    SaveSimpleVio(token, params, AResponseInfo);
  end
  else if action = 'SAVEDUTYSIMPLE' then
  begin
    SaveDutySimple(token, params, AResponseInfo);
  end
  else if action = 'WRITESG' then
  begin
    WriteSG(token, params, AResponseInfo);
  end
  else if action = 'SAVEFORCEVIO' then
  begin
    SaveForceVio(token, params, AResponseInfo);
  end;
  ActiveX.CoUninitialize;
end;

class function TRmService.GetDrvInfo(token: TToken; params: TStrings): String;
var
  json: String;
begin
  params.Add('JKID=02C26');
  json := DoQeury(token, params);
  result := TCommon.GetJsonNode('drv', json);
  if result = json then
    result := '-1'
  else
    TCommon.SaveDrvInfo(json);
end;

class function TRmService.GetVehInfo(token: TToken; hphm, hpzl: String): String;
var
  sf, json: string;
  params: TStrings;
begin
  params := TStringList.Create;
  sf := copy(hphm, 1, 1);
  params.Add('hphm=' + copy(hphm, 2, 100));
  params.Add('hpzl=' + hpzl);
  if sf = '粤' then
    params.Add('JKID=01C21')
  else
  begin
    params.Add('sf=' + sf);
    params.Add('JKID=01C49');
  end;
  json := DoQeury(token, params);
  result := TCommon.GetJsonNode('veh', json);
  if result = json then
    result := '-1'
  else
    TCommon.SaveVehInfo(result);
  params.Free;
end;

class function TRmService.GetVioInfoByDrv(token: TToken;
  params: TStrings): String;
var
  sjson: String;
begin
  params.Add('JKID=04C01');
  sjson := DoQeury(token, params);
  result := TCommon.GetJsonNode('violation', sjson);
  if result = '' then
  begin
    gLogger.Info(sjson);
    result := '[]';
  end
  else
    result := TCommon.AddWfxwmc(result);
end;

class procedure TRmService.GetViolationInfo(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  jkid, wsbh, wslb, json, sjson, viotag: String;
  condition: TStrings;
begin
  wsbh := params.Values['wsbh'];
  wslb := params.Values['wslb'];
  if (wsbh = '') or (wslb = '') then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('parameter error');
    exit;
  end;
  if (wslb <> '3') and (wslb <> '6') then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('parameter error');
    exit;
  end;

  condition := TStringList.Create;
  if wslb = '6' then
  begin
    viotag := 'violation';
    condition.Add('JKID=04C01');
    condition.Add('jdsbh=' + wsbh);
  end
  else
  begin
    jkid := '04C02';
    viotag := 'vioforce';
    condition.Add('JKID=04C02');
    condition.Add('pzbh=' + wsbh);
  end;
  sjson := DoQeury(token, condition);
  json := TCommon.GetJsonNode(viotag, sjson);
  if json = '' then
  begin
    gLogger.Info(sjson);
    json := '[]';
  end;
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
  condition.Free;
end;

class procedure TRmService.SaveForceVio(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, code, hphm, hpzl, cjjg, wfsj: String;
  tmriParam: TTmriParam;
  n: Integer;
begin
  hphm := params.Values['hphm'];
  hpzl := params.Values['hpzl'];
  cjjg := params.Values['fxjg'];
  wfsj := params.Values['wfsj'];

  params.Add('JKID=04C55');
  json := DoWrite(token, params);
  gLogger.Info(json);
  code := TCommon.GetJsonNode('code', json);
  if code = '1' then
  begin
    if params.IndexOf('lrr') >= 0 then
      params.Values['lrr'] := token.Login
    else
      params.Add('lrr=' + token.Login);
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    TCommon.WriteForceVio(params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
  end
  else if code = '0' then
  begin
    code := TCommon.GetJsonNode('msg', json);
    if code = '' then
      code := TCommon.GetJsonNode('msg1', json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
  end
  else // 6合1问题
  begin
    gLogger.Info(json);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    params.Add('bz=write zhpt error:' + json);
    TCommon.WriteForceVio(params);
  end;
end;

class procedure TRmService.SaveSimpleVio(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, code, hphm, hpzl, cjjg, wfsj: String;
  tmriParam: TTmriParam;
  n: Integer;
begin
  hphm := params.Values['hphm'];
  hpzl := params.Values['hpzl'];
  cjjg := params.Values['fxjg'];
  wfsj := params.Values['wfsj'];

  params.Add('JKID=04C54');
  json := DoWrite(token, params);
  gLogger.Info(json);
  code := TCommon.GetJsonNode('code', json);
  if code = '1' then
  begin
    if params.IndexOf('lrr') >= 0 then
      params.Values['lrr'] := token.Login
    else
      params.Add('lrr=' + token.Login);
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    TCommon.WriteSimpleVio(params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
  end
  else if code = '0' then
  begin
    gLogger.Info(json);
    code := TCommon.GetJsonNode('msg', json);
    if code = '' then
      code := TCommon.GetJsonNode('msg1', json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
  end
  else // 6合1问题
  begin
    gLogger.Info(json);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    params.Add('bz=write zhpt error:' + json);
    TCommon.WriteSimpleVio(params);
  end;
end;

class procedure TRmService.WriteSG(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  ryInfo: String;
  ts: TStrings;
begin
  {
    params.Clear;
    params.Add('jdsbh=445100100601478');
    params.Add('ryfl=4');
    params.Add('jszh=440583198401123199');
    params.Add('fzjg=粤U');
    params.Add('zjcx=B2E');
    params.Add('hphm=粤U99858');
    params.Add('dsr=林广铭');
    params.Add('clfl=3');
    params.Add('hpzl=02');
    params.Add('jtfs=K33');
    params.Add('wfsj=2018-03-29 18:30:38');
    params.Add('xzqh=445101');
    params.Add('wfdd=60582');
    params.Add('lddm=1004');
    params.Add('wfdz=市区福安路口市区福安路口北往南');
    params.Add('wfxw=1090');
    params.Add('cfzl=1');
    params.Add('fkje=0');
    params.Add('jkfs=0');
    params.Add('jkbj=0');
    params.Add('sgdj=0');
    params.Add('jsjqbj=00');
    params.Add('zqmj=250414');
    params.Add('fxjg=445104005200');
    params.Add('dabh=445192129223');
    params.Add('dh=13509890999');
    params.Add('ddms=0');
  }
  // ryInfo := '$$445101$$1$$胡舒敏$$1$$342921198309063411$$35$$广州$$13570969818$$15$$1$$9009$$$$$$$$$$$$$$F1$$342921$$$$$$$$C1$$$$'
  // + '$$粤A$$5$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$11$$';

  ryInfo := '$$445101$$1$$李四$$1$$342921198309063551$$35$$$$$$15$$1$$9009$$$$$$$$$$$$$$X9$$342921$$$$$$$$$$$$'
    + '$$$$5$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$11$$' + '~~' +
    '$$445101$$2$$张三$$1$$445121198111054555$$37$$$$$$14$$1$$$$$$$$$$$$$$$$X9$$445102$$$$$$$$$$$$'
    + '$$$$5$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$11$$~~';
  ts := TStringList.Create;
  ts.LoadFromFile(ExtractFilePath(paramstr(0)) + 'sg.txt');
  ryInfo := ts.Text;
  ts.Free;
  params.Clear;
  // params.Add('sgbh=' + FormatDatetime('yyymmddhhnnsszzz', now()));
  params.Add('xzqh=445101');
  params.Add('sgfssj=2018-03-31 11:05');
  params.Add('lh=60546');
  params.Add('lm=市区奎元路口');
  params.Add('gls=1001');
  params.Add('ms=0');
  params.Add('sgdd=市区奎元路口');
  params.Add('ssrs=0');
  params.Add('zjccss=0');
  params.Add('sgrdyy=9009');
  params.Add('tq=2');
  params.Add('dllx=22');
  params.Add('sgxt=36');
  params.Add('dcsg=21');
  params.Add('tjr=陈焕林');
  params.Add('cclrsj=2018-03-31 11:05:00');
  params.Add('sszd=445101000000');
  params.Add('glbm=445100000000');
  params.Add('sgss=测试数据');
  params.Add('zrtjjg=经双方共同请求调解达成一致：赔偿元，就是结案。');
  params.Add('jar1=陈焕林');
  params.Add('jar2=林广铭');
  params.Add('jbr=陈焕林');
  params.Add('gxsj=2018-03-31 11:05:00');
  params.Add('jafs=1');
  params.Add('tjfs=1');
  params.Add('ryxx=' + ryInfo);
  params.Add('rylen=1');
  SaveDutySimple(token, params, AResponseInfo);

  // SaveSimpleVio(token, params, AResponseInfo);
end;

class procedure TRmService.SaveDutySimple(token: TToken; params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  n: Integer;
  json, code, djbh, sgbh: String;
  tmriParam: TTmriParam;
begin
  params.Add('JKID=03C52');
  json := DoWrite(token, params);
  code := TCommon.GetJsonNode('code', json);
  if code = '1' then
  begin
    djbh := TCommon.GetJsonNode('message', json);
    sgbh := TCommon.GetJsonNode('Message1', json);
    if params.IndexOf('djbh') >= 0 then
      params.Values['djbh'] := djbh
    else
      params.Add('djbh=' + djbh);
    if params.IndexOf('sgbh') >= 0 then
      params.Values['sgbh'] := djbh
    else
      params.Add('sgbh=' + sgbh);
    if params.IndexOf('lrr') >= 0 then
      params.Values['lrr'] := token.Login
    else
      params.Add('lrr=' + token.Login);
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    TCommon.WriteDutySimple(params);
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
      ('"' + sgbh + '"');
  end
  else if code = '0' then
  begin
    gLogger.Info(json);
    code := TCommon.GetJsonNode('message', json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(code);
  end
  else // 6合1问题,不能暂时缓存到数据库，因为要返回事故编号，用来开单
  begin
    gLogger.Info(json);
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(json);
    // AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('');
    n := params.IndexOfName('JKID');
    if n >= 0 then
      params.Delete(n);
    params.Add('bz=write zhpt error:' + json);
    TCommon.WriteDutySimple(params);
  end;

end;

end.
