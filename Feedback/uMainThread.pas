unit uMainThread;

interface

uses
  System.Classes, Types, IOUtils, SysUtils, Generics.Collections, Windows,
  Generics.Defaults, FireDAC.Comp.Client, FireDAC.Stan.Option, FireDAC.Stan.Def,
  FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Expr, FireDAC.Stan.Pool,
  uSQLHelper,
  System.Net.HttpClientComponent, DateUtils, Variants;

type
  TSignInfo = record
    YJXH, YJLX, HPHM, HPZL, QSJG, SFCJLJ, CZDW, CZR, CZSJ: string;
    GCSJ: double;
    SystemID: string;
  end;

  TFeedbackInfo = record
    YJXH, YJLX, HPHM, HPZL, QSJG, SFCJLJ, LJCLQK, WLJDYY, CHJG, CLJG, WSBH, JYW,
      WSLB, YJBM, LXR, LXDH, WCHYY, CZQKMS, CZDW, CZR, CZSJ, BKZL: string;
    GCSJ: double;
    SystemID: string;
  end;

  TVehCheck = record
    SystemID, JCXH, GCXH, KKBH, FXLX, CDH, GCSJ, FWZBH, FWZMC, CLZT, HPHM, HPZL,
      JCCLLX: string;
    SFD, MDD, GPS, AQSB, CLLTHW, WFYY, JAQD, PLJS, FFGZ, ZTFGBS: string;
    AZFHZZ, XGJSBZ, AZDSJ, AZDLX, SFWZJS, SFYFJSY, QDYSTXZ, JCJG,
      JCQKMS: string;
    CZ, CY, JCSJ, JCMJ, CJR, CJJG, CJSJ, GXSJ, ZJSZH, FJSZH, ZJSLXDH,
      FJSLXDH: string;
    HDZKL, HDZZL, ZKS, SJZZL: integer;
  end;

  TMainThread = class(TThread)
  private
    FLastUploadTime: double;
    FMaxRKSJ: double;
    FMaxRKSJ1: double;
    FMaxRKSJVehicle: double;
    FStoped: boolean;
    FOraConn: TFDConnection;
    FOraQuery: TFDQuery;
    FSQLHelper: TSQLHelper;
    procedure InitOra;
    function GetDataToSign: boolean;
    procedure DoSign(rec: TSignInfo);
    function GetDataToFeedback: boolean;
    function GetFeedbackedData: TDictionary<string, TFeedbackInfo>;
    function GetSignedData: TDictionary<string, TSignInfo>;
    procedure DoFeedback(rec: TFeedbackInfo);
    procedure SignAll;
    procedure FeedbackAll;
    procedure DownloadAlarms;
    procedure UploadVeh;
    procedure DownloadYiFanKui;
    function ExecuteSQL(ss: string): boolean;
    procedure SQLError(const SQL, Description: string);
    procedure DoWQCZ;
    procedure DownloadZFZAlarms;
    procedure DownloadZFZDriver;
    procedure UpdateDeviceStauts;
    procedure VehCheck;
    procedure DoVehCheck(item: TVehCheck);
    procedure DownloadAlarmVehicle;
    procedure DownloadSURVEIL;
  protected
    procedure Execute; override;
  public
    constructor Create(); overload;
    destructor Destroy; override;
    procedure Stop;
  end;

implementation

uses
  uLogger, uCommon;

{ TMainThread }

constructor TMainThread.Create();
begin
  FStoped := false;
  FMaxRKSJ := now - OneHour;
  FMaxRKSJ1 := now - 1;
  FMaxRKSJVehicle := now - 1;
  FLastUploadTime := now;
  inherited Create(false);
end;

destructor TMainThread.Destroy;
begin

  inherited;
end;

procedure TMainThread.SQLError(const SQL, Description: string);
begin
  logger.Error(Description + #13 + SQL);
end;

procedure TMainThread.Execute;
begin
  InitOra;
  FSQLHelper := TSQLHelper.Create(SQLConfig.Host, SQLConfig.DbName,
    SQLConfig.User, SQLConfig.Password);
  FSQLHelper.OnError := SQLError;
  while not FStoped do
  begin
    DownloadAlarms;
    if now - FLastUploadTime > OneMinute then
    begin
      DownloadSURVEIL;
      SignAll;
      FeedbackAll;
      UploadVeh;
      DownloadYiFanKui;
      DownloadZFZAlarms;
      DownloadZFZDriver;
      DownloadAlarmVehicle;
      DoWQCZ;
      // UpdateDeviceStauts;    作废
      VehCheck;
      FLastUploadTime := now;
    end;
    Sleep(3000);
  end;
end;

procedure TMainThread.Stop;
begin
  FStoped := true;
end;

procedure TMainThread.SignAll;
var
  signedDic: TDictionary<string, TSignInfo>;
  YJXH: string;
begin
  signedDic := GetSignedData;
  for YJXH in signedDic.Keys do
    DoSign(signedDic[YJXH]);
  signedDic.Free;
end;

procedure TMainThread.VehCheck;
var
  item: TVehCheck;
begin
  with FSQLHelper.Query('select * from SERV_VEH_CHECK where flag=1') do
  begin
    while not EOF do
    begin
      item.SystemID := FieldByName('systemid').AsString;
      item.FWZBH := FieldByName('FWZBH').AsString;
      item.HPHM := FieldByName('HPHM').AsString;
      item.HPZL := FieldByName('HPZL').AsString;
      item.JCCLLX := FieldByName('JCCLLX').AsString;
      item.SFD := FieldByName('SFD').AsString;
      item.MDD := FieldByName('MDD').AsString;
      item.GPS := FieldByName('GPS').AsString;
      item.AQSB := FieldByName('AQSB').AsString;
      item.CLLTHW := FieldByName('CLLTHW').AsString;
      item.WFYY := FieldByName('WFYY').AsString;
      item.JAQD := FieldByName('JAQD').AsString;
      item.PLJS := FieldByName('PLJS').AsString;
      item.FFGZ := FieldByName('FFGZ').AsString;
      item.ZTFGBS := FieldByName('ZTFGBS').AsString;
      item.AZFHZZ := FieldByName('AZFHZZ').AsString;
      item.XGJSBZ := FieldByName('XGJSBZ').AsString;
      item.AZDSJ := FieldByName('AZDSJ').AsString;
      item.AZDLX := FieldByName('AZDLX').AsString;
      item.SFWZJS := FieldByName('SFWZJS').AsString;
      item.SFYFJSY := FieldByName('SFYFJSY').AsString;
      item.QDYSTXZ := FieldByName('QDYSTXZ').AsString;
      item.JCJG := FieldByName('JCJG').AsString;
      item.JCQKMS := FieldByName('JCQKMS').AsString;
      item.CZ := FieldByName('CZ').AsString;
      item.CY := FieldByName('CY').AsString;
      item.JCSJ := FieldByName('JCSJ').AsString;
      item.JCMJ := FieldByName('JCMJ').AsString;
      item.CJJG := FieldByName('CJJG').AsString;
      item.CJSJ := FieldByName('CJSJ').AsString;
      item.ZJSZH := FieldByName('ZJSZH').AsString;
      item.ZJSLXDH := FieldByName('ZJSLXDH').AsString;
      item.FJSZH := FieldByName('FJSZH').AsString;
      item.FJSLXDH := FieldByName('FJSLXDH').AsString;
      item.ZKS := strtointdef(FieldByName('ZKS').AsString, 0);
      item.SJZZL := strtointdef(FieldByName('SJZZL').AsString, 0);
      DoVehCheck(item);
      Next;
    end;
    Free;
  end;
end;

procedure TMainThread.FeedbackAll;
var
  dic: TDictionary<string, TFeedbackInfo>;
  YJXH: string;
begin
  dic := GetFeedbackedData;
  for YJXH in dic.Keys do
    DoFeedback(dic[YJXH]);
  dic.Free;
end;

procedure TMainThread.InitOra;
begin
  FOraConn := TFDConnection.Create(nil);
  FOraConn.FetchOptions.Mode := fmAll;
  FOraConn.Params.Add('DriverID=Ora');
  FOraConn.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [oraConfig.Host, oraConfig.Port, oraConfig.DbName]));
  FOraConn.Params.Add(Format('User_Name=%s', [oraConfig.User]));
  FOraConn.Params.Add(Format('Password=%s', [oraConfig.Password]));
  FOraConn.Params.Add('CharacterSet=UTF8'); // 否则中文乱码
  FOraConn.LoginPrompt := false;

  FOraQuery := TFDQuery.Create(nil);
  FOraQuery.DisableControls;
  FOraQuery.Connection := FOraConn;
end;

function TMainThread.GetDataToSign: boolean;
begin
  result := true;
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select BKLX,YJXH,YJSJ,HPHM,HPZL,GCSJ from VMC_ALARM_PASS ');
    SQL.Add('where QSBJ=0 and YJSJ > to_date(''' +
      FormatDateTime('yyyy-mm-dd hh:mm', now - 7) +
      ''',''yyyy-mm-dd hh24:mi'')');
    SQL.Add('UNION select BKLX,YJXH,YJSJ,HPHM,HPZL,GCSJ from VMC_ALARM ');
    SQL.Add('where QSBJ=0 and YJSJ > to_date(''' +
      FormatDateTime('yyyy-mm-dd hh:mm', now - 7) +
      ''',''yyyy-mm-dd hh24:mi'')');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
    except
      on e: exception do
      begin
        result := false;
        logger.Error('[GetDataToSign]:' + e.Message + ' ' + SQL.Text);
      end;
    end;
  end;
end;

function TMainThread.GetDataToFeedback: boolean;
begin
  result := true;
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select BKLX,YJXH,YJSJ,HPHM,HPZL,GCSJ from VMC_SEIZE_VEHICLE ');
    SQL.Add('where FKBJ = 0 and YJSJ > to_date(''' +
      FormatDateTime('yyyy-mm-dd hh:mm', now - 30) +
      ''',''yyyy-mm-dd hh24:mi'')');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
    except
      on e: exception do
      begin
        result := false;
        logger.Error('[GetDataToFeedback]:' + e.Message + ' ' + SQL.Text);
      end;
    end;
  end;
end;

function TMainThread.GetSignedData: TDictionary<string, TSignInfo>;
var
  SQL: string;
  rec: TSignInfo;
begin
  result := TDictionary<string, TSignInfo>.Create;
  SQL := 'select HPHM,HPZL,QSJG,SFCJ,QSBM,QSR,QSSJ,BKLX,GCSJ,SystemID,GCXH from T_KK_ALARMRESULT '
    + 'where QSBJ=1 and upload=0 and datediff(dd, QSSJ, getdate())<30 and BKZL=''自动同步'' ';
  with FSQLHelper.Query(SQL) do
  begin
    while not EOF do
    begin
      rec.HPHM := Fields[0].AsString;
      rec.HPZL := Fields[1].AsString;
      rec.QSJG := Fields[2].AsString;
      rec.SFCJLJ := Fields[3].AsString;
      rec.CZDW := Fields[4].AsString;
      rec.CZR := Fields[5].AsString;
      rec.CZSJ := FormatDateTime('yyyy-mm-dd hh:mm:ss', Fields[6].AsDateTime);
      rec.YJLX := Fields[7].AsString;
      rec.GCSJ := Fields[8].AsDateTime;
      rec.SystemID := Fields[9].AsString;
      rec.YJXH := Fields[10].AsString;
      if not result.ContainsKey(rec.YJXH) then
        result.Add(rec.YJXH, rec);
      Next;
    end;
    Free;
  end;
end;

function TMainThread.GetFeedbackedData: TDictionary<string, TFeedbackInfo>;
var
  SQL: string;
  rec: TFeedbackInfo;
begin
  result := TDictionary<string, TFeedbackInfo>.Create;
  SQL := 'select HPHM,HPZL,b.QSJG,SFCJ,LJCLQK,WLJDYY,CHJG,CLJG,WSBH,JYW,WSLB,' +
    'YJBM,LXR,LXDH,WCHYY,CZQKMS,CZDW,CZR,CZSJ,BKLX,GCSJ,a.SystemID,a.YJXH ' +
    'from T_KK_AlarmFeedback a ' +
    'inner join T_KK_ALARMRESULT b on a.yjxh = b.GCXH ' +
    'where FKBJ = 1 and a.upload=0 and b.signresult=1 and b.BKZL=''自动同步''';
  with FSQLHelper.Query(SQL) do
  begin
    while not EOF do
    begin
      rec.HPHM := Fields[0].AsString;
      rec.HPZL := Fields[1].AsString;
      rec.QSJG := Fields[2].AsString;
      rec.SFCJLJ := Fields[3].AsString;
      rec.LJCLQK := Fields[4].AsString;
      rec.WLJDYY := Fields[5].AsString;
      rec.CHJG := Fields[6].AsString;
      rec.CLJG := Fields[7].AsString;
      rec.WSBH := Fields[8].AsString;
      rec.JYW := Fields[9].AsString;
      rec.WSLB := Fields[10].AsString;
      rec.YJBM := Fields[11].AsString;
      rec.LXR := Fields[12].AsString;
      rec.LXDH := Fields[13].AsString;
      rec.WCHYY := Fields[14].AsString;
      rec.CZQKMS := Fields[15].AsString;
      rec.CZDW := Fields[16].AsString;
      rec.CZR := Fields[17].AsString;
      rec.CZSJ := FormatDateTime('yyyy-mm-dd hh:mm:ss', Fields[18].AsDateTime);
      rec.YJLX := Fields[19].AsString;
      rec.GCSJ := Fields[20].AsDateTime;
      rec.SystemID := Fields[21].AsString;
      rec.YJXH := Fields[22].AsString;

      if not result.ContainsKey(rec.YJXH) then
        result.Add(rec.YJXH, rec);
      Next;
    end;
    Free;
  end;
end;

procedure TMainThread.DoSign(rec: TSignInfo);
var
  Params, ret, msg: string;
begin
  Params := 'yjxh=' + rec.YJXH + '&ywlx=1' + '&qsjg=' + rec.QSJG + '&sfcjlj=' +
    rec.SFCJLJ + '&czdw=' + rec.CZDW + '&czr=' + rec.CZR + '&czsj=' + rec.CZSJ;
  ret := gQTZHelper.Request('feedback', Params);
  if ret.Contains('"message":"') then
  begin
    msg := ret.Substring(ret.IndexOf('"message":"') + 11);
    msg := msg.Substring(0, msg.IndexOf('"'));
  end
  else
    msg := ret.Replace('"', '''', [rfReplaceAll]);
  if ret.Contains('"code":"1"') then
  begin
    logger.Info('Sign OK ' + rec.HPHM + ' ' + rec.YJLX);
    FSQLHelper.ExecuteSQL
      ('update T_KK_ALARMRESULT set upload=1, SignResult = 1, SignMessage=''' +
      msg + ''' where SystemID=''' + rec.SystemID + '''');
  end
  else
  begin
    logger.Warn('Sign Failed: ' + ret + ' ' + rec.YJXH + ' ' + rec.HPHM +
      rec.CZR + rec.CZDW);
    FSQLHelper.ExecuteSQL
      ('update T_KK_ALARMRESULT set upload=1, SignResult = 0, SignMessage=''' +
      msg + ''' where SystemID=''' + rec.SystemID + '''');
  end;
end;

procedure TMainThread.DoVehCheck(item: TVehCheck);
var
  Params, ret, msg: string;
begin
  Params := 'fwzbh=' + item.FWZBH;
  Params := Params + '&clzt=1';
  Params := Params + '&hpzl=' + item.HPZL;
  Params := Params + '&hphm=' + item.HPHM;
  Params := Params + '&jccllx=' + item.JCCLLX;
  Params := Params + '&sfd=' + item.SFD;
  Params := Params + '&mdd=' + item.MDD;
  if (item.JCCLLX = '01') or (item.JCCLLX = '03') then
    Params := Params + '&zks=' + item.ZKS.ToString;
  if item.JCCLLX = '04' then
    Params := Params + '&sjzzl=' + item.SJZZL.ToString;
  if item.GPS <> '' then
    Params := Params + '&gps=' + item.GPS;
  if item.PLJS <> '' then
  begin
    Params := Params + '&pljs=' + item.PLJS;
  end;
  if item.AQSB <> '' then
  begin
    Params := Params + '&aqsb=' + item.AQSB;
  end;
  if item.CLLTHW <> '' then
  begin
    Params := Params + '&cllthw=' + item.CLLTHW;
  end;
  if item.JAQD <> '' then
  begin
    Params := Params + '&jaqd=' + item.JAQD;
  end;
  if item.WFYY <> '' then
  begin
    Params := Params + '&wfyy=' + item.WFYY;
  end;
  if item.CY <> '' then
  begin
    Params := Params + '&cy=' + item.CY;
  end;
  if item.XGJSBZ <> '' then
  begin
    Params := Params + '&XGJSBZ=' + item.XGJSBZ;
  end;
  if item.AZDSJ <> '' then
  begin
    Params := Params + '&AZDSJ=' + item.AZDSJ;
  end;
  if item.AZDLX <> '' then
  begin
    Params := Params + '&AZDLX=' + item.AZDLX;
  end;
  if item.QDYSTXZ <> '' then
  begin
    Params := Params + '&QDYSTXZ=' + item.QDYSTXZ;
  end;
  if item.ZTFGBS <> '' then
  begin
    Params := Params + '&ZTFGBS=' + item.ZTFGBS;
  end;
  if item.AZFHZZ <> '' then
  begin
    Params := Params + '&AZFHZZ=' + item.AZFHZZ;
  end;
  if item.FFGZ <> '' then
  begin
    Params := Params + '&FFGZ=' + item.FFGZ;
  end;
  if item.CZ <> '' then
  begin
    Params := Params + '&CZ=' + item.CZ;
  end;

  if item.SFYFJSY <> '' then
    Params := Params + '&sfyfjsy=1';
  Params := Params + '&jcjg=00'; // 重大按情
  if item.JCQKMS <> '' then
    Params := Params + '&jcqkms=' + item.JCQKMS;
  Params := Params + '&jcsj=' + item.JCSJ;
  Params := Params + '&jcmj=' + item.JCMJ;
  Params := Params + '&zjszh=' + item.ZJSZH;
  if item.ZJSLXDH <> '' then
    Params := Params + '&zlxdh=' + item.ZJSLXDH;

  if item.FJSZH <> '' then
  begin
    Params := Params + '&fjszh=' + item.FJSZH;
    if item.FJSLXDH <> '' then
      Params := Params + '&flxdh=' + item.FJSLXDH;
  end;

  ret := gQTZHelper.Request('vehcheck', Params);
  if ret.Contains('"message":"') then
  begin
    msg := ret.Substring(ret.IndexOf('"message":"') + 11);
    msg := msg.Substring(0, msg.IndexOf('"'));
  end
  else
    msg := ret.Replace('"', '''', [rfReplaceAll]);
  if ret.Contains('"code":"1"') then
  begin
    logger.Info('vehcheck OK ' + item.HPHM + ' ' + item.HPZL);
    FSQLHelper.ExecuteSQL('update SERV_VEH_CHECK set flag=2, message=''' + msg +
      ''' where SystemID=''' + item.SystemID + '''');
  end
  else
  begin
    logger.Warn('vehcheck Failed: ' + ret + ' ' + Params);
    FSQLHelper.ExecuteSQL('update SERV_VEH_CHECK set flag=3, message=''' + msg +
      ''' where SystemID=''' + item.SystemID + '''');
  end;
end;

procedure TMainThread.DoFeedback(rec: TFeedbackInfo);
var
  url, ret, msg: string;
begin
  url := 'yjxh=' + rec.YJXH + '&ywlx=2' + '&ljclqk=' + rec.LJCLQK;
  if rec.WLJDYY <> '' then
    url := url + '&wljdyy=' + rec.WLJDYY;
  if rec.CHJG <> '' then
    url := url + '&chjg=' + rec.CHJG;
  if rec.CLJG <> '' then
    url := url + '&cljg=' + rec.CLJG;
  if rec.WSBH <> '' then
    url := url + '&wsbh=' + rec.WSBH;
  if rec.JYW <> '' then
    url := url + '&jyw=' + rec.JYW;
  if rec.CLJG.Contains('2') then
    url := url + '&cfxylx=' + rec.YJLX;
  if rec.WSLB <> '' then
    url := url + '&wslb=' + rec.WSLB;
  if rec.YJBM <> '' then
    url := url + '&yjbm=' + rec.YJBM;
  if rec.LXR <> '' then
    url := url + '&lxr=' + rec.LXR;
  if rec.LXDH <> '' then
    url := url + '&lxdh=' + rec.LXDH;
  if rec.WCHYY <> '' then
    url := url + '&wchyy=' + rec.WCHYY;
  url := url + '&czdw=' + rec.CZDW + '&czr=' + rec.CZR + '&czsj=' + rec.CZSJ;

  ret := gQTZHelper.Request('feedback', url);
  if ret.Contains('"message":"') then
  begin
    msg := ret.Substring(ret.IndexOf('"message":"') + 11);
    msg := msg.Substring(0, msg.IndexOf('"'));
  end
  else
    msg := ret.Replace('"', '''', [rfReplaceAll]);
  if ret.Contains('"code":"1"') then
  begin
    logger.Info('feedback OK ' + rec.HPHM);
    FSQLHelper.ExecuteSQL
      ('update T_KK_ALARMFEEDBACK set upload=1, FeedbackResult=1,FeedbackMessage='''
      + msg + ''' where SystemID=''' + rec.SystemID + '''');
  end
  else
  begin
    logger.Warn('feedback Failed: ' + ret);
    FSQLHelper.ExecuteSQL
      ('update T_KK_ALARMFEEDBACK set upload=1, FeedbackResult=0,FeedbackMessage='''
      + msg + '[' + rec.HPHM + ']'' where SystemID=''' + rec.SystemID + '''');
  end;
end;

procedure TMainThread.DownloadAlarms;
  procedure Save(ss: TStrings);
  var
    s, tmpTable: string;
  begin
    logger.Info('DownloadAlarms: ' + ss.Count.ToString);
    tmpTable := 'tmp_alarm' + FormatDateTime('yymmddhhmmsszzz', now);
    s := 'create table ' + tmpTable;
    s := s + '(bklx varchar(2),gcxh varchar(50),HPHM varchar(20),HPZL varchar(2),'
      + 'GCSJ datetime,CLSD int, CD int,SBBH varchar(50),FXLX varchar(50),' +
      'URL varchar(255),BKZL varchar(50))';
    FSQLHelper.ExecuteSQL(s);

    s := ss.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'insert into ' + tmpTable +
      '(BKLX,GCXH,HPHM,HPZL,GCSJ,CLSD,CD,SBBH,FXLX,URL,BKZL)values' + s;
    FSQLHelper.ExecuteSQL(s);

    // 去掉无效预警：未报废、已年捡 等
    // s := 'delete t from ' + tmpTable + ' t, T_VIO_VEHICLE s '
    // + 'where t.hphm=s.hphm and t.hpzl=s.hpzl and (t.bklx=''05'' and s.ZT not like ''%P%'' and s.ZT not like ''%M%'')';
    // FSQLHelper.ExecuteSql(s);
    s := 'delete s from ' + tmpTable +
      ' s inner join T_KK_ALARMRESULT t on s.GCXH=t.GCXH and t.bkzl = ''自动同步'' ';

    s := s + 'insert into T_KK_ALARMRESULT(BKLX,GCXH,HPHM,HPZL,GCSJ,CLSD,CD,KDBH,KDMC,VIOURL,BKZL) ';
    s := s + 'select a.BKLX,a.GCXH,a.HPHM,a.HPZL,a.GCSJ,a.CLSD,a.CD,Min(c.SBBH) SBBH,a.FXLX,a.URL,a.BKZL ';
    s := s + 'from ' + tmpTable + ' as a ';
    s := s + 'inner join S_DEVICE c on a.SBBH=c.JCPTBABH and a.FXLX = c.JCPTBAFX ';
    s := s + 'group by a.BKLX,a.GCXH,a.HPHM,a.HPZL,a.GCSJ,a.CLSD,a.CD,a.FXLX,a.URL,a.BKZL ';

    s := s + 'insert into T_VIO_TEMP(CJJG, HPHM,HPZL,WFSJ,WFDD,WFXW,CD,PHOTOFILE1,BJ) ';
    s := s + ' select c.CJJG, a.HPHM,a.HPZL,a.GCSJ,Min(c.SBBH) SBBH,''1340'' as WFXW, a.CD, a.URL,''0'' ';
    s := s + ' from ' + tmpTable + ' as a ';
    s := s + ' inner join S_DEVICE c on a.SBBH=c.JCPTBABH and a.FXLX = c.JCPTBAFX and JCPTVIO = 1';
    s := s + 'where a.BKLX=''04'' ';
    s := s + 'group by c.CJJG, a.HPHM,a.HPZL,a.GCSJ, a.CD, a.URL, a.FXLX ';
    s := s + 'drop table ' + tmpTable;
    FSQLHelper.ExecuteSQL(s);
    // logger.Info(s);
    logger.Info('DownloadAlarms OK');
  end;

var
  ss: TStrings;
begin
  ss := TStringList.Create;
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select a.BKLX,a.YJXH,a.HPHM,a.HPZL,a.GCSJ,a.CLSD,a.CDH,a.SBBH,a.FXLX,a.RKSJ,b.TPLJ||b.TP1 as URL ');
    SQL.Add('from VMC_ALARM_PASS a ');
    SQL.Add('inner join TFC_PASS b on a.GCXH=b.GCXH ');
    SQL.Add('where a.QSBJ=0 and a.RKSJ > to_date(''' +
      FormatDateTime('yyyy-mm-dd hh:mm', FMaxRKSJ - 0.01) +
      ''',''yyyy-mm-dd hh24:mi'') ');
    SQL.Add('UNION ');
    SQL.Add('select a.BKLX,a.YJXH,a.HPHM,a.HPZL,a.GCSJ,a.CLSD,a.CDH,a.SBBH,a.FXLX,a.RKSJ,b.TPLJ||b.TP1 as URL ');
    SQL.Add('from VMC_ALARM a ');
    SQL.Add('inner join TFC_PASS b on a.GCXH=b.GCXH ');
    SQL.Add('where a.QSBJ=0 and a.RKSJ > to_date(''' +
      FormatDateTime('yyyy-mm-dd hh:mm', FMaxRKSJ - 0.01) +
      ''',''yyyy-mm-dd hh24:mi'') ');
    SQL.Add('order by RKSJ desc');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
      DisableControls;
      if not EOF then
        FMaxRKSJ := FieldByName('RKSJ').AsDateTime;
      while not EOF do
      begin
        ss.Add('(' + FieldByName('BKLX').AsString.QuotedString + ',' +
          FieldByName('YJXH').AsString.QuotedString + ',' + FieldByName('HPHM')
          .AsString.QuotedString + ',' + FieldByName('HPZL')
          .AsString.QuotedString + ',' + FieldByName('GCSJ')
          .AsString.QuotedString + ',' + FieldByName('CLSD')
          .AsString.QuotedString + ',' + FieldByName('CDH')
          .AsString.QuotedString + ',' + FieldByName('SBBH')
          .AsString.QuotedString + ',' + FieldByName('FXLX')
          .AsString.QuotedString + ',' + FieldByName('URL')
          .AsString.QuotedString + ',''自动同步''),');
        if ss.Count = 999 then
        begin
          Save(ss);
          ss.Clear;
        end;

        Next;
      end;
      Close;
    except
      on e: exception do
      begin
        logger.Error('[DownloadAlarms]:' + e.Message + ' ' + SQL.Text);
      end;
    end;
  end;

  if ss.Count > 0 then
  begin
    Save(ss);
  end;
  ss.Free;
end;

procedure TMainThread.DownloadAlarmVehicle;
  procedure Save(ss: TStrings);
  var
    s, tmpTable: string;
  begin
    logger.Info('DownloadAlarmVehicle: ' + ss.Count.ToString);
    tmpTable := 'tmp_vehicle' + FormatDateTime('yymmddhhmmsszzz', now);
    s := 'create table ' + tmpTable +
      '(HPHM varchar(20),HPZL varchar(2),GCXH varchar(50),XYLX varchar(2),' +
      'CLPPXH varchar(255),CLLX varchar(3),CSYS varchar(1),' +
      'KKBH varchar(50),GCSJ varchar(50),' + 'URL varchar(255))';
    FSQLHelper.ExecuteSQL(s);

    s := ss.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'insert into ' + tmpTable +
      '(HPHM,HPZL,GCXH,XYLX,CLPPXH,CLLX,CSYS,KKBH,GCSJ,URL)values' + s;
    FSQLHelper.ExecuteSQL(s);

    s := 'insert into T_KK_ALARM(BKXH,BKJG,BKR,CJJG,HPHM,HPZL,ZT,VIOURL,BKLX,BKZL,CLPP,CLLX,CSYS,KDBH,GXSJ,UploadStatus) ';
    s := s + 'select a.GCXH,''445200000000'',''SYSTEM'',''445200000000'',a.HPHM,a.HPZL,1,a.URL,';
    s := s + 'case when XYLX=''01'' then ''03'' else ''02'' end as BKLX,''集成平台'',CLPPXH,a.CLLX,a.CSYS,c.SBBH,a.GCSJ,2 ';
    s := s + 'from ' + tmpTable + ' as a ';
    s := s + 'left join T_KK_ALARM b on a.HPHM=b.HPHM and a.HPZL=b.HPZL ';
    s := s + 'left join (select JCPTBABH, max(SBBH) as SBBH from S_DEVICE group by JCPTBABH) C on c.JCPTBABH=a.KKBH ';
    s := s + 'inner join (select HPHM,HPZL,max(GCXH) as GCXH from ' + tmpTable +
      ' group by HPHM,HPZL) as d ';
    s := s + 'on a.hphm=d.hphm and a.hpzl=d.hpzl and a.gcxh=d.gcxh ';
    s := s + 'where b.HPHM is null ';
    s := s + 'drop table ' + tmpTable;
    FSQLHelper.ExecuteSQL(s);

    logger.Info('DownloadAlarmVehicle OK');
  end;

var
  ss: TStrings;
  maxTime: string;
begin
  ss := TStringList.Create;
  maxTime := FormatDateTime('yyyy-mm-dd hh:mm', FMaxRKSJVehicle);
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select HPHM,HPZL,GCXH,XYLX,CLPPXH,CLLX,CSYS,KKBH,GCSJ,TPLJ||TP1 as URL,RKSJ ');
    SQL.Add('from RECG_SUSP_RESULT where (XYLX=''01'' or XYLX=''02'') and QRBJ<>0 ');
    SQL.Add('and RKSJ>to_date(''' + maxTime + ''',''yyyy-mm-dd hh24:mi'') ');
    SQL.Add('order by RKSJ desc');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
      DisableControls;
      if not EOF then
        FMaxRKSJVehicle := FieldByName('RKSJ').AsDateTime;
      while not EOF do
      begin
        ss.Add('(' + FieldByName('HPHM').AsString.QuotedString + ',' +
          FieldByName('HPZL').AsString.QuotedString + ',' + FieldByName('GCXH')
          .AsString.QuotedString + ',' + FieldByName('XYLX')
          .AsString.QuotedString + ',' + FieldByName('CLPPXH')
          .AsString.QuotedString + ',' + FieldByName('CLLX')
          .AsString.QuotedString + ',' + FieldByName('CSYS')
          .AsString.QuotedString + ',' + FieldByName('KKBH')
          .AsString.QuotedString + ',' + FieldByName('GCSJ')
          .AsString.QuotedString + ',' + FieldByName('URL')
          .AsString.QuotedString + '),');
        if ss.Count = 999 then
        begin
          Save(ss);
          ss.Clear;
        end;

        Next;
      end;
      Close;
    except
      on e: exception do
      begin
        logger.Error('[DownloadAlarmVehicle]:' + e.Message + ' ' + SQL.Text);
      end;
    end;
  end;

  if ss.Count > 0 then
  begin
    Save(ss);
  end;
  ss.Free;
end;

procedure TMainThread.DownloadSURVEIL;
  procedure Save(ss: TStrings);
  var
    s, tmpTable: string;
  begin
    logger.Info('DownloadSURVEIL: ' + ss.Count.ToString);
    tmpTable := 'tmp_JCPT_SURVEIL' + FormatDateTime('yymmddhhmmsszzz', now);
    s := 'create table ' + tmpTable +
      '(XH	VARCHAR(16) NULL,	YSXH	VARCHAR(16) NULL,	PH	VARCHAR(12) NULL, '
      + ' FXJG	VARCHAR(12) NULL,	FXJGMC	VARCHAR(128) NULL,	ZQMJ	VARCHAR(30) NULL, '
      + ' CLFL	VARCHAR(1) NULL, HPZL	VARCHAR(2) NULL, HPHM	VARCHAR(15) NULL, '
      + ' JDCSYR	VARCHAR(128) NULL, ZSXZQH	VARCHAR(10) NULL, ZSXXDZ	VARCHAR(128) NULL, '
      + ' DH	VARCHAR(50) NULL, LXFS	VARCHAR(128) NULL, SYXZ	VARCHAR(2) NULL, '
      + ' CSYS	VARCHAR(10) NULL, CLPP	VARCHAR(32) NULL,	JTFS	VARCHAR(3) NULL, '
      + ' FZJG	VARCHAR(10) NULL, CLYT	VARCHAR(2) NULL, XCFW	VARCHAR(1) NULL, '
      + ' SBLX	VARCHAR(2) NULL, SBBH	VARCHAR(18) NULL, YSBBH	VARCHAR(18) NULL, '
      + ' QJBH	VARCHAR(18) NULL, XZQH	VARCHAR(6) NULL, DLLX	VARCHAR(2) NULL, '
      + ' GLXZDJ	VARCHAR(1) NULL, WFDZ	VARCHAR(128) NULL, WFSJ	DATETIME  NULL, '
      + ' WFDD	VARCHAR(5) NULL, LDDM	VARCHAR(4) NULL, DDMS	VARCHAR(3) NULL, '
      + ' WFSJ1	DATETIME NULL, WFDD1	VARCHAR(5) NULL, LDDM1	VARCHAR(4) NULL, '
      + ' DDMS1	VARCHAR(3) NULL, WFXW	VARCHAR(5) NULL, SCZ REAL  NULL, ' +
      ' BZZ	REAL NULL, TZSH	VARCHAR(15) NULL, TZBJ	VARCHAR(1) NULL, ' +
      ' TZRQ	DATETIME NULL, LRR	VARCHAR(30) NULL, LRBM	VARCHAR(12) NULL, ' +
      ' LRSJ	DATETIME NULL, SCBJ	VARCHAR(1) NULL, SCSJ	DATETIME NULL, ' +
      ' XXLY	VARCHAR(1) NULL, GXSJ	DATETIME NULL, BZ	VARCHAR(256) NULL, ' +
      ' WFSPDZ	VARCHAR(512) NULL, YSZT	VARCHAR(1) NULL, SXR	VARCHAR(30) NULL, '
      + ' SXBM	VARCHAR(12) NULL, SXSJ	DATETIME NULL, SHR	VARCHAR(30) NULL, '
      + ' SHBM	VARCHAR(12) NULL, SHSJ	DATETIME NULL, CSBJ	VARCHAR(1) NULL, ' +
      ' BJCSBJ	VARCHAR(1) NULL, TXBJ	VARCHAR(1) NULL)';
    FSQLHelper.ExecuteSQL(s);

    s := ss.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'insert into ' + tmpTable +
      '(XH,YSXH,PH,FXJG,FXJGMC,ZQMJ,CLFL,HPZL,HPHM,JDCSYR,ZSXZQH,ZSXXDZ,DH,LXFS,SYXZ,'
      + 'CSYS,CLPP,JTFS,FZJG,CLYT,XCFW,SBLX,SBBH,YSBBH,QJBH,XZQH,DLLX,GLXZDJ,WFDZ,WFSJ,WFDD'
      + ',LDDM,DDMS,WFSJ1,WFDD1,LDDM1,DDMS1,WFXW,SCZ,BZZ,TZSH,TZBJ,TZRQ,LRR,LRBM,LRSJ,SCBJ'
      + ',SCSJ,XXLY,GXSJ,BZ,WFSPDZ,YSZT,SXR,SXBM,SXSJ,SHR,SHBM,SHSJ,CSBJ,BJCSBJ,TXBJ)values'
      + s;
    FSQLHelper.ExecuteSQL(s);

    s := 'insert into T_JCPT_VIO_SURVEIL(XH,YSXH,PH,FXJG,FXJGMC,ZQMJ,CLFL,HPZL,HPHM,JDCSYR,ZSXZQH,'
      + 'ZSXXDZ,DH,LXFS,SYXZ,CSYS,CLPP,JTFS,FZJG,CLYT,XCFW,SBLX,SBBH,YSBBH,QJBH,XZQH,DLLX,GLXZDJ,'
      + 'WFDZ,WFSJ,WFDD,LDDM,DDMS,WFSJ1,WFDD1,LDDM1,DDMS1,WFXW,SCZ,BZZ,TZSH,TZBJ,TZRQ,LRR,LRBM,LRSJ,'
      + 'SCBJ,SCSJ,XXLY,GXSJ,BZ,WFSPDZ,YSZT,SXR,SXBM,SXSJ,SHR,SHBM,SHSJ,CSBJ,BJCSBJ,TXBJ) ';
    s := s + 'select a.XH,a.YSXH,a.PH,a.FXJG,a.FXJGMC,a.ZQMJ,a.CLFL,a.HPZL,a.HPHM,a.JDCSYR,a.ZSXZQH,a.ZSXXDZ '
      + ',a.DH,a.LXFS,a.SYXZ,a.CSYS,a.CLPP,a.JTFS,a.FZJG,a.CLYT,a.XCFW,a.SBLX,a.SBBH,a.YSBBH,a.QJBH,a.XZQH,a.DLLX,a.GLXZDJ,a.WFDZ,a.WFSJ,'
      + 'a.WFDD,a.LDDM,a.DDMS,a.WFSJ1,a.WFDD1,a.LDDM1,a.DDMS1,a.WFXW,a.SCZ,a.BZZ,a.TZSH,a.TZBJ,a.TZRQ,a.LRR,a.LRBM,a.LRSJ,a.SCBJ,a.SCSJ,'
      + 'a.XXLY,a.GXSJ,a.BZ,a.WFSPDZ,a.YSZT,a.SXR,a.SXBM,a.SXSJ,a.SHR,a.SHBM,a.SHSJ,a.CSBJ,a.BJCSBJ,a.TXBJ';
    s := s + ' from ' + tmpTable + '  a ';
    s := s + ' left join T_JCPT_VIO_SURVEIL  b on a.YSXH=b.YSXH ';
    s := s + ' where b.YSXH is null ';
    s := s + ' drop table ' + tmpTable;
    FSQLHelper.ExecuteSQL(s);

    logger.Info('DownloadSURVEIL OK');
  end;

var
  ss: TStrings;
  s: string;
  maxGXSJ: double;
begin
  s := FSQLHelper.GetSinge('select max(gxsj) from T_JCPT_VIO_SURVEIL');
  if s = '' then
    maxGXSJ := now - 1
  else
    maxGXSJ := vartodatetime(s);
  ss := TStringList.Create;
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select XH,YSXH,PH,FXJG,FXJGMC,ZQMJ,CLFL,HPZL,HPHM,JDCSYR,ZSXZQH,ZSXXDZ');
    SQL.Add(',DH,LXFS,SYXZ,CSYS,CLPP,JTFS,FZJG,CLYT,XCFW,SBLX');
    SQL.Add(',SBBH,YSBBH,QJBH,XZQH,DLLX,GLXZDJ,WFDZ,WFSJ,WFDD');
    SQL.Add(',LDDM,DDMS,WFSJ1,WFDD1,LDDM1,DDMS1,WFXW,SCZ,BZZ,TZSH');
    SQL.Add(',TZBJ,TZRQ,LRR,LRBM,LRSJ,SCBJ,SCSJ,XXLY,GXSJ,BZ,WFSPDZ');
    SQL.Add(',YSZT,SXR,SXBM,SXSJ,SHR,SHBM,SHSJ,CSBJ,BJCSBJ,TXBJ ');
    SQL.Add('from RM.VIO_SURVEIL ');
    SQL.Add('where GXSJ > to_date(''' + FormatDateTime('yyyy-mm-dd hh:mm',
      maxGXSJ) +
      ''',''yyyy-mm-dd hh24:mi'') and YSXH is not null and length(YSXH) > 10');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
      DisableControls;
      while not EOF do
      begin
        ss.Add('(' + FieldByName('XH').AsString.QuotedString + ',' +
          FieldByName('YSXH').AsString.QuotedString + ',' + FieldByName('PH')
          .AsString.QuotedString + ',' + FieldByName('FXJG')
          .AsString.QuotedString + ',' + FieldByName('FXJGMC')
          .AsString.QuotedString + ',' + FieldByName('ZQMJ')
          .AsString.QuotedString + ',' + FieldByName('CLFL')
          .AsString.QuotedString + ',' + FieldByName('HPZL')
          .AsString.QuotedString + ',' + FieldByName('HPHM')
          .AsString.QuotedString + ',' + FieldByName('JDCSYR')
          .AsString.QuotedString + ',' + FieldByName('ZSXZQH')
          .AsString.QuotedString + ',' + FieldByName('ZSXXDZ')
          .AsString.QuotedString + ',' + FieldByName('DH').AsString.QuotedString
          + ',' + FieldByName('LXFS').AsString.QuotedString + ',' +
          FieldByName('SYXZ').AsString.QuotedString + ',' + FieldByName('CSYS')
          .AsString.QuotedString + ',' + FieldByName('CLPP')
          .AsString.QuotedString + ',' + FieldByName('JTFS')
          .AsString.QuotedString + ',' + FieldByName('FZJG')
          .AsString.QuotedString + ',' + FieldByName('CLYT')
          .AsString.QuotedString + ',' + FieldByName('XCFW')
          .AsString.QuotedString + ',' + FieldByName('SBLX')
          .AsString.QuotedString + ',' + FieldByName('SBBH')
          .AsString.QuotedString + ',' + FieldByName('YSBBH')
          .AsString.QuotedString + ',' + FieldByName('QJBH')
          .AsString.QuotedString + ',' + FieldByName('XZQH')
          .AsString.QuotedString + ',' + FieldByName('DLLX')
          .AsString.QuotedString + ',' + FieldByName('GLXZDJ')
          .AsString.QuotedString + ',' + FieldByName('WFDZ')
          .AsString.QuotedString + ',' + FieldByName('WFSJ')
          .AsString.QuotedString + ',' + FieldByName('WFDD')
          .AsString.QuotedString + ',' + FieldByName('LDDM')
          .AsString.QuotedString + ',' + FieldByName('DDMS')
          .AsString.QuotedString + ',' + FieldByName('WFSJ1')
          .AsString.QuotedString + ',' + FieldByName('WFDD1')
          .AsString.QuotedString + ',' + FieldByName('LDDM1')
          .AsString.QuotedString + ',' + FieldByName('DDMS1')
          .AsString.QuotedString + ',' + FieldByName('WFXW')
          .AsString.QuotedString + ',' + FieldByName('SCZ')
          .AsString.QuotedString + ',' + FieldByName('BZZ')
          .AsString.QuotedString + ',' + FieldByName('TZSH')
          .AsString.QuotedString + ',' + FieldByName('TZBJ')
          .AsString.QuotedString + ',' + FieldByName('TZRQ')
          .AsString.QuotedString + ',' + FieldByName('LRR')
          .AsString.QuotedString + ',' + FieldByName('LRBM')
          .AsString.QuotedString + ',' + FieldByName('LRSJ')
          .AsString.QuotedString + ',' + FieldByName('SCBJ')
          .AsString.QuotedString + ',' + FieldByName('SCSJ')
          .AsString.QuotedString + ',' + FieldByName('XXLY')
          .AsString.QuotedString + ',' + FieldByName('GXSJ')
          .AsString.QuotedString + ',' + FieldByName('BZ').AsString.QuotedString
          + ',' + FieldByName('WFSPDZ').AsString.QuotedString + ',' +
          FieldByName('YSZT').AsString.QuotedString + ',' + FieldByName('SXR')
          .AsString.QuotedString + ',' + FieldByName('SXBM')
          .AsString.QuotedString + ',' + FieldByName('SXSJ')
          .AsString.QuotedString + ',' + FieldByName('SHR')
          .AsString.QuotedString + ',' + FieldByName('SHBM')
          .AsString.QuotedString + ',' + FieldByName('SHSJ')
          .AsString.QuotedString + ',' + FieldByName('CSBJ')
          .AsString.QuotedString + ',' + FieldByName('BJCSBJ')
          .AsString.QuotedString + ',' + FieldByName('TXBJ')
          .AsString.QuotedString + '),');
        if ss.Count = 999 then
        begin
          Save(ss);
          ss.Clear;
        end;

        Next;
      end;
      Close;
    except
      on e: exception do
      begin
        logger.Error('[Download_VIO_SURVEIL]:' + e.Message + ' ' + SQL.Text);
      end;
    end;
  end;

  if ss.Count > 0 then
  begin
    Save(ss);
  end;
  ss.Free;
end;

procedure TMainThread.DownloadZFZAlarms;
  procedure Save(ss: TStrings);
  var
    s, tmpTable: string;
  begin
    logger.Info('Download_ZFZ_Alarms: ' + ss.Count.ToString);
    tmpTable := 'tmp_alarm' + FormatDateTime('yymmddhhmmsszzz', now);
    s := 'create table ' + tmpTable + '(JCXH varchar(50),' + 'GCXH varchar(50),'
      + 'KKBH varchar(50),' + 'FXLX varchar(50),' + 'CDH varchar(50),' +
      'GCSJ varchar(50),' + 'FWZBH varchar(50),' + 'FWZMC varchar(128),' +
      'CLZT varchar(50),' + 'HPHM varchar(50),' + 'HPZL varchar(50),' +
      'JCCLLX varchar(50),' + 'SFD varchar(128),' + 'MDD varchar(128),' +
      'ZKS varchar(50),' + 'HDZKL varchar(50),' + 'SJZZL varchar(50),' +
      'HDZZL varchar(50),' + 'GPS varchar(50),' + 'AQSB varchar(50),' +
      'CLLTHW varchar(50),' + 'WFYY varchar(50),' + 'JAQD varchar(50),' +
      'PLJS varchar(50),' + 'FFGZ varchar(50),' + 'ZTFGBS varchar(50),' +
      'AZFHZZ varchar(50),' + 'XGJSBZ varchar(50),' + 'AZDSJ varchar(50),' +
      'AZDLX varchar(50),' + 'SFWZJS varchar(50),' + 'SFYFJSY varchar(50),' +
      'QDYSTXZ varchar(50),' + 'JCJG varchar(64),' + 'JCQKMS varchar(512),' +
      'CZ varchar(50),' + 'CY varchar(50),' + 'JCSJ varchar(50),' +
      'JCMJ varchar(50),' + 'CJR varchar(50),' + 'CJJG varchar(50),' +
      'CJSJ varchar(50),' + 'GXSJ varchar(50))';
    FSQLHelper.ExecuteSQL(s);

    s := ss.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'insert into ' + tmpTable +
      '(JCXH,GCXH,KKBH,FXLX,CDH,GCSJ,FWZBH,FWZMC,CLZT,HPHM,HPZL,JCCLLX,' +
      'SFD,MDD,ZKS,HDZKL,SJZZL,HDZZL,GPS,AQSB,CLLTHW,WFYY,JAQD,PLJS,FFGZ,ZTFGBS,'
      + 'AZFHZZ,XGJSBZ,AZDSJ,AZDLX,SFWZJS,SFYFJSY,QDYSTXZ,JCJG,JCQKMS,' +
      'CZ,CY,JCSJ,JCMJ,CJR,CJJG,CJSJ,GXSJ)values' + s;
    FSQLHelper.ExecuteSQL(s);

    s := 'delete t from SERV_VEH_CHECK t,' + tmpTable +
      ' s where t.JCXH=s.JCXH ';
    FSQLHelper.ExecuteSQL(s);

    s := 'update t set t.CJR=s.CJR,t.CJJG=s.CJJG,t.CJSJ=s.CJSJ,t.GXSJ=s.GXSJ,t.HDZKL=s.HDZKL,t.HDZZL=s.HDZZL ';
    s := s + 'from SERV_VEH_CHECK t,' + tmpTable +
      ' s where t.HPHM=s.HPHM and t.GCSJ=s.GCSJ ';
    s := s + 'delete t from ' + tmpTable +
      ' t,SERV_VEH_CHECK s where t.HPHM=s.HPHM and t.GCSJ=s.GCSJ ';
    FSQLHelper.ExecuteSQL(s);

    s := 'insert into SERV_VEH_CHECK(' +
      'JCXH,GCXH,KKBH,FXLX,CDH,GCSJ,FWZBH,FWZMC,CLZT,HPHM,HPZL,JCCLLX,' +
      'SFD,MDD,ZKS,HDZKL,SJZZL,HDZZL,GPS,AQSB,CLLTHW,WFYY,JAQD,PLJS,FFGZ,ZTFGBS,'
      + 'AZFHZZ,XGJSBZ,AZDSJ,AZDLX,SFWZJS,SFYFJSY,QDYSTXZ,JCJG,JCQKMS,' +
      'CZ,CY,JCSJ,JCMJ,CJR,CJJG,CJSJ,GXSJ) ' +
      'select JCXH,GCXH,KKBH,FXLX,CDH,GCSJ,FWZBH,FWZMC,CLZT,HPHM,HPZL,JCCLLX,' +
      'SFD,MDD,ZKS,HDZKL,SJZZL,HDZZL,GPS,AQSB,CLLTHW,WFYY,JAQD,PLJS,FFGZ,ZTFGBS,'
      + 'AZFHZZ,XGJSBZ,AZDSJ,AZDLX,SFWZJS,SFYFJSY,QDYSTXZ,JCJG,JCQKMS,' +
      'CZ,CY,JCSJ,JCMJ,CJR,CJJG,CJSJ,GXSJ from ' + tmpTable;
    FSQLHelper.ExecuteSQL(s);

    s := 'update t set t.flag=2,t.message=''操作成功'' ' + 'from SERV_VEH_CHECK t,'
      + tmpTable + ' s ' + 'where s.SFD <> '''' and s.JCXH=t.JCXH';
    FSQLHelper.ExecuteSQL(s);

    s := 'drop table ' + tmpTable;
    FSQLHelper.ExecuteSQL(s);

    logger.Info('Download_ZFZ_Alarms OK');
  end;

var
  ss: TStrings;
  s: string;
  maxGXSJ: double;
begin
  s := FSQLHelper.GetSinge('select max(gxsj) from SERV_VEH_CHECK');
  if s = '' then
    maxGXSJ := now - 1
  else
    maxGXSJ := vartodatetime(s);
  ss := TStringList.Create;
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select JCXH,GCXH,KKBH,FXLX,CDH,GCSJ,FWZBH,FWZMC,CLZT,HPHM,HPZL,JCCLLX,');
    SQL.Add('SFD,MDD,ZKS,HDZKL,SJZZL,HDZZL,GPS,AQSB,CLLTHW,WFYY,JAQD,PLJS,FFGZ,ZTFGBS,');
    SQL.Add('AZFHZZ,XGJSBZ,AZDSJ,AZDLX,SFWZJS,SFYFJSY,QDYSTXZ,JCJG,JCQKMS,');
    SQL.Add('CZ,CY,JCSJ,JCMJ,CJR,CJJG,CJSJ,GXSJ ');
    SQL.Add('from SERV_VEH_CHECK ');
    SQL.Add('where GXSJ > to_date(''' + FormatDateTime('yyyy-mm-dd hh:mm',
      maxGXSJ) + ''',''yyyy-mm-dd hh24:mi'') ');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
      DisableControls;
      while not EOF do
      begin
        ss.Add('(' + FieldByName('JCXH').AsString.QuotedString + ',' +
          FieldByName('GCXH').AsString.QuotedString + ',' + FieldByName('KKBH')
          .AsString.QuotedString + ',' + FieldByName('FXLX')
          .AsString.QuotedString + ',' + FieldByName('CDH')
          .AsString.QuotedString + ',' + FieldByName('GCSJ')
          .AsString.QuotedString + ',' + FieldByName('FWZBH')
          .AsString.QuotedString + ',' + FieldByName('FWZMC')
          .AsString.QuotedString + ',' + FieldByName('CLZT')
          .AsString.QuotedString + ',' + FieldByName('HPHM')
          .AsString.QuotedString + ',' + FieldByName('HPZL')
          .AsString.QuotedString + ',' + FieldByName('JCCLLX')
          .AsString.QuotedString + ',' + FieldByName('SFD')
          .AsString.QuotedString + ',' + FieldByName('MDD')
          .AsString.QuotedString + ',' + FieldByName('ZKS')
          .AsString.QuotedString + ',' + FieldByName('HDZKL')
          .AsString.QuotedString + ',' + FieldByName('SJZZL')
          .AsString.QuotedString + ',' + FieldByName('HDZZL')
          .AsString.QuotedString + ',' + FieldByName('GPS')
          .AsString.QuotedString + ',' + FieldByName('AQSB')
          .AsString.QuotedString + ',' + FieldByName('CLLTHW')
          .AsString.QuotedString + ',' + FieldByName('WFYY')
          .AsString.QuotedString + ',' + FieldByName('JAQD')
          .AsString.QuotedString + ',' + FieldByName('PLJS')
          .AsString.QuotedString + ',' + FieldByName('FFGZ')
          .AsString.QuotedString + ',' + FieldByName('ZTFGBS')
          .AsString.QuotedString + ',' + FieldByName('AZFHZZ')
          .AsString.QuotedString + ',' + FieldByName('XGJSBZ')
          .AsString.QuotedString + ',' + FieldByName('AZDSJ')
          .AsString.QuotedString + ',' + FieldByName('AZDLX')
          .AsString.QuotedString + ',' + FieldByName('SFWZJS')
          .AsString.QuotedString + ',' + FieldByName('SFYFJSY')
          .AsString.QuotedString + ',' + FieldByName('QDYSTXZ')
          .AsString.QuotedString + ',' + FieldByName('JCJG')
          .AsString.QuotedString + ',' + FieldByName('JCQKMS')
          .AsString.QuotedString + ',' + FieldByName('CZ').AsString.QuotedString
          + ',' + FieldByName('CY').AsString.QuotedString + ',' +
          FieldByName('JCSJ').AsString.QuotedString + ',' + FieldByName('JCMJ')
          .AsString.QuotedString + ',' + FieldByName('CJR')
          .AsString.QuotedString + ',' + FieldByName('CJJG')
          .AsString.QuotedString + ',' + FieldByName('CJSJ')
          .AsString.QuotedString + ',' + FieldByName('GXSJ')
          .AsString.QuotedString + '),');
        if ss.Count = 999 then
        begin
          Save(ss);
          ss.Clear;
        end;

        Next;
      end;
      Close;
    except
      on e: exception do
      begin
        logger.Error('[Download_ZFZ_Alarms]:' + e.Message + ' ' + SQL.Text);
      end;
    end;
  end;

  if ss.Count > 0 then
  begin
    Save(ss);
  end;
  ss.Free;
end;

procedure TMainThread.DownloadZFZDriver;
  procedure Save(ss: TStrings);
  var
    s: string;
  begin
    logger.Info('Download_ZFZ_Driver: ' + ss.Count.ToString);

    s := ss.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'insert into SERV_VEH_CHECK_Driver' +
      '(JCXH,JSYLX,XM,JSZH,DABH,FZJG,CCSLRQ,ZT,ZTMC,LJJF,YXQZ,SYYXQZ,LXDZ,' +
      'LXDH,SFCF,SFZJBF,SFYQWHZ,SFYQWSY,QTMS,CSBJ,BJCSBJ,ZJCX)values' + s;
    FSQLHelper.ExecuteSQL(s);

    logger.Info('Download_ZFZ_Driver OK');
  end;

var
  ss: TStrings;
  s: string;
begin
  FSQLHelper.ExecuteSQL('delete from SERV_VEH_CHECK_Driver');
  ss := TStringList.Create;
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from SERV_VEH_CHECK_Driver ');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
      DisableControls;
      while not EOF do
      begin
        ss.Add('(' + FieldByName('JCXH').AsString.QuotedString + ',' +
          FieldByName('JSYLX').AsString.QuotedString + ',' + FieldByName('XM')
          .AsString.QuotedString + ',' + FieldByName('JSZH')
          .AsString.QuotedString + ',' + FieldByName('DABH')
          .AsString.QuotedString + ',' + FieldByName('FZJG')
          .AsString.QuotedString + ',' + FieldByName('CCSLRQ')
          .AsString.QuotedString + ',' + FieldByName('ZT').AsString.QuotedString
          + ',' + FieldByName('ZTMC').AsString.QuotedString + ',' +
          FieldByName('LJJF').AsString.QuotedString + ',' + FieldByName('YXQZ')
          .AsString.QuotedString + ',' + FieldByName('SYYXQZ')
          .AsString.QuotedString + ',' + FieldByName('LXDZ')
          .AsString.QuotedString + ',' + FieldByName('LXDH')
          .AsString.QuotedString + ',' + FieldByName('SFCF')
          .AsString.QuotedString + ',' + FieldByName('SFZJBF')
          .AsString.QuotedString + ',' + FieldByName('SFYQWHZ')
          .AsString.QuotedString + ',' + FieldByName('SFYQWSY')
          .AsString.QuotedString + ',' + FieldByName('QTMS')
          .AsString.QuotedString + ',' + FieldByName('CSBJ')
          .AsString.QuotedString + ',' + FieldByName('BJCSBJ')
          .AsString.QuotedString + ',' + FieldByName('ZJCX')
          .AsString.QuotedString + '),');
        if ss.Count = 999 then
        begin
          Save(ss);
          ss.Clear;
        end;

        Next;
      end;
      Close;
    except
      on e: exception do
      begin
        logger.Error('[Download_ZFZ_DRIVER]:' + e.Message + ' ' + SQL.Text);
      end;
    end;
  end;

  if ss.Count > 0 then
  begin
    Save(ss);
  end;
  ss.Free;
end;

procedure TMainThread.DownloadYiFanKui;
  procedure Save(ss: TStrings);
  var
    s, tmpTable: string;
  begin
    logger.Info('DownloadYiFanKui: ' + ss.Count.ToString);
    tmpTable := 'tmp_YiFanKui' + FormatDateTime('yymmddhhmmsszzz', now);
    s := 'create table ' + tmpTable;
    s := s + '(YJXH varchar(50),LJCLQK int,CHJG int,CLJG varchar(5),';
    s := s + ' FKBM varchar(50),FKR varchar(50),FKSJ datetime)';
    FSQLHelper.ExecuteSQL(s);

    s := ss.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'insert into ' + tmpTable +
      '(YJXH,LJCLQK,CHJG,CLJG,FKBM,FKR,FKSJ)values' + s;
    FSQLHelper.ExecuteSQL(s);

    s := 'update t set t.upload=1, t.FKBJ=1,t.FeedbackResult=1,FeedbackMessage=''集成平台同步'',gxsj=getdate(),';
    s := s + 't.LJCLQK=s.LJCLQK,t.CHJG=s.CHJG,t.CLJG=s.CLJG,t.CZDW=s.FKBM,t.CZR=s.FKR,t.CZSJ=s.FKSJ ';
    s := s + 'from T_KK_AlarmFeedback t ';
    s := s + 'inner join ' + tmpTable + ' s on t.YJXH=s.YJXH ';
    s := s + 'where t.FeedbackResult=0 ';

    s := s + 'update t set t.Feedback=''已反馈'',t.QSR=s.FKR,t.QSSJ=s.FKSJ,t.QSBJ=''1'',t.upload=''1'',t.SignResult=''1'',t.SignMessage=''集成平台反馈'' ';
    s := s + 'from T_KK_ALARMRESULT t inner join ' + tmpTable +
      ' s on s.YJXH=t.GCXH ';

    s := s + 'insert into T_KK_AlarmFeedback(yjxh,upload,FKBJ,FeedbackResult,FeedbackMessage,gxsj,LJCLQK,CHJG,CLJG,CZDW,CZR,CZSJ) ';
    s := s + 'select s.yjxh,1,1,1,''集成平台同步'',getdate(),s.LJCLQK,s.CHJG,s.CLJG,s.FKBM,s.FKR,s.FKSJ ';
    s := s + 'from ' + tmpTable + ' s ';
    s := s + 'left join T_KK_AlarmFeedback t on s.YJXH=t.YJXH ';
    s := s + 'where t.YJXH is null ';

    s := s + 'drop table ' + tmpTable;
    FSQLHelper.ExecuteSQL(s);

    logger.Info('DownloadYiFanKui OK');
  end;

var
  dt: string;
  ss: TStrings;
begin
  ss := TStringList.Create;
  dt := FormatDateTime('yyyy-mm-dd hh:mm', FMaxRKSJ1 - 0.1);
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select YJXH,LJCLQK,CHJG,CLJG,CHBM,LJMJ,FKSJ,GXSJ from VMC_SEIZE_VEHICLE');
    SQL.Add(' where FKBJ=1 ');
    SQL.Add(' and GXSJ>to_date(''' + dt + ''',''yyyy-mm-dd hh24:mi'')');
    SQL.Add('order by GXSJ desc');
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
      DisableControls;
      if not EOF then
        FMaxRKSJ1 := FieldByName('GXSJ').AsDateTime;
      while not EOF do
      begin
        ss.Add('(' + FieldByName('YJXH').AsString.QuotedString + ',' +
          FieldByName('LJCLQK').AsString.QuotedString + ',' +
          FieldByName('CHJG').AsString.QuotedString + ',' + FieldByName('CLJG')
          .AsString.QuotedString + ',' + FieldByName('CHBM')
          .AsString.QuotedString + ',' + FieldByName('LJMJ')
          .AsString.QuotedString + ',' + FieldByName('FKSJ')
          .AsString.QuotedString + '),');
        if ss.Count = 999 then
        begin
          Save(ss);
          ss.Clear;
        end;

        Next;
      end;
      Close;
    except
      on e: exception do
      begin
        logger.Error('[DownloadYiFanKui]:' + e.Message + ' ' + SQL.Text);
      end;
    end;
  end;

  if ss.Count > 0 then
  begin
    Save(ss);
  end;
  ss.Free;
end;

procedure TMainThread.UpdateDeviceStauts;
var
  SQL, kkzt: string;
  exists: boolean;
begin
  exists := false;
  SQL := 'select JCPTBABH, isOpenedInJCPT from S_DEVICE a ' +
    'inner join s_jcbk_device b on b.sbbh like ''%''+a.sbbh+''%'' ' +
    'where (closeTime is null and isOpenedInJCPT = 0) ' +
    'or (closeTime is not null and isOpenedInJCPT = 1)';
  with FSQLHelper.Query(SQL) do
  begin
    while not EOF do
    begin
      exists := true;
      if not Fields[1].AsBoolean then
        kkzt := '1'
      else
        kkzt := '3';
      self.ExecuteSQL('update dev_tollgate set KKZT=' + kkzt + ' where KKBH='''
        + Fields[0].AsString + '''');
      Next;
    end;
    Free;
  end;
  if exists then
  begin
    logger.Info('[UpdateDeviceStauts]');
    SQL := 'update s_jcbk_device set isOpenedInJCPT=1 where (closeTime is null and isOpenedInJCPT = 0)'
      + 'update s_jcbk_device set isOpenedInJCPT=0 where (closeTime is not null and isOpenedInJCPT = 1)';
    FSQLHelper.ExecuteSQL(SQL);
  end;
end;

procedure TMainThread.UploadVeh;
var
  ss, bklx: string;
  list: TStrings;
begin
  list := TStringList.Create;
  ss := 'select SYSTEMID, HPHM,HPZL,Left(CLPP,16) as CLPP,Left(CLLX, 3) as CLLX,CSYS,BKLX '
    + 'from T_KK_ALARM where ZT=1 and uploadstatus=0 and hphm+hpzl+clpp+cllx+csys is not null';
  with FSQLHelper.Query(ss) do
  begin
    while not EOF do
    begin
      bklx := FieldByName('BKLX').AsString;
      if not'01 02 03 04 05 06 07 08 09 21 22 23 24 25 31 32 33 34 35 36 37 38 39 43'.
        Contains(bklx) then
        bklx := '99';
      ss := 'insert into vmc_suspect_case_VEH(XH,SXH,HPHM,HPZL,CLPP,CLLX,CSYS,TPBJ,ZT) '
        + 'select a.XH, max(a.SXH) + 1, ' + FieldByName('HPHM')
        .AsString.QuotedString + ',' + FieldByName('HPZL').AsString.QuotedString
        + ',' + FieldByName('CLPP').AsString.QuotedString + ',' +
        FieldByName('CLLX').AsString.QuotedString + ',' + FieldByName('CSYS')
        .AsString.QuotedString + ',0,1 ' +
        'from vmc_suspect_case_VEH a, vmc_suspect_case b ' +
        'where a.XH=b.XH and b.BKLX=''' + bklx + ''' and b.CKBJ=0 ' +
        ' and not exists(select 1 from vmc_suspect_case_VEH where hphm=''' +
        FieldByName('HPHM').AsString + ''' and hpzl=''' + FieldByName('HPZL')
        .AsString + ''')' + ' group by a.XH ';
      ExecuteSQL(ss);

      list.Add('update T_KK_ALARM set uploadstatus=1 where systemid=''' +
        FieldByName('SYSTEMID').AsString + '''');
      Next;
    end;
    Free;
  end;

  ss := 'insert into vmc_suspect(BKXH,BKJZ,BKLX,BKXZ,BKJB,HPZL,HPHM,CLPP,CLLX,CSYS,BKR,BKJG,BKJGMC,BKLXR,LXDH,SFDXTZ,BKDJG,BKQSRQ,'
    + 'BKSXRQ,BKFWLX,TPSL,GLBM,SFBK,BKSJ,YJCS,YSBH,CSBJ,BJCSBJ,BKSJLY,SMCL,XCBJ,YWLB,QZYJ) '
    + 'SELECT ''445200'' || VMC_SUSPECT_XH.NEXTVAL as BKXH,''17'',b.BKLX,1,9,c.HPZL,c.HPHM,c.CLPP,c.CLLX,c.CSYS,''黄喜胜'',''445200000000'','
    + '''揭阳市交警支队'',''黄喜胜'',''13822938888'',0,''粤V'',b.BKQSRQ,b.BKSXRQ,1,0,''445200000000'',1,b.QRSJ,0,b.XH,0,1,1,0,1,1,0 '
    + 'FROM DUAL a, vmc_suspect_case b, vmc_suspect_case_veh c ' +
    'where b.xh=c.xh and not exists(select 1 from vmc_suspect d where c.hphm=d.hphm and c.hpzl=d.hpzl)';
  ExecuteSQL(ss);

  if list.Count > 0 then
  begin
    FSQLHelper.ExecuteSQL(list.Text);
  end;
  list.Free;
end;

procedure TMainThread.DoWQCZ;
var
  ss, YJXH, CZDW: string;
begin
  ss := 'select YJXH,CZDW from T_KK_AlarmFeedback where FeedbackMessage = ''无权处置反馈该预警信息'' and datediff(dd,CZSJ,getdate())<2 and ljclqk=1 and sfcjlj is null';
  with FSQLHelper.Query(ss) do
  begin
    while not EOF do
    begin
      YJXH := FieldByName('yjxh').AsString;
      CZDW := FieldByName('czdw').AsString;
      ss := 'update VMC_SEIZE_VEHICLE set CHBM=''' + CZDW + ''' where yjxh=''' +
        YJXH + '''';
      ExecuteSQL(ss);
      logger.Info('[DoWQCZ]: ' + YJXH);

      FSQLHelper.ExecuteSQL
        ('update T_KK_AlarmFeedback set upload=0,sfcjlj=1 where yjxh=''' +
        YJXH + '''');
      Next;
    end;
    Free;
  end;

  ss := 'select GCXH,QSBM from T_KK_AlarmResult where SignMessage = ''无权签收该预警信息'' and datediff(dd,GCSJ,getdate())<30 and wqqs=0 ';
  with FSQLHelper.Query(ss) do
  begin
    while not EOF do
    begin
      YJXH := FieldByName('gcxh').AsString;
      CZDW := FieldByName('QSBM').AsString;
      ss := 'update VMC_ALARM_PASS set QSBM=''' + CZDW + ''' where yjxh=''' +
        YJXH + '''';
      ExecuteSQL(ss);
      ss := 'update VMC_ALARM set QSBM=''' + CZDW + ''' where yjxh=''' +
        YJXH + '''';
      ExecuteSQL(ss);
      logger.Info('[DoWQQS]: ' + YJXH);

      FSQLHelper.ExecuteSQL
        ('update T_KK_AlarmResult set upload=0,wqqs=1 where gcxh=''' +
        YJXH + '''');
      Next;
    end;
    Free;
  end;
end;

function TMainThread.ExecuteSQL(ss: string): boolean;
begin
  result := false;
  with FOraQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(ss);
    try
      if not FOraConn.Connected then
        FOraConn.Open;
      Execute;
      result := true
    except
      on e: exception do
      begin
        result := false;
        logger.Error('[ExecuteSQL]:' + e.Message + ' ' + ss);
      end;
    end;
  end;
end;

end.
