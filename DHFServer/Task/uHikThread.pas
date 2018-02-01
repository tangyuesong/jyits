unit uHikThread;

interface

uses
  Classes, SysUtils, FireDAC.Comp.Client, Generics.Collections, Variants,
  DateUtils, IdHttp, uCommon, uInterface, uTypes, FireDAC.Stan.Option,
  uBaseThread, uSQLHelper, IOUtils, uGlobal, uPassList;

type
  THikThread = class(TBaseThread)
  private
    FConfig: TKKThreadConfig;
    FConn: TFDConnection;
    FQuery: TFDQuery;
    FIPMap: TDictionary<string, string>;
    function GetConn: TFDConnection;
    function QueryPassFromOracle: boolean;
    function GetPass: TPass;
    procedure DealPass;
    function GetUrl(url: string): string;
    function GetHPZL(vehicleType: integer): string;
    procedure LoadIpMap;
  protected
    procedure Prepare; override;
    procedure Perform; override;
    procedure AfterTerminate; override;
  public
    constructor Create(config: TKKThreadConfig); overload;
    destructor Destroy; override;
  end;

implementation

{ THikThread }

procedure THikThread.AfterTerminate;
begin
  inherited;
  logger.Info(FConfig.KKSOURCE + ' stoped');
end;

procedure THikThread.Prepare;
begin
  inherited;
  logger.Info(FConfig.KKSOURCE + ' start');
  LoadIpMap;
end;

procedure THikThread.LoadIpMap;
var
  sql: string;
begin
  sql := 'select IP1,IP2 from T_KK_DBConfig_IP_Map where kksource=''' + FConfig.KKSOURCE + '''';
  with SQLHelper.Query(sql) do
  begin
    while not EOF do
    begin
      FIPMap.Add(Fields[0].AsString, Fields[1].AsString);
      Next;
    end;
    Free;
  end;
end;

constructor THikThread.Create(config: TKKThreadConfig);
begin
  FConfig := config;
  FConn := GetConn;
  FIPMap := TDictionary<string, string>.Create;
  inherited Create(false);
end;

destructor THikThread.Destroy;
begin
  FIPMap.Free;
  FQuery.Free;
  FConn.Free;
  inherited;
end;

procedure THikThread.Perform;
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

function THikThread.GetConn: TFDConnection;
begin
  result := TFDConnection.Create(nil);
  result.Params.Add('DriverID=Ora');
  result.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [FConfig.KKHost, FConfig.KKPort, FConfig.KKSid]));
  result.Params.Add(Format('User_Name=%s', [FConfig.KKUserName]));
  result.Params.Add(Format('Password=%s', [FConfig.KKPassword]));
  result.Params.Add('CharacterSet=UTF8'); // ������������
  result.LoginPrompt := false;
  result.FetchOptions.Mode := FireDAC.Stan.Option.fmAll;
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := result;
end;

function THikThread.QueryPassFromOracle: boolean;
var
  lastGCXH: string;
begin
  result := True;
  lastGCXH := SQLHelper.GetSinge('select KKLASTTIME from T_KK_DBCONFIG where kksource=' +  FConfig.KKSOURCE.QuotedString);
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from (');
  FQuery.SQL.Add('select PASS_ID,CROSSING_ID,LANE_NO,DIRECTION_INDEX,PLATE_NO,');
  FQuery.SQL.Add('PLATE_TYPE,PASS_TIME,VEHICLE_SPEED,VEHICLE_LEN,PLATE_COLOR,');
  FQuery.SQL.Add('VEHICLE_COLOR,VEHICLE_TYPE,VEHICLE_COLOR_DEPTH,PLATE_STATE,');
  FQuery.SQL.Add('HPTP,QJTP,TFS_ID,VEHICLE_STATE,VEHICLE_INFO_LEVEL,VEHICLE_LOGO,');
  FQuery.SQL.Add('VEHICLE_SUBLOGO,VEHICLE_MODEL,PILOTSUNVISOR,VICE_PILOTSUNVISOR,');
  FQuery.SQL.Add('USE_PHONE,VICE_PILOTSAFEBELT,PENDANT_NUM,DANGEROUS_NUM,');
  FQuery.SQL.Add('YELLOWCAR_NUM,PILOTSAFEBELT,CREATETIME ');
  FQuery.SQL.Add('from v_gcxxr ');
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

procedure THikThread.DealPass;
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
      if gxsj - device.gxsj > 10 * OneMinute then // ÿ10���Ӹ����豸���¹���ʱ��
      begin
        UpdateDeviceGXSJ(device.sbbh, gxsj);
      end;

      // �ϴ�����ƽ̨
      if device.SCJCPT then
      begin
        if Length(Trim(device.babh)) > 0 then
          Tmypint.WriteVehicleInfo(pass, device);
      end;

      PassList.Add(pass);
    end;

    FQuery.Next;
  end;
end;

function THikThread.GetPass: TPass;
var
  device: TDevice;
begin
  result.kdbh := FConfig.CJJG + FQuery.FieldByName('CROSSING_ID').AsString;
  if not gDicDevice.ContainsKey(result.kdbh) then
  begin
    if not gUnknowDevice.ContainsKey(result.kdbh) then
    begin
      gUnknowDevice.Add(result.kdbh, true);
      logger.Warn('�豸��δ����: [' + result.kdbh + ']');
    end;
    result.kdbh := '';
    exit;
  end;
  device := gDicDevice[result.kdbh];
  result.CJJG := device.CJJG;
  result.gcxh := FQuery.FieldByName('PASS_ID').AsString;
  result.KKSOURCE := FConfig.KKSOURCE;
  result.babh := device.babh;
  result.fxbh := FQuery.FieldByName('DIRECTION_INDEX').AsString;
  result.cdbh :=  FQuery.FieldByName('LANE_NO').AsString;
  //result.cdlx := FQuery.FieldByName('cdlx').AsString;
  result.gcsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', FQuery.FieldByName('PASS_TIME').AsDateTime);
  result.hphm := FQuery.FieldByName('PLATE_NO').AsString;
  result.hpzl := GetHPZL(FQuery.FieldByName('VEHICLE_TYPE').AsInteger);
  if (Length(Trim(result.hphm)) = 0) or (result.hphm = '����') then
  begin
    result.hphm := '-';
  end;
  if result.hphm = '-' then
    result.hpzl := '44';

  result.clsd := FQuery.FieldByName('VEHICLE_SPEED').AsString;
  result.hpys := FQuery.FieldByName('PLATE_COLOR').AsString;
  result.cllx := FQuery.FieldByName('VEHICLE_TYPE').AsString;
  result.cwhphm := '';//FQuery.FieldByName('cwhphm').AsString;
  result.cwhpys := '';//FQuery.FieldByName('cwhpys').AsString;
  result.hpyz := '';//FQuery.FieldByName('hpyz').AsString;
  result.yrksj := '0';
  result.CSYS := FQuery.FieldByName('VEHICLE_COLOR').AsString; //������ɫ
  result.clxs := device.XZSD.ToString;//��������
  result.CLPP := FQuery.FieldByName('VEHICLE_LOGO').AsString;
  result.clwx := '';//FQuery.FieldByName('clwx').AsString; //
  result.xszt := '';//FQuery.FieldByName('xszt').AsString;
  result.wfbj := '';//FQuery.FieldByName('wfbj').AsString;

  result.fwqdz := '';//GetUrl(result.kdbh, result.gcxh); //FQuery.FieldByName('QJTP').AsString;
  result.tp1 := GetUrl(FQuery.FieldByName('QJTP').AsString);
  result.tp2 := GetUrl(FQuery.FieldByName('HPTP').AsString);
  result.tp3 := '';
  result.rksj := FormatDateTime('yyyy/mm/dd hh:mm:ss', FQuery.FieldByName('CREATETIME').AsDateTime);;
  //result.fsbz := FQuery.FieldByName('fsbz').AsString;
  result.alarm_type := '0';
  result.alarm_src := '0';
  result.alarm_src_id := '0';
  result.flag := '0';
  result.gxsj := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
  result.ldbh := device.ldbh;
  result.lkbh := device.LKBH;
  result.ser01 := FQuery.FieldByName('PILOTSUNVISOR').AsString;          // ������״̬��  0-��ʾδ֪,1-����������,2-��������
  result.ser02 := FQuery.FieldByName('VICE_PILOTSUNVISOR').AsString;     // ��������״̬��0-��ʾδ֪, 1-����������,2-��������
  result.ser03 := FQuery.FieldByName('USE_PHONE').AsString;              // �Ƿ���ֻ�    0-δ֪��1-���ֻ���2-�����ֻ�
  result.ser04 := FQuery.FieldByName('VICE_PILOTSAFEBELT').AsString;     // ����ȫ��״̬  0-δ֪��1-ϵ��ȫ����2-��ϵ��ȫ��';
  result.ser05 := FQuery.FieldByName('PENDANT_NUM').AsString;            // �Ҽ�          0-δ֪��1-�йҼ���2-�޹Ҽ�';
  result.ser06 := FQuery.FieldByName('DANGEROUS_NUM').AsString;          // Σ��Ʒ��      0-δ֪��1-��Σ��Ʒ��2-��Σ��Ʒ;
  result.ser07 := FQuery.FieldByName('YELLOWCAR_NUM').AsString;          // �Ʊ공        0-δ֪��1-�̱꣬2-�޻Ʊ�;
  result.ser08 := FQuery.FieldByName('PILOTSAFEBELT').AsString;          // ��ȫ��״̬    0-δ֪��1-ϵ��ȫ����2-δϵ��ȫ��
  result.ser09 := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);
end;

function THikThread.GetUrl(url: string): string;
var
  s: string;
begin
  result := url;
  for s in FIPMap.Keys do
  begin
    if url.Contains(s) then
      result := url.Replace(s, FIpMap[s]);
  end;
end;

function THikThread.GetHPZL(vehicleType: integer): string;
begin
  case vehicleType of
    3: result := '02';//	�γ�
    4: result := '02';//	�����
    5: result := '02';//	С����
    2: result := '01';//	����
    1: result := '01';//	�ͳ�
    6: result := '02';//	����
    7: result := '07';//	���ֳ�
    9: result := '02';//	SUV/MPV
    10: result := '01';//	���Ϳͳ�
    else result := '99';
  end;

end;

end.
