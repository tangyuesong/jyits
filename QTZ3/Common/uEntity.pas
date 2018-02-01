unit uEntity;

interface

uses
  System.Generics.Collections, Classes;

type

  TConfig = Record
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
    // hik config
    HaveK08: Boolean;
    K08SearchURL: String;
    K08SaveUrl: String;
    DFUrl: String;
    DFUser: String;
    DFPwd: String;
    // SMS
    SMSUrl: String;
    // Heartbeat
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
    HBCZB: Boolean;
    XXZB: Boolean;
    DCXXZB: Boolean;
    YSXZB: Boolean;
    XYSB: Boolean;
    CZDW: string;
    ID: String;
    AddSY: Boolean;
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

implementation

end.
