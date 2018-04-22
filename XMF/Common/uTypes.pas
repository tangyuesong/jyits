unit uTypes;

interface

type
  TDJThreadConfig = record
    BMDM: string;      // 部门代码
    cqlj: string;      // 图片源路径
    cqgz: string;      // 图片命名规则
    tpxz: Integer;     // 图片限制大小
    sclj: string;      // 图片转移路径
    scurl: string;     // 图片URL前缀
    TargetUrlHik: string;     // 图片URL前缀
    szfl: string;     // 线程分类
    KeyName: string;  // 线程名称
    WFXW: string;
  end;

  TPass = record
    CJJG: string;
    GCXH: string;
    KKSOURCE: string;
    kdbh: string;
    FXBH: string;
    cdbh: string;
    HPZL: string;
    gcsj: string;
    WFXW: string;
    clsd: string;
    hpys: string;
    HPHM: string;
    CSYS: string;
    CLPP: string;
    FWQDZ: string;
    tp1: string;
    tp2: string;
    tp3: string;
    function ToString(): string;
  end;

implementation

{ TPass }

function TPass.ToString: string;
begin
  result :=  	CJJG + #9 +
    GCXH + #9 +
    KKSOURCE + #9 +
    kdbh + #9 +
    FXBH + #9 +
    cdbh + #9 +
    HPZL + #9 +
    gcsj + #9 +
    WFXW + #9 +
    clsd + #9 +
    hpys + #9 +
    HPHM + #9 +
    CSYS + #9 +
    CLPP + #9 +
    FWQDZ + #9 +
    tp1 + #9 +
    tp2 + #9 +
    tp3;
end;

end.
