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
  gUploadVio: Boolean; // 自动上传违法
  gJZF: Boolean; // 技战法
  gKKALARM: Boolean; // 套牌车二次识别
  gJQ: Boolean; // 警情
  gHBC: Boolean; // 黄标车
  gWNJ: Boolean; // 未年检
  gZBDX: Boolean; // 值班短信
  gZBDXTime: String;
  gJTP: Boolean; // 假套牌
  gJinXing: Boolean; // 禁行
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
