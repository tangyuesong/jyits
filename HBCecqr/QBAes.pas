//
//---------------------------------------------------------------
//                                                               
//                                                               
//    QuickBurro Middleware Application Development Package      
//                                                               
//    Version 4.01                                               
//    Update Date: 2011.5.25.                                    
//    Author: Jopher(W.G.Z.)                                     
//    QQ: 779545524                                              
//    Email: Jopher@189.cn  or wpy020327@163.com  
//    Homepage: http://www.jopher.net/               
//                                                               
//    Copyright(C) Jopher Software Studio. All rights reserved   
//                                                               
//                                                               
//---------------------------------------------------------------
//

unit QBAES;

interface

uses
  SysUtils, Classes, windows, Math,
{$IFDEF UNICODE}
AnsiStrings,
{$ENDIF}
  ElAES;

function AesEncrypt(Value: AnsiString; Key: AnsiString): AnsiString;
function AesDecrypt(Value: AnsiString; Key: AnsiString): AnsiString;

implementation

function StrToHex(Value: AnsiString): AnsiString;
var
  I: Integer;
begin
  result:='';
  for I := 1 to Length(Value) do
    result := result + AnsiString(IntToHex(Ord(Value[i]), 2));
end;

function HexToStr(Value: AnsiString): AnsiString;
var
  I: Integer;
  x: shortint;
  c: AnsiChar;
begin
  result := '';
  for I := 1 to Length(Value) do
     begin
        if ((I mod 2) = 1) then
           begin
              x:=StrToInt('0x'+ Copy(string(Value), I, 2));
              move(x,c,1);
              result := result + C;
           end;
     end;
end;

function AesEncrypt(Value: AnsiString; Key: AnsiString): AnsiString;
var
  SS, DS: TMemoryStream;
  AESKey: TAESKey128;
  tmpstr: Ansistring;
begin
  SS:=TMemoryStream.Create;
  SS.WriteBuffer(Value[1],Length(Value));
  SS.Position:=0;
  DS:= TMemoryStream.Create;
  try
    FillChar(AESKey, SizeOf(AESKey), 0 );
    Move(PAnsiChar(Key)^, AESKey, Min(SizeOf(AESKey), Length(Key)));
    EncryptAESStreamECB(SS, 0, AESKey, DS);
    SetLength(TmpStr,DS.Size);
    DS.Position:=0;
    DS.ReadBuffer(TmpStr[1],DS.Size);
    Result := StrToHex(TmpStr);
  finally
    SS.Free;
    DS.Free;
  end;
end;

function AesDecrypt(Value: AnsiString; Key: AnsiString): AnsiString;
var
  SS: TMemoryStream;
  DS: TMemoryStream;
  AESKey: TAESKey128;
  tmpstr: AnsiString;
begin
  tmpstr:=HexToStr(Value);
  SS:= TMemoryStream.Create;
  SS.WriteBuffer(tmpstr[1],length(tmpstr));
  SS.Position:=0;
  DS:= TMemoryStream.Create;
  try
    FillChar(AESKey, SizeOf(AESKey), 0);
    Move(PAnsiChar(Key)^, AESKey, Min(SizeOf(AESKey), Length(Key)));
    DecryptAESStreamECB(SS, 0, AESKey, DS);
    DS.Position:=0;
    setlength(Result,DS.Size);
    Ds.ReadBuffer(Result[1],DS.Size);
  finally
    SS.Free;
    DS.Free;
  end;
end;

end.
