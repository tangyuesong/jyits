inherited dxFramePicData: TdxFramePicData
  ExplicitWidth = 847
  ExplicitHeight = 498
  inherited dxLayoutControl2: TdxLayoutControl
    OptionsImage.Images = DM.ilBarSmall
    ExplicitWidth = 847
    ExplicitHeight = 498
    object cxgrd1: TcxGrid [0]
      Left = 95
      Top = 36
      Width = 378
      Height = 20
      TabOrder = 4
      object GridView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        OnFocusedRecordChanged = GridViewFocusedRecordChanged
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
      end
      object cxgrdlvlGrid1Level1: TcxGridLevel
        GridView = GridView
      end
    end
    object edtkdbh: TcxTextEdit [1]
      Left = 164
      Top = 86
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 294
    end
    object edtCD: TcxTextEdit [2]
      Left = 358
      Top = 114
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 100
    end
    object edtsyr: TcxTextEdit [3]
      Left = 164
      Top = 310
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 20
      Height = 21
      Width = 294
    end
    object edtzsxxdz: TcxTextEdit [4]
      Left = 164
      Top = 338
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 21
      Height = 21
      Width = 294
    end
    object cxButton1: TcxButton [5]
      Left = 13
      Top = 13
      Width = 25
      Height = 25
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    object btnMap: TcxButton [6]
      Left = 13
      Top = 90
      Width = 25
      Height = 25
      OptionsImage.ImageIndex = 38
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 2
      OnClick = btnMapClick
    end
    object edtgcsj: TcxTextEdit [7]
      Left = 164
      Top = 114
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 125
    end
    object edthpzl: TcxTextEdit [8]
      Left = 164
      Top = 142
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 125
    end
    object edthphm: TcxTextEdit [9]
      Left = 358
      Top = 142
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 100
    end
    object edtclpp: TcxTextEdit [10]
      Left = 164
      Top = 170
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 125
    end
    object edtclxh: TcxTextEdit [11]
      Left = 358
      Top = 170
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 15
      Height = 21
      Width = 100
    end
    object edtcsys: TcxTextEdit [12]
      Left = 164
      Top = 198
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 125
    end
    object edtCLSD: TcxTextEdit [13]
      Left = 358
      Top = 198
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 16
      Height = 21
      Width = 100
    end
    object edtcjh: TcxTextEdit [14]
      Left = 164
      Top = 226
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 125
    end
    object edtfdjh: TcxTextEdit [15]
      Left = 358
      Top = 226
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 17
      Height = 21
      Width = 100
    end
    object edtccdjrq: TcxTextEdit [16]
      Left = 164
      Top = 254
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 125
    end
    object edtsyxz: TcxTextEdit [17]
      Left = 358
      Top = 254
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 18
      Height = 21
      Width = 100
    end
    object edtyxqx: TcxTextEdit [18]
      Left = 164
      Top = 282
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 12
      Height = 21
      Width = 125
    end
    object edtqzbfqz: TcxTextEdit [19]
      Left = 358
      Top = 282
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 19
      Height = 21
      Width = 100
    end
    object cxPageControl1: TcxPageControl [20]
      Left = 45
      Top = 13
      Width = 20
      Height = 408
      TabOrder = 3
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      ClientRectBottom = 408
      ClientRectRight = 20
      ClientRectTop = 0
      object cxTabSheet1: TcxTabSheet
        Caption = 'cxTabSheet1'
        ImageIndex = 0
        object imgviopic: TImageEnVect
          Left = 0
          Top = 0
          Width = 366
          Height = 472
          Background = clWhite
          Ctl3D = False
          ParentCtl3D = False
          BorderStyle = bsNone
          LegacyBitmap = True
          ZoomFilter = rfFastLinear
          AutoFit = True
          EnableInteractionHints = True
          Align = alClient
          TabOrder = 0
          OnMouseMove = imgviopicMouseMove
          OnMouseUp = imgviopicMouseUp
          ExplicitWidth = 20
          ExplicitHeight = 408
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'cxTabSheet2'
        ImageIndex = 1
        ExplicitWidth = 366
        ExplicitHeight = 472
        object Chromium1: TChromium
          Left = 0
          Top = 0
          Width = 20
          Height = 408
          Align = alClient
          TabOrder = 0
          Options.AcceleratedPaintingDisabled = False
          Options.AcceleratedFiltersDisabled = False
          Options.AcceleratedPluginsDisabled = False
          ExplicitWidth = 366
          ExplicitHeight = 472
        end
      end
    end
    object btnPic: TcxButton [21]
      Left = 13
      Top = 58
      Width = 25
      Height = 25
      OptionsImage.ImageIndex = 41
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      OnClick = btnPicClick
    end
    object btnPrior: TcxButton [22]
      Tag = 3
      Left = 95
      Top = 381
      Width = 30
      Height = 21
      Cursor = crHandPoint
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000001E1E
        1E81000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001E1E1E813C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001E1E1E813C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001E1E1E813C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000001E1E1E7E3C3C3CFF3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001E1E1E7E3C3C
        3CFF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000001E1E
        1E7E000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 22
      OnClick = btnPriorClick
    end
    object btnNext: TcxButton [23]
      Tag = 2
      Left = 132
      Top = 381
      Width = 30
      Height = 21
      Cursor = crHandPoint
      OptionsImage.Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E8100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF1E1E1E81000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF1E1E1E810000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF1E1E
        1E81000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF1E1E1E810000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF1E1E1E7E00000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF3C3C3CFF1E1E1E7E00000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
        3CFF1E1E1E7E0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF1E1E
        1E7E000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF3C3C3CFF1E1E1E7E0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000003C3C3CFF1E1E1E7E000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001E1E1E7E00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 23
      OnClick = btnNextClick
    end
    object btnGj: TcxButton [24]
      Left = 398
      Top = 381
      Width = 75
      Height = 25
      Caption = #36712#36857
      TabOrder = 25
      OnClick = btnGjClick
    end
    object btnSearchPic: TcxButton [25]
      Left = 316
      Top = 381
      Width = 75
      Height = 25
      Caption = #20197#22270#25628#36710
      TabOrder = 24
      OnClick = btnSearchPicClick
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      CaptionOptions.Visible = False
      LayoutDirection = ldHorizontal
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahRight
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Index = 3
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxgrd1
      ControlOptions.OriginalHeight = 103
      ControlOptions.OriginalWidth = 300
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36710#36742#20449#24687
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = edtkdbh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 125
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #36710#36947#32534#21495
      Control = edtCD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #25152#26377#20154
      Control = edtsyr
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 126
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #24120#20303#22320#22336
      Control = edtzsxxdz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 126
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.ImageIndex = 1808
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnMap
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxlytcrtdgrp1
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxlytcrtdgrp1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36807#36710#26102#38388
      Control = edtgcsj
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 125
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = edthpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36710#36742#21697#29260
      Control = edtclpp
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #36710#36742#31867#22411
      Control = edtclxh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36710#36523#39068#33394
      Control = edtcsys
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #36710#36742#36895#24230
      Control = edtCLSD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36710#26550#21495#30721
      Control = edtcjh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #21457#21160#26426#21495
      Control = edtfdjh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #21021#27425#30331#35760
      Control = edtccdjrq
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #20351#29992#24615#36136
      Control = edtsyxz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #26377#25928#26399#38480
      Control = edtyxqx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #25253#24223#26399#38480
      Control = edtqzbfqz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutSplitterItem1: TdxLayoutSplitterItem
      Parent = dxlytcrtdgrp1
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
    object dxLayoutSplitterItem2: TdxLayoutSplitterItem
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignVert = avClient
      CaptionOptions.Text = 'cxPageControl1'
      CaptionOptions.Visible = False
      Control = cxPageControl1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 193
      ControlOptions.OriginalWidth = 289
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = btnPic
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnPrior
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnNext
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 30
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnGj
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnSearchPic
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 720
    Top = 56
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 856
    Top = 56
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 456
    Top = 232
  end
end
