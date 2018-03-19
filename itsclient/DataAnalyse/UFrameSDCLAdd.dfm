inherited FrameSDCLAdd: TFrameSDCLAdd
  Width = 558
  Height = 275
  AutoSize = False
  ExplicitWidth = 558
  ExplicitHeight = 275
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 558
    Height = 275
    Align = alClient
    AutoSize = True
    ExplicitLeft = 80
    ExplicitWidth = 558
    ExplicitHeight = 275
    inherited btnSave: TcxButton
      Left = 197
      Top = 222
      TabOrder = 9
      OnClick = btnSaveClick
      ExplicitLeft = 197
      ExplicitTop = 222
    end
    inherited btnExit: TcxButton
      Left = 285
      Top = 222
      TabOrder = 10
      ExplicitLeft = 285
      ExplicitTop = 222
    end
    object tmBegin: TcxTimeEdit [2]
      Left = 82
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 86
    end
    object tmEnd: TcxTimeEdit [3]
      Left = 187
      Top = 64
      AutoSize = False
      EditValue = 0.999988425925926d
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 86
    end
    object edtBZ: TcxMemo [4]
      Left = 82
      Top = 120
      Style.HotTrack = False
      TabOrder = 8
      Height = 75
      Width = 447
    end
    object edtSJ: TcxTextEdit [5]
      Left = 334
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 195
    end
    object edtFZJG: TcxTextEdit [6]
      Left = 82
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 86
    end
    object cbbHPZL: TcxComboBox [7]
      Left = 229
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 131
    end
    object edtKDBH: TcxTextEdit [8]
      Left = 82
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      OnKeyPress = edtKDBHKeyPress
      Height = 21
      Width = 415
    end
    object btnKDBH: TcxButton [9]
      Left = 504
      Top = 92
      Width = 21
      Height = 21
      Caption = '...'
      OptionsImage.ImageIndex = 56
      TabOrder = 7
      OnClick = btnKDBHClick
    end
    object cbbSource: TcxComboBox [10]
      Left = 421
      Top = 36
      AutoSize = False
      Properties.Items.Strings = (
        #20551#22871#29260#36710
        #20840#37096)
      Style.HotTrack = False
      TabOrder = 2
      Text = #20551#22871#29260#36710
      Height = 21
      Width = 107
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #36861#36394#20449#24687#37319#38598
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
      Offsets.Left = 1
      Control = tmEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahLeft
      CaptionOptions.Text = #36861#36394#35828#26126
      Control = edtBZ
      ControlOptions.OriginalHeight = 75
      ControlOptions.OriginalWidth = 447
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #30701#20449#25163#26426
      Control = edtSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 195
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #21457#35777#26426#20851
      Control = edtFZJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cbbHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 131
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = edtKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 415
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      AlignVert = avBottom
      CaptionOptions.Visible = False
      Control = btnKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignVert = avClient
      CaptionOptions.Text = #36710#36742#33539#22260
      Control = cbbSource
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 107
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
