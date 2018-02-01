unit uPrompt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,acPNG, Vcl.Dialogs, Vcl.ExtCtrls, acImage, sPanel,
  Vcl.StdCtrls, sLabel,
  {$IFDEF WEBXONE}
  wxoExec,
  {$ENDIF}
  Vcl.WinXCtrls;

type
  TFrmPrompt = class(TForm)
    spnl1: TsPanel;
    spnl2: TsPanel;
    imgLogo: TsImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrompt: TFrmPrompt;

implementation

{$R *.dfm}

procedure TFrmPrompt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  FrmPrompt:=nil;
end;

procedure TFrmPrompt.FormCreate(Sender: TObject);
begin
 {$IFNDEF WEBXONE}
 Self.Position:= poMainFormCenter;
 {$ELSE}
 // SetWindowLong(Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);
 {$ENDIF}
end;

procedure TFrmPrompt.FormShow(Sender: TObject);
begin
  {$IFDEF WEBXONE}
 // SetWindowLong(Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);
  {$ENDIF}
end;

end.
