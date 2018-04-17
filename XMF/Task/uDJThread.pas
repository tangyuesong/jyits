unit uDJThread;

interface

uses
  Windows, Classes, Types, SysUtils, IOUtils, DateUtils, Generics.Collections,
  Variants, IdHTTP, uBaseThread, uTypes, uImageOps, uGlobal, uPassList,
  uHik86Sender, ActiveX;

type
  TDJThread = class(TBaseThread)
  private
    FConfig: TDJThreadConfig;
    FVioList: TList<TPass>;
    FTime: double;
    FRecentFiles: TDictionary<string, TDateTime>;
    FXZXFX: TDictionary<string, string>;
    FXZXHPZL: TDictionary<string, string>;
    procedure CheckRecentFiles;
    function DealOneFile(jpgPath: string): boolean;
    function GetFHPass(jpgPath: string): TPass;
    function GetZmPass(jpgPath: string): TPass;
    function GetXZXPass(jpgPath: string): TPass;
    function GetPicData(jpgPath: string): TPass;
    function ProcessPicture(data: TPass; localPath: string): boolean;
    function GetHPYS(hphm, hpzl: string): string;
  protected
    procedure Prepare; override;
    procedure Perform; override;
    procedure AfterTerminate; override;
  public
    constructor Create(config: TDJThreadConfig); overload;
    destructor Destroy; override;
  end;

implementation

{ TDJThread }

constructor TDJThread.Create(config: TDJThreadConfig);
begin
  FConfig := config;
  FVioList := TList<TPass>.Create;
  FRecentFiles := TDictionary<string, TDateTime>.Create;
  FTime := Now;
  inherited Create;
end;

destructor TDJThread.Destroy;
begin
  FVioList.Free;
  FRecentFiles.Free;
  inherited;
end;

procedure TDJThread.Perform;
var
  n: integer;
  files: TStringDynArray;
  jpgPath: string;
begin
  files := TDirectory.GetFiles(FConfig.cqlj, '*.jpg',
    TSearchOption.soAllDirectories);
  n := 0;
  for jpgPath in files do
  begin
    if DealOneFile(jpgPath) then
    begin
      n := n + 1;
      if n >= 1000 then
      begin
        logger.Warn('many file');
        break;
      end;
    end;
  end;

  if Now - FTime > OneSecond then
  begin
    CheckRecentFiles;
    FTime := Now;
  end;
end;

procedure TDJThread.Prepare;
begin
  inherited;
  ActiveX.CoInitialize(nil);
  logger.Info(FConfig.KeyName + ' Start');
  if not TDirectory.Exists(FConfig.cqlj) then
  begin
    logger.Error(FConfig.KeyName + ' 源目录不存在：' + FConfig.cqlj);
    self.Terminate;
  end;
  if FConfig.szfl = 'XZX' then
  begin
    FXZXFX := TDictionary<string ,string>.Create;
    FXZXFX.Add('A', '01');
    FXZXFX.Add('B', '02');
    FXZXFX.Add('C', '03');
    FXZXFX.Add('D', '04');

    FXZXHPZL := TDictionary<string ,string>.Create;
    FXZXHPZL.Add('双层车牌C黄底黑字P', '01');
    FXZXHPZL.Add('标准车牌C黄底黑字P', '07');
    FXZXHPZL.Add('标准车牌C蓝底白字P', '02');
    FXZXHPZL.Add('警车车牌C白底黑字P', '23');
    FXZXHPZL.Add('标准车牌C黑底白字P', '06');
  end;
end;

procedure TDJThread.AfterTerminate;
begin
  inherited;
  if FConfig.szfl = 'XZX' then
  begin
    FXZXFX.Free;
    FXZXHPZL.Free;
  end;
  logger.Info(FConfig.KeyName + ' Stoped');
end;

function TDJThread.DealOneFile(jpgPath: string): boolean;
  function GetRandom: string;
  var
    n: integer;
  begin
    n := Random(999);
    if n < 100 then
      n := n + 100;
    result := n.ToString;
  end;
  function Gethpzldm(str: string): string;
  begin
    if str = '0' then
      result := '02'
    else if str = '1' then
      result := '02'
    else if str = '2' then
      result := '01'
    else if str = '4' then
      result := '07'
    else if str = '5' then
      result := '07'
    else if str = '99' then
      result := '44'
    else
      result := str;
  end;
var
  pass: TPass;
  yyyymm,dd,localPath: string;
begin
  result := false;
  if FRecentFiles.ContainsKey(jpgPath) then exit;
  try
    if FConfig.szfl = 'XZX' then
      pass := GetXZXPass(jpgPath)
    else if FConfig.szfl = 'ZM' then
      pass := GetZMPass(jpgPath)
    else if FConfig.szfl = 'FH' then
      pass := GetFHPass(jpgPath)
    else
      pass := GetPicData(jpgPath);
    if pass.kdbh = '' then
    begin
      result := true;
      exit;
    end;
    pass.GCXH := pass.GCSJ +  GetRandom;
    pass.GCSJ := Copy(pass.GCSJ, 1, 4) + '-' + Copy(pass.GCSJ, 5, 2) + '-' +
      Copy(pass.GCSJ, 7, 2) + ' ' + Copy(pass.GCSJ, 9, 2) + ':' +
      Copy(pass.GCSJ, 11, 2) + ':' + Copy(pass.GCSJ, 13, 2);
    pass.HPZL := Gethpzldm(pass.HPZL);
    if pass.hphm = '无车牌' then
    begin
      pass.hphm := '-';
      pass.hpzl := '44';
    end;
    pass.HPYS := GetHPYS(pass.HPHM, pass.HPZL);
    pass.KKSOURCE := FConfig.KeyName;
    pass.tp1 := jpgPath;
    pass.tp2 := Copy(jpgPath, 1, Length(jpgPath) - 5) + '2.jpg';
    pass.tp3 := Copy(jpgPath, 1, Length(jpgPath) - 5) + '3.jpg';
    if not FileExists(pass.tp2) then pass.tp2 := '';
    if not FileExists(pass.tp3) then pass.tp3 := '';

    yyyymm := formatdatetime('yyyymm', Now);
    dd := formatdatetime('dd', Now);
    pass.FWQDZ := Format('%s/%s/%s/%/', [FConfig.scurl, yyyymm, dd, pass.kdbh]);
    localPath := Format('%s/%s/%s/%/', [FConfig.sclj, yyyymm, dd, pass.kdbh]);
    if ProcessPicture(pass, localPath) then
    begin
      pass.tp1 := pass.KDBH + pass.GCXH + FConfig.szfl + '_1.jpg';
      if pass.tp2 <> '' then pass.tp2 := pass.KDBH + pass.GCXH + FConfig.szfl + '_2.jpg';
      if pass.tp3 <> '' then pass.tp3 := pass.KDBH + pass.GCXH + FConfig.szfl + '_3.jpg';
      PassList.Add(pass);
      if FConfig.TargetUrlHik <> '' then
      begin
        THik86Sender.SendPass(pass, localPath);
      end;
    end
    else begin
      FRecentFiles.Add(jpgPath, Now);
    end;
    result := true;
  except
    on e: exception do
    begin
      logger.Error('[DealOneFile]' + e.Message + ':' + jpgPath);
      result := false;
    end;
  end;
end;

function TDJThread.GetHPYS(hphm, hpzl: string): string;
begin
  if hphm.Contains('学') then result := '1'
  else if hphm.Contains('警') then result := '0'
  else if hphm.Contains('WJ') then result := '0'
  else if hphm.Contains('广') then result := '0'
  else if hphm.Contains('粤Z') then result := '3'
  else if hpzl = '01' then result := '1'
  else if hpzl = '02' then result := '2'
  else if hpzl = '07' then result := '1'
  else if hpzl = '06' then result := '3'
  else result := '9';
end;

function TDJThread.GetPicData(jpgPath: string): TPass;
  function GetFXBH(fxmc: string): string;
  begin
    result := '';
    if FXDic.ContainsKey(fxmc) then
      result := FXDic[fxmc];
  end;

  procedure FileError(fn: string);
  var
    errorPath: string;
  begin
    errorPath := ExtractFilePath(ParamStr(0)) + 'ErrorPic';
    if not TDirectory.Exists(errorPath) then
      TDirectory.CreateDirectory(errorPath);
    if TFile.Exists(errorPath + '\' + fn + '.jpg') then
      TFile.Delete(errorPath + '\' + fn + '.jpg');
    TFile.Move(jpgPath, errorPath + '\' + fn + '.jpg');
  end;
var
  fn: string;
  keys, values: TArray<string>;
  i: integer;
begin
  result.kdbh := '';
  if Copy(jpgPath, Length(jpgPath) - 4, 1) = '1' then
  begin
    fn := TPath.GetFileNameWithoutExtension(jpgPath);
    keys := FConfig.cqgz.Split(['_']);
    values := fn.Split(['_']);
    if Length(keys) <> Length(values) then
    begin
      logger.Error('图片命名规则出错：' + FConfig.cqgz + ', ' + fn);
      FileError(fn);
      exit;
    end;

    for i := 0 to Length(keys) - 1 do
    begin
      if keys[i] = 'cjjg' then
        result.cjjg := values[i]
      else if keys[i] = 'sbbh' then
        result.kdbh := values[i]
      else if keys[i] = 'fxmc' then
        result.KDBH := result.kdbh + GetFXBH(values[i])
      else if keys[i] = 'gcsj' then
      begin
        result.GCSJ := values[i];
      end
      else if keys[i] = 'wfxw' then
      begin
        result.WFXW := values[i];
        if result.WFXW = '1352' then
          result.WFXW := '1352A';
        if result.WFXW = '1721' then
          result.WFXW := '1721A';
        if result.WFXW = '1302' then
          result.WFXW := '1625';
      end
      else if keys[i] = 'cd' then
      begin
        result.cdbh := values[i];
        result.cdbh := StrToIntDef(result.cdbh, 1).ToString;// 去掉前面的0
      end
      else if keys[i] = 'clsd' then
        result.clsd := values[i]
      else if keys[i] = 'hphm' then
        result.hphm := values[i]
      else if keys[i] = 'hpzl' then
        result.hpzl := values[i]
      else if keys[i] = 'clpp' then
        result.CLPP := values[i]
      else if keys[i] = 'csys' then
        result.CSYS := values[i];
    end;
  end
  else
  begin
    // 读取到图片2时，检查图片1是否存在，不存在则删除照片
    if TFile.Exists(jpgPath) and (not TFile.Exists(Copy(jpgPath, 1, Length(jpgPath) - 5) + '1.jpg')) then
    begin
      try
        DeleteFile(PWideChar(jpgPath));
      except
        on e: exception do
        begin
          logger.Error('删除文件出错:' + e.Message + jpgPath);
        end;
      end;
    end;

  end;
end;

function TDJThread.ProcessPicture(data: TPass; localPath: string): boolean;
  function MoveFile(sPath, TPath: string): boolean;
  begin
    result := false;
    try
      if TFile.Exists(TPath) then
        TFile.Delete(TPath);
      TFile.Move(sPath, TPath);
      result := true;
    except
      on e: exception do
      begin
        if e.Message <> '另一个程序正在使用此文件，进程无法访问。' then
          logger.Error('MoveFile:' + e.Message + ',' + sPath + ' to ' + TPath);
      end;
    end;
  end;
  function ComAndMove(sPath, TPath: string): boolean;
  var
    ps: integer;
  begin
    ps := TImageOps.GetPictureSize(sPath);
    result := ps > 102400;  // 100k
    if ps > FConfig.tpxz then
    begin
      logger.Warn('[Comjpg][' + ps.ToString + ']' + sPath);
      result := TImageOps.Comjpg(sPath, sPath);
    end;
    result := result and MoveFile(sPath, TPath);
  end;
begin
  if not DirectoryExists(localPath) then
    ForceDirectories(localPath);
  result := true;

  if data.tp3 <> '' then
    result := result and ComAndMove(data.tp3, localPath + '\' + data.KDBH + data.GCXH + FConfig.szfl + '_3.jpg');
  if data.tp2 <> '' then
    result := result and ComAndMove(data.tp2, localPath + '\' + data.KDBH + data.GCXH + FConfig.szfl + '_2.jpg');
  result := result and ComAndMove(data.tp1, localPath + '\' + data.KDBH + data.GCXH + FConfig.szfl + '_1.jpg');
end;

function TDJThread.GetXZXPass(jpgPath: string): TPass;
var
  tmp, str: string;
  pass: TPass;
begin
  try
    str := ExtractFileName(jpgPath);
    pass.CJJG := FConfig.BMDM;
    pass.KKSOURCE := FConfig.KeyName;
    pass.kdbh := Copy(FConfig.BMDM, 1, 6) + Copy(str, Pos('机号', str) + 2, 3);
    tmp := Copy(str, Pos('车道', str) + 2, 1);
    if FXZXFX.ContainsKey(tmp) then
    begin
      tmp := FXZXFX[tmp];
      pass.kdbh := pass.kdbh + tmp;
    end;
    pass.gcsj := Copy(str, Pos('年', str) - 4, 4) + Copy(str, Pos('月', str) - 2, 2) +
      Copy(str, Pos('日', str) - 2, 2) + Copy(str, Pos('时', str) - 2, 2) +
      Copy(str, Pos('分', str) - 2, 2) + Copy(str, Pos('秒', str) - 2, 2);

    pass.WFXW := FConfig.WFXW;
    if (Pos('闯红灯', str) > 0) then
      pass.WFXW := '1625'
    else if (Pos('超速', str) > 0) then
      pass.WFXW := '1352A'
    else if (Pos('不按车道行驶', str) > 0) then // todo: 待确认
      pass.WFXW := '1042A';

    pass.cdbh := Copy(str, Pos('车道', str) + 3, 1);
    pass.clsd := '0';

    if Pos('车牌', str) > 0 then
    begin
      pass.HPHM := Copy(str, Pos('P', str) + 1, Pos('驶', str) - Pos('P', str) - 1);
      tmp := Copy(str, Pos('T', str) + 1, Pos('P', str) - Pos('T', str));
      if FXZXHPZL.ContainsKey(tmp) then
      begin
        pass.hpzl := FXZXHPZL[tmp];
        pass.hpys := GetHpys(pass.HPHM, pass.HPZL);
      end
      else
        pass.hpzl := '44';
    end
    else
    begin
      pass.hphm := '-';
      pass.hpzl := '44';
    end;
    pass.CLPP := '';
    pass.CSYS := '';
  except
    on e: exception do
    begin
      logger.Error('[DealXZX]' + e.Message + ' ' + jpgPath);
      pass.kdbh := '';
    end;
  end;
  result := pass;
end;

function TDJThread.GetZMPass(jpgPath: string): TPass;
var
  str, fx: string;
  pass: TPass;
begin
//R210001T20170617172157673L01V00S000.C
  try
    str := ExtractFileName(jpgPath);
    pass.CJJG := FConfig.BMDM;
    pass.KKSOURCE := FConfig.KeyName;
    pass.KDBH := Copy(FConfig.BMDM, 1, 6) + Copy(str, Pos('R', str) + 1,
      Pos('T', str) - Pos('R', str) - 1);               //R01610081T20170525161944L02V001S00C1625P0000000Z00
    if str.Contains('D') then
    begin
      fx := Copy(str, Pos('D', str) + 1, 1);
      pass.GCSJ := Copy(str, Pos('T', str) + 1, Pos('D', str) - Pos('T', str) - 1);
    end
    else begin
      fx := '';
      pass.GCSJ := Copy(str, Pos('T', str) + 1, Pos('L', str) - Pos('T', str) - 1);
    end;
    pass.KDBH := pass.KDBH + fx;
    pass.WFXW := FConfig.WFXW;
    pass.CDBH := Copy(str, Pos('L', str) + 2, 1);
    pass.CLSD := Copy(str, Pos('V', str) + 1, 3);
    if pass.CLSD.Contains('S') then
      pass.CLSD := pass.CLSD.Replace('S', '');
    pass.clsd := StrToIntDef(pass.clsd, 0).ToString;   // 去掉前面的0

    pass.hphm := '-';
    pass.hpzl := '44';
  except
    on e: exception do
    begin
      pass.kdbh := '';
      if e.Message <> '另一个程序正在使用此文件，进程无法访问。' then
        logger.Error('[DealZM]' + e.Message + ' ' + jpgPath);
    end;
  end;
  result := pass;
end;

function TDJThread.GetFHPass(jpgPath: string): TPass;
var
  str: string;
  p: TArray<string>;
begin
  try
    str := ExtractFileName(jpgPath);
    str := Copy(str, 1, Length(str) - 4);
    p := str.Split(['_']);
    result.CJJG := FConfig.BMDM;
    result.KKSOURCE := FConfig.KeyName;
    result.kdbh := p[2];
    result.GCSJ := p[0];
    result.WFXW := FConfig.WFXW;
    result.cdbh := '0';
    result.CLSD := '0';
    result.hphm := '-';
    result.hpzl := '44';
    result.tp1 := jpgPath;
  except
    on e: exception do
    begin
      logger.Error('[DealFw]' + e.Message + ' ' + jpgPath);
      result.kdbh := '';
    end;
  end;
end;

procedure TDJThread.CheckRecentFiles;
var
  key: string;
  ss: TStrings;
  ps: integer;
begin
  ss := TStringList.Create;
  for key in FRecentFiles.keys do
  begin
    if Now - FRecentFiles[key] > OneSecond * 5 then
    begin
      ss.Add(key);
    end;
  end;
  for key in ss do
  begin
    ps := TImageOps.GetPictureSize(key);
    if (ps <> -1) and (ps < 102400) then     // 100k
    begin
      try
        TFile.Delete(key);
        FRecentFiles.Remove(key);
        logger.Warn('delete empty file: ' + ps.ToString + ' ' + key);
      finally
      end;
    end
    else
      FRecentFiles.Remove(key);
  end;
  ss.Free;
end;

end.
