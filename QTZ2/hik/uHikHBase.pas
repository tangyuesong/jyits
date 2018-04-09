unit uHikHBase;

interface

uses
  SysUtils, Generics.Collections, Soap.SOAPHTTPClient, uMoreLikeThisHBase,
  uDataStatistics, uDataAnalysis, uAnalysisExtra;

type
  THikHBase = Class
  private
    class function GetResultString(AResult: String): String;
  public
    class function vehiclePassSummary(startTime, endTime, crossIds: String;
      reportType, statisticsType: Integer; directionIndex: String = 'ALL';
      vehicleBelong: String = 'ALL'; vehicleType: String = 'ALL'): String;
    class function moreLikeThisHBase(param: TDictionary<string, String>;
      page, pageSize: Integer): string;
    class function trackerAssociateAnalysis(taskId, plateNo, crosses, startTime,
      endTime: string; timeInterval, threshold, pageSize,
      pageNo: Integer): string;
    class function crossAggregationAnalysis(taskId, districts: string;
      threshold, pageSize, pageNo, plateColor: Integer): string;
    class function newFootHoldsByTrack(plateNo, plateColor, startTime,
      endTime: string; threshold: Integer; taskId: string;
      pageSize, pageNo: Integer): string;
    class function frequencyCrossAnalysis(taskId, crosses, startTime,
      endTime: string; freSet, threshold, pageSize, pageNo: Integer): string;
    class function newFirstEnterCityAnalysis(plateNo, vehicleLogo,
      vehicleSubLogo, plateColor, plateType, vehicleType, vehicleColor,
      startTime, endTime: string; recallTime: Integer;
      exceptPlateNo, taskId: string; pageSize, pageNo: Integer): string;
  End;

implementation

{ THikHBase }

class function THikHBase.GetResultString(AResult: String): String;
var
  i, j: Integer;
begin
  i := pos('<results>', AResult);
  j := pos('</results>', AResult);
  if (i > 0) and (j > i) then
    Result := Trim(copy(AResult, i + 8, j - i - 8))
  else
    Result := '';
end;

class function THikHBase.frequencyCrossAnalysis(taskId, crosses, startTime,
  endTime: string; freSet, threshold, pageSize, pageNo: Integer): string;
// 频繁出入车辆研判
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.frequencyCrossAnalysis(taskId, crosses, startTime, endTime,
    freSet, threshold, pageSize, pageNo);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

class function THikHBase.moreLikeThisHBase(param: TDictionary<string, String>;
  page, pageSize: Integer): string;
// 过车查询
var
  mlService: moreLikeThisHBaseWs;
  arg: mltClientHRequest;
  fields: Array_Of_mltClientFieldOption;
  field: mltClientFieldOption;
  s, key: String;
  i: Integer;
begin
  Result := '';
  mlService := GetmoreLikeThisHBaseWs(True);
  if mlService = nil then
    exit;

  arg := mltClientHRequest.Create;
  arg.currentPage := page;
  arg.pageSize := pageSize;
  arg.beanId := 'pass';
  arg.sortColumn := 'passtime';
  arg.sortMethod := 'desc';
  for key in param.Keys do
  begin
    if key = 'q' then
    begin
      arg.q := param[key];
    end
    else
    begin
      SetLength(fields, High(fields) + 1);
      field := mltClientFieldOption.Create;
      field.filedName := key;
      field.keyWords := param[key];
      fields[High(fields)] := field;
    end;
  end;
  arg.fieldOptions := fields;

  s := mlService.moreLikeThis(arg);
  Result := GetResultString(s);
  for i := Low(fields) to High(fields) do
    fields[i].Free;
  SetLength(fields, 0);
  arg.Free;
  (mlService as THTTPRIO).Free;
end;

class function THikHBase.newFirstEnterCityAnalysis(plateNo, vehicleLogo,
  vehicleSubLogo, plateColor, plateType, vehicleType, vehicleColor, startTime,
  endTime: string; recallTime: Integer; exceptPlateNo, taskId: string;
  pageSize, pageNo: Integer): string;
// 初次入城研判
var
  aeService: analysisExtra;
  s: String;
begin
  Result := '';
  aeService := GetanalysisExtra(True);
  if aeService = nil then
    exit;
  s := aeService.newFirstEnterCityAnalysis(plateNo, vehicleLogo, vehicleSubLogo,
    plateColor, plateType, vehicleType, vehicleColor, startTime, endTime,
    recallTime, exceptPlateNo, taskId, pageSize, pageNo);
  Result := GetResultString(s);
  (aeService as THTTPRIO).Free;
end;

class function THikHBase.newFootHoldsByTrack(plateNo, plateColor, startTime,
  endTime: string; threshold: Integer; taskId: string;
  pageSize, pageNo: Integer): string;
// 基于轨迹的落脚点分析
var
  aeService: analysisExtra;
  s: String;
begin
  Result := '';
  aeService := GetanalysisExtra(True);
  if aeService = nil then
    exit;
  s := aeService.newFootHoldsByTrack(plateNo, plateColor, startTime, endTime,
    threshold, taskId, pageSize, pageNo);
  Result := GetResultString(s);
  (aeService as THTTPRIO).Free;
end;

class function THikHBase.trackerAssociateAnalysis(taskId, plateNo, crosses,
  startTime, endTime: string; timeInterval, threshold, pageSize,
  pageNo: Integer): string;
// 跟车关联研判
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.trackerAssociateAnalysis(taskId, plateNo, crosses, startTime,
    endTime, timeInterval, threshold, pageSize, pageNo);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

class function THikHBase.vehiclePassSummary(startTime, endTime,
  crossIds: String; reportType, statisticsType: Integer;
  directionIndex, vehicleBelong, vehicleType: String): String;
// 车流量统计
// reportType 报表类型，0=日报表，1=周报表，月报表，2=年报表
// statisticsType 统计类型，1=按卡口统计，2=按方向统计，3=按车牌归属地统计，4=按车身颜色统计，5=按车牌颜色统计，6=按车辆类型统计，7=按牌类型统计
var
  dsService: dataStatistics;
  Results: statisticsResults2;
begin
  Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Results := dsService.vehiclePassSummary(startTime, endTime, crossIds,
    directionIndex, reportType, statisticsType, vehicleBelong, vehicleType);
  Result := Results.Results;
  Results.Free;
  (dsService as THTTPRIO).Free;
end;

class function THikHBase.crossAggregationAnalysis(taskId, districts: string;
  threshold, pageSize, pageNo, plateColor: Integer): string;
// 区域碰撞车辆研判
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.crossAggregationAnalysis(taskId, districts, threshold,
    pageSize, pageNo, plateColor);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

end.
