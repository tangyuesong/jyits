inherited FrameJFVideo: TFrameJFVideo
  Width = 880
  Height = 520
  ExplicitWidth = 880
  ExplicitHeight = 520
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 880
    Height = 520
    ExplicitWidth = 880
    ExplicitHeight = 520
    object cbbidx1: TcxComboBox [0]
      Left = 64
      Top = 58
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object edtinput1: TcxTextEdit [1]
      Left = 192
      Top = 58
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 37
    end
    object cbbWBL1: TcxComboBox [2]
      Left = 236
      Top = 58
      AutoSize = False
      Properties.OnChange = cbbWBL1PropertiesChange
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 149
    end
    object cbbidx2: TcxComboBox [3]
      Left = 429
      Top = 58
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 121
    end
    object edtinput2: TcxTextEdit [4]
      Left = 557
      Top = 58
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 36
    end
    object cbbWBL2: TcxComboBox [5]
      Left = 600
      Top = 58
      AutoSize = False
      Properties.OnChange = cbbWBL2PropertiesChange
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 153
    end
    inherited btnSave: TcxButton
      Left = 358
      Top = 471
      TabOrder = 8
      ExplicitLeft = 358
      ExplicitTop = 471
    end
    inherited btnExit: TcxButton
      Left = 446
      Top = 471
      TabOrder = 9
      ExplicitLeft = 446
      ExplicitTop = 471
    end
    object imgshow1: TImageEnView [8]
      Left = 28
      Top = 109
      Width = 399
      Height = 316
      Background = clInfoBk
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      AutoStretch = True
      AutoShrink = True
      WallPaperStyle = iewoStretch
      EnableInteractionHints = True
      TabOrder = 6
    end
    object imgshow2: TImageEnView [9]
      Left = 436
      Top = 109
      Width = 416
      Height = 316
      Background = clInfoBk
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      AutoStretch = True
      AutoShrink = True
      WallPaperStyle = iewoStretch
      EnableInteractionHints = True
      TabOrder = 7
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahRight
      CaptionOptions.Text = #35270#39057#37197#32622
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #35270#39057'1'
      Control = cbbidx1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avClient
      Control = edtinput1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 37
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avClient
      Control = cbbWBL1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 149
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #35270#39057'2'
      Control = cbbidx2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avClient
      Control = edtinput2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 36
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignVert = avClient
      Control = cbbWBL2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 153
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup7
      Control = imgshow1
      ControlOptions.OriginalHeight = 316
      ControlOptions.OriginalWidth = 399
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup8
      Control = imgshow2
      ControlOptions.OriginalHeight = 316
      ControlOptions.OriginalWidth = 416
      Index = 0
    end
  end
  object tmr1: TTimer
    Interval = 5000
    OnTimer = tmr1Timer
    Left = 356
    Top = 181
  end
end
