inherited FrameTJNewVeh: TFrameTJNewVeh
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid2: TcxGrid
      inherited ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = 'HPZL'
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
    inherited dxLayoutItem4: TdxLayoutItem
      Visible = False
    end
  end
end
