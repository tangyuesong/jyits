unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, IdURI, DateUtils, Vcl.Imaging.jpeg,
  Soap.EncdDecd, ImageenView, StrUtils, HttpApp, Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCommon, uGlobal, uRmService,
  uSPService, uDBService, IdContext, IdCustomHTTPServer, IdTCPConnection,
  IdTCPClient, IdHTTP, Vcl.ExtCtrls, IdBaseComponent, IdComponent, uentity,
  IdCustomTCPServer, IdHTTPServer, Vcl.StdCtrls, IdHeaderList, QJson, uTmri,
  IdStrings, QBAES,
  FireDAC.Phys.OracleDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle,
  IdTime, IdUnixTime, uHikJZF;

type
  TForm1 = class(TForm)
    httpServer: TIdHTTPServer;
    Timer1: TTimer;
    httpClient: TIdHTTP;
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    IdUnixTime1: TIdUnixTime;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure httpServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure httpServerCreatePostStream(AContext: TIdContext;
      AHeaders: TIdHeaderList; var VPostStream: TStream);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure DoHttpRequest(Action, tokenKey: String; params: TStrings;
      isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uHikDSJ;

{$R *.dfm}

function BitmapToString(lj: string): WideString;
var
  ms: TMemoryStream;
  ss: TStringStream;
  s: string;
  Image1: TImage;
  bitmap1: TBitmap;
  JPEG1: TJPEGImage;
begin
  try
    Image1 := TImage.Create(nil);
    Image1.Picture.LoadFromFile(lj);
    ms := TMemoryStream.Create;
    JPEG1 := TJPEGImage.Create;
    JPEG1.Assign(Image1.Picture.Graphic);
    JPEG1.SaveToStream(ms);
    FreeAndNil(JPEG1);

    ss := TStringStream.Create('');
    ms.Position := 0;
    EncodeStream(ms, ss); // 将内存流编码为base64字符流
    s := ss.DataString;
    ms.Free;
    ss.Free;
    Image1.Free;
    Result := s;
  except
    Result := '';
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  stream: TMemoryStream;
  response: TStream;
  bytes: TBytes;
  token, s, json: String;
  ts: TStrings;
  tmriParam: TTmriParam;
  mm: String;
begin

  // TCommon.SaveVehInfo(s);


  // mm:= AesEncrypt('2528711532935680000', AnsiString(cUserKey));

  s := httpClient.Get
    (TIdURI.URLEncode
    ('http://127.0.0.1:17115/Login?user=250688&pwd=E14B236263F88BB55354B247CEE47C29')
    // ('http://127.0.0.1:17115/wxLogin?user=252871&pwd=0D6B629FB5553B325FB1A7C359A180E9207EA79CEBD39BC03C80317F55832924')
    );
  token := TCommon.GetJsonNode('token', s);
  if token = '' then
  begin
    ShowMessage(TCommon.GetJsonNode('message', s));
    exit;
  end;

  Memo1.Text := httpClient.Get
    (TIdURI.URLEncode('http://127.0.0.1:17115/GetVioCount?hphm=粤GBX930&hpzl=02&clbj=0&token='
    // (TIdURI.URLEncode('http://127.0.0.1:17115/WriteSG?token='
    // ('http://127.0.0.1:17115/GetDrvInfo?sfzmhm=342921198309063411&token='
    + token));

  // TRmService.SaveSimpleVio(nil, nil,nil);
  {
    tmriParam.jkid := '04C55';
    tmriParam.yhbz := '250436';
    tmriParam.dwmc := '';
    tmriParam.dwjgdm := '445102005300';
    tmriParam.yhxm := '苏柏青';
    tmriParam.zdbs := '10.43.255.8';

    json := '{"pzbh":"445102330000061","wslb":"3","ryfl":"3","jszh":"无","fzjg":"无","zjcx":"无",'
    + '"dsr":"无无","clfl":"2","hpzl":"02","hphm":"无","jtfs":"M21","wfsj":"2018-04-24 16:29:58",'
    + '"xzqh":"445101","wfdd":"70011","lddm":"1002","wfdz":"永春北路","wfxw1":"1357","jsjqbj":"00",'
    + '"dabh":"000000000000","sgdj":"0","zqmj":"250436","fxjg":"445102005300","qzcslx":"1",'
    + '"klwpcfd":"祥兴停车场","zsxzqh":"445101","zsxxdz":"无","dh":"无","lxfs":"无","jdcsyr":"无无",'
    + '"fdjh":"无","ddms":"0","scz1":"0","bzz1":"0","wfxw2":"1110","scz2":"0","bzz2":"0","wfxw3":"1717",'
    + '"scz3":"0","bzz3":"0","wfxw4":"1207","scz4":"0","bzz4":"0" }
  // ';
  // json := TTmri.Write(tmriParam, json);

  // showmessage(json);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  json, item: TQJson;
  ryxx, s: String;
  i, j: integer;
  ryDic: TDictionary<integer, TStrings>;
  ryInfo, params: TStrings;
begin
  params := TStringList.Create;

  json := TQJson.Create;
  json.Parse
    ('{"sgfssj":"2018/3/31 19:40:40","sgdd":"潮州大道","sgxt":"碰撞后碾压行人","ssrs":"1","zjccss":"1000",'
    + '"ryxx":[{"xm":"张三","xb":"男","nl":"30","jtfs":"驾驶低速汽车","jszh":"123456789","hphm":"粤U12345","zr":"全部" },'
    + '{ "xm":"李四","xb":"男","nl":"20","jtfs":"步行","jszh":"","hphm":"","zr":"无责"}]}');
  for i := 0 to json.Count - 1 do
    params.Add(json.Items[i].Name + '=' + json.Items[i].value);
  json.Free;

  ryxx := params.Values['ryxx'];
  if ryxx = '' then
    exit;
  json := TQJson.Create;
  ryDic := TDictionary<integer, TStrings>.Create;
  try
    json.Parse(ryxx);
    for i := 0 to json.Count - 1 do
    begin
      ryInfo := TStringList.Create;
      item := json.Items[i];
      for j := 0 to item.Count - 1 do
        ryInfo.Add(item.Items[j].Name + '=' + item.Items[j].value);
      ryDic.Add(i, ryInfo);
    end;
    if ryDic.Count > 0 then
    begin
      s := params.Values['sgfssj'] + ',在' + params.Values['sgdd'] + ',发生' +
        params.Values['sgxt'];
      if RightStr(params.Values['sgxt'], 2) <> '事故' then
        s := s + '事故。';
      s := s + '至受伤' + params.Values['ssrs'] + '人,直接财产损失' + params.Values
        ['zjccss'] + '元。';

      for i := 0 to ryDic.Keys.Count - 1 do
      begin
        s := s + '当事人' + (i + 1).ToString + ':' + ryDic[i].Values['xm'] + '(' +
          ryDic[i].Values['xb'] + ',' + ryDic[i].Values['nl'] + '岁';
        if ryDic[i].Values['jszh'] <> '' then
          s := s + ',驾驶证号' + ryDic[i].Values['jszh'];
        if (LeftStr(ryDic[i].Values['jtfs'], 2) = '驾驶') or
          (LeftStr(ryDic[i].Values['jtfs'], 2) = '乘') or
          (LeftStr(ryDic[i].Values['jtfs'], 2) = '步行') then
          s := s + '),' + ryDic[i].Values['jtfs']
        else
          s := s + '),驾驶' + ryDic[i].Values['jtfs'];
        if ryDic[i].Values['hphm'] <> '' then
          s := s + ',车牌号' + ryDic[i].Values['hphm'];
        s := s + '。';
      end;

      for i := 0 to ryDic.Keys.Count - 1 do
        s := s + '当事人' + ryDic[i].Values['xm'] + '负' + ryDic[i].Values
          ['zr'] + '责任;';
      s := copy(s, 1, Length(s) - 1) + '。';
    end;
  except
    on e: exception do
    begin
      gLogger.Error(e.Message);
      s := '';
    end;
  end;
  json.Free;
  for ryInfo in ryDic.Values do
    ryInfo.Free;
  ryDic.Free;
  Memo1.Text := s;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  stream: TMemoryStream;
  response: TStream;
  bytes: TBytes;
  token, s: String;
  ts: TStrings;
begin

  s := httpClient.Get
    (TIdURI.URLEncode
    ('http://127.0.0.1:17115/Login?user=250688&pwd=lgm1224,./'));
  token := TCommon.GetJsonNode('token', s);
  if token = '' then
  begin
    ShowMessage(TCommon.GetJsonNode('message', s));
    exit;
  end;

  ts := TStringList.Create;
  ts.Add(BitmapToString('E:\car_img.jpg'));

  stream := TMemoryStream.Create;
  try
    ts.SaveToStream(stream);
    response := TMemoryStream.Create();
    httpClient.Post
      ('http://127.0.0.1:17115/ANALYSISONEPIC?url=http://10.43.255.8:8090/aaaa.jpg&token='
      + token, stream, response);
    SetLength(bytes, response.Size);
    response.Seek(0, TSeekOrigin.soBeginning);
    response.ReadBuffer(bytes, response.Size);
    response.Free;
    // TEncoding.UTF8.GetString(bytes);
  except
    Caption := UTF8Decode(httpClient.ResponseText);
  end;
  stream.Free;
end;

function MergePic(tp1, tp2, saveTp: String): Boolean;
var
  jpg: TJPEGImage;
  img1, img2: TImageEnView;
  w, h: integer;
begin
  Result := True;
  try
    jpg := TJPEGImage.Create;
    jpg.LoadFromFile(tp1);
    w := jpg.width;
    h := jpg.height;
    jpg.Free;

    img1 := TImageEnView.Create(nil);
    img1.IO.LoadFromFileJpeg(tp1);
    img1.Bitmap.height := h * 2;
    img1.Bitmap.width := w;
    img1.IO.Bitmap.Canvas.Draw(0, 0, img1.Bitmap);
    img2 := TImageEnView.Create(nil);
    img2.IO.LoadFromFileJpeg(tp2);
    img1.IO.Bitmap.Canvas.Draw(0, h + 1, img2.Bitmap);
    img1.IO.SaveToFileJpeg(saveTp);
    img1.Free;
    img2.Free;
  except
    Result := False;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  json: TQJson;
  params: TStrings;
  i: integer;
  s: String;
begin
  s := '{"pzbh":"445100100600390","wslb":"3","ryfl":"1","jszh":"440583198401123199","fzjg":"粤U","zjcx":"A1","dsr":"林广铭",'
    + '"clfl":"1","hpzl":"02","hphm":"粤U99858","jtfs":"A01","wfsj":"2018-02-07 10:0:48","xzqh":"445100","wfdd":"20233","lddm":"20233","wfdz":"233省道",'
    + '"wfxw1":"2010","jsjqbj":"00","sgdj":"1","zqmj":"test02","fxjg":"445100000000","qzcslx":"1","klwpcfd":"kkk","zsxzqh":"445100","zsxxdz":"广东省潮州市湘桥区奎元北路34号一梯702",'
    + '"dh":"13509890999","jdcsyr":"林广铭","fdjh":"Y37725","syxz":"非营运","scz1":"0","bzz1":"0","wfxw2":"2008","scz2":"0","bzz2":"0"}';
  json := TQJson.Create;
  params := TStringList.Create;
  try
    json.Parse(s);
    for i := 0 to json.Count - 1 do
      params.Add(json.Items[i].Name + '=' + json.Items[i].value);
  except
    on e: exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  params: TStrings;
begin

  params := TStringList.Create;
  { params.Add('wfxw1=1234');
    // Params.Add('wfxw2=1234');
    // Params.Add('wfxw3=1234');
    params.Add('wfxw4=1235');
    params.Add('wfxw5=1237');
    TRmService.CheckForceParam(params);
    Memo1.Text := params.Text;

    params.Free; }
  params.LoadFromFile('d:\ss.txt');
  // THikDSJ.DecodefootHoldsResult(params.Text);

end;

procedure TForm1.DoHttpRequest(Action, tokenKey: String; params: TStrings;
  isExport: Boolean; AResponseInfo: TIdHTTPResponseInfo);
begin
  if TDBService.Actions.ContainsKey(Action) then
    TDBService.DoDB(Action, tokenKey, params, isExport, AResponseInfo)
  else if TSpService.Actions.Contains(',' + Action + ',') then
    TSpService.DoSP(Action, tokenKey, params, isExport, AResponseInfo)
  else if THikJZFService.Actions.Contains(',' + Action + ',') then
    THikJZFService.DoJZF(Action, tokenKey, params, AResponseInfo)
  else
    TRmService.DoRM(Action, tokenKey, params, isExport, AResponseInfo);
  if (AResponseInfo.ContentText = '') and (AResponseInfo.ContentStream = nil)
  then
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('action is not exists');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Timer1.Enabled := False;
  gLogger.logging('Service Stoped', 2);
  TCommon.ProgramDestroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  TCommon.ProgramInit;
  httpServer.Bindings.Clear;
  httpServer.DefaultPort := 17115;
  httpServer.Active := True;
  // Timer1.Interval := gConfig.HeartbeatInterval * 60000;
  // Timer1.Enabled := True;
  // gLogger.logging('Service Started', 2);

end;

procedure TForm1.httpServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  Action, token, valid: String;
  params: TStrings;
  i: integer;
  clientIP, s, yhbh: String;
  json: TQJson;
  isExport: Boolean;
begin
  Action := UpperCase(ARequestInfo.Document);
  isExport := LeftStr(Action, 8) = '/EXPORT/';
  while pos('/', Action) > 0 do
    Action := copy(Action, pos('/', Action) + 1, 100);
  clientIP := Trim(AContext.Connection.Socket.Binding.PeerIP);

  // s := ARequestInfo.UnparsedParams;
  s := TIdURI.URLDecode(ARequestInfo.UnparsedParams);

  AResponseInfo.ContentType := 'text/html';
  AResponseInfo.CharSet := 'utf-8';
  AResponseInfo.CustomHeaders.AddValue('Access-Control-Allow-Origin', '*');
  AResponseInfo.ContentText := '';
  token := '';

  params := TStringList.Create;
  params.Delimiter := '&';
  params.StrictDelimiter := True;
  try
    if UpperCase(ARequestInfo.Command) = 'POST' then
    begin
      if (s = '') and (ARequestInfo.PostStream <> nil) then
        s := TIdURI.URLDecode(TStringStream(ARequestInfo.PostStream)
          .DataString);
      if s = '' then
      begin
        gLogger.Error('PostStream is nil');
      end;
      json := TQJson.Create;
      try
        json.Parse(s);
        for i := 0 to json.Count - 1 do
          params.Add(json.Items[i].Name + '=' + json.Items[i].value);
      except
        on e: exception do
        begin
          gLogger.Error('[' + clientIP + ']' + ARequestInfo.Document + ' error '
            + e.Message);
          AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
            (e.Message);
          params.Free;
          json.Free;
          exit;
        end;
      end;
      json.Free;
    end
    else
      params.DelimitedText := s;

    for i := params.Count - 1 downto 0 do
    begin
      if UpperCase(params.Names[i]) = 'TOKEN' then
      begin
        // token := TIdURI.URLDecode(params.ValueFromIndex[i]);
        // token := HttpDecode(params.ValueFromIndex[i]);
        token := params.ValueFromIndex[i];
        params.Delete(i);
        continue;
      end;
      // if UpperCase(ARequestInfo.Command) <> 'POST' then
      // params[i] := HttpDecode(params[i]);
    end;

    if UpperCase(ARequestInfo.Command) = 'POST' then
      gLogger.Info('[' + clientIP + ']' + ARequestInfo.Document)
    else if Action = 'LOGIN' then // 不在日志中写密码
      gLogger.Info('[' + clientIP + ']' + ARequestInfo.Document + '?' +
        params.Values['user'])
    else
      gLogger.Info('[' + clientIP + ']' + ARequestInfo.Document + '?' +
        params.DelimitedText);

    if Action = 'LOGIN' then
    begin
      AResponseInfo.ContentText := TCommon.Login(clientIP, params, valid);
    end
    else if Action = 'WXLOGIN' then
    begin
      AResponseInfo.ContentText := TCommon.Login(clientIP, params, valid, True);
    end
    else
    begin
      if not gTokenManager.CheckToken(token, clientIP) then
      begin
        gLogger.Error('[' + clientIP + ']' + ARequestInfo.Document +
          ' invalid token');
        AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
          ('invalid token');
        yhbh := '';
        valid := '0';
      end
      else
      begin
        yhbh := gTokenManager.GetToken(token).Login;
        DoHttpRequest(Action, token, params, isExport, AResponseInfo);
        valid := '1';
      end;
    end;
  except
    on e: exception do
    begin
      gLogger.Error('[' + clientIP + ']' + ARequestInfo.Document + ' error ' +
        e.Message);
      AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult(e.Message);
    end;
  end;
  {
    if Action = 'LOGIN' then
    TCommon.SaveQtzLog(token, yhbh, clientIP, ARequestInfo.Document,
    params.Values['user'], valid, params.Values['id'])
    else if (TCommon.SaUsers.IndexOf(yhbh) < 0) then
    // 后台访问的日志太多，不用记录, post数据太长，去掉参数
    begin
    if UpperCase(ARequestInfo.Command) = 'POST' then
    s := ''
    else
    s := params.DelimitedText;
    //TCommon.SaveQtzLog(token, yhbh, clientIP, ARequestInfo.Document, s, valid);
    end;
  }
  gLogger.Info('[' + clientIP + ']' + ARequestInfo.Document + ' OK');
  params.Free;
end;

procedure TForm1.httpServerCreatePostStream(AContext: TIdContext;
  AHeaders: TIdHeaderList; var VPostStream: TStream);
begin
  VPostStream := TStringStream.Create;
end;

end.
