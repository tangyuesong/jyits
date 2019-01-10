unit LatLngHelper;

interface

uses
  System.Math, System.SysUtils;

type
  TLatLng = record
    lat, lng: Double;
  end;

  TLatLngs = array of TLatLng;

  TLatLngHelper = record Helper for TLatLng
  private
    const
      X_PI = 3.14159265358979324 * 3000.0 / 180.0;
    function sgn(a: real): real;
    function atan2(Y, X: real): real;
    function TransformLng(X, Y: Double): Double;
    function TransformLat(X, Y: Double): Double;
  public
    function OutOfChina: Boolean;
    function GCJ02ToWGS84: TLatLng; overload;
    class function GCJ02ToWGS84(latLngs: TLatLngs): TLatLngs; overload; static;
    function WGS84ToGCJ02: TLatLng; overload;
    class function WGS84ToGCJ02(latLngs: TLatLngs): TLatLngs; overload; static;
    function GCJ02ToBD09: TLatLng;
    function BD09ToGCJ02: TLatLng;
    function Equals(AOther: TLatLng): Boolean;
    function DistanceTo(AOther: TLatLng): Double;
    function DistanceToLine(line: TLatLngs): Double;
    function HeightTo(A, B: TLatLng): Double;
    function ToString(const Precision: Integer): string;
  end;

implementation

const
  EARTH_RADIUS = 6378137.0; // µ¥Î»M

function TLatLngHelper.atan2(Y, X: real): real;
begin
  if X > 0 then
    atan2 := arctan(Y / X)
  else if X < 0 then
    atan2 := arctan(Y / X) + pi
  else
    atan2 := pi / 2 * sgn(Y);
end;

function TLatLngHelper.BD09ToGCJ02: TLatLng;
var
  X, Y, z, theta: Double;
begin
  X := Self.lng - 0.0065;
  Y := Self.lat - 0.006;
  z := sqrt(X * X + Y * Y) - 0.00002 * sin(Y * X_PI);
  theta := atan2(Y, X) - 0.000003 * cos(X * X_PI);
  Result.lng := z * cos(theta);
  Result.lat := z * sin(theta);
end;

function TLatLngHelper.DistanceTo(AOther: TLatLng): Double;
  function getRad(d: Double): Double;
  begin
    Result := d * PI / 180.0;
  end;
var
  f, g, l: Double;
  sg, sl, sf: Double;
  s, c, w, r, d, h1, h2: Double;
  a, fl: Double;
begin
  f := getRad((lat + AOther.lat) / 2);
  g := getRad((lat - AOther.lat) / 2);
  l := getRad((lng - AOther.lng) / 2);
  if (g = 0) and (l = 0) then
    exit(0);

  sg := sinh(g);
  sl := sinh(l);
  sf := sinh(f);
  a := EARTH_RADIUS;
  fl := 1 / 298.257;
  sg := sg * sg;
  sl := sl * sl;
  sf := sf * sf;
  s := sg * (1 - sl) + (1 - sf) * sl;
  c := (1 - sg) * (1 - sl) + sf * sl;
  w := System.Math.ArcTanh(sqrt(s / c));
  r := sqrt(s * c) / w;
  d := 2 * w * a;
  h1 := (3 * r - 1) / 2 / c;
  h2 := (3 * r + 1) / 2 / s;
  Result := d * (1 + fl * (h1 * sf * (1 - sg) - h2 * (1 - sf) * sg));
end;

function TLatLngHelper.DistanceToLine(line: TLatLngs): Double;
  function getNearstIndex: integer;
  var
    i: integer;
    d, min: double;
  begin
    min := Double.MaxValue;
    for i := 0 to Length(line) - 1 do
    begin
      d := self.DistanceTo(line[i]);
      if d < min then
      begin
        min := d;
        result := i;
      end;
    end;
  end;
var
  iA, iB: integer;
  d, ca: double;
begin
  iA := GetNearstIndex;
  ca := self.DistanceTo(line[iA]);

  if (iA = 0) or (iA=length(line) - 1) then
    exit(ca);

  d := self.DistanceTo(line[iA-1]);
  if d < self.DistanceTo(line[iA + 1]) then
    iB := iA-1
  else
    iB := iA+1;

  result := self.HeightTo(line[iA], line[iB]);
end;

function TLatLngHelper.Equals(AOther: TLatLng): Boolean;
begin
  Result := True;
end;

function TLatLngHelper.GCJ02ToBD09: TLatLng;
var
  X, Y, z, theta: Double;
begin
  X := Self.lng;
  Y := Self.lat;
  z := sqrt(X * X + Y * Y) + 0.00002 * sin(Y * X_PI);
  theta := atan2(Y, X) + 0.000003 * cos(X * X_PI);
  Result.lng := z * cos(theta) + 0.0065;
  Result.lat := z * sin(theta) + 0.006;
end;

class function TLatLngHelper.GCJ02ToWGS84(latLngs: TLatLngs): TLatLngs;
var
  I, count: Integer;
begin
  count := Length(latLngs);
  SetLength(Result, count);
  for I := 0 to count - 1 do
    Result[I] := latLngs[I].GCJ02ToWGS84;
end;

function TLatLngHelper.HeightTo(A, B: TLatLng): Double;
var
  ab,bc,ca,bd: double;
begin
  ab := A.DistanceTo(B);
  bc := self.DistanceTo(B);
  ca := self.DistanceTo(A);
  bd := (ab*ab + bc*bc - ca*ca)/2/ab;
  result := sqrt(bc*bc - bd*bd);
end;

function TLatLngHelper.OutOfChina: Boolean;
begin
  Result := (Self.lng < 72.004) and (Self.lng > 137.8347) and (Self.lat < 0.8293) and (Self.lat > 55.8271);
end;

// http://kd5col.info/swag/DELPHI/0046.PAS.html
function TLatLngHelper.sgn(a: real): real;
begin
  if a < 0 then
    sgn := -1
  else
    sgn := 1;
end;

function TLatLngHelper.ToString(const Precision: Integer): string;
begin
  Result := Self.lat.ToString(Precision) + ',' + Self.lng.ToString(Precision);
end;

function TLatLngHelper.TransformLat(X, Y: Double): Double;
begin
  Result := -100.0 + 2.0 * X + 3.0 * Y + 0.2 * Y * Y + 0.1 * X * Y + 0.2 * sqrt(Abs(X));
  Result := Result + (20.0 * sin(6.0 * X * pi) + 20.0 * sin(2.0 * X * pi)) * 2.0 / 3.0;
  Result := Result + (20.0 * sin(Y * pi) + 40.0 * sin(Y / 3.0 * pi)) * 2.0 / 3.0;
  Result := Result + (160.0 * sin(Y / 12.0 * pi) + 320 * sin(Y * pi / 30.0)) * 2.0 / 3.0;
end;

function TLatLngHelper.TransformLng(X, Y: Double): Double;
begin
  Result := 300.0 + X + 2.0 * Y + 0.1 * X * X + 0.1 * X * Y + 0.1 * sqrt(Abs(X));
  Result := Result + (20.0 * sin(6.0 * X * pi) + 20.0 * sin(2.0 * X * pi)) * 2.0 / 3.0;
  Result := Result + (20.0 * sin(X * pi) + 40.0 * sin(X / 3.0 * pi)) * 2.0 / 3.0;
  Result := Result + (150.0 * sin(X / 12.0 * pi) + 300.0 * sin(X / 30.0 * pi)) * 2.0 / 3.0;
end;

class function TLatLngHelper.WGS84ToGCJ02(latLngs: TLatLngs): TLatLngs;
var
  I, count: Integer;
begin
  count := Length(latLngs);
  SetLength(Result, count);
  for I := 0 to count - 1 do
    Result[I] := latLngs[I].WGS84ToGCJ02;
end;

function TLatLngHelper.WGS84ToGCJ02: TLatLng;

//
// Krasovsky 1940
//
// a = 6378245.0, 1/f = 298.3
// b = a * (1 - f)
// ee = (a^2 - b^2) / a^2;
const
  a = 6378245.0;
  ee = 0.00669342162296594323;
var
  offset_lat, offset_lng, radLat, magic, sqrtMagic: Double;
  lat, lng: Double;
begin
  lat := Self.lat;
  lng := Self.lng;
  if Self.OutOfChina then
  begin
    Result.lat := lat;
    Result.lng := lng;
    Exit;
  end;

  offset_lat := TransformLat(lng - 105.0, lat - 35.0);
  offset_lng := TransformLng(lng - 105.0, lat - 35.0);

  radLat := lat / 180.0 * pi;
  magic := sin(radLat);
  magic := 1 - ee * magic * magic;
  sqrtMagic := sqrt(magic);

  offset_lat := (offset_lat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * pi);
  offset_lng := (offset_lng * 180.0) / (a / sqrtMagic * cos(radLat) * pi);

  Result.lat := lat + offset_lat;
  Result.lng := lng + offset_lng;

end;

function TLatLngHelper.GCJ02ToWGS84: TLatLng;
var
  wgLoc, currGcLoc, dLoc: TLatLng;
begin
  wgLoc := Self;
  while True do
  begin
    currGcLoc := wgLoc.WGS84ToGCJ02;
    dLoc.lat := Self.lat - currGcLoc.lat;
    dLoc.lng := Self.lng - currGcLoc.lng;
    if (Abs(dLoc.lat) < 1E-7) and (Abs(dLoc.lng) < 1E-7) then
    begin // 1e-7 ~ centimeter level accuracy
      // Result of experiment:
      // Most of the time 2 iterations would be enough for an 1e-8 accuracy (milimeter level).

      Break;
    end;
    wgLoc.lat := wgLoc.lat + dLoc.lat;
    wgLoc.lng := wgLoc.lng + dLoc.lng;
  end;
  Result := wgLoc;
end;

end.

