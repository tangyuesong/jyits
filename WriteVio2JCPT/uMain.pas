unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, IdURI, System.NetEncoding, uLogger,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.ExtDlgs, uJCPT;

type
  TfrmMain = class(TForm)
    Button9: TButton;
    edtSBBH: TEdit;
    Label8: TLabel;
    edtResult: TEdit;
    Label1: TLabel;
    edtPic: TEdit;
    Label2: TLabel;
    picDialog: TOpenPictureDialog;
    edtZqmj: TEdit;
    Label3: TLabel;
    edtClfl: TEdit;
    Label4: TLabel;
    Label9: TLabel;
    edtHpzl: TEdit;
    edtHphm: TEdit;
    Label10: TLabel;
    edtXzqh: TEdit;
    Label11: TLabel;
    edtWfdd: TEdit;
    Label12: TLabel;
    edtlddm: TEdit;
    Label13: TLabel;
    edtDdms: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtWfdz: TEdit;
    Label16: TLabel;
    edtWfsj: TEdit;
    Label17: TLabel;
    edtWfxw: TEdit;
    Label5: TLabel;
    edtScz: TEdit;
    Label6: TLabel;
    edtBzz: TEdit;
    procedure edtPicClick(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    function GetPicBase64Str(picName: String): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button9Click(Sender: TObject);
var
  ts: TStrings;
begin
  ts := TStringList.Create;
  ts.Add('sbbh=' + edtSBBH.Text);
  if edtZqmj.Text <> '' then
    ts.Add('zqmj=' + edtZqmj.Text);
  if edtClfl.Text <> '' then
    ts.Add('clfl=' + edtClfl.Text);
  if edtHpzl.Text <> '' then
    ts.Add('hpzl=' + edtHpzl.Text);
  if edtHphm.Text <> '' then
    ts.Add('hphm=' + edtHphm.Text);
  if edtXzqh.Text <> '' then
    ts.Add('xzqh=' + edtXzqh.Text);
  if edtWfdd.Text <> '' then
    ts.Add('wfdd=' + edtWfdd.Text);
  if edtlddm.Text <> '' then
    ts.Add('lddm=' + edtlddm.Text);
  if edtDdms.Text <> '' then
    ts.Add('ddms=' + edtDdms.Text);
  if edtWfdz.Text <> '' then
    ts.Add('wfdz=' + edtWfdz.Text);
  if edtWfsj.Text <> '' then
    ts.Add('wfsj=' + edtWfsj.Text);
  if edtWfxw.Text <> '' then
    ts.Add('wfxw=' + edtWfxw.Text);
  if edtScz.Text <> '' then
    ts.Add('scz=' + edtScz.Text);
  if edtBzz.Text <> '' then
    ts.Add('bzz=' + edtBzz.Text);
  ts.Add('zpsl=1');
  ts.Add('zpstr1=' + GetPicBase64Str(edtPic.Text));
  edtResult.Text := TRmService.DoRminf('surscreen', ts);
  ts.Free;
end;

procedure TfrmMain.edtPicClick(Sender: TObject);
begin
  if self.picDialog.Execute then
    edtPic.Text := self.picDialog.FileName;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  logger := TLogger.Create(ExtractFilePath(Paramstr(0)) + '\test.log');
  edtWfsj.Text := FormatDatetime('yyyy-mm-dd hh:nn:ss', now() - 1);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  logger.Free;
end;

function TfrmMain.GetPicBase64Str(picName: String): String;
var
  ms: TMemoryStream;
  ss: TStringStream;
begin
  try
    ms := TMemoryStream.Create;
    ms.LoadFromFile(picName);
    ss := TStringStream.Create;
    ms.Position := 0;
    TBase64Encoding.Base64.Encode(ms, ss);
    Result := ss.DataString;
  finally
    ms.Free;
    ss.Free;
  end;
end;

end.
