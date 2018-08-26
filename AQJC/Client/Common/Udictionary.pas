unit Udictionary;

interface

uses
  System.Generics.Collections, uGlobal, FireDAC.Comp.Client, System.SysUtils,
  uJsonUtils, cxDropDownEdit, cxComboboxExt, System.Classes, uRequestItf,
  usetup, StrUtils,
  uEntity;

type
  Tdic = record
    dm: string;
    mc: string;
  end;

type
  TLZDictionary = class
  private
    class var Fdicmain: TDictionary<string, TDictionary<string, string>>;
    class var setMain: TDictionary<string, TDictionary<string, string>>;
    class var FDicHBC: TDictionary<string, THBC>;
    class var FDicDept: TDictionary<string, TDept>;
    class var FDicWfxw: TDictionary<string, Twfxw>;
    class var FDicDev: TDictionary<integer, TDictionary<string, TDevice>>;
    class var FDicMail: TDictionary<string, TDictionary<string, string>>;
    class var FDicUser: TDictionary<string, TUser>;
    class var FK08Clpp: TDictionary<string, string>;
    class var FK08Csys: TDictionary<string, string>;
    class var FK08Hpzl: TDictionary<string, TK08Dic>;
    class function getcombobox(dic: TDictionary<string, string>;
      IsShowKey: Boolean = False): Tstrings;
    class procedure LoadDicMain();
    class procedure LoadDicWfxw();
    class procedure LoadDicDevice();
    class procedure LoadDicHBC();
    class procedure LoadDicDept();
    class procedure LoadDicUser();
    // class procedure LoadDicmail();
    class procedure LoadK08Clpp();
    class procedure LoadK08Csys();
    class procedure LoadK08Hpzl();
  public
    class procedure InitSetupDic;
    class procedure BindCombobox(combobox: TcxCombobox;
      dic: TDictionary<string, string>; IsShowKey: Boolean = False);
    class procedure BindComboboxWFXW(combobox: TcxCombobox;
      IsShowKey: Boolean = False);
    class procedure BindComboboxDEV(combobox: TcxComboboxExt;
      IsShowKey: Boolean = False; sblx: string = '12'; cjjg: string = '');
    class procedure BindComboboxDEVEx(combobox: TcxCombobox;
      IsShowKey: Boolean = False; cjjg: string = '');
    class procedure BindComboboxDEPT(combobox: TcxCombobox;
      IsShowKey: Boolean = False);
    // class function getmail(jc, dz: string): string;
    class function getCSYS(csysdm: string): string;
    class function StrtoDicInfo(dic: string): Tdic;
    class function getkey(Dtyfn, flbh, value: string): string;
    class function DM2MC(flbh, dm: string): string;
    class property gDicMain: TDictionary < string, TDictionary < string,
      string >> read Fdicmain;
    class property gDicWfxw: TDictionary<string, Twfxw> read FDicWfxw;
    class property gDicDev: TDictionary < integer, TDictionary < string,
      TDevice >> read FDicDev;
    class property gDicHBC: TDictionary<string, THBC> read FDicHBC;
    class property gDicDept: TDictionary<string, TDept> read FDicDept;
    class property gDicUser: TDictionary<string, TUser> read FDicUser;
    // class property gDicMail: TDictionary < string, TDictionary < string,
    // string >> read FDicMail;
    class property gK08Clpp: TDictionary<string, string> read FK08Clpp;
    class property gK08Csys: TDictionary<string, string> read FK08Csys;
    class property gK08Hpzl: TDictionary<string, TK08Dic> read FK08Hpzl;
  end;

  // dictocommbbox:stringlist;
implementation

uses
  uCommon;

class function TLZDictionary.getkey(Dtyfn, flbh, value: string): string;
var
  key: string;
  dic: TDictionary<string, string>;
begin
  Result := '';
  if UpperCase(Dtyfn) = 'MAIN' then
  begin
    dic := gDicMain[flbh];
    for key in dic.Keys do
    begin
      if dic[key] = value then
      begin
        Result := key;
        Break;
      end;
    end;
  end
  else if UpperCase(Dtyfn) = 'WFXW' then
  begin
    for key in gDicWfxw.Keys do
    begin
      if gDicWfxw[key].WFXWMC = value then
      begin
        Result := key;
        Break;
      end;
    end;
  end
  else if UpperCase(Dtyfn) = 'DEV' then
  begin
    for key in gDicDev[2].Keys do
    begin
      if gDicDev[2][key].SBDDMC = value then
      begin
        Result := key;
        Break;
      end;
    end;
  end
  else if UpperCase(Dtyfn) = 'DEPT' then
  begin
    for key in gDicDept.Keys do
    begin
      if gDicDept[key].DWMC = value then
      begin
        Result := key;
        Break;
      end;
    end;
  end;
end;

{
  class function TLZDictionary.getmail(jc, dz: string): string;
  var
  yzbm: string;
  s: string;
  dicmailkey: TDictionary<string, string>;
  begin
  Result := '';
  dicmailkey := gDicMail[jc];
  for s in dicmailkey.Keys do
  begin
  if Pos(s, dz) > 0 then
  begin
  if yzbm < gDicMail[jc][s] then
  yzbm := gDicMail[jc][s];
  end;
  end;
  Result := yzbm;
  end;
}
class procedure TLZDictionary.InitSetupDic;
begin
  LoadDicMain();
  // LoadDicWfxw();
  LoadDicDept();
  LoadDicDevice();
  // LoadDicHBC();
  LoadDicUser();
  // LoadDicmail();
  // LoadK08Clpp();
  // LoadK08Csys();
  // LoadK08Hpzl();
end;

class function TLZDictionary.StrtoDicInfo(dic: string): Tdic;
var
  arr: TArray<string>;
begin
  if dic.contains(':') then
  begin
    arr := dic.Split([':']);
    Result.dm := arr[0];
    Result.mc := arr[1];
  end
  else
  begin
    Result.dm := dic;
    Result.mc := dic;
  end;
end;

class procedure TLZDictionary.LoadDicMain();
var
  key: string;
  dm: string;
  mc: string;
  s: string;
  tb: TFDMemTable;
begin
  Fdicmain := TDictionary < string, TDictionary < string, string >>.Create();
  s := TRequestItf.DbQuery('GetD_main', 'bj=1');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(s, tb, '');
    while not tb.Eof do
    begin
      key := UpperCase(Trim(tb.FieldByName('flbh').AsString));

      dm := UpperCase(tb.FieldByName('dm').AsString);
      mc := UpperCase(tb.FieldByName('mc').AsString);
      if not Fdicmain.ContainsKey(key) then
        Fdicmain.Add(key, TDictionary<string, string>.Create);
      if not Fdicmain[key].ContainsKey(dm) then
        Fdicmain[key].Add(dm, mc);
      tb.Next;
    end;
    tb.Free;
  end;
end;

class procedure TLZDictionary.LoadK08Clpp;
var
  s, key, mc: string;
  tb: TFDMemTable;
begin
  FK08Clpp := TDictionary<string, string>.Create;
  s := TRequestItf.DbQuery('GetD_K08_CLPP');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(s, tb, '');
    while not tb.Eof do
    begin
      key := tb.FieldByName('vehiclelogo').AsString + '-' +
        tb.FieldByName('Vehiclesublogo').AsString;
      mc := tb.FieldByName('MC').AsString;
      if not FK08Clpp.ContainsKey(key) then
        FK08Clpp.Add(key, mc);
      tb.Next;
    end;
    tb.Free;
  end;
end;

class procedure TLZDictionary.LoadK08Hpzl;
var
  s: string;
  k08Dic: TK08Dic;
  tb: TFDMemTable;
begin
  FK08Hpzl := TDictionary<string, TK08Dic>.Create;
  s := TRequestItf.DbQuery('GetD_K08', 'FLBH=HPZL');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(s, tb, '');
    while not tb.Eof do
    begin
      if not FK08Hpzl.ContainsKey(tb.FieldByName('DM').AsString) then
      begin
        k08Dic.SYSTEMID := tb.FieldByName('SYSTEMID').AsString;
        k08Dic.flbh := tb.FieldByName('FLBH').AsString;
        k08Dic.dm := tb.FieldByName('DM').AsString;
        k08Dic.mc := tb.FieldByName('MC').AsString;
        k08Dic.MineKey := tb.FieldByName('MineKey').AsString;
        FK08Hpzl.Add(tb.FieldByName('DM').AsString, k08Dic);
      end;
      tb.Next;
    end;
    tb.Free;
  end;
end;

class procedure TLZDictionary.LoadK08Csys;
var
  s: string;
  tb: TFDMemTable;
begin
  FK08Csys := TDictionary<string, string>.Create;
  s := TRequestItf.DbQuery('GetD_K08', 'FLBH=CSYS');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(s, tb, '');
    while not tb.Eof do
    begin
      if not FK08Csys.ContainsKey(tb.FieldByName('DM').AsString) then
        FK08Csys.Add(tb.FieldByName('DM').AsString,
          tb.FieldByName('MC').AsString);
      tb.Next;
    end;
    tb.Free;
  end;
end;

class procedure TLZDictionary.LoadDicWfxw;
var
  wfxw: Twfxw;
  s: string;
  tb: TFDMemTable;
begin
  FDicWfxw := TDictionary<string, Twfxw>.Create();
  s := TRequestItf.DbQuery('GetT_VIO_ILLECODE', 'TYBJ=0&GLBM=000000000000');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(s, tb, '');
    while not tb.Eof do
    begin
      wfxw.WFXWDM := tb.FieldByName('wfxwdm').AsString;
      wfxw.WFXWMC := tb.FieldByName('wfxwmc').AsString;
      wfxw.FG := tb.FieldByName('fg').AsString;
      wfxw.TLJC := tb.FieldByName('tljc').AsString;
      wfxw.JE := tb.FieldByName('je').AsString;
      wfxw.JF := tb.FieldByName('jf').AsString;
      wfxw.XH := tb.FieldByName('xh').AsString;
      wfxw.GLBM := tb.FieldByName('glbm').AsString;
      if not FDicWfxw.ContainsKey(wfxw.WFXWDM) then
        FDicWfxw.Add(wfxw.WFXWDM, wfxw);
      tb.Next;
    end;
    tb.Free;
  end;
end;

class procedure TLZDictionary.LoadDicDevice;
var
  dev: TDevice;
  s: string;
  tb: TFDMemTable;
  i: integer;
begin
  FDicDev := TDictionary < integer, TDictionary < string, TDevice >>.Create();
  gDicDev.Add(1, TDictionary<string, TDevice>.Create());
  gDicDev.Add(2, TDictionary<string, TDevice>.Create());
  for i := 1 to 2 do
  begin
    if i = 1 then
    begin
      if gIsSa then
        s := TRequestItf.DbQuery('GetS_Device', 'QYZT=1')
      else
        s := TRequestItf.DbQuery('GetDeviceList', 'yhbh=' + gUser.yhbh);
    end
    else
      s := TRequestItf.DbQuery('GetS_DEVICE', 'QYZT=1');

    if s <> '' then
    begin
      tb := TFDMemTable.Create(nil);
      with tb do
      begin
        TJsonUtils.JSONToDataSet(s, tb, '');
        while not tb.Eof do
        begin
          dev.SYSTEMID := FieldByName('SYSTEMID').AsString;
          dev.SBBH := FieldByName('SBBH').AsString;
          dev.JCPTBABH := FieldByName('JCPTBABH').AsString;
          dev.JCPTBAFX := FieldByName('JCPTBAFX').AsString;
          dev.LKBH := FieldByName('LKBH').AsString;
          dev.LKMC := FieldByName('LKMC').AsString;
          dev.FXBH := FieldByName('FXBH').AsString;
          dev.FXMC := FieldByName('FXMC').AsString;
          dev.cjjg := FieldByName('CJJG').AsString;
          dev.SBDDMC := FieldByName('SBDDMC').AsString;
          dev.SBJD := FieldByName('SBJD').AsString;
          dev.SBWD := FieldByName('SBWD').AsString;
          dev.SBIP := FieldByName('SBIP').AsString;
          dev.SBCJ := FieldByName('SBCJ').AsString;
          dev.CSLXR := FieldByName('CSLXR').AsString;
          dev.LXFS := FieldByName('LXFS').AsString;
          dev.QYSJ := FieldByName('QYSJ').AsString;
          dev.JDJG := FieldByName('JDJG').AsString;
          dev.JDBH := FieldByName('JDBH').AsString;
          dev.JDYXQ := FieldByName('JDYXQ').AsString;
          dev.QYRQ := FieldByName('QYRQ').AsString;
          if FieldByName('XZSD').AsString <> '' then
            dev.XZSD := FieldByName('XZSD').AsInteger;
          if FieldByName('DCXZSD').AsString <> '' then
            dev.DCXZSD := FieldByName('DCXZSD').AsInteger;
          dev.QSSBBH := FieldByName('QSSBBH').AsString;
          dev.sblx := FieldByName('SBLX').AsString;
          dev.LDBH := FieldByName('LDBH').AsString;
          dev.LHY_XZQH := FieldByName('LHY_XZQH').AsString;
          dev.LHY_WFDD := FieldByName('LHY_WFDD').AsString;
          dev.LHY_SBBH := FieldByName('LHY_SBBH').AsString;
          dev.LHY_LDDM := FieldByName('LHY_LDDM').AsString;
          dev.LHY_DDMS := FieldByName('LHY_DDMS').AsString;
          dev.LHY_CJFS := FieldByName('LHY_CJFS').AsString;
          dev.LHY_JPGH := FieldByName('LHY_JPGH').AsString;
          dev.LHY_JPGW := FieldByName('LHY_JPGW').AsString;
          dev.LHY_JPGQ := FieldByName('LHY_JPGQ').AsString;
          dev.QYZT := FieldByName('QYZT').AsBoolean;
          dev.ZJZT := FieldByName('ZJZT').AsBoolean;
          dev.SCJCPT := FieldByName('SCJCPT').AsBoolean;
          dev.TPGS := FieldByName('TPGS').AsString;
          dev.wfxw := FieldByName('WFXW').AsString;
          dev.BZ := FieldByName('BZ').AsString;
          dev.GXSJ := FieldByName('GXSJ').AsString;
          dev.TPXZ := FieldByName('TPXZ').AsBoolean;
          dev.XSZB := FieldByName('XYSB').AsBoolean;
          dev.AQDSB := FieldByName('AQDSB').AsBoolean;
          dev.HBCZB := FieldByName('HBCZB').AsInteger;
          dev.XXZB := FieldByName('XXZB').AsBoolean;
          dev.DCXXZB := FieldByName('DCXXZB').AsBoolean;
          dev.YSXZB := FieldByName('YSXZB').AsBoolean;
          dev.CZDW := FieldByName('CZDW').AsString;
          dev.AddSY := FieldByName('AddSY').AsBoolean;
          dev.HikID := FieldByName('HikID').AsString;
          // 设备只到大队，CJJG为支队取全市设备。其他的取他所在的大队
          { if ((gDicDept[gUser.DWDM].DWJB = '3') and
            (copy(dev.CJJG, 1, 4) = copy(gUser.DWDM, 1, 4))) or
            ((StrToIntDef(gDicDept[gUser.DWDM].DWJB, 0) > 3) and
            (copy(dev.CJJG, 1, 6) = copy(gUser.DWDM, 1, 6))) then }
          if not FDicDev[i].ContainsKey(dev.SBBH) then
            FDicDev[i].Add(dev.SBBH, dev);
          Next;
        end;
        Free;
      end;
    end;
  end;
end;

class procedure TLZDictionary.LoadDicHBC;
var
  s: string;
  hbc: THBC;
  tb: TFDMemTable;
begin
  FDicHBC := TDictionary<string, THBC>.Create();
  s := TRequestItf.DbQuery('GetHBCList');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    with tb do
    begin
      TJsonUtils.JSONToDataSet(s, tb, '');
      while not Eof do
      begin
        hbc.hphm := FieldByName('hphm').AsString;
        hbc.hpzl := FieldByName('hpzl').AsString;
        {
          hbc.FDJH := FieldByName('FDJH').AsString;
          hbc.CCDJRQ := FieldByName('CCDJRQ').AsString;
          hbc.SJHM := FieldByName('SJHM').AsString;
          hbc.CLPP := FieldByName('CLPP').AsString;
          hbc.JDCSYR := FieldByName('JDCSYR').AsString;
          hbc.ZSXXDZ := FieldByName('ZSXXDZ').AsString;
          hbc.CLSBDH := FieldByName('CLSBDH').AsString;
          hbc.YXQX := FieldByName('YXQX').AsString;
          hbc.BFQX := FieldByName('BFQX').AsString;
          hbc.CLXH := FieldByName('CLXH').AsString;
          hbc.HBDBQK := FieldByName('HBDBQK').AsString;
          hbc.BZ := FieldByName('BZ').AsString;
          hbc.bj := FieldByName('bj').AsString;
          hbc.GXSJ := FieldByName('gxsj').AsString;
        }
        if not FDicHBC.ContainsKey(hbc.hphm + hbc.hpzl) then
          FDicHBC.Add(hbc.hphm + hbc.hpzl, hbc);
        Next;
      end;
      Free;
    end;
  end;
end;

{
  class procedure TLZDictionary.LoadDicmail;
  var
  key: string;
  sf: string;
  CSMC: string;
  yzbm: string;
  s: string;
  tb: TFDMemTable;
  begin
  FDicMail := TDictionary < string, TDictionary < string, string >>.Create();
  s := TRequestItf.DbQuery('GetS_MAIL', '');
  if s <> '' then
  begin
  tb := TFDMemTable.Create(nil);
  TJsonUtils.JSONToDataSet(s, tb, '');
  while not tb.Eof do
  begin
  key := UpperCase(Trim(tb.FieldByName('jc').AsString));
  CSMC := UpperCase(tb.FieldByName('CSMC').AsString);
  yzbm := UpperCase(tb.FieldByName('YZBM').AsString);
  if not FDicMail.ContainsKey(key) then
  FDicMail.Add(key, TDictionary<string, string>.Create);
  if not FDicMail[key].ContainsKey(CSMC) then
  FDicMail[key].Add(CSMC, yzbm);
  tb.Next;
  end;
  tb.Free;
  end;
  end;
}
class procedure TLZDictionary.BindCombobox(combobox: TcxCombobox;
  dic: TDictionary<string, string>; IsShowKey: Boolean);
var
  ss: Tstrings;
begin
  ss := TLZDictionary.getcombobox(dic, IsShowKey);
  combobox.Properties.Items.Clear;
  combobox.Properties.Items.AddStrings(ss);
  ss.Free;
end;

class function TLZDictionary.getcombobox(dic: TDictionary<string, string>;
  IsShowKey: Boolean = False): Tstrings;
var
  s, v: string;
  str: TStringList;
begin
  str := TStringList.Create;
  if dic = nil then
    exit;
  str.Sort;
  str.Sorted := True;
  for s in dic.Keys do
  begin
    v := '';
    if IsShowKey then
      v := s + ':';
    v := v + dic[s];
    str.Add(v);
  end;
  Result := str;
end;

class procedure TLZDictionary.BindComboboxDEPT(combobox: TcxCombobox;
  IsShowKey: Boolean);
var
  s, v: string;
  str: TStringList;
begin
  str := TStringList.Create;
  str.Clear;
  str.Sort;
  str.Sorted := True;
  combobox.Properties.Items.Clear;
  for s in gDicDept.Keys do
  begin
    v := '';
    if IsShowKey then
      v := s + ':';
    v := v + gDicDept[s].DWMC;
    str.Add(v)
  end;
  combobox.Properties.Items.AddStrings(str);
  str.Free;
end;

class procedure TLZDictionary.BindComboboxDEV(combobox: TcxComboboxExt;
  IsShowKey: Boolean; sblx, cjjg: string);
var
  SBBH: string;
  str: TStringList;
begin
  str := TStringList.Create;
  str.Sort;
  str.Sorted := True;
  combobox.Properties.Items.Clear;
  for SBBH in gDicDev[1].Keys do
  begin
    if sblx.contains(gDicDev[1][SBBH].sblx) then
    begin
      if (cjjg = '') or (gDicDev[1][SBBH].cjjg.contains(cjjg)) then
      begin
        if IsShowKey then
          str.Add(SBBH + ':' + gDicDev[1][SBBH].SBDDMC)
        else
          str.Add(gDicDev[1][SBBH].SBDDMC);
      end;
    end;
  end;
  combobox.AddItems(str);
  str.Free;
end;

class procedure TLZDictionary.BindComboboxDEVEx(combobox: TcxCombobox;
  IsShowKey: Boolean; cjjg: string);
var
  SBBH: string;
  str: TStringList;
begin
  str := TStringList.Create;
  str.Sort;
  str.Sorted := True;
  combobox.Properties.Items.Clear;
  for SBBH in gDicDev[1].Keys do
  begin
    if (gDicDev[1][SBBH].sblx = '1') or (gDicDev[1][SBBH].sblx = '2') then
    begin
      if (cjjg = '') or (gDicDev[1][SBBH].cjjg.contains(cjjg)) then
      begin
        if IsShowKey then
          str.Add(SBBH + ':' + gDicDev[1][SBBH].SBDDMC)
        else
          str.Add(gDicDev[1][SBBH].SBDDMC);
      end;
    end;
  end;
  combobox.Properties.Items.AddStrings(str);
  str.Free;
end;

class procedure TLZDictionary.BindComboboxWFXW(combobox: TcxCombobox;
  IsShowKey: Boolean);
var
  s, v: string;
  str: TStringList;
begin
  str := TStringList.Create;
  str.Clear;
  str.Sort;
  str.Sorted := True;
  combobox.Properties.Items.Clear;
  for s in gDicWfxw.Keys do
  begin
    v := '';
    if IsShowKey then
      v := s + ':';
    v := v + gDicWfxw[s].WFXWMC;
    str.Add(v)
  end;
  combobox.Properties.Items.AddStrings(str);
  str.Free;
end;

class function TLZDictionary.getCSYS(csysdm: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(csysdm) do
  begin
    if gDicMain['CSYS'].ContainsKey(csysdm[i]) then
      Result := Result + gDicMain['CSYS'][csysdm[i]];
  end;
end;

class procedure TLZDictionary.LoadDicDept;
var
  dept: TDept;
  s: string;
  tb: TFDMemTable;
begin
  FDicDept := TDictionary<string, TDept>.Create();
  s := TRequestItf.DbQuery('GetS_DEPT', 'DWDM=' + LeftStr(gUser.DWDM, 4)
    + '&bj=1');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    with tb do
    begin
      TJsonUtils.JSONToDataSet(s, tb, '');
      while not Eof do
      begin
        dept.PDWDM := FieldByName('PDWDM').AsString;
        dept.DWJB := FieldByName('DWJB').AsString;
        dept.DWDM := FieldByName('DWDM').AsString;
        dept.DWMC := FieldByName('DWMC').AsString;
        dept.DWFZR := FieldByName('DWFZR').AsString;
        dept.DWLXR := FieldByName('DWLXR').AsString;
        dept.LXDH := FieldByName('LXDH').AsString;
        dept.SJHM := FieldByName('SJHM').AsString;
        dept.DWDZ := FieldByName('DWDZ').AsString;
        dept.JSCFDD := FieldByName('JSCFYHMC').AsString;
        dept.YHMC := FieldByName('YHMC').AsString;
        dept.FYJG1 := FieldByName('FYJG1').AsString;
        dept.FYJG2 := FieldByName('FYJG2').AsString;
        dept.SCMS := FieldByName('SCMS').AsString;
        dept.GXQY := FieldByName('GXQY').AsString;
        dept.XZQY := FieldByName('XZQY').AsString;
        dept.lng := FieldByName('lng').AsString;
        dept.lat := FieldByName('lat').AsString;
        dept.IsJX := FieldByName('IsJX').AsBoolean;
        if not FDicDept.ContainsKey(dept.DWDM) then
          FDicDept.Add(dept.DWDM, dept);
        Next;
      end;
      Free;
    end;
  end;
end;

class procedure TLZDictionary.LoadDicUser;
var
  user: TUser;
  s: string;
  tb: TFDMemTable;
begin
  FDicUser := TDictionary<string, TUser>.Create();
  s := TRequestItf.DbQuery('GetS_User', '');
  if s <> '' then
  begin
    tb := TFDMemTable.Create(nil);
    with tb do
    begin
      TJsonUtils.JSONToDataSet(s, tb, '');
      while not Eof do
      begin
        user.SYSTEMID := FieldByName('SYSTEMID').AsString;
        user.DWDM := FieldByName('DWDM').AsString;
        user.yhbh := FieldByName('YHBH').AsString;
        user.ZW := FieldByName('ZW').AsString;
        user.YHXM := FieldByName('YHXM').AsString;
        user.XL := FieldByName('XL').AsString;
        user.SJHM := FieldByName('SJHM').AsString;
        user.SFZHM := FieldByName('SFZHM').AsString;
        user.MM := FieldByName('MM').AsString;
        user.IPKS := FieldByName('IPKS').AsString;
        user.IPJS := FieldByName('IPJS').AsString;
        user.MAC := FieldByName('MAC').AsString;
        user.FH := FieldByName('FH').AsString;
        user.ZT := FieldByName('ZT').AsString;
        user.BZ := FieldByName('BZ').AsString;
        user.GXSJ := FieldByName('GXSJ').AsString;
        if not FDicUser.ContainsKey(key) then
          FDicUser.Add(user.yhbh, user);
        Next;
      end;
      Free;
    end;
  end;
end;

class function TLZDictionary.DM2MC(flbh, dm: string): string;
var
  key: string;
begin
  Result := '';
  if not gDicMain.ContainsKey(flbh) then
    exit;
  for key in gDicMain[flbh].Keys do
  begin
    if dm.contains(key) then
      Result := Result + gDicMain[flbh][key] + ' ';
  end;
end;

end.
