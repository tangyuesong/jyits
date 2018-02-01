unit cLockVio;

interface

uses SysUtils, Classes, uRequestItf, uJsonUtils, uCommon, Soap.EncdDecd;

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
    function IsWhite(hphm, hpzl, wfsj: String): Boolean;
    procedure UpdateVioState(id, zt, bz: String; sxh: String = '');
    function IsReVio(hphm, hpzl, cjjg, wfsj: String): Boolean;
    procedure DecodeRmResultHead(json: String; var code: String;
      var msg: String);
    function AnalysisVioUploadResult(s: String): String;
    function WriteVio(json: String): String;
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

function TDealLockVio.IsWhite(hphm, hpzl, wfsj: String): Boolean;
begin
  Result := TRequestItf.DbQuery('GetT_VIO_WHILELIST', 'zt=1&end_lrsj=' +
    wfsj + '&hphm=' + hphm + '&hpzl=' + hpzl) <> '';
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
    UpdateVioState(id, '14', 'Υ����¼��Υ���豸������');
    Result := 'Υ����¼��Υ���豸������';
    exit;
  end;

  vio := TJsonUtils.JsonToObject<TLockVioClass>(s);

  try
    {
      if IsWhite(vio.hphm, vio.hpzl, vio.sj) then
      begin
      UpdateVioState(id, 'B', '');
      Result := '�ϴ��ɹ�B';
      exit;
      end;
    }
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
