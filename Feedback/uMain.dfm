object ItsFeedbackService: TItsFeedbackService
  OldCreateOrder = False
  DisplayName = 'ITS Feedback Service'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
  object fdphysrcldrvrlnk1: TFDPhysOracleDriverLink
    Left = 23
    Top = 14
  end
  object IdHTTP1: TIdHTTP
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
    Left = 80
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 128
    Top = 16
  end
end
