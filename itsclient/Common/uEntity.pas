unit uEntity;

interface

uses
  Classes, SysUtils;

type
  TPass = record
    GCXH: string;
    KDBH: string;
    HPHM: string;
    HPZL: string;
    GCSJ: string;
    FWQDZ: string;
    TP1, TP2, TP3: string;
    CDBH, CLSD: string;
  end;

  T_KK_Alarm = record
    SYSTEMID: string;
    HPHM: string;
    HPZL: string;
    SJHM: string;
  end;

  TSorceProcess = record
    SYSTEMID: string;
    jdsbh: string;
    jszh: string;
    zjcx: string;
    dsr: string;
    HPZL: string;
    HPHM: string;
    jdcsyr: string;
    wfsj: string;
    wfdd: string;
    wfdz: string;
    wfxw: string;
    wfjfs: string;
    fkje: string;
    cljg: string;
    cljgmc: string;
    clsj: string;
    lrr: string;
    lrsj: string;
    TPLJ: string;
    TP1: string;
    TP2: string;
    gxsj: string;
    yhbh: string;
  end;

  TClientLog = class
  public
    SYSTEMID: string;
    yhbh: string;
    DWDM: string;
    CZJX: string;
    CZRZ: string;
    IP: string;
    gxsj: string;
  end;

  TvioTZS = class
    SXH: string;
    CJJG: string;
    HPHM: string;
    HPZL: string;
    wfdd: string;
    wfxw: string;
    wfsj: string;
    jdcsyr: string;
    YZBM1: string;
    ZSXXDZ: string;
    WFXWDM: string;
    FG: string;
    JE: string;
    JF: string;
  end;

  TVioWmd = class
    SYSTEMID: string; // ϵͳID
    HPHM: string; // ���ƺ���
    HPZL: string; // ��������
    yxsj: string; // ����ʱ��
    jssj: string; // ����ʱ��
    yy: string; // ԭ��
    lrr: string; // ¼����
    lrsj: string; // ¼��ʱ��
    spr: string; // ������
    spsj: string; // ����ʱ��
    spyj: string; // �������
    bz: string; // ¼��������
    zt: string; // ���   0Ϊ����ˣ�1Ϊ���ͨ����4Ϊ��˲�ͨ��
    powertype: string; // �������  1������ 2��Υ�� 3������
    DWDM: string;
    gxsj: string;
  end;

  TVioClass = record
    SYSTEMID: string;
    jdslb: string; // ���������
    jdsbh: string; // ��������
    wfbh: string; // Υ�����
    ryfl: string; // ��Ա����
    jszh: string; // ��ʻ֤��
    dabh: string; // �������
    fzjg: string; // ��֤����
    zjcx: string; // ׼�ݳ���
    dsr: string; // ������
    clfl: string; // ��������
    HPZL: string; // ��������
    HPHM: string; // ���ƺ���
    jdcsyr: string; // ������������
    wfsj: string; // Υ��ʱ��
    wfdd: string; // Υ���ص�
    wfdz: string; // Υ����ַ
    wfxw: string; // Υ����Ϊ
    wfjfs: string; // Υ���Ƿ���
    fkje: string; // ������
    fxjg: string; // ���ֻ���
    fxjgmc: string; // ���ֻ�������
    cljg: string; // �������
    cljgmc: string; // �����������
    cfzl: string; // ��������
    clsj: string; // ����ʱ��
    jkbj: string; // ������
    jkrq: string; // ��������
    lrr: string; // ¼����
    jbr1: string; // ¼����
    lrsj: string; // ¼��ʱ��
    xrms: string; // д��ģʽ
    ysznj: string; // Ӧ�����ɽ�
    xxly: string; // 1-�ֳ�������2-���ֳ�����
    TP1: string;
    TP2: string;
    TP3: string;
    TPLJ: string;
    yhbh: string;
    gxsj: string;
  end;

  TUser = record
    SYSTEMID: string;
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
    Manager: Boolean;
    SH: String;
  end;

  TWfxw = record
    SYSTEMID: string;
    WFXWDM: string;
    wfxwmc: string;
    FG: string;
    TLJC: string;
    JE: string;
    JF: string;
    XH: string;
    glbm: string;
    yxqks: string;
    yxqjs: string;
    bz: string;
    gxsj: string;
  end;

  Tdept = record
    PDWDM: string;
    DWJB: string;
    DWDM: string;
    DWMC: string;
    DWFZR: string;
    DWLXR: string;
    lxdh: string;
    SJHM: string;
    DWDZ: string;
    JSCFDD: string;
    YHMC: string;
    FYJG1: string;
    FYJG2: string;
    SCMS: string;
    GXQY: string;
    XZQY: string;
    lng: string;
    lat: string;
    IsJX: Boolean;
  end;

  TDevice = record
    SYSTEMID: string;
    SBBH: string;
    JCPTBABH: string;
    JCPTBAFX: string;
    LKBH: string;
    LKMC: string;
    FXBH: string;
    FXMC: string;
    CJJG: string;
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
    LDBH: string;
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
    HBCZB: Boolean;
    XXZB: Boolean;
    DCXXZB: Boolean;
    YSXZB: Boolean;
    XYSB: Boolean;
    CZDW: string;
    AddSY: Boolean;
    ID: String;
  end;

  Tviotemp = record
    SYSTEMID: string;
    HPHM: string;
    HPZL: string;
    wfsj: TDateTime;
    wfdd: string;
    wfxw: string;
    CD: string;
    SJSD: Integer;
    XZSD: Integer;
    CJJG: string;
    FWQDZ: string;
    PHOTOFILE1: string;
    PHOTOFILE2: string;
    PHOTOFILE3: string;
    VIDEOFILE: string;
    bj: string;
  end;

  THBC = record
    SYSTEMID: string;
    HPHM: string;
    HPZL: string;
    fdjh: string;
    ccdjrq: string;
    SJHM: string;
    clpp: string;
    jdcsyr: string;
    ZSXXDZ: string;
    clsbdh: string;
    YXQX: string;
    BFQX: string;
    clxh: string;
    hbdbqk: string;
    bz: string;
    bj: string;
    gxsj: string;
  end;

  TSetup = record
    UICaption: string; // ϵͳ����
    UILOGoPath: string; // logo
    DBSERVER: string; // ��̨����������
    DBName: string; // ���ܷ������˿�
    DCSERName: string; // �����������ݿ�
    DCSERVER: string; // �������ŷ�����
    DFSHOST: string;
    VIOWSDL: string; // ����һWSDL�ӿ�
    VIOURL: string; // ����һURL
    VIOSVC: string;
    VIOPRT: string;
    VIOSN: string;
    DWDM: string; // ��λ����
    DirDelete: string; // ɾ���ļ���
    DirSave: string; // �����ļ���
    MapUrl: string;
    FtpHost: string;
    FtpPort: Integer;
    FtpUser: string;
    FtpPwd: string;
    DefSbbh: string;

    // �м���������
    DiPDbUrl: string;
    DiDbUrl: string;
    DiSlUrl: string;
    DiRmUrl: string;

    // ��Ƶ����
    VideoHost: string;
    VideoPort: Integer;
    VideoUser: string;
    VideoPwd: string;
    AppTitle: string;
  end;

  TGPY = record
    SYSTEMID: string;
    XTID: string;
    INPUT1: string;
    IDX1: string;
    WIDTH1: string;
    HEIGHT1: string;
    INPUT2: string;
    IDX2: string;
    WIDTH2: string;
    HEIGHT2: string;
    URL: string;
    FtpHost: string;
    FtpPort: string;
  end;

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

  TJSRYQZ = record
    SYSTEMID: string;
    SFZHM: string;
    XM: string;
    XB: string;
    LXZSXXDZ: string;
    cljg: string;
    cljgmc: string;
    lrr: string;
    lrsj: string;
    TPLJ: string;
    TP1: string;
    TP2: string;
    TP3: string;
    gxsj: string;
    yhbh: string;
  end;

  TDrvInfo = record
    code: string; // ���ش���
    msg: string;
    rownum: string; // ���ؼ�¼��
    sfzmmc: string; // ���֤������
    sfzmhm: string; // ���֤������
    hmcd: string; // ���볤��
    XM: string; // ����
    XB: string; // �Ա�
    csrq: string; // ��������
    gj: string; // ����
    djzsxzqh: string; // �Ǽ�ס����������
    djzsxxdz: string; // �Ǽ�ס����ϸ��ַ
    lxzsxzqh: string; // ��ϵס����������
    LXZSXXDZ: string; // ��ϵס����ϸ��ַ
    lxzsyzbm: string; // ��ϵס����������
    lxdh: string; // ��ϵ�绰
    SJHM: string; // �ֻ�����
    dzyx: string; // ��������
    dabh: string; // �������
    zjcx: string; // ׼�ݳ���
    ljjf: string; // �ۻ��Ƿ�
    zt: string; // ״̬
    cclzrq: string; // ������֤����
    jzqx: string; // ��֤����
    syrq: string; // ��һ�������
    yxqs: string; // ��Ч��ʼ
    yxqz: string; // ��Ч��ֹ
    xzqh: string; // ��������
    zzzm: string; // ��ס֤��
    gxsj: string; // ����ʱ��
    zxbh: string; // ֤о���
    fzjg: string; // ��֤����
    syyxqz: string; // ������Ч��ֹ
    xczg: string; // У���ʸ�
    xczjcx: string; // У��׼�ݳ���
    sxbj: string; // ʵϰ���
    sxqksbj: string; // ʵϰ�ڿ��Ա��
    sfzxcx: string; // �Ƿ���ע��׼�ݳ���
    zxcxyy: string; // ע��׼�ݳ��͵�ԭ��
  end;

  Tvioinfosrl = record
    XH: string; // ���
    CJJG: string; // �ɼ�����
    cjjgmc: string; // �ɼ���������
    clfl: string; // ��������
    HPZL: string; // ��������
    HPHM: string; // ���ƺ���
    jdcsyr: string; // ������������
    syxz: string; // ʹ������
    fdjh: string; // ��������
    clsbdh: string; // ����ʶ�����
    csys: string; // ������ɫ
    clpp: string; // ����Ʒ��
    jtfs: string; // ��ͨ��ʽ
    fzjg: string; // ��֤����
    zsxzqh: string; // ס����������
    ZSXXDZ: string; // ס����ϸ��ַ
    dh: string; // �绰
    LXFS: string; // ��ϵ��ʽ
    tzsh: string; // ֪ͨ���
    tzbj: string; // ֪ͨ���
    tzrq: string; // ֪ͨ����
    CJFS: string; // �ɼ���ʽ
    wfsj: string; // Υ��ʱ��
    wfdd: string; // Υ���ص�
    wfdz: string; // Υ����ַ
    wfxw: string; // Υ����Ϊ
    fkje: string; // ������
    scz: string; // ʵ��ֵ
    bzz: string; // ��׼ֵ
    zqmj: string; // ִ����
    cljg: string; // �������
    cljgmc: string; // �����������
    clsj: string; // ����ʱ��
    CLBJ: string; // ������
    jkfs: string; // ���ʽ
    jkbj: string; // ������
    jkrq: string; // �ɿ�����
    pzbh: string; // ǿ�ƴ�ʩƾ֤���
    wfbh: string; // Υ�����
    jdsbh: string; // �������
    wsjyw: string; // �������У��λ
    jdslb: string; // ���������
    dsr: string; // ������
    jbr: string; // ������
    lrr: string; // ¼����
    lrsj: string; // ¼��ʱ��
    jllx: string; // ��¼����
    cldxbj: string; // ���������
    xrms: string; // д��ģʽ
    jsjg: string; // ���ܻ���
    fsjg: string; // ���ͻ���
    gxsj: string; // ����ʱ��
    jszh: string; //
    zjcx: string; //
    wfjfs: string;
    xxly: string;
    bz: string; // ��ע
  end;

  TResultMail = record
    SYSTEMID: string;
    HPHM: string;
    HPZL: string;
    syr: string;
    lrr: string;
    IP: string;
    ZSXXDZ: string;
    txyy: string;
    bz: string;
    gxsj: string;
  end;

  TAlarmResult = record
    SYSTEMID: string;
    bz: string;
    GCXH: string;
    GCSJ: string;
    HPHM: string;
    HPZL: string;
    KDBH: string;
    KDMC: string;
    gxsj: string;
    FKR: string;
    FKYJ: string;
    FKSJ: string;
    FKNR: string;
    VIOURL: string;
    BKLX: string;
    BKZL: string;
    CLSD: string;
    CD: string;
    WFCS: string;
    Feedback: string;
    QSR: string;
    QSSJ: string;
    QSBM: string;
    QSBJ: string;
    QSJG: string;
    SFCJ: string;
  end;

  TFeedback = record
    SYSTEMID: string;
    YJXH: string;
    YWLX: string;
    QSJG: string;
    SFCJLJ: string;
    LJCLQK: string;
    WLJDYY: string;
    CHJG: string;
    cljg: string;
    WSBH: string;
    JYW: string;
    WSLB: string;
    YJBM: string;
    LXR: string;
    lxdh: string;
    WCHYY: string;
    CZQKMS: string;
    CZDW: string;
    CZR: string;
    CZSJ: string;
    gxsj: string;
  end;

  TBKCJResult = record
    SYSTEMID: string;
    BKXH: string;
    HPHM: string;
    HPZL: string;
    WFCS: string;
    SJHM: string;
    BKR: string;
    spr: string;
    spsj: string;
    spyj: string;
    VIOURL: string;
    CXYJ: string;
    CXR: string;
    BKLX: string;
    BKZL: string;
    bz: string;
    zt: string;
    gxsj: string;
    SMSTimeBegin: string;
    SMSTimeEnd: string;
    clpp: string;
    cllx: string;
    csys: string;
    CJJG: string;
    UploadStatus: string;
  end;

  tondevtype = record
    lat: Double;
    lng: Double;
    icon: string;
    ID: string;
    info: string;
  end;

  toffdevtype = record
    lat: Double;
    lng: Double;
    icon: string;
    ID: string;
    info: string;
  end;

  Tdevtypelist = record
    ioncount: Integer;
    ioffcount: Integer;
    ion: array [0 .. 2000] of tondevtype;
    ioff: array [0 .. 2000] of toffdevtype;
  end;

  TSaSetup = record
    SYSTEMID: string;
    CJJG: string;
  end;

  TCmd = record
    Action: string;
    Param: string;
  end;

  TSMessage = record
    ID: string;
    msg: string;
    gxsj: string;
  end;

  PCmd = ^TCmd;

  TQDZ = record
    SYSTEMID: string;
    QDZDM: string;
    QDZMC: string;
    JD: string;
    WD: string;
    GLRY: string;
    LXFS: string;
    TP1: string;
    TP2: string;
    TP3: string;
    RYSL: string;
    SBSL: string;
    SPSL: string;
    gxsj: string;
  end;

  TQDZRY = record
    SYSTEMID: string;
    QDZDM: string;
    XM: string;
    SFZHM: string;
    XL: string;
    DW: string;
    LXFS: string;
    LXDZ: string;
    TP1: string;
    TP2: string;
    TP3: string;
  end;

  TQDZSB = record
    SYSTEMID: string;
    QDZDM: string;
    SBDM: string;
    SBMC: string;
    SBZL: string;
    TP1: string;
    TP2: string;
    TP3: string;
    bz: string;
  end;

  TQDZSP = record
    SYSTEMID: string;
    QDZDM: string;
    SPDM: string;
    SPMC: string;
    SPJD: string;
    SPWD: string;
  end;

  TDFVehInfo = Record
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
  End;

  TVehCheck = record
    SYSTEMID, JCXH, GCXH, KKBH, FXLX, CDH, GCSJ, FWZBH, FWZMC, CLZT, HPHM, HPZL,
      JCCLLX: string;
    SFD, MDD, GPS, AQSB, CLLTHW, WFYY, JAQD, PLJS, FFGZ, ZTFGBS: string;
    AZFHZZ, XGJSBZ, AZDSJ, AZDLX, SFWZJS, SFYFJSY, QDYSTXZ, JCJG,
      JCQKMS: string;
    CZ, CY, JCSJ, JCMJ, CJR, CJJG, CJSJ, gxsj, ZJSZH, FJSZH, ZJSLXDH, FJSLXDH,
      Message: string;
    HDZKL, HDZZL, ZKS, SJZZL, flag: Integer;
  end;

  TViolationWrite = record
    jdsbh: string;
    ryfl: string;
    jszh: string;
    dabh: string;
    fzjg: string;
    zjcx: string;
    dsr: string;
    zsxzqh: string;
    ZSXXDZ: string;
    dh: string;
    LXFS: string;
    clfl: string;
    HPZL: string;
    HPHM: string;
    jdcsyr: string;
    syxz: string;
    jtfs: string;
    wfsj: string;
    xzqh: string;
    wfdd: string;
    lddm: string;
    ddms: string;
    wfdz: string;
    wfxw: string;
    scz: string;
    bzz: string;
    cfzl: string;
    fkje: string;
    zqmj: string;
    jkfs: string;
    jkbj: string;
    jkrq: string;
    fxjg: string;
    clsj: string;
    jsjqbj: string;
    sgdj: string;
    JD: string;
    WD: string;
    zxbh: string;
    Sfzdry: string;
  end;

  TVehCheckHis = record
    HPHM, HPZL: string;
    SFD, MDD: string;
    ZJSZH, FJSZH: string;
  end;

  TFwzInfo = record
    FWZBH: string;
    FWZMC: string;
  end;

  TK08Dic = record
    SYSTEMID: String;
    FLBH: String;
    DM: String;
    MC: String;
    MineKey: String;
  end;

implementation

end.
