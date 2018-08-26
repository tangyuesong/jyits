unit uFrameMain;
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
  dxSkinXmas2008Blue, dxCustomTileControl, cxClasses, dxTileControl,
  uGlobal, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uRequestItf, uJsonUtils,
  uDictionary, uCommon, System.Generics.Collections, dxpicdata, uModifyPwd,
  Vcl.ExtCtrls, cxContainer, cxEdit, cxTextEdit;

type
  TUserHabit = Record
    SYSTEMID: String;
    YHBH: String;
    MODULE: String;
    AccessCount: String;
    GXSJ: String;
  end;

  TOnTitleClick = procedure(caption: String) of object;

  TFrameMain = class(TFrame)
    FDMemTable1: TFDMemTable;
    dxTileControl1: TdxTileControl;
    dxTileControl1Group1: TdxTileControlGroup;
    dxTileControl1Group2: TdxTileControlGroup;
    dxTileControl1Group3: TdxTileControlGroup;
    tiMap: TdxTileControlItem;
    tiStat: TdxTileControlItem;
    ti2: TdxTileControlItem;
    ti1: TdxTileControlItem;
    ti3: TdxTileControlItem;
    tiPwd: TdxTileControlItem;
    tiAbout: TdxTileControlItem;
    tiAlarm: TdxTileControlItem;
    dxTileControl1Item1: TdxTileControlItem;
    dxTileControl1Item2: TdxTileControlItem;
    dxTileControl1Item3: TdxTileControlItem;
    dxTileControl1Item4: TdxTileControlItem;
    dxTileControl1Item5: TdxTileControlItem;
    dxTileControl1Item6: TdxTileControlItem;
    dxTileControl1Item8: TdxTileControlItem;
    procedure TitleClick(Sender: TdxTileControlItem);
    procedure tiAlarmClick(Sender: TdxTileControlItem);
    procedure tiPwdClick(Sender: TdxTileControlItem);
    procedure FrameResize(Sender: TObject);
  private
    FTi1Caption: String;
    FTi2Caption: String;
    FTi3Caption: String;
    FDetail: TdxFramePicData;
    FOnTitleClick: TOnTitleClick;
    procedure AfterConstruction; override;
    procedure GettiImage;
    function GetItemCaption(index: Integer): String;
  public
    property OnTitleClick: TOnTitleClick read FOnTitleClick write FOnTitleClick;
    { Public declarations }
  end;

  TLoadPicThread = Class(TThread)
  private
    FDxTC: TdxTileControlItem;
    procedure LoadPictures;
  protected
    procedure Execute; override;
  public
    constructor Create(dxTC: TdxTileControlItem); overload;
  End;

var
  FrameMain: TFrameMain;

implementation

{$R *.dfm}

uses uMain;
{ TFrameMain }

procedure TFrameMain.AfterConstruction;
var
  habitList: TList<TUserHabit>;
  habit: TUserHabit;
  i: Integer;
  ti: TdxTileControlItem;
  pic: String;
begin
  inherited;
  {
    habitList := TJsonUtils.JsonToRecordList<TUserHabit>
    (TRequestItf.DbQuery('GetT_USER_HABIT', 'top=3&yhbh=' + gUser.YHBH +
    '&orderby_desc=AccessCount'));
    i := 1;
    for habit in habitList do
    begin
    if i = 1 then
    begin
    ti := ti1;
    FTi1Caption := habit.MODULE;
    end
    else if i = 2 then
    begin
    ti := ti2;
    FTi2Caption := habit.MODULE;
    end
    else if i = 3 then
    begin
    ti := ti3;
    FTi3Caption := habit.MODULE;
    end;
    pic := ExtractFilePath(ParamStr(0)) + 'image\' + habit.MODULE + '.png';
    with ti do
    begin
    if FileExists(pic) then
    begin
    Glyph.Image.LoadFromFile(pic);
    Glyph.Mode := ifmFit;
    end
    else
    begin
    Text1.Align := oaMiddleCenter;
    Text1.Transparent := False;
    Text1.Font.Color := clBlack;
    Text1.Color := clWhite;
    Text1.Font.Size := 12;
    Text1.Value := habit.MODULE;
    end;
    end;
    inc(i);
    end;
    habitList.Free;
    GettiImage;
    TLoadPicThread.Create(tiAlarm);
    // LoadPictures;
  }
end;

procedure TFrameMain.FrameResize(Sender: TObject);
var
  w, h: Integer;
begin
  h := (Self.Height - Self.dxTileControl1.OptionsView.IndentVert * 2 -
    Self.dxTileControl1.OptionsView.ItemIndent * 2 - 20) div 3;
  w := Round(((Self.Width - Self.dxTileControl1.OptionsView.IndentHorz * 2 -
    Self.dxTileControl1.OptionsView.GroupIndent * 2) / 3) / 2.1);
  if w * h > 0 then
  begin
    if h > 170 then
      h := 170;
    if w > 170 then
      w := 170;
  end
  else
  begin
    h := 170;
    w := 170;
  end;

  Self.dxTileControl1.OptionsView.ItemHeight := h;
  Self.dxTileControl1.OptionsView.ItemWidth := w;
end;

function TFrameMain.GetItemCaption(index: Integer): String;
begin
  if index = 1 then
    Result := '地图'
  else if index = 2 then
  begin
    if tiStat.ActiveFrameIndex = 0 then
      Result := '过车流量统计'
    else
      Result := '缉查业务开展情况';
  end
  else if index = 3 then
    Result := FTi1Caption
  else if index = 4 then
    Result := FTi2Caption
  else if index = 5 then
    Result := FTi3Caption
  else
    Result := '';
end;

procedure TFrameMain.GettiImage;
begin
  tiMap.Glyph.Image.LoadFromFile(ExtractFilePath(ParamStr(0)) +
    'image\map.png');

  with tiStat.Frames.Add do
  begin
    Glyph.Image.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\tiStat.png');
    Glyph.Mode := ifmFit;
  end;
  with tiStat.Frames.Add do
  begin
    Glyph.Image.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\jcyw.png');
    Glyph.Mode := ifmFit;
  end;

  tiPwd.Glyph.Image.LoadFromFile(ExtractFilePath(ParamStr(0)) +
    'image\tiPwd.png');

  tiAbout.Glyph.Image.LoadFromFile(ExtractFilePath(ParamStr(0)) +
    'image\tiAbout.png');

  if FTi1Caption = '' then
  begin
    FTi1Caption := '电子警察数据采集';
    ti1.Glyph.Image.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\' +
      FTi1Caption + '.png');
    ti1.Glyph.Mode := ifmFit;
  end;
  if FTi2Caption = '' then
  begin
    FTi2Caption := '布控车辆实时监控';
    ti2.Glyph.Image.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\' +
      FTi2Caption + '.png');
    ti2.Glyph.Mode := ifmFit;
  end;
  if FTi3Caption = '' then
  begin
    FTi3Caption := '布控数据历史反馈';
    ti3.Glyph.Image.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\' +
      FTi3Caption + '.png');
    ti3.Glyph.Mode := ifmFit;
  end;
end;

procedure TFrameMain.tiAlarmClick(Sender: TdxTileControlItem);
var
  s: string;
  i, j: Integer;
begin
  if Sender.ActiveFrame = nil then
    exit;
  if not Assigned(FDetail) then
  begin
    FDetail := TdxFramePicData.Create(Self);
    FDetail.Parent := Self.Parent;
    FDetail.Align := TAlign.alClient;
  end;
  s := Sender.ActiveFrame.Text1.Value;
  FDetail.hphm := s.Substring(0, s.IndexOf('['));
  s := s.Substring(s.IndexOf('[') + 1, s.IndexOf(']') - s.IndexOf('[') - 1);
  FDetail.hpzl := TLZDictionary.getkey('Main', 'HPZL', s);
  FDetail.LoadPassList;
  FDetail.Show;
end;

procedure TFrameMain.tiPwdClick(Sender: TdxTileControlItem);
begin
  if not Assigned(frmModifyPwd) then
    Application.CreateForm(TfrmModifyPwd, frmModifyPwd);
{$IFDEF WEBXONE}
  wxoShowModal(frmModifyPwd, frmMain);
{$ELSE}
  frmModifyPwd.ShowModal;
{$ENDIF}
end;

procedure TFrameMain.TitleClick(Sender: TdxTileControlItem);
var
  s: String;
begin
  if Assigned(OnTitleClick) then
  begin
    s := GetItemCaption(Sender.Tag);
    if s <> '' then
      OnTitleClick(s);
  end;
end;

{ TLoadPicThread }

constructor TLoadPicThread.Create(dxTC: TdxTileControlItem);
begin
  FDxTC := dxTC;
  inherited Create(False);
end;

procedure TLoadPicThread.Execute;
begin
  inherited;
  LoadPictures;
end;

procedure TLoadPicThread.LoadPictures;
  function GetPicUrl(hphm, hpzl: string): string;
  var
    json, Param: string;
    table: TFDMemTable;
  begin
    Result := '';
    Param := 'YHBH=' + gUser.YHBH +
      '&begin_GCSJ=2011/01/01&end_GCSJ=2099/01/01&zt=&BKLX=&HPHM=' + hphm;
    // +'&HPZL=' + hpzl;
    json := TRequestItf.DbQuery('GetALARMRESULT', Param);
    table := TFDMemTable.Create(nil);
    TJsonUtils.JSONToDataSet(json, table);
    if not table.Eof then
      Result := table.FieldByName('viourl').AsString;
    table.Free;
  end;

var
  json, Param, picFile, hphm, hpzl, url: string;
  table: TFDMemTable;
  n: Integer;
begin
  Param := Format('yhbh=%s&kssj=%s&jssj=%s',
    [gUser.YHBH, formatdatetime('yyyy/mm/dd', now - 365),
    formatdatetime('yyyy/mm/dd', now)]);
  json := TRequestItf.DbQuery('GetVehPassTotal', Param);
  table := TFDMemTable.Create(nil);
  TJsonUtils.JSONToDataSet(json, table);
  table.DisableControls;
  while not table.Eof do
  begin
    hphm := table.FieldByName('HPHM').AsString;
    hpzl := table.FieldByName('HPZL').AsString;
    url := GetPicUrl(hphm, hpzl);
    if url <> '' then
    begin
      picFile := gSetup.DirSave + hphm + '.jpg';
      if TCommon.GetPic(url, '', picFile) then
      begin
        if TCommon.IsJpgFile(picFile) then
        begin
          with FDxTC.Frames.Add do
          begin
            Text1.Transparent := False;
            Text2.Transparent := False;
            Text4.Transparent := False;
            Text1.Font.Color := clBlack;
            Text2.Font.Color := clBlack;
            Text4.Font.Color := clBlack;
            Text1.Color := clWhite;
            Text2.Color := clWhite;
            Text4.Color := clWhite;
            Text1.Font.Size := 12;
            Text2.Font.Size := 12;
            Text4.Font.Size := 12;
            Text1.Value := hphm + '[' + TLZDictionary.gDicMain['HPZL'][hpzl] +
              ']' + '  ' + table.FieldByName('ZHGCSJ').AsString;
            // Text2.Value := table.FieldByName('C1').AsString;
            if TLZDictionary.gDicDev[2].ContainsKey(table.FieldByName('ZCCXDD')
              .AsString) then
              Text4.Value := TLZDictionary.gDicDev[2]
                [table.FieldByName('ZCCXDD').AsString].SBDDMC
            else
              Text4.Value := '';
            try
              Glyph.Image.LoadFromFile(picFile);
            except
            end;
            Glyph.Mode := ifmFit;
          end;
          if FDxTC.Frames.Count >= 3 then
            Break;
        end;
      end;
    end;
    table.Next;
  end;
  table.Free;
end;

end.
