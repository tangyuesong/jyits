inherited FrameLogStat: TFrameLogStat
  Width = 1106
  Height = 388
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 1106
    Height = 388
    inherited RDYear: TcxRadioButton
      Left = -35
      ExplicitLeft = -35
    end
    inherited RDMonth: TcxRadioButton
      Left = 10
      ExplicitLeft = 10
    end
    inherited RDDate: TcxRadioButton
      Left = 55
      ExplicitLeft = 55
    end
    inherited DTKSSJ: TcxDateEdit
      Left = 365
      ExplicitLeft = 365
    end
    inherited DTJSSJ: TcxDateEdit
      Left = 497
      ExplicitLeft = 497
    end
    inherited BtnSearch: TcxButton
      Left = 936
      TabOrder = 9
      ExplicitLeft = 936
    end
    inherited BtnExport: TcxButton
      Left = 1018
      TabOrder = 10
      ExplicitLeft = 1018
    end
    inherited CbbYear: TcxComboBox
      Left = 130
      ExplicitLeft = 130
    end
    inherited CbbMonth: TcxComboBox
      Left = 215
      ExplicitLeft = 215
    end
    inherited cxGrid2: TcxGrid
      Left = -35
      Top = 220
      Width = 1128
      Height = 110
      TabOrder = 12
      ExplicitLeft = -35
      ExplicitTop = 220
      ExplicitWidth = 1128
      ExplicitHeight = 110
      inherited ChartView: TcxGridDBChartView
        Categories.DataBinding.FieldName = #36758#21306#22823#38431
        Legend.Position = cppTop
      end
    end
    inherited cxGrid1: TcxGrid
      Left = -35
      Width = 1128
      Height = 168
      TabOrder = 11
      ExplicitLeft = -35
      ExplicitWidth = 1128
      ExplicitHeight = 168
    end
    inherited cbbPagesize: TcxComboBox
      Left = -35
      Top = 337
      TabOrder = 13
      ExplicitLeft = -35
      ExplicitTop = 337
    end
    inherited btnFirstPage: TcxButton
      Left = 42
      Top = 337
      TabOrder = 14
      ExplicitLeft = 42
      ExplicitTop = 337
    end
    inherited btnPriorPage: TcxButton
      Left = 79
      Top = 337
      TabOrder = 15
      ExplicitLeft = 79
      ExplicitTop = 337
    end
    inherited edtPageIndex: TcxTextEdit
      Left = 134
      Top = 337
      TabOrder = 16
      ExplicitLeft = 134
      ExplicitTop = 337
    end
    inherited btnnextPage: TcxButton
      Left = 211
      Top = 337
      TabOrder = 17
      ExplicitLeft = 211
      ExplicitTop = 337
    end
    inherited btnLastPage: TcxButton
      Left = 248
      Top = 337
      TabOrder = 18
      ExplicitLeft = 248
      ExplicitTop = 337
    end
    object cboFunc: TcxComboBox [17]
      Left = 798
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 131
    end
    object cboUser: TcxComboBox [18]
      Left = 637
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 124
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
    end
    inherited dxDTJSSJ: TdxLayoutItem
      Visible = True
    end
    inherited dxLayoutItem7: TdxLayoutItem
      Index = 9
    end
    inherited dxLayoutItem8: TdxLayoutItem
      Index = 10
    end
    inherited dxYEAR: TdxLayoutItem
      CaptionOptions.Text = #24180#20221
    end
    inherited dxLayoutItem12: TdxLayoutItem
      Visible = False
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21151#33021
      Control = cboFunc
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 131
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #20154#21592
      Control = cboUser
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 124
      ControlOptions.ShowBorder = False
      Index = 7
    end
  end
end
