unit uSaveK08Thread;

interface

uses
  System.Classes, uGlobal, uEntity, Generics.Collections, uHik, SysUtils,
  uCommon, IDURI;

type
  TSaveK08Thread = class(TThread)
  private
    procedure SaveToK08(imgs: TList<TImageInfo>);
    procedure ClearImages(imgs: TList<TImageInfo>);
  protected
    procedure Execute; override;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure TSaveK08Thread.UpdateCaption;
  begin
  Form1.Caption := 'Updated in a thread';
  end;

  or

  Synchronize(
  procedure
  begin
  Form1.Caption := 'Updated in thread via an anonymous method'
  end
  )
  );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ TSaveK08Thread }

procedure TSaveK08Thread.Execute;
var
  s, gxsj: String;
  imgs: TList<TImageInfo>;
  img: TImageInfo;
begin
  gLogger.Info('SaveK08Thread Start');
  gTaskRunning := True;
  imgs := TList<TImageInfo>.Create;
  gxsj := FormatDateTime('yyyymmddhh', Now());
  try

    s := 'select a.GCXH, a.KDBH, a.CDBH, a.GCSJ, a.FWQDZ, a.TP1 from T_KK_VEH_PASSREC a '
      + ' inner join S_Device b on a.KDBH = b.SBBH and b.XYSB = 1 and b.QYZT = 1 '
    // + ' and Left(a.CJJG, ' + Length(gCJJG).ToString + ') = ' + gCJJG.QuotedString +
    // +' and left(a.cjjg, 4) = ''4451'' '
      + ' and Replace(Replace(convert(varchar(13), a.GXSJ, 120), ''-'', ''''), '' '','''')>='
      + gStartTime.QuotedString +
      ' and convert(varchar(13), a.GXSJ, 120) < convert(varchar(13), getdate(), 120)'
      + ' and a.hpzl<>''07'' and a.hpzl>'''' and left(FWQDZ, 4) = ''http'' ';

    gLogger.Info(s);
    with gSQLHelper.Query(s) do
    begin
      gLogger.Info('Pass Record Count: ' + RecordCount.ToString);
      while not Eof do
      begin
        try
          img := TImageInfo.Create;
          img.KDBH := FieldByName('KDBH').AsString;
          img.GCXH := FieldByName('GCXH').AsString;
          img.CDBH := FieldByName('CDBH').AsString;
          img.Url := TIdURI.URLEncode(FieldByName('FWQDZ').AsString +
            FieldByName('TP1').AsString);
          img.Url := img.Url.Replace('&', '&amp;');
          img.PassTime := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz',
            FieldByName('GCSJ').AsDateTime);

          imgs.Add(img);
          if imgs.Count > 250 then
          begin
            SaveToK08(imgs);
          end;
        except
          on e: Exception do
            gLogger.Error('Get Pass Info Error ' + e.Message);
        end;
        Next;
      end;
      Free;
    end;
    SaveToK08(imgs);
    gStartTime := gxsj;
    TCommon.SaveConfig('Task', 'StartTime', gStartTime);
  except
    on e: Exception do
      gLogger.Error('SaveK08Thread Error ' + e.Message);
  end;
  imgs.Free;
  gTaskRunning := False;
  gLogger.Info('SaveK08Thread End');
end;

procedure TSaveK08Thread.SaveToK08(imgs: TList<TImageInfo>);
begin
  if imgs.Count > 0 then
  begin
    try
      if THik.DFCreateImageJob(imgs) then
        gLogger.Info('Create K08 Job Succeed')
      else
        gLogger.Error('Create K08 Job Failed');
    except
      on e: Exception do
        gLogger.Error('Create K08 Job Failed ' + e.Message);
    end;
  end;
  ClearImages(imgs);
end;

procedure TSaveK08Thread.ClearImages(imgs: TList<TImageInfo>);
var
  i: Integer;
begin
  for i := imgs.Count - 1 Downto 0 do
    imgs[i].Free;
  imgs.Clear;
end;

end.
