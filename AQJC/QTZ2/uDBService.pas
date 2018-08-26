unit uDBService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IniFiles, IdContext, HTTPApp, ActiveX, uGlobal, uEntity,
  System.Generics.Collections, uCommon, uSpecialItf, uDBO, uSMS, IdURI,
  IdHeaderList, EncdDecd, IdServerIOHandler, IdSSL, IdSSLOpenSSL, uHikLY,
  uTokenManager;

type
  TDBService = class
  private
    FHttpList: TList<TIdHTTPServer>;
    procedure IdHTTPServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure IdHTTPServer1CreatePostStream(AContext: TIdContext;
      AHeaders: TIdHeaderList; var VPostStream: TStream);
    procedure IdServerIOHandlerSSLOpenSSL1GetPassword(var Password: string);
  public
    constructor Create;
    destructor Destroy; override;
  end;

var
  DbService: TDBService;

implementation

{ TDBService }

constructor TDBService.Create;
var
  http: TIdHTTPServer;
  server: THttpServer;
  IdServerIOHandlerSSLOpenSSL1: TIdServerIOHandlerSSLOpenSSL;
begin
  inherited;
  FHttpList := TList<TIdHTTPServer>.Create;
  for server in gHttpDic.Values do
  begin
    IdServerIOHandlerSSLOpenSSL1 := TIdServerIOHandlerSSLOpenSSL.Create(nil);
    IdServerIOHandlerSSLOpenSSL1.SSLOptions.Method := sslvSSLv23;
    IdServerIOHandlerSSLOpenSSL1.SSLOptions.RootCertFile :=
      ExtractFilePath(ParamStr(0)) + 'server.crt';
    IdServerIOHandlerSSLOpenSSL1.SSLOptions.CertFile :=
      ExtractFilePath(ParamStr(0)) + 'server.crt';
    IdServerIOHandlerSSLOpenSSL1.SSLOptions.KeyFile :=
      ExtractFilePath(ParamStr(0)) + 'server.key';
    IdServerIOHandlerSSLOpenSSL1.OnGetPassword :=
      IdServerIOHandlerSSLOpenSSL1GetPassword;
    http := TIdHTTPServer.Create(nil);
    http.IOHandler := IdServerIOHandlerSSLOpenSSL1;
    http.OnCommandGet := self.IdHTTPServerCommandGet;
    http.OnCreatePostStream := IdHTTPServer1CreatePostStream;
    http.Bindings.Clear;
    http.DefaultPort := server.Port;
    http.Active := True;
    FHttpList.Add(http);
  end;
end;

procedure TDBService.IdServerIOHandlerSSLOpenSSL1GetPassword
  (var Password: string);
begin
  Password := '123456';
end;

destructor TDBService.Destroy;
var
  i: integer;
begin
  for i := FHttpList.Count - 1 downto 0 do
  begin
    FHttpList[i].Active := False;
    FHttpList[i].Free;
  end;
  FHttpList.Free;
  inherited;
end;

procedure TDBService.IdHTTPServer1CreatePostStream(AContext: TIdContext;
  AHeaders: TIdHeaderList; var VPostStream: TStream);
begin
  VPostStream := TStringStream.Create;
end;

procedure TDBService.IdHTTPServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  action, tokenStr: String;
  params: TStrings;
  i: integer;
  s, clientIP, yhbh, page, pageSize: String;
  param: TDictionary<string, String>;
  token: TToken;
begin
  action := UpperCase(ARequestInfo.Document.Substring(1));
  clientIP := Trim(AContext.Connection.Socket.Binding.PeerIP);
  tokenStr := '';
  yhbh := '';

  params := TStringList.Create;
  params.Delimiter := '&';
  try
    if UpperCase(ARequestInfo.Command) = 'POST' then
      params.Text := Trim(TStringStream(ARequestInfo.PostStream).DataString)
    else
    begin
      params.DelimitedText := Utf8Decode(ARequestInfo.UnparsedParams);
      for i := params.Count - 1 downto 0 do
      begin
        if UpperCase(params.Names[i]) = 'TOKEN' then
        begin
          tokenStr := TIdURI.URLDecode(params.ValueFromIndex[i]);
          params.Delete(i);
          continue;
        end;
        params[i] := TIdURI.URLDecode(params[i]);
      end;
    end;

    gLogger.logging('[' + clientIP + ']' + action + '/' +
      ARequestInfo.UnparsedParams, 2);

    AResponseInfo.ContentType := 'text/html';
    AResponseInfo.CharSet := 'utf-8';
    AResponseInfo.ContentText := '';

    if action = UpperCase('Login') then
    begin
      AResponseInfo.ContentText := TSpecialItf.Login(clientIP, params);
    end
    else
    begin
      if gServiceIp.IndexOf(clientIP) >= 0 then
      begin
        yhbh := gTokenManager.NewToken('sa', clientIP).Login;
      end
      else
      begin
        if not gTokenManager.CheckToken(tokenStr, clientIP) then
        begin
          gLogger.logging('[' + clientIP + ']' + action + ' invalid token', 4);
          AResponseInfo.ContentText := 'invalid token';
          params.Free;
          exit;
        end;
        token := gTokenManager.GetToken(tokenStr);
        yhbh := token.Login;
      end;

      if action = UpperCase('GetLockVio') then
      begin
        AResponseInfo.ContentText := TSpecialItf.GetLockVio
          (params.Values['systemid']);
      end
      else if action = UpperCase('UploadVio') then
      begin
        AResponseInfo.ContentText := TSpecialItf.UploadVio(token, params);
      end
      else if action = UpperCase('GetPassList') then
      begin
        AResponseInfo.ContentText := TSpecialItf.GetPassList(params);
      end
      else if action = UpperCase('SendSMS') then
      begin
        if TSMS.SendSMS(params.Values['sn'], params.Values['sjhm'],
          params.Values['content']) then
          AResponseInfo.ContentText := '1'
        else
          AResponseInfo.ContentText := '0';
      end
      else if (action = UpperCase('GetK08VehInfo')) and gHaveK08 then
      begin
        AResponseInfo.ContentText := TSpecialItf.GetK08VehInfo
          (params.Values['hphm'], params.Values['hpzl']);
      end

      else if (action = UpperCase('GetK08PassList')) and gHaveK08 then
      begin
        param := TDictionary<string, String>.Create;
        for i := 0 to params.Count - 1 do
        begin
          if UpperCase(params.Names[i]) = 'CURRENTPAGE' then
            page := params.ValueFromIndex[i]
          else if UpperCase(params.Names[i]) = 'PAGESIZE' then
            pageSize := params.ValueFromIndex[i]
          else
            param.Add(params.Names[i], params.ValueFromIndex[i]);
        end;
        AResponseInfo.ContentText := TSpecialItf.GetK08PassList(param, page,
          pageSize);
        param.Free;
      end

      else if (action = UpperCase('submitCarFaceJobByID')) and gHaveK08 then
      begin
        AResponseInfo.ContentText := TSpecialItf.submitCarFaceJobByID(params);
      end

      else if (action = UpperCase('submitCarFaceCompareJob')) and gHaveK08 then
      begin
        AResponseInfo.ContentText :=
          TSpecialItf.submitCarFaceCompareJob(params);
      end

      else if (action = UpperCase('CreateCarFaceCompareJob')) and gHaveK08 then
      begin
        AResponseInfo.ContentText :=
          TSpecialItf.CreateCarFaceCompareJob(params);
      end

      else if (action = UpperCase('GetCarFaceJob')) and gHaveK08 then
      begin
        AResponseInfo.ContentText := TSpecialItf.GetCarFaceJob(params);
      end
      else if (action = UpperCase('getJobResultByTaskId')) and gHaveK08 then
      begin
        AResponseInfo.ContentText := TSpecialItf.getJobResultByTaskId
          (params.Values['taskid']);
      end
      else if (action = UpperCase('getJobFinalResultByTaskId')) and gHaveK08
      then
      begin
        AResponseInfo.ContentText := TSpecialItf.getJobFinalResultByTaskId
          (params.Values['taskid']);
      end
      {
        else if (action = UpperCase('GetK08PassList')) and gHaveK08 then
        begin
        AResponseInfo.ContentText := TSpecialItf.GetK08PassList
        (params.Values['kssj'], params.Values['jssj'], params.Values['hphm'],
        params.Values['hpzl'], params.Values['kdbh'], params.Values['clpp'],
        params.Values['csys'], params.Values['clpp1'], params.Values['aqd'],
        params.Values['aqd1'], params.Values['zyb'], params.Values['zyb1'],
        params.Values['gj'], params.Values['page'],
        params.Values['pageSize']);
        end
      }
      else if (action = UpperCase('AnalysisOnePic')) and gHaveK08 then
      begin
        AResponseInfo.ContentText := TSpecialItf.AnalysisOnePic
          (DecodeString(params.Values['url']));
      end
      else if action = UpperCase('LYIntelligentSearch') then
      begin
        AResponseInfo.ContentText := THikLY.IntelligentSearch
          (ARequestInfo.PostStream);
      end
      else if gActionDic.ContainsKey(action) then
      begin
        if (gActionDic[action].ActionType = 'Q') or
          (gActionDic[action].ActionType = 'P') then
          AResponseInfo.ContentText := TDBO.Select(gActionDic[action], params)
        else if gActionDic[action].ActionType = 'A' then
          AResponseInfo.ContentText := TDBO.Insert(gActionDic[action], params)
        else if gActionDic[action].ActionType = 'M' then
          AResponseInfo.ContentText := TDBO.Update(gActionDic[action], params)
        else if gActionDic[action].ActionType = 'D' then
          AResponseInfo.ContentText := TDBO.Delete(gActionDic[action], params)
        else
        begin
          gLogger.logging('[' + clientIP + ']' + action +
            ' action type is not found', 2);
          // AResponseInfo.ContentText := 'action type is not found';
          AResponseInfo.ContentText := '';
        end;
      end
      else
      begin
        gLogger.logging('[' + clientIP + ']' + action + ' is not exists', 4);
        // AResponseInfo.ContentText := 'action is not exists';
        AResponseInfo.ContentText := '';
      end;
    end;
  except
    on e: exception do
    begin
      gLogger.logging('[' + clientIP + ']' + action + ' error ' + e.Message, 4);
      // AResponseInfo.ContentText := 'action error ' + e.Message;
    end;
  end;
  if yhbh <> 'sa' then
    TSpecialItf.SaveQtzLog(tokenStr, yhbh, clientIP, action,
      params.DelimitedText);
  gLogger.logging('[' + clientIP + ']' + action + ' OK', 2);
  params.Free;
end;

end.
