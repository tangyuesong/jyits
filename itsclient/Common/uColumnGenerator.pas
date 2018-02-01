unit uColumnGenerator;

interface

uses cxGridTableView, cxGridDBTableView, Generics.Collections, System.Classes,
  System.IOUtils, cxGridDBCardView,cxGridDBChartView, cxGridCustomTableView,
  System.SysUtils, System.Types, cxTextEdit, FireDAC.Comp.Client, Data.DB,
  cxDBLookupComboBox, uRequestItf, uJSONUtils;

type
  TColumnDefine = class
    Width: string;
    MC: string;
    DM: string;
  end;

  TColumnGenerator = class
  private
    dic: TDictionary<string, TColumnDefine>;
    class var FInstance: TColumnGenerator;
    function GetColumns(fileds: string): TList<TColumnDefine>;
    class function GetInstance: TColumnGenerator; static;
    constructor Create; overload;
    destructor Destroy; override;
  public
    procedure GenerateField(fields: string; view: TcxGridTableView);
    class property Instance: TColumnGenerator read GetInstance;
    class procedure lookupfield(col: TcxGridColumn; KeyFieldNames, ListFieldNames: string;
      ds: TDataSource);
    class procedure LookupColumn(col: TcxGridColumn; ds: TDataSource); static;
    class procedure LookupRow(col: TcxGridDBCardViewRow; ds: TDataSource); static;
  end;

implementation

{ TColumnGenerator }

constructor TColumnGenerator.Create;
var
  list: TList<TColumnDefine>;
  s: string;
  item: TColumnDefine;
begin
  s := TRequestItf.DbQuery('Gets_gridcolumnDef', '');
  list := TJSONUtils.JsonToObjectList<TColumnDefine>(s);
  dic := TDictionary<string, TColumnDefine>.Create();
  for item in list do
    dic.Add(item.DM.ToUpper, item);
  inherited;
end;

destructor TColumnGenerator.Destroy;
var
  key: string;
begin
  for key in dic.Keys do
    dic[key].Free;
  dic.Free;
  inherited;
end;

class procedure TColumnGenerator.lookupfield(col: TcxGridColumn;
  KeyFieldNames, ListFieldNames: string; ds: TDataSource);
begin
  col.PropertiesClass := TcxLookupComboBoxProperties;
  (col.Properties as TcxLookupComboBoxProperties).Alignment.Horz := taCenter;
  (col.Properties as TcxLookupComboBoxProperties).KeyFieldNames := KeyFieldNames;
  (col.Properties as TcxLookupComboBoxProperties).ListSource := ds;
  (col.Properties as TcxLookupComboBoxProperties).ListFieldNames := ListFieldNames;

end;

class procedure TColumnGenerator.LookupRow(col: TcxGridDBCardViewRow; ds: TDataSource);
var
  KeyFieldNames, ListFieldNames: string;
begin
  KeyFieldNames := ds.DataSet.Fields[0].FieldName;
  ListFieldNames := ds.DataSet.Fields[1].FieldName;
  col.PropertiesClass := TcxLookupComboBoxProperties;
 // (col.Properties as TcxLookupComboBoxProperties).Alignment.Horz := taCenter;
  (col.Properties as TcxLookupComboBoxProperties).KeyFieldNames := KeyFieldNames;
  (col.Properties as TcxLookupComboBoxProperties).ListSource := ds;
  (col.Properties as TcxLookupComboBoxProperties).ListFieldNames := ListFieldNames;

end;
class procedure TColumnGenerator.LookupColumn(col: TcxGridColumn; ds: TDataSource);
var
  KeyFieldNames, ListFieldNames: string;
begin
  KeyFieldNames := ds.DataSet.Fields[0].FieldName;
  ListFieldNames := ds.DataSet.Fields[1].FieldName;
  col.PropertiesClass := TcxLookupComboBoxProperties;
  (col.Properties as TcxLookupComboBoxProperties).Alignment.Horz := taCenter;
  (col.Properties as TcxLookupComboBoxProperties).KeyFieldNames := KeyFieldNames;
  (col.Properties as TcxLookupComboBoxProperties).ListSource := ds;
  (col.Properties as TcxLookupComboBoxProperties).ListFieldNames := ListFieldNames;

end;

procedure TColumnGenerator.GenerateField(fields: string;
  view: TcxGridTableView);
var
  objlist: TList<TColumnDefine>;
  column: TcxGridColumn;
  item: TColumnDefine;
begin
  view.OptionsView.ColumnAutoWidth := true;
  view.OptionsView.DataRowHeight := 25;
  view.OptionsView.HeaderHeight := 25;
  view.ClearItems;
  view.OptionsView.NoDataToDisplayInfoText := '没有数据';

  objlist := GetColumns(fields);
  for item in objlist do
  begin
    column := view.CreateColumn;
    column.HeaderAlignmentHorz := taCenter;
    column.PropertiesClass := TcxTextEditProperties;
    column.Properties.Alignment.Horz := taCenter;
    column.Options.Filtering:=false;
    if (item.DM='详细信息') or (item.DM='详细') or (item.DM='操作') then
    begin
      column.Properties.ReadOnly:=True;
      column.Options.ShowEditButtons := isebAlways;
    end
    else
      column.Options.Editing:=False;
    column.Caption := item.MC;
    column.Width := strtointdef(item.Width, 128);
    if column is TcxGridDBColumn then
      (column as TcxGridDBColumn).DataBinding.FieldName := item.DM;
  end;
  objlist.Free;
end;

function TColumnGenerator.GetColumns(fileds: string): TList<TColumnDefine>;
var
  i: Integer;
  tt: TArray<string>;
  tmp: TColumnDefine;
  s: string;
begin
  Result := TList<TColumnDefine>.Create;
  tt := fileds.Split([',']);

  for i := 0 to Length(tt) - 1 do
  begin
    s := trim(tt[i]).ToUpper;
    if not dic.ContainsKey(s) then
    begin
      tmp := TColumnDefine.Create;
      tmp.DM := s;
      tmp.MC := s;
      tmp.Width := '128';
      dic.Add(s, tmp);
    end;
    Result.Add(dic[s]);
  end;
end;

class function TColumnGenerator.GetInstance: TColumnGenerator;
begin
  if FInstance = nil then
  begin
    FInstance := TColumnGenerator.Create;
  end;
  Result := FInstance;
end;

end.
