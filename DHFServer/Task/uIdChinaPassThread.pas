unit uIdChinaPassThread;

interface

uses
  Classes, SysUtils, FireDAC.Comp.Client, Generics.Collections, Variants,
  DateUtils, IdHttp, uCommon, uInterface, uTypes, FireDAC.Stan.Option,
  uBaseThread, uSQLHelper, IOUtils, uGlobal, uPassList;

type
  TIdChinaPassThread = class(TBaseThread)
  private
    FConfig: TKKThreadConfig;
    FConn: TFDConnection;
    FQuery: TFDQuery;
    function GetConn: TFDConnection;
    function QueryPassFromOracle: boolean;
    function GetPass: TPass;
    procedure DealPass;
    function GetUrl(DEVICE_NBR, snapnbr: string; pass: boolean=true): string;
  protected
    procedure Prepare; override;
    procedure Perform; override;
    procedure AfterTerminate; override;
  public
    constructor Create(config: TKKThreadConfig); overload;
    destructor Destroy; override;
  end;

implementation

{ TIdChinaPassThread }

procedure TIdChinaPassThread.AfterTerminate;
begin
  inherited;
  logger.Info(FConfig.KKSOURCE + ' stoped');
end;

procedure TIdChinaPassThread.Prepare;
begin
  inherited;
  logger.Info(FConfig.KKSOURCE + ' start');
end;

constructor TIdChinaPassThread.Create(config: TKKThreadConfig);
begin
  FConfig := config;
  FConn := GetConn;
  inherited Create(false);
end;

destructor TIdChinaPassThread.Destroy;
begin
  FQuery.Free;
  FConn.Free;
  inherited;
end;

procedure TIdChinaPassThread.Perform;
begin
  inherited;
  if QueryPassFromOracle then
  begin
    logger.Info('RecordCount: ' + FQuery.RecordCount.ToString());
    try
      DealPass;
    except
      on e: exception do
        logger.Error(e.Message);
    end;
  end;
end;

function TIdChinaPassThread.GetConn: TFDConnection;
begin
  result := TFDConnection.Create(nil);
  result.Params.Add('DriverID=Ora');
  result.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [FConfig.KKHost, FConfig.KKPort, FConfig.KKSid]));
  result.Params.Add(Format('User_Name=%s', [FConfig.KKUserName]));
  result.Params.Add(Format('Password=%s', [FConfig.KKPassword]));
  result.Params.Add('CharacterSet=UTF8'); // 否则中文乱码
  result.LoginPrompt := false;
  result.FetchOptions.Mode := FireDAC.Stan.Option.fmAll;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := result;
end;

function TIdChinaPassThread.QueryPassFromOracle: boolean;
var
  lastGCXH: string;
begin
  result := True;
  lastGCXH := SQLHelper.GetSinge('select KKLASTTIME from T_KK_DBCONFIG where kksource=' +  FConfig.KKSOURCE.QuotedString);
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from (');
  FQuery.SQL.Add('select PASS_ID,DEVICE_NBR,SNAP_NBR,LANE,PASS_TIME,PLATE_NBR,SPEED,');
  FQuery.SQL.Add('PLATE_TYPE,PLATE_COLOR,VEHICLE_TYPE,VEHICLE_COLOR,VEHICLE_BRAND ');
  FQuery.SQL.Add('from P_PASS ');
  FQuery.SQL.Add('where pass_id > :vID and pass_time>=:vTime ');
  FQuery.SQL.Add('order by pass_id) ');
  FQuery.SQL.Add('where rownum<=' + FConfig.KKROWNUM.ToString);
  FQuery.SQL.Add('order by PASS_ID desc');
  FQuery.Params.ParamByName('vID').Value := lastGCXH;
  FQuery.Params.ParamByName('vTime').Value := VarToDateTime(FormatDateTime('yyyy-mm-dd', now - 7));
  try
    FConn.Open;
    FQuery.Open;
  except
    on e: exception do
    begin
      result := false;
      logger.Error('QueryPassFromOracle: ' + e.Message + #13 + FQuery.SQL.Text);
    end;
  end;
  if FQuery.RecordCount > 0 then
  begin
    lastGCXH := FQuery.FieldByName('PASS_ID').AsString;
    SQLHelper.ExecuteSql('update T_KK_DBCONFIG set KKLASTTIME=''' + lastGCXH +
        ''' where kksource=' + FConfig.KKSOURCE.QuotedString);
  end
  else
    sleep(10000);
end;

procedure TIdChinaPassThread.DealPass;
var
  pass: TPass;
  device: TDevice;
  gxsj: double;
begin
  while not FQuery.Eof do
  begin
    pass := GetPass;
    if pass.kdbh <> '' then
    begin
      TMypint.DoAlarm(pass);

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

      if device.SBBH.Contains('E12073-0') then
      begin
        Tmypint.WriteHoleService(pass);
      end;

      PassList.Add(pass);
    end;

    FQuery.Next;
  end;
end;

function TIdChinaPassThread.GetPass: TPass;
var
  device: TDevice;
begin
  result.kdbh := FQuery.FieldByName('DEVICE_NBR').AsString;
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
  device := gDicDevice[result.kdbh];
  result.CJJG := device.CJJG;
  result.gcxh := FQuery.FieldByName('SNAP_NBR').AsString;
  result.KKSOURCE := FConfig.KKSOURCE;
  result.babh := device.babh;
  result.fxbh := device.fxbh;
  result.cdbh :=  FQuery.FieldByName('LANE').AsString;
  //result.cdlx := FQuery.FieldByName('cdlx').AsString;
  result.gcsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', FQuery.FieldByName('pass_time').AsDateTime);
  result.hphm := FQuery.FieldByName('PLATE_NBR').AsString;
  result.hpzl := FQuery.FieldByName('PLATE_TYPE').AsString;
  if (Length(Trim(result.hphm)) = 0) or (result.hphm = '无车牌') then
  begin
    result.hphm := '-';
  end;
  if result.hphm = '-' then
    result.hpzl := '44';

  result.clsd := FQuery.FieldByName('SPEED').AsString;
  result.hpys := FQuery.FieldByName('PLATE_COLOR').AsString;
  result.cllx := FQuery.FieldByName('VEHICLE_TYPE').AsString;
  result.cwhphm := '';//FQuery.FieldByName('cwhphm').AsString;
  result.cwhpys := '';//FQuery.FieldByName('cwhpys').AsString;
  result.hpyz := '';//FQuery.FieldByName('hpyz').AsString;
  result.yrksj := '0';
  result.CSYS := FQuery.FieldByName('VEHICLE_COLOR').AsString; //车身颜色
  result.clxs := device.XZSD.ToString;//FQuery.FieldByName('clxs').AsString; // 车辆限速
  result.CLPP := FQuery.FieldByName('VEHICLE_BRAND').AsString;
  result.clwx := '';//FQuery.FieldByName('clwx').AsString; //
  result.xszt := '';//FQuery.FieldByName('xszt').AsString;
  result.wfbj := '';//FQuery.FieldByName('wfbj').AsString;

  result.fwqdz := GetUrl(result.kdbh, result.gcxh);
  result.tp1 := 'index=0';
  result.tp2 := '';
  result.tp3 := '';
  result.rksj := FormatDateTime('yyyy/mm/dd', now);
  //result.fsbz := FQuery.FieldByName('fsbz').AsString;
  result.alarm_type := '0';
  result.alarm_src := '0';
  result.alarm_src_id := '0';
  result.flag := '0';
  result.gxsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
  result.ldbh := device.ldbh;
  result.lkbh := device.LKBH;
  result.ser01 := '';
  result.ser02 := '';
  result.ser03 := '';
  result.ser04 := '';
  result.ser05 := '';
  result.ser06 := '0';
  result.ser07 := '0';
  result.ser08 := '';
  result.ser09 := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
end;

function TIdChinaPassThread.GetUrl(DEVICE_NBR, snapnbr: string; pass: boolean): string;
var
  server: string;
begin
  if pass then
    result := 'http://10.43.255.27/ImageQuery/PassImage.aspx?devicenbr=%s&snapnbr=%s&server=%s&'
  else
    result := 'http://10.43.255.27/ImageQuery/VioImage.aspx?devicenbr=%s&snapnbr=%s&server=%s&';
  server := '10.43.255.7';
  result := Format(result, [DEVICE_NBR, snapnbr, server]);
end;

end.
