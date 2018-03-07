inherited FrameJTPAdd: TFrameJTPAdd
  Width = 547
  Height = 261
  AutoSize = False
  ExplicitWidth = 547
  ExplicitHeight = 261
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 750
    Height = 425
    AutoSize = True
    ExplicitWidth = 750
    ExplicitHeight = 425
    inherited btnSave: TcxButton
      Left = 193
      Top = 212
      TabOrder = 6
      OnClick = btnSaveClick
      ExplicitLeft = 193
      ExplicitTop = 212
    end
    inherited btnExit: TcxButton
      Left = 281
      Top = 212
      TabOrder = 7
      ExplicitLeft = 281
      ExplicitTop = 212
    end
    object tmBegin: TcxTimeEdit [2]
      Left = 82
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 86
    end
    object tmEnd: TcxTimeEdit [3]
      Left = 186
      Top = 64
      AutoSize = False
      EditValue = 0.999988425925926d
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 86
    end
    object edtBZ: TcxMemo [4]
      Left = 82
      Top = 92
      Style.HotTrack = False
      TabOrder = 5
      Height = 100
      Width = 439
    end
    object edtclpp1: TcxTextEdit [5]
      Left = 82
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 190
    end
    object cbbCsys: TcxComboBox [6]
      Left = 333
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 188
    end
    object edtSJ: TcxTextEdit [7]
      Left = 333
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 188
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avParentManaged
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #24067#25511#37319#38598
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Text = #22270#29255#39044#35272
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #30701#20449#26102#38388
      Control = tmBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = '-'
      Control = tmEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahLeft
      CaptionOptions.Text = #24067#25511#35828#26126
      Control = edtBZ
      ControlOptions.OriginalHeight = 100
      ControlOptions.OriginalWidth = 439
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #21697#29260#22411#21495
      Control = edtclpp1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 190
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36710#36523#39068#33394
      Control = cbbCsys
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 188
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #30701#20449#25163#26426
      Control = edtSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 188
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
