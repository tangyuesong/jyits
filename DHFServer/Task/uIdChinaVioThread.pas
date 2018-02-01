unit uIdChinaVioThread;

interface

uses
  Classes, SysUtils, FireDAC.Comp.Client, Generics.Collections, Variants,
  DateUtils, IdHttp, uCommon, uInterface, uTypes, FireDAC.Stan.Option,
  uBaseThread, MyImage, uSQLHelper, IOUtils, uGlobal, uPassList;

type
  TIdChinaVioThread = class(TBaseThread)
  private
    FConfig: TKKThreadConfig;
    FConn: TFDConnection;
    FQuery: TFDQuery;
    function GetConn: TFDConnection;
    function QueryVioFromOracle: boolean;
    procedure SaveVio(vio: TVioTemp);
    procedure DealVio;
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

{ TIdChinaVioThread }

procedure TIdChinaVioThread.AfterTerminate;
begin
  inherited;
  logger.Info(FConfig.KKSOURCE + ' stoped');
end;

constructor TIdChinaVioThread.Create(config: TKKThreadConfig);
begin
  FConfig := config;
  FConn := GetConn;
  inherited Create(false);
end;

destructor TIdChinaVioThread.Destroy;
begin
  FQuery.Free;
  FConn.Free;
  inherited;
end;

function TIdChinaVioThread.GetConn: TFDConnection;
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

function TIdChinaVioThread.QueryVioFromOracle: boolean;
var
  lastGCXH: string;
begin
  result := True;

  lastGCXH := SQLHelper.GetSinge('select KKLASTTIME from T_KK_DBCONFIG where kksource=' +  FConfig.KKSOURCE.QuotedString);
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add('select * from (');
  FQuery.SQL.Add('select VIOLATION_SURVEIL_ID,DEVICE_NBR,PLATE_TYPE,PLATE_NBR,LANE_NBR,VIOLATION_TIME,');
  FQuery.SQL.Add('SNAP_NBR,VEHICLE_COLOR,VEHICLE_BRAND,SPEED from V_VIOLATION_SURVEIL ');
  FQuery.SQL.Add('where VIOLATION_SURVEIL_ID>:vID and VIOLATION_TIME > :vTime ');
  FQuery.SQL.Add('order by VIOLATION_SURVEIL_ID) ');
  FQuery.SQL.Add('where rownum<=' + FConfig.KKROWNUM.ToString);
  FQuery.SQL.Add('order by VIOLATION_SURVEIL_ID desc');
  FQuery.Params.ParamByName('vID').Value := lastGCXH;
  FQuery.Params.ParamByName('vTime').Value := VarToDateTime(FormatDateTime('yyyy-mm-dd', now - 7));
  try
    FConn.Open;
    FQuery.Open;
  except
    on e: exception do
    begin
      result := false;
      logger.Error('QueryVioFromOracle: ' + e.Message + FQuery.SQL.Text);
    end;
  end;
  if FQuery.RecordCount > 0 then
  begin
    lastGCXH := FQuery.FieldByName('VIOLATION_SURVEIL_ID').AsString;
    SQLHelper.ExecuteSql('update T_KK_DBCONFIG set KKLASTTIME=''' + lastGCXH +
        ''' where kksource=' + FConfig.KKSOURCE.QuotedString);
  end
  else
    sleep(10000);
end;

procedure TIdChinaVioThread.SaveVio(vio: TVioTemp);
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

  sqlhelper.ExecuteSql(SQL);
end;

procedure TIdChinaVioThread.Perform;
begin
  inherited;
  if QueryVioFromOracle then
  begin
    logger.Info('RecordCount: ' + FQuery.RecordCount.ToString());
    try
      DealVio;
    except
      on e: exception do
        logger.Error(e.Message);
    end;
  end;
end;

procedure TIdChinaVioThread.Prepare;
begin
  inherited;
  logger.Info(FConfig.KKSOURCE + ' start');
end;

procedure TIdChinaVioThread.DealVio;
var
  tmp: TVioTemp;
  hpzl: string;
  device: TDevice;
begin
  while not FQuery.Eof do
  begin
    tmp.WFDD := FQuery.FieldByName('DEVICE_NBR').AsString;
    if gDicDevice.ContainsKey(tmp.WFDD) then
    begin
      device := gDicDevice[tmp.WFDD];
      tmp.HPZL := FQuery.FieldByName('PLATE_TYPE').AsString;
      tmp.hphm := FQuery.FieldByName('PLATE_NBR').AsString;
      if (Length(Trim(tmp.hphm)) = 0) or (tmp.hphm = '无车牌') then
      begin
        tmp.hphm := '-';
      end;
      if tmp.hphm = '-' then
        tmp.hpzl := '44';

      tmp.GCXH := FQuery.FieldByName('SNAP_NBR').AsString;
      tmp.fwqdz := GetUrl(device.SBBH, tmp.GCXH, false);
      tmp.PHOTOFILE1 := 'index=0';
      tmp.PHOTOFILE2 := 'index=1';
      tmp.CD := FQuery.FieldByName('LANE_NBR').AsString;
      tmp.CJJG := device.CJJG;
      tmp.WFSJ := FQuery.FieldByName('VIOLATION_TIME').AsDateTime;
      tmp.CSYS := FQuery.FieldByName('VEHICLE_COLOR').AsString;
      tmp.CLPP := FQuery.FieldByName('VEHICLE_BRAND').AsString;
      tmp.SJSD := FQuery.FieldByName('SPEED').AsInteger;
      tmp.XZSD := device.XZSD;
      tmp.ZDXS := device.DCXZSD;
      tmp.ZGXS := 0;

      tmp.WFXW := Tmypint.getSpeedtoWFXW(hpzl, tmp.SJSD, tmp.XZSD);
      SaveVio(tmp);
    end
    else if not gUnknowDevice.ContainsKey(tmp.WFDD) then
    begin
      gUnknowDevice.Add(tmp.WFDD, true);
      logger.Warn('设备号未备案: [' + tmp.WFDD + ']');
    end;
    FQuery.Next;
  end;
end;

function TIdChinaVioThread.GetUrl(DEVICE_NBR, snapnbr: string; pass: boolean): string;
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
