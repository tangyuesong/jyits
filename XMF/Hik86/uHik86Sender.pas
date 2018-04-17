unit uHik86Sender;

interface

uses
  SysUtils, Classes, System.Generics.Collections, SyncObjs, uGlobal, uTypes, Variants,
  DateUtils, IdHttp, IOUtils, uHik86, Types, Soap.EncdDecd;

type
  THik86Sender = class
  private
    class function SendPassEx(pass: TPass): boolean; static;
  public
    class function SendPass(pass: TPass; jpgPath: string): boolean;
  end;

var
  Hik86Sender: THik86Sender;

implementation

class function THik86Sender.SendPass(pass: TPass; jpgPath: string): boolean;
  function GetTPSL: integer;
  begin
    if pass.tp3 <> '' then
      exit(3);
    if pass.tp2 <> '' then
      exit(2);
    exit(1);
  end;
var
  data: string;
  srv: ServicePortType;
  response: string;
  kkmy: string;
  tpsl: integer;
  picData1, picData2, picData3: TByteDynArray;
begin
  if Hik86Url = '' then exit(false);
  if not HikKKMYDic.ContainsKey(pass.kdbh) then
  begin
    logger.Warn('[Hik86]没有密钥:' + pass.kdbh);
    exit(false);
  end;
  tpsl := GetTPSL;
  picData1 := TByteDynArray(TFile.ReadAllBytes(jpgPath + pass.tp1));
  if pass.tp2 <> '' then
    picData2 := TByteDynArray(TFile.ReadAllBytes(jpgPath + pass.tp2))
  else
    picData2 := nil;
  if pass.tp3 <> '' then
    picData3 := TByteDynArray(TFile.ReadAllBytes(jpgPath + pass.tp3))
  else
    picData3 := nil;

  if pass.hpys='9' then
    pass.hpys := '4';
  if pass.HPZL = '44' then
    pass.HPZL := '99';
  if pass.cdbh = '-1' then
    pass.cdbh := '1';
  data :=
    '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
    + '<ROOT>'
    + '<KKMY>' + HikKKMYDic[pass.kdbh] + '</KKMY>'
    + '<KKBH>' + pass.kdbh + '</KKBH>'
    + '<JGSK>' + pass.gcsj.Replace('/','').Replace('-','').Replace(':','').Replace(' ','') + '</JGSK>'
    + '<CDBH>' + pass.cdbh + '</CDBH>'
    + '<HPHM>' + pass.HPHM + '</HPHM>'
    + '<HPYS>' + pass.hpys + '</HPYS>'
    + '<HPZL>' + pass.HPZL + '</HPZL>'
    + '<CLSD>' + pass.clsd + '</CLSD>'
    + '<CWKC></CWKC>'
    + '<CSYS>Z</CSYS>'
    + '<CLLX>X99</CLLX>'
    + '<SSYF>0</SSYF></ROOT>';
  srv := GetServicePortType(false, Hik86Url);
  response := srv.SendVehiclePass(data, nil, picData1, picData2, picData3);
  result := response.Contains('<CODE>0</CODE>');
  if not result then
    logger.Warn('[Hik86]' + response + data)
  else
    logger.Debug('[Hik86]OK');
end;


class function THik86Sender.SendPassEx(pass: TPass): boolean;
  function GetTPSL: integer;
  begin
    if pass.tp3 <> '' then
      exit(3);
    if pass.tp2 <> '' then
      exit(2);
    exit(1);
  end;
var
  data: string;
  srv: ServicePortType;
  response: string;
  kkmy: string;
  tpsl: integer;
begin
  if Hik86Url = '' then exit(false);
  if not HikKKMYDic.ContainsKey(pass.kdbh) then
  begin
    logger.Warn('[Hik86]没有密钥:' + pass.kdbh);
    exit(false);
  end;
  tpsl := GetTPSL;
  if pass.hpys='9' then
    pass.hpys := '4';
  if pass.HPZL = '44' then
    pass.HPZL := '99';
  if pass.cdbh = '-1' then
    pass.cdbh := '1';
  data :=
    '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
    + '<ROOT>'
    + '<KKMY>' + HikKKMYDic[pass.kdbh] + '</KKMY>'
    + '<KKBH>' + pass.kdbh + '</KKBH>'
    + '<JGSK>' + pass.gcsj.Replace('/','').Replace('-','').Replace(':','').Replace(' ','') + '</JGSK>'
    + '<CDBH>' + pass.cdbh + '</CDBH>'
    + '<HPHM>' + pass.HPHM + '</HPHM>'
    + '<HPYS>' + pass.hpys + '</HPYS>'
    + '<HPZL>' + pass.HPZL + '</HPZL>'
    + '<CLSD>' + pass.clsd + '</CLSD>'
    + '<CWKC></CWKC>'
    + '<CSYS>Z</CSYS>'
    + '<CLLX>X99</CLLX>'
    + '<TPSL>' + tpsl.ToString + '</TPSL>'
    + '<CPTPLJ><CPTPLJ>'
    + '<TPLJ1>' + pass.FWQDZ + pass.tp1 + '</TPLJ1>';
    if pass.tp2 <> '' then
      data := data + '<TPLJ2>' + pass.FWQDZ + pass.tp2 + '</TPLJ2>';
    if pass.tp2 <> '' then
      data := data + '<TPLJ3>' + pass.FWQDZ + pass.tp3 + '</TPLJ3>';
  data := data + '<SSYF>0</SSYF></ROOT>';
  srv := GetServicePortType(false, Hik86Url);
  response := srv.SendVehiclePassEx(data);
  result := response.Contains('<CODE>0</CODE>');
  if not result then
    logger.Warn('[Hik86]' + response + data)
  else
    logger.Debug('[Hik86]OK');
end;

end.
