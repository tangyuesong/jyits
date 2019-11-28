inherited DialogTaskEdit: TDialogTaskEdit
  Width = 408
  Height = 454
  AutoSize = False
  ExplicitWidth = 408
  ExplicitHeight = 454
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 408
    Height = 454
    Align = alClient
    ExplicitWidth = 408
    ExplicitHeight = 454
    object cmbMonth: TcxComboBox [0]
      Left = 82
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 298
    end
    object cmbDwmc: TcxComboBox [1]
      Left = 82
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 298
    end
    inherited btnSave: TcxButton
      Left = 122
      Top = 416
      TabOrder = 2
      ExplicitLeft = 122
      ExplicitTop = 416
    end
    inherited btnExit: TcxButton
      Left = 210
      Top = 416
      TabOrder = 3
      ExplicitLeft = 210
      ExplicitTop = 416
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #20219#21153#20449#24687
      ScrollOptions.Vertical = smAuto
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup5
      Index = 0
    end
    inherited dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #26376#20221
      Control = cmbMonth
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21333#20301#21517#31216
      Control = cmbDwmc
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 168
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
  end
end
