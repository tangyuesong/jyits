inherited FrameWmd: TFrameWmd
  Width = 753
  Height = 409
  ExplicitWidth = 753
  ExplicitHeight = 409
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 753
    Height = 409
    HighlightRoot = False
    ExplicitWidth = 753
    ExplicitHeight = 409
    inherited btnSave: TcxButton
      Left = 295
      Top = 356
      TabOrder = 9
      ExplicitLeft = 295
      ExplicitTop = 356
    end
    inherited btnExit: TcxButton
      Left = 383
      Top = 356
      TabOrder = 10
      ExplicitLeft = 383
      ExplicitTop = 356
    end
    object cxDateEdit2: TcxDateEdit [2]
      Left = 192
      Top = 43
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 107
    end
    object cxDateEdit1: TcxDateEdit [3]
      Left = 82
      Top = 43
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 103
    end
    object MemoYY: TcxMemo [4]
      Left = 82
      Top = 71
      Style.HotTrack = False
      TabOrder = 6
      Height = 237
      Width = 643
    end
    object cbbSYFW: TcxComboBox [5]
      Left = 360
      Top = 43
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 73
    end
    object cbbYJ: TcxComboBox [6]
      Left = 82
      Top = 315
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 92
    end
    object edt: TcxTextEdit [7]
      Left = 247
      Top = 315
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 478
    end
    object cbbjc: TcxComboBox [8]
      Left = 494
      Top = 43
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 63
    end
    object edthphm: TcxTextEdit [9]
      Left = 564
      Top = 43
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 49
    end
    object cbbhpzl: TcxComboBox [10]
      Left = 620
      Top = 43
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 105
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #29305#25209#36710#36742#31649#29702
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = cxDateEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      Control = cxDateEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 107
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignVert = avClient
      CaptionOptions.Text = #29305#25209#21407#22240
      Control = MemoYY
      ControlOptions.OriginalHeight = 50
      ControlOptions.OriginalWidth = 558
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = #36866#29992#33539#22260
      Control = cbbSYFW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      ControlOptions.OriginalHeight = 31
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #23457#25209#24847#35265#20154
      Control = edt
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 162
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      CaptionOptions.Text = #23457#25209#32467#26524
      Control = cbbYJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 92
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avClient
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbjc
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 63
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 65
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      Control = cbbhpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 105
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
end
