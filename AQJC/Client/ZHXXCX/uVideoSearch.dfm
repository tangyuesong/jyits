inherited FrameVideoSearch: TFrameVideoSearch
  Width = 797
  Height = 502
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 797
    Height = 502
    CustomizeFormTabbedView = True
    inherited cxGrid1: TcxGrid
      Top = 133
      Width = 1087
      Height = 311
      TabOrder = 19
      ExplicitTop = 133
      ExplicitWidth = 1087
      ExplicitHeight = 311
      inherited GridView: TcxGridDBTableView
        OnCellDblClick = GridViewCellDblClick
        OptionsView.NavigatorOffset = 0
      end
      object cxGrid1DBWinExplorerView1: TcxGridDBWinExplorerView [1]
        Navigator.Buttons.CustomButtons = <>
        OnCellDblClick = GridViewCellDblClick
        ActiveDisplayMode = dmExtraLargeImages
        DataController.DataSource = DataSource2
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        ItemSet.ExtraLargeImageItem = cxGrid1DBWinExplorerView1Item1
        ItemSet.SmallImageItem = cxGrid1DBWinExplorerView1Item1
        ItemSet.TextItem = cxGrid1DBWinExplorerView1Item2
        DisplayModes.ExtraLargeImages.ImageSize.Height = 360
        DisplayModes.ExtraLargeImages.ImageSize.Width = 360
        object cxGrid1DBWinExplorerView1Item1: TcxGridDBWinExplorerViewItem
          DataBinding.FieldName = 'tp'
          RepositoryItem = cxdtrpstry1ImageItem1
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringWithFindPanel = False
          Options.IgnoreTimeForFiltering = False
          Options.IncSearch = False
          Options.Sorting = False
        end
        object cxGrid1DBWinExplorerView1Item2: TcxGridDBWinExplorerViewItem
          DataBinding.FieldName = 'nr'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringWithFindPanel = False
          Options.Focusing = False
          Options.IgnoreTimeForFiltering = False
          Options.IncSearch = False
          Options.Sorting = False
        end
      end
    end
    inherited cbbPagesize: TcxComboBox
      Top = 451
      TabOrder = 20
      ExplicitTop = 451
    end
    inherited btnFirstPage: TcxButton
      Top = 451
      TabOrder = 21
      ExplicitTop = 451
    end
    inherited btnPriorPage: TcxButton
      Top = 451
      TabOrder = 22
      ExplicitTop = 451
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 451
      TabOrder = 23
      ExplicitTop = 451
    end
    inherited btnnextPage: TcxButton
      Top = 451
      TabOrder = 24
      ExplicitTop = 451
    end
    inherited btnLastPage: TcxButton
      Top = 451
      TabOrder = 25
      ExplicitTop = 451
    end
    object dtBegin: TcxDateEdit [7]
      Left = 55
      Top = 13
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 189
    end
    object dtEnd: TcxDateEdit [8]
      Left = 281
      Top = 13
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 189
    end
    object cboTargetType: TcxComboBox [9]
      Left = 531
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20154#20307
        #26426#21160#36710
        #20108#36718#36710
        #19977#36718#36710)
      Style.HotTrack = False
      TabOrder = 2
      Text = #20154#20307
      Height = 21
      Width = 76
    end
    object cboAgeGroup: TcxComboBox [10]
      Left = 55
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #23569#24180
        #38738#24180
        #20013#24180
        #32769#24180)
      Style.HotTrack = False
      TabOrder = 3
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboGender: TcxComboBox [11]
      Left = 168
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #30007
        #22899)
      Style.HotTrack = False
      TabOrder = 4
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboBag: TcxComboBox [12]
      Left = 281
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #26159
        #21542)
      Style.HotTrack = False
      TabOrder = 5
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboMask: TcxComboBox [13]
      Left = 394
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #26159
        #21542)
      Style.HotTrack = False
      TabOrder = 6
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboJacketType: TcxComboBox [14]
      Left = 531
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #30701#34966
        #38271#34966)
      Style.HotTrack = False
      TabOrder = 7
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboHairStyle: TcxComboBox [15]
      Left = 55
      Top = 69
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #30701#21457
        #38271#21457)
      Style.HotTrack = False
      TabOrder = 11
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboTrousersColor: TcxCheckComboBox [16]
      Left = 668
      Top = 69
      AutoSize = False
      Properties.Items = <
        item
          Description = 'qqqqq'
        end
        item
          Description = '22222222'
        end>
      Style.HotTrack = False
      TabOrder = 16
      Height = 21
      Width = 76
    end
    object cboCyclingType: TcxComboBox [17]
      Left = 805
      Top = 69
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #23569#24180
        #38738#24180
        #20013#24180
        #32769#24180)
      Style.HotTrack = False
      TabOrder = 17
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboGlass: TcxComboBox [18]
      Left = 168
      Top = 69
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #26159
        #21542)
      Style.HotTrack = False
      TabOrder = 12
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboHat: TcxComboBox [19]
      Left = 281
      Top = 69
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #26159
        #21542)
      Style.HotTrack = False
      TabOrder = 13
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboRide: TcxComboBox [20]
      Left = 394
      Top = 69
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #23569#24180
        #38738#24180
        #20013#24180
        #32769#24180)
      Style.HotTrack = False
      TabOrder = 14
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboTrousersType: TcxComboBox [21]
      Left = 531
      Top = 69
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #30701#35044
        #38271#35044)
      Style.HotTrack = False
      TabOrder = 15
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboJacketColor: TcxCheckComboBox [22]
      Left = 668
      Top = 41
      AutoSize = False
      Properties.Items = <
        item
          Description = 'qqqqq'
        end
        item
          Description = '22222222'
        end>
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 76
    end
    object cboCyclingPersonNumber: TcxComboBox [23]
      Left = 805
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #23569#24180
        #38738#24180
        #20013#24180
        #32769#24180)
      Style.HotTrack = False
      TabOrder = 9
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object cboThings: TcxComboBox [24]
      Left = 930
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #20840#37096
        #26410#30693
        #23569#24180
        #38738#24180
        #20013#24180
        #32769#24180)
      Style.HotTrack = False
      TabOrder = 10
      Text = #20840#37096
      Height = 21
      Width = 76
    end
    object btnSearch: TcxButton [25]
      Left = 1025
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 18
      OnClick = btnSearchClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26102#38388
      Control = dtBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 189
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = ' '#33267
      Control = dtEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 189
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #31867#22411
      Control = cboTargetType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLgVehicle: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLgtwoWheelVehicle: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLgThreeWheelVehicle: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLgHuman: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLgHumansub: TdxLayoutGroup
      Parent = dxLgHuman
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLgHumansub
      CaptionOptions.Text = #24180#40836#27573
      Control = cboAgeGroup
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLgHumansub
      CaptionOptions.Text = #24615#21035
      Control = cboGender
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLgHumansub
      CaptionOptions.Text = #32972#21253
      Control = cboBag
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLgHumansub
      CaptionOptions.Text = #21475#32617
      Control = cboMask
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLgHumansub
      CaptionOptions.Text = #19978#34915#31867#22411
      Control = cboJacketType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLgHuman
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #21457#22411
      Control = cboHairStyle
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #19979#35013#39068#33394
      Control = cboTrousersColor
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #39569#36710#31867#22411
      Control = cboCyclingType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #30524#38236
      Control = cboGlass
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #24125#23376
      Control = cboHat
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #39569#36710
      Control = cboRide
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #19979#35013#31867#22411
      Control = cboTrousersType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLgHumansub
      CaptionOptions.Text = #19978#34915#39068#33394
      Control = cboJacketColor
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLgHumansub
      CaptionOptions.Text = #39569#36710#20154#25968
      Control = cboCyclingPersonNumber
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLgHumansub
      CaptionOptions.Text = #25294#19996#35199
      Control = cboThings
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'BtnSearch'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    Left = 512
    Top = 120
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = ActionPicture
          Default = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000003C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF000000001E1E1E7E3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF1E1E1E7E1E1E
            1E7E3C3C3CFF3C3C3CFF1E1E1E7E000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF00000000000000001E1E1E7E3C3C3CFF3C3C3CFF1E1E1E7E000000000000
            00001E1E1E7E1E1E1E7E00000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF0000000000000000000000001E1E1E7E1E1E1E7E00000000000000001A1A
            1A70353535E01A1A1A7000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF000000000000000000000000000000000000000000000000000000003535
            35E03C3C3CFF353535E000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF000000000000000000000000000000000000000000000000000000001A1A
            1A70353535E01A1A1A7000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000003C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Kind = bkGlyph
        end
        item
          Action = ActionViewList
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
            2FC72121218D1010104600000000000000000000000000000000000000000000
            0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000808
            0820262626A33C3C3CFF262626A21414145320202088323232D5323232D52020
            208814141453262626A23C3C3CFF262626A30808082000000000000000002121
            218C3C3C3CFF1515155B020202071E1E1E803C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E80020202071515155B3C3C3CFF2121218C00000000101010463939
            39F3242424980000000100000000323232D53C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF323232D5000000000000000124242498393939F310101046303030CC3C3C
            3CFF282828A90000000000000000323232D53C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF323232D50000000000000000282828A93C3C3CFF303030CC101010463939
            39F33C3C3CFF242424980A0A0A2A1E1E1E803C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF1E1E1E800A0A0A2A242424983C3C3CFF393939F310101046000000002121
            218C3C3C3CFF3C3C3CFF303030CB2121218C2525259F333333D8333333D82525
            259F2121218C303030CB3C3C3CFF3C3C3CFF2121218C00000000000000000808
            0820262626A33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF3C3C3CFF3C3C3CFF262626A30808082000000000000000000000
            0000080808202121218C393939F33C3C3CFF3C3C3CFF3C3C3CFF3C3C3CFF3C3C
            3CFF3C3C3CFF393939F32121218C080808200000000000000000000000000000
            00000000000000000000101010462121218D2F2F2FC7383838F0383838F02F2F
            2FC72121218D1010104600000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          Kind = bkGlyph
        end>
    end
    object cxdtrpstry1ImageItem1: TcxEditRepositoryImageItem
      Properties.GraphicClassName = 'TdxSmartImage'
    end
  end
  inherited dlgSave: TsSaveDialog
    Top = 120
  end
  object ActionList1: TActionList
    Left = 544
    Top = 232
    object ActionPicture: TAction
      Caption = #26597#30475#22270#29255
      OnExecute = ActionPictureExecute
    end
    object ActionViewList: TAction
      Caption = #21382#21490#35760#24405
      OnExecute = ActionViewListExecute
    end
  end
  object FDMemTable2: TFDMemTable
    Active = True
    AfterScroll = FDMemTable2AfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 256
    Top = 192
    object FDMemTable2tp: TBlobField
      FieldName = 'tp'
    end
    object FDMemTable2nr: TStringField
      FieldName = 'nr'
      Size = 100
    end
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable2
    Left = 344
    Top = 192
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 448
    Top = 328
  end
end
