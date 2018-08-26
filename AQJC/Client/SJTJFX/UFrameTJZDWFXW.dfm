inherited FrameTJZDWFXW: TFrameTJZDWFXW
  Width = 855
  Height = 460
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 855
    Height = 460
    CustomizeFormTabbedView = True
    inherited RDYear: TcxRadioButton
      Left = -81
      ExplicitLeft = -81
    end
    inherited RDMonth: TcxRadioButton
      Left = -36
      ExplicitLeft = -36
    end
    inherited RDDate: TcxRadioButton
      Left = 9
      ExplicitLeft = 9
    end
    inherited DTKSSJ: TcxDateEdit
      Left = 289
      ExplicitLeft = 289
    end
    inherited DTJSSJ: TcxDateEdit
      Left = 421
      ExplicitLeft = 421
    end
    inherited BtnSearch: TcxButton
      Left = 685
      TabOrder = 8
      ExplicitLeft = 685
    end
    inherited BtnExport: TcxButton
      Left = 767
      TabOrder = 9
      ExplicitLeft = 767
    end
    inherited CbbYear: TcxComboBox
      Left = 54
      ExplicitLeft = 54
    end
    inherited CbbMonth: TcxComboBox
      Left = 139
      ExplicitLeft = 139
    end
    inherited cxGrid2: TcxGrid
      Left = -81
      Top = 263
      Width = 923
      Height = 139
      TabOrder = 11
      ExplicitLeft = -81
      ExplicitTop = 263
      ExplicitWidth = 923
      ExplicitHeight = 139
      inherited ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = #36758#21306#22823#38431
        DataController.DataSource = DataSource1
        Legend.Position = cppNone
        Title.Alignment = cpaCenter
        Title.Position = cppNone
        ToolBox.Border = tbNone
        ToolBox.Visible = tvAlways
        object ChartViewSeries13: TcxGridDBChartSeries
          DataBinding.FieldName = #24635#25968
          DisplayText = #24635#25968
        end
      end
    end
    inherited cxGrid1: TcxGrid
      Left = -81
      Width = 923
      Height = 211
      TabOrder = 10
      ExplicitLeft = -81
      ExplicitWidth = 923
      ExplicitHeight = 211
      inherited GridView: TcxGridDBTableView
        OptionsView.ColumnAutoWidth = True
        OptionsView.FooterAutoHeight = False
      end
    end
    inherited cbbPagesize: TcxComboBox
      Left = -81
      Top = 409
      TabOrder = 12
      ExplicitLeft = -81
      ExplicitTop = 409
    end
    inherited btnFirstPage: TcxButton
      Left = -4
      Top = 409
      TabOrder = 13
      ExplicitLeft = -4
      ExplicitTop = 409
    end
    inherited btnPriorPage: TcxButton
      Left = 33
      Top = 409
      TabOrder = 14
      ExplicitLeft = 33
      ExplicitTop = 409
    end
    inherited edtPageIndex: TcxTextEdit
      Left = 88
      Top = 409
      TabOrder = 15
      ExplicitLeft = 88
      ExplicitTop = 409
    end
    inherited btnnextPage: TcxButton
      Left = 165
      Top = 409
      TabOrder = 16
      ExplicitLeft = 165
      ExplicitTop = 409
    end
    inherited btnLastPage: TcxButton
      Left = 202
      Top = 409
      TabOrder = 17
      ExplicitLeft = 202
      ExplicitTop = 409
    end
    object CBBTjlx: TcxComboBox [17]
      Left = 585
      Top = 13
      AutoSize = False
      Properties.Items.Strings = (
        #29616#22330
        #38750#29616#22330)
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 93
    end
    inherited dxLayoutItem3: TdxLayoutItem
      ControlOptions.OriginalWidth = 1500
    end
    inherited dxLayoutItem7: TdxLayoutItem
      Index = 8
    end
    inherited dxLayoutItem8: TdxLayoutItem
      Index = 9
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #32479#35745#31867#22411
      Control = CBBTjlx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 93
      ControlOptions.ShowBorder = False
      Index = 7
    end
  end
end
