inherited FrameAddNocturnal: TFrameAddNocturnal
  Width = 385
  Height = 209
  ExplicitWidth = 385
  ExplicitHeight = 209
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 385
    Height = 209
    ExplicitWidth = 385
    ExplicitHeight = 209
    inherited btnSave: TcxButton
      Left = 111
      Top = 156
      TabOrder = 5
      OnClick = btnSaveClick
      ExplicitLeft = 111
      ExplicitTop = 156
    end
    inherited btnExit: TcxButton
      Left = 199
      Top = 156
      TabOrder = 6
      ExplicitLeft = 199
      ExplicitTop = 156
    end
    object deBegin: TcxDateEdit [2]
      Left = 82
      Top = 92
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 107
    end
    object teBegin: TcxTimeEdit [3]
      Left = 82
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 107
    end
    object deEnd: TcxDateEdit [4]
      Left = 250
      Top = 92
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 107
    end
    object teEnd: TcxTimeEdit [5]
      Left = 250
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 107
    end
    object edtTask: TcxTextEdit [6]
      Left = 82
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 275
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #28155#21152#26172#20239#22812#20986#20219#21153
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
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #24320#22987#26085#26399
      Control = deBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #22825#20142#26102#38388
      Control = teBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #32467#26463#26085#26399
      Control = deEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #22825#40657#26102#38388
      Control = teEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #20219#21153#21517#31216
      Control = edtTask
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
