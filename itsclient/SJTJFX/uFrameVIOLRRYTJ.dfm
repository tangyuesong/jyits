inherited FrameVIOLRRYTJ: TFrameVIOLRRYTJ
  object sSplitter1: TsSplitter [0]
    Left = 0
    Top = 0
    Width = 451
    Height = 6
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -169
    ExplicitTop = 300
    ExplicitWidth = 1029
  end
  inherited dxLayoutControl2: TdxLayoutControl
    Top = 6
    Height = 299
    ExplicitTop = 6
    ExplicitWidth = 907
    ExplicitHeight = 299
    object cxGrid1: TcxGrid [0]
      Left = 13
      Top = 217
      Width = 881
      Height = 69
      TabOrder = 6
      LockedStateImageOptions.ShowText = True
      LookAndFeel.NativeStyle = False
      object cxgrid3: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = dstempZCB
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsView.GroupByBox = False
      end
      object cxgridGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DetailKeyFieldNames = 'LRR'
        DataController.MasterKeyFieldNames = 'LRR'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsView.NoDataToDisplayInfoText = #27809#26377#30456#20851#25968#25454
        OptionsView.GroupByBox = False
      end
      object cxGrid1DBChartView1: TcxGridDBChartView
        Categories.DataBinding.FieldName = 'lrr'
        DataController.DataSource = dstempZCB
        DiagramColumn.Active = True
        object cxGrid1DBChartView1Series1: TcxGridDBChartSeries
          DataBinding.FieldName = #19978#20256#25104#21151
          DisplayText = #19978#20256#25104#21151
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = cxgrid3
      end
    end
    object deBegin: TcxDateEdit [1]
      Left = 82
      Top = 36
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 111
    end
    object deEnd: TcxDateEdit [2]
      Left = 218
      Top = 36
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 111
    end
    object cbGroup: TcxCheckBox [3]
      Left = 336
      Top = 36
      Caption = #20998#32452#32479#35745
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 2
      Transparent = True
    end
    object btnSearch: TcxButton [4]
      Left = 413
      Top = 36
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = btnSearchClick
    end
    object btnExport: TcxButton [5]
      Left = 495
      Top = 36
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 4
      OnClick = btnExportClick
    end
    object cxGrid2: TcxGrid [6]
      Left = 13
      Top = 83
      Width = 881
      Height = 119
      TabOrder = 5
      object ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = 'LRR'
        DataController.DataSource = dstempZCB
        DiagramColumn.Active = True
        Legend.Position = cppTop
        object ChartViewSeries1: TcxGridDBChartSeries
          DataBinding.FieldName = #24405#20837#26410#19978#20256
          DisplayText = #24405#20837#26410#19978#20256
        end
        object ChartViewSeries2: TcxGridDBChartSeries
          DataBinding.FieldName = #19978#20256#22833#36133
          DisplayText = #19978#20256#22833#36133
        end
        object ChartViewSeries3: TcxGridDBChartSeries
          DataBinding.FieldName = #19978#20256#25104#21151
          DisplayText = #19978#20256#25104#21151
        end
        object ChartViewSeries4: TcxGridDBChartSeries
          DataBinding.FieldName = #24453#22797#26680
          DisplayText = #24453#22797#26680
        end
        object ChartViewSeries5: TcxGridDBChartSeries
          DataBinding.FieldName = #24453#23457#26680
          DisplayText = #24453#23457#26680
        end
        object ChartViewSeries6: TcxGridDBChartSeries
          DataBinding.FieldName = #22797#26680#21024#38500
          DisplayText = #22797#26680#21024#38500
        end
        object ChartViewSeries7: TcxGridDBChartSeries
          DataBinding.FieldName = #24405#20837#21024#38500
          DisplayText = #24405#20837#21024#38500
        end
      end
      object cxGridLevel2: TcxGridLevel
        GridView = ChartView
      end
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 142
      ControlOptions.OriginalWidth = 1029
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
    object dxLayoutItem3: TdxLayoutItem
      CaptionOptions.Text = 'New Item'
      Index = -1
    end
    object dxLayoutItem4: TdxLayoutItem
      CaptionOptions.Text = 'New Item'
      Index = -1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #24405#20837#26102#38388
      Control = deBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 111
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #33267
      Control = deEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 111
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = cbGroup
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 70
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSearch
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = btnExport
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid2
      ControlOptions.OriginalHeight = 246
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object dstempZCB: TDataSource
    DataSet = FDqryZB
    Left = 148
    Top = 139
  end
  object FDqryZB: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 200
    Top = 136
  end
  object dlgSave: TsSaveDialog
    DefaultExt = '*.xls,*.xlsx,*.html,*.xml,*.txt'
    Filter = 'EXCEL|*.xls|EXCEL|*.xlsx|HTML|*.html|XML|*.xml|TEXT|*.txt'
    Title = #23548#20986#25968#25454
    Left = 77
    Top = 136
  end
end
