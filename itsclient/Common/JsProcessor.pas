unit JsProcessor;

interface

uses
  Winapi.Windows, System.SysUtils, Winapi.Messages, vcl.forms, System.Classes;

type
  TJsProcessor = class
  public
    function showMsg(id: String; Msg: String): string;
  end;

implementation
uses uFrameDevicePic;
function TJsProcessor.showMsg(id: String; Msg: String): string;
begin
  FrameDevicePic.SBBH := id;
  FrameDevicePic.dxLayoutGroup1.CaptionOptions.Text := Msg;
  FrameDevicePic.Show;
  result := '';
end;

end.
