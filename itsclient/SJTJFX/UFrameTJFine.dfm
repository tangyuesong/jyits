inherited FrameTJFine: TFrameTJFine
  Height = 301
  inherited dxLayoutControl2: TdxLayoutControl
    Height = 301
    inherited RDYear: TcxRadioButton
      Left = -664
      ExplicitLeft = -664
    end
    inherited RDMonth: TcxRadioButton
      Left = -619
      ExplicitLeft = -619
    end
    inherited RDDate: TcxRadioButton
      Left = -574
      ExplicitLeft = -574
    end
    inherited DTKSSJ: TcxDateEdit
      Left = -294
      ExplicitLeft = -294
    end
    inherited DTJSSJ: TcxDateEdit
      Left = -162
      ExplicitLeft = -162
    end
    inherited BtnSearch: TcxButton
      TabOrder = 9
    end
    inherited BtnExport: TcxButton
      TabOrder = 10
    end
    inherited CbbYear: TcxComboBox
      Left = -529
      ExplicitLeft = -529
    end
    inherited CbbMonth: TcxComboBox
      Left = -444
      ExplicitLeft = -444
    end
    inherited cxGrid2: TcxGrid
      Left = -664
      Top = 167
      Width = 1102
      Height = 76
      TabOrder = 12
      ExplicitLeft = -664
      ExplicitTop = 167
      ExplicitWidth = 1102
      ExplicitHeight = 76
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
      Left = -664
      Width = 1102
      Height = 115
      Align = alClient
      TabOrder = 11
      ExplicitLeft = -664
      ExplicitWidth = 1102
      ExplicitHeight = 115
      inherited GridView: TcxGridDBTableView
        OnCellDblClick = GridViewCellDblClick
      end
    end
    inherited cbbPagesize: TcxComboBox
      Left = -664
      Top = 250
      TabOrder = 13
      ExplicitLeft = -664
      ExplicitTop = 250
    end
    inherited btnFirstPage: TcxButton
      Left = -587
      Top = 250
      TabOrder = 14
      ExplicitLeft = -587
      ExplicitTop = 250
    end
    inherited btnPriorPage: TcxButton
      Left = -550
      Top = 250
      TabOrder = 15
      ExplicitLeft = -550
      ExplicitTop = 250
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -495
      Top = 250
      TabOrder = 16
      ExplicitLeft = -495
      ExplicitTop = 250
    end
    inherited btnnextPage: TcxButton
      Left = -418
      Top = 250
      TabOrder = 17
      ExplicitLeft = -418
      ExplicitTop = 250
    end
    inherited btnLastPage: TcxButton
      Left = -381
      Top = 250
      TabOrder = 18
      ExplicitLeft = -381
      ExplicitTop = 250
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
