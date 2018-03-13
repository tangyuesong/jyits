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
    ExplicitWidth = 750
    ExplicitHeight = 425
    inherited btnSave: TcxButton
      Left = 197
      Top = 212
      TabOrder = 7
      OnClick = btnSaveClick
      ExplicitLeft = 197
      ExplicitTop = 212
    end
    inherited btnExit: TcxButton
      Left = 285
      Top = 212
      TabOrder = 8
      ExplicitLeft = 285
      ExplicitTop = 212
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
      Top = 92
      Style.HotTrack = False
      TabOrder = 6
      Height = 100
      Width = 439
    end
    object edtFZJG: TcxTextEdit [5]
      Left = 82
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 86
    end
    object edtKDBH: TcxTextEdit [6]
      Left = 229
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      OnKeyPress = edtKDBHKeyPress
      Height = 21
      Width = 260
    end
    object edtSJ: TcxTextEdit [7]
      Left = 334
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 188
    end
    object btnKDBH: TcxButton [8]
      Left = 496
      Top = 36
      Width = 21
      Height = 21
      Caption = '...'
      OptionsImage.ImageIndex = 56
      TabOrder = 2
      OnClick = btnKDBHClick
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
      CaptionOptions.Text = #21457#35777#26426#20851
      Control = edtFZJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = edtKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 260
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
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = btnKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
