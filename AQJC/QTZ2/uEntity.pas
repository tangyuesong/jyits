unit uEntity;

interface

uses
  Windows;

type
  TDevice = record
    SystemID: string;
    sbbh: string;
    jcptbabh: string;
    JCPTBAFX: string;
    lkbh: string;
    LKMC: string;
    fxbh: string;
    FXMC: string;
    cjjg: string;
    SBDDMC: string;
    SBJD: string;
    SBWD: string;
    SBIP: string;
    SBCJ: string;
    CSLXR: string;
    lxfs: string;
    QYSJ: string;
    JDJG: string;
    JDBH: string;
    JDYXQ: string;
    QYRQ: string;
    XZSD: Integer;
    DCXZSD: Integer;
    QSSBBH: string;
    SBLX: string;
    ldbh: string;
    LHY_XZQH: string;
    LHY_WFDD: string;
    LHY_SBBH: string;
    LHY_LDDM: string;
    LHY_DDMS: string;
    LHY_CJFS: string;
    LHY_JPGH: string;
    LHY_JPGW: string;
    LHY_JPGQ: string;
    QYZT: Boolean;
    ZJZT: Boolean;
    SCJCPT: Boolean;
    TPGS: string;
    wfxw: string;
    bz: string;
    gxsj: string;
    TPXZ: Boolean;
    XSZB: Boolean;
    AQDSB: Boolean;
    HBCZB: Integer;
    XXZB: Boolean;
    DCXXZB: Boolean;
    YSXZB: Boolean;
    XYSB: Boolean;
    CZDW: string;
    ID: String;
    AddSY: Boolean;
    AutoUpload: Boolean;
    UploadJCPT: Boolean;
  end;

  THikConfig = Record
    LYUrl: String; // ��ӥURL
    LYUser: String;
    LYPwd: String;
    LYHttpConverter: string;
    K08SearchURL: String;
    K08SaveUrl: String;
    PicAnalysis: String;
    CarFace: String;
    DFUrl: String;
    DFUser: String;
    DFPwd: String;
  End;

  TConfig = Record
    DBServer: String;
    DBPort: Integer;
    DBUser: String;
    DBPwd: String;
    DBName: String;
    SolrHome, SolrHome1: string;

    SolrLocalPort: Integer;
    HikConfig: THikConfig;
    // SMS
    SMSUrl: String;
  end;

  TAction = Record
    SystemID: String;
    ActionType: String;
    Action: String;
    TableName: String;
    SQL: String;
  end;

  THttpServer = Record
    SystemID: String;
    HttpName: String;
    Port: Integer;
  end;

  TPass = record
    cjjg: string;
    gcxh: string;
    jcbkbabh: string;
    jcptbabh: string;
    kksoure: string;
    kdbh: string;
    fxbh: string;
    cdbh: string;
    cdlx: string;
    hpzl: string;
    gcsj: string;
    clsd: string;
    hpys: string;
    cllx: string;
    hphm: string;
    cwhphm: string;
    cwhpys: string;
    hpyz: string;
    yrksj: string;
    csys: string;
    clxs: string;
    clpp: string;
    clwx: string;
    xszt: string;
    wfbj: string;
    fwqdz: string;
    tp1: string;
    tp2: string;
    tp3: string;
    tztp: string;
    drtp1: string;
    drtp2: string;
    rksj: string;
    fsbz: string;
    alarm_type: string;
    alarm_src: string;
    alarm_src_id: string;
    flag: string;
    gxsj: string;
    ldbh: string;
    lkbh: String;
    ser01: string;
    ser02: string;
    ser03: string;
    ser04: string;
    ser05: string;
    ser06: string;
    ser07: string;
    ser08: string;
    ser09: string;
  end;

  TUser = record
    DWDM: string;
    yhbh: string;
    YHXM: string;
  end;

  TmodeInfo = Record
    modeRect: TRect;
    hashData: String;
  End;

  TstPreProcRet = Record
    nTagID: String;
    PlateNum: String;
    nColor: String;
    nType: String;
    nMainLogo: String;
    nSubLogo: String;
    nModel: String;
    nPilotSB: String;
    nCopilotSB: String;
    nPilotSV: String;
    nCopilotSV: String;
    nDangMark: String;
    nEnvProSign: String;
    nUPhone: String;
    nPendant: String;
    stTagRect: TRect;
    stTagModel: String;
  End;

  TLockVioClass = Class
  public
    sysid: string;
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
    wfsj: TDateTime; // Υ��ʱ��
    wfxw: string; // Υ����Ϊ
    scz: string; // ʵ��ֵ
    bzz: string; // ��׼ֵ
    zqmj: string; // ִ����
    wfdd: String;
    spdz: string; // ��Ƶ��ַ
    fwqdz: string; // ��������ַ
    xp1: string;
    xp2: string;
    xp3: string;
    zpstr1: String; // ͼƬ1
    zpstr2: String; // ͼƬ2
    zpstr3: String; // ͼƬ3
    Device1: TDevice;
    Device2: TDevice;
  end;

implementation

end.
