unit uPassRec;

interface

uses
  System.SysUtils, System.Classes, Generics.Collections, Variants;

type
  {$M+}
  TPassRec = class
  private
    FALARM_TYPE: string;
    FYRKSJ: string;
    FALARM_SRC: string;
    FHPHM: string;
    FTZTP: string;
    FCLLX: string;
    FALARM_SRC_ID: string;
    FHPYS: string;
    FFXBH: string;
    FCWHPHM: string;
    FFLAG: integer;
    FGCXH: string;
    FSER08: string;
    FKKSOURCE: string;
    FSER09: string;
    FCWHPYS: string;
    FCSYS: string;
    FGCSJ: Double;
    FCDLX: string;
    FLKBH: string;
    FSER02: string;
    FTP2: string;
    FWFBJ: string;
    FSER03: string;
    FRKSJ: Double;
    FTP3: string;
    FHPZL: string;
    FSER01: string;
    FTP1: string;
    FSER06: string;
    FDRTP2: string;
    FSER07: string;
    FCLSD: integer;
    FCJJG: string;
    FSER04: string;
    FSER05: string;
    FGXSJ: Double;
    FDRTP1: string;
    FXSZT: string;
    FKDBH: string;
    FCLXS: string;
    FFSBZ: string;
    FLDBH: string;
    FCLWX: string;
    FHPYZ: string;
    FFWQDZ: string;
    FCDBH: string;
    FCLPP: string;
    FKey: string;
  public
    constructor FromJson(json: string); overload;
    function ToJson: string;
  published
    property CJJG: string read FCJJG write FCJJG;
    property GCXH: string read FGCXH write FGCXH;
    property KKSOURCE: string read FKKSOURCE write FKKSOURCE;
    property KDBH: string read FKDBH write FKDBH;
    property FXBH: string read FFXBH write FFXBH;
    property CDBH: string read FCDBH write FCDBH;
    property CDLX: string read FCDLX write FCDLX;
    property HPZL: string read FHPZL write FHPZL;
    property GCSJ: Double read FGCSJ write FGCSJ;
    property CLSD: integer read FCLSD write FCLSD;
    property HPYS: string read FHPYS write FHPYS;
    property CLLX: string read FCLLX write FCLLX;
    property HPHM: string read FHPHM write FHPHM;
    property CWHPHM: string read FCWHPHM write FCWHPHM;
    property CWHPYS: string read FCWHPYS write FCWHPYS;
    property HPYZ: string read FHPYZ write FHPYZ;
    property YRKSJ: string read FYRKSJ write FYRKSJ;
    property CSYS: string read FCSYS write FCSYS;
    property CLXS: string read FCLXS write FCLXS;
    property CLPP: string read FCLPP write FCLPP;
    property CLWX: string read FCLWX write FCLWX;
    property XSZT: string read FXSZT write FXSZT;
    property WFBJ: string read FWFBJ write FWFBJ;
    property FWQDZ: string read FFWQDZ write FFWQDZ;
    property TP1: string read FTP1 write FTP1;
    property TP2: string read FTP2 write FTP2;
    property TP3: string read FTP3 write FTP3;
    property TZTP: string read FTZTP write FTZTP;
    property DRTP1: string read FDRTP1 write FDRTP1;
    property DRTP2: string read FDRTP2 write FDRTP2;
    property RKSJ: Double read FRKSJ write FRKSJ;
    property FSBZ: string read FFSBZ write FFSBZ;
    property ALARM_TYPE: string read FALARM_TYPE write FALARM_TYPE;
    property ALARM_SRC: string read FALARM_SRC write FALARM_SRC;
    property ALARM_SRC_ID: string read FALARM_SRC_ID write FALARM_SRC_ID;
    property FLAG: integer read FFLAG write FFLAG;
    property GXSJ: Double read FGXSJ write FGXSJ;
    property LDBH: string read FLDBH write FLDBH;
    property LKBH: string read FLKBH write FLKBH;
    property SER01: string read FSER01 write FSER01;
    property SER02: string read FSER02 write FSER02;
    property SER03: string read FSER03 write FSER03;
    property SER04: string read FSER04 write FSER04;
    property SER05: string read FSER05 write FSER05;
    property SER06: string read FSER06 write FSER06;
    property SER07: string read FSER07 write FSER07;
    property SER08: string read FSER08 write FSER08;
    property SER09: string read FSER09 write FSER09;
    property Key: string read FKey write FKey;
  end;
  {$M-}
implementation

{ TPassRec }

function TPassRec.ToJson: string;
begin
  result := '{"CJJG ": "' + CJJG + '"';
  result := result + ', "GCXH": "' + GCXH + '"';
  result := result + ', "KKSOURCE": "' + KKSOURCE + '"';
  result := result + ', "KDBH": "' + KDBH + '"';
  result := result + ', "FXBH": "' + FXBH + '"';
  result := result + ', "CDBH": "' + CDBH + '"';
  result := result + ', "CDLX": "' + CDLX + '"';
  result := result + ', "HPZL": "' + HPZL + '"';
  result := result + ', "GCSJ": "' + formatdatetime('yyyy-mm-dd hh:mm:ss', GCSJ) + '"';
  result := result + ', "CLSD": "' + CLSD.ToString + '"';
  result := result + ', "HPYS": "' + HPYS + '"';
  result := result + ', "CLLX": "' + CLLX + '"';
  result := result + ', "HPHM": "' + HPHM + '"';
  result := result + ', "CWHPHM": "' + CWHPHM + '"';
  result := result + ', "CWHPYS": "' + CWHPYS + '"';
  result := result + ', "HPYZ": "' + HPYZ + '"';
  result := result + ', "YRKSJ": "' + YRKSJ + '"';
  result := result + ', "CSYS": "' + CSYS + '"';
  result := result + ', "CLXS": "' + CLXS + '"';
  result := result + ', "CLPP": "' + CLPP + '"';
  result := result + ', "CLWX": "' + CLWX + '"';
  result := result + ', "XSZT": "' + XSZT + '"';
  result := result + ', "WFBJ": "' + WFBJ + '"';
  result := result + ', "FWQDZ": "' + FWQDZ + '"';
  result := result + ', "TP1": "' + TP1 + '"';
  result := result + ', "TP2": "' + TP2 + '"';
  result := result + ', "TP3": "' + TP3 + '"';
  result := result + ', "TZTP": "' + TZTP + '"';
  result := result + ', "DRTP1": "' + DRTP1 + '"';
  result := result + ', "DRTP2": "' + DRTP2 + '"';
  result := result + ', "RKSJ": "' + formatdatetime('yyyy-mm-dd hh:mm:ss', RKSJ) + '"';
  result := result + ', "FSBZ": "' + FSBZ + '"';
  result := result + ', "ALARM_TYPE": "' + ALARM_TYPE + '"';
  result := result + ', "ALARM_SRC": "' + ALARM_SRC + '"';
  result := result + ', "ALARM_SRC_ID": "' + ALARM_SRC_ID + '"';
  result := result + ', "FLAG": "' + FLAG.ToString + '"';
  result := result + ', "GXSJ": "' + formatdatetime('yyyy-mm-dd hh:mm:ss', GXSJ) + '"';
  result := result + ', "LDBH": "' + LDBH + '"';
  result := result + ', "LKBH": "' + LKBH + '"';
  result := result + ', "SER01": "' + SER01 + '"';
  result := result + ', "SER02": "' + SER02 + '"';
  result := result + ', "SER03": "' + SER03 + '"';
  result := result + ', "SER04": "' + SER04 + '"';
  result := result + ', "SER05": "' + SER05 + '"';
  result := result + ', "SER06": "' + SER06 + '"';
  result := result + ', "SER07": "' + SER07 + '"';
  result := result + ', "SER08": "' + SER08 + '"';
  result := result + ', "SER09": "' + SER09 + '"}';
end;

constructor TPassRec.FromJson(json: string);
var
  ss: TArray<string>;
  s, tmp: string;
  p: integer;
begin
  inherited Create;
  ss := json.Substring(1, json.Length - 2).Split([',']);
  for s in ss do
  begin
    if pos('"CJJG"', s) > 0 then
    begin
      CJJG := copy(s, pos(':', s) + 2, Length(s));
      CJJG := CJJG.Replace('"', '');
    end
    else if pos('"GCXH"', s) > 0 then
    begin
      GCXH := copy(s, pos(':', s) + 2, Length(s));
      GCXH := GCXH.Replace('"', '');
    end
    else if pos('"KKSOURCE"', s) > 0 then
    begin
      KKSOURCE := copy(s, pos(':', s) + 2, Length(s));
      KKSOURCE := KKSOURCE.Replace('"', '');
    end
    else if pos('"KDBH"', s) > 0 then
    begin
      KDBH := copy(s, pos(':', s) + 2, Length(s));
      KDBH := KDBH.Replace('"', '');
    end
    else if pos('"FXBH"', s) > 0 then
    begin
      FXBH := copy(s, pos(':', s) + 2, Length(s));
      FXBH := FXBH.Replace('"', '');
    end
    else if pos('"CDBH"', s) > 0 then
    begin
      CDBH := copy(s, pos(':', s) + 2, Length(s));
      CDBH := CDBH.Replace('"', '');
    end
    else if pos('"CDLX"', s) > 0 then
    begin
      CDLX := copy(s, pos(':', s) + 2, Length(s));
      CDLX := CDLX.Replace('"', '');
    end
    else if pos('"HPZL"', s) > 0 then
    begin
      HPZL := copy(s, pos(':', s) + 2, Length(s));
      HPZL := HPZL.Replace('"', '');
    end
    else if pos('"GCSJ"', s) > 0 then
    begin
      tmp := copy(s, pos(':', s) + 2, Length(s));
      tmp := tmp.Replace('"', '');
      if tmp.Contains('.') then
        tmp := tmp.Substring(0, tmp.IndexOf('.'));
      if tmp <> '' then
        GCSJ := VarToDateTime(tmp);
    end
    else if pos('"CLSD"', s) > 0 then
    begin
      tmp := copy(s, pos(':', s) + 2, Length(s));
      tmp := tmp.Replace('"', '');
      CLSD := strtointdef(tmp, 0)
    end
    else if pos('"HPYS"', s) > 0 then
    begin
      HPYS := copy(s, pos(':', s) + 2, Length(s));
      HPYS := HPYS.Replace('"', '');
    end
    else if pos('"CLLX"', s) > 0 then
    begin
      CLLX := copy(s, pos(':', s) + 2, Length(s));
      CLLX := CLLX.Replace('"', '');
    end
    else if pos('"HPHM"', s) > 0 then
    begin
      HPHM := copy(s, pos(':', s) + 2, Length(s));
      HPHM := HPHM.Replace('"', '');
    end
    else if pos('"CWHPHM"', s) > 0 then
    begin
      CWHPHM := copy(s, pos(':', s) + 2, Length(s));
      CWHPHM := CWHPHM.Replace('"', '');
    end
    else if pos('"CWHPYS"', s) > 0 then
    begin
      CWHPYS := copy(s, pos(':', s) + 2, Length(s));
      CWHPYS := CWHPYS.Replace('"', '');
    end
    else if pos('"HPYZ"', s) > 0 then
    begin
      HPYZ := copy(s, pos(':', s) + 2, Length(s));
      HPYZ := HPYZ.Replace('"', '');
    end
    else if pos('"YRKSJ"', s) > 0 then
    begin
      YRKSJ := copy(s, pos(':', s) + 2, Length(s));
      YRKSJ := YRKSJ.Replace('"', '');
    end
    else if pos('"CSYS"', s) > 0 then
    begin
      CSYS := copy(s, pos(':', s) + 2, Length(s));
      CSYS := CSYS.Replace('"', '');
    end
    else if pos('"CLXS"', s) > 0 then
    begin
      CLXS := copy(s, pos(':', s) + 2, Length(s));
      CLXS := CLXS.Replace('"', '');
    end
    else if pos('"CLPP"', s) > 0 then
    begin
      CLPP := copy(s, pos(':', s) + 2, Length(s));
      CLPP := CLPP.Replace('"', '');
    end
    else if pos('"CLWX"', s) > 0 then
    begin
      CLWX := copy(s, pos(':', s) + 2, Length(s));
      CLWX := CLWX.Replace('"', '');
    end
    else if pos('"XSZT"', s) > 0 then
    begin
      XSZT := copy(s, pos(':', s) + 2, Length(s));
      XSZT := XSZT.Replace('"', '');
    end
    else if pos('"WFBJ"', s) > 0 then
    begin
      WFBJ := copy(s, pos(':', s) + 2, Length(s));
      WFBJ := WFBJ.Replace('"', '');
    end
    else if pos('"FWQDZ"', s) > 0 then
    begin
      FWQDZ := copy(s, pos(':', s) + 2, Length(s));
      FWQDZ := FWQDZ.Replace('"', '');
    end
    else if pos('"TP1"', s) > 0 then
    begin
      TP1 := copy(s, pos(':', s) + 2, Length(s));
      TP1 := TP1.Replace('"', '');
    end
    else if pos('"TP2"', s) > 0 then
    begin
      TP2 := copy(s, pos(':', s) + 2, Length(s));
      TP2 := TP2.Replace('"', '');
    end
    else if pos('"TP3"', s) > 0 then
    begin
      TP3 := copy(s, pos(':', s) + 2, Length(s));
      TP3 := TP3.Replace('"', '');
    end
    else if pos('"TZTP"', s) > 0 then
    begin
      TZTP := copy(s, pos(':', s) + 2, Length(s));
      TZTP := TZTP.Replace('"', '');
    end
    else if pos('"DRTP1"', s) > 0 then
    begin
      DRTP1 := copy(s, pos(':', s) + 2, Length(s));
      DRTP1 := DRTP1.Replace('"', '');
    end
    else if pos('"DRTP2"', s) > 0 then
    begin
      DRTP2 := copy(s, pos(':', s) + 2, Length(s));
      DRTP2 := DRTP2.Replace('"', '');
    end
    else if pos('"RKSJ"', s) > 0 then
    begin
      tmp := copy(s, pos(':', s) + 2, Length(s));
      tmp := tmp.Replace('"', '');
      if tmp <> '' then
        RKSJ := VarToDateTime(tmp);
    end
    else if pos('"FSBZ"', s) > 0 then
    begin
      FSBZ := copy(s, pos(':', s) + 2, Length(s));
      FSBZ := FSBZ.Replace('"', '');
    end
    else if pos('"ALARM_TYPE"', s) > 0 then
    begin
      ALARM_TYPE := copy(s, pos(':', s) + 2, Length(s));
      ALARM_TYPE := ALARM_TYPE.Replace('"', '');
    end
    else if pos('"ALARM_SRC"', s) > 0 then
    begin
      ALARM_SRC := copy(s, pos(':', s) + 2, Length(s));
      ALARM_SRC := ALARM_SRC.Replace('"', '');
    end
    else if pos('"ALARM_SRC_ID"', s) > 0 then
    begin
      ALARM_SRC_ID := copy(s, pos(':', s) + 2, Length(s));
      ALARM_SRC_ID := ALARM_SRC_ID.Replace('"', '');
    end
    else if pos('"FLAG"', s) > 0 then
    begin
      tmp := copy(s, pos(':', s) + 2, Length(s));
      tmp := tmp.Replace('"', '');
      FLAG := strtointdef(tmp, 0)
    end
    else if pos('"GXSJ"', s) > 0 then
    begin
      tmp := copy(s, pos(':', s) + 2, Length(s));
      tmp := tmp.Replace('"', '');
      if tmp <> '' then
        GXSJ := VarToDateTime(tmp)
    end
    else if pos('"LDBH"', s) > 0 then
    begin
      LDBH := copy(s, pos(':', s) + 2, Length(s));
      LDBH := LDBH.Replace('"', '');
    end
    else if pos('"LKBH"', s) > 0 then
    begin
      LKBH := copy(s, pos(':', s) + 2, Length(s));
      LKBH := LKBH.Replace('"', '');
    end
    else if pos('"SER01"', s) > 0 then
    begin
      SER01 := copy(s, pos(':', s) + 2, Length(s));
      SER01 := SER01.Replace('"', '');
    end
    else if pos('"SER02"', s) > 0 then
    begin
      SER02 := copy(s, pos(':', s) + 2, Length(s));
      SER02 := SER02.Replace('"', '');
    end
    else if pos('"SER03"', s) > 0 then
    begin
      SER03 := copy(s, pos(':', s) + 2, Length(s));
      SER03 := SER03.Replace('"', '');
    end
    else if pos('"SER04"', s) > 0 then
    begin
      SER04 := copy(s, pos(':', s) + 2, Length(s));
      SER04 := SER04.Replace('"', '');
    end
    else if pos('"SER05"', s) > 0 then
    begin
      SER05 := copy(s, pos(':', s) + 2, Length(s));
      SER05 := SER05.Replace('"', '');
    end
    else if pos('"SER06"', s) > 0 then
    begin
      SER06 := copy(s, pos(':', s) + 2, Length(s));
      SER06 := SER06.Replace('"', '');
    end
    else if pos('"SER07"', s) > 0 then
    begin
      SER07 := copy(s, pos(':', s) + 2, Length(s));
      SER07 := SER07.Replace('"', '');
    end
    else if pos('"SER08"', s) > 0 then
    begin
      SER08 := copy(s, pos(':', s) + 2, Length(s));
      SER08 := SER08.Replace('"', '');
    end
    else if pos('"SER09"', s) > 0 then
    begin
      SER09 := copy(s, pos(':', s) + 2, Length(s));
      SER09 := SER09.Replace('"', '');
    end;
  end;
end;
end.
