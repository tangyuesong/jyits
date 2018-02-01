inherited FrameWFGZ: TFrameWFGZ
  Width = 450
  Height = 250
  ExplicitWidth = 450
  ExplicitHeight = 250
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 450
    Height = 250
    ExplicitWidth = 450
    ExplicitHeight = 250
    inherited btnSave: TcxButton
      Left = 143
      Top = 201
      TabOrder = 3
      ExplicitLeft = 143
      ExplicitTop = 201
    end
    inherited btnExit: TcxButton
      Left = 231
      Top = 201
      TabOrder = 4
      ExplicitLeft = 231
      ExplicitTop = 201
    end
    object EdtZSXXDZ: TcxTextEdit [2]
      Left = 74
      Top = 75
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 356
    end
    object EdtSYR: TcxTextEdit [3]
      Left = 74
      Top = 103
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 356
    end
    object Edtyzbm: TcxTextEdit [4]
      Left = 74
      Top = 47
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 356
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #36829#27861#21578#30693#20462#25913
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      Index = 1
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Index = 3
    end
    inherited dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35814#32454#20303#22336
      Control = EdtZSXXDZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #25152#26377#20154
      Control = EdtSYR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #37038#31665#22320#22336
      Control = Edtyzbm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 356
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
