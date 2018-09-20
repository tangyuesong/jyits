unit uDBService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IniFiles, IdContext, HTTPApp, ActiveX, uGlobal, uEntity,
  System.Generics.Collections, uCommon, uSMS, IdURI, StrUtils, QJson,
  IdHeaderList, EncdDecd, idHttp, DateUtils;

type
  TDBService = class
  private
    class var FActions: TDictionary<String, TDBAction>;
    class function GetActions(): TDictionary<String, TDBAction>; static;
    class function CheckParams(Action, TokenKey: String; Params: TStrings;
      isExport: Boolean; var Msg: String): Boolean;
    class procedure AddParams(Action: String; Params: TStrings);
    class procedure DecodeJsonParam(json: String; Params: TStrings);
    class function AddCrashTaskInput(taskid, json: String): Boolean;
    class function GetDefaultValue(TokenKey, value: String): String;
    class procedure Select(Action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure DataExport(Action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure Delete(Action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure Update(Action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure Insert(Action, TokenKey: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class procedure Exec(Action: String; Params: TStrings;
      AResponseInfo: TIdHTTPResponseInfo);
    class function CheckAddUser(Action, yhbh: String): Boolean;
    class procedure CheckHisStatus(AParams: TStrings; TokenKey: String);
    class function DealBase64(ABase64Str: String): String;
  public
    class property Actions: TDictionary<String, TDBAction> read GetActions;
    class procedure DoDB(Action, TokenKey: String; Params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
  end;

var
  DbService: TDBService;

implementation

{ TDBService }

class function TDBService.GetActions: TDictionary<String, TDBAction>;
begin
  if FActions = nil then
    FActions := TCommon.GetDBActions;
  Result := FActions;
end;

class function TDBService.GetDefaultValue(TokenKey, value: String): String;
var
  s: String;
begin
  s := Uppercase(value);
  if s = '@YHBH' then
    Result := gTokenManager.GetToken(TokenKey).User.yhbh
  else if s = '@YHXM' then
    Result := gTokenManager.GetToken(TokenKey).User.YHXM
  else if s = '@DWDM' then
    Result := gTokenManager.GetToken(TokenKey).User.DWDM
  else if s = '@IP' then
    Result := gTokenManager.GetToken(TokenKey).IP
  else if s = '@MANAGER' then
    Result := gTokenManager.GetToken(TokenKey).User.Manager
  else if s = '@NOW' then
    Result := IntToStr(DateUtils.MilliSecondsBetween(Now(), 25569.3333333333))
  else if s = '@XH' then
    Result := FormatDatetime('yyyymmddhhnnsszzz', Now())
  else if s = '@ZDDM' then
    Result := LeftStr(gTokenManager.GetToken(TokenKey).User.DWDM, 4)
  else if s = '@XZQH' then
    Result := TCommon.GetXZQH(gTokenManager.GetToken(TokenKey).User.DWDM)
  else if s = '@YHXM' then
    Result := gTokenManager.GetToken(TokenKey).User.YHXM
  else
    Result := value;
end;

class function TDBService.DealBase64(ABase64Str: String): String;
var
  tp, dir, fwqdz: String;
begin
  Result := '';

  if ABase64Str = '' then
    exit;
  tp := FormatDatetime('yyyymmddhhnnsszzz', Now()) + '1.jpg';
  if not TCommon.Base64ToFile(ABase64Str, ExtractFilePath(Paramstr(0)) + tp) or
    not FileExists(ExtractFilePath(Paramstr(0)) + tp) then
    exit;

  dir := 'gpy/' + FormatDatetime('yyyymm', Now) + '/' +
    FormatDatetime('dd', Now) + '/';
  fwqdz := gConfig.ImportVioHome + dir;

  if TCommon.FtpPutFile(gConfig.ImportVioHost, gConfig.ImportVioUser,
    gConfig.ImportVioPassword, ExtractFilePath(Paramstr(0)) + tp, dir + tp,
    gConfig.ImportVioPort) then
    Result := fwqdz + tp;
  TCommon.DelFile(ExtractFilePath(Paramstr(0)) + tp);
end;

class procedure TDBService.DecodeJsonParam(json: String; Params: TStrings);
var
  QJson: TQJson;
  i: integer;
begin
  try
    QJson := TQJson.Create;
    QJson.Parse(json);
    for i := 0 to QJson.Count - 1 do
      Params.Add(QJson.Items[i].Name + '=' + QJson.Items[i].value);
  finally
    QJson.Free;
  end;
end;

class function TDBService.CheckAddUser(Action, yhbh: String): Boolean;
begin
  Result := True;
  if Action = 'ADDUSER' then
  begin
    if yhbh <> '' then
    begin
      Result := not gSQLHelper.ExistsRecord(cDBName + '.dbo.S_User',
        'zt=1 and yhbh=' + yhbh.QuotedString);
      if Result then
        gSQLHelper.ExecuteSql('delete from ' + cDBName +
          '.dbo.S_User where zt=0 and yhbh = ' + yhbh.QuotedString);
    end;
  end;
end;

class procedure TDBService.CheckHisStatus(AParams: TStrings; TokenKey: String);
var
  yhbh: String;
  index: integer;
begin
  yhbh := AParams.Values['yhbh'];
  if yhbh <> '' then
  begin
    index := AParams.IndexOfName('zt');
    if AParams.ValueFromIndex[index] = '2' then
    begin
      if gTokenManager.GetToken(TokenKey).User.SH = '1' then
      begin
        if index >= 0 then
          AParams.ValueFromIndex[index] := '29'
        else
          AParams.Add('zt=29');
      end
      else if gTokenManager.GetToken(TokenKey).User.FH = '1' then
      begin
        if index >= 0 then
          AParams.ValueFromIndex[index] := '9'
        else
          AParams.Add('zt=9');
      end
      else if AParams.Values['wfxw'] = '13441' then
      begin
        if index >= 0 then
          AParams.ValueFromIndex[index] := '20'
        else
          AParams.Add('zt=20');
      end;
    end;
  end;
end;

class function TDBService.CheckParams(Action, TokenKey: String;
  Params: TStrings; isExport: Boolean; var Msg: String): Boolean;
var
  i, j: integer;
  v: int64;
  p, url: String;
begin
  // 检查参数数目是否一致，参数类型是否一致
  Result := True;
  if Actions[Action].Params.Count > 0 then
  begin
    for i := 0 to Actions[Action].Params.Count - 1 do // 检查必传的参数有没有传值
    begin
      if Actions[Action].Params[i].Nonnull and
        (Params.IndexOfName(Actions[Action].Params[i].Param) < 0) then
      begin
        Msg := Actions[Action].Params[i].Param + ' is not found ';
        Result := False;
        exit;
      end
      else if not Actions[Action].Params[i].Nonnull and // 非必传，默认值不为空，参数未传
        (Params.IndexOfName(Actions[Action].Params[i].Param) < 0) and
        (Actions[Action].Params[i].DefaultValue <> '') then
        Params.Add(Actions[Action].Params[i].Param + '=' +
          GetDefaultValue(TokenKey, Actions[Action].Params[i].DefaultValue));
    end;

    for i := Params.Count - 1 downto 0 do // 检查传入的参数在参数配置里是否都存在
    begin
      p := Uppercase(Params.Names[i]);
      if (p = 'CURRENTPAGE') or (p = 'PAGESIZE') then
      begin
        v := StrToInt64Def(Params.Values[p], -1);
        if v = -1 then
        begin
          Msg := 'currentpage or pagesize is error';
          Result := False;
          exit;
        end;
        continue;
      end
      else if isExport and (p = 'FILENAME') then
        continue;

      Result := False;
      for j := 0 to Actions[Action].Params.Count - 1 do
      begin
        if Actions[Action].Params[j].Param = p then
        begin
          if Actions[Action].Params[j].DbColName <> '' then
            // 接口的参数名和数据库的字段名不一致
            Params[i] := Actions[Action].Params[j].DbColName + '=' +
              Params.ValueFromIndex[i];

          if (Actions[Action].Params[j].ParamType = 'INT') or
            (Actions[Action].Params[j].ParamType = 'DATETIME') then
          // 检查传入的参数是否为整形
          begin
            v := StrToInt64Def(Params.ValueFromIndex[i], -346789);
            if v <> -346789 then
            begin
              // if (p = 'KSSJ') or (p = 'JSSJ') or (p = 'YXSJ') or (p = 'WFSJ') or
              // (p = 'CZSJ') or (p = 'YXQKS') or (p = 'YXQJS') then
              if Actions[Action].Params[j].ParamType = 'DATETIME' then
                Params.ValueFromIndex[i] :=
                  FormatDatetime('yyyy/mm/dd hh:nn:ss',
                  TCommon.GetRealDatetime(v));
            end
            else
            begin
              Msg := p + ' is error';
              exit;
            end;
          end
          else if Actions[Action].Params[j].ParamType = 'JSON' then
          // 分解json类型
          begin
            DecodeJsonParam(Params.ValueFromIndex[i], Params);
            Params.Delete(i);
          end
          else if Actions[Action].Params[j].ParamType = 'BASE64' then // 图片
          begin
            url := DealBase64(Params.ValueFromIndex[i]);
            if url = '' then
            begin
              Msg := p + ' is error';
              exit;
            end;
            Params.ValueFromIndex[i] := url;
          end;
          Result := True;
          break;
        end;
      end;
      if not Result then // 参数配置中未找到该参数
      begin
        Msg := p + ' is not found';
        exit;
      end;
    end;
  end
  else if Params.Count > 0 then // 未配置参数，但有传入参数
  begin
    for i := 0 to Params.Count - 1 do
    begin
      p := Uppercase(Params.Names[i]);
      if (p <> 'CURRENTPAGE') and (p <> 'PAGESIZE') then
      begin
        Msg := p + ' is not found';
        Result := False;
        exit;
      end;
    end;
  end;
end;

class procedure TDBService.DoDB(Action, TokenKey: String; Params: TStrings;
  isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
var
  actionType, Msg: String;
begin
  ActiveX.CoInitialize(nil);
  if not CheckParams(Action, TokenKey, Params, isExport, Msg) then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(Msg);
    exit;
  end;
  actionType := Uppercase(Actions[Action].actionType);
  if (actionType = 'Q') or (actionType = 'P') then
  begin
    if isExport then
      DataExport(Action, Params, AResponseInfo)
    else
      Select(Action, Params, AResponseInfo);
  end
  else if (actionType = 'A') and not isExport then
    Insert(Action, TokenKey, Params, AResponseInfo)
  else if (actionType = 'M') and not isExport then
    Update(Action, Params, AResponseInfo)
  else if (actionType = 'D') and not isExport then
    Delete(Action, Params, AResponseInfo)
  else if (actionType = 'F') and not isExport then
    Exec(Action, Params, AResponseInfo)
  else
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('config error');
end;

class procedure TDBService.Exec(Action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  i: integer;
  s: String;
begin
  if Actions[Action].SQL <> '' then
  begin
    s := Actions[Action].SQL + ' ';
    for i := 0 to Params.Count - 1 do
    begin
      s := s + ' @' + Params.Names[i] + '=' + Params.ValueFromIndex[i]
        .QuotedString + ',';
    end;
    s := copy(s, 1, Length(s) - 1);

    with gSQLHelper.Query(s) do
    begin
      if not Eof then
      begin
        if Fields[0].AsString = '1' then
          AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
        else
          AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
            (Fields[1].AsString);
      end
      else
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult('error');
      Free;
    end;
  end
  else
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('parameter error');
  ActiveX.CoUninitialize;
end;

class procedure TDBService.DataExport(Action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  i: integer;
  currentpage, pagesize: String;
  s, fileName: String;
begin
  if (Params.IndexOfName('CURRENTPAGE') >= 0) and
    (Params.IndexOfName('PAGESIZE') >= 0) then
  begin
    currentpage := Params.Values['CURRENTPAGE'];
    pagesize := Params.Values['PAGESIZE'];
  end
  else
  begin
    currentpage := '';
    pagesize := '';
  end;

  i := Params.IndexOfName('FILENAME');
  if i >= 0 then
  begin
    fileName := Params.ValueFromIndex[i];
    Params.Delete(i);
  end
  else
    fileName := Action;

  if (Actions[Action].actionType = 'P') and (Actions[Action].SQL <> '') then
  begin
    s := Actions[Action].SQL + ' ';
    for i := 0 to Params.Count - 1 do
      s := s + ' @' + Params.Names[i] + '=' + Params.ValueFromIndex[i]
        .QuotedString + ',';
    s := copy(s, 1, Length(s) - 1);
  end
  else if Actions[Action].actionType = 'Q' then
  begin
    if Actions[Action].SQL <> '' then
      s := Uppercase(Actions[Action].SQL)
    else if Actions[Action].TableName <> '' then
      s := 'select * from ' + Actions[Action].TableName;
    if s <> '' then
    begin
      for i := 0 to Params.Count - 1 do
      begin
        if (Uppercase(Params.Names[i]) <> 'CURRENTPAGE') and
          (Uppercase(Params.Names[i]) <> 'PAGESIZE') then
        begin
          if not s.Contains(' WHERE ') then
            s := s + ' WHERE 1 = 1 ';
          s := s + ' and ' + Params.Names[i] + '=' + Params.ValueFromIndex[i]
            .QuotedString;
        end;
      end;

      if currentpage <> '' then
      begin
        s := s + ' order by GXSJ desc ';
        s := s + ' offset ' + (StrToIntDef(currentpage, 0) *
          StrToIntDef(pagesize, 30)).ToString + ' row fetch next ' +
          (StrToIntDef(pagesize, 30)).ToString + ' rows only ';
      end;
    end
    else
    begin
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
        ('config error');
      exit;
    end;
  end
  else
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('config error');
    exit;
  end;
  AResponseInfo.ContentStream := TCommon.QueryToStream(s);
  if AResponseInfo.ContentStream <> nil then
    AResponseInfo.ContentDisposition := 'attachment; filename="' +
      HttpEncode(fileName) + '.xls"'
  else
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('export error');
end;

class procedure TDBService.Select(Action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  totalNum, i, j: integer;
  currentpage, pagesize, body: String;
  s, ss: String;
  ts: TStrings;
begin
  if Actions[Action].ReturnGroups.Count > 0 then
    ts := Actions[Action].ReturnGroups
  else
    ts := nil;

  if (Params.IndexOfName('CURRENTPAGE') >= 0) and
    (Params.IndexOfName('PAGESIZE') >= 0) then
  begin
    currentpage := Params.Values['CURRENTPAGE'];
    pagesize := Params.Values['PAGESIZE'];
  end
  else
  begin
    currentpage := '';
    pagesize := '';
  end;

  if (Actions[Action].actionType = 'P') and (Actions[Action].SQL <> '') then
  begin
    s := Actions[Action].SQL + ' ';
    ss := Actions[Action].SQL + ' ';
    for i := 0 to Params.Count - 1 do
    begin
      s := s + ' @' + Params.Names[i] + '=' + Params.ValueFromIndex[i]
        .QuotedString + ',';
      if (Uppercase(Params.Names[i]) <> 'CURRENTPAGE') and
        (Uppercase(Params.Names[i]) <> 'PAGESIZE') then
        ss := ss + ' @' + Params.Names[i] + '=' + Params.ValueFromIndex[i]
          .QuotedString + ',';
    end;

    s := copy(s, 1, Length(s) - 1);
    ss := copy(ss, 1, Length(ss) - 1);

    body := TCommon.QueryToJsonString(s, ts, totalNum);

    if currentpage <> '' then
    begin
      if Action = 'GETALARMRESULT' then // 太慢
        totalNum := 500
      else
        totalNum := gSQLHelper.GetRecordCount(ss);
    end;
  end
  else if Actions[Action].actionType = 'Q' then
  begin
    if Actions[Action].SQL <> '' then
      s := Uppercase(Actions[Action].SQL)
    else if Actions[Action].TableName <> '' then
      s := 'select * from ' + Actions[Action].TableName;
    if s <> '' then
    begin
      for i := 0 to Params.Count - 1 do
      begin
        if (Uppercase(Params.Names[i]) <> 'CURRENTPAGE') and
          (Uppercase(Params.Names[i]) <> 'PAGESIZE') then
        begin
          if not s.Contains(' WHERE ') then
            s := s + ' WHERE 1 = 1 ';
          s := s + ' and ' + Params.Names[i] + '=' + Params.ValueFromIndex[i]
            .QuotedString;
        end;
      end;

      if currentpage <> '' then
      begin
        totalNum := gSQLHelper.GetRecordCount(s);
        s := s + ' order by GXSJ desc ';
        s := s + ' offset ' + (StrToIntDef(currentpage, 0) *
          StrToIntDef(pagesize, 30)).ToString + ' row fetch next ' +
          (StrToIntDef(pagesize, 30)).ToString + ' rows only ';
        body := TCommon.QueryToJsonString(s, ts, j);
      end
      else
        body := TCommon.QueryToJsonString(s, ts, totalNum);
    end
    else
    begin
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
        ('parameter error');
      exit;
    end;
  end
  else
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('parameter error');
    exit;
  end;

  if body <> '' then
  begin
    if currentpage = '' then
    begin
      currentpage := '1';
      pagesize := IntToStr(totalNum);
    end;
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult(body,
      IntToStr(totalNum), currentpage, pagesize);
  end
  else
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('[]');
end;

class procedure TDBService.Delete(Action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  s: String;
  i: integer;
begin
  if Params.Count = 0 then
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('parameter error')
  else
  begin
    if Actions[Action].SQL <> '' then
      s := Uppercase(Actions[Action].SQL)
    else if Actions[Action].TableName <> '' then
      s := 'delete from ' + Actions[Action].TableName;
    if s <> '' then
    begin
      if not s.Contains(' WHERE ') then
        s := s + ' where 1 = 1 ';

      for i := 0 to Params.Count - 1 do
        s := s + ' and ' + Params.Names[i] + '=' + Params.ValueFromIndex[i]
          .QuotedString;

      if gSQLHelper.ExecuteSql(s) then
        AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
      else
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('delete failed');
    end
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
        ('parameter error');
  end;
end;

class procedure TDBService.Update(Action: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  s, w: String;
  i: integer;
begin
  if Params.Count = 0 then
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('config error')
  else
  begin
    if Actions[Action].TableName <> '' then
    begin
      w := '';
      s := '';
      AddParams(Action, Params);
      for i := 0 to Params.Count - 1 do
      begin
        if Uppercase(Params.Names[i]) = 'SYSTEMID' then
          w := ' where SYSTEMID = ' + Params.ValueFromIndex[i].QuotedString
        else
          s := s + Params.Names[i] + '=' + Params.ValueFromIndex[i]
            .QuotedString + ',';
      end;

      if (s = '') or (w = '') then
      begin
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('config error');
        exit;
      end;

      s := 'update ' + Actions[Action].TableName + ' set ' +
        copy(s, 1, Length(s) - 1) + w;

      if gSQLHelper.ExecuteSql(s) then
        AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
      else
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('update failed');
    end
    else if Actions[Action].SQL <> '' then
    begin
      s := Actions[Action].SQL;
      if not Uppercase(s).Contains(' WHERE ') then
        s := s + ' where 1 = 1';
      AddParams(Action, Params);
      for i := 0 to Params.Count - 1 do
        s := s + ' and ' + Params.Names[i] + '=' + Params.ValueFromIndex[i]
          .QuotedString;

      if gSQLHelper.ExecuteSql(s) then
        AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
      else
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('update failed');
    end
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
        ('config error');
  end;
end;

class procedure TDBService.Insert(Action, TokenKey: String; Params: TStrings;
  AResponseInfo: TIdHTTPResponseInfo);
var
  cols, Values, s: String;
  i: integer;
begin
  if not CheckAddUser(Action, Params.Values['yhbh']) then
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('yhbh is exists');
    exit;
  end;

  if (Action = Uppercase('SaveTempVio2His')) or
    (Action = Uppercase('ModifyVioHis')) then
    CheckHisStatus(Params, TokenKey);

  if Actions[Action].TableName <> '' then
  begin
    AddParams(Action, Params);
    if Params.Count = 0 then
    begin
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
        ('parameter failed');
      exit;
    end;

    for i := 0 to Params.Count - 1 do
    begin
      cols := cols + Params.Names[i] + ',';
      Values := Values + Params.ValueFromIndex[i].QuotedString + ',';
    end;
    cols := copy(cols, 1, Length(cols) - 1);
    Values := copy(Values, 1, Length(Values) - 1);
    s := 'insert into ' + Actions[Action].TableName + '( ' + cols + ') values ('
      + Values + ')';

    if gSQLHelper.ExecuteSql(s) then
      AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult('')
    else
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
        ('Insert failed');
  end
  else
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('config error');
end;

class function TDBService.AddCrashTaskInput(taskid, json: String): Boolean;
var
  QJson, item: TQJson;
  i, j: integer;
  v: int64;
  kssj, jssj, kdbh, s: String;
  sqls: TStrings;
begin
  Result := True;
  sqls := TStringlist.Create;
  QJson := TQJson.Create;
  try
    QJson.Parse(json);
    for i := 0 to QJson.Count - 1 do
    begin
      item := QJson.Items[i];
      kssj := '';
      jssj := '';
      kdbh := '';
      for j := 0 to item.Count - 1 do
      begin
        if (Uppercase(item[j].Name) = 'KSSJ') or
          (Uppercase(item[j].Name) = 'JSSJ') then
        begin
          v := StrToInt64Def(item[j].value, 0);
          if v = 0 then
          begin
            Result := False;
            QJson.Free;
            sqls.Free;
            exit;
          end;
          s := FormatDatetime('yyyy/mm/dd hh:nn:ss',
            TCommon.GetRealDatetime(v));
          if Uppercase(item[j].Name) = 'KSSJ' then
            kssj := s
          else
            jssj := s;
        end
        else if Uppercase(item[j].Name) = 'KDBH' then
          kdbh := item[j].value;
      end;
      if (kssj <> '') and (jssj <> '') and (kdbh <> '') then
      begin
        s := ' insert into ' + cDBName +
          '.dbo.T_Analyse_CrashTask_Input (taskid, SBBH, BeginTime, EndTime) values ('
          + taskid.QuotedString + ',' + kdbh.QuotedString + ',' +
          kssj.QuotedString + ',' + jssj.QuotedString + ') ';
        sqls.Add(s);
      end;
    end;
  except
    Result := False;
  end;
  if sqls.Count >= 3 then // 该技战法必须要三个条件以上
    Result := gSQLHelper.ExecuteSqlTran(sqls)
  else
    Result := False;
  QJson.Free;
  sqls.Free;
end;

class procedure TDBService.AddParams(Action: String; Params: TStrings);
var
  taskid, s: String;
  indx: integer;
begin
  if Action = Uppercase('AddCrashTask') then
  begin
    taskid := TGuid.NewGuid.ToString;
    indx := Params.IndexOfName('CONDITION');
    if indx >= 0 then
    begin
      s := Params.ValueFromIndex[indx];
      if AddCrashTaskInput(taskid, s) then
      begin
        Params.Delete(indx);
        Params.Add('SYSTEMID=' + taskid);
      end
      else
        Params.Clear;
    end
    else
      Params.Clear;
  end;
end;

end.
