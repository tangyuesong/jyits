unit uSPService;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, IdCustomHTTPServer, uSMS, EncdDecd, uHik,
  uLockVio, uVehPass, uAnalysisPic, uImportVio, uRmService, qjson;

type
  TSPService = Class
  private
    class function GetActions(): String; static;
    class procedure GetLocalVehInfo(tokenKey, hphm, hpzl: String;
      AResponseInfo: TIdHTTPResponseInfo);
    class function GetZhptCode(xtlb, dmlb, dmz: String): String;
  public
    class property Actions: String read GetActions;
    class procedure DoSP(action, tokenKey: String; params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
  end;

implementation

class function TSPService.GetActions: String;
begin
  Result := ',LOCKVIO,GETPASSLIST,SENDSMS,ANALYSISONEPIC,IMPORTVIO,GETLOCALVEHINFO,';
end;

class procedure TSPService.GetLocalVehInfo(tokenKey, hphm, hpzl: String;
  AResponseInfo: TIdHTTPResponseInfo);
var
  json, value: String;
  c: integer;
  qj, item: TQJson;
begin
  if (hphm = '') or (hpzl = '') then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('hphm or hpzl is null');
    exit;
  end;
  json := TCommon.QueryToJsonString('GetLocalVehInfo ' + hphm.QuotedString + ','
    + hpzl.QuotedString, nil, c);
  if json = '' then
  begin
    json := TRmService.GetVehinfo(gTokenManager.GetToken(tokenKey), hphm, hpzl);
    qj := TQJson.Create;
    try
      qj.Parse(json);
      qj.ItemByName('hphm').Value:= hphm;
      item := TCommon.FindJson('cllx', qj);
      if item <> nil then
      begin
        value := item.value;
        if TCommon.FindJson('cllxmc', qj) = nil then
        begin
          value := GetZhptCode('00', '1004', value);
          qj.AddVariant('cllxmc', value);
        end
      end;

      item := TCommon.FindJson('csys', qj);
      if item <> nil then
      begin
        value := item.value;
        if TCommon.FindJson('csysmc', qj) = nil then
        begin
          value := GetZhptCode('00', '1008', value);
          qj.AddVariant('csysmc', value);
        end
      end;

      item := TCommon.FindJson('zt', qj);
      if item <> nil then
      begin
        value := item.value;
        if TCommon.FindJson('ztmc', qj) = nil then
        begin
          value := GetZhptCode('00', '2005', value);
          qj.AddVariant('ztmc', value);
        end
      end;
    except
    end;
    json := '[' + qj.ToString + ']';
    qj.Free;
  end;
  if json = '' then
    json := '[]';
  AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(json);
end;

class function TSPService.GetZhptCode(xtlb, dmlb, dmz: String): String;
begin
  Result := gSQLHelper.GetSinge('select DMSM1 from ' + CDBName +
    '.dbo.T_VIO_CODE where xtlb=' + xtlb.QuotedString + ' and dmlb=' +
    dmlb.QuotedString + ' and dmz = ' + dmz.QuotedString);
end;

class procedure TSPService.DoSP(action, tokenKey: String; params: TStrings;
  isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
var
  kssj, jssj: Double;
begin
  if action = UpperCase('LockVio') then
  begin
    TLockVioUtils.LockVio(params.Values['systemid'], tokenKey, AResponseInfo);
  end
  else if action = UpperCase('GetPassList') then
  begin
    kssj := TCommon.GetRealDatetime(StrToInt64Def(params.Values['kssj'], 0));
    jssj := TCommon.GetRealDatetime(StrToInt64Def(params.Values['jssj'], 0));
    TVehPass.GetPassList(kssj, jssj, params.Values['kdbh'],
      params.Values['hphm'], params.Values['hpzl'], params.Values['vehlogo'],
      params.Values['vehsublogo'], params.Values['vehcolor'],
      params.Values['pilotsafebelt'], params.Values['vicepilotsafebelt'],
      params.Values['vehiclesunvisor'], params.Values['vicepilotsunvisor'],
      params.Values['pendant'], params.Values['currentpage'],
      params.Values['pageSize'], AResponseInfo);
  end
  else if action = UpperCase('SendSMS') then
  begin
    if TSMS.SendSMS(params.Values['sn'], params.Values['sjhm'],
      params.Values['content']) then
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('error');
  end
  else if (action = UpperCase('AnalysisOnePic')) and gConfig.HaveK08 then
  begin
    TAnalysisPic.AnalysisPic(params.Values['url'], params.Values['pic'],
      AResponseInfo);
  end
  else if action = UpperCase('ImportVio') then
  begin
    TImportVio.ImportVio(tokenKey, params.Values['wfxw'],
      params.Values['pic1Name'], params.Values['pic1'], params.Values['pic2'],
      AResponseInfo);
  end
  else if action = UpperCase('GetLocalVehInfo') then
  begin
    GetLocalVehInfo(tokenKey, params.Values['hphm'], params.Values['hpzl'],
      AResponseInfo);
  end;

end;

end.
