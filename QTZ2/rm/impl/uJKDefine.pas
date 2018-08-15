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
    NumPerDay: integer;
    Flag: integer;
  end;

var
  JKDic: TDictionary<string, TJK>;
  JKCounterDic: TDictionary<string, integer>;

implementation

end.
