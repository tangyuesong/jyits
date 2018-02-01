unit uFZK;

interface

uses
  uCommon;

type
  TFZK = class
  public
    class function GetVehInfo(hphm, hpzl: string): string;
    class function GetDrvInfo(sfzhm: string): string;
  end;

implementation

{ TFZK }

class function TFZK.GetDrvInfo(sfzhm: string): string;
begin
  result := uCommon.QueryToJsonString('select * from T_VIO_DRIVINGLICENSE where sfzmhm=''' + sfzhm + '''');
end;

class function TFZK.GetVehInfo(hphm, hpzl: string): string;
begin
  result := uCommon.QueryToJsonString('select * from T_VIO_VEHICLE where hphm=''' + hphm + ''' and hpzl = ''' + hpzl + '''');
end;

end.
