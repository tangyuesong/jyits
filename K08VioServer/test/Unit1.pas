unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uCommon, uGlobal,
  uPilotsafebeltThread;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  gLogger.Info('Service Stop');
  TCommon.ProgramDestroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TCommon.ProgramInit;
  gLogger.Info('Service Start');
  TPilotsafebeltThread.Create;
  // TNoEntryThread.Create;
end;

end.
