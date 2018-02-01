inherited FrameRYEdit: TFrameRYEdit
  Width = 345
  Height = 279
  AutoSize = False
  ExplicitWidth = 345
  ExplicitHeight = 279
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 345
    Height = 279
    Align = alClient
    ExplicitWidth = 345
    ExplicitHeight = 257
    inherited btnSave: TcxButton
      Left = 91
      Top = 226
      TabOrder = 7
      OnClick = btnSaveClick
      ExplicitLeft = 91
      ExplicitTop = 226
    end
    inherited btnExit: TcxButton
      Left = 179
      Top = 226
      TabOrder = 8
      ExplicitLeft = 179
      ExplicitTop = 226
    end
    object cbbBCLB: TcxComboBox [2]
      Left = 82
      Top = 36
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #39046#23548
        #27665#35686
        #21327#35686)
      Style.HotTrack = False
      TabOrder = 0
      Text = #27665#35686
      Height = 21
      Width = 235
    end
    object edtBCBH: TcxTextEdit [3]
      Left = 82
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 235
    end
    object edtZBRY: TcxTextEdit [4]
      Left = 82
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 235
    end
    object edtRYDH: TcxTextEdit [5]
      Left = 82
      Top = 120
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 235
    end
    object cbZLZB: TcxCheckBox [6]
      Left = 166
      Top = 181
      Caption = #21608#20845#20540#29677
      State = cbsChecked
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = ''
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 5
      Transparent = True
    end
    object cbZRZB: TcxCheckBox [7]
      Left = 245
      Top = 181
      Caption = #21608#26085#20540#29677
      State = cbsChecked
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = ''
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 6
      Transparent = True
    end
    object cxLabel1: TcxLabel [8]
      Left = 110
      Top = 148
      Caption = #25552#31034#65306#22810#20010#25163#26426#21495#30721#20043#38388#29992#20998#21495'(;)'#20998#38548
      Style.HotTrack = False
      Transparent = True
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #29677#27425#20449#24687
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avBottom
    end
    inherited dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      AlignHorz = ahClient
      AlignVert = avBottom
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #29677#27425#31867#21035
      Control = cbbBCLB
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #29677#27425#32534#21495
      Control = edtBCBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #20540#29677#20154#21592
      Control = edtZBRY
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #20154#21592#30005#35805
      Control = edtRYDH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignVert = avBottom
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = cbZLZB
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 72
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxCheckBox2'
      CaptionOptions.Visible = False
      Control = cbZRZB
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 72
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxLabel1'
      CaptionOptions.Visible = False
      Control = cxLabel1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 207
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
end
