inherited FrameTJFine: TFrameTJFine
  inherited dxLayoutControl2: TdxLayoutControl
    inherited BtnSearch: TcxButton
      Left = 1112
      TabOrder = 10
      ExplicitLeft = 1112
    end
    inherited BtnExport: TcxButton
      Left = 1194
      TabOrder = 11
      ExplicitLeft = 1194
    end
    inherited cxGrid2: TcxGrid
      Width = 1256
      TabOrder = 13
      ExplicitWidth = 1256
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
      Width = 1256
      Align = alClient
      TabOrder = 12
      ExplicitWidth = 1256
    end
    inherited cbbPagesize: TcxComboBox
      TabOrder = 14
    end
    inherited btnFirstPage: TcxButton
      TabOrder = 15
    end
    inherited btnPriorPage: TcxButton
      TabOrder = 16
    end
    inherited edtPageIndex: TcxTextEdit
      TabOrder = 17
    end
    inherited btnnextPage: TcxButton
      TabOrder = 18
    end
    inherited btnLastPage: TcxButton
      TabOrder = 19
    end
    object CbbCXLX: TcxComboBox [17]
      Left = 997
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 108
    end
    object cbbCXFL: TcxComboBox [18]
      Left = 679
      Top = 13
      AutoSize = False
      Properties.OnChange = cbbCXFLPropertiesChange
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 103
    end
    object cmbDeptType: TcxComboBox [19]
      Left = 843
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #22823#38431
        #20013#38431)
      Style.HotTrack = False
      TabOrder = 8
      Text = #22823#38431
      Height = 21
      Width = 93
    end
    inherited dxLayoutItem7: TdxLayoutItem
      Index = 10
    end
    inherited dxLayoutItem8: TdxLayoutItem
      Index = 11
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26597#35810#31867#22411
      Control = CbbCXLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 108
      ControlOptions.ShowBorder = False
      Index = 9
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
    object dxDeptType: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21333#20301#32423#21035
      Control = cmbDeptType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 93
      ControlOptions.ShowBorder = False
      Index = 8
    end
  end
end
