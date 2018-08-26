inherited FrameSpot: TFrameSpot
  inherited dxLayoutControl2: TdxLayoutControl
    inherited DTKSSJ: TcxDateEdit
      Left = 550
      TabOrder = 6
      ExplicitLeft = 550
    end
    inherited DTJSSJ: TcxDateEdit
      Left = 682
      TabOrder = 7
      ExplicitLeft = 682
    end
    inherited BtnSearch: TcxButton
      Left = 792
      TabOrder = 8
      ExplicitLeft = 792
    end
    inherited BtnExport: TcxButton
      Left = 874
      TabOrder = 9
      ExplicitLeft = 874
    end
    inherited CbbYear: TcxComboBox
      Left = 178
      ExplicitLeft = 178
    end
    inherited CbbMonth: TcxComboBox
      Left = 263
      ExplicitLeft = 263
    end
    inherited cxGrid2: TcxGrid
      Width = 936
      TabOrder = 11
      ExplicitWidth = 936
      inherited ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = #36758#21306#22823#38431
        Legend.Position = cppTop
      end
    end
    inherited cxGrid1: TcxGrid
      Width = 936
      TabOrder = 10
      ExplicitWidth = 936
    end
    inherited cbbPagesize: TcxComboBox
      TabOrder = 12
    end
    inherited btnFirstPage: TcxButton
      TabOrder = 13
    end
    inherited btnPriorPage: TcxButton
      TabOrder = 14
    end
    inherited edtPageIndex: TcxTextEdit
      TabOrder = 15
    end
    inherited btnnextPage: TcxButton
      TabOrder = 16
    end
    inherited btnLastPage: TcxButton
      TabOrder = 17
    end
    object cboLevel: TcxComboBox [17]
      Left = 413
      Top = 13
      AutoSize = False
      Properties.Items.Strings = (
        #22823#38431
        #20013#38431
        #27665#35686)
      Style.HotTrack = False
      TabOrder = 5
      Text = #20013#38431
      Height = 21
      Width = 76
    end
    inherited dxLayoutItem1: TdxLayoutItem
      Visible = False
    end
    inherited dxLayoutItem2: TdxLayoutItem
      Visible = False
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Visible = False
    end
    inherited dxDTKSSJ: TdxLayoutItem
      Visible = True
      Index = 6
    end
    inherited dxDTJSSJ: TdxLayoutItem
      Visible = True
      Index = 7
    end
    inherited dxLayoutItem7: TdxLayoutItem
      Index = 8
    end
    inherited dxLayoutItem8: TdxLayoutItem
      Index = 9
    end
    inherited dxYEAR: TdxLayoutItem
      CaptionOptions.Text = #24180#20221
    end
    inherited dxLayoutItem12: TdxLayoutItem
      Visible = False
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #32479#35745#21333#20301
      Control = cboLevel
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 76
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
end
