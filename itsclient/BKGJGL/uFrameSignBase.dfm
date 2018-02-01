object FrameSignBase: TFrameSignBase
  Left = 0
  Top = 0
  Width = 822
  Height = 591
  TabOrder = 0
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 822
    Height = 591
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DM.dxLayoutSkinLookAndFeel1
    CustomizeFormTabbedView = True
    object ImageEnVect1: TImageEnVect
      Left = 11
      Top = 11
      Width = 451
      Height = 594
      Background = clWhite
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      ZoomFilter = rfFastLinear
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 0
      OnMouseMove = imgviopicMouseMove
    end
    object ImageEnView1: TImageEnView
      Left = 477
      Top = 11
      Width = 317
      Height = 200
      Background = clWhite
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      EnableInteractionHints = True
      TabOrder = 1
    end
    object edtHPHM: TcxTextEdit
      Left = 529
      Top = 272
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 100
    end
    object edtHPZL: TcxTextEdit
      Left = 695
      Top = 272
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 100
    end
    object edtCLPP: TcxTextEdit
      Left = 529
      Top = 299
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 100
    end
    object edtCLXH: TcxTextEdit
      Left = 695
      Top = 299
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 100
    end
    object edtCSYS: TcxTextEdit
      Left = 529
      Top = 326
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 100
    end
    object edtSYXZ: TcxTextEdit
      Left = 695
      Top = 326
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 12
      Height = 21
      Width = 100
    end
    object edtBFQX: TcxTextEdit
      Left = 695
      Top = 380
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 100
    end
    object edtCLSBDH: TcxTextEdit
      Left = 529
      Top = 407
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 100
    end
    object edtSYR: TcxTextEdit
      Left = 529
      Top = 353
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 100
    end
    object edtCCDJRQ: TcxTextEdit
      Left = 695
      Top = 353
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 100
    end
    object edtYXQX: TcxTextEdit
      Left = 529
      Top = 380
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 100
    end
    object edtFDJH: TcxTextEdit
      Left = 695
      Top = 407
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 15
      Height = 21
      Width = 100
    end
    object edtCZDW: TcxComboBox
      Left = 529
      Top = 500
      AutoSize = False
      Properties.OnChange = edtCZDWPropertiesChange
      Style.HotTrack = False
      TabOrder = 19
      Height = 21
      Width = 266
    end
    object btnSign: TcxButton
      Left = 557
      Top = 581
      Width = 75
      Height = 25
      Caption = #31614#25910
      TabOrder = 22
      OnClick = btnSignClick
    end
    object btnBack: TcxButton
      Left = 638
      Top = 581
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 23
      OnClick = btnBackClick
    end
    object edtCZMJ: TcxComboBox
      Left = 529
      Top = 527
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 20
      Height = 21
      Width = 266
    end
    object edtCZSJ: TcxTextEdit
      Left = 529
      Top = 554
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 21
      Height = 21
      Width = 266
    end
    object edtBKLX: TcxTextEdit
      Left = 529
      Top = 446
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 16
      Height = 21
      Width = 266
    end
    object cboQSJG: TcxComboBox
      Left = 529
      Top = 473
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '1 '#26377#25928
        '0 '#26080#25928)
      Properties.OnChange = cboQSJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 17
      Height = 21
      Width = 100
    end
    object cboSFLJ: TcxComboBox
      Left = 695
      Top = 473
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '0 '#21542
        '1 '#26159)
      Style.HotTrack = False
      TabOrder = 18
      Height = 21
      Width = 100
    end
    object edtGCSJ: TcxTextEdit
      Left = 529
      Top = 245
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 266
    end
    object edtSBDDMC: TcxTextEdit
      Left = 529
      Top = 218
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 266
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object lgCenter: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgRight: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = lgCenter
      AlignHorz = ahClient
      AlignVert = avClient
      Control = ImageEnVect1
      ControlOptions.OriginalHeight = 767
      ControlOptions.OriginalWidth = 678
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = lgRight
      Control = ImageEnView1
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 200
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = lgRight
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = edtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = edtHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      CaptionOptions.Text = #36710#36742#21697#29260
      Control = edtCLPP
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #36710#36742#22411#21495
      Control = edtCLXH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      CaptionOptions.Text = #36710#36523#39068#33394
      Control = edtCSYS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #20351#29992#24615#36136
      Control = edtSYXZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #25253#24223#26399#38480
      Control = edtBFQX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      CaptionOptions.Text = #36710#26550#21495#30721
      Control = edtCLSBDH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      CaptionOptions.Text = #25152#26377#20154
      Control = edtSYR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #30331#35760#26085#26399
      Control = edtCCDJRQ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      CaptionOptions.Text = #26377#25928#26399#38480
      Control = edtYXQX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #21457#21160#26426#21495
      Control = edtFDJH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutSplitterItem3: TdxLayoutSplitterItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = lgRight
      AlignHorz = ahClient
      CaptionOptions.Text = #31614#25910#37096#38376
      Control = edtCZDW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 266
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSign
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = lgRight
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 10
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup6
      AlignHorz = ahCenter
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = btnBack
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = lgRight
      AlignHorz = ahClient
      CaptionOptions.Text = #31614#25910#20154#21592
      Control = edtCZMJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = lgRight
      AlignHorz = ahClient
      CaptionOptions.Text = #31614#25910#26102#38388
      Control = edtCZSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = lgRight
      AlignHorz = ahClient
      CaptionOptions.Text = #24067#25511#31867#22411
      Control = edtBKLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = #31614#25910#32467#26524
      Control = cboQSJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #26159#21542#20986#35686
      Control = cboSFLJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = lgRight
      LayoutDirection = ldHorizontal
      Index = 6
      AutoCreated = True
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = lgRight
      AlignHorz = ahClient
      CaptionOptions.Text = #36807#36710#26102#38388
      Control = edtGCSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = lgRight
      AlignHorz = ahClient
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = edtSBDDMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = lgRight
      CaptionOptions.Text = 'Separator'
      Index = 4
    end
    object dxLayoutSplitterItem1: TdxLayoutSplitterItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
    object dxLayoutSplitterItem2: TdxLayoutSplitterItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
  end
end
