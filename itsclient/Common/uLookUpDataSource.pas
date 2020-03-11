unit ULookUpDataSource;

interface

uses FireDAC.Comp.Client, Data.DB, UDictionary, system.SysUtils,
  Generics.Collections;

Type
  TLookUpDataSource = Class
  private
    class var FDataSource: TDictionary<string, TDataSource>;
    class function GetDSCJJG: TDataSource; static;
    class function GetDSDEV: TDataSource; static;
    class function GetDSUSER: TDataSource; static;
    class function GetDSWFXW: TDataSource; static;
    class function GetDSMain(FLBH: string): TDataSource; static;
  Public
    class procedure InitDataSource;
    class property DataSource: TDictionary<string, TDataSource>
      read FDataSource;
  End;

implementation

{ TLookUpDataSource }

class function TLookUpDataSource.GetDSCJJG: TDataSource;
var
  s: string;
  tb: TFDMemtable;
  ds: TDataSource;
begin
  tb := TFDMemtable.Create(nil);
  tb.FieldDefs.Add('DWDM', ftString, 100, false);
  tb.FieldDefs.Add('DWMC', ftString, 100, false);
  tb.CreateDataSet;
  for s in TLZDictionary.gDicDept.Keys do
  begin
    tb.Append;
    tb.FieldbyName('DWDM').Value := s;
    tb.FieldbyName('DWMC').Value := TLZDictionary.gDicDept[s].DWMC;
    tb.Post;
  end;
  ds := TDataSource.Create(nil);
  ds.DataSet := tb;
  result := ds;
end;

class function TLookUpDataSource.GetDSDEV: TDataSource;
var
  s: string;
  tb: TFDMemtable;
  ds: TDataSource;
begin
  tb := TFDMemtable.Create(nil);
  tb.FieldDefs.Add('SBBH', ftString, 100, false);
  tb.FieldDefs.Add('SBDDMC', ftString, 100, false);
  tb.CreateDataSet;
  for s in TLZDictionary.gDicDev[2].Keys do
  begin
    tb.Append;
    tb.FieldbyName('SBBH').Value := s;
    tb.FieldbyName('SBDDMC').Value := TLZDictionary.gDicDev[2][s].SBDDMC;
    tb.Post;
  end;
  ds := TDataSource.Create(nil);
  ds.DataSet := tb;
  result := ds;
end;

class function TLookUpDataSource.GetDSUSER: TDataSource;
var
  s: string;
  tb: TFDMemtable;
  ds: TDataSource;
begin
  tb := TFDMemtable.Create(nil);
  tb.FieldDefs.Add('YHBH', ftString, 100, false);
  tb.FieldDefs.Add('YHXM', ftString, 100, false);
  tb.CreateDataSet;
  for s in TLZDictionary.gDicUser.Keys do
  begin
    tb.Append;
    tb.FieldbyName('YHBH').Value := s;
    tb.FieldbyName('YHXM').Value := TLZDictionary.gDicUser[s].YHXM;
    tb.Post;
  end;
  ds := TDataSource.Create(nil);
  ds.DataSet := tb;

  result := ds;
end;

class function TLookUpDataSource.GetDSWFXW: TDataSource;
var
  s: string;
  tb: TFDMemtable;
  ds: TDataSource;
begin
  tb := TFDMemtable.Create(nil);
  tb.FieldDefs.Add('WFXWDM', ftString, 100, false);
  tb.FieldDefs.Add('WFXWMC', ftString, 100, false);
  tb.CreateDataSet;
  for s in TLZDictionary.gDicWfxw.Keys do
  begin
    tb.Append;
    tb.FieldbyName('WFXWDM').Value := s;
    tb.FieldbyName('WFXWMC').Value := TLZDictionary.gDicWfxw[s].WFXWMC;
    tb.Post;
  end;
  ds := TDataSource.Create(nil);
  ds.DataSet := tb;
  result := ds;
end;

class function TLookUpDataSource.GetDSMain(FLBH: string): TDataSource;
var
  s: string;
  tb: TFDMemtable;
  ds: TDataSource;
begin
  tb := TFDMemtable.Create(nil);
  tb.FieldDefs.Add(FLBH, ftString, 100, false);
  tb.FieldDefs.Add(FLBH + 'MC', ftString, 100, false);
  tb.CreateDataSet;
  for s in TLZDictionary.gDicMain[FLBH].Keys do
  begin
    tb.Append;
    tb.FieldbyName(FLBH).Value := s;
    tb.FieldbyName(FLBH + 'MC').Value := TLZDictionary.gDicMain[FLBH][s];
    tb.Post;
  end;
  ds := TDataSource.Create(nil);
  ds.DataSet := tb;
  result := ds;
end;

class procedure TLookUpDataSource.InitDataSource;
begin
  FDataSource := TDictionary<string, TDataSource>.Create;
  FDataSource.Add('CJJG', GetDSCJJG);
  FDataSource.Add('DWDM', FDataSource['CJJG']);
  FDataSource.Add('CZDW', FDataSource['CJJG']);

  FDataSource.Add('SBBH', GetDSDEV);
  FDataSource.Add('KDBH', FDataSource['SBBH']);
  FDataSource.Add('WFDD', FDataSource['SBBH']);
  FDataSource.Add('ZCCXDD', FDataSource['SBBH']);

  FDataSource.Add('YHBH', GetDSUSER);
  FDataSource.Add('WFXW', GetDSWFXW);

  FDataSource.Add('HPZL', GetDSMain('HPZL'));
  FDataSource.Add('SBLX', GetDSMain('SBLX'));
  FDataSource.Add('BKLX', GetDSMain('BKLX'));
  FDataSource.Add('JCCLLX', GetDSMain('JCCLLX'));
  FDataSource.Add('WFZT', GetDSMain('BJLX'));
end;

end.
