unit ULookUpDataSource;

interface

uses FireDAC.Comp.Client, Data.DB, UDictionary, system.SysUtils,
  Generics.Collections;

Type
  TLookUpDataSource = Class
  private
    class var FMBdev: TFDMemtable;
    class var FMBCJJG: TFDMemtable;
    class var FMBSblx: TFDMemtable;
    class var FMBwfxw: TFDMemtable;
    class var FMBUser: TFDMemtable;
    class var FMBHPZL: TFDMemtable;
    class var FMBBJLX: TFDMemtable;
    class var FMBBKLX: TFDMemtable;
    class var FMBCSYS: TFDMemtable;

    class var FDSHPZL: TDataSource;
    class var FDSdev: TDataSource;
    class var FDSCJJG: TDataSource;
    class var FDSSblx: TDataSource;
    class var FDSwfxw: TDataSource;
    class var FDSUser: TDataSource;
    class var FDSBJLX: TDataSource;
    class var FDSBKLX: TDataSource;
    class var FDSCSYS: TDataSource;
    class var FDataSource: TDictionary<string, TDataSource>;
    class function GetDSCJJG: TDataSource; static;
    class function GetDSDEV: TDataSource; static;
    class function GetDSHPZL: TDataSource; static;
    class function GetDSSBLX: TDataSource; static;
    class function GetDSUSER: TDataSource; static;
    class function GetDSWFXW: TDataSource; static;
    class function GetDSBJLX: TDataSource; static;
    class function GetDSBKLX: TDataSource; static;
    class function GetDSCSYS: TDataSource; static;
  Public
    class procedure InitDataSource;
    class procedure AddDataSource(key: string; ds: TDataSource);
    class property DSDEV: TDataSource read GetDSDEV;
    class property DSCJJG: TDataSource read GetDSCJJG;
    class property DSSBLX: TDataSource read GetDSSBLX;
    class property DSWFXW: TDataSource read GetDSWFXW;
    class property DSUSER: TDataSource read GetDSUSER;
    class property DSHPZL: TDataSource read GetDSHPZL;
    class property DSBJLX: TDataSource read GetDSBJLX;
    class property DSBKLX: TDataSource read GetDSBKLX;
    class property DSCSYS: TDataSource read GetDSCSYS;
    class property DataSource: TDictionary<string, TDataSource>
      read FDataSource;
  End;

implementation

{ TLookUpDataSource }

class procedure TLookUpDataSource.AddDataSource(key: string; ds: TDataSource);
begin
  if FDataSource = nil then
  begin
    FDataSource := TDictionary<string, TDataSource>.Create;
  end;
  if not FDataSource.ContainsKey(key) then
    FDataSource.Add(key, ds);
end;

class function TLookUpDataSource.GetDSBJLX: TDataSource;
var
  s: string;
begin
  if FDSBJLX = nil then
  begin
    FMBBJLX := TFDMemtable.Create(nil);
    FMBBJLX.FieldDefs.Add('BJLX', ftString, 100, false);
    FMBBJLX.FieldDefs.Add('BJLXMC', ftString, 100, false);
    FMBBJLX.CreateDataSet;
    for s in TLZDictionary.gDicMain['BJLX'].Keys do
    begin
      FMBBJLX.Append;
      FMBBJLX.FieldbyName('BJLX').Value := s;
      FMBBJLX.FieldbyName('BJLXMC').Value := TLZDictionary.gDicMain['BJLX'][s];
      FMBBJLX.Post;
    end;
    FDSBJLX := TDataSource.Create(nil);
    FDSBJLX.DataSet := FMBBJLX;
    AddDataSource('WFZT', FDSBJLX);
  end;
  result := FDSBJLX;
end;

class function TLookUpDataSource.GetDSBKLX: TDataSource;
var
  s: string;
begin
  if FDSBKLX = nil then
  begin
    FMBBKLX := TFDMemtable.Create(nil);
    FMBBKLX.FieldDefs.Add('BKLX', ftString, 100, false);
    FMBBKLX.FieldDefs.Add('BKLXMC', ftString, 100, false);
    FMBBKLX.CreateDataSet;
    for s in TLZDictionary.gDicMain['BKLX'].Keys do
    begin
      FMBBKLX.Append;
      FMBBKLX.FieldbyName('BKLX').Value := s;
      FMBBKLX.FieldbyName('BKLXMC').Value := TLZDictionary.gDicMain['BKLX'][s];
      FMBBKLX.Post;
    end;
    FDSBKLX := TDataSource.Create(nil);
    FDSBKLX.DataSet := FMBBKLX;
    AddDataSource('BKLX', FDSBKLX);
  end;
  result := FDSBKLX;
end;

class function TLookUpDataSource.GetDSCJJG: TDataSource;
var
  s: string;
begin
  if FDSCJJG = nil then
  begin
    FMBCJJG := TFDMemtable.Create(nil);
    FMBCJJG.FieldDefs.Add('DWDM', ftString, 100, false);
    FMBCJJG.FieldDefs.Add('DWMC', ftString, 100, false);
    FMBCJJG.CreateDataSet;
    for s in TLZDictionary.gDicDept.Keys do
    begin
      FMBCJJG.Append;
      FMBCJJG.FieldbyName('DWDM').Value := s;
      FMBCJJG.FieldbyName('DWMC').Value := TLZDictionary.gDicDept[s].DWMC;
      FMBCJJG.Post;
    end;
    FDSCJJG := TDataSource.Create(nil);
    FDSCJJG.DataSet := FMBCJJG;
    AddDataSource('DWDM', FDSCJJG);
    AddDataSource('CJJG', FDSCJJG);
    AddDataSource('CZDW', FDSCJJG);
  end;
  result := FDSCJJG;
end;

class function TLookUpDataSource.GetDSCSYS: TDataSource;
var
  s: string;
begin
  if FDSCSYS = nil then
  begin
    FMBCSYS := TFDMemtable.Create(nil);
    FMBCSYS.FieldDefs.Add('CSYS', ftString, 100, false);
    FMBCSYS.FieldDefs.Add('CSYSMC', ftString, 100, false);
    FMBCSYS.CreateDataSet;
    for s in TLZDictionary.gDicMain['CSYS'].Keys do
    begin
      FMBCSYS.Append;
      FMBCSYS.FieldbyName('CSYS').Value := s;
      FMBCSYS.FieldbyName('CSYSMC').Value := TLZDictionary.gDicMain['CSYS'][s];
      FMBCSYS.Post;
    end;
    FDSCSYS := TDataSource.Create(nil);
    FDSCSYS.DataSet := FMBCSYS;
    AddDataSource('CSYS', FDSCSYS);
  end;
  result := FDSCSYS;
end;

class function TLookUpDataSource.GetDSDEV: TDataSource;
var
  s: string;
begin
  if FDSdev = nil then
  begin
    FMBdev := TFDMemtable.Create(nil);
    FMBdev.FieldDefs.Add('SBBH', ftString, 100, false);
    FMBdev.FieldDefs.Add('SBDDMC', ftString, 100, false);
    FMBdev.CreateDataSet;
    for s in TLZDictionary.gDicDev[2].Keys do
    begin
      FMBdev.Append;
      FMBdev.FieldbyName('SBBH').Value := s;
      FMBdev.FieldbyName('SBDDMC').Value := TLZDictionary.gDicDev[2][s].SBDDMC;
      FMBdev.Post;
    end;
    FDSdev := TDataSource.Create(nil);
    FDSdev.DataSet := FMBdev;
    AddDataSource('SBBH', FDSdev);
    AddDataSource('KDBH', FDSdev);
    AddDataSource('WFDD', FDSdev);
    AddDataSource('ZCCXDD', FDSdev);
  end;
  result := FDSdev;
end;

class function TLookUpDataSource.GetDSHPZL: TDataSource;
var
  s: string;
begin
  if FDSHPZL = nil then
  begin
    FMBHPZL := TFDMemtable.Create(nil);
    FMBHPZL.FieldDefs.Add('HPZL', ftString, 100, false);
    FMBHPZL.FieldDefs.Add('HPZLMC', ftString, 100, false);
    FMBHPZL.CreateDataSet;
    for s in TLZDictionary.gDicMain['HPZL'].Keys do
    begin
      FMBHPZL.Append;
      FMBHPZL.FieldbyName('HPZL').Value := s;
      FMBHPZL.FieldbyName('HPZLMC').Value := TLZDictionary.gDicMain['HPZL'][s];
      FMBHPZL.Post;
    end;
    FDSHPZL := TDataSource.Create(nil);
    FDSHPZL.DataSet := FMBHPZL;
    AddDataSource('HPZL', FDSHPZL);
  end;
  result := FDSHPZL;
end;

class function TLookUpDataSource.GetDSSBLX: TDataSource;
var
  s: string;
begin
  if FDSSblx = nil then
  begin
    FMBSblx := TFDMemtable.Create(nil);
    FMBSblx.FieldDefs.Add('SBLX', ftString, 100, false);
    FMBSblx.FieldDefs.Add('SBLXMC', ftString, 100, false);
    FMBSblx.CreateDataSet;
    for s in TLZDictionary.gDicMain['SBLX'].Keys do
    begin
      FMBSblx.Append;
      FMBSblx.FieldbyName('SBLX').Value := s;
      FMBSblx.FieldbyName('SBLXMC').Value := TLZDictionary.gDicMain['SBLX'][s];
      FMBSblx.Post;
    end;
    FDSSblx := TDataSource.Create(nil);
    FDSSblx.DataSet := FMBSblx;
    AddDataSource('SBLX', FDSSblx);
  end;
  result := FDSSblx;
end;

class function TLookUpDataSource.GetDSUSER: TDataSource;
var
  s: string;
begin
  if FDSUser = nil then
  begin
    FMBUser := TFDMemtable.Create(nil);
    FMBUser.FieldDefs.Add('YHBH', ftString, 100, false);
    FMBUser.FieldDefs.Add('YHXM', ftString, 100, false);
    FMBUser.CreateDataSet;
    for s in TLZDictionary.gDicUser.Keys do
    begin
      FMBUser.Append;
      FMBUser.FieldbyName('YHBH').Value := s;
      FMBUser.FieldbyName('YHXM').Value := TLZDictionary.gDicUser[s].YHXM;
      FMBUser.Post;
    end;
    FDSUser := TDataSource.Create(nil);
    FDSUser.DataSet := FMBUser;
    AddDataSource('YHBH', FDSUser);
  end;
  result := FDSUser;
end;

class function TLookUpDataSource.GetDSWFXW: TDataSource;
var
  s: string;
begin
  if FDSwfxw = nil then
  begin
    FMBwfxw := TFDMemtable.Create(nil);
    FMBwfxw.FieldDefs.Add('WFXWDM', ftString, 100, false);
    FMBwfxw.FieldDefs.Add('WFXWMC', ftString, 100, false);
    FMBwfxw.CreateDataSet;
    for s in TLZDictionary.gDicWfxw.Keys do
    begin
      FMBwfxw.Append;
      FMBwfxw.FieldbyName('WFXWDM').Value := s;
      FMBwfxw.FieldbyName('WFXWMC').Value := TLZDictionary.gDicWfxw[s].WFXWMC;
      FMBwfxw.Post;
    end;
    FDSwfxw := TDataSource.Create(nil);
    FDSwfxw.DataSet := FMBwfxw;
    AddDataSource('WFXW', FDSwfxw);
    // AddDataSource('WFXWDM', FDSwfxw);
  end;
  result := FDSwfxw;
end;

class procedure TLookUpDataSource.InitDataSource;
begin
  GetDSCJJG;
  GetDSDEV;
  GetDSHPZL;
  GetDSSBLX;
  GetDSUSER;
  GetDSWFXW;
  GetDSBJLX;
  GetDSBKLX;
 // GetDSCSYS;
end;

end.
