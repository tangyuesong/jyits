inherited FrameNewWF: TFrameNewWF
  Width = 908
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 908
    inherited cxGrid2: TcxGrid
      Top = 180
      Width = 882
      Height = 84
      ExplicitTop = 180
      ExplicitWidth = 882
      ExplicitHeight = 84
      inherited ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = 'WFXW'
        DataController.DataSource = DataSource1
        Legend.Position = cppTop
        object ChartViewSeries1: TcxGridDBChartSeries
          DataBinding.FieldName = #19978#26376
          DisplayText = #19978#26376
        end
        object ChartViewSeries2: TcxGridDBChartSeries
          DataBinding.FieldName = #21516#26376
          DisplayText = #21516#26376
        end
        object ChartViewSeries3: TcxGridDBChartSeries
          DataBinding.FieldName = #19978#24180#21516#26376
          DisplayText = #19978#24180#21516#26376
        end
      end
    end
    inherited cxGrid1: TcxGrid
      Width = 882
      Height = 128
      ExplicitWidth = 882
      ExplicitHeight = 128
    end
    inherited cbbPagesize: TcxComboBox
      Top = 271
      ExplicitTop = 271
    end
    inherited btnFirstPage: TcxButton
      Top = 271
      ExplicitTop = 271
    end
    inherited btnPriorPage: TcxButton
      Top = 271
      ExplicitTop = 271
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 271
      ExplicitTop = 271
    end
    inherited btnnextPage: TcxButton
      Top = 271
      ExplicitTop = 271
    end
    inherited btnLastPage: TcxButton
      Top = 271
      ExplicitTop = 271
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Visible = False
    end
  end
end
