unit wxoExecFmx;

interface

uses
     FMX.Platform.Win,
     //系统
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




//<核心函数----------------------------------------------------------------------------------------
//预处理
procedure _wxoPrepare(
          Param1:PAnsiChar;   //参数1
          Param2:PAnsiChar;   //参数2
          formHd:THandle;     //当前窗体的句柄
          AppHd:THandle;      //Application.Handle
          Reserved:PAnsiChar  //预留
          ); stdcall;External'wxoBase.dll';
//得到URL
function  _wxoGetUrl:PAnsiChar; stdcall;External'wxoBase.dll';
//得到工作目录
function  _wxoGetDir:PAnsiChar; stdcall;External'wxoBase.dll';
//发送消息
procedure _wxoSendMsg(LocalHandle:THandle;pHead:PAnsichar;Value:LongInt;pText:PAnsichar); stdcall;External'wxoBase.dll';
//得到插件句柄
function  _wxoGetWxoHandle:THandle;stdcall;External'wxoBase.dll';
//插件是否活着
function  _wxoIsActive:Boolean;stdcall;External'wxoBase.dll';           
//------------------------------------------------------------------------------------------------->

//基础函数------------------------------------------------------------------------------------------
//运行JavaScript
procedure wxoRunJS(JS:PAnsiChar);
//预处理函数
procedure wxoPrepare(frmHd,appHd:THandle);

//JS扩展函数----------------------------------------------------------------------------------------
procedure wxoClose;
procedure wxoReload;
procedure wxoSetTitle(ATitle:PAnsiChar);

implementation

//基础函数------------------------------------------------------------------------------------------
//运行JavaScript
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



//JS扩展函数----------------------------------------------------------------------------------------
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
