unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IOUtils, Vcl.StdCtrls,
  FireDAC.Phys.OracleDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TForm9 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    btnInit: TButton;
    FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    btnWrite: TButton;
    edtSBBH: TEdit;
    Label1: TLabel;
    edtFXBH: TEdit;
    Label2: TLabel;
    edtXZSD: TEdit;
    Label3: TLabel;
    edtCJJG: TEdit;
    Label4: TLabel;
    edtHPHM: TEdit;
    Label5: TLabel;
    edtHPZL: TEdit;
    Label6: TLabel;
    edtCDBH: TEdit;
    Label7: TLabel;
    edtCLSD: TEdit;
    Label8: TLabel;
    edtHPYS: TEdit;
    Label9: TLabel;
    edtCSYS: TEdit;
    Label10: TLabel;
    edtFWQDZ: TEdit;
    Label11: TLabel;
    edtBABH: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtTP1: TEdit;
    edtGCSJ: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
    procedure btnWriteClick(Sender: TObject);
  private

  public

  end;

var
  Form9: TForm9;

implementation

uses
  uCommon, uTaskManager, uGlobal, UInterface, uTypes;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
  uCommon.Initialize;
  TaskManager := TTaskManager.Create;
  TaskManager.CreateThreads;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  TaskManager.Free;
  uCommon.Finalizat;
end;

procedure TForm9.btnInitClick(Sender: TObject);
begin
  uCommon.Initialize;
  LoadOpenedDevice;
  btnInit.Enabled := false;
  edtGCSJ.Text := FormatDateTime('yyyy-mm-dd hh:mm:ss', now);
end;

procedure TForm9.btnWriteClick(Sender: TObject);
var
  pass: TPass;
  device: TDevice;
  b: boolean;
begin
  device := TDevice.Create;
  device.SBBH := edtSBBH.Text;
  device.BABH := edtBABH.Text;
  device.FXBH := edtFXBH.Text;
  device.XZSD := StrToIntDef(edtXZSD.Text, 0);
  pass.CJJG := edtCJJG.Text;
  pass.HPHM := edtHPHM.Text;
  pass.HPZL := edtHPZL.Text;
  pass.cdbh := edtCDBH.Text;
  pass.gcsj := edtGCSJ.Text;
  pass.clsd := edtCLSD.Text;
  pass.hpys := edtHPYS.Text;
  pass.CSYS := edtCSYS.Text;
  pass.FWQDZ := edtFWQDZ.Text;
  pass.tp1 := edtTP1.Text;
  pass.tp2 := '';
  pass.tp3 := '';
  b := Tmypint.WriteVehicleInfo(pass, device);
  device.Free;
  if b then
    showmessage('ok')
  else
    showmessage('failed');
end;

end.
