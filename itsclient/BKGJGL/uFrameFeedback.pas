unit uFrameFeedback;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDialogBase, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxLayoutControlAdapters,
  dxLayoutcxEditAdapters, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, dxLayoutContainer, cxClasses, Vcl.StdCtrls, cxButtons,
  dxLayoutControl, cxCheckBox, cxCheckComboBox, uEntity, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TFrameFeedback = class(TdxDialogBaseFrame)
    edtHPHM: TcxTextEdit;
    edtWSBH: TcxTextEdit;
    edtCZDW: TcxComboBox;
    edtCZMJ: TcxComboBox;
    cboLJJG: TcxComboBox;
    cboLJYY: TcxComboBox;
    cboXYC: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    liLJJG: TdxLayoutItem;
    liLJYY: TdxLayoutItem;
    liXYC: TdxLayoutItem;
    liWSBH: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    cboWSLB: TcxComboBox;
    liWSLB: TdxLayoutItem;
    edtYJBM: TcxTextEdit;
    edtLXR: TcxTextEdit;
    edtLXDH: TcxTextEdit;
    liYJBM: TdxLayoutItem;
    liLXR: TdxLayoutItem;
    liLXDH: TdxLayoutItem;
    cboWCHYY: TcxComboBox;
    liWCHYY: TdxLayoutItem;
    cboCZJG: TcxCheckComboBox;
    liCZJG: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    edtYJLX: TcxTextEdit;
    dxLayoutItem5: TdxLayoutItem;
    edtCZSJ: TcxTextEdit;
    edtGCDD: TcxTextEdit;
    edtGCSJ: TcxTextEdit;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    edtJYW: TcxTextEdit;
    lgWS: TdxLayoutGroup;
    lgYJ: TdxLayoutGroup;
    procedure cboLJJGPropertiesChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edtCZDWPropertiesChange(Sender: TObject);
  private
    FAlarm: TAlarmResult;
    FModalResult: boolean;
    FOnSuccuss: TClose;
    procedure ChangeControlEnable;
    function CheckInput: boolean;
    procedure InitControls;
    procedure SetAlarm(const Value: TAlarmResult);
    function GetCZJG: string;
    procedure BindCZJG;
    function GetCZDWDM: string;
    function GetCZMJBH: string;
    function DoFeedback: boolean;
    function DoSign: boolean;
  public
    property Alarm: TAlarmResult read FAlarm write SetAlarm;
    property ModalResult: boolean read FModalResult;
    property OnSuccuss: TClose read FOnSuccuss write FOnSuccuss;
  end;

var
  FrameFeedback: TFrameFeedback;

implementation
uses uRequestItf, uGlobal, uDictionary;
{$R *.dfm}

function TFrameFeedback.GetCZJG: string;
var
  s: string;
begin
  s := cboCZJG.Text;
  result := '';
  for s in s.Split([';']) do
    result := result + s.Substring(0, 1);
end;

function TFrameFeedback.DoFeedback: boolean;
var
  params, s, czjg, systemid: string;
begin
  inherited;
  result := false;

  if not CheckInput then exit;

  if (alarm.QSBJ = '0') or (alarm.QSBJ='') then
  begin
    DoSign;
  end;

  s := TRequestItf.DbQuery('GetFeedback', 'yjxh=' + alarm.GCXH);
  s := s.Substring(s.IndexOf('SYSTEMID":"') + 11);
  systemid := s.Substring(0, s.IndexOf('"'));
  params := 'systemid=' + systemid + '&fkbj=1';
  params := params + '&ljclqk=' + copy(cboLJJG.Text, 1, 1);
  if liLJYY.Visible then
    params := params + '&wljdyy=' + copy(cboLJYY.Text, 1, 2);
  if liXYC.Visible then
    params := params + '&chjg=' + copy(cboXYC.Text, 1, 1);
  if liCZJG.Visible then
  begin
    czjg := GetCZJG();
    params := params + '&cljg=' + czjg;
  end;
  if lgWS.Visible then
  begin
    params := params + '&wslb=' + copy(cboWSLB.Text, 1, 1)
                     + '&wsbh=' + edtWSBH.Text
                     + '&jyw=' + edtJYW.Text;
  end;
  if lgYJ.Visible then
  begin
    params := params + '&yjbm=' + edtYJBM.Text
                     + '&lxr=' + edtLXR.Text
                     + '&lxdh=' + edtLXDH.Text;
  end;
  if liWCHYY.Visible then
    params := params + '&wchyy=' + copy(cboWCHYY.Text, 1, 2);
  params := params + '&czdw=' + GetCZDWDM;
  params := params + '&czr=' + GetCZMJBH;
  params := params + '&czsj=' + edtCZSJ.Text;
  params := params + '&YHBH=' + gUser.yhbh;
  s := TRequestItf.DbQuery('ModifyFeedback', params);
  if s = '1' then
  begin
    params := 'SYSTEMID=' + alarm.Systemid;
    params := params + '&Feedback=�ѷ���';
    TRequestItf.DbQuery('ModifyALARMRESULT',  params);
    if Assigned(OnSuccuss) then
      OnSuccuss;
    Application.MessageBox('�����ɹ�', '��ʾ');
    result := true;
  end
  else
    Application.MessageBox('����ʧ�ܣ�', '��ʾ');
end;

function TFrameFeedback.DoSign: boolean;
var
  params, r: string;
begin
  params := 'yjxh='+Alarm.GCXH + '&fkbj=0';
  r := TRequestItf.DbQuery('AddFeedback', params);
  if r = '1' then
  begin
    params := 'SYSTEMID=' + alarm.Systemid + '&QSBJ=1&qsjg=1&sfcj=1';
    params := params + '&qsbm=' + GetCZDWDM;
    params := params + '&qsr=' + GetCZMJBH;
    params := params + '&qssj=' + edtCZSJ.Text;

    TRequestItf.DbQuery('ModifyALARMRESULT',  params);
    result := true;
  end
  else begin
    Application.MessageBox('����ʧ�ܣ�', '��ʾ');
  end;
end;

procedure TFrameFeedback.btnSaveClick(Sender: TObject);
begin
  inherited;
  DoFeedback;
end;

procedure TFrameFeedback.cboLJJGPropertiesChange(Sender: TObject);
begin
  inherited;
  ChangeControlEnable;
end;

procedure TFrameFeedback.ChangeControlEnable;
var
  czjg: string;
begin
  liLJYY.Visible := liLJJG.Visible and (cboLJJG.ItemIndex = 0);  // ���س��������0 δ���ص�
  liXYC.Visible  := liLJJG.Visible and (cboLJJG.ItemIndex = 1);  // ���س��������1 �����ص�
  liCZJG.Visible := liXYC.Visible and (cboXYC.ItemIndex = 1);     // �Ƿ����ɳ�����1 ��
  liWCHYY.Visible := liXYC.Visible and (cboXYC.ItemIndex = 0);    //�Ƿ����ɳ�����0 ��

  czjg := cboCZJG.Text;
  lgWS.Visible := liCZJG.Visible and (czjg.Contains('2') or czjg.Contains('6'));      // ���ý����2 �ֳ����ߴ�������
  if lgWS.Visible then
  begin
    cboWSLB.ItemIndex := 0;
    if czjg.Contains('5') then
      cboWSLB.ItemIndex := 1;
  end;

  lgYJ.Visible := liCZJG.Visible and(czjg.Contains('3'));      //���ý����3 �ƽ���������
end;

function TFrameFeedback.CheckInput: boolean;
var
  czjg: string;
begin
  result := false;
  if liCZJG.Visible and (cboCZJG.Text = 'None selected') then
  begin
    Application.MessageBox('��ѡ���ý��', '��ʾ');
    cboCZJG.SetFocus;
    exit;
  end;

  if lgWS.Visible and (edtWSBH.Text = '') then
  begin
    Application.MessageBox('������������', '��ʾ');
    edtWSBH.SetFocus;
    exit;
  end;

  if lgWS.Visible and (edtJYW.Text = '') then
  begin
    Application.MessageBox('����������У��λ', '��ʾ');
    edtWSBH.SetFocus;
    exit;
  end;

  if lgYJ.Visible and (edtYJBM.Text = '') then
  begin
    Application.MessageBox('�������ƽ�����', '��ʾ');
    edtYJBM.SetFocus;
    exit;
  end;
  if lgYJ.Visible and (edtLXR.Text = '') then
  begin
    Application.MessageBox('��������ϵ��', '��ʾ');
    edtLXR.SetFocus;
    exit;
  end;
  if lgYJ.Visible and (edtLXDH.Text = '') then
  begin
    Application.MessageBox('��������ϵ�绰', '��ʾ');
    edtLXDH.SetFocus;
    exit;
  end;

  if edtCZDW.Text = '' then
  begin
    Application.MessageBox('�����봦�õ�λ', '��ʾ');
    edtCZDW.SetFocus;
    exit;
  end;
  if edtCZDW.Text = '' then
  begin
    Application.MessageBox('�����봦��������', '��ʾ');
    edtCZMJ.SetFocus;
    exit;
  end;
  if edtCZSJ.Text = '' then
  begin
    Application.MessageBox('�����봦��ʱ��', '��ʾ');
    edtCZSJ.SetFocus;
    exit;
  end;

  if liCZJG.Visible then
  begin
    czjg := GetCZJG;
    if '02 03 05 08 01 21 22 23 24 25'.Contains(Alarm.BKLX) then
    begin
      if not (czjg.Contains('5') and czjg.Contains('2')) then
      begin
        Application.MessageBox('���ý������ѡ�� 5:���������� �� 2:�ֳ����ߴ�������', '��ʾ');
        cboCZJG.SetFocus;
        exit;
      end;
    end
    else if '06 07'.Contains(Alarm.BKLX) then
    begin
      if czjg.Length <> 1 then
      begin
        Application.MessageBox('���ý�����뵥ѡһ��', '��ʾ');
        cboCZJG.SetFocus;
        exit;
      end;
    end
    else if Alarm.BKLX = '01 21 22 23 24 25' then
    begin
      if not(czjg.Contains('5') and (czjg.Contains('2') or czjg.Contains('3'))) then
      begin
        Application.MessageBox('���ý������ѡ�� 5:���������������� 2:�ֳ����ߴ������顢3:�ƽ��������� ����Ҫѡһ��', '��ʾ');
        cboCZJG.SetFocus;
        exit;
      end;
    end
    else if czjg.Contains('5') and (not czjg.Contains('2')) then
    begin
      Application.MessageBox('���ý��ѡ���� 5:�������������ͱ���ѡ�� 2:�ֳ����ߴ�������', '��ʾ');
      cboCZJG.SetFocus;
      exit;
    end;
    if (czjg.Contains('8') or czjg.Contains('6')) and (czjg.Length > 1) then                 // ���ѡ���� 8:������֪����У�����ѡ����
    begin
      Application.MessageBox('���ý�� 6:�Ѵ��� �� 8:������֪����� ֻ�ܵ�ѡ', '��ʾ');
      cboCZJG.SetFocus;
      exit;
    end;

    if czjg.Contains('5') and czjg.Contains('2') and (cboWSLB.ItemIndex <> 1) then
    begin
      Application.MessageBox('���ý��ѡ���� 5:���������� �� 2:�ֳ����ߴ������飬������������ 3:ǿ�ƴ�ʩƾ֤', '��ʾ');
      cboCZJG.SetFocus;
      exit;
    end;
  end;
  result := true;
end;

function TFrameFeedback.GetCZDWDM: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZDW.Text).dm;
end;

function TFrameFeedback.GetCZMJBH: string;
begin
  result := TLZDictionary.StrtoDicInfo(edtCZMJ.Text).mc;
end;

procedure TFrameFeedback.edtCZDWPropertiesChange(Sender: TObject);
var
  dw, yhbh: string;
  user: TUser;
begin
  inherited;
  edtCZMJ.Properties.Items.Clear;
  dw := GetCZDWDM;
  if TLZDictionary.gDicDept.ContainsKey(dw) then
  begin
    for yhbh in TLZDictionary.gDicUser.Keys do
    begin
      user := TLZDictionary.gDicUser[yhbh];
      if user.DWDM = dw then
      begin
        edtCZMJ.Properties.Items.Add(user.yhbh + ':' + user.YHXM);
      end;
    end;
    if gUser.DWDM = dw then
      edtCZMJ.Text := gUser.yhbh + ':' + gUser.YHXM
    else
      edtCZMJ.ItemIndex := 0;
  end
  else
    edtCZMJ.Text := '';
end;

procedure TFrameFeedback.SetAlarm(const Value: TAlarmResult);
begin
  FAlarm := Value;
  self.ClearControls(self);
  if TLZDictionary.gDicMain.ContainsKey('BKLX') and TLZDictionary.gDicMain['BKLX'].ContainsKey(Alarm.BKLX) then
    edtYJLX.Text := '[' + TLZDictionary.gDicMain['BKLX'][Alarm.BKLX] + '] ';
  if TLZDictionary.gDicMain['HPZL'].ContainsKey(Alarm.HPZL) then
    edtHPHM.Text := '[' + uDictionary.TLZDictionary.gDicMain['HPZL'][Alarm.HPZL] + '] ';
  edtHPHM.Text := edtHPHM.Text + Alarm.HPHM;
  edtGCSJ.Text := Alarm.GCSJ;
  if TLZDictionary.gDicDev[2].ContainsKey(Alarm.KDBH) then
    edtGCDD.Text := TLZDictionary.gDicDev[2][Alarm.KDBH].SBDDMC;
  InitControls;
end;

procedure TFrameFeedback.InitControls;
var
  czdw, key: string;
begin
  FModalResult := false;
  cboLJJG.ItemIndex := 1;
  cboXYC.ItemIndex := 1;
  cboWSLB.ItemIndex := 0;

  edtCZDW.Properties.Items.Clear;
  if TLZDictionary.gDicDev[2].ContainsKey(Alarm.KDBH) then
  begin
    czdw := TLZDictionary.gDicDev[2][Alarm.KDBH].CZDW;
    for key in czdw.Split([';']) do
    begin
      if TLZDictionary.gDicDept.ContainsKey(key) then
      begin
        edtCZDW.Properties.Items.Add(key + ':' + TLZDictionary.gDicDept[key].DWMC);
      end;
    end;
    edtCZDW.ItemIndex := edtCZDW.Properties.Items.Count - 1;
  end
  else
    edtCZDW.Text := '';

  edtCZSJ.Text := FormatDateTime('yyyy/mm/dd hh:mm:ss', now);

  BindCZJG;
end;

procedure TFrameFeedback.BindCZJG;
  procedure AddCZJGItem(code, desc: string);
  begin
    with cboCZJG.Properties.Items.Add do
    begin
      Description := desc;
      ShortDescription := code + ' ' + desc;
    end;
  end;
begin
  cboCZJG.Properties.Items.Clear;
  if '02 03 08'.Contains(Alarm.BKLX) then
  begin
    AddCZJGItem('5', '����������');
    AddCZJGItem('2', '�ֳ����ߴ�������');
    AddCZJGItem('3', '�ƽ���������');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if Alarm.BKLX = '04' then
  begin
    AddCZJGItem('5', '����������');
    AddCZJGItem('2', '�ֳ����ߴ�������');
    AddCZJGItem('6', '�Ѵ���');
    AddCZJGItem('8', '������֪�����');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if Alarm.BKLX = '05' then
  begin
    AddCZJGItem('5', '����������');
    AddCZJGItem('2', '�ֳ����ߴ�������');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if Alarm.BKLX = '06' then
  begin
    AddCZJGItem('2', '�ֳ����ߴ�������');
    AddCZJGItem('4', '�����˽��ܴ���');
    AddCZJGItem('7', '�����˾ܾ�����');
    AddCZJGItem('8', '������֪�����');
    cboCZJG.States[1] := cbsChecked;
  end
  else if Alarm.BKLX = '07' then
  begin
    AddCZJGItem('2', '�ֳ����ߴ�������');
    AddCZJGItem('7', '�����˾ܾ�����');
    AddCZJGItem('8', '������֪�����');
    cboCZJG.States[0] := cbsChecked;
  end
  else if '01 21 22 23 24 25'.Contains(Alarm.BKLX) then
  begin
    AddCZJGItem('5', '����������');
    AddCZJGItem('2', '�ֳ����ߴ�������');
    AddCZJGItem('3', '�ƽ���������');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if '31 32'.Contains(Alarm.BKLX) then
  begin
    AddCZJGItem('5', '����������');
    AddCZJGItem('2', '�ֳ����ߴ�������');
    AddCZJGItem('3', '�ƽ���������');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if '09 33 35 34 36 37 38 43'.Contains(Alarm.BKLX) then
  begin
    AddCZJGItem('5', '����������');
    AddCZJGItem('2', '�ֳ����ߴ�������');
    AddCZJGItem('8', '������֪�����');
    cboCZJG.States[0] := cbsChecked;
    cboCZJG.States[1] := cbsChecked;
  end
  else if Alarm.BKLX = '99' then
  begin
    AddCZJGItem('5', '����������');
    AddCZJGItem('2', '�ֳ����ߴ�������');
    AddCZJGItem('3', '�ƽ���������');
    AddCZJGItem('8', '������֪�����');
    cboCZJG.States[3] := cbsChecked;
  end;
end;

end.
