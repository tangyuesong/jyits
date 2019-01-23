object ItsQTZ3Service: TItsQTZ3Service
  OldCreateOrder = False
  OnCreate = ServiceCreate
  DisplayName = 'ITS QTZ3 Service'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 323
  Width = 402
  object httpServer: TIdHTTPServer
    Bindings = <>
    OnCreatePostStream = httpServerCreatePostStream
    OnCommandGet = httpServerCommandGet
    Left = 144
    Top = 48
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 80
    Top = 48
  end
  object httpClient: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 200
    Top = 48
  end
  object FDPhysOracleDriverLink1: TFDPhysOracleDriverLink
    Left = 184
    Top = 144
  end
  object Timer2: TTimer
    Interval = 3600000
    OnTimer = Timer2Timer
    Left = 64
    Top = 168
  end
end
