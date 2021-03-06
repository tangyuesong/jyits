unit uKKThread;

interface

uses
  Classes, SysUtils, FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Def,
  FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Expr, FireDAC.Stan.Pool,
  IOUtils, IdHttp, Generics.Collections, Variants, DateUtils, uBaseThread,
  uInterface, uTypes, uGlobal, uCommon, uPassList, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TKKThread = class(TBaseThread)
  private
    FConfig: TKKThreadConfig;
    FConn: TFDConnection;
    FQuery: TFDQuery;
    function GetConn: TFDConnection;
    function QueryDataFromOracle: boolean;
    procedure SaveVio(vio: TVioTemp);
    function GetPass: TPass;
    procedure DealPass(pass: TPass);
    function DealVio(pass: TPass): string;
    function GetVioTemp(pass: TPass): TVioTemp;
    function DownLoadPicture(pass: TPass): TPass;
    procedure NetHTTPClient1RequestCompleted(const Sender: TObject;
      const AResponse: IHTTPResponse);
  protected
    procedure Prepare; override;
    procedure Perform; override;
    procedure AfterTerminate; override;
  public
    constructor Create(config: TKKThreadConfig); overload;
    destructor Destroy; override;
  end;

implementation

uses
  uLogger, uSQLHelper, uVio1344Thread;

{ TKKThread }

constructor TKKThread.Create(config: TKKThreadConfig);
begin
  FConfig := config;
  FConn := GetConn;
  inherited Create;
end;

destructor TKKThread.Destroy;
begin
  FQuery.Free;
  FConn.Free;
  inherited;
end;

procedure TKKThread.Prepare;
begin
  inherited;
  logger.Info(FConfig.KKSOURCE + ' start');
end;

procedure TKKThread.AfterTerminate;
begin
  inherited;
  logger.Info(FConfig.KKSOURCE + ' stoped');
end;

procedure TKKThread.Perform;
var
  wfxw: string;
  pass: TPass;
begin
  inherited;
  if QueryDataFromOracle then
  begin
    logger.Info('RecordCount: ' + FQuery.RecordCount.ToString);
    while not FQuery.Eof do
    begin
      try
        pass := GetPass;
        if pass.kdbh <> '' then
        begin
          pass := DownLoadPicture(pass);
          TMypint.DoAlarm(pass);
          wfxw := DealVio(pass);
          pass.WFXW := wfxw;
          DealPass(pass);
        end;
      except
        on e: exception do
          logger.Error('[Perform]' + e.Message);
      end;
      FQuery.Next;
    end;
    FQuery.Close;
  end;
end;

function TKKThread.GetConn: TFDConnection;
begin
  result := TFDConnection.Create(nil);
  result.FetchOptions.Mode := fmAll;
  result.Params.Add('DriverID=Ora');
  result.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [FConfig.KKHost, FConfig.KKPort, FConfig.KKSid]));
  result.Params.Add(Format('User_Name=%s', [FConfig.KKUserName]));
  result.Params.Add(Format('Password=%s', [FConfig.KKPassword]));
  result.Params.Add('CharacterSet=UTF8'); // 否则中文乱码
  result.LoginPrompt := false;

  FQuery := TFDQuery.Create(nil);
  FQuery.DisableControls;
  FQuery.Connection := result;
end;

function TKKThread.QueryDataFromOracle: boolean;
var
  lastGCXH: string;
begin
  result := True;
  lastGCXH := SQLHelper.GetSinge('select KKLASTTIME from T_KK_DBCONFIG where kksource=' +  FConfig.KKSOURCE.QuotedString);
  FQuery.Close;
  FQuery.SQL.Text := 'select * from (' +
    'select GCXH,KDBH,FXBH,HPZL,HPHM,CWHPHM,CWHPYS,HPYZ,GCSJ,CLSD,CLXS,HPYS,CLLX,XSZT,CLPP,CLWX,CSYS,CDBH,TP1,TP2,TP3,WFBJ,RKSJ '
    + ' from ' + FConfig.KKVEH_PASSREC + ' where gcxh>''' + lastGcxh
    + ''' and gcsj>=to_date(''' + FormatDateTime('yyyy-mm-dd hh:mm:ss', now - 1/24) + ''',''yyyy-mm-dd HH24:mi:ss'') '
    + ' and KDBH like ''' + copy(FConfig.CJJG, 1, 6) + '%'' order by gcxh ) where rownum<=' + FConfig.KKROWNUM.ToString
    + ' order by gcxh desc';
  try
    FConn.Open;
    FQuery.Open;
  except
    on e: exception do
    begin
      result := false;
      logger.Error('QueryDataFromOracle:' + e.Message + FQuery.SQL.Text);
    end;
  end;
  if FQuery.RecordCount > 0 then
  begin
    lastGCXH := FQuery.FieldByName('GCXH').AsString;
    SQLHelper.ExecuteSql('update T_KK_DBCONFIG set KKLASTTIME=''' + lastGCXH +
        ''' where kksource=' + FConfig.KKSOURCE.QuotedString);
  end
  else if FQuery.RecordCount < 100 then
    sleep(10000);
end;

procedure TKKThread.SaveVio(vio: TVioTemp);
var
  SQL: string;
begin
  SQL := 'insert into t_vio_temp (cjjg,hphm,hpzl,csys,clpp,wfdd,wfxw,wfsj,cd,xzsd,zdxs,zgxs,sjsd,PHOTOFILE1,PHOTOFILE2,PHOTOFILE3,FWQDZ,BJ)'
    + ' values ' + '(' + vio.CJJG.QuotedString + ',' + vio.hphm.QuotedString +
    ',' + vio.hpzl.QuotedString + ',' + vio.CSYS.QuotedString + ',' +
    vio.CLPP.QuotedString + ',' + vio.WFDD.QuotedString + ',' +
    vio.WFXW.QuotedString + ',' +
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', vio.WFSJ)) + ',' +
    vio.CD.QuotedString + ',' + IntToStr(vio.XZSD) + ',' + IntToStr(vio.ZGXS) +
    ',' + IntToStr(vio.ZDXS) + ',' + vio.SJSD.ToString() + ',' +
    vio.PHOTOFILE1.QuotedString + ',' + vio.PHOTOFILE2.QuotedString + ',' +
    vio.PHOTOFILE3.QuotedString + ',' + vio.fwqdz.QuotedString + ',''0'')';
  SQLHelper.ExecuteSql(SQL);
end;

function TKKThread.GetPass: TPass;
var
  device: TDevice;
begin
  result.gcxh := FQuery.FieldByName('gcxh').AsString;
  result.lkbh := FQuery.FieldByName('kdbh').AsString;
  result.fxbh := FQuery.FieldByName('fxbh').AsString;
  result.kdbh := result.lkbh + result.fxbh;

  if not gDicDevice.ContainsKey(result.kdbh) then
  begin
    if not gUnknowDevice.ContainsKey(result.kdbh) then
    begin
      gUnknowDevice.Add(result.kdbh, true);
      logger.Warn('设备号未备案: [' + result.kdbh + ']');
    end;
    result.kdbh := '';
    exit;
  end;

  result.cdbh := FQuery.FieldByName('CDBH').AsString;
  result.gcsj := FQuery.FieldByName('gcsj').AsString;
  result.hphm := FQuery.FieldByName('hphm').AsString;
  result.hpzl := FQuery.FieldByName('hpzl').AsString;
  result.clsd := FQuery.FieldByName('clsd').AsString;
  result.hpys := FQuery.FieldByName('hpys').AsString;
  result.cllx := FQuery.FieldByName('cllx').AsString;
  result.cwhphm := FQuery.FieldByName('cwhphm').AsString;
  result.cwhpys := FQuery.FieldByName('cwhpys').AsString;
  result.hpyz := FQuery.FieldByName('hpyz').AsString;
  result.CSYS := FQuery.FieldByName('csys').AsString;
  result.clxs := FQuery.FieldByName('clxs').AsString;
  result.CLPP := FQuery.FieldByName('clpp').AsString;
  result.clwx := FQuery.FieldByName('clwx').AsString;
  result.xszt := FQuery.FieldByName('xszt').AsString;
  result.wfbj := FQuery.FieldByName('wfbj').AsString;
  result.tp1 := FQuery.FieldByName('tp1').AsString;
  result.tp2 := FQuery.FieldByName('tp2').AsString;
  result.tp3 := FQuery.FieldByName('tp3').AsString;
  result.rksj := FormatDateTime('yyyy/mm/dd hh:mm:ss', FQuery.FieldByName('RKSJ').AsDateTime);
  result.KKSOURCE := FConfig.KKSOURCE;

  result.yrksj := '0';
  result.alarm_type := '0';
  result.alarm_src := '0';
  result.alarm_src_id := '0';
  result.flag := '0';
  result.ser01 := '';
  result.ser02 := '';
  result.ser03 := '';
  result.ser04 := '';
  result.ser05 := '';
  result.ser06 := '0';
  result.ser07 := '0';
  result.ser08 := '';
  result.gxsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
  result.ser09 := result.gxsj;

  device := gDicDevice[result.kdbh];
  result.ldbh := device.ldbh;
  result.CJJG := device.CJJG;
  result.babh := device.babh;
  result.FXBH := device.FXBH;

  if (Length(Trim(result.hphm)) = 0) or (result.hphm = '无车牌') then
  begin
    result.hphm := '-';
  end;
  if result.hphm = '-' then
    result.hpzl := '44';
  if result.HPZL = '99' then
    result.HPZL := '44';
  try
    if result.tp1 <> '' then
      result.fwqdz := TPath.GetDirectoryName(result.tp1) + '/'
    else if result.tp2 <> '' then
      result.fwqdz := TPath.GetDirectoryName(result.tp2) + '/'
    else if result.tp3 <> '' then
      result.fwqdz := TPath.GetDirectoryName(result.tp3) + '/'
    else
      result.fwqdz := '';
    result.tp1 := TPath.GetFileName(result.tp1);
    result.tp2 := TPath.GetFileName(result.tp2);
    result.tp3 := TPath.GetFileName(result.tp3);
  except
    on e: exception do
      logger.Error('[TKKThread.GetPass]' + e.Message + result.tp1);
  end;
end;

procedure TKKThread.NetHTTPClient1RequestCompleted(const Sender: TObject;
  const AResponse: IHTTPResponse);
//var
//  resp: string;
begin
//  resp := AResponse.ContentAsString();
//  if resp.Contains(':0') then
//    logger.Warn('[HttpGet.Response]' + resp);
  Sender.Free;
end;


function TKKThread.DownLoadPicture(pass: TPass): TPass;
  function HttpGet(url: string; Asynchronous: boolean): boolean;
  var
    http: TNetHttpClient;
  begin
    result := false;
    http := TNetHttpClient.Create(nil);
    if Asynchronous then
    begin
      http.Asynchronous := true;
      http.OnRequestCompleted := NetHTTPClient1RequestCompleted;
    end;
    try
      http.Get(url);
      result := true;
      logger.Debug('[TKKThread.HttpGet]' + url);
    except
      on e: exception do
      begin
        logger.Error('[TKKThread.HttpGet]' +  e.Message);
        http.Free;
      end;
    end;
    if not Asynchronous then
      http.Free;
  end;
  function HttpSend(fwqdz, tp1, tp2, tp3, path: string): boolean;
  var
    url: string;
  begin
    url := gDLMUrl + 'src=' + fwqdz + tp1 + '&tgt=' + path + tp1;
    result := HttpGet(url, gAsynchronous);
    //if tp2 <> '' then
    //  HttpGet(gDLMUrl + 'src=' + fwqdz + tp2 + '&tgt=' + path + tp2);
    //if tp3 <> '' then
    //  HttpGet(gDLMUrl + 'src=' + fwqdz + tp3 + '&tgt=' + path + tp3);
  end;
var
  path: string;
  kpc: TKKPictureConfig;
begin
  result := pass;
  if gDLMUrl = '' then exit;
  if gPicturePathMap.ContainsKey(pass.kdbh) then
  begin
    kpc := gPicturePathMap[pass.kdbh];
  end
  else if gPicturePathMap.ContainsKey('other') then
  begin
    kpc := gPicturePathMap['other'];
  end
  else
    exit;
  path := formatdatetime('yyyymm\dd\', Now) + pass.kdbh + '\';
  if HttpSend(pass.FWQDZ, pass.tp1, pass.tp2, pass.tp3, kpc.LocalPath + path) then
  begin
    //result.ser01 := kpc.Url + path.Replace('\', '/');
    result.ser01 := result.FWQDZ;
    result.FWQDZ := kpc.Url + path.Replace('\', '/');
    logger.Debug('ser01:' + result.ser01);
  end;
end;

function TKKThread.GetVioTemp(pass: TPass): TVioTemp;
begin
  result.CJJG := pass.CJJG;
  result.fwqdz := pass.fwqdz;
  result.PHOTOFILE1 := pass.tp1;
  result.PHOTOFILE2 := pass.tp2;
  result.PHOTOFILE3 := '';
  result.WFDD := pass.kdbh;
  result.CD := pass.cdbh;
  result.WFSJ := vartodatetime(pass.gcsj);
  result.hphm := pass.hphm;
  result.hpzl := pass.hpzl;
  result.SJSD := strtointdef(pass.clsd, 0);
  result.GCXH := pass.GCXH;
  result.SJSD := strtointdef(pass.clsd, 0);
end;

function TKKThread.DealVio(pass: TPass): string;
var
  device: TDevice;
  tmp: TVioTemp;
begin
  result := '';
  device := gDicDevice[pass.kdbh];
  tmp := GetVioTemp(pass);
  // 限速抓拍
  if device.XSZB then
  begin
    tmp.XZSD := device.XZSD;
    tmp.ZDXS := device.DCXZSD;
    if tmp.hpzl = '01' then
    begin
      tmp.XZSD := tmp.ZDXS;
    end;
    tmp.WFXW := Tmypint.getSpeedtoWFXW(tmp.hpzl, tmp.SJSD, tmp.XZSD);
    result := tmp.WFXW;
    if tmp.WFXW.Length >= 4 then
      SaveVio(tmp);
  end;
  // 压实线抓拍
  if device.YSXZB then
  begin
    tmp.WFXW := '1345';
    result := result + ' 1345';
    SaveVio(tmp);
  end;
  // 限行抓拍
  if device.XXZB then
  begin
    tmp.WFXW := '1344';
    result := result + ' 1344';
    SaveVio(tmp);
  end;
  // 黄标车闯禁行
  if device.HBCZB then
  begin
    if gDicHBC.ContainsKey(tmp.hphm + tmp.hpzl) then
    begin
      tmp.WFXW := '13441';
      result := result + ' 13441';
      SaveVio(tmp);
    end;
  end;

  // 大型车辆限行抓拍
  if DCXXZP.Contains(device.SBBH) then
  begin
    if tmp.hpzl = '01' then
    begin
      vio1344Thread.Push(tmp);
    end;
  end;
end;

procedure TKKThread.DealPass(pass: TPass);
var
  device: TDevice;
  gxsj: double;
begin
  try
    device := gDicDevice[pass.kdbh];
    gxsj := VarToDateTime(pass.GCSJ);
    if gxsj - device.gxsj > 10 * OneMinute then // 每10分钟更新设备最新过车时间
    begin
      UpdateDeviceGXSJ(device.sbbh, gxsj);
    end;

    // 上传缉查平台
    if device.SCJCPT then
    begin
      if Length(Trim(device.babh)) > 0 then
        Tmypint.WriteVehicleInfo(pass, device);
    end;
    PassList.Add(pass);
  except
    on e: exception do
      logger.Error('DealPass:' + e.Message);
  end;
end;

end.
