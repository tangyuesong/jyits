object BDRCSvc: TBDRCSvc
  OldCreateOrder = False
  DisplayName = 'ITS BDRC'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 203
  Width = 280
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    OnCreatePostStream = IdHTTPServer1CreatePostStream
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 64
    Top = 38
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 64
    Top = 112
  end
end
