unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IOUtils, Vcl.StdCtrls,
  FireDAC.Phys.OracleDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle;

type
  TForm9 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form9: TForm9;

implementation

uses
  uCommon, uTaskManager;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  uCommon.Initialize;
  TaskManager := TTaskManager.Create;
  TaskManager.CreateThreads;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  TaskManager.Free;
  uCommon.Finalizat;
end;

end.
