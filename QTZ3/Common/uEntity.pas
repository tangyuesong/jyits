unit uEntity;

interface

uses
  System.Generics.Collections, Classes;

type

  TVehInfo = record
    code: string; // ���ر���
    msg: string; // ������Ϣ
    rownum: string; // ���ؼ�¼��
    HPHM: string; // ���ƺ���
    HPZL: string; // ��������
    syr: string; // ������
    sfzmhm: string; // ���֤����
    syq: string; // ����Ȩ����Ӧ�ֵ�
    clsbdh: string; // ����ʶ�����
    fdjh: string; // ��������
    ZSXXDZ: string; // ס����ϸ��ַ
    zzxxdz: string; // ��ס��ϸ��ַ
    zzxzqh: string;
    zsxzqh: string;
    xzqh: string;
    zzg: string;
    zzcmc: string;
    fzrq: string;
    fdjrq: string;
    fprq: string;
    fhgzrq: string;
    bpcs: string;
    bzcs: string;
    bdjcs: string;
    hbdbqk: string;
    gcjk: string;
    YZBM1: string; // ��ס����������
    yzbm2: string; // ��ס����������
    clpp1: string; // ����Ʒ��
    clpp2: string; // Ӣ��Ʒ��
    clxh: string; // �����ͺ�
    csys: string; // ������ɫ-��Ӧ�ֵ��
    syxz: string; // ʹ������-��Ӧ�ֵ��
    cllx: string; // ��������-��Ӧ�ֵ��
    fzjg: string; // ��֤����
    glbm: string; // ������
    ccdjrq: string; // ���εǼ�����
    yxqz: string; // ������������
    bxzzrq: string; // ��������
    qzbfqz: string; // ������������
    SJHM: string;
    lxdh: string;
    zt: string; // ״̬
  end;

  TOraConfig = Record
    IP: string;
    Port: string;
    SID: string;
    ServiceName: string;
    User: string;
    Pwd: string;
  End;

  THikConfig = Record
  {
    LYUrl: String; // ��ӥURL
    LYUser: String;
    LYPwd: String;
    LYHttpConverter: string;
  }
    moreLikeThisHBase: String;
    PicAnalysis: String;
    CarFace: String;
    analysisExtra: String;
    dataAnalysis: String;
    {
    DFUrl: String;
    DFUser: String;
    DFPwd: String;
    }
    PassOra: TOraConfig;
  End;

  TConfig = Record
    DWDM: String;
    DBServer: String;
    DBPort: Integer;
    DBUser: String;
    DBPwd: String;
    DBName: String;
    SolrHome: string;
    HttpServerPort: Integer;
    HttpPath: String;
    HttpHome: String;
    // ImportVio
    ImportVioHost: String;
    ImportVioPort: Integer;
    ImportVioUser: String;
    ImportVioPassword: String;
    ImportVioHome: String;
    HaveK08: Boolean;
    // hik config
    {
      PassOra: TOraConfig;
      K08SearchURL: String;
      K08SaveUrl: String;
      DFUrl: String;
      DFUser: String;
      DFPwd: String;
    }
    HikConfig: THikConfig;
    // SMS
    SMSUrl: String;
    // Heartbeat
    PicUrl: String;

    HeartbeatUrl: String;
    HeartbeatInterval: Integer;
  end;

  TDBActionParam = Record
    Action: String;
    Param: String;
    ParamType: String;
    Nonnull: Boolean;
    DefaultValue: String;
    DbColName: String;
  end;

  TDBAction = Record
    SystemID: String;
    ActionType: String;
    Action: String;
    TableName: String;
    SQL: String;
    Params: TList<TDBActionParam>;
    ReturnGroups: TStrings;
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
    HPZL: string;
    gcsj: string;
    clsd: string;
    hpys: string;
    cllx: string;
    HPHM: string;
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

  TDevice = record
    SystemID: string;
    SBBH: string;
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
    LXFS: string;
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

  TUser = record
    SystemID: string;
    DWDM: string;
    yhbh: string;
    ZW: string;
    YHXM: string;
    XL: string;
    SJHM: string;
    SFZHM: string;
    MM: string;
    IPKS: string;
    IPJS: string;
    MAC: string;
    FH: string;
    zt: string;
    bz: string;
    QX: string;
    gxsj: string;
    lrr: string;
    Manager: String;
    SH: String;
    role: String;
    MJ: String;
    LastLoginTime: String;
    LastTokenError: String;
    ValidDay: String;
    PasswordValidDay: String;
  end;

  TDept = record
    PDWDM: string;
    DWJB: string;
    DWDM: string;
    DWMC: string;
    DWFZR: string;
    DWLXR: string;
    lxdh: string;
    SJHM: string;
    DWDZ: string;
    JSCFYHMC: string;
    YHMC: string;
    FYJG1: string;
    FYJG2: string;
    SCMS: string;
    GXQY: string;
    XZQY: string;
    lng: string;
    lat: string;
    IsJX: Boolean;
    CLJG: String;
    CLJGDH: String;
    BMQC: String;
    CLDZ: String;
    CLBGCDZ: String;
    YZURL: String;
    JSCFDD: String;
  end;

implementation

end.
