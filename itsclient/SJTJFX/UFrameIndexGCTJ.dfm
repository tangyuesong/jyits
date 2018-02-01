inherited FrameIndexGCSJ: TFrameIndexGCSJ
  Width = 762
  Height = 545
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 762
    Height = 410
    ExplicitHeight = 170
    object cxGrid1: TcxGrid [0]
      Left = 28
      Top = 67
      Width = 706
      Height = 171
      TabOrder = 3
      object cxGrid1ChartView1: TcxGridChartView
        DiagramLine.Active = True
        DiagramLine.Values.VaryColorsByCategory = True
        DiagramLine.Values.Stacking = vsNormal
      end
      object cxGridLevel2: TcxGridLevel
        GridView = cxGrid1ChartView1
      end
    end
    object cxGrid2: TcxGrid [1]
      Left = 13
      Top = 260
      Width = 736
      Height = 137
      TabOrder = 4
      object ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = 'DWMC'
        DataController.DataSource = DataSource2
        DiagramStackedColumn.Active = True
        Legend.Position = cppTop
        object ChartViewSeries1: TcxGridDBChartSeries
          DataBinding.FieldName = #22312#32447#35774#22791
          DisplayText = #22312#32447#35774#22791
        end
        object ChartViewSeries2: TcxGridDBChartSeries
          DataBinding.FieldName = #31163#32447#35774#22791
          DisplayText = #31163#32447#35774#22791
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = ChartView
      end
    end
    object rb1: TcxRadioButton [2]
      Left = 28
      Top = 43
      Width = 50
      Height = 17
      Caption = #20170#22825
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rb1Click
      Transparent = True
    end
    object rb2: TcxRadioButton [3]
      Left = 85
      Top = 43
      Width = 50
      Height = 17
      Caption = #26152#22825
      TabOrder = 1
      OnClick = rb1Click
      Transparent = True
    end
    object rb3: TcxRadioButton [4]
      Left = 142
      Top = 43
      Width = 50
      Height = 17
      Caption = #21069#22825
      TabOrder = 2
      OnClick = rb1Click
      Transparent = True
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #36807#36710#20449#24687#32479#35745
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #35774#22791#21015#34920
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 88
      ControlOptions.OriginalWidth = 769
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid2
      ControlOptions.OriginalHeight = 88
      ControlOptions.OriginalWidth = 769
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'cxRadioButton1'
      CaptionOptions.Visible = False
      Control = rb1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'cxRadioButton2'
      CaptionOptions.Visible = False
      Control = rb2
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup1
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avClient
      CaptionOptions.Text = 'cxRadioButton3'
      CaptionOptions.Visible = False
      Control = rb3
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      ControlOptions.OriginalHeight = 141
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object cxDBPivotGrid1: TcxDBPivotGrid
    Left = 0
    Top = 410
    Width = 762
    Height = 135
    Align = alBottom
    DataSource = DataSource1
    Groups = <>
    TabOrder = 1
    Visible = False
    ExplicitTop = 170
    ExplicitWidth = 451
    object cxDBPivotGrid1Field1: TcxDBPivotGridField
      Area = faRow
      AreaIndex = 0
      IsCaptionAssigned = True
      Caption = 'gcsj'
      DataBinding.FieldName = 'gcsj'
      Visible = True
      UniqueName = 'jt'
    end
    object cxDBPivotGrid1Field2: TcxDBPivotGridField
      Area = faData
      AreaIndex = 0
      DataBinding.FieldName = 'GCCS'
      Visible = True
      UniqueName = 'c1'
    end
    object cxDBPivotGrid1Field3: TcxDBPivotGridField
      Area = faColumn
      AreaIndex = 0
      DataBinding.FieldName = 'mc'
      Visible = True
      UniqueName = 'fxlx'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 256
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = FDMemTable2
    Left = 288
    Top = 80
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 120
    Top = 80
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 80
  end
  object cxPivotGridChartConnection1: TcxPivotGridChartConnection
    GridChartView = cxGrid1ChartView1
    PivotGrid = cxDBPivotGrid1
    Left = 208
    Top = 80
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 368
    Top = 136
  end
end
