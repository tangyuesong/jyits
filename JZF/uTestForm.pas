unit uTestForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Ehlservice;

type
  TForm3 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
var
  soap: EHLServiceSoap;
  s: string;
begin
  soap := Ehlservice.GetEHLServiceSoap();
  s := soap.queryObjectOut('02C26','440005171207000222','<?xml version="1.0" encoding="GBK"?><root><QueryCondition><sfzmhm>430611198109134511</sfzmhm></QueryCondition></root>');
  showmessage(s);
  soap := nil;
end;

end.
