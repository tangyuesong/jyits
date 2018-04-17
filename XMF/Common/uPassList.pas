unit uPassList;

interface

uses
  SysUtils, Classes, System.Generics.Collections, SyncObjs, uGlobal, uTypes,
  DateUtils, IdHttp, IOUtils;

type
  TPassList = class
  private
    cs: TCriticalSection;
    FList: TList<TPass>;
    FLastTime: Double;
    FPostFailedCount: integer;
    FSaveToFileCount: integer;
    //procedure SaveToDB(list: Tlist<TPass>);
    function HttpPost(list: Tlist<TPass>): boolean;
    procedure SaveToFile(list: TList<TPass>);
    procedure Save(list: TList<TPass>);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(pass: TPass);
    procedure PostHis;
  end;

var
  PassList: TPassList;

implementation

procedure TPassList.Add(pass: TPass);
var
  tmp: TList<TPass>;
begin
  cs.Enter;
  FList.Add(pass);
  if (FList.Count >= 999)or(now - FLastTime > OneSecond * Second) then
  begin
    FLastTime := now;
    tmp := FList;
    FList := TList<TPass>.Create;  // 避免阻塞所有线程
    cs.Leave;
    Save(tmp);
    tmp.Free;
  end
  else
    cs.Leave;
end;

constructor TPassList.Create;
begin
  cs := TCriticalSection.Create;
  FList := TList<TPass>.Create;
  FLastTime := now;
  FPostFailedCount := 0;
  FSaveToFileCount := 0;
end;

destructor TPassList.Destroy;
begin
  if FList.Count > 0 then
  begin
    Save(FList);
  end;
  FList.Free;
  cs.Free;
  inherited;
end;

procedure TPassList.Save(list: TList<TPass>);
begin
  if FPostFailedCount < RePostCount then
  begin
    if HttpPost(list) then
    begin
      FSaveToFileCount := 0;
      FPostFailedCount := 0;
    end
    else begin
      Inc(FPostFailedCount);
      Sleep(1000);
      Save(list);
    end;
  end
  else begin       // 连续 RePostCount 次 HttpPost不成功,则写入文件
    SaveToFile(list);
    Inc(FSaveToFileCount);
    if FSaveToFileCount >= RePostCount then  // RePostCount次写入文件后，尝试一次 HttpPost
      FPostFailedCount := RePostCount - 1;
  end;
end;

function TPassList.HttpPost(list: Tlist<TPass>): boolean;
var
  pass: TPass;
  stream: TStringStream;
  http: TIdHttp;
begin
  result := true;
  if list.Count > 0 then
  begin
    stream := TStringStream.Create('', TEncoding.UTF8);
    for pass in list do
    begin
      stream.WriteString(pass.ToString + #13#10);
    end;
    http := TIdHttp.Create(nil);
    try
      http.Post(Url, stream);
      logger.Info('SavePassRec OK: ' + list.Count.ToString);
    except
      on e: exception do
      begin
        result := false;
        logger.Error('[HttpPost]' + e.Message);
      end;
    end;
    http.Free;
    stream.Free;
  end;
end;

procedure TPassList.PostHis;
  function Post(filename: string): boolean;
  var
    line: string;
    ss: TStringList;
    pass: TPass;
    arr: TArray<string>;
    list: TList<TPass>;
  begin
    result := false;
    list := TList<TPass>.Create;
    ss := TStringList.Create;
    ss.LoadFromFile(filename, TEncoding.UTF8);
    for line in ss do
    begin
      arr := line.Split([#9]);
      pass.CJJG := arr[0];
      pass.GCXH := arr[1];
      pass.KKSOURCE := arr[2];
      pass.kdbh := arr[3];
      pass.FXBH := arr[4];
      pass.cdbh := arr[5];
      pass.HPZL := arr[6];
      pass.gcsj := arr[7];
      pass.WFXW := arr[8];
      pass.clsd := arr[9];
      pass.hpys := arr[10];
      pass.HPHM := arr[11];
      pass.CSYS := arr[12];
      pass.CLPP := arr[13];
      pass.FWQDZ := arr[14];
      pass.tp1 := arr[15];
      pass.tp2 := arr[16];
      pass.tp3 := arr[17];
      list.Add(pass);
    end;
    ss.Free;
    result := HttpPost(list);
    if result then
      TFile.Delete(filename);
    list.Free;
  end;
var
  path, item: string;
begin
  path := ExtractFilePath(ParamStr(0)) + 'tmp\';
  for item in TDirectory.GetFiles(path) do
  begin
    if not Post(item) then exit;
  end;
end;

procedure TPassList.SaveToFile(list: TList<TPass>);
var
  stream: TStringStream;
  pass: TPass;
  filename: string;
begin
  if list.Count > 0 then
  begin
    stream := TStringStream.Create('', TEncoding.UTF8);
    for pass in list do
    begin
      stream.WriteString(pass.ToString + #13#10);
    end;
    filename := ExtractFilePath(ParamStr(0)) + 'tmp\';
    if not IOUtils.TDirectory.Exists(filename) then
      TDirectory.CreateDirectory(filename);
    filename := filename + TGuid.NewGuid.ToString;
    stream.SaveToFile(filename);
    stream.Free;
    logger.Info('SaveToFile: ' + list.Count.ToString + ' ' + filename);
  end;
end;

{
procedure TPassList.SaveToDB(list: Tlist<TPass>);
var
  pass: TPass;
  sql: TStrings;
  s: string;
begin
  sql := TStringList.Create;
  for pass in list do
  begin
    sql.Add('(' +
      pass.cjjg.QuotedString + ',' +
      pass.gcxh.QuotedString + ',' +
      pass.kksource.QuotedString + ',' +
      pass.kdbh.QuotedString + ',' +
      pass.fxbh.QuotedString + ',' +
      pass.cdbh.QuotedString + ',' +
      pass.hpzl.QuotedString + ',' +
      pass.gcsj.QuotedString + ',' +
      pass.WFXW.QuotedString + ',' +
      pass.clsd.QuotedString + ',' +
      pass.hphm.QuotedString + ',' +
      pass.hpys.QuotedString + ',' +
      pass.fwqdz.QuotedString + ',' +
      pass.tp1.QuotedString + ',' +
      pass.tp2.QuotedString + ',' +
      pass.tp3.QuotedString + '),');
    if sql.Count = 999 then
    begin
      logger.Info('SavePassRec: ' + sql.Count.ToString);
      s := sql.Text;
      s := copy(s, 1, length(s) - 3); // 回车换行
      s := 'insert into T_PASS(CJJG,GCXH,KKSOURCE,KDBH,FXBH,CDBH,HPZL,GCSJ,WFXW,CLSD,HPHM,HPYS,FWQDZ,TP1,TP2,TP3)values' + s;
      SQLHelper.ExecuteSql(s);
      logger.Info('SavePassRec OK');
      sql.Clear;
    end;
  end;
  if sql.Count > 0 then
  begin
    logger.Info('SavePassRec: ' + sql.Count.ToString);
    s := sql.Text;
    s := copy(s, 1, length(s) - 3); // 回车换行
    s := 'insert into T_PASS(CJJG,GCXH,KKSOURCE,KDBH,FXBH,CDBH,HPZL,GCSJ,WFXW,CLSD,HPHM,HPYS,FWQDZ,TP1,TP2,TP3)values' + s;
    SQLHelper.ExecuteSql(s);
    logger.Info('SavePassRec OK');
  end;
  sql.Free;
end;
}

end.
