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
    HumanFace: String;
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
    //HttpPath: String;
    //HttpHome: String;
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
    PicUrl: String;
    // Heartbeat
    HeartbeatUrl: String;
    HeartbeatInterval: Integer;
    TmriType: String; // 访问6合1方式
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

  TLockVio = Record
    sysid: string;
    flag: string; // 0为本省车辆，不需要复核，其它为省外车辆，要经过六合一平台复核
    xh: string; // 序号
    cjjg: string; // 采集机关
    clfl: string; // 车辆分类
    HPZL: string; // 号牌种类
    HPHM: string; // 号牌号码
    jdcsyr: string; // 机动车所有人
    syxz: string; // 使用性质
    fdjh: string; // 发动机号,注意要过滤非法字符
    clsbdh: string; // 车辆识别代号，注意要过滤非法字符
    csys: string; // 车身颜色
    clpp: string; // 车辆品牌
    jtfs: string; // 交通方式
    fzjg: string; // 发证机关
    zsxzqh: string; // 住所行政区划
    ZSXXDZ: string; // 住所详细地址
    dh: string; // 电话
    LXFS: string; // 联系方式
    tzsh: string; // 通知书号
    tzrq: string; // 通知日期
    cjfs: string; // 采集方式    7为区间测速
    wfsj: string; // 违法时间
    sj: String;
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
    SBBH: string; // 设备编号
    fwqdz: string; // 服务器地址
    xp1: string;
    xp2: string;
    xp3: string;
    lhywfdd: string; // 六合一违法地点
    zpstr1: String; // 图片1
    zpstr2: String; // 图片2
    zpstr3: String; // 图片3
    SCMS: string;
    tpzl: String;
    tpw: String;
    tph: String;
    LHY_WFDD_1: String;
    LHY_DDMS_1: String;
    LHY_LDDM_1: String;
  end;

implementation

end.
