inherited FrameTJFine: TFrameTJFine
  Width = 451
  Height = 305
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 451
    Height = 305
    inherited BtnSearch: TcxButton
      TabOrder = 9
    end
    inherited BtnExport: TcxButton
      TabOrder = 10
    end
    inherited cxGrid2: TcxGrid
      Top = 170
      Width = 1102
      Height = 77
      TabOrder = 12
      ExplicitTop = 170
      ExplicitWidth = 1102
      ExplicitHeight = 77
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
      Height = 118
      Align = alClient
      TabOrder = 11
      ExplicitWidth = 1102
      ExplicitHeight = 118
      inherited GridView: TcxGridDBTableView
        OnCellDblClick = GridViewCellDblClick
      end
    end
    inherited cbbPagesize: TcxComboBox
      Top = 254
      TabOrder = 13
      ExplicitTop = 254
    end
    inherited btnFirstPage: TcxButton
      Top = 254
      TabOrder = 14
      ExplicitTop = 254
    end
    inherited btnPriorPage: TcxButton
      Top = 254
      TabOrder = 15
      ExplicitTop = 254
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 254
      TabOrder = 16
      ExplicitTop = 254
    end
    inherited btnnextPage: TcxButton
      Top = 254
      TabOrder = 17
      ExplicitTop = 254
    end
    inherited btnLastPage: TcxButton
      Top = 254
      TabOrder = 18
      ExplicitTop = 254
    end
    object CbbCXLX: TcxComboBox [17]
      Left = 843
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 108
    end
    object cbbCXFL: TcxComboBox [18]
      Left = 679
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
