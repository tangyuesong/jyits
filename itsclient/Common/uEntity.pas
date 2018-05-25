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
    SYSTEMID: string; // 系统ID
    HPHM: string; // 号牌号码
    HPZL: string; // 号牌种类
    yxsj: string; // 有限时间
    jssj: string; // 结束时间
    yy: string; // 原因
    lrr: string; // 录入人
    lrsj: string; // 录入时间
    spr: string; // 审批人
    spsj: string; // 审批时间
    spyj: string; // 审批意见
    bz: string; // 录入审批人
    zt: string; // 标记   0为待审核，1为审核通过，4为审核不通过
    powertype: string; // 适用类别  1：所有 2：违法 3：过车
    DWDM: string;
    gxsj: string;
  end;

  TVioClass = record
    SYSTEMID: string;
    jdslb: string; // 决定书类别
    jdsbh: string; // 决定书编号
    wfbh: string; // 违法编号
    ryfl: string; // 人员分类
    jszh: string; // 驾驶证号
    dabh: string; // 档案编号
    fzjg: string; // 发证机关
    zjcx: string; // 准驾车型
    dsr: string; // 当事人
    clfl: string; // 车辆分类
    HPZL: string; // 号牌种类
    HPHM: string; // 号牌号码
    jdcsyr: string; // 机动车所有人
    wfsj: string; // 违法时间
    wfdd: string; // 违法地点
    wfdz: string; // 违法地址
    wfxw: string; // 违法行为
    wfjfs: string; // 违法记分数
    fkje: string; // 罚款金额
    fxjg: string; // 发现机关
    fxjgmc: string; // 发现机关名称
    cljg: string; // 处理机关
    cljgmc: string; // 处理机关名称
    cfzl: string; // 处罚种类
    clsj: string; // 处理时间
    jkbj: string; // 交款标记
    jkrq: string; // 交款日期
    lrr: string; // 录入人
    jbr1: string; // 录入人
    lrsj: string; // 录入时间
    xrms: string; // 写入模式
    ysznj: string; // 应收滞纳金
    xxly: string; // 1-现场处罚，2-非现场处罚
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
    UICaption: string; // 系统名称
    UILOGoPath: string; // logo
    DBSERVER: string; // 后台服务器主机
    DBName: string; // 后能服务器端口
    DCSERName: string; // 导出寄信数据库
    DCSERVER: string; // 导出寄信服务器
    DFSHOST: string;
    VIOWSDL: string; // 六合一WSDL接口
    VIOURL: string; // 六合一URL
    VIOSVC: string;
    VIOPRT: string;
    VIOSN: string;
    DWDM: string; // 单位代码
    DirDelete: string; // 删除文件夹
    DirSave: string; // 保存文件夹
    MapUrl: string;
    FtpHost: string;
    FtpPort: Integer;
    FtpUser: string;
    FtpPwd: string;
    DefSbbh: string;

    // 中间件相关配置
    DiPDbUrl: string;
    DiDbUrl: string;
    DiSlUrl: string;
    DiRmUrl: string;

    // 视频参数
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
    code: string; // 返回代码
    msg: string;
    rownum: string; // 返回记录数
    sfzmmc: string; // 身份证明名称
    sfzmhm: string; // 身份证明号码
    hmcd: string; // 号码长度
    XM: string; // 姓名
    XB: string; // 性别
    csrq: string; // 出生日期
    gj: string; // 国籍
    djzsxzqh: string; // 登记住所行政区划
    djzsxxdz: string; // 登记住所详细地址
    lxzsxzqh: string; // 联系住所行政区划
    LXZSXXDZ: string; // 联系住所详细地址
    lxzsyzbm: string; // 联系住所邮政编码
    lxdh: string; // 联系电话
    SJHM: string; // 手机号码
    dzyx: string; // 电子邮箱
    dabh: string; // 档案编号
    zjcx: string; // 准驾车型
    ljjf: string; // 累积记分
    zt: string; // 状态
    cclzrq: string; // 初次领证日期
    jzqx: string; // 驾证期限
    syrq: string; // 下一体检日期
    yxqs: string; // 有效期始
    yxqz: string; // 有效期止
    xzqh: string; // 行政区划
    zzzm: string; // 暂住证明
    gxsj: string; // 更新时间
    zxbh: string; // 证芯编号
    fzjg: string; // 发证机关
    syyxqz: string; // 审验有效期止
    xczg: string; // 校车资格
    xczjcx: string; // 校车准驾车型
    sxbj: string; // 实习标记
    sxqksbj: string; // 实习期考试标记
    sfzxcx: string; // 是否需注销准驾车型
    zxcxyy: string; // 注销准驾车型的原因
  end;

  Tvioinfosrl = record
    XH: string; // 序号
    CJJG: string; // 采集机关
    cjjgmc: string; // 采集机关名称
    clfl: string; // 车辆分类
    HPZL: string; // 号牌种类
    HPHM: string; // 号牌号码
    jdcsyr: string; // 机动车所有人
    syxz: string; // 使用性质
    fdjh: string; // 发动机号
    clsbdh: string; // 车辆识别代号
    csys: string; // 车身颜色
    clpp: string; // 车辆品牌
    jtfs: string; // 交通方式
    fzjg: string; // 发证机关
    zsxzqh: string; // 住所行政区划
    ZSXXDZ: string; // 住所详细地址
    dh: string; // 电话
    LXFS: string; // 联系方式
    tzsh: string; // 通知书号
    tzbj: string; // 通知标记
    tzrq: string; // 通知日期
    CJFS: string; // 采集方式
    wfsj: string; // 违法时间
    wfdd: string; // 违法地点
    wfdz: string; // 违法地址
    wfxw: string; // 违法行为
    fkje: string; // 罚款金额
    scz: string; // 实测值
    bzz: string; // 标准值
    zqmj: string; // 执勤民警
    cljg: string; // 处理机关
    cljgmc: string; // 处理机关名称
    clsj: string; // 处理时间
    CLBJ: string; // 处理标记
    jkfs: string; // 交款方式
    jkbj: string; // 交款标记
    jkrq: string; // 缴款日期
    pzbh: string; // 强制措施凭证编号
    wfbh: string; // 违法编号
    jdsbh: string; // 决定书号
    wsjyw: string; // 决定书号校验位
    jdslb: string; // 决定书类别
    dsr: string; // 当事人
    jbr: string; // 经办人
    lrr: string; // 录入人
    lrsj: string; // 录入时间
    jllx: string; // 记录类型
    cldxbj: string; // 处理对象标记
    xrms: string; // 写入模式
    jsjg: string; // 接受机关
    fsjg: string; // 发送机关
    gxsj: string; // 更新时间
    jszh: string; //
    zjcx: string; //
    wfjfs: string;
    xxly: string;
    bz: string; // 备注
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
