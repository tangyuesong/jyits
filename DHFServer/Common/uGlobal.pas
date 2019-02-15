unit uGlobal;

interface

uses
  Generics.Collections, uSQLHelper, uLogger, uTypes, uBaseThread;

type
  TAlarm = record
    HPHM: string;
    HPZL: string;
    SJHM: string;
    JYBH: string;
    BKLX: string;
    BKZL: string;
    WFCS: string;
    smsBeginTime: string;
    smsEndTime: string;
    CLPP: string;
    CSYS: string;
    KDBH: string;
    BZ: string;
  end;

var
  sqlhelper: TSqlHelper;
  borderDBHelper: TSqlHelper;

  gDicDevice: TDictionary<string, TDevice>;
  gDicHBC: TDictionary<string, boolean>;
  gDicAlarm: TDictionary<string, TAlarm>;
  gDicAlarmJTP: TDictionary<string, TAlarm>;
  gListAlarmSDCL: TList<TAlarm>;
  gOpenedDevice: TDictionary<string, boolean>;

  gOldDevice: TDictionary<string, TDevice>;
  gOldHBC: TDictionary<string, boolean>;
  gOldAlarm: TDictionary<string, TAlarm>;
  gOldAlarmJTP: TDictionary<string, TAlarm>;
  gOldAlarmSDCL: TList<TAlarm>;
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
  gDLMUrl: string;
  gAsynchronous: boolean;
  gPicturePathMap: TDictionary<string, TKKPictureConfig>;
  PhpUrl: String; //Ԥ����Ϣ���͵�php

implementation

end.
