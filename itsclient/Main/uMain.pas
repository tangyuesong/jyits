unit uMain;
{$I ItsClient.inc }

interface

uses
{$IFDEF WEBXONE}
  wxoExec,
{$ENDIF}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, uDM, dxLayoutcxEditAdapters, cxContainer, cxEdit, cxGroupBox,
  dxSkinsdxNavBarPainter, dxSkinsdxNavBarAccordionViewPainter, dxNavBar,
  dxBarBuiltInMenu, cxPC, cxSplitter, dxSkinsForm, cxLabel, dxNavBarCollns,
  dxNavBarBase, uRequestItf, uEntity, uGlobal, uJsonUtils, Generics.Collections,
  dxFrames, Vcl.Menus, Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, cxImage,
  dxCustomTileControl, dxTileControl, Data.DB, uUserPower, uFrameMainMap,
  Vcl.ExtCtrls, FireDAC.Comp.Client, uFrameQDZView,
  cefvcl, dxSkinsdxStatusBarPainter, dxStatusBar, uDictionary,
  uCommon, uFrameIndexGCTJ, UFrameTJJKCJ, cxTextEdit, cxMemo,
  dxSkinsdxBarPainter, dxBar, uModifyPwd;

type
  TfrmMain = class(TForm)
    spnlTop: TcxGroupBox;
    mbMain: TdxNavBar;
    cxSplitter1: TcxSplitter;
    cxLabel1: TcxLabel;
    pageMain: TcxPageControl;
    sheetMain: TcxTabSheet;
    dxSkinController1: TdxSkinController;
    cxButton3: TcxButton;
    cxButton1: TcxButton;
    cxImage1: TcxImage;
    Chromium1: TChromium;
    cxGroupBox1: TcxGroupBox;
    spnRight: TcxGroupBox;
    cxButton2: TcxButton;
    cxButton4: TcxButton;
    PopupMenu1: TPopupMenu;
    q1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    gbMsg: TcxGroupBox;
    Timer1: TTimer;
    mmMsg: TcxMemo;
    btnMsgClose: TcxButton;
    barManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    btnPwd: TcxButton;
    lbUser: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pageMainDblClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure btnMsgCloseClick(Sender: TObject);
    procedure pageMainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure q1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btnPwdClick(Sender: TObject);
  private
    FFrameUpdating: Boolean;
    procedure mbMainItemClick(Sender: TObject);
    procedure mbMainGroupExpanded(Sender: TObject);
    function ShowFrame(FrameID: Integer; Parent: TWinControl): TFrame;
    function CreateNewFrame(frame: TdxFrameInfo;
      IsMainSheet: Boolean = False): TFrame;
    function FrameIsOpened(FrameID: Integer): Boolean;
    procedure SetFrameControlEnabled(frame: TdxFrameInfo);
    procedure TitleItemClick(ACaption: String);
    procedure CreateMainFrame;
  public
    function ShowFrameByCaption(ACaption: string): TdxFrameInfo;
    function FindFrameByCaption(ACaption: string): Boolean;
    procedure LogOut();
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnMsgCloseClick(Sender: TObject);
begin
  gbMsg.Hide;
end;

procedure TfrmMain.btnPwdClick(Sender: TObject);
begin
  if not Assigned(frmModifyPwd) then
    Application.CreateForm(TfrmModifyPwd, frmModifyPwd);
{$IFDEF WEBXONE}
  wxoShowModal(frmModifyPwd, frmMain);
{$ELSE}
  frmModifyPwd.ShowModal;
{$ENDIF}
end;

procedure TfrmMain.CreateMainFrame;
begin
  FrameMainMap := TFrameMainMap.Create(pageMain.Pages[0]);
  FrameMainMap.Parent := pageMain.Pages[0];
  FrameMainMap.Align := TAlign.alClient;
  FrameMainMap.Enabled := True;
end;

function TfrmMain.CreateNewFrame(frame: TdxFrameInfo;
  IsMainSheet: Boolean): TFrame;
var
  tab: TcxTabSheet;
begin
  Result := nil;
  if IsMainSheet then
  begin
    tab := TcxTabSheet(pageMain.Pages[0]);
  end
  else
  begin
    if FrameIsOpened(frame.ID) then
      Exit;
    tab := TcxTabSheet.Create(self);
    tab.PageControl := pageMain;
    tab.Caption := frame.Caption;
    tab.ImageIndex := frame.ImageIndex;
    tab.Tag := frame.ID;
    tab.Visible := True;
    pageMain.Update;
  end;
  Result := ShowFrame(frame.ID, tab);
  pageMain.ActivePageIndex := tab.TabIndex;
end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
begin
  if Application.MessageBox('确定退出吗?', '提示', MB_YESNO + MB_ICONINFORMATION) = idYES
  then
  begin
{$IFDEF WEBXONE}
    wxoClose;
{$ELSE}
    Close();
{$ENDIF}
  end;
end;

procedure TfrmMain.cxButton2Click(Sender: TObject);
begin
  spnlTop.Visible := True;
  cxGroupBox1.Visible := True;
  cxSplitter1.OpenSplitter;
  spnRight.Visible := False;
  barManager.Bars[0].Visible := False;
end;

procedure TfrmMain.cxButton3Click(Sender: TObject);
begin
  spnlTop.Visible := False;
  cxGroupBox1.Visible := False;
  cxSplitter1.CloseSplitter;
  spnRight.Visible := True;
  barManager.Bars[0].Visible := True;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  msg: string;
  list: TList<TSMessage>;
  item: TSMessage;
begin
  Timer1.Interval := 60000;
  msg := TRequestItf.DbQuery('GetMessage');
  if msg <> '' then
  begin
    list := TJSONUtils.JsonToRecordList<TSMessage>(msg);
    msg := '';
    for item in list do
    begin
      msg := msg + item.msg + #13#10;
    end;
    list.Free;
  end;
  if (msg <> '') and (msg <> mmMsg.Text) then
  begin
    mmMsg.Text := msg;
    gbMsg.Left := self.Width - gbMsg.Width - 16;
    gbMsg.Top := self.Height - gbMsg.Height - 56;
    gbMsg.Show;
  end
  else
    gbMsg.Hide; // 一分钟自动隐藏
end;

procedure TfrmMain.TitleItemClick(ACaption: String);
begin
  ShowFrameByCaption(ACaption);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{$IFDEF WEBXONE}
  wxoClose;
{$ENDIF}
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  barGroup: TdxNavBarGroup;
  barItem: TdxNavBarItem;
  mm: TParentMenu;
  cmList: TList<TChildMenu>;
  cm: TChildMenu;
  indx: Integer;
  aItemLink: TdxBarItemLink;
  aSubItem: TdxBarSubItem;
  aBarButton: TdxBarButton;
begin
{$IFDEF WEBXONE}
  self.WindowState := wsNormal;
  wxoPrepare(Handle, Application.Handle);
  wxoSetTitle(PAnsiChar(AnsiString(gSetup.AppTitle)));
{$ELSE}
  self.WindowState := wsMaximized;
{$ENDIF}
  lbUser.Caption := StringReplace(lbUser.Caption, 'admin', gUser.yhbh,
    [rfReplaceAll]);
  self.Caption := gSetup.AppTitle;
  self.cxLabel1.Caption := gSetup.AppTitle;

  if not gIsSa then
  begin
    dxFrameManager.RegisterFrame(2, TFrameIndexGCSJ, '过车流量统计', 33, 1,
      1, -1, '');
    // dxFrameManager.RegisterFrame(3, TFrameTJJCCJ, '缉查业务开展情况', 33, 1, 1, -1, '');
    dxFrameManager.RegisterFrame(4, TFrameQDZView, '劝导站详细信息', 33, 1, 1, -1, '');
  end;

  indx := 5;
  for mm in gUserPower.AllMainMenu do
  begin
    if gIsSa and (mm.Caption <> '系统运行管理') then
      continue
    else if not gIsSa and (gUserPower.UserMainMenu.IndexOf(mm.SystemID) < 0)
    then
      continue;
    cmList := gUserPower.AllChildMenu[mm.SystemID];

    aSubItem := TdxBarSubItem.Create(self);
    aSubItem.ImageIndex := mm.ImageIndex;
    aSubItem.Caption := mm.Caption;
    aItemLink := aSubItem.barManager.Bars[0].ItemLinks.Add;
    aItemLink.item := aSubItem;

    barGroup := mbMain.Groups.Add;
    barGroup.Expanded := False;
    barGroup.ShowExpandButton := False;
    barGroup.SmallImageIndex := mm.ImageIndex;
    barGroup.Caption := mm.Caption;
    barGroup.OnExpanded := mbMainGroupExpanded;

    for cm in cmList do
    begin
      if gIsSa and (cm.ClassType <> 'TToolUserManage') and
        (cm.ClassType <> 'TToolRoleManage') and
        (cm.ClassType <> 'TToolDataRoleManage') then
        continue
      else if not gIsSa and (gUserPower.UserChildMenu.IndexOf(cm.SystemID) < 0)
      then
        continue;
      try
        dxFrameManager.RegisterFrame(indx, TdxFrameClass(FindClass(cm.ClassType)
          ), cm.Caption, cm.ImageIndex, 1, 1, -1, cm.SystemID);

        aBarButton := TdxBarButton.Create(self);
        aBarButton.Caption := cm.Caption;
        aBarButton.ImageIndex := cm.ImageIndex;
        aBarButton.Tag := indx;
        aBarButton.OnClick := mbMainItemClick;
        aItemLink := aSubItem.ItemLinks.Add;
        aItemLink.item := aBarButton;

        barItem := mbMain.Items.Add;
        barItem.SmallImageIndex := cm.ImageIndex;
        barItem.Caption := cm.Caption;
        barItem.Tag := indx;
        barItem.OnClick := mbMainItemClick;
        barGroup.CreateLink(barItem);

        inc(indx);
      except
      end;
    end;
  end;
  if not gIsSa then
    CreateMainFrame;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
{$IFDEF WEBXONE}
  Application.MainFormOnTaskbar := False;
  SetWindowLong(self.Handle, GWL_EXSTYLE, GetWindowLong(self.Handle,
    GWL_EXSTYLE) and (not WS_EX_APPWINDOW));
  ShowWindow(Application.Handle, SW_HIDE);
{$ENDIF}
end;

function TfrmMain.FrameIsOpened(FrameID: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to pageMain.PageCount - 1 do
  begin
    if pageMain.Pages[i].Tag = FrameID then
    begin
      pageMain.ActivePageIndex := i;
      Result := True;
      break;
    end;
  end;
end;

procedure TfrmMain.LogOut;
begin
  Application.MessageBox('该账户在别处登录，您被迫下线!', '提示', MB_OK + MB_ICONINFORMATION);
{$IFDEF WEBXONE}
  wxoClose;
{$ELSE}
  Close();
{$ENDIF}
end;

procedure TfrmMain.mbMainGroupExpanded(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mbMain.Groups.Count - 1 do
  begin
    if mbMain.Groups[i].Name = TdxNavBarGroup(Sender).Name then
      continue;
    mbMain.Groups[i].Expanded := False;
  end;
end;

procedure TfrmMain.mbMainItemClick(Sender: TObject);
var
  frame: TdxFrameInfo;
  ID: Integer;
begin
  if Sender is TdxNavBarItem then
    ID := TdxNavBarItem(Sender).Tag
  else if Sender is TdxBarButton then
    ID := TdxBarButton(Sender).Tag;
  frame := dxFrameManager.GetFrameInfoByID(ID);
  if frame <> nil then
  begin
    CreateNewFrame(frame, False);
    SetFrameControlEnabled(frame);
    TCommon.WriteUserHabit(frame.Caption);
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := pageMain.TabCount - 1 downto 1 do
    pageMain.Pages[i].Free;
end;

procedure TfrmMain.N2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := pageMain.TabCount - 1 downto 1 do
  begin
    if pageMain.ActivePageIndex = i then
      continue;
    pageMain.Pages[i].Free;
  end;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  pageMain.ActivePageIndex := 0;
end;

procedure TfrmMain.pageMainDblClick(Sender: TObject);
begin
  if pageMain.ActivePageIndex = 0 then
    Exit;
  pageMain.ActivePage.Free;
end;

procedure TfrmMain.pageMainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = TMouseButton.mbRight then
  begin
    PopupMenu1.Popup(X, Y);
  end;
end;

procedure TfrmMain.q1Click(Sender: TObject);
begin
  if pageMain.ActivePageIndex = 0 then
    Exit;
  pageMain.ActivePage.Free;
end;

procedure TfrmMain.SetFrameControlEnabled(frame: TdxFrameInfo);
var
  i: Integer;
begin
  for i := 0 to frame.frame.ComponentCount - 1 do
  begin
    if not(frame.frame.Components[i] is TControl) then
      continue;
    if not gUserPower.AllControl.ContainsKey(frame.SystemID) then
      continue;

    if gUserPower.AllControl[frame.SystemID]
      .IndexOf(frame.frame.Components[i].Name) >= 0 then
    begin
      if gIsSa then
        TControl(frame.frame.Components[i]).Enabled := True
      else
      begin
        if (gUserPower.UserFunction.ContainsKey(frame.SystemID) and
          (gUserPower.UserFunction[frame.SystemID]
          .IndexOf(frame.frame.Components[i].Name) >= 0)) then
          TControl(frame.frame.Components[i]).Enabled := True
        else
          TControl(frame.frame.Components[i]).Enabled := False;
      end;
    end
    else
      TControl(frame.frame.Components[i]).Enabled := True;
  end;
end;

function TfrmMain.ShowFrame(FrameID: Integer; Parent: TWinControl): TFrame;
begin
  if FFrameUpdating then
    Exit;
  FFrameUpdating := True;
  try
    try
      LockWindowUpdate(Handle);
      Result := dxFrameManager.ShowFrame(FrameID, Parent);
    finally
      LockWindowUpdate(0);
    end;
  finally
    FFrameUpdating := False;
  end;
end;

function TfrmMain.ShowFrameByCaption(ACaption: string): TdxFrameInfo;
var
  frame: TdxFrameInfo;
begin
  frame := dxFrameManager.GetFrameInfoByCaption(ACaption);
  if frame <> nil then
  begin
    CreateNewFrame(frame, False);
    SetFrameControlEnabled(frame);
    TCommon.WriteUserHabit(ACaption);
  end
  else
    Application.MessageBox('您打开的页面不存在或您无权该页面', '提示',
      MB_OK + MB_ICONINFORMATION);
  Result := frame;
end;

function TfrmMain.FindFrameByCaption(ACaption: string): Boolean;
begin
  Result := dxFrameManager.GetFrameInfoByCaption(ACaption) <> nil;
end;

end.
