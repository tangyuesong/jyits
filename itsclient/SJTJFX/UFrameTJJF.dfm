inherited FrameTJJF: TFrameTJJF
  Width = 877
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 877
    inherited BtnSearch: TcxButton
      Left = 767
      TabOrder = 8
      ExplicitLeft = 767
    end
    inherited BtnExport: TcxButton
      Left = 849
      TabOrder = 9
      ExplicitLeft = 849
    end
    inherited cxGrid2: TcxGrid
      Width = 911
      TabOrder = 11
      ExplicitWidth = 911
      inherited ChartView: TcxGridDBChartView
        DataController.DataSource = DataSource1
        DiagramColumn.Active = False
        DiagramStackedColumn.Active = True
        DiagramStackedColumn.Values.CaptionPosition = cdvcpOutsideEnd
        Legend.Position = cppTop
        object ChartViewSeries1: TcxGridDBChartSeries
          DataBinding.FieldName = 'wjf2'
          DisplayText = '2017'#21069#26410#35760#20998
        end
        object ChartViewSeries2: TcxGridDBChartSeries
          DataBinding.FieldName = 'wjf1'
          DisplayText = '2017'#21518#26410#35760#20998
        end
      end
    end
    inherited cxGrid1: TcxGrid
      Width = 911
      TabOrder = 10
      ExplicitWidth = 911
    end
    object CbbCXFL: TcxComboBox [11]
      Left = 679
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 81
    end
    inherited cbbPagesize: TcxComboBox
      TabOrder = 12
    end
    inherited btnFirstPage: TcxButton
      TabOrder = 13
    end
    inherited btnPriorPage: TcxButton
      TabOrder = 14
    end
    inherited edtPageIndex: TcxTextEdit
      TabOrder = 15
    end
    inherited btnnextPage: TcxButton
      TabOrder = 16
    end
    inherited btnLastPage: TcxButton
      TabOrder = 17
    end
    inherited dxLayoutItem7: TdxLayoutItem
      Index = 8
    end
    inherited dxLayoutItem8: TdxLayoutItem
      Index = 9
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26597#35810#20998#31867
      Control = CbbCXFL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 81
      ControlOptions.ShowBorder = False
      Index = 7
    end
  end
  inherited cxdtrpstry1: TcxEditRepository
    Left = 168
    Top = 96
    inherited cxdtrpstry1ButtonItem1: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Action = Action1
          ContentAlignment = taLeftJustify
          Default = True
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
  end
  inherited actlst1: TActionList
    object Action1: TAction
      Caption = #35814#32454
      OnExecute = Action1Execute
    end
  end
end
