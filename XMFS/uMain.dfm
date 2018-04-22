object ItsXmfsService: TItsXmfsService
  OldCreateOrder = False
  DisplayName = 'Its XMFS Service'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
  object IdHTTPServerIn: TIdHTTPServer
    Bindings = <>
    OnCommandGet = IdHTTPServerInCommandGet
    Left = 40
    Top = 16
  end
  object IdHTTPServerOut: TIdHTTPServer
    Bindings = <>
    OnCommandGet = IdHTTPServerOutCommandGet
    Left = 144
    Top = 64
  end
end
