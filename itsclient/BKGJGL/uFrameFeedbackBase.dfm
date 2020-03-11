object FrameFeedbackBase: TFrameFeedbackBase
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
      Width = 407
      Height = 656
      Background = clWhite
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      ZoomFilter = rfFastLinear
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 0
    end
    object edtHPHM: TcxTextEdit
      Left = 509
      Top = 37
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 100
    end
    object edtHPZL: TcxTextEdit
      Left = 675
      Top = 37
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 120
    end
    object edtCLPP: TcxTextEdit
      Left = 509
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 100
    end
    object edtCLXH: TcxTextEdit
      Left = 675
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 120
    end
    object edtCSYS: TcxTextEdit
      Left = 509
      Top = 91
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 100
    end
    object edtSYXZ: TcxTextEdit
      Left = 675
      Top = 91
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 120
    end
    object edtBFQX: TcxTextEdit
      Left = 675
      Top = 199
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 15
      Height = 21
      Width = 120
    end
    object edtCLSBDH: TcxTextEdit
      Left = 509
      Top = 145
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 100
    end
    object edtSYR: TcxTextEdit
      Left = 509
      Top = 118
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 100
    end
    object edtCZDW: TcxComboBox
      Left = 509
      Top = 562
      AutoSize = False
      Properties.OnChange = edtCZDWPropertiesChange
      Style.HotTrack = False
      TabOrder = 28
      Height = 21
      Width = 286
    end
    object btnFeedback: TcxButton
      Left = 535
      Top = 643
      Width = 75
      Height = 25
      Caption = #21453#39304
      TabOrder = 31
      OnClick = btnFeedbackClick
    end
    object btnBack: TcxButton
      Left = 616
      Top = 643
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 32
      OnClick = btnBackClick
    end
    object edtCZMJ: TcxComboBox
      Left = 509
      Top = 589
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 29
      Height = 21
      Width = 286
    end
    object edtCZSJ: TcxTextEdit
      Left = 509
      Top = 616
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 30
      Height = 21
      Width = 286
    end
    object edtSBDDMC: TcxTextEdit
      Left = 509
      Top = 10
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 286
    end
    object edtYJBM: TcxTextEdit
      Left = 509
      Top = 481
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 25
      Height = 21
      Width = 286
    end
    object edtWSBH: TcxTextEdit
      Left = 509
      Top = 427
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 23
      OnExit = edtWSBHExit
      Height = 21
      Width = 286
    end
    object cboLJYY: TcxComboBox
      Left = 509
      Top = 292
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '01 '#26410#21457#29616#36710#36742
        '02 '#36710#36742#26410#20572#25110#24378#34892#38383#21345
        '03 '#36710#36742#25481#22836#25110#32469#34892
        '09 '#20854#20182)
      Style.HotTrack = False
      TabOrder = 18
      Height = 21
      Width = 286
    end
    object cboXYC: TcxComboBox
      Left = 509
      Top = 319
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '0 '#21542
        '1 '#26159)
      Properties.OnChange = cboLJJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 19
      Height = 21
      Width = 286
    end
    object cboCZJG: TcxCheckComboBox
      Left = 509
      Top = 373
      AutoSize = False
      Properties.Items = <>
      Properties.OnChange = cboLJJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 21
      Height = 21
      Width = 286
    end
    object cboLJJG: TcxComboBox
      Left = 509
      Top = 265
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '0 '#26410#25318#25130#21040
        '1 '#24050#25318#25130#21040)
      Properties.OnChange = cboLJJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 17
      Height = 21
      Width = 286
    end
    object cboWCHYY: TcxComboBox
      Left = 509
      Top = 346
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '01 '#24067#25511#20449#24687#26377#35823
        '02 '#21495#29260#35782#21035#38169#35823
        '03 '#36829#27861#35760#24405#38169#35823
        '04 '#21407#36710
        '05 '#36710#36742#22522#26412#20449#24687#26410#26356#26032
        '06 '#20869#37096#36710#36742
        '07 '#36710#36742#24050#24180#26816
        '08 '#36829#27861#24050#22788#29702
        '09 '#36710#36742#21697#29260#35782#21035#38169#35823
        '10 '#35782#21035#19982#30331#35760#21697#29260#26410#23545#24212
        '11 '#25509#39539#36710#36742
        '12 '#21345#21475#26410#28657#26102
        '13 '#39550#39542#20154#39550#39542#35777#27491#24120
        '14 '#38750#36710#20027#26412#20154#39550#39542
        '15 '#26816#26597#26080#24322#24120
        '99 '#20854#20182)
      Style.HotTrack = False
      TabOrder = 20
      Height = 21
      Width = 286
    end
    object edtBKLX: TcxTextEdit
      Left = 509
      Top = 238
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 16
      Height = 21
      Width = 286
    end
    object edtJYW: TcxTextEdit
      Left = 509
      Top = 454
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 24
      Height = 21
      Width = 286
    end
    object edtLXR: TcxTextEdit
      Left = 509
      Top = 508
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 26
      Height = 21
      Width = 286
    end
    object edtLXDH: TcxTextEdit
      Left = 509
      Top = 535
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 27
      Height = 21
      Width = 286
    end
    object cboWSLB: TcxComboBox
      Left = 509
      Top = 400
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '1 '#31616#26131#31243#24207#22788#32602#20915#23450#20070
        '3 '#24378#21046#25514#26045#20973#35777
        '6 '#36829#27861#22788#29702#36890#30693#20070)
      Style.HotTrack = False
      TabOrder = 22
      Height = 21
      Width = 286
    end
    object edtSFZMHM: TcxTextEdit
      Left = 675
      Top = 118
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 12
      Height = 21
      Width = 120
    end
    object edtYXQX: TcxTextEdit
      Left = 675
      Top = 172
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 120
    end
    object edtFDJH: TcxTextEdit
      Left = 675
      Top = 145
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 120
    end
    object edtCCDJRQ: TcxTextEdit
      Left = 509
      Top = 172
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 100
    end
    object edtGCSJ: TcxTextEdit
      Left = 509
      Top = 199
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 100
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
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = lgRight
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup2
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
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = edtHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36710#36742#21697#29260
      Control = edtCLPP
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36710#36742#22411#21495
      Control = edtCLXH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36710#36523#39068#33394
      Control = edtCSYS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #20351#29992#24615#36136
      Control = edtSYXZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #25253#24223#26399#38480
      Control = edtBFQX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36710#26550#21495#30721
      Control = edtCLSBDH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #25152#26377#20154
      Control = edtSYR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 3
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
      CaptionOptions.Text = #22788#32622#37096#38376
      Control = edtCZDW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 11
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnFeedback
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = lgRight
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 14
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup6
      AlignHorz = ahCenter
      CaptionOptions.Text = 'New Group'
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
      CaptionOptions.Text = #22788#32622#20154#21592
      Control = edtCZMJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 12
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = lgRight
      CaptionOptions.Text = #22788#32622#26102#38388
      Control = edtCZSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 13
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = lgRight
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = edtSBDDMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = lgRight
      CaptionOptions.Text = 'Separator'
      Index = 2
    end
    object liYJBM: TdxLayoutItem
      Parent = lgYJ
      CaptionOptions.Text = #31227#20132#37096#38376
      Control = edtYJBM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liWSBH: TdxLayoutItem
      Parent = lgWS
      CaptionOptions.Text = #25991#20070#32534#21495
      Control = edtWSBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liLJYY: TdxLayoutItem
      Parent = lgRight
      CaptionOptions.Text = #26410#25318#25130#21040#21407#22240
      Control = cboLJYY
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object liXYC: TdxLayoutItem
      Parent = lgRight
      CaptionOptions.Text = #26159#21542#23244#30097#36710
      Control = cboXYC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object liCZJG: TdxLayoutItem
      Parent = lgRight
      CaptionOptions.Text = #22788#32622#32467#26524
      Control = cboCZJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = lgRight
      CaptionOptions.Text = #25318#25130#32467#26524
      Control = cboLJJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object liWCHYY: TdxLayoutItem
      Parent = lgRight
      CaptionOptions.Text = #38750#23244#30097#36710#21407#22240
      Control = cboWCHYY
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = lgRight
      CaptionOptions.Text = #24067#25511#31867#22411'        '
      Control = edtBKLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lgWS: TdxLayoutGroup
      Parent = lgRight
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 9
    end
    object liJYW: TdxLayoutItem
      Parent = lgWS
      CaptionOptions.Text = #28657#39564#20301
      Control = edtJYW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lgYJ: TdxLayoutGroup
      Parent = lgRight
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 10
    end
    object liLXR: TdxLayoutItem
      Parent = lgYJ
      CaptionOptions.Text = #32852#31995#20154
      Control = edtLXR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liLXDH: TdxLayoutItem
      Parent = lgYJ
      CaptionOptions.Text = #32852#31995#30005#35805
      Control = edtLXDH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutSplitterItem2: TdxLayoutSplitterItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
    object liWSLB: TdxLayoutItem
      Parent = lgWS
      CaptionOptions.Text = #25991#20070#31867#21035
      Control = cboWSLB
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36523#20221#35777#21495
      Control = edtSFZMHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #26377#25928#26399#38480
      Control = edtYXQX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21457#21160#26426#21495
      Control = edtFDJH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 69
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #30331#35760#26085#26399
      Control = edtCCDJRQ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36807#36710#26102#38388
      Control = edtGCSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 6
    end
  end
end
