unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCheckBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, sSkinProvider, sSkinManager,
  Vcl.ExtCtrls, sPanel,acLFPainter, Vcl.StdCtrls, Vcl.Buttons, sBitBtn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Win.ADODB,cxGridExportLink,
  Vcl.ComCtrls, sStatusBar, cxDropDownEdit,Itrffweb1, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TForm13 = class(TForm)
    spnl1: TsPanel;
    sknmngr1: TsSkinManager;
    sknprvdr1: TsSkinProvider;
    cxgrd1: TcxGrid;
    cxgrid2: TcxGridDBTableView;
    cxgrdlvl1: TcxGridLevel;
    btn1: TsBitBtn;
    btn2: TsBitBtn;
    btn3: TsBitBtn;
    cxgridnumcxgrid2Column1: TcxGridDBColumn;
    cxgridnumcxgrid2Column2: TcxGridDBColumn;
    cxgridnumcxgrid2Column3: TcxGridDBColumn;
    cxgridnumcxgrid2Column4: TcxGridDBColumn;
    dlgSave1: TSaveDialog;
    dlgOpen1: TOpenDialog;
    con1: TADOConnection;
    ds1: TADODataSet;
    ds2: TDataSource;
    fdm1: TFDMemTable;
    strngfldfdm1hphm: TStringField;
    strngfldfdm1hpzl: TStringField;
    strngfldfdm1fdjh: TStringField;
    strngfldfdm1clpp: TStringField;
    strngfldfdm1ccdjrq: TStringField;
    cxgridnumcxgrid2Column6: TcxGridDBColumn;
    btn4: TsBitBtn;
    cxgridnumcxgrid2Column8: TcxGridDBColumn;
    strngfldfdm1syr: TStringField;
    strngfldfdm1yj: TStringField;
    stsbr1: TsStatusBar;
    con2: TADOConnection;
    ds3: TADODataSet;
    cxgridnumcxgrid2Column5: TcxGridDBColumn;
    cxgridnumcxgrid2Column7: TcxGridDBColumn;
    strngfldfdm1clxh: TStringField;
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}
uses QBAes;
procedure TForm13.btn1Click(Sender: TObject);
var
  itff:Itrffweb;
  veh:TVoVehInfo;
  hphm,hpzl:String;
begin
  if dlgSave1.Execute then
  begin
    fdm1.Active:=False;
    fdm1.Active:=true;
     with ds1 do
     begin
       Close;
       CommandText:='select hphm,(select mc from d_main where flbh=''hpzl'' and dm=t.hpzl) as cpzl,hpzl,clpp,jdcsyr,fdjh,qrzt from T_VIORECORD t where QRZT=''20''';
       Active:=true;
       stsbr1.SimpleText:='共有'+inttostr(recordcount)+'宗.';
       ds2.DataSet:=ds1;
       while not eof do
       begin
         hphm:=FieldByName('hphm').AsString;
         hpzl:=FieldByName('hpzl').AsString;
         fdm1.Append;
         fdm1.FieldByName('hphm').Value:=AesEncrypt(hphm,'lgm');
         fdm1.FieldByName('hpzl').Value:=AesEncrypt(FieldByName('cpzl').AsString,'lgm');
         fdm1.FieldByName('clpp').Value:=AesEncrypt(FieldByName('clpp').AsString,'lgm');
         fdm1.FieldByName('FDJH').Value:=AesEncrypt(FieldByName('FDJH').AsString,'lgm');
         fdm1.FieldByName('syr').Value:=AesEncrypt(FieldByName('jdcsyr').AsString,'lgm');

         itff:=GetItrffweb(False,'',nil);
         veh:=itff.GetVehInfo(Copy(hphm,1,1),Copy(hphm,2,Length(hphm)-1),hpzl);

         if Length(veh.ccdjrq)>0 then
         fdm1.FieldByName('ccdjrq').Value:=veh.ccdjrq;
         fdm1.FieldByName('clxh').Value:=veh.clxh;
         fdm1.FieldByName('yj').Value:='待审核';
         fdm1.Post;

         Edit;
         FieldByName('QRZT').Value:='19';
         Post;

         Next;

       end;
     end;
     ds2.DataSet:=fdm1;
     ExportGridToExcel(dlgSave1.FileName,cxgrd1,true);
  end;
end;

procedure TForm13.btn2Click(Sender: TObject);
var
  semc:TStrings;
  shyj:string;
begin
  if dlgOpen1.Execute then
  begin
    if dlgOpen1.FileName='' then Exit;

    semc:=TStringList.Create;
    con2.Close;
    con2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Mode=Share Deny None;Extended Properties=Excel 8.0;'+
    'Persist Security Info=False;Data Source='+dlgOpen1.FileName;
    con2.LoginPrompt:=false;
    con2.Connected:=True;
    con2.GetTableNames(semc,False);
     fdm1.Active:=False;
    fdm1.Active:=true;
    if Application.MessageBox('是否通过所有数据', '提示', MB_OKCANCEL + MB_ICONINFORMATION)
      = IDOK then
    begin
      shyj:='同意';
    end
    else
    begin
       shyj:='待审核';
    end;
     with ds3 do
     begin
       Close;
       CommandText:='select * from ['+semc[0]+']';
       Active:=true;
       stsbr1.SimpleText:='共有'+inttostr(recordcount)+'宗.';
       ds2.DataSet:=ds3;
       while not eof do
       begin
         fdm1.Append;
         fdm1.FieldByName('hphm').Value:=AesDecrypt(FieldByName('号牌号码').AsString,'lgm');
         fdm1.FieldByName('hpzl').Value:=AesDecrypt(FieldByName('号牌种类').AsString,'lgm');
         fdm1.FieldByName('clpp').Value:=AesDecrypt(FieldByName('车辆品牌').AsString,'lgm');
         fdm1.FieldByName('FDJH').Value:=AesDecrypt(FieldByName('发动机号').AsString,'lgm');
         fdm1.FieldByName('syr').Value:=AesDecrypt(FieldByName('所有人').AsString,'lgm');
         fdm1.FieldByName('ccdjrq').Value:=FieldByName('初次登记日期').AsString;
         fdm1.FieldByName('clxh').Value:=FieldByName('车辆型号').AsString;
         if shyj='同意' then
         begin
            fdm1.FieldByName('yj').Value:='同意';
         end
         else
         begin
             fdm1.FieldByName('yj').Value:=FieldByName('意见').AsString;
         end;



         fdm1.Post;
         Next;

       end;
     end;
     semc.Free;
     ds2.DataSet:=fdm1;
   //  ExportGridToExcel(dlgSave1.FileName,cxgrd1,true);
  end;

end;

procedure TForm13.btn3Click(Sender: TObject);
begin

 if dlgSave1.Execute then
 begin
   fdm1.First;
   while not fdm1.Eof do
   begin
     fdm1.edit;
     fdm1.FieldByName('hphm').Value:=AesEncrypt(fdm1.FieldByName('hphm').AsString,'lgm');
     fdm1.FieldByName('hpzl').Value:=AesEncrypt(fdm1.FieldByName('hpzl').AsString,'lgm');
     fdm1.FieldByName('clpp').Value:=AesEncrypt(fdm1.FieldByName('clpp').AsString,'lgm');
     fdm1.FieldByName('FDJH').Value:=AesEncrypt(fdm1.FieldByName('FDJH').AsString,'lgm');
     fdm1.FieldByName('syr').Value:=AesEncrypt(fdm1.FieldByName('syr').AsString,'lgm');
     fdm1.FieldByName('clxh').Value:=fdm1.FieldByName('clxh').AsString;
     fdm1.FieldByName('yj').Value:=fdm1.FieldByName('yj').AsString;
     fdm1.Post;
     fdm1.Next;
   end;

   ExportGridToExcel(dlgSave1.FileName,cxgrd1,true);
    fdm1.First;
 end;
end;

procedure TForm13.btn4Click(Sender: TObject);
begin
  close;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  con1.Connected:=False;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  if btn1.Visible=true then con1.Connected:=True else con1.Connected:=False;

end;

end.
