unit wxoExec;

interface

uses
     //自编
     //wxoBase,
     //wxoUnit,

     //系统
     ExtCtrls,Forms, Variants, Classes, Graphics, Controls,
     StdCtrls,
     ShellAPI,
     SysUtils,Dialogs,Messages,Windows;
type
     TMoniObject=class(TObject)
          Timer_AutoCLose : TTimer;
          procedure onTimer(Sender: TObject);
     end;
var
     MoniObject : TMoniObject;



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
//模式显示窗体函数
function  wxoShowModal(AForm,AMainForm : TForm):Integer;
//非模式显示窗体
function wxoShow(AForm,AMainForm : TForm):Integer;
//显示登录窗体函数
function  wxoShowLogin(AForm,AMainForm : TForm):Integer;
//显示信息框
function wxoMessageDlg(AMainForm:TForm;const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;

//JS扩展函数----------------------------------------------------------------------------------------
procedure wxoClose;
procedure wxoReload;
procedure wxoSetTitle(ATitle:PAnsiChar);


//
function wxoSetCenter(AForm:TForm):Integer;
//
function wxoAddMonitor(AForm:TForm):Integer;


implementation

//基础函数------------------------------------------------------------------------------------------
//运行JavaScript
procedure wxoRunJS(JS:PAnsiChar);
begin
     _wxoSendMsg(0,'RNJS', 0,JS);
end;

procedure wxoPrepare(frmHd,appHd:THandle);
begin
     if ParamCount>2 then
     begin
          _wxoPrepare(PAnsiChar(AnsiString(ParamStr(1))),PAnsiChar(AnsiString(ParamStr(3))),frmHd,AppHd,'');
     end
     else
     begin
          //Application.Terminate;
     end;
end;


function wxoShowLogin(AForm,AMainForm : TForm):Integer;
var
     I         : Integer;
     iBKColor  : Integer;
     bVisibles : array of Boolean;
     bMenus    : array of Boolean;
     bChilds   : array of Boolean;
     oMClick   : TNotifyEvent;
     oMDown    : TMouseEvent;
     oMMove    : TMouseMoveEvent;
     oMUp      : TMouseEvent;
     oMWheel   : TMouseWheelEvent;
     oMWDown   : TMouseWheelUpDownEvent;
     oMWUp     : TMouseWheelUpDownEvent;
begin
     //
     Result    := 0;
     //
     if AForm=nil then begin
          Exit;
     end;

     //
     AForm.ModalResult   := 0;

     try
          //保存背景颜色
          iBKColor  := AMainForm.Color;

          //读取原状态，并设置Enabled
          SetLength(bVisibles,AMainForm.ControlCount);
          for I:=0 to High(bVisibles) do begin
               bVisibles[I]   := AMainForm.Controls[I].Visible;
               AMainForm.Controls[I].Visible := False;
          end;

          //读原菜单状态，并设置
          if AMainForm.Menu<>nil then begin
               SetLength(bMenus,AMainForm.Menu.Items.Count);
               for I:=0 to AMainForm.Menu.Items.Count-1 do begin
                    bMenus[I] := AMainForm.Menu.Items[I].Visible;
                    AMainForm.Menu.Items[I].Visible := False;
               end;
          end;

          //读子窗体状态， 并设置
          SetLength(bChilds,AMainForm.MDIChildCount);
          for I:=0 to AMainForm.MDIChildCount-1 do begin
               bChilds[I]     := AMainForm.MDIChildren[I].Visible;
               AMainForm.MDIChildren[I].Visible   := False;
          end;


          //AMainForm.onmouse

          //保存鼠标事件
          oMClick   := AMainForm.OnClick;
          oMDown    := AMainForm.OnMouseDown;
          oMMove    := AMainForm.OnMouseMove;
          oMUp      := AMainForm.OnMouseUp;
          oMWheel   := AMainForm.OnMouseWheel;
          oMWDown   := AMainForm.OnMouseWheelDown;
          oMWUp     := AMainForm.OnMouseWheelUp;

          //屏蔽鼠标事件
          AMainForm.OnClick             := nil;
          AMainForm.OnMouseDown         := nil;
          AMainForm.OnMouseMove         := nil;
          AMainForm.OnMouseUp           := nil;
          AMainForm.OnMouseWheel        := nil;
          AMainForm.OnMouseWheelDown    := nil;
          AMainForm.OnMouseWheelUp      := nil;

          //修改颜色
          AMainForm.Color     := clWhite;

          //设置居中
          AForm.Top      := (AMainForm.Height-AForm.Height) div 2;
          AForm.Left     := (AMainForm.Width-AForm.Width) div 2;
          //AForm.Update;

          //显示窗体
          AForm.Show;
          Windows.SetParent(AForm.Handle,AMainForm.Handle);
          AForm.BringToFront;

          //ShowMessage(Format('MH=%d, FH=%d, Top = %d',[AMainForm.Height,AForm.Height,AForm.Top]));

          while AForm.Visible do begin
               Application.HandleMessage;
               if AForm.ModalResult<>0 then begin
                    break;
               end;
               if not _wxoIsActive then begin
                    Break;
               end;
          end;
          //Windows.SetParent(AForm.Handle,0);

          //
          Result    := AForm.ModalResult;
     finally
          //恢复颜色
          AMainForm.Color     := iBKColor;
          
          //恢复状态
          for I:=0 to High(bVisibles) do begin
               AMainForm.Controls[I].Visible      := bVisibles[I];
          end;
          SetLength(bVisibles,0);
          for I:=0 to High(bMenus) do begin
               AMainForm.Menu.Items[I].Visible    := bMenus[I];
          end;
          SetLength(bMenus,0);
          for I:=0 to High(bChilds) do begin
               AMainForm.MDIChildren[I].Visible   := bChilds[I];
          end;
          SetLength(bChilds,0);

          //
          AMainForm.OnClick             := oMClick;
          AMainForm.OnMouseDown         := oMDown;
          AMainForm.OnMouseMove         := oMMove;
          AMainForm.OnMouseUp           := oMUp;
          AMainForm.OnMouseWheel        := oMWheel;
          AMainForm.OnMouseWheelDown    := oMWDown;
          AMainForm.OnMouseWheelUp      := oMWUp;
          //
          AForm.Hide;

     end;
end;

function wxoShow(AForm,AMainForm : TForm):Integer;
begin
     //
     Result    := 0;
     //
     if AForm=nil then begin
          Exit;
     end;

     //显示窗体
     AForm.Show;
     Windows.SetParent(AForm.Handle,AMainForm.Handle);
end;


function wxoShowModal(AForm,AMainForm : TForm):Integer;
var
     I         : Integer;
     bEnableds : array of Boolean;
     bMenus    : array of Boolean;
     bChilds   : array of Boolean;
     oMClick   : TNotifyEvent;
     oMDown    : TMouseEvent;
     oMMove    : TMouseMoveEvent;
     oMUp      : TMouseEvent;
     oMWheel   : TMouseWheelEvent;
     oMWDown   : TMouseWheelUpDownEvent;
     oMWUp     : TMouseWheelUpDownEvent;
begin
     //
     Result    := 0;
     //
     if AForm=nil then begin
          Exit;
     end;

     //
     AForm.ModalResult   := 0;

     try

          //读取原状态，并设置Enabled
          SetLength(bEnableds,AMainForm.ControlCount);
          for I:=0 to High(bEnableds) do begin
               bEnableds[I]   := AMainForm.Controls[I].Enabled;
               AMainForm.Controls[I].Enabled := False;
          end;

          //读原菜单状态，并设置
          if AMainForm.Menu<>nil then begin
               SetLength(bMenus,AMainForm.Menu.Items.Count);
               for I:=0 to AMainForm.Menu.Items.Count-1 do begin
                    bMenus[I] := AMainForm.Menu.Items[I].Enabled;
                    AMainForm.Menu.Items[I].Enabled := False;
               end;
          end;

          //读子窗体状态， 并设置
          SetLength(bChilds,AMainForm.MDIChildCount);
          for I:=0 to AMainForm.MDIChildCount-1 do begin
               bChilds[I]     := AMainForm.MDIChildren[I].Enabled;
               AMainForm.MDIChildren[I].Enabled   := False;
          end;


          //AMainForm.onmouse

          //保存鼠标事件
          oMClick   := AMainForm.OnClick;
          oMDown    := AMainForm.OnMouseDown;
          oMMove    := AMainForm.OnMouseMove;
          oMUp      := AMainForm.OnMouseUp;
          oMWheel   := AMainForm.OnMouseWheel;
          oMWDown   := AMainForm.OnMouseWheelDown;
          oMWUp     := AMainForm.OnMouseWheelUp;

          //屏蔽鼠标事件
          AMainForm.OnClick             := nil;
          AMainForm.OnMouseDown         := nil;
          AMainForm.OnMouseMove         := nil;
          AMainForm.OnMouseUp           := nil;
          AMainForm.OnMouseWheel        := nil;
          AMainForm.OnMouseWheelDown    := nil;
          AMainForm.OnMouseWheelUp      := nil;


          //显示窗体

          AForm.Show;
          Windows.SetParent(AForm.Handle,AMainForm.Handle);
          //AForm.BringToFront;
          //AForm.Update;
          while AForm.Visible do begin
               Application.HandleMessage;
               if AForm.ModalResult<>0 then begin
                    break;
               end;
               if not _wxoIsActive then begin
                    Break;
               end;
          end;
          //Windows.SetParent(AForm.Handle,0);

          //
          Result    := AForm.ModalResult;
     finally

          //恢复状态
          for I:=0 to High(bEnableds) do begin
               AMainForm.Controls[I].Enabled      := bEnableds[I];
          end;
          SetLength(bEnableds,0);
          for I:=0 to High(bMenus) do begin
               AMainForm.Menu.Items[I].Enabled    := bMenus[I];
          end;
          SetLength(bMenus,0);
          for I:=0 to High(bChilds) do begin
               AMainForm.MDIChildren[I].Enabled   := bChilds[I];
          end;
          SetLength(bChilds,0);

          //
          AMainForm.OnClick             := oMClick;
          AMainForm.OnMouseDown         := oMDown;
          AMainForm.OnMouseMove         := oMMove;
          AMainForm.OnMouseUp           := oMUp;
          AMainForm.OnMouseWheel        := oMWheel;
          AMainForm.OnMouseWheelDown    := oMWDown;
          AMainForm.OnMouseWheelUp      := oMWUp;
          //
          AForm.Hide;

     end;
end;

//JS扩展函数----------------------------------------------------------------------------------------
procedure wxoClose;
begin
     wxoRunJS(PAnsiChar('window.open('''',''_self'','''');'#13#10'window.close();'));
end;

procedure wxoReload;
begin
     wxoRunJS('location.reload()');
end;

procedure wxoSetTitle(ATitle:PAnsiChar);
begin
     wxoRunJS(PAnsiChar(AnsiString('window.document.title ="'+ATitle+'";')));
end;


function wxoSetCenter(AForm:TForm):Integer;
var
     iPar      : THandle;
begin
     //
     try
          Result    := 0;
          //
          if ParamCount>2 then
          begin
               wxoPrepare(1,Application.Handle);
               //
               iPar := StrToIntDef(AnsiString(ParamStr(1)),0);
               //
               _wxoSendMsg(AForm.Handle,'EMFM',AForm.Handle,'1');
               //
               Windows.SetParent(AForm.Handle,iPar);
               //
               wxoAddMonitor(AForm);

          end;
     except
          Result    := -1;
     end;
end;

function wxoAddMonitor(AForm:TForm):Integer;
var
     oTimer    : TTimer;
begin
     //
     oTimer    := TTimer.Create(AForm);
     oTimer.Interval     := 5000;
     oTimer.OnTimer := MoniObject.onTimer;

end;


{ TMoniObject }

procedure TMoniObject.onTimer(Sender: TObject);
begin
     if not _wxoIsActive then
     begin
          Application.Terminate;
     end;
end;

function wxoMessageDlg(AMainForm:TForm;const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;
var
     fmDlg     : TForm;
begin
     fmDlg     := CreateMessageDialog(Msg, DlgType, Buttons);
     fmDlg.Position := poScreenCenter;
     //
     Result    := wxoShowModal(fmDlg,AMainForm);
end;


end.
