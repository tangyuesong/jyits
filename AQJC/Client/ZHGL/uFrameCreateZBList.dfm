inherited FrameCreateZBList: TFrameCreateZBList
  Width = 353
  Height = 248
  AutoSize = False
  ExplicitWidth = 353
  ExplicitHeight = 248
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 353
    Height = 248
    Align = alClient
    ExplicitWidth = 353
    ExplicitHeight = 225
    inherited btnSave: TcxButton
      Left = 95
      Top = 195
      TabOrder = 5
      OnClick = btnSaveClick
      ExplicitLeft = 95
      ExplicitTop = 195
    end
    inherited btnExit: TcxButton
      Left = 183
      Top = 195
      TabOrder = 6
      ExplicitLeft = 183
      ExplicitTop = 195
    end
    object cboLD: TcxComboBox [2]
      Left = 82
      Top = 64
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 243
    end
    object cboMJ: TcxComboBox [3]
      Left = 82
      Top = 92
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 243
    end
    object cboXJ: TcxComboBox [4]
      Left = 82
      Top = 120
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 243
    end
    object edtDays: TcxTextEdit [5]
      Left = 82
      Top = 148
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 243
    end
    object cbbDWMC: TcxComboBox [6]
      Left = 82
      Top = 36
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnChange = cbbDWMCPropertiesChange
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 243
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #20540#29677#37197#32622
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #39046#23548#29677#27425
      Control = cboLD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #27665#35686#29677#27425
      Control = cboMJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21327#35686#29677#27425
      Control = cboXJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #29983#25104#22825#25968
      Control = edtDays
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21333#20301#21517#31216
      Control = cbbDWMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 243
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
