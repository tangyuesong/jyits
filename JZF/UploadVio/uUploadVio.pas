unit uUploadVio;

interface

uses
  System.Classes, SysUtils, ActiveX, uGlobal, uRequestItf, uJsonUtils, cLockVio,
  FireDAC.Comp.Client, Generics.Collections;

type
  TVioWmd = class
    SYSTEMID: string; // ϵͳID
    HPHM: string; // ���ƺ���
    HPZL: string; // ��������
    yxsj: string; // ����ʱ��
    jssj: string; // ����ʱ��
    yy: string; // ԭ��
    lrr: string; // ¼����
    lrsj: string; // ¼��ʱ��
    spr: string; // ������
    spsj: string; // ����ʱ��
    spyj: string; // �������
    bz: string; // ¼��������
    bj: string; // ���
    powertype: string; // �������  1������ 2��Υ�� 3������
    DWDM: string;
    gxsj: string;
  end;

  TUploadVioThread = class(TThread)
  private
    FWhiteList: TStrings;
    function GetCjjgList: TStrings;
    procedure UploadVio(cjjg: String);
    procedure LoadWhiteList(cjjg: String);
    procedure UploadVioDateDiff();
  protected
    procedure Execute; override;
  public
    class var Running: Boolean;
    class var RunnTime: TDateTime;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure TUploadVioThread.UpdateCaption;
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

{ TUploadVioThread }

procedure TUploadVioThread.Execute;
var
  s, cjjg: String;
  cjjgs: TStrings;
begin
  ActiveX.CoInitialize(nil);
  TUploadVioThread.RunnTime := Now;
  gLogger.Info('Upload Vio Thread Start');
  FWhiteList := TStringList.Create;
  UploadVioDateDiff();
  FWhiteList.Free;
  gLogger.Info('Upload Vio Thread End');
  TUploadVioThread.Running := False;
  ActiveX.CoUninitialize;
end;

function TUploadVioThread.GetCjjgList: TStrings;
var
  s: String;
begin
  Result := TStringList.Create;
  s := 'select distinct CJJG from T_VIO_HIS where ZT=''2'' and DATEDIFF(dd, WFSJ, getdate())<=15 ';
  with gSQLHelper.Query(s) do
  begin
    while not Eof do
    begin
      Result.Add(Fields[0].AsString);
      Next;
    end;
    Free;
  end;
end;

procedure TUploadVioThread.LoadWhiteList(cjjg: String);
var
  list: TList<TVioWmd>;
  veh: TVioWmd;
begin
  try
    FWhiteList.Clear;
    list := TJsonUtils.JsonToObjectList<TVioWmd>
      (TRequestItf.DbQuery('GetWhiteList', 'cjjg=' + cjjg + '&powertype=2&dt=' +
      FormatDatetime('yyyy/mm/dd', Now())));
    for veh in list do
      FWhiteList.Add(veh.HPHM + veh.HPZL);
    list.Free;
  except
    on e: exception do
      gLogger.Error('Upload Vio Error: ' + e.Message);
  end;
end;

procedure TUploadVioThread.UploadVio(cjjg: String);
var
  s: string;
  lvio: TDealLockVio;
begin
  with gSQLHelper.Query
    ('select systemid from T_VIO_HIS where zt=''2'' and cjjg=' +
    cjjg.QuotedString) do
  begin
    while not Eof do
    begin
      lvio := TDealLockVio.Create;
      s := lvio.UploadVio(FieldByName('systemid').AsString, FWhiteList);
      gLogger.Info('[UploadVio] ' + FieldByName('systemid').AsString +
        ',�ϴ����:' + s);
      lvio.Free;
      Next;
    end;
    Free;
  end;
end;

procedure TUploadVioThread.UploadVioDateDiff;
var
  s, cjjg: String;
  cjjgs: TStrings;
begin
  cjjgs := GetCjjgList;
  if cjjgs.Count = 0 then
    gLogger.Info('[UploadVio] ������δ�ϴ���Υ��');
  for cjjg in cjjgs do
  begin
    gLogger.Info('[UploadVio] Upload CJJG: ' + cjjg);
    LoadWhiteList(cjjg);
    UploadVio(cjjg);
  end;
  cjjgs.Free;
end;

end.
