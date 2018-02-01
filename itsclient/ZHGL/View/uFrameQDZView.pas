unit uFrameQDZView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxFrame, cxGraphics, cxControls,
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
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, uFrameRYGL,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, uRequestItf,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, uJsonUtils,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxClasses, dxLayoutContainer,
  dxLayoutControl, dxLayoutControlAdapters, Vcl.Menus, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, cxButtons, uEntity, uFrameQDZViewBase, uFrameQDZSP,
  Generics.Collections, uFrameQDZViewDev, dxLayoutcxEditAdapters, cxContainer,
  cxEdit, cxImage, cxLabel;

type
  TFrameQDZView = class(TdxFrame)
    liQDZ: TdxLayoutItem;
    btnBase: TcxButton;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup11: TdxLayoutGroup;
    dxLayoutGroup111: TdxLayoutGroup;
    lgQDZ: TdxLayoutGroup;

    dxLayoutItem2: TdxLayoutItem;
    btnMember: TcxButton;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup21: TdxLayoutGroup;
    dxLayoutGroup211: TdxLayoutGroup;
    lgMember: TdxLayoutGroup;

    dxLayoutItem3: TdxLayoutItem;
    btnVideo: TcxButton;
    dxLayoutSeparatorItem3: TdxLayoutSeparatorItem;
    dxLayoutGroup3: TdxLayoutGroup;
    dxLayoutGroup31: TdxLayoutGroup;
    dxLayoutGroup311: TdxLayoutGroup;
    lgVideo: TdxLayoutGroup;

    dxLayoutItem4: TdxLayoutItem;
    btnDev: TcxButton;
    dxLayoutSeparatorItem4: TdxLayoutSeparatorItem;
    dxLayoutGroup4: TdxLayoutGroup;
    dxLayoutGroup41: TdxLayoutGroup;
    dxLayoutGroup411: TdxLayoutGroup;
    lgDev: TdxLayoutGroup;

    cxImageList1: TcxImageList;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    btnBack: TcxButton;
    dxLayoutGroup5: TdxLayoutGroup;
    lgMember1: TdxLayoutGroup;
    lgMember2: TdxLayoutGroup;
    lgVideo1: TdxLayoutGroup;
    lgVideo2: TdxLayoutGroup;
    lgVideo3: TdxLayoutGroup;
    lgDev1: TdxLayoutGroup;
    lgDev2: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    procedure btnBaseClick(Sender: TObject);
    procedure btnMemberClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnDevClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    FQDZ: TQDZ;
    procedure SetQDZ(const Value: TQDZ);
    procedure ShowQDZ;
    procedure ShowRY;
    procedure ShowSP;
    procedure ShowDev;
  public
    procedure AfterConstruction; override;
    property QDZ: TQDZ read FQDZ write SetQDZ;
  end;

var
  FrameQDZView: TFrameQDZView;

implementation

{$R *.dfm}

procedure TFrameQDZView.AfterConstruction;
begin
  inherited;
end;

procedure TFrameQDZView.ShowQDZ;
begin
  if dxLayoutItem5.Control = nil then
  begin
    dxLayoutItem5.Control := TFrameQDZViewBase.Create(self);
  end;
  (dxLayoutItem5.Control as TFrameQDZViewBase).QDZ := FQDZ;
end;

procedure TFrameQDZView.ShowRY;
var
  json: string;
  list: TList<TQDZRY>;
  ry: TQDZRY;
  n, i: integer;
  dxLayoutItem: TdxLayoutItem;
  group: TdxLayoutGroup;
  FrameRYGL: TFrameRYGL;
begin
  json := TRequestItf.pDbQuery('GETT_QDZ_USER', 'QDZDM=' + FQDZ.QDZDM);
  list := TJsonUtils.JsonToRecordList<TQDZRY>(json);
  n := 0;
  for ry in list do
  begin
    inc(n);
    if n mod 2 = 1 then
      group := lgMember1
    else
      group := lgMember2;
    i := (n - 1) div 2;
    if group.Count <= i then
    begin
      FrameRYGL := TFrameRYGL.Create(self);
      FrameRYGL.Name := 'FrameRY' + n.ToString;
      FrameRYGL.dxLayoutGroup2.Visible := false;
      FrameRYGL.dxLayoutControl2.Height := 220;
      FrameRYGL.dxLayoutControl2.Width := 450;
      FrameRYGL.dxLayoutSeparatorItem1.Visible := false;
      FrameRYGL.dxLayoutGroup1.CaptionOptions.Text := '';
      FrameRYGL.dxLayoutItem2.Visible := false;
      FrameRYGL.dxLayoutGroup6.ShowBorder := false;
      FrameRYGL.Enabled := false;

      dxLayoutItem := TdxLayoutItem.Create(self);
      dxLayoutItem.Parent := group;
      dxLayoutItem.Index := group.Count - 1;
      dxLayoutItem.Control := FrameRYGL;
    end
    else begin
      FrameRYGL := (group.Items[i] as TdxLayoutItem).Control as TFrameRYGL;
    end;
    FrameRYGL.QDZRYlist := ry;
  end;

  for i := n to lgMember1.Count + lgMember2.Count - 1 do
  begin
    if (i+1) mod 2 = 1 then
      group := lgMember1
    else
      group := lgMember2;
    group.Items[(i-1) div 2].Visible := false;
  end;
end;

procedure TFrameQDZView.ShowSP;
var
  json: string;
  list: TList<TQDZSP>;
  item: TQDZSP;
  n, i: integer;
  dxLayoutItem: TdxLayoutItem;
  group: TdxLayoutGroup;
  Frame: TFrameQDZSP;
begin
  json := TRequestItf.pDbQuery('GETT_QDZ_VEDIO', 'QDZDM=' + FQDZ.QDZDM);
  list := TJsonUtils.JsonToRecordList<TQDZSP>(json);
  n := 0;
  for item in list do
  begin
    inc(n);
    if n mod 3 = 1 then
      group := lgVideo1
    else if n mod 3 = 2 then
      group := lgVideo2
    else
      group := lgVideo3;
    i := (n - 1) div 3;
    if group.Count <= i then
    begin
      Frame := TFrameQDZSP.Create(self);
      Frame.Name := 'FrameSP' + n.ToString;
      Frame.dxLayoutGroup2.Visible := false;
      Frame.dxLayoutControl2.Height := 135;
      Frame.dxLayoutControl2.Width := 300;
      Frame.dxLayoutSeparatorItem1.Visible := false;
      Frame.dxLayoutItem2.Visible := false;
      Frame.dxLayoutGroup1.CaptionOptions.Text := '';
      Frame.Enabled := false;

      dxLayoutItem := TdxLayoutItem.Create(self);
      dxLayoutItem.Parent := group;
      dxLayoutItem.Index := group.Count - 1;
      dxLayoutItem.Control := Frame;
    end
    else begin
      dxLayoutItem := group.Items[i] as TdxLayoutItem;
      dxLayoutItem.Visible := true;
      Frame := dxLayoutItem.Control as TFrameQDZSP;
    end;
    Frame.QDZSPlist := item;
  end;

  for i := n to lgVideo1.Count + lgVideo2.Count + lgVideo3.Count - 1 do
  begin
    if (i+1) mod 3 = 1 then
      group := lgVideo1
    else if n mod 3 = 2 then
      group := lgVideo2
    else
      group := lgVideo3;

    group.Items[(i-1) div 3].Visible := false;
  end;
end;

procedure TFrameQDZView.ShowDev;
var
  json: string;
  list: TList<TQDZSB>;
  item: TQDZSB;
  n, i: integer;
  dxLayoutItem: TdxLayoutItem;
  group: TdxLayoutGroup;
  Frame: TFrameQDZViewDev;
begin
  json := TRequestItf.pDbQuery('GETT_QDZ_DEVICE', 'QDZDM=' + FQDZ.QDZDM);
  list := TJsonUtils.JsonToRecordList<TQDZSB>(json);
  n := 0;
  for item in list do
  begin
    inc(n);
    if n mod 2 = 1 then
      group := lgDev1
    else
      group := lgDev2;
    i := (n - 1) div 2;
    if group.Count <= i then
    begin
      Frame := TFrameQDZViewDev.Create(self);
      Frame.Name := 'FrameDev' + n.ToString;
      Frame.dxLayoutControl2.Height := 220;
      Frame.dxLayoutControl2.Width := 400;
      Frame.Enabled := false;

      dxLayoutItem := TdxLayoutItem.Create(self);
      dxLayoutItem.Parent := group;
      dxLayoutItem.Index := group.Count - 1;
      dxLayoutItem.Control := Frame;
    end
    else begin
      Frame := (group.Items[i] as TdxLayoutItem).Control as TFrameQDZViewDev;
    end;
    Frame.QDZ := item;
  end;

  for i := n to lgDev1.Count + lgDev2.Count - 1 do
  begin
    if (i+1) mod 2 = 1 then
      group := lgDev1
    else
      group := lgDev2;
    group.Items[(i-1) div 2].Visible := false;
  end;
end;

procedure TFrameQDZView.btnBackClick(Sender: TObject);
begin
  inherited;
  self.Hide;
end;

procedure TFrameQDZView.btnBaseClick(Sender: TObject);
begin
  inherited;
  lgQDZ.Visible := not lgQDZ.Visible;
end;

procedure TFrameQDZView.btnDevClick(Sender: TObject);
begin
  inherited;
  lgDev.Visible := not lgDev.Visible;
end;

procedure TFrameQDZView.btnMemberClick(Sender: TObject);
begin
  inherited;
  lgMember.Visible := not lgMember.Visible;
end;

procedure TFrameQDZView.btnVideoClick(Sender: TObject);
begin
  inherited;
  lgVideo.Visible := not lgVideo.Visible;
end;

procedure TFrameQDZView.SetQDZ(const Value: TQDZ);
begin
  if FQDZ.QDZDM <> Value.QDZDM then
  begin
    FQDZ := Value;
    SendMessage(self.Handle, wm_setredraw, 0, 0);
    ShowQDZ;
    ShowRY;
    ShowSP;
    ShowDev;
    SendMessage(self.Handle, wm_setredraw, 1, 0);
  end;
end;

end.
