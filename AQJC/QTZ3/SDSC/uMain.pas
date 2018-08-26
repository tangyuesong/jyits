unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, uTmri, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  uCommon, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  json: String;
  tmriParam: TTmriParam;
begin
  if ComboBox1.ItemIndex = 1 then
    tmriParam.jkid := '04C55'
  else
    tmriParam.jkid := '04C54';
  tmriParam.yhbz := Edit2.Text;
  tmriParam.dwmc := Edit3.Text;
  tmriParam.dwjgdm := Edit4.Text;
  tmriParam.yhxm := Edit5.Text;
  tmriParam.zdbs := Edit6.Text;

  json := Memo1.Text;
  json := TTmri.Write(tmriParam, json);

  showmessage(json);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TCommon.ProgramInit;
end;

end.
