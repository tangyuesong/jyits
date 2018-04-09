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
// Ƶ�����복������
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
// ������ѯ
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
// �����������
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
// ���ڹ켣����ŵ����
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
// ������������
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
// ������ͳ��
// reportType �������ͣ�0=�ձ���1=�ܱ����±���2=�걨��
// statisticsType ͳ�����ͣ�1=������ͳ�ƣ�2=������ͳ�ƣ�3=�����ƹ�����ͳ�ƣ�4=��������ɫͳ�ƣ�5=��������ɫͳ�ƣ�6=����������ͳ�ƣ�7=��������ͳ��
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
// ������ײ��������
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
