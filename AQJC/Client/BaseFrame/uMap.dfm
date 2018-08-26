object FrameMap: TFrameMap
  Left = 0
  Top = 0
  Width = 425
  Height = 344
  TabOrder = 0
  object Chromium1: TChromium
    Left = 0
    Top = 0
    Width = 425
    Height = 344
    Align = alClient
    TabOrder = 0
    Options.AcceleratedPaintingDisabled = False
    Options.AcceleratedFiltersDisabled = False
    Options.AcceleratedPluginsDisabled = False
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 200
    Top = 160
  end
end
