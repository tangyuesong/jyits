inherited FramePassSearch: TFramePassSearch
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Left = -654
      Top = 77
      Width = 1092
      Height = 170
      TabOrder = 14
      ExplicitLeft = -654
      ExplicitTop = 77
      ExplicitWidth = 1092
      ExplicitHeight = 170
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
      Left = -654
      Top = 254
      TabOrder = 15
      ExplicitLeft = -654
      ExplicitTop = 254
    end
    inherited btnFirstPage: TcxButton
      Left = -577
      Top = 254
      TabOrder = 16
      ExplicitLeft = -577
      ExplicitTop = 254
    end
    inherited btnPriorPage: TcxButton
      Left = -540
      Top = 254
      TabOrder = 17
      ExplicitLeft = -540
      ExplicitTop = 254
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -485
      Top = 254
      TabOrder = 18
      ExplicitLeft = -485
      ExplicitTop = 254
    end
    inherited btnnextPage: TcxButton
      Left = -408
      Top = 254
      TabOrder = 19
      ExplicitLeft = -408
      ExplicitTop = 254
    end
    inherited btnLastPage: TcxButton
      Left = -371
      Top = 254
      TabOrder = 20
      ExplicitLeft = -371
      ExplicitTop = 254
    end
    object cboClpp: TcxComboBox [7]
      Left = -194
      Top = 41
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 110
    end
    object btnSearch: TcxButton [8]
      Left = 306
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      OptionsImage.ImageIndex = 901
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 11
      OnClick = btnSearchClick
    end
    object btnReSet: TcxButton [9]
      Left = 306
      Top = 45
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 12
      OnClick = btnReSetClick
    end
    object cboZyb: TcxComboBox [10]
      Left = 232
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        ''
        #25171#24320
        #20851#38381
        #26410#30693)
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 67
    end
    object edtClpp1: TcxTextEdit [11]
      Left = -77
      Top = 41
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 89
    end
    object btnView: TcxButton [12]
      Left = 388
      Top = 45
      Width = 50
      Height = 25
      Hint = #34920#26684'/'#22270#29255#20999#25442
      OptionsImage.ImageIndex = 51
      OptionsImage.Images = DM.ilBarSmall
      ParentShowHint = False
      ShowHint = True
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 13
      OnClick = btnViewClick
    end
    object cboKDBH: TcxComboBoxExt [13]
      Left = -600
      Top = 41
      AutoSize = False
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsEditList
      Properties.IncrementalFiltering = False
      Properties.KeyFieldNames = 'Name'
      Properties.Revertable = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 142
    end
    object cboJC: TcxComboBox [14]
      Left = -194
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 110
    end
    object edtHPHM: TcxTextEdit [15]
      Left = -77
      Top = 13
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 3
      OnKeyPress = edtHPHMKeyPress
      Height = 21
      Width = 89
    end
    object cboHPZL: TcxComboBox [16]
      Left = 73
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 110
    end
    object dtBegin: TcxDateEdit [17]
      Left = -600
      Top = 13
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 142
    end
    object dtEnd: TcxDateEdit [18]
      Left = -397
      Top = 13
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 142
    end
    object cxCKBOXCSYS: TcxCheckComboBox [19]
      Left = -397
      Top = 41
      AutoSize = False
      Properties.Delimiter = ' '
      Properties.EmptySelectionText = ' '
      Properties.Items = <
        item
          Description = #30333
          ShortDescription = #30333
        end
        item
          Description = #38134
          ShortDescription = #38134
        end
        item
          Description = #28784
          ShortDescription = #28784
        end
        item
          Description = #40657
          ShortDescription = #40657
        end
        item
          Description = #32418
          ShortDescription = #32418
        end
        item
          Description = #28145#34013
          ShortDescription = #28145#34013
        end
        item
          Description = #34013
          ShortDescription = #34013
        end
        item
          Description = #40644
          ShortDescription = #40644
        end
        item
          Description = #32511
          ShortDescription = #32511
        end
        item
          Description = #26837
          ShortDescription = #26837
        end
        item
          Description = #31881
          ShortDescription = #31881
        end
        item
          Description = #32043
          ShortDescription = #32043
        end
        item
          Description = #20854#20182
          ShortDescription = #20854#20182
        end>
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 142
    end
    object cmbVehType: TcxComboBox [20]
      Left = 73
      Top = 41
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        ''
        #26410#30693
        #22823#22411#23458#36710
        #36135#36710
        #36735#36710
        #38754#21253#36710
        #23567#36135#36710
        #34892#20154
        #20108#36718#36710
        #19977#36718#36710
        'SUV/MPV'
        #20013#22411#23458#36710)
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 110
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
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36710#36742#21697#29260
      Control = cboClpp
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
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
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnReSet
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36974#38451#26495
      Visible = False
      Control = cboZyb
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 67
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = dxLayoutGroup4
      Control = edtClpp1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 89
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnView
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liKDBH: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = cboKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 142
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cboJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      Control = edtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 89
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cboHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36807#36710#26102#38388
      Control = dtBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 142
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #32467#26463#26102#38388
      Control = dtEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 142
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36710#36523#39068#33394
      Control = cxCKBOXCSYS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 142
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36710#36742#31867#22411
      Control = cmbVehType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 4
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
