unit uPassReader;

interface

uses
  Classes, SysUtils, syncobjs, ADODB, uEntity, Generics.Collections,
  DateUtils, Windows, IdURI;

type
  TPassReader = Class
  private
    cs: TCriticalSection;
    FDateTimeFormat: TFormatSettings;
    FQy: TADOQuery;
  public
    constructor Create;
    destructor Destroy; override;
    function GetPassList(): TList<TImageInfo>;
  end;

implementation

uses uGlobal, uCommon;

{ TPassReader }
constructor TPassReader.Create;
begin
  inherited;
  cs := TCriticalSection.Create;
  FDateTimeFormat := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  FDateTimeFormat.ShortDateFormat := 'yyyy/MM/dd';
  FDateTimeFormat.DateSeparator := '/';
  FDateTimeFormat.TimeSeparator := ':';
  FDateTimeFormat.LongTimeFormat := 'hh:nn:ss.zzz';
end;

destructor TPassReader.Destroy;
begin
  if FQy <> nil then
    FQy.Free;
  cs.Free;
  inherited;
end;

function TPassReader.GetPassList: TList<TImageInfo>;
var
  s, jssj: String;
  dt: TDateTime;
  img: TImageInfo;
begin
  cs.Enter;
  Result := TList<TImageInfo>.Create;
  try
    if (FQy = nil) or FQy.Eof then
    begin
      if FQy <> nil then
        FQy.Free;
      dt := StrToDatetime(gStartTime, FDateTimeFormat) +
        DateUtils.OneMinute * 5;
      if dt > Now then
        dt := Now;
      jssj := FormatDatetime('yyyy/MM/dd hh:nn:ss.zzz', dt);

      s := 'select a.HPHM, a.GCXH, a.KDBH, a.CDBH, a.GCSJ, a.FWQDZ, a.TP1 from T_KK_VEH_PASSREC a '
        + ' inner join S_Device b on a.KDBH = b.SBBH and b.XYSB = 1 and b.QYZT = 1 '
        + ' and a.GXSJ>=' + gStartTime.QuotedString + ' and a.GXSJ < ' +
        jssj.QuotedString +
        ' and a.hpzl<>''07'' and a.hpzl>'''' and left(FWQDZ, 4) = ''http'' ';
      FQy := gSQLHelper.Query(s);
      gLogger.Info('PassCount:' + FQy.RecordCount.ToString);
      gStartTime := jssj;
    end;

    while not FQy.Eof do
    begin
      img := TImageInfo.Create;
      img.HPHM := FQy.FieldByName('HPHM').AsString;
      img.KDBH := FQy.FieldByName('KDBH').AsString;
      img.GCXH := FQy.FieldByName('GCXH').AsString;
      img.CDBH := FQy.FieldByName('CDBH').AsString;
      img.Url := TIdURI.URLEncode(FQy.FieldByName('FWQDZ').AsString +
        FQy.FieldByName('TP1').AsString);
      img.Url := img.Url.Replace('&', '&amp;');
      img.PassTime :=
        IntToStr(DateUtils.MilliSecondsBetween(FQy.FieldByName('GCSJ')
        .AsDateTime, 25569.3333333333));
      Result.Add(img);
      FQy.Next;
      if Result.Count > 249 then
        break;
    end;

    if FQy.Eof then
      TCommon.SaveConfig('Task', 'StartTime', gStartTime);
  except
    on e: exception do
      gLogger.Error('Get Pass Record error ' + e.Message);
  end;
  cs.Leave;
end;

end.
