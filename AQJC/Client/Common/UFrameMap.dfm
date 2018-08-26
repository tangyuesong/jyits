inherited FrameMap: TFrameMap
  Width = 800
  Height = 600
  ExplicitWidth = 800
  ExplicitHeight = 600
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 800
    Height = 600
    ExplicitWidth = 800
    ExplicitHeight = 600
    inherited btnSave: TcxButton
      Left = 318
      Top = 547
      TabOrder = 3
      ExplicitLeft = 318
      ExplicitTop = 547
    end
    inherited btnExit: TcxButton
      Left = 406
      Top = 547
      TabOrder = 4
      ExplicitLeft = 406
      ExplicitTop = 547
    end
    object Chromium1: TChromium [2]
      Left = 28
      Top = 36
      Width = 744
      Height = 491
      TabOrder = 0
      OnLoadEnd = Chromium1LoadEnd
      Options.AcceleratedPaintingDisabled = False
      Options.AcceleratedFiltersDisabled = False
      Options.AcceleratedPluginsDisabled = False
    end
    object edtLng: TcxTextEdit [3]
      Left = 28
      Top = 547
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object edtLat: TcxTextEdit [4]
      Left = 156
      Top = 547
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 121
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = #25342#21462#32463#32428#24230
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = Chromium1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 599
      ControlOptions.OriginalWidth = 800
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = edtLng
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahLeft
      Control = edtLat
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 208
    Top = 136
  end
end
