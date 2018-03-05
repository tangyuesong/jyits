inherited FrameTJZDWFXW: TFrameTJZDWFXW
  Width = 666
  Height = 581
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 666
    Height = 581
    inherited RDYear: TcxRadioButton
      Left = -270
      ExplicitLeft = -270
    end
    inherited RDMonth: TcxRadioButton
      Left = -225
      ExplicitLeft = -225
    end
    inherited RDDate: TcxRadioButton
      Left = -180
      ExplicitLeft = -180
    end
    inherited DTKSSJ: TcxDateEdit
      Left = 100
      ExplicitLeft = 100
    end
    inherited DTJSSJ: TcxDateEdit
      Left = 232
      ExplicitLeft = 232
    end
    inherited BtnSearch: TcxButton
      Left = 496
      TabOrder = 8
      ExplicitLeft = 496
    end
    inherited BtnExport: TcxButton
      Left = 578
      TabOrder = 9
      ExplicitLeft = 578
    end
    inherited CbbYear: TcxComboBox
      Left = -135
      ExplicitLeft = -135
    end
    inherited CbbMonth: TcxComboBox
      Left = -50
      ExplicitLeft = -50
    end
    inherited cxGrid2: TcxGrid
      Left = -270
      Top = 336
      Width = 923
      Height = 187
      TabOrder = 11
      ExplicitLeft = -270
      ExplicitTop = 336
      ExplicitWidth = 923
      ExplicitHeight = 187
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
      Left = -270
      Width = 923
      Height = 284
      TabOrder = 10
      ExplicitLeft = -270
      ExplicitWidth = 923
      ExplicitHeight = 284
      inherited GridView: TcxGridDBTableView
        OnCellDblClick = GridViewCellDblClick
        OptionsView.FooterAutoHeight = False
      end
    end
    inherited cbbPagesize: TcxComboBox
      Left = -270
      Top = 530
      TabOrder = 12
      ExplicitLeft = -270
      ExplicitTop = 530
    end
    inherited btnFirstPage: TcxButton
      Left = -193
      Top = 530
      TabOrder = 13
      ExplicitLeft = -193
      ExplicitTop = 530
    end
    inherited btnPriorPage: TcxButton
      Left = -156
      Top = 530
      TabOrder = 14
      ExplicitLeft = -156
      ExplicitTop = 530
    end
    inherited edtPageIndex: TcxTextEdit
      Left = -101
      Top = 530
      TabOrder = 15
      ExplicitLeft = -101
      ExplicitTop = 530
    end
    inherited btnnextPage: TcxButton
      Left = -24
      Top = 530
      TabOrder = 16
      ExplicitLeft = -24
      ExplicitTop = 530
    end
    inherited btnLastPage: TcxButton
      Left = 13
      Top = 530
      TabOrder = 17
      ExplicitLeft = 13
      ExplicitTop = 530
    end
    object CBBTjlx: TcxComboBox [17]
      Left = 396
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
