inherited FrameGCTJ: TFrameGCTJ
  inherited dxLayoutControl2: TdxLayoutControl
    object deBegin: TcxDateEdit [0]
      Left = 77
      Top = 27
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 111
    end
    object deEnd: TcxDateEdit [1]
      Left = 213
      Top = 27
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 111
    end
    object btnSearch: TcxButton [2]
      Left = 691
      Top = 27
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 4
      OnClick = btnSearchClick
    end
    object btnExport: TcxButton [3]
      Left = 773
      Top = 27
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 5
      OnClick = btnExportClick
    end
    object cbbWfdd: TcxComboBox [4]
      Left = 385
      Top = 27
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 176
    end
    object cbbDateType: TcxComboBox [5]
      Left = 622
      Top = 27
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #24180
        #26376
        #21608
        #26085
        #26102)
      Style.HotTrack = False
      TabOrder = 3
      Text = #26085
      Height = 21
      Width = 62
    end
    object cxGrid2: TcxGrid [6]
      Left = 297
      Top = 73
      Width = 561
      Height = 202
      TabOrder = 7
      LockedStateImageOptions.ShowText = True
      LookAndFeel.NativeStyle = False
      object cxGrid2DBChartView1: TcxGridDBChartView
        Categories.DataBinding.FieldName = 'GCSJ'
        Categories.DisplayText = #36807#36710#26102#38388
        DataController.DataSource = dstemp2
        DiagramLine.Active = True
        DiagramLine.Values.LineStyle = clsDash
        DiagramLine.Values.MarkerStyle = cmsDiamond
        Legend.Position = cppNone
        object cxGrid2DBChartView1Series1: TcxGridDBChartSeries
          DataBinding.FieldName = 'gcsl'
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGrid2DBChartView1
      end
    end
    object cxGrid1: TcxGrid [7]
      Left = 13
      Top = 73
      Width = 258
      Height = 202
      TabOrder = 6
      LockedStateImageOptions.ShowText = True
      LookAndFeel.NativeStyle = False
      object cxgrid3: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = dstemp2
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        object cxgridnumcxgrid3Column1: TcxGridDBColumn
          Caption = #36807#36710#26102#38388
          DataBinding.FieldName = 'GCSJ'
          HeaderAlignmentHorz = taCenter
          Width = 125
        end
        object cxgridnumcxgrid3Column2: TcxGridDBColumn
          Caption = #36807#36710#25968#37327
          DataBinding.FieldName = 'gcsl'
          HeaderAlignmentHorz = taCenter
          Width = 91
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxgrid3
      end
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 202
      ControlOptions.OriginalWidth = 218
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid2
      ControlOptions.OriginalHeight = 419
      ControlOptions.OriginalWidth = 473
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutSplitterItem1: TdxLayoutSplitterItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #36807#36710#26102#38388
      Control = deBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 111
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #33267
      Control = deEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 111
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = cbbWfdd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 176
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #32479#35745#21608#26399
      Control = cbbDateType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 62
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  object dstemp2: TDataSource
    DataSet = FDqryclient
    Left = 372
    Top = 64
  end
  object dlgSave: TsSaveDialog
    DefaultExt = '*.xls,*.xlsx,*.html,*.xml,*.txt'
    Filter = 'EXCEL|*.xls|EXCEL|*.xlsx|HTML|*.html|XML|*.xml|TEXT|*.txt'
    Title = #23548#20986#25968#25454
    Left = 301
    Top = 66
  end
  object FDqryclient: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 432
    Top = 65
  end
end
