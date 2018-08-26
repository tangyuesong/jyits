unit wxoExecFmx;

interface

uses
     FMX.Platform.Win,
     //ϵͳ
     FMX.ExtCtrls,
     FMX.Forms,
     Variants,
     FMX.Graphics,
     FMX.Controls,
     FMX.StdCtrls,
     FMX.Dialogs,
     FMX.Types,
     System.Classes,
     ShellAPI,
     SysUtils,Messages,Windows;




//<���ĺ���----------------------------------------------------------------------------------------
//Ԥ����
procedure _wxoPrepare(
          Param1:PAnsiChar;   //����1
          Param2:PAnsiChar;   //����2
          formHd:THandle;     //��ǰ����ľ��
          AppHd:THandle;      //Application.Handle
          Reserved:PAnsiChar  //Ԥ��
          ); stdcall;External'wxoBase.dll';
//�õ�URL
function  _wxoGetUrl:PAnsiChar; stdcall;External'wxoBase.dll';
//�õ�����Ŀ¼
function  _wxoGetDir:PAnsiChar; stdcall;External'wxoBase.dll';
//������Ϣ
procedure _wxoSendMsg(LocalHandle:THandle;pHead:PAnsichar;Value:LongInt;pText:PAnsichar); stdcall;External'wxoBase.dll';
//�õ�������
function  _wxoGetWxoHandle:THandle;stdcall;External'wxoBase.dll';
//����Ƿ����
function  _wxoIsActive:Boolean;stdcall;External'wxoBase.dll';           
//------------------------------------------------------------------------------------------------->

//��������------------------------------------------------------------------------------------------
//����JavaScript
procedure wxoRunJS(JS:PAnsiChar);
//Ԥ������
procedure wxoPrepare(frmHd,appHd:THandle);

//JS��չ����----------------------------------------------------------------------------------------
procedure wxoClose;
procedure wxoReload;
procedure wxoSetTitle(ATitle:PAnsiChar);

implementation

//��������------------------------------------------------------------------------------------------
//����JavaScript
procedure wxoRunJS(JS:PAnsiChar);
begin
     _wxoSendMsg(0,'RNJS', 0,JS);
end;

procedure wxoPrepare(frmHd,appHd:THandle);
begin
     if ParamCount>2 then begin
          _wxoPrepare(PAnsiChar(AnsiString(ParamStr(1))),PAnsiChar(AnsiString(ParamStr(3))),frmHd,AppHd,'');
     end;
end;



//JS��չ����----------------------------------------------------------------------------------------
procedure wxoClose;
begin
     wxoRunJS('window.open('''',''_self'','''');'#13#10'window.close();');
     //'window.opener=null;window.open('''',''_self'');window.close(); ');

     //       window.opener=null;window.open('','_self');window.close();
end;

procedure wxoReload;
begin
     wxoRunJS('location.reload()');
end;

procedure wxoSetTitle(ATitle:PAnsiChar);
begin
     wxoRunJS(PAnsiChar('window.document.title ="'+ATitle+'";'));
end;


end.
