inherited FrameTJZDWFXW: TFrameTJZDWFXW
  Width = 762
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 762
    inherited RDYear: TcxRadioButton
      Left = -328
      ExplicitLeft = -328
    end
    inherited RDMonth: TcxRadioButton
      Left = -283
      ExplicitLeft = -283
    end
    inherited RDDate: TcxRadioButton
      Left = -238
      ExplicitLeft = -238
    end
    inherited DTKSSJ: TcxDateEdit
      Left = 42
      ExplicitLeft = 42
    end
    inherited DTJSSJ: TcxDateEdit
      Left = 174
      ExplicitLeft = 174
    end
    inherited BtnSearch: TcxButton
      Left = 592
      TabOrder = 9
      ExplicitLeft = 592
    end
    inherited BtnExport: TcxButton
      Left = 674
      TabOrder = 10
      ExplicitLeft = 674
    end
    inherited CbbYear: TcxComboBox
      Left = -193
      ExplicitLeft = -193
    end
    inherited CbbMonth: TcxComboBox
      Left = -108
      ExplicitLeft = -108
    end
    inherited cxGrid2: TcxGrid
      Left = -328
      Width = 1077
      TabOrder = 12
      ExplicitLeft = -328
      ExplicitWidth = 1077
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
      Left = -328
      Width = 1077
      TabOrder = 11
      ExplicitLeft = -328
      ExplicitWidth = 1077
      inherited GridView: TcxGridDBTableView
        OptionsView.ColumnAutoWidth = True
        OptionsView.FooterAutoHeight = False
      end
    end
    inherited cbbPagesize: TcxComboBox
      Left = -328
      TabOrder = 13
      ExplicitLeft = -328
    end
    inherited btnFirstPage: TcxButton
      Left = -251
      TabOrder = 14
      ExplicitLeft = -251
    end
    inherited btnPriorPage: TcxButton
      Left = -214
      TabOrder = 15
      ExplicitLeft = -214
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -159
      TabOrder = 16
      ExplicitLeft = -159
    end
    inherited btnnextPage: TcxButton
      Left = -82
      TabOrder = 17
      ExplicitLeft = -82
    end
    inherited btnLastPage: TcxButton
      Left = -45
      TabOrder = 18
      ExplicitLeft = -45
    end
    object cmbDeptType: TcxComboBox [17]
      Left = 338
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #22823#38431
        #20013#38431)
      Style.HotTrack = False
      TabOrder = 7
      Text = #22823#38431
      Height = 21
      Width = 93
    end
    object CBBTjlx: TcxComboBox [18]
      Left = 492
      Top = 13
      AutoSize = False
      Properties.Items.Strings = (
        #29616#22330
        #38750#29616#22330)
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 93
    end
    inherited dxLayoutItem3: TdxLayoutItem
      ControlOptions.OriginalWidth = 1500
    end
    inherited dxLayoutItem7: TdxLayoutItem
      Index = 9
    end
    inherited dxLayoutItem8: TdxLayoutItem
      Index = 10
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21333#20301#32423#21035
      Control = cmbDeptType
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 93
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #32479#35745#31867#22411
      Control = CBBTjlx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 93
      ControlOptions.ShowBorder = False
      Index = 8
    end
  end
end
