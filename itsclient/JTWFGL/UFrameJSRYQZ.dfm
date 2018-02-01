inherited FrameJSRYQZ: TFrameJSRYQZ
  Width = 885
  Height = 475
  ExplicitWidth = 885
  ExplicitHeight = 475
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 885
    Height = 475
    CustomizeFormTabbedView = True
    ExplicitWidth = 885
    ExplicitHeight = 475
    object Img2: TImageEnView [0]
      Left = 29
      Top = 65
      Width = 408
      Height = 300
      Background = clWhite
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      AutoStretch = True
      AutoShrink = True
      WallPaperStyle = iewoStretch
      OnDShowNewFrame = Img2DShowNewFrame
      EnableInteractionHints = True
      TabOrder = 4
    end
    object img1: TImageEnView [1]
      Left = 446
      Top = 65
      Width = 410
      Height = 300
      Background = clWhite
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      AutoStretch = True
      AutoShrink = True
      WallPaperStyle = iewoStretch
      OnDShowNewFrame = img1DShowNewFrame
      EnableInteractionHints = True
      TabOrder = 5
    end
    object edtSFZHM: TcxTextEdit [2]
      Left = 94
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 179
    end
    object edtXB: TcxTextEdit [3]
      Left = 474
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 39
    end
    object edtXM: TcxTextEdit [4]
      Left = 310
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 127
    end
    object edtSFZHM18: TcxTextEdit [5]
      Left = 94
      Top = 386
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      OnKeyPress = edtSFZHM18KeyPress
      Height = 21
      Width = 179
    end
    object chkprint: TcxCheckBox [6]
      Left = 280
      Top = 386
      Caption = #26159#21542#25171#21360
      State = cbsChecked
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 7
      Transparent = True
    end
    inherited btnSave: TcxButton
      Left = 357
      Top = 386
      TabOrder = 8
      OnClick = btnSaveClick
      ExplicitLeft = 357
      ExplicitTop = 386
    end
    object btnsearch: TcxButton [8]
      Left = 527
      Top = 386
      Width = 75
      Height = 25
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 10
      OnClick = btnsearchClick
    end
    object edtLXDZ: TcxTextEdit [9]
      Left = 574
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 282
    end
    inherited btnExit: TcxButton
      Left = 445
      Top = 386
      ParentShowHint = False
      TabOrder = 9
      ExplicitLeft = 445
      ExplicitTop = 386
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = #39550#39542#21592#20449#24687#21464#26356#30331#35760
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup7
      CaptionOptions.Visible = False
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Index = 2
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      AlignHorz = ahLeft
      CaptionOptions.Visible = False
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignVert = avClient
      Index = 0
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      Control = Img2
      ControlOptions.OriginalHeight = 300
      ControlOptions.OriginalWidth = 399
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      Control = img1
      ControlOptions.OriginalHeight = 300
      ControlOptions.OriginalWidth = 400
      Index = 1
    end
    object dxLayoutGroup10: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup12: TdxLayoutGroup
      Parent = dxLayoutGroup10
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup12
      CaptionOptions.Text = #36523#20221#35777#21495#30721
      Control = edtSFZHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 179
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignVert = avClient
      CaptionOptions.Text = #24615#21035
      Control = edtXB
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 39
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignVert = avClient
      CaptionOptions.Text = #22995#21517
      Control = edtXM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 127
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36523#20221#35777#21495#30721
      Control = edtSFZHM18
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 179
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem36: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = chkprint
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 70
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutItem35: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Visible = False
      Control = btnsearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem32: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignVert = avClient
      CaptionOptions.Text = #32852#31995#22320#22336
      Control = edtLXDZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 282
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 525
    Top = 304
  end
end
