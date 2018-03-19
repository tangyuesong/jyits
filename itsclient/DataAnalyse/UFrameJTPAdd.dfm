inherited FrameJTPAdd: TFrameJTPAdd
  Width = 550
  Height = 280
  AutoSize = False
  ExplicitWidth = 550
  ExplicitHeight = 280
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 550
    Height = 280
    Align = alClient
    ExplicitWidth = 550
    ExplicitHeight = 280
    inherited btnSave: TcxButton
      Left = 193
      Top = 227
      TabOrder = 8
      OnClick = btnSaveClick
      ExplicitLeft = 193
      ExplicitTop = 227
    end
    inherited btnExit: TcxButton
      Left = 281
      Top = 227
      TabOrder = 9
      ExplicitLeft = 281
      ExplicitTop = 227
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
      Top = 120
      Style.HotTrack = False
      TabOrder = 7
      Height = 81
      Width = 440
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
    object edtKDBH: TcxTextEdit [8]
      Left = 82
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      OnKeyPress = edtKDBHKeyPress
      Height = 21
      Width = 407
    end
    object btnKDBH: TcxButton [9]
      Left = 496
      Top = 92
      Width = 21
      Height = 21
      Caption = '...'
      OptionsImage.ImageIndex = 56
      TabOrder = 6
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
      Control = tmEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36861#36394#35828#26126
      Control = edtBZ
      ControlOptions.OriginalHeight = 81
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 3
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
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #36861#36394#21345#21475
      Control = edtKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 407
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnKDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 21
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
