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
    LYUrl: String; // 猎鹰URL
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
    wfsj: TDateTime; // 违法时间
    wfxw: string; // 违法行为
    scz: string; // 实测值
    bzz: string; // 标准值
    zqmj: string; // 执勤民警
    wfdd: String;
    spdz: string; // 视频地址
    fwqdz: string; // 服务器地址
    xp1: string;
    xp2: string;
    xp3: string;
    zpstr1: String; // 图片1
    zpstr2: String; // 图片2
    zpstr3: String; // 图片3
    Device1: TDevice;
    Device2: TDevice;
  end;

implementation

end.
