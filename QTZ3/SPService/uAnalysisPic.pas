unit uAnalysisPic;

interface

uses
  SysUtils, Classes, uGlobal, uCommon, uHik, IdCustomHTTPServer;

type
  TAnalysisPic = Class
  private
    class var FPicName: String;
    class function SavePicAndGetUrl(ABase64Str: String): String;
  public
    class procedure AnalysisPic(AUrl, APic: String;
      AResponseInfo: TIdHTTPResponseInfo); static;
  end;

implementation

{ TAnalysisPic }

class procedure TAnalysisPic.AnalysisPic(AUrl, APic: String;
  AResponseInfo: TIdHTTPResponseInfo);
var
  url: String;
begin
  FPicName := '';
  if AUrl <> '' then
    url := AUrl
  else if APic <> '' then
    url := SavePicAndGetUrl(APic)
  else
  begin
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('parameter error');
    exit;
  end;

  if url <> '' then
    AResponseInfo.ContentText := TCommon.AssembleSuccessHttpResult
      (THik.DFAnalysisOnePic(url))
  else
    AResponseInfo.ContentText := TCommon.AssembleFailedHttpResult
      ('base64 string error');
  if (FPicName <> '') and FileExists(gConfig.HttpPath + FPicName) then
    DeleteFile(gConfig.HttpPath + FPicName);
end;

class function TAnalysisPic.SavePicAndGetUrl(ABase64Str: String): String;
begin
  inherited;
  Result := '';
  if (gConfig.HttpPath = '') or (gConfig.HttpHome = '') then
    exit;
  FPicName := FormatDatetime('yyyymmddhhnnsszzz', Now) + '.jpg';
  if TCommon.Base64ToFile(ABase64Str, gConfig.HttpPath + FPicName) and
    FileExists(gConfig.HttpPath + FPicName) then
    Result := gConfig.HttpHome + FPicName;
end;

end.
