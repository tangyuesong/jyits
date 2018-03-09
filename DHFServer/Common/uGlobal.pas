unit uGlobal;

interface

uses
  Generics.Collections, uSQLHelper, uLogger, uTypes, uBaseThread;

var
  sqlhelper: TSqlHelper;
  borderDBHelper: TSqlHelper;

  gDicDevice: TDictionary<string, TDevice>;
  gDicHBC: TDictionary<string, boolean>;
  gDicAlarm: TDictionary<string, boolean>;
  gDicAlarmJTP: TDictionary<string, string>;
  gOpenedDevice: TDictionary<string, boolean>;

  gOldDevice: TDictionary<string, TDevice>;
  gOldHBC: TDictionary<string, boolean>;
  gOldAlarm: TDictionary<string, boolean>;
  gOldAlarmJTP: TDictionary<string, string>;
  gOldOpenedDevice: TDictionary<string, boolean>;

  gUnknowDevice: TDictionary<string, boolean>;
  gDicHPZL: TDictionary<string, string>;
  gVehDic: TDictionary<string, boolean>;
  solrFtp, hdpFtp: TFtpConfig;
  logger: TLogger;
  FZJG: string;      // ��֤���������غ��ƺ���ǰ׺�������ڼ����Ƽ���
  DFSHost: string;   // �ֿ��ַ ���˿�
  SMSUrl: string = 'http://10.46.137.83:8081/SMS/Send?token=%s&mobiles=%s&content=%s';    // ���ŵ�ַ
  gHeartbeatUrl: string;
  kk, dj, idchina, hik: boolean;
  DCXXZP: string;
  reload: boolean;


implementation

end.
