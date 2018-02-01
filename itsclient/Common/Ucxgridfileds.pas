unit Ucxgridfileds;

interface

uses cxGridTableView, cxGridDBTableView, Generics.Collections, System.Classes, System.IOUtils,
  System.SysUtils, System.Types, cxTextEdit, FireDAC.Comp.Client, Data.DB,
  cxDBLookupComboBox;

type
  TfiledsRec = class
  private
    Fwidth: Integer;
    Fmc: string;
    Fdm: string;
    procedure Setdm(const Value: string);
    procedure Setmc(const Value: string);
    procedure Setwidth(const Value: Integer);
  public

    constructor Create(adm, amc: string; awidth: Integer); overload;
    property dm: string read Fdm write Setdm;
    property mc: string read Fmc write Setmc;
    property width: Integer read Fwidth write Setwidth;
  end;

  Tcustomcxgridfiled = class
  private
    dic: TDictionary<string, TfiledsRec>;
    FFileName: string;
    Fgroupfields: string;
    Fcustomfileds: string;
    Fautowidth: Boolean;
    Frowheight: Integer;
    Flookfields: string;
    FCxgridView: TcxGridTableView;
    Fwidth: Integer;
    Fheaderheight: Integer;
    FInstance: Tcustomcxgridfiled;
    procedure Setautowidth(const Value: Boolean);
    procedure Setcustomfileds(const Value: string);
    procedure Setgroupfields(const Value: string);
    procedure Setlookfields(const Value: string);
    procedure Setrowheight(const Value: Integer);
    procedure SetCxgridView(const Value: TcxGridTableView);
    function getcustomfiled(fileds: string): TList<TfiledsRec>;
    function getatuofield(fileds: string): TObjectList<TfiledsRec>;
    procedure Setwidth(const Value: Integer);
    procedure Setheaderheight(const Value: Integer);
    function GetInstance: Tcustomcxgridfiled;
  public
    constructor Create(path: string); overload;
    procedure lookupfield(i: Integer; keyfn, listfn: string; MB: TFDMemTable;
      ds: TDataSource);
    procedure setcxgirdviewfield;
    procedure GenerateField(fields:string; view:TcxGridDBTableView);
    property customfileds: string read Fcustomfileds write Setcustomfileds;
    property lookfields: string read Flookfields write Setlookfields;
    property width: Integer read Fwidth write Setwidth;
    property rowheight: Integer read Frowheight write Setrowheight;
    property headerheight:Integer read Fheaderheight write Setheaderheight;
    property autowidth: Boolean read Fautowidth write Setautowidth;
    property CxgridView: TcxGridTableView read FCxgridView
      write SetCxgridView;
    property Instance: Tcustomcxgridfiled read GetInstance;
  end;

implementation

{ Tcustomcxgridfiled }

constructor Tcustomcxgridfiled.Create(path: string);
var
  ss: TstringdynArray;
  tt: TArray<string>;
  s: string;
begin
  Self.FFileName := path;
  rowheight := 25;
  headerheight:=25;
  autowidth := True;
  dic := TDictionary<string, TfiledsRec>.Create();
  if TFile.Exists(path) then
  begin
    ss := TFile.ReadAllLines(path);
    for s in ss do
    begin
      tt := s.Split([',']);
      dic.Add(tt[0], TfiledsRec.Create(tt[0], tt[1], StrToInt(tt[2])));
    end;
  end;
end;

procedure Tcustomcxgridfiled.GenerateField(fields: string;
  view: TcxGridDBTableView);
var
  i: Integer;
  iw: Integer;
  fbname: string;
  str: TStrings;
  objlist: TList<TfiledsRec>;
  filedsrec: TfiledsRec;
begin
  view.OptionsView.ColumnAutoWidth := Fautowidth;
  view.OptionsView.DataRowHeight := Frowheight;
  view.OptionsView.HeaderHeight:=Fheaderheight;
  view.ClearItems;
  view.OptionsView.NoDataToDisplayInfoText:='';
  // 根据字符串的个数创建字段
  i := 0;
  filedsrec := TfiledsRec.Create;
  objlist := getcustomfiled(fields);
  for filedsrec in objlist do
  begin
    view.CreateColumn; // 建立一个没绑定的列
    if view is TcxGridDBTableView then
      view.Columns[i].DataBinding.FieldName := filedsrec.Fdm;

    if dic.ContainsKey(filedsrec.Fdm) then
    begin
      view.Columns[i].Caption := dic[filedsrec.Fdm].Fmc;
    end
    else
      view.Columns[i].Caption := UpperCase(filedsrec.Fdm);

    // tableview.DataController.CreateAllItems;//建立所有绑定的列
    // 字段不转换部分
    view.Columns[i].HeaderAlignmentHorz := taCenter;
    view.Columns[i].PropertiesClass := TcxTextEditProperties;
    (view.Columns[i].Properties as TcxTextEditProperties).Alignment.Horz
      := taCenter;

    view.Columns[i].width := dic[filedsrec.Fdm].Fwidth ;

    { 加字段内容转换中文 }
    if True then
      inc(i);
  end;
  filedsrec.Free;
end;

function Tcustomcxgridfiled.getatuofield(fileds: string)
  : TObjectList<TfiledsRec>;
var
  strlist: TStringList;
  i: Integer;
  obj: TObjectList<TfiledsRec>;
  frec: TfiledsRec;

begin
  strlist := TStringList.Create;
  frec := TfiledsRec.Create;
  // frec.width:=Fwidth-frec.width
  for i := 0 to strlist.Count - 1 do
  begin
    frec.Fdm := dic[strlist[i]].Fdm;
    frec.Fmc := dic[strlist[i]].Fmc;
    // frec.Fwidth:=dic[strlist[i]].Fwidth;
    Result.Add(frec);
  end;

  strlist.Free;
end;

function Tcustomcxgridfiled.getcustomfiled(fileds: string): TList<TfiledsRec>;
var
  i: Integer;
  tt: TArray<string>;
  tmp: TFiledsRec;
  s: string;
begin
  Result := TList<TfiledsRec>.Create;
  tt := fileds.Split([',']);

  for i := 0 to Length(tt) - 1 do
  begin
    s := trim(tt[i]);
    if dic.ContainsKey(s) then
      Result.Add(dic[s])
    else begin
      tmp := TFiledsRec.Create(s, s, 100);
      dic.Add(s, tmp);
      result.Add(tmp);
    end;
  end;
end;

function Tcustomcxgridfiled.GetInstance: Tcustomcxgridfiled;
begin
  if FInstance = nil then
  begin
    FInstance := Tcustomcxgridfiled.Create('');
  end;
  result := FInstance;
end;

procedure Tcustomcxgridfiled.lookupfield(i: Integer; keyfn, listfn: string;
  MB: TFDMemTable; ds: TDataSource);
begin
  ds.DataSet := MB;
  FCxgridView.Columns[i].PropertiesClass := TcxLookupComboBoxProperties;
  (FCxgridView.Columns[i].Properties as TcxLookupComboBoxProperties)
    .Alignment.Horz := taCenter;
  (FCxgridView.Columns[i].Properties as TcxLookupComboBoxProperties)
    .KeyFieldNames := keyfn;
  (FCxgridView.Columns[i].Properties as TcxLookupComboBoxProperties)
    .ListSource := ds;
  (FCxgridView.Columns[i].Properties as TcxLookupComboBoxProperties)
    .ListFieldNames := listfn;

end;

procedure Tcustomcxgridfiled.setcxgirdviewfield;
var
  i: Integer;
  iw: Integer;
  fbname: string;
  str: TStrings;
  objlist: TList<TfiledsRec>;
  filedsrec: TfiledsRec;
begin
  FCxgridView.OptionsView.ColumnAutoWidth := Fautowidth;
  FCxgridView.OptionsView.DataRowHeight := Frowheight;
  FCxgridView.OptionsView.HeaderHeight:=Fheaderheight;
  FCxgridView.ClearItems;
  FCxgridView.OptionsView.NoDataToDisplayInfoText:='';
  // 根据字符串的个数创建字段
  i := 0;
  filedsrec := TfiledsRec.Create;
  objlist := getcustomfiled(Fcustomfileds);
  for filedsrec in objlist do
  begin
    FCxgridView.CreateColumn; // 建立一个没绑定的列
    if FCxgridView is TcxGridDBTableView then
      (FCxgridView as TcxGridDBTableView).Columns[i].DataBinding.FieldName := filedsrec.Fdm;

    if dic.ContainsKey(filedsrec.Fdm) then
    begin
      FCxgridView.Columns[i].Caption := dic[filedsrec.Fdm].Fmc;
    end
    else
      FCxgridView.Columns[i].Caption := UpperCase(filedsrec.Fdm);

    // tableview.DataController.CreateAllItems;//建立所有绑定的列
    // 字段不转换部分
    FCxgridView.Columns[i].HeaderAlignmentHorz := taCenter;
    FCxgridView.Columns[i].PropertiesClass := TcxTextEditProperties;
    (FCxgridView.Columns[i].Properties as TcxTextEditProperties).Alignment.Horz
      := taCenter;

    FCxgridView.Columns[i].width := dic[filedsrec.Fdm].Fwidth ;

    { if fbname='XP1' then
      BEGIN
      FCxgridView.Columns[i].PropertiesClass :=TcxImageProperties;

      END; }

    { 加字段内容转换中文 }
    if True then

      // //设备类型转换

      // //号牌种类转换
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'HPZL','DM','MC',MBHPZL,DS_DTYHPZL);
      // //违法行为转换
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'WFXW','WFXWDM','WFXWMC',MBwfxw,ds_DTYWFXW);
      // //卡口地点转换
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'KDBH','SBBH','SBDDMC',MBdev,dm.ds_DTYWFDD);
      // //地点转换
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'WFDD','SBBH','SBDDMC',MBdev,dm.ds_DTYWFDD);
      // //部门转换
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'CJJG','DWDM','DWMC',MBCjjg,dm.ds_DTYCJJG);
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'DWDM','DWDM','DWMC',MBCjjg,dm.ds_DTYCJJG);
      // //人员名称转换
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'LRR','YHBH','YHXM',MBUser,ds_DTYUSER);
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'LRR','YHBH','YHXM',MBUser,ds_DTYUSER);
      // ExtractDty(tableview, i,UpperCase(tableview.Columns[i].DataBinding.FieldName),'LRR','YHBH','YHXM',MBUser,ds_DTYUSER);
      {
        if (i=0) and (bgroup=True) then
        begin
        FCxgridView.Columns[i].GroupBy(0,true);
        //tableview.Columns[i].Visible:=False;
        end;

      }
      inc(i);
  end;
  filedsrec.Free;
end;

procedure Tcustomcxgridfiled.Setautowidth(const Value: Boolean);
begin
  Fautowidth := Value;
end;

procedure Tcustomcxgridfiled.Setcustomfileds(const Value: string);
begin
  Fcustomfileds := UpperCase(Value);
end;

procedure Tcustomcxgridfiled.SetCxgridView(const Value: TcxGridTableView);
begin
  FCxgridView := Value;
end;

procedure Tcustomcxgridfiled.Setgroupfields(const Value: string);
begin
  Fgroupfields := Value;
end;

procedure Tcustomcxgridfiled.Setheaderheight(const Value: Integer);
begin
  Fheaderheight := Value;
end;

procedure Tcustomcxgridfiled.Setlookfields(const Value: string);
begin
  Flookfields := Value;
end;

procedure Tcustomcxgridfiled.Setrowheight(const Value: Integer);
begin
  Frowheight := Value;
end;

procedure Tcustomcxgridfiled.Setwidth(const Value: Integer);
begin
  Fwidth := Value;
end;

{ TfildsRec }

constructor TfiledsRec.Create(adm, amc: string; awidth: Integer);
begin
  Fmc := amc;
  Fdm := adm;
  Fwidth := awidth;
end;

procedure TfiledsRec.Setdm(const Value: string);
begin
  Fdm := Value;
end;

procedure TfiledsRec.Setmc(const Value: string);
begin
  Fmc := Value;
end;

procedure TfiledsRec.Setwidth(const Value: Integer);
begin
  Fwidth := Value;
end;

end.

