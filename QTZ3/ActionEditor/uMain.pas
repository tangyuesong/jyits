unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSQLHelper, IniFiles, Vcl.StdCtrls,
  sComboBox, sEdit, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.ComCtrls, IdURI, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, QJson, DateUtils;

type
  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    edtAction: TsEdit;
    edtTablename: TsEdit;
    edtMemo: TsEdit;
    cmbActionType: TsComboBox;
    edtSQL: TMemo;
    Label1: TLabel;
    tbParams: TFDMemTable;
    DataSource1: TDataSource;
    Panel2: TPanel;
    edtParam: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cmbType: TsComboBox;
    cmbNonnull: TsComboBox;
    edtDefaultvalue: TsEdit;
    edtDbColName: TsEdit;
    Button3: TButton;
    lbGroups: TListBox;
    Panel3: TPanel;
    edtColName: TsEdit;
    Button4: TButton;
    edtActionSearch: TsEdit;
    Button5: TButton;
    dgParams: TDBGridEh;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Query: TTabSheet;
    Panel4: TPanel;
    Memo1: TMemo;
    edtUser: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtPwd: TEdit;
    Label7: TLabel;
    edtHome: TEdit;
    Label8: TLabel;
    edtQuery: TEdit;
    Button9: TButton;
    http: TIdHTTP;
    GroupBox4: TGroupBox;
    edtDateInt: TEdit;
    Label9: TLabel;
    edtDateStr: TEdit;
    Label10: TLabel;
    Button10: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    gSQLHelper: TSQLHelper;
    procedure AppendParam(Param, paramType, nonnull, defaultValue,
      dbColName: String);
    procedure ClearControls();
    function GetJsonNode(ANode, AJSON: String): String;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.AppendParam(Param, paramType, nonnull, defaultValue,
  dbColName: String);
begin
  try
    tbParams.Append;
    tbParams.FieldByName('Param').AsString := Param;
    tbParams.FieldByName('Type').AsString := paramType;
    tbParams.FieldByName('Nonnull').AsString := nonnull;
    tbParams.FieldByName('DefaultValue').AsString := defaultValue;
    tbParams.FieldByName('DbColName').AsString := dbColName;
    tbParams.Post;
  except
    on e: exception do
      showmessage(e.Message);
  end;
end;

procedure TfrmMain.Button10Click(Sender: TObject);
var
  dateInt, dateStr: String;
  FSetting: TFormatSettings;
begin
  FSetting := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  FSetting.ShortDateFormat := 'yyyy/MM/dd';
  FSetting.DateSeparator := '/';
  FSetting.TimeSeparator := ':';
  FSetting.LongTimeFormat := 'hh:nn:ss.zzz';
  dateInt := Trim(edtDateInt.Text);
  dateStr := Trim(edtDateStr.Text);
  try
    if dateInt <> '' then
    begin
      edtDateStr.Text := 'Convert Error';
      edtDateStr.Text := FormatDatetime('yyyy/mm/dd hh:nn:ss.zzz',
        DateUtils.IncMilliSecond(25569.3333333333, StrToInt64(dateInt)));

    end
    else if dateStr <> '' then
    begin
      edtDateInt.Text := 'Convert Error';
      edtDateInt.Text :=
        IntToStr(DateUtils.MilliSecondsBetween(StrToDatetime(dateStr, FSetting),
        25569.3333333333));
    end;
  except
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  s, ActionType, Action, tableName, sql, Memo: String;
  Param, paramType, nonnull, defaultValue, dbColName: String;
  ts: TStrings;
  i: Integer;
begin
  Action := Trim(edtAction.Text);
  tableName := Trim(edtTablename.Text);
  sql := Trim(edtSQL.Lines.Text);
  if Action = '' then
  begin
    showmessage('Action is null');
    exit;
  end;
  if gSQLHelper.ExistsRecord('S_QTZ3_Action', 'Action = ' + Action.QuotedString)
  then
  begin
    showmessage('Action is exists');
    exit;
  end;
  if tableName + sql = '' then
  begin
    showmessage('TableName 和 SQL 不能同时为空');
    exit;
  end;
  ts := TStringList.Create;
  ActionType := cmbActionType.Text;
  Memo := Trim(edtMemo.Text);
  s := 'insert into S_QTZ3_Action (Action, ActionType, TableName, SQL, Memo) values ('
    + Action.QuotedString + ',' + ActionType.QuotedString + ',' +
    tableName.QuotedString + ',' + sql.QuotedString + ',' +
    Memo.QuotedString + ')';
  ts.Add(s);
  tbParams.First;
  while not tbParams.Eof do
  begin
    Param := tbParams.FieldByName('Param').AsString;
    paramType := tbParams.FieldByName('Type').AsString;
    if tbParams.FieldByName('nonnull').AsString = 'true' then
      nonnull := '1'
    else
      nonnull := '0';
    defaultValue := tbParams.FieldByName('defaultValue').AsString;
    dbColName := tbParams.FieldByName('dbColName').AsString;

    s := 'insert into S_QTZ3_ActionParam(Action, Param, Type, Nonnull, DefaultValue, DbColName) values ('
      + Action.QuotedString + ',' + Param.QuotedString + ',' +
      paramType.QuotedString + ',' + nonnull.QuotedString + ',' +
      defaultValue.QuotedString + ',' + dbColName.QuotedString + ')';
    ts.Add(s);
    tbParams.Next;
  end;

  for i := 0 to lbGroups.Items.Count - 1 do
  begin
    s := 'insert into S_QTZ3_ReturnGroup(Action, ColName) values (' +
      Action.QuotedString + ',' + lbGroups.Items[i].QuotedString + ')';
    ts.Add(s);
  end;

  if gSQLHelper.ExecuteSqlTran(ts) then
    showmessage('添加成功')
  else
    showmessage('添加失败');
  ts.Free;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Button3Click(Sender: TObject);
var
  Param, v: String;
  i: Integer;
begin
  Param := Trim(edtParam.Text);
  tbParams.First;
  while not tbParams.Eof do
  begin
    if Param = tbParams.FieldByName('Param').AsString then
    begin
      showmessage('参数值重复');
      exit;
    end;
    tbParams.Next;
  end;

  if Trim(edtParam.Text) = '' then
    exit;
  {
    if (cmbType.Text = 'int') and (Trim(edtDefaultvalue.Text) <> '') then
    begin
    v := Trim(edtDefaultvalue.Text);
    if StrToIntDef(v, -986334) = -986334 then
    begin
    showmessage('默认值设置不正确');
    exit;
    end;
    end;
  }

  AppendParam(Trim(edtParam.Text), cmbType.Text, LowerCase(cmbNonnull.Text),
    Trim(edtDefaultvalue.Text), Trim(edtDbColName.Text));
end;

procedure TfrmMain.Button4Click(Sender: TObject);
var
  col: String;
begin
  col := LowerCase(Trim(edtColName.Text));
  if (col = '') or (lbGroups.Items.IndexOf(col) >= 0) then
    exit;
  lbGroups.Items.Add(col);
end;

procedure TfrmMain.Button5Click(Sender: TObject);
var
  Action: String;
  Param, paramType, nonnull, defaultValue, dbColName: String;
begin
  ClearControls;
  Action := Trim(edtActionSearch.Text);
  if Action = '' then
  begin
    showmessage('Action is null');
    exit;
  end;
  with gSQLHelper.Query('select * from S_QTZ3_Action where Action = ' +
    Action.QuotedString) do
  begin
    if RecordCount > 0 then
    begin
      cmbActionType.ItemIndex := cmbActionType.IndexOf(FieldByName('ActionType')
        .AsString);
      edtAction.Text := FieldByName('Action').AsString;
      edtTablename.Text := FieldByName('Tablename').AsString;
      edtMemo.Text := FieldByName('Memo').AsString;
      edtSQL.Text := FieldByName('SQL').AsString;
    end;
    Free;
  end;

  with gSQLHelper.Query('select * from S_QTZ3_ActionParam where Action = ' +
    Action.QuotedString) do
  begin
    while not Eof do
    begin
      Param := FieldByName('Param').AsString;
      paramType := FieldByName('Type').AsString;
      if FieldByName('nonnull').AsBoolean then
        nonnull := 'true'
      else
        nonnull := 'false';
      defaultValue := FieldByName('defaultValue').AsString;
      dbColName := FieldByName('dbColName').AsString;
      AppendParam(Param, paramType, nonnull, defaultValue, dbColName);
      Next;
    end;
    Free;
  end;

  with gSQLHelper.Query('select ColName from S_QTZ3_ReturnGroup where Action = '
    + Action.QuotedString) do
  begin
    while not Eof do
    begin
      lbGroups.Items.Add(Fields[0].AsString);
      Next;
    end;
    Free;
  end;
end;

procedure TfrmMain.Button6Click(Sender: TObject);
begin
  if not tbParams.Eof then
    tbParams.Delete;
end;

procedure TfrmMain.Button7Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lbGroups.Items.Count - 1 do
  begin
    if lbGroups.Selected[i] then
    begin
      lbGroups.Items.Delete(i);
      exit;
    end;
  end;
end;

procedure TfrmMain.Button8Click(Sender: TObject);
var
  ts: TStrings;
  Action: String;
begin
  Action := Trim(edtActionSearch.Text);
  if Action = '' then
  begin
    showmessage('Action is null');
    exit;
  end;
  ts := TStringList.Create;
  ts.Add(' delete from S_QTZ3_Action where Action = ' + Action.QuotedString);
  ts.Add(' delete from S_QTZ3_ActionParam where Action = ' +
    Action.QuotedString);
  ts.Add(' delete from S_QTZ3_ReturnGroup where Action = ' +
    Action.QuotedString);
  if gSQLHelper.ExecuteSqlTran(ts) then
    showmessage('删除成功')
  else
    showmessage('删除失败');
  ts.Free;
end;

procedure TfrmMain.Button9Click(Sender: TObject);
var
  s, token, key, url: String;
  i: Integer;
begin
  url := edtHome.Text + 'login?user=' + edtUser.Text + '&pwd=' + edtPwd.Text;
  s := http.Get(TIdURI.URLEncode(url));
  token := GetJsonNode('token', s);
  if token = '' then
  begin
    showmessage(GetJsonNode('message', s));
    exit;
  end;

  url := edtHome.Text + edtQuery.Text;
  if not url.Contains('?') then
    url := url + '?token=' + token
  else
    url := url + '&token=' + token;
  s := http.Get(TIdURI.URLEncode(url));
  Memo1.Text := s;
end;

procedure TfrmMain.ClearControls;
begin
  edtAction.Text := '';
  edtTablename.Text := '';
  edtMemo.Text := '';
  edtSQL.Text := '';
  edtParam.Text := '';
  edtDefaultvalue.Text := '';
  edtDbColName.Text := '';
  tbParams.Close;
  tbParams.Open;
  edtColName.Text := '';
  lbGroups.Clear;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  gSQLHelper.Free;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  gSQLHelper := TSQLHelper.Create;

  with TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini') do
  begin
    gSQLHelper.DBServer := ReadString('DB', 'Server', '.');
    gSQLHelper.DBName := ReadString('DB', 'Name', 'YjItsDB');
    gSQLHelper.DBUser := ReadString('DB', 'User', 'vioadmin');
    gSQLHelper.DBPWD := ReadString('DB', 'Pwd', 'lgm1224,./');
    Free;
  end;

  tbParams.FieldDefs.Add('Param', ftString, 50);
  tbParams.FieldDefs.Add('Type', ftString, 50);
  tbParams.FieldDefs.Add('Nonnull', ftString, 50);
  tbParams.FieldDefs.Add('DefaultValue', ftString, 50);
  tbParams.FieldDefs.Add('DbColName', ftString, 50);

  tbParams.Open;
end;

function TfrmMain.GetJsonNode(ANode, AJSON: String): String;
  function FindJson(AItemName: String; AJSON: TQJson): TQJson;
  var
    i: Integer;
  begin
    Result := nil;
    for i := 0 to AJSON.Count - 1 do
    begin
      if Uppercase(AJSON.Items[i].Name) = Uppercase(AItemName) then
        Result := AJSON.Items[i]
      else
        Result := FindJson(AItemName, AJSON.Items[i]);
      if Result <> nil then
        break;
    end;
  end;

var
  item, JSON: TQJson;
begin
  Result := '';
  JSON := TQJson.Create;
  try
    JSON.Parse(AJSON);
    item := FindJson(ANode, JSON);
    if item <> nil then
      Result := item.ToString;
  finally
    JSON.Free;
  end;

end;

end.
