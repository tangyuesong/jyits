unit uJCPT;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.NetEncoding, uRmInf;

type

  TRmService = class
  private
    class function ParamsToJson(UnparsedParams: string;
      exceptName: string = ''): string;
    class function Base64ToFile(ABase64Str, AFileName: String): Boolean; static;
  public
    class function DoRminf(action: String; Params: TStrings): String;
  end;

implementation

{ TRmService }

class function TRmService.Base64ToFile(ABase64Str, AFileName: String): Boolean;
var
  bytes: TBytes;
  ms: TMemoryStream;
begin
  result := True;
  ms := TMemoryStream.Create;
  try
    bytes := TBase64Encoding.Base64.DecodeStringToBytes(ABase64Str);
    ms.WriteBuffer(bytes, length(bytes));
    ms.SaveToFile(AFileName);
  except
    result := false;
  end;
  ms.Free;
end;

class function TRmService.DoRminf(action: String; Params: TStrings): String;
var
  json: string;
begin
  result := '';
  action := LowerCase(action);
  json := ParamsToJson(Params.DelimitedText);

  if Params.Values['zpstr1'] <> '' then
  begin
    Base64ToFile(Params.Values['zpstr1'], 'd:\a.jpg');
    Params.SaveToFile('d:\b.txt');
  end;

  if action = 'surscreen' then
    result := TRminf.surscreen(json)
end;

class function TRmService.ParamsToJson(UnparsedParams,
  exceptName: string): string;
var
  Params: TStrings;
  first: Boolean;
  i: integer;
begin
  Params := TStringList.Create;
  Params.DelimitedText := UnparsedParams;
  first := True;
  result := '{';
  exceptName := exceptName.ToLower;
  for i := 0 to Params.Count - 1 do
  begin
    if (not exceptName.Contains(',' + Params.Names[i].ToLower + ',')) and
      (Params.Names[i] <> '') and (Params.ValueFromIndex[i] <> '') then
    begin
      if first then
      begin
        result := result + '"' + Params.Names[i].ToLower + '":"' +
          Params.ValueFromIndex[i] + '"';
        first := false;
      end
      else
        result := result + ',"' + Params.Names[i].ToLower + '":"' +
          Params.ValueFromIndex[i] + '"';
    end;
  end;
  result := result + '}';
  Params.Free;
end;

end.
