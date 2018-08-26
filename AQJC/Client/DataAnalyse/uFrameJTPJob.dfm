inherited FrameJTPJob: TFrameJTPJob
  Width = 743
  Height = 542
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 743
    Height = 542
    object ImageEnVect1: TImageEnVect [0]
      Left = 46
      Top = -60
      Width = 445
      Height = 588
      Background = clWhite
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      ZoomFilter = rfFastLinear
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 1
      OnMouseDown = ImageEnVect1MouseDown
      OnMouseMove = ImageEnVect1MouseMove
      OnMouseUp = ImageEnVect1MouseUp
    end
    object ImageEnView1: TImageEnView [1]
      Left = 500
      Top = -60
      Width = 212
      Height = 150
      Background = clWhite
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      ScrollBars = ssNone
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 2
    end
    object rbFD: TcxRadioButton [2]
      Left = 499
      Top = 98
      Width = 73
      Height = 17
      Caption = #25918#22823#22270#29255
      Checked = True
      TabOrder = 3
      TabStop = True
      Transparent = True
    end
    object rbXQ: TcxRadioButton [3]
      Left = 579
      Top = 98
      Width = 73
      Height = 17
      Caption = #36873#21462#29305#24449
      TabOrder = 4
      Transparent = True
    end
    object btnBack: TcxButton [4]
      Left = 13
      Top = -61
      Width = 25
      Height = 25
      OptionsImage.ImageIndex = 53
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      OnClick = btnBackClick
    end
    object edthphm: TcxTextEdit [5]
      Left = 553
      Top = 135
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 160
    end
    object edtHpzl: TcxTextEdit [6]
      Left = 553
      Top = 163
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 160
    end
    object edtSjhm: TcxTextEdit [7]
      Left = 553
      Top = 463
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 160
    end
    object edtclpp1: TcxTextEdit [8]
      Left = 568
      Top = 242
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 130
    end
    object edtCsys1: TcxTextEdit [9]
      Left = 568
      Top = 270
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 130
    end
    object edtCllx1: TcxTextEdit [10]
      Left = 568
      Top = 298
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 130
    end
    object edtClpp2: TcxTextEdit [11]
      Left = 568
      Top = 364
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 130
    end
    object edtCsys2: TcxTextEdit [12]
      Left = 568
      Top = 392
      AutoSize = False
      ParentFont = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      Style.TextColor = clWindowText
      TabOrder = 12
      Height = 21
      Width = 130
    end
    object edtCllx2: TcxTextEdit [13]
      Left = 568
      Top = 420
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 130
    end
    object edtBklx: TcxTextEdit [14]
      Left = 553
      Top = 191
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 160
    end
    object btnCreateJob: TcxButton [15]
      Left = 638
      Top = 504
      Width = 75
      Height = 25
      Caption = #21019#24314#20219#21153
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 16
    end
    object btnDelete: TcxButton [16]
      Left = 556
      Top = 504
      Width = 75
      Height = 25
      Caption = #21024#38500
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 15
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      Control = ImageEnVect1
      ControlOptions.OriginalHeight = 377
      ControlOptions.OriginalWidth = 611
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      Control = ImageEnView1
      ControlOptions.OriginalHeight = 150
      ControlOptions.OriginalWidth = 155
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = rbFD
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = rbXQ
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnBack
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Separator'
      Index = 9
    end
    object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Separator'
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 79
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = edtHpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 77
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #22270#29255#36710#36742#20449#24687
      ButtonOptions.Buttons = <>
      Index = 6
    end
    object dlRealVeh: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #30495#23454#36710#36742#20449#24687
      ButtonOptions.Buttons = <>
      Index = 7
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #25163#26426
      Control = edtSjhm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 89
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36710#36742#21697#29260
      Control = edtclpp1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 93
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36710#36523#39068#33394
      Control = edtCsys1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 39
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36710#36742#31867#22411
      Control = edtCllx1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 106
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dlRealVeh
      CaptionOptions.Text = #36710#36742#21697#29260
      Control = edtClpp2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 93
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dlRealVeh
      CaptionOptions.Text = #36710#36523#39068#33394
      Control = edtCsys2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 39
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dlRealVeh
      CaptionOptions.Text = #36710#36742#31867#22411
      Control = edtCllx2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 130
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #24067#25511#31867#22411
      Control = edtBklx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 94
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 10
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnDelete
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnCreateJob
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
