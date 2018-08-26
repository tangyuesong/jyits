unit uHikHBase;

interface

uses
  SysUtils, Generics.Collections, Soap.SOAPHTTPClient, uMoreLikeThisHBase,
  uDataStatistics, uDataAnalysis, uAnalysisExtra, uPolice, uProfile,
  uTrafficForecast;

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
    class function trackerAssociateAnalysis(plateNo, crosses, startTime,
      endTime: string; timeInterval, threshold, pageSize, pageNo: Integer;
      taskId: String = ''): string;
    class function crossAggregationAnalysis(districts: string;
      threshold, pageSize, pageNo, plateColor: Integer;
      taskId: String = ''): string;
    class function newFootHoldsByTrack(plateNo, plateColor, startTime,
      endTime: string; threshold: Integer; taskId: string;
      pageSize, pageNo: Integer): string;
    class function frequencyCrossAnalysis(crosses, startTime, endTime: string;
      freSet, threshold, pageSize, pageNo: Integer;
      taskId: String = ''): string;
    class function newFirstEnterCityAnalysis(plateNo, vehicleLogo,
      vehicleSubLogo, plateColor, plateType, vehicleType, vehicleColor,
      startTime, endTime: string; recallTime: Integer;
      exceptPlateNo, taskId: string; pageSize, pageNo: Integer): string;
    class function shortTimePassAnalysis(crossRef, crosses, startTime,
      endTime: string; threshold: Int64; pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function trackDetectionAnalysis(plateNo, startTime, endTime,
      vehicleType, vehicleColor: string; pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function specTimePassAnalysis(crosses, startTime, endTime: string;
      pageSize, pageNo: Integer; taskId: string = ''): string;
    class function abnormalTrackAnalysis(plateNo, crosses, inStartTime,
      inEndTime, outStartTime, outEndTime: string;
      threshold, pageSize, pageNo: Integer; taskId: string = ''): string;
    class function fakePlateAnalysis(plateNo, startTime, endTime: string;
      pageSize, pageNo: Integer; taskId: string = ''): string;
    class function trackerAlikeAnalysis(plateNos, startTime, endTime: string;
      timeThreshold, crossThreshold, pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function hiddenVehicleAnalysis(plateNo, startTime, endTime, crosses,
      vehicleColor, vehicleType, plateColor, plateType, beforeTime,
      afterTime: string; beforeVal, afterVal, pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function frequencyVehicleAnalysis(plateNos, startTime,
      endTime: string; freSet, threshold, pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function consecutiveFoulsAnalysis(plateNos, startTime,
      endTime: string; freSet, threshold, pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function nightVehicleAnalysis(crossIds, plateNos, startDate, endDate,
      startTime, endTime, vehicleTypes, vehicleLogos, vehicleSublogos,
      vehicleModels: string; freSet, threshold, pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function vehicleGroupStatistics(sort: string; statisticsType: Integer;
      startTime, endTime: string; pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function trackerLawAnalysis(plateNos, startDate, endDate: string;
      plateColor: Integer; crossIds: string; pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function mostActiveVehicleSummary(startTime, endTime: string;
      pageSize, pageNo: Integer; taskId: string = ''): string;
    class function groupSearch(param: TDictionary<string, String>;
      page, pageSize: Integer): string;
    class function trackerIdentifyAnalysis(trackerArgs: string;
      frontThreshold, backThreshold, threshold, pageSize, pageNo: Integer;
      taskId: string = ''): string;
    class function policeDataAnalysis(startDate, endDate, more: string;
      pageSize, pageNo: Integer; taskId: String): string;
    class function vehiclePassCompare(crossIds, directionIndex, vehicleBelong,
      vehicleType, setTime: string): statisticsResults2;
    class function vehicleAlarmSummary(crossIds, startTime, endTime,
      vehicleType: string; reportType: Integer): statisticsResultsNoTime2;
    class function vehicleAlarmSummaryByAction(crossIds, startTime, endTime,
      violativeAction: string; reportType: Integer): statisticsResultsNoTime2;
    class function vehiclePassSpecTimeSummary(crossIds, startTime, endTime,
      setTime, vehicleBelong, vehicleType, directionIndex: string)
      : statisticsResults2;
    class function vehicleTrackSummary(crossIds, plateColor, plateType,
      timeLists, statisticsType, vehicleType, vehicleBelong, vehicleSpeed,
      vehicleLen, vehicleColorDepth, vehicleColor: string): statisticsResults2;
    class function vehicleAlarmProcessSummary(startTime, endTime, crossIds,
      plateType, vehicleColorDepth, vehicleType, plateColor, vehicleColor,
      laneNo, directionIndex: string): statisticsResultsNoTime2;
    class function vehicleAlarmProcessSummaryByAction(startTime, endTime,
      crossIds, plateType, vehicleColorDepth, vehicleType, plateColor,
      vehicleColor, laneNo, directionIndex, violativeAction: string)
      : statisticsResultsNoTime2;
    class function propertiesStatistics(taskId, sort, statisticsType, startTime,
      endTime: string; pageSize, pageNo: Integer): string;
    class function query(hphm, hpys: string): string;
    class function forecastCrossFlow(crossSet, startTime, endTime: string)
      : responseInfo2;
    class function getVehicleBestTimePolice(startCrossingId, endCrossingId,
      argumentTime: Integer; opera, isUsed: string;
      pageSize, pageNo: Integer): string;
    class function newfakePlateAnalysis(plateNo, startDate, endDate: string;
      threshold: Integer; checkResult, plateColor: string;
      pageSize, pageNo: Integer): string;
    class function checkFakePlate(plateNo, fakeids, checkResult,
      reason: string): string;
    class function falsePlateAnalysis(plateNo, startDate, endDate: string;
      threshold: Integer; checkResult, plateColor: string;
      resType, pageSize, pageNo: Integer): string;
    class function checkFalsePlate(falseids, checkResult,
      reason: string): string;

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

class function THikHBase.getVehicleBestTimePolice(startCrossingId,
  endCrossingId, argumentTime: Integer; opera, isUsed: string;
  pageSize, pageNo: Integer): string;
// ���Ʒ���-���ʱ��
var
  aeService: analysisExtra;
  s: String;
begin
  Result := '';
  aeService := GetanalysisExtra(True);
  if aeService = nil then
    exit;
  s := aeService.getVehicleBestTimePolice(startCrossingId, endCrossingId,
    argumentTime, opera, isUsed, pageSize, pageNo);
  Result := GetResultString(s);
  (aeService as THTTPRIO).Free;
end;

class function THikHBase.groupSearch(param: TDictionary<string, String>;
  page, pageSize: Integer): string;
// �����ѯ����
var
  pService: police;
  arg: groupSearchRequest;
  fields: uPolice.Array_Of_mltClientFieldOption;
  field: uPolice.mltClientFieldOption;
  s, key: String;
  i: Integer;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;

  arg := groupSearchRequest.Create;
  arg.currentPage := page;
  arg.pageSize := pageSize;
  arg.beanId := 'pass';
  arg.sortColumn := 'passtime';
  arg.sortMethod := 'desc';
  for key in param.Keys do
  begin
    if key.ToUpper = 'Q' then
      arg.q := param[key]
    else if key.ToUpper = 'FQ' then
      arg.pfq := param[key]
    else if key.ToUpper = 'GROUPTYPE' then
      arg.groupType := param[key]
    else
    begin
      SetLength(fields, High(fields) + 1);
      field := uPolice.mltClientFieldOption.Create;
      field.filedName := key;
      field.keyWords := param[key];
      fields[High(fields)] := field;
    end;
  end;
  arg.fieldOptions := fields;

  s := pService.groupSearch(arg);
  Result := GetResultString(s);
  for i := Low(fields) to High(fields) do
    fields[i].Free;
  SetLength(fields, 0);
  arg.Free;
  (pService as THTTPRIO).Free;
end;

class function THikHBase.hiddenVehicleAnalysis(plateNo, startTime, endTime,
  crosses, vehicleColor, vehicleType, plateColor, plateType, beforeTime,
  afterTime: string; beforeVal, afterVal, pageSize, pageNo: Integer;
  taskId: string): string;
// ���䳵������
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.hiddenVehicleAnalysis(taskId, plateNo, startTime, endTime,
    crosses, vehicleColor, vehicleType, plateColor, plateType, beforeTime,
    afterTime, beforeVal, afterVal, pageSize, pageNo);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

class function THikHBase.fakePlateAnalysis(plateNo, startTime, endTime: string;
  pageSize, pageNo: Integer; taskId: string): string;
// ���Ƴ�����
var
  aeService: analysisExtra;
  s: String;
begin
  Result := '';
  aeService := GetanalysisExtra(True);
  if aeService = nil then
    exit;
  s := aeService.fakePlateAnalysis(taskId, plateNo, startTime, endTime,
    pageSize, pageNo);
  Result := GetResultString(s);
  (aeService as THTTPRIO).Free;
end;

class function THikHBase.falsePlateAnalysis(plateNo, startDate, endDate: string;
  threshold: Integer; checkResult, plateColor: string;
  resType, pageSize, pageNo: Integer): string;
// ���ڳ��ܿ�ļ����Ƴ�����
var
  aeService: analysisExtra;
  s: String;
begin
  Result := '';
  aeService := GetanalysisExtra(True);
  if aeService = nil then
    exit;
  s := aeService.falsePlateAnalysis(plateNo, startDate, endDate, threshold,
    checkResult, plateColor, resType, pageSize, pageNo);
  Result := GetResultString(s);
  (aeService as THTTPRIO).Free;
end;

class function THikHBase.forecastCrossFlow(crossSet, startTime, endTime: string)
  : responseInfo2;
// ����Ԥ��
var
  tfService: trafficForecastWS;
begin
  tfService := GettrafficForecastWS(True);
  if tfService = nil then
    exit;
  Result := tfService.forecastCrossFlow(crossSet, startTime, endTime);
  (tfService as THTTPRIO).Free;
end;

class function THikHBase.frequencyCrossAnalysis(crosses, startTime,
  endTime: string; freSet, threshold, pageSize, pageNo: Integer;
  taskId: String): string;
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

class function THikHBase.frequencyVehicleAnalysis(plateNos, startTime,
  endTime: string; freSet, threshold, pageSize, pageNo: Integer;
  taskId: string): string;
// Ƶ������-��������
var
  pService: police;
  s: String;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;
  s := pService.frequencyVehicleAnalysis(taskId, plateNos, startTime, endTime,
    freSet, threshold, pageSize, pageNo);
  Result := GetResultString(s);
  (pService as THTTPRIO).Free;
end;

class function THikHBase.moreLikeThisHBase(param: TDictionary<string, String>;
  page, pageSize: Integer): string;
// ������ѯ
var
  mlService: moreLikeThisHBaseWs;
  arg: uMoreLikeThisHBase.mltClientHRequest;
  fields: uMoreLikeThisHBase.Array_Of_mltClientFieldOption;
  field: uMoreLikeThisHBase.mltClientFieldOption;
  s, key: String;
  i: Integer;
begin
  Result := '';
  mlService := GetmoreLikeThisHBaseWs(True);
  if mlService = nil then
    exit;

  arg := uMoreLikeThisHBase.mltClientHRequest.Create;
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
      field := uMoreLikeThisHBase.mltClientFieldOption.Create;
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

class function THikHBase.mostActiveVehicleSummary(startTime, endTime: string;
  pageSize, pageNo: Integer; taskId: string): string;
// ���Ծ����ͳ��
var
  pService: police;
  s: String;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;
  s := pService.mostActiveVehicleSummary(taskId, startTime, endTime,
    pageSize, pageNo);
  Result := GetResultString(s);
  (pService as THTTPRIO).Free;
end;

class function THikHBase.newfakePlateAnalysis(plateNo, startDate,
  endDate: string; threshold: Integer; checkResult, plateColor: string;
  pageSize, pageNo: Integer): string;
// ������ʷ��¼�����Ƴ�����
var
  aeService: analysisExtra;
  s: String;
begin
  Result := '';
  aeService := GetanalysisExtra(True);
  if aeService = nil then
    exit;
  s := aeService.newfakePlateAnalysis(plateNo, startDate, endDate, threshold,
    checkResult, plateColor, pageSize, pageNo);
  Result := GetResultString(s);
  (aeService as THTTPRIO).Free;
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

class function THikHBase.nightVehicleAnalysis(crossIds, plateNos, startDate,
  endDate, startTime, endTime, vehicleTypes, vehicleLogos, vehicleSublogos,
  vehicleModels: string; freSet, threshold, pageSize, pageNo: Integer;
  taskId: string): string;
// ҹ��������
var
  pService: police;
  s: String;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;
  s := pService.nightVehicleAnalysis(taskId, crossIds, plateNos, startDate,
    endDate, startTime, endTime, vehicleTypes, vehicleLogos, vehicleSublogos,
    vehicleModels, freSet, threshold, pageSize, pageNo);
  Result := GetResultString(s);
  (pService as THTTPRIO).Free;
end;

class function THikHBase.policeDataAnalysis(startDate, endDate, more: string;
  pageSize, pageNo: Integer; taskId: String): string;
// ��������
var
  pService: police;
  s: String;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;
  s := pService.policeDataAnalysis(taskId, startDate, endDate, more,
    pageSize, pageNo);
  Result := GetResultString(s);
  (pService as THTTPRIO).Free;
end;

class function THikHBase.propertiesStatistics(taskId, sort, statisticsType,
  startTime, endTime: string; pageSize, pageNo: Integer): string;
// ���Էֲ�ͳ��
var
  dsService: dataStatistics;
  // Results: statisticsResults2;
begin
  // Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Result := dsService.propertiesStatistics(taskId, sort, statisticsType,
    startTime, endTime, pageSize, pageNo);
  // Result := Results.Results;
  // Results.Free;
  (dsService as THTTPRIO).Free;
end;

class function THikHBase.query(hphm, hpys: string): string;
// һ��һ��
var
  vpService: vehicleProfile;
  json: String;
begin
  Result := '';
  vpService := GetvehicleProfile(True);
  if vpService = nil then
    exit;
  json := '{"plateNo":"' + hphm + '","hpys":"' + hpys + '"}';
  Result := GetResultString(vpService.query(json));
  (vpService as THTTPRIO).Free;
end;

class function THikHBase.shortTimePassAnalysis(crossRef, crosses, startTime,
  endTime: string; threshold: Int64; pageSize, pageNo: Integer;
  taskId: string): string;
// ��ʱͨ����������
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.shortTimePassAnalysis(taskId, crossRef, crosses, startTime,
    endTime, threshold, pageSize, pageNo);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

class function THikHBase.specTimePassAnalysis(crosses, startTime,
  endTime: string; pageSize, pageNo: Integer; taskId: string): string;
// �ض�ʱ��γ�������
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.specTimePassAnalysis(taskId, crosses, startTime, endTime,
    pageSize, pageNo);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

class function THikHBase.trackDetectionAnalysis(plateNo, startTime, endTime,
  vehicleType, vehicleColor: string; pageSize, pageNo: Integer;
  taskId: string): string;
// �г��켣����
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.trackDetectionAnalysis(taskId, plateNo, startTime, endTime,
    vehicleType, vehicleColor, pageSize, pageNo);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

class function THikHBase.trackerAlikeAnalysis(plateNos, startTime,
  endTime: string; timeThreshold, crossThreshold, pageSize, pageNo: Integer;
  taskId: string): string;
// �೵ͬ������
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.trackerAlikeAnalysis(taskId, plateNos, startTime, endTime,
    timeThreshold, crossThreshold, pageSize, pageNo);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

class function THikHBase.trackerAssociateAnalysis(plateNo, crosses, startTime,
  endTime: string; timeInterval, threshold, pageSize, pageNo: Integer;
  taskId: String): string;
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

class function THikHBase.trackerIdentifyAnalysis(trackerArgs: string;
  frontThreshold, backThreshold, threshold, pageSize, pageNo: Integer;
  taskId: string): string;
// ������������
var
  pService: police;
  s: String;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;
  s := pService.trackerIdentifyAnalysis(taskId, trackerArgs, frontThreshold,
    backThreshold, threshold, pageSize, pageNo);
  Result := GetResultString(s);
  (pService as THTTPRIO).Free;
end;

class function THikHBase.trackerLawAnalysis(plateNos, startDate,
  endDate: string; plateColor: Integer; crossIds: string;
  pageSize, pageNo: Integer; taskId: string): string;
// �г����ɷ���
var
  pService: police;
  s: String;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;
  s := pService.trackerLawAnalysis(taskId, plateNos, startDate, endDate,
    plateColor, crossIds, pageSize, pageNo);
  Result := GetResultString(s);
  (pService as THTTPRIO).Free;
end;

class function THikHBase.vehicleAlarmProcessSummary(startTime, endTime,
  crossIds, plateType, vehicleColorDepth, vehicleType, plateColor, vehicleColor,
  laneNo, directionIndex: string): statisticsResultsNoTime2;
// ����Υ������ͳ��
var
  dsService: dataStatistics;
  // Results: statisticsResults2;
begin
  // Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Result := dsService.vehicleAlarmProcessSummary(startTime, endTime, crossIds,
    plateType, vehicleColorDepth, vehicleType, plateColor, vehicleColor, laneNo,
    directionIndex);
  // Result := Results.Results;
  // Results.Free;
  (dsService as THTTPRIO).Free;
end;

class function THikHBase.vehicleAlarmProcessSummaryByAction(startTime, endTime,
  crossIds, plateType, vehicleColorDepth, vehicleType, plateColor, vehicleColor,
  laneNo, directionIndex, violativeAction: string): statisticsResultsNoTime2;
// ��Υ����Ϊ����Υ������ͳ��
var
  dsService: dataStatistics;
  // Results: statisticsResults2;
begin
  // Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Result := dsService.vehicleAlarmProcessSummaryByAction(startTime, endTime,
    crossIds, plateType, vehicleColorDepth, vehicleType, plateColor,
    vehicleColor, laneNo, directionIndex, violativeAction);
  // Result := Results.Results;
  // Results.Free;
  (dsService as THTTPRIO).Free;
end;

class function THikHBase.vehicleAlarmSummary(crossIds, startTime, endTime,
  vehicleType: string; reportType: Integer): statisticsResultsNoTime2;
// ����Υ��ͳ��
var
  dsService: dataStatistics;
  // Results: statisticsResults2;
begin
  // Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Result := dsService.vehicleAlarmSummary(crossIds, startTime, endTime,
    vehicleType, reportType);
  // Result := Results.Results;
  // Results.Free;
  (dsService as THTTPRIO).Free;
end;

class function THikHBase.vehicleAlarmSummaryByAction(crossIds, startTime,
  endTime, violativeAction: string; reportType: Integer)
  : statisticsResultsNoTime2;
// ��Υ����Ϊ����Υ��ͳ��
var
  dsService: dataStatistics;
  // Results: statisticsResults2;
begin
  // Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Result := dsService.vehicleAlarmSummaryByAction(crossIds, startTime, endTime,
    violativeAction, reportType);
  // Result := Results.Results;
  // Results.Free;
  (dsService as THTTPRIO).Free;
end;

class function THikHBase.vehicleGroupStatistics(sort: string;
  statisticsType: Integer; startTime, endTime: string;
  pageSize, pageNo: Integer; taskId: string): string;
// ��������ͳ��
var
  pService: police;
  s: String;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;
  s := pService.vehicleGroupStatistics(taskId, sort, statisticsType, startTime,
    endTime, pageSize, pageNo);
  Result := GetResultString(s);
  (pService as THTTPRIO).Free;
end;

class function THikHBase.vehiclePassCompare(crossIds, directionIndex,
  vehicleBelong, vehicleType, setTime: string): statisticsResults2;
// �������Ա�
var
  dsService: dataStatistics;
  // Results: statisticsResults2;
begin
  // Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Result := dsService.vehiclePassCompare(crossIds, directionIndex,
    vehicleBelong, vehicleType, setTime);
  // Result := Results.Results;
  // Results.Free;
  (dsService as THTTPRIO).Free;
end;

class function THikHBase.vehiclePassSpecTimeSummary(crossIds, startTime,
  endTime, setTime, vehicleBelong, vehicleType, directionIndex: string)
  : statisticsResults2;
// �ض�ʱ��γ�����ͳ��
var
  dsService: dataStatistics;
  // Results: statisticsResults2;
begin
  // Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Result := dsService.vehiclePassSpecTimeSummary(crossIds, startTime, endTime,
    setTime, vehicleBelong, vehicleType, directionIndex);
  // Result := Results.Results;
  // Results.Free;
  (dsService as THTTPRIO).Free;
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

class function THikHBase.vehicleTrackSummary(crossIds, plateColor, plateType,
  timeLists, statisticsType, vehicleType, vehicleBelong, vehicleSpeed,
  vehicleLen, vehicleColorDepth, vehicleColor: string): statisticsResults2;
// �г��켣ͳ��
var
  dsService: dataStatistics;
  // Results: statisticsResults2;
begin
  // Result := '';
  dsService := GetdataStatistics(True);
  if dsService = nil then
    exit;

  Result := dsService.vehicleTrackSummary(crossIds, plateColor, plateType,
    timeLists, statisticsType, vehicleType, vehicleBelong, vehicleSpeed,
    vehicleLen, vehicleColorDepth, vehicleColor);
  // Result := Results.Results;
  // Results.Free;
  (dsService as THTTPRIO).Free;
end;

class function THikHBase.abnormalTrackAnalysis(plateNo, crosses, inStartTime,
  inEndTime, outStartTime, outEndTime: string;
  threshold, pageSize, pageNo: Integer; taskId: string): string;
// �����������У����쳣�г����У�
var
  daService: dataAnalysis;
  s: String;
begin
  Result := '';
  daService := GetdataAnalysis(True);
  if daService = nil then
    exit;
  s := daService.abnormalTrackAnalysis(taskId, plateNo, crosses, inStartTime,
    inEndTime, outStartTime, outEndTime, threshold, pageSize, pageNo);
  Result := GetResultString(s);
  (daService as THTTPRIO).Free;
end;

class function THikHBase.checkFakePlate(plateNo, fakeids, checkResult,
  reason: string): string;
// ������ʷ��¼�����Ƴ����
var
  aeService: analysisExtra;
  s: String;
begin
  Result := '';
  aeService := GetanalysisExtra(True);
  if aeService = nil then
    exit;
  s := aeService.checkFakePlate(plateNo, fakeids, checkResult, reason);
  Result := GetResultString(s);
  (aeService as THTTPRIO).Free;
end;

class function THikHBase.checkFalsePlate(falseids, checkResult,
  reason: string): string;
// ���ڳ��ܿ�ļ����Ƴ����
var
  aeService: analysisExtra;
  s: String;
begin
  Result := '';
  aeService := GetanalysisExtra(True);
  if aeService = nil then
    exit;
  s := aeService.checkFalsePlate(falseids, checkResult, reason);
  Result := GetResultString(s);
  (aeService as THTTPRIO).Free;
end;

class function THikHBase.consecutiveFoulsAnalysis(plateNos, startTime,
  endTime: string; freSet, threshold, pageSize, pageNo: Integer;
  taskId: string): string;
// ����Υ��-��������
var
  pService: police;
  s: String;
begin
  Result := '';
  pService := Getpolice(True);
  if pService = nil then
    exit;
  s := pService.consecutiveFoulsAnalysis(taskId, plateNos, startTime, endTime,
    freSet, threshold, pageSize, pageNo);
  Result := GetResultString(s);
  (pService as THTTPRIO).Free;
end;

class function THikHBase.crossAggregationAnalysis(districts: string;
  threshold, pageSize, pageNo, plateColor: Integer; taskId: String): string;
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
