unit cLockVio;

interface

uses SysUtils, Classes, uRequestItf, uJsonUtils, uCommon, Soap.EncdDecd, qjson;

type

  TLockVioClass = Class
  public
    sysid: string;
    flag: string; // 0为本省车辆，不需要复核，其它为省外车辆，要经过六合一平台复核
    xh: string; // 序号
    cjjg: string; // 采集机关
    clfl: string; // 车辆分类
    hpzl: string; // 号牌种类
    hphm: string; // 号牌号码
    jdcsyr: string; // 机动车所有人
    syxz: string; // 使用性质
    fdjh: string; // 发动机号,注意要过滤非法字符
    clsbdh: string; // 车辆识别代号，注意要过滤非法字符
    csys: string; // 车身颜色
    clpp: string; // 车辆品牌
    jtfs: string; // 交通方式
    fzjg: string; // 发证机关
    zsxzqh: string; // 住所行政区划
    zsxxdz: string; // 住所详细地址
    dh: string; // 电话
    lxfs: string; // 联系方式
    tzsh: string; // 通知书号
    tzrq: string; // 通知日期
    cjfs: string; // 采集方式    7为区间测速
    wfsj: string; // 违法时间
    sj: string;
    xzqh: string; // 行政区划
    wfdd: string; // 违法地点
    lddm: string; // 路段号码
    ddms: string; // 地点米数
    wfdz: string; // 违法地址
    wfxw: string; // 违法行为
    scz: string; // 实测值
    bzz: string; // 标准值
    zqmj: string; // 执勤民警
    spdz: string; // 视频地址
    sbbh: string; // 设备编号
    FWQDZ: string; // 服务器地址
    xp1: string;
    xp2: string;
    xp3: string;
    lhywfdd: string; // 六合一违法地点
    zpstr1: String; // 图片1
    zpstr2: String; // 图片2
    zpstr3: String; // 图片3
    scms: string;
    tpzl: String;
    tpw: String;
    tph: String;
    LHY_WFDD_1: String;
    LHY_DDMS_1: String;
    LHY_LDDM_1: String;
  end;

  TDealLockVio = Class
  private
    vio: TLockVioClass;
    function IsWhite(hphm, hpzl, wfsj: String): Boolean;
    procedure UpdateVioState(id, zt, bz: String; sxh: String = '');
    function IsReVio(hphm, hpzl, cjjg, wfsj: String): Boolean;
    procedure DecodeRmResultHead(json: String; var code: String;
      var msg: String);
    function AnalysisVioUploadResult(s: String): String;
    function WriteVio(json: String): String;
    function FindJson(AItemName: String; AJSON: TQJson): TQJson;
    function GetJsonNode(ANode, AJSON: String): String;
  public
    function UploadVio(id: String; whiteList: TStrings): String;
    destructor Destroy; override;
  End;

implementation

function TDealLockVio.FindJson(AItemName: String; AJSON: TQJson): TQJson;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to AJSON.Count - 1 do
  begin
    if UpperCase(AJSON.Items[i].Name) = UpperCase(AItemName) then
      Result := AJSON.Items[i]
    else
      Result := FindJson(AItemName, AJSON.Items[i]);
    if Result <> nil then
      break;
  end;
end;

function TDealLockVio.GetJsonNode(ANode, AJSON: String): String;
var
  item, json: TQJson;
begin
  Result := '';
  json := TQJson.Create;
  try
    json.Parse(AJSON);
    item := FindJson(ANode, json);
    if item <> nil then
      Result := item.ToString;
  finally
    json.Free;
  end;
end;

destructor TDealLockVio.Destroy;
begin
  if vio <> nil then
    vio.Free;
  inherited;
end;

function TDealLockVio.IsWhite(hphm, hpzl, wfsj: String): Boolean;
begin
  Result := TRequestItf.DbQuery('GetT_VIO_WHILELIST', 'zt=1&end_lrsj=' + wfsj +
    '&hphm=' + hphm + '&hpzl=' + hpzl) <> '';
end;

procedure TDealLockVio.UpdateVioState(id, zt, bz: String; sxh: String = '');
var
  param: String;
begin
  param := 'Systemid=' + id + '&sxh=' + sxh + '&zt=' + zt + '&bz=' + bz +
    '&GXSJ=' + formatDatetime('yyyy/mm/dd hh:nn:ss', now);
  TRequestItf.DbQuery('ModifyT_VIO_HIS', param);
end;

function TDealLockVio.IsReVio(hphm, hpzl, cjjg, wfsj: String): Boolean;
var
  param: String;
  sj: TDateTime;
begin
  sj := TCommon.StringToDT(wfsj);
  param := 'hphm=' + hphm + '&hpzl=' + hpzl + '&cjjg=' + cjjg + '&begin_wfsj=' +
    formatDatetime('YYYY/MM/DD', sj - 1) + ' 23:50:01&end_wfsj=' +
    formatDatetime('YYYY/MM/DD', sj + 1) + ' 00:10:59&zt=8';
  Result := TRequestItf.DbQuery('GetT_VIO_HIS', param) <> '';
end;

function TDealLockVio.AnalysisVioUploadResult(s: String): String;
var
  code, msg, sxh: String;
  zt: String;
begin
  if s = '' then
  begin
    Result := '上传失败[网络故障]';
  end
  else
  begin
    // DecodeRmResultHead(s, code, msg);
    code := GetJsonNode('code', s);
    msg := GetJsonNode('msg1', s);
    if msg = '' then
      msg := GetJsonNode('message', s);
    if code = '1' then
    begin
      zt := '8';
      Result := '上传成功';
      sxh := msg;
      msg := '';
    end
    else
    begin
      zt := '6';
      Result := '上传失败[' + msg + ']';
    end;
    UpdateVioState(vio.sysid, zt, msg, sxh);
  end;
end;

procedure TDealLockVio.DecodeRmResultHead(json: String; var code: String;
  var msg: String);
var
  head, s: string;
  tmpTs: TStrings;
  i: Integer;
begin
  tmpTs := TStringList.Create;
  tmpTs.Delimiter := ',';
  if Pos('"head":{', json) > 0 then
  begin
    json := Copy(json, Pos('"head":{', json) + 8, Length(json));
    head := Copy(json, 1, Pos('}', json) - 1);
    json := Copy(json, Pos('}', json) + 1, Length(json));
    head := StringReplace(head, '"', '', [rfReplaceAll]);
    tmpTs.DelimitedText := head;
    for i := 0 to tmpTs.Count - 1 do
    begin
      if Pos('code', tmpTs[i]) = 1 then
        code := Trim(Copy(tmpTs[i], Pos(':', tmpTs[i]) + 1, 10))
      else if Pos('msg:', tmpTs[i]) = 1 then
      begin
        s := Trim(Copy(tmpTs[i], Pos(':', tmpTs[i]) + 1, Length(tmpTs[i])));
        if Length(s) >= 5 then
          msg := s;
      end
      else if Pos('msg1', tmpTs[i]) = 1 then
      begin
        if Length(msg) < 5 then
          msg := Trim(Copy(tmpTs[i], Pos(':', tmpTs[i]) + 1, Length(tmpTs[i])));
      end;
    end;
  end;
  tmpTs.Free;
end;

function TDealLockVio.UploadVio(id: String; whiteList: TStrings): String;
var
  s: String;
begin
  Result := '';
  s := Trim(TRequestItf.DbQuery('GetLockVio', 'systemid=' + id));
  if s = '' then
  begin
    UpdateVioState(id, '14', '违法记录或违法设备不存在');
    Result := '违法记录或违法设备不存在';
    exit;
  end;

  vio := TJsonUtils.JsonToObject<TLockVioClass>(s);

  try
    {
      if IsWhite(vio.hphm, vio.hpzl, vio.sj) then
      begin
      UpdateVioState(id, 'B', '');
      Result := '上传成功B';
      exit;
      end;
    }
    if UpperCase(Copy(Trim(vio.hphm), 1, 2)) = '粤O' then
    begin
      UpdateVioState(id, 'B', '');
      Result := '上传成功B';
      exit;
    end;

    if whiteList.IndexOf(vio.hphm + vio.hpzl) >= 0 then
    begin
      UpdateVioState(id, 'B', '');
      Result := '上传成功B';
      exit;
    end;

    if IsReVio(vio.hphm, vio.hpzl, vio.cjjg, vio.sj) then
    begin
      UpdateVioState(id, '11', '机动车录入重复');
      Result := '上传失败[机动车录入重复]';
      exit;
    end;

    s := WriteVio(s);
    Result := AnalysisVioUploadResult(s);
  except
    on e: exception do
      Result := '上传失败[异常:' + e.Message + ']';
  end;
end;

function TDealLockVio.WriteVio(json: String): String;
begin
  Result := TRequestItf.RmQuery('WriteVio', 'vio=' + EncodeString(json));
end;

end.
