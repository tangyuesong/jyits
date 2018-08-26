unit uDBO;

interface

uses
  Classes, SysUtils, uEntity, uGlobal, uCommon, EncdDecd;

type
  TDBO = class
  public
    class function Insert(action: TAction; params: TStrings): String; static;
    class function Delete(action: TAction; params: TStrings): String; static;
    class function Update(action: TAction; params: TStrings): String; static;
    class function Select(action: TAction; params: TStrings): String; static;
  end;

implementation

class function TDBO.Insert(action: TAction; params: TStrings): String;
var
  s, c, v, cols, Values: String;
  i: integer;
begin
  if action.TableName <> '' then
  begin
    for i := 0 to params.Count - 1 do
    begin
      c := params.Names[i];
      v := params.ValueFromIndex[i];
      if copy(UpperCase(c), 1, 7) = 'ENCODE_' then
      begin
        c := copy(c, 8, Length(c));
        v := DecodeString(v);
      end;
      cols := cols + c + ',';
      Values := Values + v.QuotedString + ',';
    end;
    cols := copy(cols, 1, Length(cols) - 1);
    Values := copy(Values, 1, Length(Values) - 1);
    s := 'insert into ' + action.TableName + '( ' + cols + ') values (' +
      Values + ')';
    if gSQLHelper.ExecuteSql(s) then
      Result := '1'
    else
      Result := '0';
  end
  else
    Result := 'Table is null';
end;

class function TDBO.Delete(action: TAction; params: TStrings): String;
var
  s, c, f, v: String;
  i: integer;
begin
  Result := '0';
  if params.Count = 0 then
    exit;
  if action.SQL <> '' then
  begin
    s := action.SQL;
    if params.Count > 0 then
    begin
      for i := 0 to params.Count - 1 do
        s := s + ' ' + params.ValueFromIndex[i].QuotedString + ',';
      s := copy(s, 1, Length(s) - 1);
    end;
    if gSQLHelper.ExecuteSql(s) then
      Result := '1'
    else
      Result := '0';
  end
  else if action.TableName <> '' then
  begin
    s := 'delete from ' + action.TableName + ' where 1 =1 ';
    for i := 0 to params.Count - 1 do
    begin
      c := params.Names[i];
      v := params.ValueFromIndex[i];
      f := '=';
      if UpperCase(copy(c, 1, 6)) = 'BEGIN_' then
      begin
        c := copy(c, 7, Length(c));
        f := '>=';
      end
      else if UpperCase(copy(c, 1, 4)) = 'END_' then
      begin
        c := copy(c, 5, Length(c));
        f := '<=';
      end
      else if UpperCase(copy(c, 1, 4)) = 'NOT_' then
      begin
        c := copy(c, 5, Length(c));
        f := '<>';
      end
      else if UpperCase(copy(c, 1, 5)) = 'NULL_' then
      begin
        c := copy(c, 6, Length(c));
        f := '';
        v := ' is null';
      end
      else if UpperCase(copy(c, 1, 8)) = 'NOTNULL_' then
      begin
        c := copy(c, 9, Length(c));
        f := '';
        v := ' is not null';
      end
      else if UpperCase(copy(c, 1, 5)) = 'LIKE_' then
      begin
        c := copy(c, 6, Length(c));
        f := ' like ';
        v := '%' + v + '%';
      end;
      if f = '' then
        s := s + ' and ' + c + v
      else
        s := s + ' and ' + c + f + v.QuotedString;
    end;
    if gSQLHelper.ExecuteSql(s) then
      Result := '1'
    else
      Result := '0';
  end
  else
    Result := 'error';
end;

class function TDBO.Update(action: TAction; params: TStrings): String;
var
  s, c, v, f, systemid: String;
  i: integer;
begin
  if action.SQL <> '' then
  begin
    s := UpperCase(action.SQL);
    if params.Count > 0 then
    begin
      if not s.Contains(' WHERE ') then
        s := s + ' where 1 = 1';
      for i := 0 to params.Count - 1 do
      begin
        c := params.Names[i];
        v := params.ValueFromIndex[i];
        f := '=';

        if s.Contains('{' + UpperCase(c) + '}') then
        begin
          s := s.Replace('{' + UpperCase(c) + '}', '''' + v + '''');
          continue;
        end;

        if UpperCase(copy(c, 1, 6)) = 'BEGIN_' then
        begin
          c := copy(c, 7, Length(c));
          f := '>=';
        end
        else if UpperCase(copy(c, 1, 4)) = 'END_' then
        begin
          c := copy(c, 5, Length(c));
          f := '<=';
        end
        else if UpperCase(copy(c, 1, 4)) = 'NOT_' then
        begin
          c := copy(c, 5, Length(c));
          f := '<>';
        end
        else if UpperCase(copy(c, 1, 5)) = 'NULL_' then
        begin
          c := copy(c, 6, Length(c));
          f := '';
          v := ' is null';
        end
        else if UpperCase(copy(c, 1, 8)) = 'NOTNULL_' then
        begin
          c := copy(c, 9, Length(c));
          f := '';
          v := ' is not null';
        end
        else if UpperCase(copy(c, 1, 5)) = 'LIKE_' then
        begin
          c := copy(c, 6, Length(c));
          f := ' like ';
          v := '%' + v + '%';
        end
        else if copy(UpperCase(c), 1, 7) = 'ENCODE_' then
        begin
          c := copy(c, 8, Length(c));
          v := DecodeString(v);
        end;
        if f = '' then
          s := s + ' and ' + c + v
        else
          s := s + ' and ' + c + f + v.QuotedString;
      end;
    end;
    if gSQLHelper.ExecuteSql(s) then
      Result := '1'
    else
      Result := '0';
  end
  else if action.TableName <> '' then
  begin
    s := 'update ' + action.TableName + ' set ';
    for i := 0 to params.Count - 1 do
    begin
      c := params.Names[i];
      v := params.ValueFromIndex[i];
      if UpperCase(c) = 'SYSTEMID' then
      begin
        systemid := ' where ' + c + '=' + v.QuotedString;
        continue;
      end
      else if copy(UpperCase(c), 1, 7) = 'ENCODE_' then
      begin
        c := copy(c, 8, Length(c));
        v := DecodeString(v);
      end;
      s := s + c + '=' + v.QuotedString + ',';
    end;
    if systemid <> '' then
    begin
      s := copy(s, 1, Length(s) - 1) + systemid;
      if gSQLHelper.ExecuteSql(s) then
        Result := '1'
      else
        Result := '0';
    end
    else
      Result := 'SystemID is null'
  end
  else
    Result := 'Table is null';
end;

class function TDBO.Select(action: TAction; params: TStrings): String;
var
  s, c, f, v, w, orderby, ascOrDesc: String;
  i, start, rows: integer;
begin
  start := 0;
  rows := -1;
  if (action.ActionType = 'P') and (action.SQL <> '') then
  begin
    s := action.SQL;
    if params.Count > 0 then
    begin
      for i := 0 to params.Count - 1 do
        s := s + ' ' + params.ValueFromIndex[i].QuotedString + ',';
      s := copy(s, 1, Length(s) - 1);
    end;
    Result := TCommon.QueryToJsonString(s);
  end
  else if action.ActionType = 'Q' then
  begin
    if action.SQL <> '' then
      s := UpperCase(action.SQL)
    else if action.TableName <> '' then
      s := 'select * from ' + action.TableName;
    if s <> '' then
    begin
      if not s.Contains(' WHERE ') then
        w := ' where 1 = 1 '
      else
        w := '';

      for i := 0 to params.Count - 1 do
      begin
        c := params.Names[i];
        v := params.ValueFromIndex[i];
        f := '=';

        if (action.SQL = '') and (UpperCase(c) = 'TOP') then
        begin
          s := 'select top ' + v + ' * from ' + action.TableName;
          continue;
        end
        else if (UpperCase(c) = 'START') then
        begin
          start := StrToIntDef(v, 0);
          continue;
        end
        else if (UpperCase(c) = 'ROWS') then
        begin
          rows := StrToIntDef(v, 30);
          continue;
        end
        else if (UpperCase(c) = 'ORDERBY_DESC') then
        begin
          orderby := v;
          ascOrDesc := ' DESC';
          continue;
        end
        else if ((UpperCase(c) = 'ORDERBY_ASC') or (UpperCase(c) = 'ORDERBY'))
        then
        begin
          orderby := v;
          ascOrDesc := ' ASC';
          continue;
        end
        else if UpperCase(copy(c, 1, 6)) = 'BEGIN_' then
        begin
          c := copy(c, 7, Length(c));
          f := '>=';
        end
        else if UpperCase(copy(c, 1, 4)) = 'END_' then
        begin
          c := copy(c, 5, Length(c));
          f := '<=';
        end
        else if UpperCase(copy(c, 1, 4)) = 'NOT_' then
        begin
          c := copy(c, 5, Length(c));
          f := '<>';
        end
        else if UpperCase(copy(c, 1, 5)) = 'NULL_' then
        begin
          c := copy(c, 6, Length(c));
          f := '';
          v := ' is null';
        end
        else if UpperCase(copy(c, 1, 8)) = 'NOTNULL_' then
        begin
          c := copy(c, 9, Length(c));
          f := '';
          v := ' is not null';
        end
        else if UpperCase(copy(c, 1, 5)) = 'LIKE_' then
        begin
          c := copy(c, 6, Length(c));
          f := ' like ';
          v := '%' + v + '%';
        end;
        if f = '' then
          w := w + ' and ' + c + v
        else
          w := w + ' and ' + c + f + v.QuotedString;
      end;
      s := s + w;
      if orderby <> '' then
      begin
        s := s + ' order by ' + orderby + ascOrDesc;
        if rows > 0 then
        begin
          s := s + ' offset ' + (start * rows).ToString + ' row fetch next ' +
            rows.ToString + ' rows only'
        end;
      end;

      Result := TCommon.QueryToJsonString(s);
    end
    else
      Result := '';
    // Result := 'config error';
  end
  else
    Result := '';
  // Result := 'config error';
end;

end.
