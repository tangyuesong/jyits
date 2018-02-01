unit uEntity;

interface

type

  THikConfig = Record
    LYUrl: String;                     //¡‘”•URL
    LYUser: String;
    LYPwd: String;
    LYHttpConverter: string;
    K08SearchURL: String;
    K08SaveUrl: String;
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
    SolrHome: string;
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

implementation

end.
