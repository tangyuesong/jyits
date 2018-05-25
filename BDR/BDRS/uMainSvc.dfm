object BDRSSvc: TBDRSSvc
  OldCreateOrder = False
  AllowPause = False
  DisplayName = 'ITS BDRS'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 166
  Width = 215
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 64
    Top = 112
  end
  object FDConnection1: TFDConnection
    Left = 88
    Top = 64
  end
end
