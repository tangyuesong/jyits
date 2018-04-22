object ItsXMFService: TItsXMFService
  OldCreateOrder = False
  DisplayName = 'ITS XMF Service'
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 88
    Top = 56
  end
end
