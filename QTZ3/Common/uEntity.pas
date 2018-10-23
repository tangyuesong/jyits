unit uEntity;

interface

uses
  System.Generics.Collections, Classes;

type

  TVehInfo = record
    code: string; // 返回编码
    msg: string; // 返回信息
    rownum: string; // 返回记录数
    HPHM: string; // 车牌号码
    HPZL: string; // 号牌种类
    syr: string; // 所有人
    sfzmhm: string; // 身份证号码
    syq: string; // 所有权，对应字典
    clsbdh: string; // 车辆识别代号
    fdjh: string; // 发动机号
    ZSXXDZ: string; // 住所详细地址
    zzxxdz: string; // 暂住详细地址
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
    YZBM1: string; // 常住地邮政编码
    yzbm2: string; // 暂住地邮政编码
    clpp1: string; // 中文品牌
    clpp2: string; // 英文品牌
    clxh: string; // 车辆型号
    csys: string; // 车身颜色-对应字典表
    syxz: string; // 使用性质-对应字典表
    cllx: string; // 车辆类型-对应字典表
    fzjg: string; // 发证机关
    glbm: string; // 管理部门
    ccdjrq: string; // 初次登记日期
    yxqz: string; // 检验有限期限
    bxzzrq: string; // 保险期限
    qzbfqz: string; // 车辆报费期限
    SJHM: string;
    lxdh: string;
    zt: string; // 状态
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
    LYUrl: String; // 猎鹰URL
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
