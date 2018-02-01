unit uFormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, IOUtils,
  IniFiles, Generics.Collections, uLogCheck, Vcl.StdCtrls, TypInfo, MessageDigest_5,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdIPWatch,
  Web.HTTPApp, System.Types;

type
  TForm2 = class(TForm)
    gridLog: TStringGrid;
    Panel1: TPanel;
    Button1: TButton;
    Timer1: TTimer;
    IdHTTP1: TIdHTTP;
    Button2: TButton;
    IdIPWatch1: TIdIPWatch;
    Button3: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure gridLogDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FSmsUrl, FSJHM: string;
    procedure InitLogCheck;
    function GetLogCheckList: TList<TLogCheck>;
    procedure ReadConfig;
    procedure WriteConfig;
    //procedure SendMsg(msg: string);
    procedure CheckDiskSpace;
    procedure CheckLog;
    procedure ResetLogResult;
    procedure SendSMS(sj, content: string);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  timer1.Enabled := not timer1.Enabled;
  if timer1.Enabled then
  begin
    button1.Caption := 'Stop';
    Timer1Timer(nil);
  end
  else
    button1.Caption := 'Start';
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  i: integer;
  lc: TLogCheck;
  s: string;
begin
  for i := 1 to gridLog.RowCount - 1 do
  begin
    if gridLog.Cells[1, i] <> '' then
    begin
      lc := TLogCheck.Create;
      lc.ID := i;
      lc.AppName := gridLog.Cells[1, i];
      lc.LogFile := gridLog.Cells[2, i];
      lc.ThreadIDs := gridLog.Cells[3, i];
      lc.TimeOut := strtointdef(gridLog.Cells[4, i], 10);
      s := lc.GetThreads;
      if s <> ' ' then
        gridLog.Cells[3, i] := s;
      lc.Free;
    end;
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  CheckDiskSpace;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  InitLogCheck;
end;

function TForm2.GetLogCheckList: TList<TLogCheck>;
var
  i: integer;
  lc: TLogCheck;
begin
  result := TList<TLogCheck>.Create;
  for i := 1 to gridLog.RowCount - 1 do
  begin
    if gridLog.Cells[1, i] <> '' then
    begin
      lc := TLogCheck.Create;
      lc.ID := i;
      lc.AppName := gridLog.Cells[1, i];
      lc.LogFile := gridLog.Cells[2, i];
      lc.ThreadIDs := gridLog.Cells[3, i];
      lc.TimeOut := strtointdef(gridLog.Cells[4, i], 10);
      result.Add(lc);
    end;
  end;
end;

procedure TForm2.ResetLogResult;
var
  i: integer;
begin
  for i := 1 to gridLog.RowCount - 1 do
  begin
    if gridLog.Cells[1, i] <> '' then
    begin
      gridLog.Cells[5, i] := 'CR_OK';
    end;
  end;
end;

procedure TForm2.gridLogDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  {if (ACol = 5) and (ARow > 0) and (gridLog.Cells[ACol, ARow] <> '') then
  begin
    if gridLog.Cells[ACol, ARow] = 'CR_OK' then
      gridLog.Canvas.Brush.Color := clBlack
    else
      gridLog.Canvas.Brush.Color := clRed;
    gridLog.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, gridLog.Cells[ACol, ARow]);
    gridLog.Canvas.FillRect(Rect);
  end;       }
end;

procedure TForm2.InitLogCheck;
begin
  gridLog.Cells[1, 0] := 'Name';
  gridLog.Cells[2, 0] := 'LogFile';
  gridLog.Cells[3, 0] := 'ThreadID';
  gridLog.Cells[4, 0] := 'TimeOut';
  gridLog.Cells[5, 0] := 'Status';
  gridLog.Cells[6, 0] := 'CheckTime';

  gridLog.ColWidths[0] := 30;
  gridLog.ColWidths[1] := 120;
  gridLog.ColWidths[2] := 300;
  gridLog.ColWidths[3] := 300;
  gridLog.ColWidths[4] := 120;
  gridLog.ColWidths[5] := 200;
  gridLog.ColWidths[6] := 120;

  ReadConfig;
end;

procedure TForm2.ReadConfig;
var
  ini: TIniFile;
  sections: TStrings;
  section: string;
  i: integer;
begin
  sections := TStringList.Create;
  ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  FSMSUrl := ini.ReadString('sys', 'SMSURL', 'http://10.46.137.83:8081/SMS/Send?token=%s&mobiles=%s&content=%s');
  FSJHM := ini.ReadString('sys', 'SJHM', '13760707350');
  ini.ReadSections(sections);
  i := 0;
  for section in sections do
  begin
    if section <> 'sys' then
    begin
      inc(i);
      gridLog.Cells[1, i] := section;
      gridLog.Cells[2, i] := ini.ReadString(section, 'LogFile', '');
      gridLog.Cells[3, i] := ini.ReadString(section, 'ThreadIDs', '');
      gridLog.Cells[4, i] := ini.ReadString(section, 'TimeOut', '10');
      gridLog.Cells[5, i] := '';
    end;
  end;
  ini.Free;
  sections.Free;
end;

procedure TForm2.CheckDiskSpace;
  procedure Check(ip: string; driver: string);
  var
    free, total, totalFree: Int64;
    msg: string;
  begin
    free := 0;
    total := 0;
    GetDiskFreeSpaceEx(PWideChar(driver), free, total, @totalFree);
    if (free > 0) and (free * 100 / total < 5) then
    begin
      msg := Format('Disk free space warning [%s][%s] %f/%f GB',
        [ip, driver, free/1024/1024/1024, total/1024/1024/1024]);
      memo1.Lines.Add(msg);
      SendSMS(FSJHM, msg);
    end;
  end;
var
  ip: string;
begin
  memo1.Clear;
  try
    ip := idIPWatch1.LocalIP;
    Check(ip, 'C:');
    Check(ip, 'D:');
    Check(ip, 'E:');
    Check(ip, 'F:');
    Check(ip, 'G:');
    Check(ip, 'H:');
    Check(ip, 'I:');
    Check(ip, 'J:');
    Check(ip, 'K:');
  finally

  end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  CheckLog;
  CheckDiskSpace;
end;

procedure TForm2.CheckLog;
var
  lc: TLogCheck;
  ret: TLogCheckResult;
  list: TList<TLogCheck>;
  retName: string;
begin
  if StrToInt(FormatDateTime('nn', now)) div 5 = 0 then
    ResetLogResult;
  WriteConfig;
  list := GetLogCheckList;
  for lc in list do
  begin
    ret := lc.Check;
    retName := GetEnumName(TypeInfo(TLogCheckResult), Ord(ret));
    if gridLog.Cells[5, lc.ID] <> retName then
    begin
      SendSMS(FSJHM, '[' + lc.AppName + ']' + retName);
    end;
    gridLog.Cells[5, lc.ID] := retName;
    gridLog.Cells[6, lc.ID] := FormatDateTime('hh:nn:ss', now);
    lc.Free;
  end;
  list.Free;
end;
{
procedure TForm2.SendMsg(msg: string);
begin
  try
    idHttp1.Get('http://10.43.255.8:10098/SendMsg/wxPush?type=3&msg=' + msg);
  except
    on e: exception do
      gridLog.Cells[6, 10] := e.Message;
  end;
end;  }

procedure TForm2.SendSMS(sj, content: string);
  function GetToken: string;
  var
    md5: IMD5;
    s: string;
  begin
    s := formatdatetime('yymmdd', now) + '*echotech';
    md5 := GetMD5;
    md5.Init;
    md5.Update(TByteDynArray(RawByteString(s)), length(s));
    result := md5.AsString.ToLower;
  end;
var
  token, url: string;
  http: TIdHttp;
  stream: TStream;
begin
  if FSmsUrl <> '' then
  begin
    token := getToken;
    url := Format(FSmsUrl, [token, sj, HTTPEncode(content)]);
    http := TIdHttp.Create(nil);
    http.ConnectTimeout := 5000;
    http.ReadTimeout := 5000;
    stream := TMemoryStream.Create;
    try
      http.Post(url, stream);
    except
      on e: exception do
      begin

      end;
    end;
    http.Free;
    stream.Free;
  end;
end;

procedure TForm2.WriteConfig;
var
  ini: TIniFile;
  section, path: string;
  i: integer;
begin
  path := ExtractFilePath(ParamStr(0)) + 'config.ini';
  if TFile.Exists(path) then
    TFile.Delete(path);
  ini := TIniFile.Create(path);
  for i := 1 to gridLog.RowCount - 1 do
  begin
    section := gridLog.Cells[1, i];
    if section <> '' then
    begin
      ini.WriteString(section, 'LogFile', gridLog.Cells[2, i]);
      ini.WriteString(section, 'ThreadIDs', gridLog.Cells[3, i]);
      ini.WriteString(section, 'TimeOut', gridLog.Cells[4, i]);
    end;
  end;
  ini.Free;
end;

end.
