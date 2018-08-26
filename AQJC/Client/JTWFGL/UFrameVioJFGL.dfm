inherited FrameVioJFGL: TFrameVioJFGL
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
      Top = 93
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
      TabOrder = 11
    end
    object img1: TImageEnView [1]
      Left = 446
      Top = 93
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
      TabOrder = 12
    end
    object edtdsr: TcxTextEdit [2]
      Left = 94
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 112
    end
    object edtwfsj: TcxTextEdit [3]
      Left = 94
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 112
    end
    object edtwfdz: TcxTextEdit [4]
      Left = 267
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 177
    end
    object edthphm: TcxTextEdit [5]
      Left = 505
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 66
    end
    object edthpzl: TcxTextEdit [6]
      Left = 578
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 78
    end
    object edtwfxw: TcxTextEdit [7]
      Left = 505
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 151
    end
    object edtfkje: TcxTextEdit [8]
      Left = 717
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 46
    end
    object edtwfjfs: TcxTextEdit [9]
      Left = 812
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 39
    end
    object edtjdcsyr: TcxTextEdit [10]
      Left = 717
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 134
    end
    object edtjszh: TcxTextEdit [11]
      Left = 317
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 127
    end
    object edtzjcx: TcxTextEdit [12]
      Left = 267
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 43
    end
    object edtjdsbh6: TcxTextEdit [13]
      Left = 94
      Top = 414
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 73
    end
    object edtjdsbh9: TcxTextEdit [14]
      Left = 174
      Top = 414
      AutoSize = False
      Properties.OnChange = edtjdsbh9PropertiesChange
      Style.HotTrack = False
      TabOrder = 14
      OnKeyPress = edtjdsbh9KeyPress
      Height = 21
      Width = 120
    end
    object chkprint: TcxCheckBox [15]
      Left = 301
      Top = 414
      Caption = #26159#21542#25171#21360
      State = cbsChecked
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 15
      Transparent = True
    end
    inherited btnSave: TcxButton
      Left = 378
      Top = 414
      TabOrder = 16
      OnClick = btnSaveClick
      ExplicitLeft = 378
      ExplicitTop = 414
    end
    inherited btnExit: TcxButton
      Left = 466
      Top = 414
      ParentShowHint = False
      TabOrder = 17
      ExplicitLeft = 466
      ExplicitTop = 414
    end
    object btnsearch: TcxButton [18]
      Left = 548
      Top = 414
      Width = 75
      Height = 25
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 18
      OnClick = btnsearchClick
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = #35760#20998#31649#29702
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup7
      CaptionOptions.Visible = False
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Index = 3
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      AlignHorz = ahLeft
      CaptionOptions.Visible = False
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Index = 4
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
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = dxLayoutGroup10
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup12
      CaptionOptions.Text = #24403#20107#20154
      Control = edtdsr
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 112
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #36829#27861#26102#38388
      Control = edtwfsj
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 112
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #36829#27861#22320#22336
      Control = edtwfdz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 177
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup12
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 66
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignHorz = ahLeft
      AlignVert = avClient
      Control = edthpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 78
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignVert = avClient
      CaptionOptions.Text = #36829#27861#34892#20026
      Control = edtwfxw
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 151
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem32: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignVert = avClient
      CaptionOptions.Text = #32602#27454#37329#39069
      Control = edtfkje
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 46
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #35760#20998#25968
      Control = edtwfjfs
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 39
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignVert = avClient
      CaptionOptions.Text = #25152#26377#20154
      Control = edtjdcsyr
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 134
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignVert = avClient
      CaptionOptions.Text = #39550#39542#35777#32534#21495
      CaptionOptions.Visible = False
      Control = edtjszh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 127
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup12
      AlignVert = avClient
      CaptionOptions.Text = #39550#39542#35777
      Control = edtzjcx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 43
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #20915#23450#20070#32534#21495
      Control = edtjdsbh6
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem27: TdxLayoutItem
      Parent = dxLayoutGroup4
      Control = edtjdsbh9
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem36: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = chkprint
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 70
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 5
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
      Index = 0
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
