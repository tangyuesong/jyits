inherited FrameTXGL: TFrameTXGL
  Width = 460
  Height = 265
  ExplicitWidth = 460
  ExplicitHeight = 265
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 460
    Height = 265
    ExplicitWidth = 460
    ExplicitHeight = 265
    inherited btnSave: TcxButton
      Left = 187
      Top = 212
      TabOrder = 8
      OnClick = btnSaveClick
      ExplicitLeft = 187
      ExplicitTop = 212
    end
    inherited btnExit: TcxButton
      Left = 275
      Top = 212
      TabOrder = 9
      ExplicitLeft = 275
      ExplicitTop = 212
    end
    object edtjdcsyr: TcxTextEdit [2]
      Left = 106
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 326
    end
    object cbbzsxxdz: TcxComboBox [3]
      Left = 106
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      OnKeyPress = cbbzsxxdzKeyPress
      Height = 21
      Width = 326
    end
    object edthphm: TcxTextEdit [4]
      Left = 192
      Top = 36
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 1
      OnKeyPress = edthphmKeyPress
      Height = 21
      Width = 89
    end
    object cbbHPZL: TcxComboBox [5]
      Left = 342
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      OnKeyPress = cbbHPZLKeyPress
      Height = 21
      Width = 90
    end
    object cbbJC: TcxComboBox [6]
      Left = 106
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      OnKeyPress = cbbJCKeyPress
      Height = 21
      Width = 79
    end
    object cbbtxyy: TcxComboBox [7]
      Left = 106
      Top = 120
      AutoSize = False
      Properties.Items.Strings = (
        #22320#22336#19981#35814
        #26080#20154#31614#25910)
      Style.HotTrack = False
      TabOrder = 5
      Text = #22320#22336#19981#35814
      Height = 21
      Width = 326
    end
    object edtbz: TcxTextEdit [8]
      Left = 106
      Top = 148
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 326
    end
    object chk1: TcxCheckBox [9]
      Left = 110
      Top = 212
      Caption = #32487#32493#28155#21152
      State = cbsChecked
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 7
      Transparent = True
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #36864#20449#31649#29702
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Index = 1
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #26426#21160#36710#25152#26377#20154
      Control = edtjdcsyr
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #20303#23487#35814#32454#22320#22336
      Control = cbbzsxxdz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 89
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cbbHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 79
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #36864#20449#21407#22240
      Control = cbbtxyy
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #22791#27880
      Control = edtbz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup4
      AlignVert = avClient
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = chk1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 70
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
