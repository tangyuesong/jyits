unit uSaveK08Thread;

interface

uses
  System.Classes, uGlobal, uEntity, Generics.Collections, uHik, SysUtils,
  uCommon, IDURI, DateUtils;

type
  TSaveK08Thread = class(TThread)
  private
    procedure SaveToK08(imgs: TList<TImageInfo>);
    procedure ClearImages(imgs: TList<TImageInfo>);
  protected
    procedure Execute; override;
  end;

var
  gThreadList: TList<TSaveK08Thread>;

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
  i: integer;
begin
  gLogger.Info('线程启动');
  while True do
  begin
    imgs := gPassReader.GetPassList;
    gLogger.Debug('Get Pass Record Count: ' + imgs.Count.ToString);
    SaveToK08(imgs);
    sleep(1000);
    imgs.Free;
  end;
end;

procedure TSaveK08Thread.SaveToK08(imgs: TList<TImageInfo>);
var
  jobid: String;
  hik: THik;
  dt: TDatetime;
begin
  if imgs.Count > 0 then
  begin
    try
      hik := THik.Create;
      jobid := hik.DFCreateImageJob(imgs);
      if jobid <> '' then
      begin
        gLogger.Info('Create K08 Job Succeed');
        dt := Now;
        while DateUtils.MinutesBetween(Now, dt) < 5 do // 5分钟超时
        begin
          if hik.GetJobProcess(jobid) = 100 then
            break;
          sleep(5000);
        end;
      end
      else
        gLogger.Error('Create K08 Job Failed');
      hik.Free;
    except
      on e: Exception do
        gLogger.Error('Create K08 Job Failed ' + e.Message);
    end;
  end
  else
    sleep(10000);
  ClearImages(imgs);
end;

procedure TSaveK08Thread.ClearImages(imgs: TList<TImageInfo>);
var
  i: integer;
begin
  for i := imgs.Count - 1 Downto 0 do
    imgs[i].Free;
  imgs.Clear;
end;

end.
