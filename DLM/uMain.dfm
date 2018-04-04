object svcDLM: TsvcDLM
  OldCreateOrder = False
  DisplayName = 'itsDLM'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 88
    Top = 56
  end
end
