unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, IdContext,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, uDBService,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, uGlobal, uRmService,
  Soap.EncdDecd, IdURI, IdHeaderList, uHik, uCommon, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    IdHTTP1: TIdHTTP;
    Button2: TButton;
    Button3: TButton;
    IdHTTPServer1: TIdHTTPServer;
    Timer1: TTimer;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FDbService: TDbService;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
var
  s, v: string;
  hphm, params: string;
begin
  // v := 'WriteVio?vio='+EncodeString('[{"sysid":"{3944540C-4584-4CA8-A78E-E5D05D4F630A}","xh":"","cjjg":"445100000000","clfl":"3","hphm":"粤VSH246","hpzl":"02","jdcsyr":"张少海","syxz":"A",'
  // +'"fdjh":"3419260","clsbdh":"LVSHCADB6DE408123","csys":"A","clpp":"福克斯牌","jtfs":"K33","fzjg":"粤V","zsxzqh":"","zsxxdz":"空","dh":"","lxfs":"","sj":"2017-03-29 09:19:31","wfsj":"2017-03-29 09:19",'
  // +'"wfxw":"1352A","zqmj":"","spdz":"","FWQDZ":"http://10.43.255.22:8090/201703/29/1002737/","xp1":"1002737201703290919312542_1.jpg","xp2":"","xp3":"","bzz":"60","scz":"71","flag":"","wfdd":"60755",'
  // +'"wfdz":"X086铁汫线K12+000出城(区间测速)","xzqh":"445101","ddms":"0","lddm":"1002","sbbh":"445100000000070001","cjfs":"7","tpzl":"100","tpw":"0","tph":"0","bzz":"60","LHY_WFDD_1":"60755","LHY_DDMS_1":"0","LHY_LDDM_1":"1004"}]');
  // s := TIdURI.URLEncode('http://127.0.0.1:20088/' + v);
  // s := IdHTTP1.Get('http://127.0.0.1:20086/GetK08VehInfo?hphm=粤A6DY67&hpzl=02');
  // s := IdHTTP1.Get('http://10.43.255.22:20086/GetK08VehInfo?hphm=粤A6DY67&hpzl=02');
  // hphm:= EncodeString('粤A6DY67');
  // s := IdHTTP1.Get
  // ('http://127.0.0.1:20086/GetK08PassList?hphm=粤A6DY67&hpzl=02&kssj=2017-04-02T18:00:00.000Z'
  // + '&jssj=2017-05-07T19:58:00.999Z&page=1&pagesize=30');

  s := IdHTTP1.Get
    (TIdURI.URLEncode
    ('http://127.0.0.1:20086/Login?user=admin&pwd=064A4095B75E10D0843241580D69B33E')
    );

 //s:= 'http://10.43.255.8:10088/Query?jkid=04C03&hpzl=02&hphm=粤U99858'
 //s:= 'http://10.43.255.8:10088/GetVehInfo?hpzl=02&hphm=粤U99858'
 s:= 'http://127.0.0.1:20086/UploadVio?systemid=02F40C2A-34EF-43BC-ADB2-BF754B6A87B8'
 +'&token='+s;
   s := IdHTTP1.Get(TIdURI.URLEncode(s));

  // s := IdHTTP1.Get
  /// (TIdURI.URLEncode
  // ('http://127.0.0.1:20086/GetK08VehInfo?hphm=粤A6DY67&hpzl=02'));

  // s := IdHTTP1.Get
  // ('http://127.0.0.1:20086/GetK08VehInfo?hphm=粤A6DY67&hpzl=02');
  // s := IdHTTP1.Get(TIdURI.URLEncode('http://127.0.0.1:20088/WriteVio?vio='+EncodeString(s)));

  Memo1.Text := s;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
var
  http: TIdHTTP;
  response: TStringStream;
  requestStream: TStringStream;
  responseStr: String;
begin
  http := TIdHTTP.Create(nil);
  response := TStringStream.Create('');
  requestStream := TStringStream.Create('');
  requestStream.WriteString('hphm=粤A6DY67&hpzl=02');
  try
    http.Post('http://127.0.0.1:20086/GetK08VehInfo', requestStream, response);
    Memo1.Text := response.DataString;
    // responseStr := UTF8Decode(responseStr)
  except
    // AResult := http.ResponseText;
  end;
  requestStream.Free;
  response.Free;
  http.Disconnect;
  http.Free;

end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  http: TIdHTTP;
  stream: TMemoryStream;
  response: TStringStream;
  AParams: TStrings;
begin
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // FDbService := TDbService.Create;
  // RmService := TRmService.Create;
  TCommon.ProgramInit;
  DbService := TDbService.Create;
  RmService := TRmService.Create;
  Timer1.Interval := gHeartbeatInterval * 60000;
  Timer1.Enabled := True;
  // Timer1Timer(nil);
  gLogger.logging('Service Started', 2);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  // FDbService.Free;
  // RmService.Free;
  Timer1.Enabled := False;
  DbService.Free;
  RmService.Free;
  gLogger.logging('Service Stoped', 2);
  TCommon.ProgramDestroy;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  response: TStringStream;
  requestStream: TStringStream;
begin
  response := TStringStream.Create('');
  requestStream := TStringStream.Create('');
  requestStream.WriteString('ServiceName=ItsQTZService');
  try
    IdHTTP1.Post(gHeartbeatUrl + 'ServiceHeartbeat', requestStream, response);
  except
  end;
  requestStream.Free;
  response.Free;
end;

end.
