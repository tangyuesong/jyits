unit UnitFrameCustom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sFrameAdapter;

type
  TCustomInfoFrame = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
  protected
    InInit: boolean;
  public
    procedure AfterCreation; virtual;
    procedure BeforeSkinChange; virtual;
    procedure SkinActiveChanged; virtual;
  end;

implementation

uses uMain;

{$R *.dfm}

{ TCustomInfoFrame }

procedure TCustomInfoFrame.AfterCreation;
begin

end;

procedure TCustomInfoFrame.BeforeSkinChange;
begin

end;

procedure TCustomInfoFrame.SkinActiveChanged;
begin

end;

end.
