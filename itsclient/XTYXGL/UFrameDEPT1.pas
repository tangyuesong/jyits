unit UFrameDEPT1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, udm, UnitFrameCustom, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, Vcl.StdCtrls, sGroupBox,
  sButton, dxorgchr, Vcl.ExtCtrls, sPanel, sFrameAdapter, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, sComboBox, sEdit,
  sCheckBox, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue;

type
  TDeptment = class
  private
    FYHMC: string;
    FFYJG1: string;
    FSYSTEMID: string;
    FJSCFDD: string;
    FLXDH: string;
    FDWDZ: string;
    FBJ: string;
    FGXQY: string;
    FXZQY: string;
    FDWJB: string;
    FNODEID: string;
    FGXSJ: string;
    FPDWDM: string;
    FBZ: string;
    FDWLXR: string;
    FDWMC: string;
    FDWFZR: string;
    FDWDM: string;
    FSCMS: string;
    FSJHM: string;
    FFYJG2: string;
  public
    property SYSTEMID: string read FSYSTEMID write FSYSTEMID;
    property PDWDM: string read FPDWDM write FPDWDM;
    property DWJB: string read FDWJB write FDWJB;
    property DWDM: string read FDWDM write FDWDM;
    property DWMC: string read FDWMC write FDWMC;
    property DWFZR: string read FDWFZR write FDWFZR;
    property DWLXR: string read FDWLXR write FDWLXR;
    property LXDH: string read FLXDH write FLXDH;
    property SJHM: string read FSJHM write FSJHM;
    property DWDZ: string read FDWDZ write FDWDZ;
    property JSCFDD: string read FJSCFDD write FJSCFDD;
    property YHMC: string read FYHMC write FYHMC;
    property FYJG1: string read FFYJG1 write FFYJG1;
    property FYJG2: string read FFYJG2 write FFYJG2;
    property SCMS: string read FSCMS write FSCMS;
    property GXQY: string read FGXQY write FGXQY;
    property XZQY: string read FXZQY write FXZQY;
    property BZ: string read FBZ write FBZ;
    property BJ: string read FBJ write FBJ;
    property NODEID: string read FNODEID write FNODEID;
    property GXSJ: string read FGXSJ write FGXSJ;
  end;

  TFrameDept = class(TCustomInfoFrame)
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    dxOrgChart1: TdxOrgChart;
    sButton1: TsButton;
    sButton2: TsButton;
    sButton3: TsButton;
    sGroupBox1: TsGroupBox;
    FDQuery1: TFDQuery;
    edtDWDM: TsEdit;
    edtDWMC: TsEdit;
    edtFZR: TsEdit;
    edtLXR: TsEdit;
    edtLXDH: TsEdit;
    edtSJHM: TsEdit;
    edtDWDZ: TsEdit;
    edtJSCFDD: TsEdit;
    edtYHMC: TsEdit;
    edtFYJG1: TsEdit;
    edtFYJG2: TsEdit;
    edtSCMS: TsEdit;
    edtGXQY: TsEdit;
    edtXZQY: TsEdit;
    edtBZ: TsEdit;
    edtBJ: TsEdit;
    edtNodeId: TsEdit;
    sButton4: TsButton;
    Timer1: TTimer;
    sCheckBox1: TsCheckBox;
    procedure sButton1Click(Sender: TObject);
    procedure dxOrgChart1Change(Sender: TObject; Node: TdxOcNode);
    procedure sButton2Click(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
  private
    procedure LoadTree;
    procedure CMShowingChanged(var M: TMessage); message CM_SHOWINGCHANGED;
  public
  end;

var
  FrameDept: TFrameDept;

implementation

{$R *.dfm}
{ TFrameDept }

procedure TFrameDept.CMShowingChanged(var M: TMessage);
begin
  inherited;
  if Showing then
  begin
//    loadtree;
  end;
end;

procedure TFrameDept.dxOrgChart1Change(Sender: TObject; Node: TdxOcNode);
var
  dept: TDeptment;
begin
  inherited;
  if Node = nil then
    exit;

  dept := TDeptment(Node.Data);
  edtDWDM.Text := dept.DWDM;
  edtDWMC.Text := dept.DWMC;
  edtFZR.Text := dept.DWFZR;
  edtLXR.Text := dept.DWLXR;
  edtLXDH.Text := dept.LXDH;
  edtSJHM.Text := dept.SJHM;
  edtDWDZ.Text := dept.DWDZ;
  edtJSCFDD.Text := dept.JSCFDD;
  edtYHMC.Text := dept.YHMC;
  edtFYJG1.Text := dept.FYJG1;
  edtFYJG2.Text := dept.FYJG2;
  edtSCMS.Text := dept.SCMS;
  edtGXQY.Text := dept.GXQY;
  edtXZQY.Text := dept.XZQY;
  edtBZ.Text := dept.BZ;
  edtBJ.Text := dept.BJ;
  edtNodeId.Text := dept.NODEID;
end;

procedure TFrameDept.LoadTree;
  function GetParentNode(parentNode: TdxOcNode; PDWDM: string): TdxOcNode;
  var
    pDept: TDeptment;
  begin
    if parentNode = nil then
    begin
      result := nil;
    end
    else
    begin
      pDept := TDeptment(parentNode.Data);
      if pDept.DWDM = PDWDM then
      begin
        result := parentNode;
      end
      else
      begin
        result := GetParentNode(parentNode.Parent, PDWDM);
      end;
    end;
  end;

var
  PDWDM, DWDM: string;
  dept: TDeptment;
  pNode: TdxOcNode;
begin
  pNode := nil;
  with FDQuery1 do
  begin
    Close;
    SQL.Text := 'select * from s_dept order by dwdm';
    Open;
    while not Eof do
    begin
      dept := TDeptment.Create;
      dept.SYSTEMID := FieldByName('SYSTEMID').AsString;
      dept.PDWDM := FieldByName('PDWDM').AsString;
      dept.DWJB := FieldByName('DWJB').AsString;
      dept.DWDM := FieldByName('DWDM').AsString;
      dept.DWMC := FieldByName('DWMC').AsString;
      dept.DWFZR := FieldByName('DWFZR').AsString;
      dept.DWLXR := FieldByName('DWLXR').AsString;
      dept.LXDH := FieldByName('LXDH').AsString;
      dept.SJHM := FieldByName('SJHM').AsString;
      dept.DWDZ := FieldByName('DWDZ').AsString;
      dept.JSCFDD := FieldByName('JSCFDD').AsString;
      dept.YHMC := FieldByName('YHMC').AsString;
      dept.FYJG1 := FieldByName('FYJG1').AsString;
      dept.FYJG2 := FieldByName('FYJG2').AsString;
      dept.SCMS := FieldByName('SCMS').AsString;
      dept.GXQY := FieldByName('GXQY').AsString;
      dept.XZQY := FieldByName('XZQY').AsString;
      dept.BZ := FieldByName('BZ').AsString;
      dept.BJ := FieldByName('BJ').AsString;
      dept.NODEID := FieldByName('NODEID').AsString;
      dept.GXSJ := FieldByName('GXSJ').AsString;

      pNode := GetParentNode(pNode, dept.PDWDM);
      if pNode <> nil then
        pNode.Expanded := true;
      pNode := self.dxOrgChart1.AddChild(pNode, dept);
      pNode.Text := dept.DWMC;
      pNode.Color := clwhite;
      pNode.Shape := TdxOcShape.shRoundRect;
      pNode.Width := 80;
      pNode.Height := 60;

      Next;
    end;
    Close;
  end;

end;

procedure TFrameDept.sButton1Click(Sender: TObject);
var
  dept: TDeptment;
  Node: TdxOcNode;
begin
  inherited;
  dept := TDeptment.Create;
  if dxOrgChart1.Selected <> nil then
  begin
    dept.PDWDM := TDeptment(dxOrgChart1.Selected.Data).PDWDM
  end;
  Node := dxOrgChart1.Add(dxOrgChart1.Selected, dept);
  Node.Color := clGreen;
  Node.Shape := TdxOcShape.shRoundRect;
  Node.Width := 80;
  Node.Height := 60;
  dxOrgChart1.Selected := Node;
end;

procedure TFrameDept.sButton2Click(Sender: TObject);
var
  dept: TDeptment;
  Node: TdxOcNode;
begin
  inherited;
  dept := TDeptment.Create;
  if dxOrgChart1.Selected <> nil then
  begin
    dept.PDWDM := TDeptment(dxOrgChart1.Selected.Data).DWDM
  end;
  Node := dxOrgChart1.AddChild(dxOrgChart1.Selected, dept);
  dxOrgChart1.Selected.Expanded := true;
  Node.Color := clGreen;
  Node.Shape := TdxOcShape.shRoundRect;
  Node.Width := 80;
  Node.Height := 60;
  dxOrgChart1.Selected := Node;
end;

procedure TFrameDept.sButton3Click(Sender: TObject);
var
  dept: TDeptment;
begin
  inherited;
  if dxOrgChart1.Selected = nil then
    exit;
  if dxOrgChart1.Selected.HasChildren then
  begin
    showmessage('请先删除下级部门');
    exit;
  end;

  dept := TDeptment(dxOrgChart1.Selected.Data);
  if Application.MessageBox(PChar('真的要删除'+dept.DWMC+'?'), '删除确认', MB_YESNO)=6 then
  begin
//    dm.conServer.ExecSQL('delete from s_dept where dwdm = ''' + dept.DWDM + '''');
    dxOrgChart1.Delete(dxOrgChart1.Selected);
  end;
end;

procedure TFrameDept.sButton4Click(Sender: TObject);
var
  SQL: string;
  dept: TDeptment;
begin
  inherited;
  if dxOrgChart1.Selected = nil then
    exit;

  dept := TDeptment(dxOrgChart1.Selected.Data);
  SQL := 'delete from s_dept where dwdm = ''' + edtDWDM.Text + '''';
  SQL := SQL +
    ' INSERT INTO S_DEPT(PDWDM,DWJB,DWDM,DWMC,DWFZR,DWLXR, LXDH,SJHM,DWDZ,JSCFDD,YHMC,FYJG1,FYJG2,SCMS,GXQY,BZ,BJ,NODEID) ';
  SQL := SQL + ' VALUES(''' + dept.PDWDM + ''',''' + dept.DWJB + ''',''' +
    edtDWDM.Text + ''',''' + edtDWMC.Text + ''',''' + edtFZR.Text + ''',''' +
    edtLXR.Text + ''',''' + edtLXDH.Text + ''',''' + edtSJHM.Text + ''',''' +
    edtDWDZ.Text + ''',''' + edtJSCFDD.Text + ''',''' + edtYHMC.Text + ''',''' +
    edtFYJG1.Text + ''',''' + edtFYJG2.Text + ''',''' + edtSCMS.Text + ''',''' +
    edtGXQY.Text + ''',''' + edtBZ.Text + ''',''' + edtBJ.Text + ''',''' +
    edtNodeId.Text + ''')';
  try
//    dm.conServer.ExecSQL(SQL);
    Application.MessageBox('保存成功', '提示');
  except
    Application.MessageBox('保存成功', '提示');
  end;

  dept.DWDM := edtDWDM.Text;
  dept.DWMC := edtDWMC.Text;
  dept.DWFZR := edtFZR.Text;
  dept.DWLXR := edtLXR.Text;
  dept.LXDH := edtLXDH.Text;
  dept.SJHM := edtSJHM.Text;
  dept.DWDZ := edtDWDZ.Text;
  dept.JSCFDD := edtJSCFDD.Text;
  dept.YHMC := edtYHMC.Text;
  dept.FYJG1 := edtFYJG1.Text;
  dept.FYJG2 := edtFYJG2.Text;
  dept.SCMS := edtSCMS.Text;
  dept.GXQY := edtGXQY.Text;
  dept.BZ := edtBZ.Text;
  dept.BJ := edtBJ.Text;
  dept.NODEID := edtNodeId.Text;

  dxOrgChart1.Selected.Text := dept.DWMC;
end;

procedure TFrameDept.sCheckBox1Click(Sender: TObject);
begin
  inherited;
  dxOrgChart1.Rotated := sCheckBox1.Checked;
end;

procedure TFrameDept.Timer1Timer(Sender: TObject);
var
  Node: TdxOcNode;
begin
  inherited;
  Timer1.Enabled := false;
  LoadTree;
end;

end.
