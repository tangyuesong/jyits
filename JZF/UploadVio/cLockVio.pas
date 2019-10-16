unit cLockVio;

interface

uses SysUtils, Classes, uRequestItf, uJsonUtils, uCommon, Soap.EncdDecd,
  uGlobal, DateUtils;

type

  TLockVioClass = Class
  public
    sysid: string;
    flag: string; // 0Ϊ��ʡ����������Ҫ���ˣ�����Ϊʡ�⳵����Ҫ��������һƽ̨����
    xh: string; // ���
    cjjg: string; // �ɼ�����
    clfl: string; // ��������
    hpzl: string; // ��������
    hphm: string; // ���ƺ���
    jdcsyr: string; // ������������
    syxz: string; // ʹ������
    fdjh: string; // ��������,ע��Ҫ���˷Ƿ��ַ�
    clsbdh: string; // ����ʶ����ţ�ע��Ҫ���˷Ƿ��ַ�
    csys: string; // ������ɫ
    clpp: string; // ����Ʒ��
    jtfs: string; // ��ͨ��ʽ
    fzjg: string; // ��֤����
    zsxzqh: string; // ס����������
    zsxxdz: string; // ס����ϸ��ַ
    dh: string; // �绰
    lxfs: string; // ��ϵ��ʽ
    tzsh: string; // ֪ͨ���
    tzrq: string; // ֪ͨ����
    cjfs: string; // �ɼ���ʽ    7Ϊ�������
    wfsj: string; // Υ��ʱ��
    sj: string;
    xzqh: string; // ��������
    wfdd: string; // Υ���ص�
    lddm: string; // ·�κ���
    ddms: string; // �ص�����
    wfdz: string; // Υ����ַ
    wfxw: string; // Υ����Ϊ
    scz: string; // ʵ��ֵ
    bzz: string; // ��׼ֵ
    zqmj: string; // ִ����
    spdz: string; // ��Ƶ��ַ
    sbbh: string; // �豸���
    FWQDZ: string; // ��������ַ
    xp1: string;
    xp2: string;
    xp3: string;
    lhywfdd: string; // ����һΥ���ص�
    zpstr1: String; // ͼƬ1
    zpstr2: String; // ͼƬ2
    zpstr3: String; // ͼƬ3
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
    procedure UpdateVioState(id, zt, bz: String; sxh: String = '');
    function IsReVio(hphm, hpzl, cjjg, wfsj: String): Boolean;
    procedure DecodeRmResultHead(json: String; var code: String;
      var msg: String);
    function AnalysisVioUploadResult(s: String): String;
    function WriteVio(json: String): String;
    function IsXCCF(hphm, hpzl, wfxw, wfsj: String): Boolean;
  public
    function UploadVio(id: String; whiteList: TStrings): String;
    destructor Destroy; override;
  End;

implementation

destructor TDealLockVio.Destroy;
begin
  if vio <> nil then
    vio.Free;
  inherited;
end;

function TDealLockVio.IsXCCF(hphm, hpzl, wfxw, wfsj: String): Boolean;
var
  param: String;
  sj: TDateTime;
begin
  // �Ƿ��ֳ��Ѿ�����
  Result := False;
  if pos(',' + wfxw + ',', ',' + gUploadHisCfg.wfxw + ',') > 0 then
  begin
    sj := TCommon.StringToDT(wfsj);
    param := 'hphm=' + hphm.QuotedString + ' and hpzl=' + hpzl.QuotedString +
      ' and wfsj>''' + formatDatetime('YYYY/MM/DD HH:NN:SS', sj - 1 / 24) +
      ''' and wfsj < ''' + formatDatetime('YYYY/MM/DD HH:NN:SS',
      sj + 1 / 24) + '''';

    Result := gSQLHelper.ExistsRecord('T_VIO_Force', param) or
      gSQLHelper.ExistsRecord('T_VIO_Violation', param);
  end;
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
    Result := '�ϴ�ʧ��[�������]';
  end
  else
  begin
    DecodeRmResultHead(s, code, msg);
    if code = '1' then
    begin
      zt := '8';
      Result := '�ϴ��ɹ�';
      sxh := msg;
      msg := '';
    end
    else
    begin
      zt := '6';
      Result := '�ϴ�ʧ��[' + msg + ']';
      sxh := '';
    end;
    UpdateVioState(vio.sysid, zt, msg, sxh);
  end;
end;

procedure TDealLockVio.DecodeRmResultHead(json: String; var code: String;
  var msg: String);
begin
  try
    code := TCommon.GetJsonNode('code', json);
    if code = '1' then
      msg := TCommon.GetJsonNode('value', json)
    else if code = '0' then
      msg := TCommon.GetJsonNode('message', json);

    if msg = '' then
      msg := TCommon.GetJsonNode('msg1', json);
  except
    on e: exception do
      gLogger.Error('[UploadVio]' + e.Message);
  end;
end;

function TDealLockVio.UploadVio(id: String; whiteList: TStrings): String;
var
  s: String;
begin
  Result := '';
  s := Trim(TRequestItf.DbQuery('GetLockVio', 'systemid=' + id));
  if s = '' then
  begin
    UpdateVioState(id, '14', 'Υ����¼��Υ���豸������');
    Result := 'Υ����¼��Υ���豸������';
    exit;
  end;

  vio := TJsonUtils.JsonToObject<TLockVioClass>(s);

  if gUploadHisCfg.wfxw.Contains(vio.wfxw) and
    (DateUtils.DaysBetween(now, TCommon.StringToDT(vio.sj)) < gUploadHisCfg.DAY)
  then
  begin
    Result := '�ü�¼δ���ϴ�ʱ��';
    exit;
  end;

  try
    if UpperCase(Copy(Trim(vio.hphm), 1, 2)) = '��O' then
    begin
      UpdateVioState(id, 'B', '');
      Result := '�ϴ��ɹ�B';
      exit;
    end;

    if whiteList.IndexOf(vio.hphm + vio.hpzl) >= 0 then
    begin
      UpdateVioState(id, 'B', '');
      Result := '�ϴ��ɹ�B';
      exit;
    end;

    if IsXCCF(vio.hphm, vio.hpzl, vio.wfxw, vio.sj) then
    begin
      UpdateVioState(id, '11', '�ֳ��Ѵ���');
      Result := '�ϴ�ʧ��[�ֳ��Ѵ���]';
      exit;
    end;

    if IsReVio(vio.hphm, vio.hpzl, vio.cjjg, vio.sj) then
    begin
      UpdateVioState(id, '11', '������¼���ظ�');
      Result := '�ϴ�ʧ��[������¼���ظ�]';
      exit;
    end;

    s := WriteVio(s);
    Result := AnalysisVioUploadResult(s);
  except
    on e: exception do
      Result := '�ϴ�ʧ��[�쳣:' + e.Message + ']';
  end;
end;

function TDealLockVio.WriteVio(json: String): String;
begin
  Result := TRequestItf.RmQuery('WriteVio', 'vio=' + EncodeString(json));
end;

end.
