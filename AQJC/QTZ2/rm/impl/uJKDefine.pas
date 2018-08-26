unit uJKDefine;

interface

uses
  Generics.Collections;

type
  TJK = record
    JKID: string;
    XLH: string;
    WSDL: string;
    JDID: string;
    CJSQBH: string;    // ≥°æ∞…Í«Î±‡∫≈
  end;

var
  JKDic: TDictionary<string, TJK>;

implementation

end.
