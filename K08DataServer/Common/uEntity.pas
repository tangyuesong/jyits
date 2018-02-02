unit uEntity;

interface

type

  TDBConfig = Record
    DBServer: String;
    DBPort: Integer;
    DBUser: String;
    DBPwd: String;
    DBName: String;
  end;

  TDevice = class
    SBBH: string;
    BABH: string;
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
    JDYXQ: TDateTime;
    QYRQ: TDateTime;
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
    LHY_JPGH: Integer;
    LHY_JPGW: Integer;
    LHY_JPGQ: string;
    QYZT: Boolean;
    ZJZT: Boolean;
    SCJCPT: Boolean;
    TPGS: string;
    WFXW: string;
    BZ: string;
    GXSJ: TDateTime;
    tpxz: Boolean;
    XYSB: Boolean;
    AQDSB: Boolean;
    HBCZB: Boolean;
    XXZB: Boolean;
    DCXXZB: Boolean;
    YSXZB: Boolean;
    XSZB: Boolean;
    Changed: Boolean;
    ID: string;
  end;

  THikConfig = Record
    K08SearchURL: String;
    K08SaveUrl: String;
    DFUrl: String;
    DFUser: String;
    DFPwd: String;
  End;

  TPass = record
    GCXH: string;
    KDBH: string;
    CDBH: string;
    GCSJ: TDateTime;
    FWQDZ: string;
    TP1: string;
  end;

implementation

end.
