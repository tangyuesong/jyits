inherited FrameTJWF: TFrameTJWF
  inherited dxLayoutControl2: TdxLayoutControl
    inherited RDYear: TcxRadioButton
      Left = -331
      ExplicitLeft = -331
    end
    inherited RDMonth: TcxRadioButton
      Left = -286
      ExplicitLeft = -286
    end
    inherited RDDate: TcxRadioButton
      Left = -241
      ExplicitLeft = -241
    end
    inherited DTKSSJ: TcxDateEdit
      Left = 39
      ExplicitLeft = 39
    end
    inherited DTJSSJ: TcxDateEdit
      Left = 171
      ExplicitLeft = 171
    end
    inherited BtnSearch: TcxButton
      Left = 281
      ExplicitLeft = 281
    end
    inherited BtnExport: TcxButton
      Left = 363
      ExplicitLeft = 363
    end
    inherited CbbYear: TcxComboBox
      Left = -196
      ExplicitLeft = -196
    end
    inherited CbbMonth: TcxComboBox
      Left = -111
      ExplicitLeft = -111
    end
    inherited cxGrid2: TcxGrid
      Left = -331
      ExplicitLeft = -331
      inherited ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = 'CJJGMC'
        DataController.DataSource = DataSource1
        Legend.Position = cppTop
        object ChartViewSeries1: TcxGridDBChartSeries
          DataBinding.FieldName = #38750#29616#22330#36829#27861#23447#25968
          DisplayText = #38750#29616#22330#36829#27861#23447#25968
        end
        object ChartViewSeries2: TcxGridDBChartSeries
          DataBinding.FieldName = #31616#26131#36829#27861#23447#25968
          DisplayText = #31616#26131#36829#27861#23447#25968
        end
        object ChartViewSeries3: TcxGridDBChartSeries
          DataBinding.FieldName = #24378#21046#36829#27861#23447#25968
          DisplayText = #24378#21046#36829#27861#23447#25968
        end
      end
    end
    inherited cxGrid1: TcxGrid
      Left = -331
      ExplicitLeft = -331
      inherited GridView: TcxGridDBTableView
        OnCellDblClick = GridViewCellDblClick
      end
    end
    inherited cbbPagesize: TcxComboBox
      Left = -331
      ExplicitLeft = -331
    end
    inherited btnFirstPage: TcxButton
      Left = -254
      ExplicitLeft = -254
    end
    inherited btnPriorPage: TcxButton
      Left = -217
      ExplicitLeft = -217
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -162
      ExplicitLeft = -162
    end
    inherited btnnextPage: TcxButton
      Left = -85
      ExplicitLeft = -85
    end
    inherited btnLastPage: TcxButton
      Left = -48
      ExplicitLeft = -48
    end
  end
  object NetHTTPClient1: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    AllowCookies = True
    HandleRedirects = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 208
    Top = 136
  end
end
