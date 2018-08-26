unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, uHBCVioThread, uCommon,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uUploadVio;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  // TUploadVioThread.Create(False);
  THBCVioThread.Create;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TCommon.ProgramInit;

end;

end.
