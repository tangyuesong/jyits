unit uGlobal;

interface

uses
  uLogger, uSQLHelper, System.Generics.Collections, Classes;

type
  TConfig = Record
    DBServer: String;
    DBPort: Integer;
    DBUser: String;
    DBPwd: String;
    DBName: String;
    DBNamePass: string;
    QTZDB: String;
    QTZRM: String;
  end;

  THikConfig = Record
    K08SearchURL: String;
    K08SaveUrl: String;
    DFUrl: String;
    DFUser: String;
    DFPwd: String;
  End;

  TVehInfo = Record
    HPHM: string;
    HPZL: string;
    CLPP: string;
    CSYS: string;
  End;

var
  gSQLHelper: TSQLHelper;
  gLogger: TLogger;
  gConfig, gJQOraConfig: TConfig;
  gHikConfig: THikConfig;
  gUploadVio: Boolean; // �Զ��ϴ�Υ��
  gJZF: Boolean; // ��ս��
  gKKALARM: Boolean; // ���Ƴ�����ʶ��
  gJQ: Boolean; // ����
  gHBC: Boolean; // �Ʊ공
  gWNJ: Boolean; // δ���
  gZBDX: Boolean; // ֵ�����
  gZBDXTime: String;
  gJTP: Boolean; // ������
  gJinXing: Boolean; // ����
  JTPRunning: Boolean;
  gUploadTempVio: Boolean;
  // gHpzlList: TDictionary<string, String>;
  gK08Hpzl: TDictionary<String, String>;
  gK08Clpp: TDictionary<String, String>;
  gK08Csys: TDictionary<String, String>;
  // gDevKDBH: TDictionary<String, String>;
  // gDevID: TDictionary<String, String>;
  gVehInfoDic: TDictionary<string, TVehInfo>;
  gHeartbeatUrl: String;
  gHeartbeatInterval: Integer;
  gAppIP: String;
  gToken: String;
  // gDeviceMonitorSJHM: string;
  gDeviceMonitorSJHM: TDictionary<String, String>;

implementation

end.
