inherited FrameAddFollow: TFrameAddFollow
  Width = 440
  Height = 250
  ExplicitWidth = 440
  ExplicitHeight = 250
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 440
    Height = 250
    CustomizeFormTabbedView = True
    ExplicitWidth = 440
    ExplicitHeight = 250
    inherited btnSave: TcxButton
      Left = 138
      Top = 197
      TabOrder = 7
      OnClick = btnSaveClick
      ExplicitLeft = 138
      ExplicitTop = 197
    end
    inherited btnExit: TcxButton
      Left = 226
      Top = 197
      TabOrder = 8
      ExplicitLeft = 226
      ExplicitTop = 197
    end
    object EdtRwmc: TcxTextEdit [2]
      Left = 82
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 235
    end
    object DtKssj: TcxDateEdit [3]
      Left = 82
      Top = 64
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 130
    end
    object Edthphm: TcxTextEdit [4]
      Left = 82
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 130
    end
    object EdtMzl: TcxTextEdit [5]
      Left = 366
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Text = '50'
      Height = 21
      Width = 46
    end
    object DtJssj: TcxDateEdit [6]
      Left = 273
      Top = 64
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 139
    end
    object Cbbhpzl: TcxComboBox [7]
      Left = 273
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 139
    end
    object cxCheckBox1: TcxCheckBox [8]
      Left = 28
      Top = 120
      Caption = #25353#36710#36742#21697#29260#21644#39068#33394#26597#25214
      Style.HotTrack = False
      TabOrder = 6
      Transparent = True
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #28155#21152#21516#34892#20998#26512#20219#21153
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #20219#21153#21517#31216
      Control = EdtRwmc
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = #24320#22987#26102#38388
      Control = DtKssj
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 130
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = Edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 130
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = #21629#20013#29575
      Control = EdtMzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 46
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahClient
      CaptionOptions.Text = #32467#26463#26102#38388
      Control = DtJssj
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = Cbbhpzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = cxCheckBox1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 98
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
