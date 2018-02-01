unit Usms;

interface

uses uSQLHelper, System.IOUtils, System.SysUtils;

type
  Tsms = class
  private
    Fsqlhelper: TSQLHelper;
  public
    constructor Create; overload;
    destructor Destroy; override;
    procedure putsms(sn, body, msg: string);
  end;

implementation

{ Tsms }
constructor Tsms.Create;
begin
  Fsqlhelper := TSQLHelper.Create('10.43.235.222,1133', 'borderdb', 'zasms', 'zasms');
end;

destructor Tsms.Destroy;
begin
  FSqlHelper.Free;
  inherited;
end;

procedure Tsms.putsms(sn, body, msg: string);
begin
  Fsqlhelper.ExecuteSql('insert into [borderdb].[dbo].[T_OUT] (sn,body,msg) values (' +
    sn.QuotedString + ',' + body.QuotedString + ',' + msg.QuotedString + ')');
end;

end.
