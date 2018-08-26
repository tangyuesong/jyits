unit uMap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JsProcessor, cef.JsExtented,
  cefvcl, uDM, Vcl.ExtCtrls, LatLngHelper, uGlobal, uEntity, HeatmapItem;

type
  TFrameMap = class(TdxDialogBaseFrame)
    Chromium1: TChromium;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    FJsProcessor: TJsProcessor;
    FJsExtended: TNCJsExtended;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    procedure ClearMarkers;
    procedure CreateMarker(lng, lat: Double; icon, info, id: WideString);
    procedure SetCenter(lng, lat: Double; zoom: Integer);
  end;

implementation

{$R *.dfm}

{ TFrameMap }

procedure TFrameMap.AfterConstruction;
begin
  inherited;
  FJsProcessor := TJsProcessor.Create();
  FJsExtended := TNCJsExtended.Create(Self);
  FJsExtended.SetProcessObject(FJsProcessor, TypeInfo(TJsProcessor));
  FJsExtended.Chromium := self.Chromium1;
end;

procedure TFrameMap.BeforeDestruction;
begin
  inherited;
  FJsExtended.Free;
  FJsProcessor.Free;
end;

procedure TFrameMap.clearMarkers;
var
  script:WideString;
begin
  script := 'clearMarkers()';
  FJsExtended.ExecuteJavaScript(script,'',0);
end;

procedure TFrameMap.createMarker(lng,lat: Double; icon, info,id: WideString);
var
  script:WideString;
begin
   script := Format('addMarker(%.12f, %.12f,"%s","%s","%s")',[lng,lat,icon,info,id]);
   FJsExtended.ExecuteJavaScript(script,'',0);
end;

procedure TFrameMap.setCenter(lng,lat: Double; zoom: Integer);
var
  script:WideString;
begin
  script := Format('setCenter(%.12f, %.12f,%d)',[lng,lat,zoom]);
  FJsExtended.ExecuteJavaScript(script,'',0);
end;

procedure TFrameMap.Timer1Timer(Sender: TObject);
begin
  Chromium1.Load(gSetup.MapUrl);
  Timer1.Enabled := false;
end;

end.
