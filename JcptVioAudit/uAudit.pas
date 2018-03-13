unit uAudit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, FireDAC.Comp.Client, FireDAC.Stan.Option,
  FireDAC.Stan.Def, Winapi.WinInet,
  FireDAC.DApt, FireDAC.Stan.Async, FireDAC.Stan.Expr, FireDAC.Stan.Pool,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, acWebBrowser,
  Vcl.StdCtrls, sGroupBox, Vcl.ComCtrls, sPageControl, Vcl.Buttons,
  sSpeedButton, Vcl.ExtCtrls, sPanel, uCommon, FireDAC.Phys.OracleDef,
  FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, StrUtils, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet;

type
  TfrmAudit = class(TForm)
    spnl1: TsPanel;
    btn5: TsSpeedButton;
    btnReCheck: TsSpeedButton;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    gbWebCaption: TsGroupBox;
    webtrff: TsWebBrowser;
    stbshtSH: TsTabSheet;
    fdphysrcldrvrlnk1: TFDPhysOracleDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Timer1: TTimer;
    wbSJFH: TsWebBrowser;
    FOraQuery: TFDQuery;
    FOraConn: TFDConnection;
    procedure FormCreate(Sender: TObject);
    procedure btnReCheckClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    zt: Boolean;
  public
    { Public declarations }
  end;

var
  frmAudit: TfrmAudit;

implementation

{$R *.dfm}

function EnumChildWndProc1(AhWnd: LongInt; AlParam: lParam): Boolean; stdcall;
var
  WndClassName: array [0 .. 254] of Char;
  WndCaption: array [0 .. 254] of Char;
begin
  GetClassName(AhWnd, WndClassName, 254);
  GetWindowText(AhWnd, WndCaption, 254);

  if (string(WndClassName) = 'Button') and (string(WndCaption) = '取消') then
  begin
    SendMessage(AhWnd, WM_LBUTTONDOWN, 0, 0);
    SendMessage(AhWnd, WM_LBUTTONUP, 0, 0);
  end;
  if (string(WndClassName) = 'Button') and (LeftStr(string(WndCaption), 1) = '是')
  then
  begin
    SendMessage(AhWnd, WM_LBUTTONDOWN, 0, 0);
    SendMessage(AhWnd, WM_LBUTTONUP, 0, 0);
  end;
  result := true;
end;

procedure TfrmAudit.btn5Click(Sender: TObject);
begin
  zt := False;
  sPageControl1.ActivePageIndex := 0;
  // Timer1.Enabled := False;
end;

procedure TfrmAudit.btnReCheckClick(Sender: TObject);
var
  i: Integer;
  Url: string;
begin
  try
    zt := true;
    // Timer1.Enabled := true;
    sPageControl1.ActivePageIndex := 1;
    with FOraQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select XH from VIO_SURVEIL_SCREEN');

      if not FOraConn.Connected then
        FOraConn.Open;
      Open;
      //showmessage(RecordCount.ToString);
      DisableControls;
      while not eof do
      begin
        if not zt then
          Break;
        try
          Url := 'http://10.46.177.134:9080/rmweb/screen.vio?method=detail&xh='
            + Fields[0].AsString;
          wbSJFH.Navigate(Url);

          for i := 0 to 6 do
          begin
            Sleep(500);
            Application.ProcessMessages;
          end;
          wbSJFH.OleObject.document.parentWindow.save();
          for i := 0 to 20 do
          begin
            Sleep(50);
            Application.ProcessMessages;
          end;
        except
          on e: exception do
            showmessage(e.Message);
        end;
        Next;
      end;
      Close;
    end;
  except
    on e: exception do
      showmessage(e.Message);
  end;
  sPageControl1.ActivePageIndex := 0;
  // Timer1.Enabled := False;
end;

procedure TfrmAudit.FormCreate(Sender: TObject);
begin
  sPageControl1.ActivePageIndex := 0;
  oraConfig.Host := '10.46.177.137';
  oraConfig.Port := '1521';
  oraConfig.User := 'rm';
  oraConfig.Password := 'rm';
  oraConfig.DbName := 'orcl';

  FOraConn.FetchOptions.Mode := fmAll;
  FOraConn.Params.Clear;
  FOraConn.Params.Add('DriverID=Ora');
  FOraConn.Params.Add
    (Format('Database=(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = %s)(PORT = %s)))'
    + '(CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = %s)))',
    [oraConfig.Host, oraConfig.Port, oraConfig.DbName]));
  FOraConn.Params.Add(Format('User_Name=%s', [oraConfig.User]));
  FOraConn.Params.Add(Format('Password=%s', [oraConfig.Password]));
  FOraConn.Params.Add('CharacterSet=UTF8'); // 否则中文乱码
  FOraConn.LoginPrompt := False;
  FOraConn.Connected := true;

  if InternetCheckConnection('http://10.46.177.134:9080/rmweb/', 1, 0) then
  begin
    try
      webtrff.Silent := true;
      webtrff.Navigate('http://10.46.177.134:9080/rmweb/');
    except
    end;
  end;
end;

procedure TfrmAudit.Timer1Timer(Sender: TObject);
var
  hweb: HWND;
begin
  hweb := FindWindow(nil, '来自网页的消息');
  if hweb > 0 then
    EnumChildWindows(hweb, @EnumChildWndProc1, 0);
  hweb := FindWindow(nil, 'Windows Internet Explorer');
  if hweb > 0 then
    EnumChildWindows(hweb, @EnumChildWndProc1, 0);
end;

end.
