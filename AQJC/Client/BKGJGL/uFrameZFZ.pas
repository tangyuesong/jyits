unit uFrameZFZ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, IOUtils,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, DateUtils,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, ActiveX, Data.DB,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxCustomTileControl, cxClasses, dxTileControl,
  dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, Vcl.StdCtrls,
  dxLayoutControlAdapters, Vcl.Menus, cxButtons, Vcl.ExtCtrls, IdHTTP,
  dxAnimation, System.ImageList, Vcl.ImgList, uDM, Generics.Collections,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, cxLabel, uEntity,
  cxMemo, uFrameSelectDev, uFrameFeedback, uFrameSign, dxpicdata,
  System.Win.ComObj, System.Contnrs,  cxGroupBox, uFrameInput,
  dxGDIPlusClasses, cxCheckBox, dxViodata, cxMaskEdit, cxDropDownEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, cxCheckComboBox, cxCheckListBox;

type
  TBack = procedure of Object;
  TFrameZFZ = class(TFrame)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup3: TdxLayoutGroup;
    edtSYXZ: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutGroup4: TdxLayoutGroup;
    edtDJRQ: TcxTextEdit;
    dxLayoutItem13: TdxLayoutItem;
    edtCLPP: TcxTextEdit;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem29: TdxLayoutItem;
    edtCLLX: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    cboJC: TcxComboBox;
    dxLayoutItem2: TdxLayoutItem;
    edthphm: TcxTextEdit;
    dxLayoutItem3: TdxLayoutItem;
    cboHPZL: TcxComboBox;
    dxLayoutGroup1: TdxLayoutGroup;
    lgVeh: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutGroup6: TdxLayoutGroup;
    dxLayoutGroup7: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    cboJCCLLX: TcxComboBox;
    edtWFCS: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    edtCLZT: TcxTextEdit;
    cbYQWNJ: TcxCheckBox;
    dxLayoutItem9: TdxLayoutItem;
    cbYQWBF: TcxCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    cbWFWCL: TcxCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    edtSFD: TcxCombobox;
    dxLayoutItem12: TdxLayoutItem;
    lgBaseInfo: TdxLayoutGroup;
    dxLayoutGroup9: TdxLayoutGroup;
    edtMDD: TcxCombobox;
    dxLayoutItem16: TdxLayoutItem;
    dxLayoutItem17: TdxLayoutItem;
    edtZFZMC: TcxCombobox;
    dxLayoutItem18: TdxLayoutItem;
    cbSFYFJ: TcxCheckBox;
    dxLayoutItem19: TdxLayoutItem;
    cboGPS: TcxComboBox;
    dxLayoutItem20: TdxLayoutItem;
    cboJCR: TcxComboBox;
    dxLayoutItem22: TdxLayoutItem;
    edtJCSJ: TcxDateEdit;
    dxLayoutGroup11: TdxLayoutGroup;
    dxLayoutItem23: TdxLayoutItem;
    edtMS: TcxMemo;
    lgDrivera: TdxLayoutGroup;
    lgDriver1: TdxLayoutGroup;
    lgDriver2: TdxLayoutGroup;
    lgDriver3: TdxLayoutGroup;
    lgDriver11: TdxLayoutGroup;
    liDriver1: TdxLayoutItem;
    liDriver3: TdxLayoutItem;
    liDriver4: TdxLayoutItem;
    liDriver5: TdxLayoutItem;
    liDriver6: TdxLayoutItem;
    liDriver7: TdxLayoutItem;
    liDriver9: TdxLayoutItem;
    liDriver10: TdxLayoutItem;
    liDriver13: TdxLayoutItem;
    liDriver12: TdxLayoutItem;
    liDriver8: TdxLayoutItem;
    txtDriverJSZH: TcxCombobox;
    txtDriverXM: TcxTextEdit;
    txtDriverLXDH: TcxTextEdit;
    txtDriverFZJG: TcxTextEdit;
    txtDriverJZZT: TcxTextEdit;
    txtDriverLZRQ: TcxTextEdit;
    txtDriverZJCX: TcxTextEdit;
    txtDriverLXDZ: TcxTextEdit;
    cbDriverCF: TcxCheckBox;
    cbDriverYQWSY: TcxCheckBox;
    cbDriverYQWHZ: TcxCheckBox;

    lgFJSa: TdxLayoutGroup;
    lgFJS1: TdxLayoutGroup;
    lgFJS2: TdxLayoutGroup;
    lgFJS3: TdxLayoutGroup;
    lgFJS11: TdxLayoutGroup;
    liFJS1: TdxLayoutItem;
    liFJS3: TdxLayoutItem;
    liFJS4: TdxLayoutItem;
    liFJS5: TdxLayoutItem;
    liFJS6: TdxLayoutItem;
    liFJS7: TdxLayoutItem;
    liFJS9: TdxLayoutItem;
    liFJS10: TdxLayoutItem;
    liFJS13: TdxLayoutItem;
    liFJS12: TdxLayoutItem;
    liFJS8: TdxLayoutItem;
    txtFJSJSZH: TcxCombobox;
    txtFJSXM: TcxTextEdit;
    txtFJSLXDH: TcxTextEdit;
    txtFJSFZJG: TcxTextEdit;
    txtFJSJZZT: TcxTextEdit;
    txtFJSLZRQ: TcxTextEdit;
    txtFJSZJCX: TcxTextEdit;
    txtFJSLXDZ: TcxTextEdit;
    cbFJSCF: TcxCheckBox;
    cbFJSYQWSY: TcxCheckBox;
    cbFJSYQWHZ: TcxCheckBox;

    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem2: TdxLayoutSeparatorItem;
    dxLayoutSeparatorItem3: TdxLayoutSeparatorItem;
    lgFJS: TdxLayoutGroup;
    lgDriver: TdxLayoutGroup;
    dxLayoutSeparatorItem4: TdxLayoutSeparatorItem;
    cxButton1: TcxButton;
    dxLayoutItem15: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    cxButton2: TcxButton;
    liHZ: TdxLayoutItem;
    liSZ: TdxLayoutItem;
    edtHZ: TcxTextEdit;
    edtSZ: TcxTextEdit;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutGroup12: TdxLayoutGroup;
    dxLayoutGroup13: TdxLayoutGroup;
    dxLayoutGroup14: TdxLayoutGroup;
    dxLayoutItem25: TdxLayoutItem;
    clbJCNR: TcxCheckListBox;
    liBack: TdxLayoutItem;
    cxButton3: TcxButton;
    liMessage: TdxLayoutItem;
    procedure edthphmKeyPress(Sender: TObject; var Key: Char);
    procedure cboHPZLPropertiesCloseUp(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure txtDriverJSZHKeyPress(Sender: TObject; var Key: Char);
    procedure txtFJSJSZHKeyPress(Sender: TObject; var Key: Char);
    procedure cboJCCLLXPropertiesChange(Sender: TObject);
    procedure cbSFYFJPropertiesChange(Sender: TObject);
    procedure txtDriverJSZHPropertiesCloseUp(Sender: TObject);
    procedure txtFJSJSZHPropertiesCloseUp(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure edtZFZMCPropertiesChange(Sender: TObject);
  private
    FItem: TVehCheck;
    FOnBack: TBack;
    procedure ShowItem(item: TVehCheck);
    function CheckInput: boolean;
    function GetColor(hpzl: string): TColor;
    procedure LoadVehInfo;
    procedure LoadDrvInfo;
    procedure LoadFJInfo;
    function Submit: boolean;
    procedure ChangeCheckBoxColor(cb: TcxCheckBox);
    procedure SetCboValue(cbo: TcxCombobox; subValue: string);
    procedure BindHistory;
    procedure ClearInputs;
    function GetFWZInfo: TFwzInfo;
    procedure SetVehCheckItem(const Value: TVehCheck);
  public
    procedure BeforeDestruction; override;
    procedure AfterConstruction; override;
    property VehCheckItem: TVehCheck read FItem write SetVehCheckItem;
    property OnBack: TBack read FOnBack write FOnBack;
  end;

implementation

uses
  uRequestItf, uJsonUtils, uGlobal, Udictionary, uCommon;
{$R *.dfm}

procedure TFrameZFZ.AfterConstruction;
var
  json: string;
  list: TList<TFwzInfo>;
  item: TFwzInfo;
begin
  inherited;
  TLZDictionary.BindCombobox(cboJC, TLZDictionary.gDicMain['JC'], True);
  TLZDictionary.BindCombobox(cbohpzl, TLZDictionary.gDicMain['HPZL'], True);
  TLZDictionary.BindCombobox(cboJCCLLX, TLZDictionary.gDicMain['JCCLLX'], True);

  json := TRequestItf.DbQuery('GetFwzInfo', 'CJR='+gUser.YHXM);
  list := TJsonUtils.JsonToRecordList<TFwzInfo>(json);
  edtZFZMC.Properties.Items.Clear;
  for item in list do
  begin
    edtZFZMC.Properties.Items.AddPair(item.FWZMC, item.FWZBH);
  end;
  list.Free;
end;

procedure TFrameZFZ.BeforeDestruction;
begin
  inherited;
end;

procedure TFrameZFZ.cboHPZLPropertiesCloseUp(Sender: TObject);
begin
  LoadVehInfo;
  BindHistory;
end;

procedure TFrameZFZ.cboJCCLLXPropertiesChange(Sender: TObject);
var
  jccllx: string;
begin
  clbJCNR.Items.Clear;
  clbJCNR.Items.Add.Text := '疲劳驾驶';
  clbJCNR.Items.Add.Text := '安全设备不合格';
  clbJCNR.Items.Add.Text := '轮胎花纹不合格';
  clbJCNR.Items.Add.Text := '未系安全带';
  liHZ.Enabled := false;
  liSZ.Enabled := false;
  jccllx := Copy(cboJCCLLX.Text, 1, 2);
  if (jccllx = '01')or(jccllx = '03') then
  begin
    clbJCNR.Items.Add.Text := '违法营运';
    clbJCNR.Items.Add.Text := '车辆超员';
    liHZ.Enabled := true;
    liSZ.Enabled := true;
    liHZ.CaptionOptions.Text := '核载(人)';
    liSZ.CaptionOptions.Text := '实载(人)';
  end
  else if jccllx = '02' then
  begin
    clbJCNR.Items.Add.Text := '未悬挂或喷涂警示标志';
    clbJCNR.Items.Add.Text := '未按指定时间行驶';
    clbJCNR.Items.Add.Text := '未按指定路线行驶';
    clbJCNR.Items.Add.Text := '未取得道路运输通行证';
  end
  else if jccllx = '04' then
  begin
    clbJCNR.Items.Add.Text := '未按规定粘贴反光标识';
    clbJCNR.Items.Add.Text := '未安装侧后防护装置';
    clbJCNR.Items.Add.Text := '非法改装';
    clbJCNR.Items.Add.Text := '超载';
    liHZ.Enabled := true;
    liSZ.Enabled := true;
    liHZ.CaptionOptions.Text := '核载(吨)';
    liSZ.CaptionOptions.Text := '实载(吨)';
  end;
end;

procedure TFrameZFZ.cbSFYFJPropertiesChange(Sender: TObject);
begin
  lgFJS.Visible := cbSFYFJ.Checked;
end;

function TFrameZFZ.CheckInput: boolean;
begin
  result := false;
  if edtZFZMC.SelectedItem = -1 then
  begin
    Application.MessageBox('未选择服务站', '提示');
    exit;
  end;
  if self.edtSFD.Text = '' then
  begin
    Application.MessageBox('请输入始发地', '提示');
    self.edtSFD.SetFocus;
    exit;
  end;
  if self.edtMDD.Text = '' then
  begin
    Application.MessageBox('请输入目的地', '提示');
    self.edtMDD.SetFocus;
    exit;
  end;
  if self.txtDriverJSZH.Text = '' then
  begin
    Application.MessageBox('请输入主驾驶证号', '提示');
    self.txtDriverJSZH.SetFocus;
    exit;
  end;
  if self.cbSFYFJ.Checked and (self.txtFJSJSZH.Text = '') then
  begin
    Application.MessageBox('请输入副驾驶证号', '提示');
    self.txtFJSJSZH.SetFocus;
    exit;
  end;
  result := true;
end;

function TFrameZFZ.Submit: boolean;
var
  params, r, jccllx: string;
  item: TcxCheckListBoxItem;
  i: Integer;
begin
  jccllx := Copy(cboJCCLLX.Text, 1, 2);
  if FItem.FWZBH = '' then
  begin
    FItem.FWZBH := edtZFZMC.Properties.Items.ValueFromIndex[edtZFZMC.SelectedItem];
    FItem.FWZMC := edtZFZMC.Properties.Items.Names[edtZFZMC.SelectedItem];
  end;
  params := 'fwzbh=' + FItem.fwzbh;
  params := params + '&fwzmc=' + FItem.fwzmc;
  params := params + '&flag=1';
  if FItem.systemid <> '' then
    params := params + '&systemid=' + FItem.systemid;
  params := params + '&clzt=1';
  params := params + '&hpzl=' + Copy(cbohpzl.Text, 1, 2);
  params := params + '&hphm=' + TLZDictionary.StrtoDicInfo(cboJC.Text).mc + edtHPHM.Text;
  params := params + '&jccllx=' + jccllx;
  params := params + '&sfd=' + edtsfd.Text;
  params := params + '&mdd=' + edtmdd.Text;
  if (jccllx = '01') or (jccllx = '03') then
    params := params + '&zks=' + edtSZ.Text;
  if jccllx = '04' then
    params := params + '&sjzzl=' + edtSZ.Text;
  if cboGPS.Text = '正常' then
    params := params + '&gps=1'
  else if cboGPS.Text = '未开启' then   // TODO: 与文档不符
    params := params + '&gps=0'
  else if cboGPS.Text = '未配备' then
    params := params + '&gps=9';
  for i := 0 to clbJCNR.Items.Count - 1 do
  begin
    item := clbJCNR.Items[i];
    if item.Text = '疲劳驾驶' then
    begin
      if item.Checked then
        params := params + '&pljs=1'
      else
        params := params + '&pljs=0';
    end
    else if item.Text = '安全设备不合格' then
    begin
      if item.Checked then
        params := params + '&aqsb=0'
      else
        params := params + '&aqsb=1';
    end
    else if item.Text = '轮胎花纹不合格' then
    begin
      if item.Checked then
        params := params + '&cllthw=0'
      else
        params := params + '&cllthw=1';
    end
    else if item.Text = '未系安全带' then
    begin
      if item.Checked then
        params := params + '&jaqd=0'
      else
        params := params + '&jaqd=1';
    end
    else if item.Text = '违法营运' then
    begin
      if item.Checked then
        params := params + '&wfyy=1'
      else
        params := params + '&wfyy=0';
    end
    else if item.Text = '车辆超员' then
    begin
      if item.Checked then
        params := params + '&cy=1'
      else
        params := params + '&cy=0';
    end
    else if item.Text = '未悬挂或喷涂警示标志' then
    begin
      if item.Checked then
        params := params + '&XGJSBZ=0'
      else
        params := params + '&XGJSBZ=1';
    end
    else if item.Text = '未按指定时间行驶' then
    begin
      if item.Checked then
        params := params + '&AZDSJ=0'
      else
        params := params + '&AZDSJ=1';
    end
    else if item.Text = '未按指定路线行驶' then
    begin
      if item.Checked then
        params := params + '&AZDLX=0'
      else
        params := params + '&AZDLX=1';
    end
    else if item.Text = '未取得道路运输通行证' then
    begin
      if item.Checked then
        params := params + '&QDYSTXZ=0'
      else
        params := params + '&QDYSTXZ=1';
    end
    else if item.Text = '未按规定粘贴反光标识' then
    begin
      if item.Checked then
        params := params + '&ZTFGBS=0'
      else
        params := params + '&ZTFGBS=1';
    end
    else if item.Text = '未安装侧后防护装置' then
    begin
      if item.Checked then
        params := params + '&AZFHZZ=0'
      else
        params := params + '&AZFHZZ=1';
    end
    else if item.Text = '非法改装' then
    begin
      if item.Checked then
        params := params + '&FFGZ=1'
      else
        params := params + '&FFGZ=0';
    end
    else if item.Text = '超载' then
    begin
      if item.Checked then
        params := params + '&CZ=1'
      else
        params := params + '&CZ=0';
    end;
  end;
  //params := params + '&sfwzjs=' + FItem.sfwzjs;      // 无证驾驶
  if cbSFYFJ.Checked then
    params := params + '&sfyfjsy=1';
  if self.cbYQWNJ.Checked then
    params := params + '&sfyqwjy=1';
  if self.cbYQWBF.Checked then
    params := params + '&sfyqwbf=1';
  if self.cbWFWCL.Checked then
    params := params + '&sfwfwcl=1';
  params := params + '&jcjg=00';  // 重大按情
  if edtMS.Text <> '' then
    params := params + '&jcqkms=' + edtMS.Text;
  params := params + '&jcsj=' + FormatDateTime('yyyy-mm-dd hh:mm:ss', edtJCSJ.Date);
  params := params + '&gcsj=' + FormatDateTime('yyyy-mm-dd hh:mm:ss', edtJCSJ.Date);
  params := params + '&jcmj=' + cboJCR.Text;
  params := params + '&zjszh=' + self.txtDriverJSZH.Text;
  if self.txtDriverLXDH.Text = '' then
     self.txtDriverLXDH.Text := '无';
  params := params + '&zjslxdh=' + self.txtDriverLXDH.Text;
  {params := params + '&zlxdh=' + self.txtDriverLXDH.Text;
  if self.cbDriverCF.Checked then
    params := params + '&zjssfcf=1';
  if self.cbDriverYQWSY.Checked then
    params := params + '&zjssfyqwsy=1';
  if self.cbDriverYQWHZ.Checked then
    params := params + '&zjssfyqwhz=1';   }
  //params := params + '&zjszjbf=';     // 主驾驶准驾不符
  if self.lgFJS.Visible then
  begin
    params := params + '&fjszh=' + self.txtFJSJSZH.Text;
    if self.txtFJSLXDH.Text = '' then
      self.txtFJSLXDH.Text := '无';
      params := params + '&fjslxdh=' + self.txtFJSLXDH.Text;

    {params := params + '&flxdh=' + self.txtFJSLXDH.Text;
    if self.cbFJSCF.Checked then
      params := params + '&fjssfcf=1';
    if self.cbFJSYQWSY.Checked then
      params := params + '&fjssfyqwsy=1';
    if self.cbFJSYQWHZ.Checked then
      params := params + '&fjssfyqwhz=1';  }
  end;
  if FItem.systemid = '' then
    r := TRequestItf.DbQuery('vehcheckNew', params)
  else
    r := TRequestItf.DbQuery('vehcheckUpdate', params);
  //result := r.Contains('"code":"1"');
  result := r = '1';
  if not result then
  begin
    r := r.Substring(r.IndexOf('"message":') + 11);
    r := r.Substring(0, r.IndexOf('"'));
    Application.MessageBox(PWideChar('保存失败！' + r), '提示');
  end
  else begin
    Application.MessageBox(PWideChar('保存成功！' + r), '提示');
    cxButton3Click(nil);
  end;
end;

procedure TFrameZFZ.ClearInputs;
var
  item: TVehCheck;
begin
  item.HDZKL := 0;
  item.HDZZL := 0;
  item.ZKS := 0;
  item.SJZZL := 0;
  ShowItem(item);
end;

procedure TFrameZFZ.cxButton1Click(Sender: TObject);
begin
  if CheckInput then
  begin
    Submit;
  end;
end;

procedure TFrameZFZ.cxButton2Click(Sender: TObject);
begin
  ClearInputs;
end;

procedure TFrameZFZ.cxButton3Click(Sender: TObject);
begin
  if Assigned(OnBack) then
    OnBack;
end;

function TFrameZFZ.GetFWZInfo: TFwzInfo;
var
  json: string;
begin
  json := TRequestItf.DbQuery('GetFWZInfo', 'CJR='+gUser.YHXM);
  result := TJsonUtils.JsonToRecord<TFwzInfo>(json);
end;

procedure TFrameZFZ.edthphmKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    LoadVehInfo;
    BindHistory;
  end;
end;

procedure TFrameZFZ.edtZFZMCPropertiesChange(Sender: TObject);
var
  json: string;
  list: TList<TQDZRY>;
  item: TQDZRY;
begin
  if edtZFZMC.SelectedItem >= 0 then
  begin
    json := TRequestItf.DbQuery('VehCheckGetPerson', 'FWZBH='+edtZFZMC.Properties.Items.ValueFromIndex[edtZFZMC.SelectedItem]);
    list := TJsonUtils.JsonToRecordList<TQDZRY>(json);
    cboJCR.Properties.Items.Clear;
    for item in list do
    begin
      cboJCR.Properties.Items.Add(item.XM);
    end;
    list.Free;
  end;
end;

function TFrameZFZ.GetColor(hpzl: string): TColor;
begin
  if hpzl = '02' then
    result := clblue
  else if hpzl = '06' then
    result := clGray
  else if (hpzl = '23') or (hpzl = '24') then
    result := clWhite
  else
    result := clWebOrange;
end;

procedure TFrameZFZ.SetCboValue(cbo: TcxCombobox; subValue: string);
var
  i: Integer;
begin
  for i := 0 to cbo.Properties.Items.Count - 1 do
  begin
    if cbo.Properties.Items[i].Contains(subValue) then
    begin
      cbo.SelectedItem := i;
      cbo.Text := cbo.Properties.Items[i];
    end;
  end;
end;

procedure TFrameZFZ.SetVehCheckItem(const Value: TVehCheck);
begin
  FItem := Value;
  ShowItem(Value);
  liBack.Visible := true;
end;

procedure TFrameZFZ.ShowItem(item: TVehCheck);
begin
  SetCboValue(cboJC, item.HPHM.Substring(0, 1));
  edtHPHM.Text := item.HPHM.Substring(1);
  SetCboValue(cboHPZL, item.HPZL);
  SetCboValue(cboJCCLLX, item.JCCLLX);
  liMessage.CaptionOptions.Text := item.Message;
  txtDriverJSZH.Text := '';
  LoadVehInfo;
  if item.SFD = '' then
    BindHistory;
  edtSFD.Text := item.SFD;
  edtMDD.Text := item.MDD;
  edtZFZMC.Properties.ReadOnly := false;
  SetCboValue(edtZFZMC, item.FWZMC);
  edtZFZMC.Properties.ReadOnly := item.FWZBH <> '';
  cbSFYFJ.Checked := item.SFYFJSY = '1';
  lgFJS.Visible := cbSFYFJ.Checked;
  if item.GPS='1' then
    cboGPS.Text := '正常'
  else if item.GPS='0' then
    cboGPS.Text := '未开启'
  else if item.GPS='9' then
    cboGPS.Text := '未配备'
  else
    cboGPS.Text := '';
  edtHZ.Text := IntToStr(item.HDZKL + item.HDZZL);
  edtSZ.Text := '0';//IntToStr(item.ZKS + item.SJZZL);
  cboJCR.Text := gUser.YHXM;
  if item.JCSJ = '' then
    edtJCSJ.Text := FormatDateTime('yyyy/mm/dd hh:mm:ss', now - OneMinute * 5)
  else
    edtJCSJ.Text := item.JCSJ;
  edtMS.Text := item.JCQKMS;
  if item.SFD = '' then
    LoadDrvInfo
  else begin
    txtDriverJSZH.Text := item.ZJSZH;
    txtFJSJSZH.Text := item.FJSZH;
  end;
  dxLayoutItem15.Visible := (item.SFD = '') or (item.flag = 3);
  dxLayoutItem24.Visible := dxLayoutItem15.Visible;
end;

procedure TFrameZFZ.LoadVehInfo;
var
  veh: TVehInfo;
begin
  veh := TCommon.GetVehinfo(TLZDictionary.StrtoDicInfo(cboJC.Text).mc + edtHPHM.Text, TLZDictionary.StrtoDicInfo(cboHPZL.Text).dm, '');

  if TLZDictionary.gDicMain['CLLX'].ContainsKey(veh.cllx) then
    edtCLLX.Text := TLZDictionary.gDicMain['CLLX'][veh.cllx];
  if TLZDictionary.gDicMain['SYXZ'].ContainsKey(veh.cllx) then
    edtSYXZ.Text := TLZDictionary.gDicMain['SYXZ'][veh.syxz];
  edtCLPP.Text := veh.clpp1;
  edtDJRQ.Text := veh.ccdjrq;
  edtCLZT.Text := TLZDictionary.DM2MC('CLZT', veh.zt);
  if veh.yxqz <> '' then
  begin
    cbYQWNJ.Caption := '是' + veh.yxqz.Substring(0,10);
    cbYQWNJ.Checked := veh.yxqz < formatdatetime('yyyy-mm-dd', now);
    cbYQWBF.Caption := '是' + veh.qzbfqz.Substring(0,10);
    cbYQWBF.Checked := veh.qzbfqz < formatdatetime('yyyy-mm-dd', now);
  end;
  cbWFWCL.Checked := veh.zt.Contains('G');
  ChangeCheckBoxColor(cbYQWNJ);
  ChangeCheckBoxColor(cbYQWBF);
  ChangeCheckBoxColor(cbWFWCL);
end;

procedure TFrameZFZ.LoadDrvInfo;
var
  drv: TDrvInfo;
begin
  drv := TCommon.GetDrvInfo(txtDriverJSZH.Text);
  txtDriverXM.Text := drv.XM;
  txtDriverFZJG.Text := drv.fzjg;
  txtDriverJZZT.Text := TLZDictionary.DM2MC('JSRZT', drv.zt);
  txtDriverLZRQ.Text := drv.cclzrq;
  txtDriverZJCX.Text := drv.zjcx;
  txtDriverLXDH.Text := drv.lxdh;
  txtDriverLXDZ.Text := drv.djzsxxdz;
  cbDriverCF.Checked := drv.zt.Contains('B');
  cbDriverYQWSY.Checked := drv.zt.Contains('R');
  cbDriverYQWHZ.Checked := drv.zt.Contains('M');
  ChangeCheckBoxColor(cbDriverCF);
  ChangeCheckBoxColor(cbDriverYQWSY);
  ChangeCheckBoxColor(cbDriverYQWHZ);
end;

procedure TFrameZFZ.LoadFJInfo;
var
  drv: TDrvInfo;
begin
  drv := TCommon.GetDrvInfo(txtFJSJSZH.Text);
  txtFJSXM.Text := drv.XM;
  txtFJSFZJG.Text := drv.fzjg;
  txtFJSJZZT.Text := TLZDictionary.DM2MC('JSRZT', drv.zt);
  txtFJSLZRQ.Text := drv.cclzrq;
  txtFJSZJCX.Text := drv.zjcx;
  txtFJSLXDH.Text := drv.lxdh;
  txtFJSLXDZ.Text := drv.djzsxxdz;
  cbFJSCF.Checked := drv.zt.Contains('B');
  cbFJSYQWSY.Checked := drv.zt.Contains('R');
  cbFJSYQWHZ.Checked := drv.zt.Contains('M');
  ChangeCheckBoxColor(cbFJSCF);
  ChangeCheckBoxColor(cbFJSYQWSY);
  ChangeCheckBoxColor(cbFJSYQWHZ);
end;

procedure TFrameZFZ.txtDriverJSZHKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    LoadDrvInfo;
  end;
end;

procedure TFrameZFZ.txtDriverJSZHPropertiesCloseUp(Sender: TObject);
begin
  LoadDrvInfo;
end;

procedure TFrameZFZ.txtFJSJSZHKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    LoadFJInfo;
  end;
end;

procedure TFrameZFZ.txtFJSJSZHPropertiesCloseUp(Sender: TObject);
begin
  LoadFJInfo;
end;

procedure TFrameZFZ.ChangeCheckBoxColor(cb: TcxCheckBox);
begin
  if cb.Checked then
    cb.Style.Color := clRed
  else
    cb.Style.Color := clBtnFace;
end;

procedure TFrameZFZ.BindHistory;
var
  json: string;
  list: TList<TVehCheckHis>;
  item: TVehCheckHis;
  hphm, hpzl: string;
begin
  hphm := TLZDictionary.StrtoDicInfo(cboJC.Text).mc + edtHPHM.Text;
  hpzl := TLZDictionary.StrtoDicInfo(cboHPZL.Text).dm;
  edtSFD.Properties.Items.Clear;
  edtMDD.Properties.Items.Clear;
  txtDriverJSZH.Properties.Items.Clear;
  txtFJSJSZH.Properties.Items.Clear;
  json := TRequestItf.DbQuery('VehCheckHis', 'hphm='+hphm+'&hpzl='+hpzl);
  list := TJsonUtils.JsonToRecordList<TVehCheckHis>(json);
  for item in list do
  begin
    if edtSFD.Properties.Items.IndexOf(item.SFD) = -1 then
      edtSFD.Properties.Items.Add(item.SFD);
    if edtMDD.Properties.Items.IndexOf(item.MDD) = -1 then
      edtMDD.Properties.Items.Add(item.MDD);
    if (item.ZJSZH<>'')and(txtDriverJSZH.Properties.Items.IndexOf(item.ZJSZH) = -1) then
    begin
      txtDriverJSZH.Properties.Items.Add(item.ZJSZH);
      txtFJSJSZH.Properties.Items.Add(item.ZJSZH);
    end;
    if (item.FJSZH<>'')and(txtDriverJSZH.Properties.Items.IndexOf(item.FJSZH) = -1) then
    begin
      txtDriverJSZH.Properties.Items.Add(item.FJSZH);
      txtFJSJSZH.Properties.Items.Add(item.FJSZH);
    end;
  end;
end;

end.
