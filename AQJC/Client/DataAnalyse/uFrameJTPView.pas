unit uFrameJTPView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGridFrame, cxGraphics, cxControls,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxContainer,
  Vcl.Menus, dxLayoutContainer, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Actions, Vcl.ActnList, sDialogs, cxEditRepositoryItems,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxTextEdit, Vcl.StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxLayoutControl, uDictionary, uRequestItf, uJsonUtils, uFrameJTPJob,
  Soap.EncdDecd, uCommon;

type
  TFrameJTPView = class(TdxGridFrame)
    cbbBklx: TcxComboBox;
    cbbStatus: TcxComboBox;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    cboJC: TcxComboBox;
    edtHPHM: TcxTextEdit;
    cboHPZL: TcxComboBox;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    btnQuery: TcxButton;
    procedure actViewExecute(Sender: TObject);
    procedure acteditExecute(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure actdeleteExecute(Sender: TObject);
    procedure btnnextPageClick(Sender: TObject);
    procedure btnPriorPageClick(Sender: TObject);
  private
    FJTPJob: TFrameJTPJob;
    FParam: String;
    procedure AfterConstruction; override;
    procedure btnCreateJobClick(Sender: TObject);
    procedure btnDelteClick(Sender: TObject);
    procedure LoadData;
  public
    { Public declarations }
  end;

var
  FrameJTPView: TFrameJTPView;

implementation

{$R *.dfm}
{ TFrameJTPLView }

procedure TFrameJTPView.actdeleteExecute(Sender: TObject);
var
  jobID: String;
begin
  inherited;
  jobID := Trim(FDMemTable1.FieldByName('JobID').AsString);
  if jobID = '' then
  begin
    Application.MessageBox('该记录尚未创建任务！', '提示', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if Application.MessageBox('确定要结束任务吗?', '提示', MB_YESNO + MB_ICONQUESTION) = idYES
  then
  begin
    TRequestItf.pDbQuery('ModifyJtpJob',
      'systemid=' + FDMemTable1.FieldByName('JobID').AsString + '&Status=2');
    LoadData;
  end;
end;

procedure TFrameJTPView.btnDelteClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('确定删除吗?', '提示', MB_YESNO + MB_ICONQUESTION) = idYES
  then
  begin
    FJTPJob.ShowFrameWait;
    TRequestItf.pDbQuery('ModifyJcptJTP',
      'systemid=' + FJTPJob.gJcptJTP.systemid + '&Status=2');
    FJTPJob.FreeFrameWait;
    FJTPJob.Hide;
    LoadData;
  end;
end;

procedure TFrameJTPView.acteditExecute(Sender: TObject);
begin
  inherited;
  // task info
end;

procedure TFrameJTPView.actViewExecute(Sender: TObject);
var
  jtp: TJcptJTP;
  json: String;
begin
  inherited;
  if FJTPJob = nil then
  begin
    FJTPJob := TFrameJTPJob.Create(Self);
    FJTPJob.Parent := Self;
    FJTPJob.Align := alClient;
    FJTPJob.btnCreateJob.OnClick := btnCreateJobClick;
    FJTPJob.btnDelete.OnClick := btnDelteClick;
  end;
  jtp.systemid := FDMemTable1.FieldByName('systemid').AsString;
  jtp.jobID := FDMemTable1.FieldByName('JobID').AsString;
  jtp.hphm := FDMemTable1.FieldByName('hphm').AsString;
  jtp.hpzl := FDMemTable1.FieldByName('hpzl').AsString;
  jtp.bklx := FDMemTable1.FieldByName('bklx').AsString;
  jtp.clpp := FDMemTable1.FieldByName('clpp').AsString;
  jtp.csys := FDMemTable1.FieldByName('csys').AsString;
  jtp.cllx := FDMemTable1.FieldByName('cllx').AsString;
  jtp.url := FDMemTable1.FieldByName('url').AsString;

  if jtp.jobID <> '' then
  begin
    json := TRequestItf.DbQuery('GetCarFaceJob',
      'jobid=' + FDMemTable1.FieldByName('JobID').AsString);
    jtp.picStr := TCommon.GetJsonNode('pic', json);
    jtp.rectX := StrToIntDef(TCommon.GetJsonNode('rectx', json), 0);
    jtp.rectY := StrToIntDef(TCommon.GetJsonNode('recty', json), 0);
    jtp.rectW := StrToIntDef(TCommon.GetJsonNode('rectw', json), 0);
    jtp.rectH := StrToIntDef(TCommon.GetJsonNode('recth', json), 0);
    jtp.sjhm := TCommon.GetJsonNode('sjhm', json);
  end
  else
  begin
    jtp.picStr := '';
    jtp.rectX := 0;
    jtp.rectY := 0;
    jtp.rectW := 0;
    jtp.rectH := 0;
    jtp.sjhm := '';
  end;
  FJTPJob.Show;
  FJTPJob.gJcptJTP := jtp;
end;

procedure TFrameJTPView.AfterConstruction;
begin
  inherited;
  TLZDictionary.BindCombobox(cboHPZL, TLZDictionary.gDicMain['HPZL'], True);
  cboHPZL.ItemIndex := 1;
  TLZDictionary.BindCombobox(cboJC, TLZDictionary.gDicMain['JC'], True);
  cboJC.ItemIndex := 18;

  GridColumns := 'hphm,hpzl,bklx,gxsj,状态,任务创建时间,最后分析时间,分析次数,任务状态,操作';
  GridView.Columns[9].RepositoryItem := cxdtrpstry1ButtonItem1;
  cxdtrpstry1ButtonItem1.Properties.Buttons.Items[0].Visible := True;
end;

procedure TFrameJTPView.btnCreateJobClick(Sender: TObject);
var
  Param, jobID, pic, json, procc, r: String;
  n: Integer;
begin
  inherited;
  FJTPJob.ShowFrameWait;
  Param := 'pic=' + EncodeString(FJTPJob.gJcptJTP.url) + '&kssj=0&jssj=0&jobid='
    + FJTPJob.gJcptJTP.systemid + '&sjhm=' + FJTPJob.edtSjhm.Text + '&hphm=' +
    FJTPJob.gJcptJTP.hphm + '&hpzl=' + FJTPJob.gJcptJTP.hpzl + '&X=' +
    FJTPJob.gSelRect.Left.ToString + '&Y=' + FJTPJob.gSelRect.Top.ToString +
    '&W=' + FJTPJob.gSelRect.Width.ToString + '&H=' +
    FJTPJob.gSelRect.Height.ToString;
  r := TRequestItf.DbQuery('CreateCarFaceCompareJob', Param);
  FJTPJob.FreeFrameWait;
  if r = '1' then
  begin
    Application.MessageBox('任务创建成功', '提示', MB_OK + MB_ICONINFORMATION);
    FJTPJob.Hide;
    LoadData;
  end
  else
    Application.MessageBox('任务创建失败,请检查所选的特征区域是否正确', '提示', MB_OK + MB_ICONERROR);
end;

procedure TFrameJTPView.btnnextPageClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TFrameJTPView.btnPriorPageClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TFrameJTPView.btnQueryClick(Sender: TObject);
begin
  inherited;
  FParam := '';
  edtPageIndex.Text := '0';

  if edtHPHM.Text <> '' then
    FParam := 'hphm=' + TLZDictionary.StrtoDicInfo(cboJC.Text).mc + edtHPHM.Text
      + '&hpzl=' + TLZDictionary.StrtoDicInfo(cboHPZL.Text).dm
  else
    FParam := 'hphm=&hpzl=';

  if cbbBklx.ItemIndex = 1 then
    FParam := FParam + '&bklx=31'
  else if cbbBklx.ItemIndex = 2 then
    FParam := FParam + '&bklx=03'
  else if cbbBklx.ItemIndex = 3 then
    FParam := FParam + '&bklx=02'
  else
    FParam := FParam + '&bklx=';

  if cbbStatus.ItemIndex = 1 then
    FParam := FParam + '&status=0'
  else if cbbStatus.ItemIndex = 2 then
    FParam := FParam + '&status=1'
  else if cbbStatus.ItemIndex = 3 then
    FParam := FParam + '&status=2'
  else
    FParam := FParam + '&status=';

  LoadData;
end;

procedure TFrameJTPView.LoadData;
var
  Param, s: String;
begin
  if FParam = '' then
    exit;
  Param := FParam + '&currentPage=' + StrToIntDef(edtPageIndex.Text, 0).ToString
    + '&pageSize=' + StrToIntDef(cbbPagesize.Text, 30).ToString;
  ShowFrameWait;
  s := TRequestItf.pDbQuery('GetJcptJTPList', Param);
  TJsonUtils.JSONToDataSet(s, FDMemTable1, '', True);
  FreeFrameWait;
end;

end.
