inherited FrameTJFine: TFrameTJFine
  Height = 308
  inherited dxLayoutControl2: TdxLayoutControl
    Height = 308
    inherited BtnSearch: TcxButton
      Left = 281
      TabOrder = 9
      ExplicitLeft = 281
    end
    inherited BtnExport: TcxButton
      Left = 363
      TabOrder = 10
      ExplicitLeft = 363
    end
    inherited cxGrid2: TcxGrid
      Top = 172
      Width = 1102
      Height = 78
      TabOrder = 12
      ExplicitTop = 172
      ExplicitWidth = 1102
      ExplicitHeight = 78
      inherited ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = 'MC'
        DataController.DataSource = DataSource1
        DiagramColumn.Values.VaryColorsByCategory = True
        DiagramColumn.Values.CaptionPosition = cdvcpOutsideEnd
        Legend.Position = cppTop
        object ChartViewSeries1: TcxGridDBChartSeries
          DataBinding.FieldName = 'FKJE'
        end
      end
    end
    inherited cxGrid1: TcxGrid
      Width = 1102
      Height = 120
      Align = alClient
      TabOrder = 11
      ExplicitWidth = 1102
      ExplicitHeight = 120
      inherited GridView: TcxGridDBTableView
        OnCellDblClick = GridViewCellDblClick
      end
    end
    inherited cbbPagesize: TcxComboBox
      Top = 257
      TabOrder = 13
      ExplicitTop = 257
    end
    inherited btnFirstPage: TcxButton
      Top = 257
      TabOrder = 14
      ExplicitTop = 257
    end
    inherited btnPriorPage: TcxButton
      Top = 257
      TabOrder = 15
      ExplicitTop = 257
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 257
      TabOrder = 16
      ExplicitTop = 257
    end
    inherited btnnextPage: TcxButton
      Top = 257
      TabOrder = 17
      ExplicitTop = 257
    end
    inherited btnLastPage: TcxButton
      Top = 257
      TabOrder = 18
      ExplicitTop = 257
    end
    object CbbCXLX: TcxComboBox [17]
      Left = 166
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 108
    end
    object cbbCXFL: TcxComboBox [18]
      Left = 2
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 103
    end
    inherited dxLayoutItem7: TdxLayoutItem
      Index = 9
    end
    inherited dxLayoutItem8: TdxLayoutItem
      Index = 10
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26597#35810#31867#22411
      Control = CbbCXLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 108
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26597#35810#20998#31867
      Control = cbbCXFL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 7
    end
  end
end
