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
    IdHTTPServer1: TIdHTTPServer;
    Timer1: TTimer;
    edtKDBH: TEdit;
    Label1: TLabel;
    edtFXLX: TEdit;
    Label2: TLabel;
    edtCDH: TEdit;
    Label3: TLabel;
    edtHPHM: TEdit;
    Label4: TLabel;
    edtHPZL: TEdit;
    Label5: TLabel;
    edtGCSJ: TEdit;
    Label6: TLabel;
    edtTP1: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtHPYS: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FDbService: TDbService;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses uTrans;
{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  TTrans.WriteVehicleInfo(edtKDBH.Text,edtFXLX.Text,strtointdef(edtCDH.Text,1),
    edtHPHM.Text,edtHPZL.Text, edtGCSJ.Text,
    0,0,'1',5,edtHPYS.Text,'','','','','','','','',edtTP1.Text,'','','');
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  TCommon.ProgramInit;
  edtGCSJ.Text := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  TCommon.ProgramDestroy;
end;

end.
