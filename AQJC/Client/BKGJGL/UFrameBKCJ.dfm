inherited FrameBKCJ: TFrameBKCJ
  Width = 750
  Height = 423
  AutoSize = False
  ExplicitWidth = 750
  ExplicitHeight = 423
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 750
    Height = 425
    AutoSize = True
    ExplicitWidth = 750
    ExplicitHeight = 425
    inherited btnSave: TcxButton
      Left = 344
      Top = 372
      TabOrder = 16
      OnClick = btnSaveClick
      ExplicitLeft = 344
      ExplicitTop = 372
    end
    inherited btnExit: TcxButton
      Left = 432
      Top = 372
      TabOrder = 17
      ExplicitLeft = 432
      ExplicitTop = 372
    end
    object cbbCXYJ: TcxComboBox [2]
      Left = 97
      Top = 316
      AutoSize = False
      Properties.Items.Strings = (
        #25235#33719
        #24050#22788#29702)
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 82
    end
    object edtCXYJ: TcxTextEdit [3]
      Left = 186
      Top = 316
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 521
    end
    object cbbSPYJ: TcxComboBox [4]
      Left = 97
      Top = 250
      AutoSize = False
      Properties.Items.Strings = (
        #21516#24847
        #19981#21516#24847)
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 82
    end
    object edtSPYJ: TcxTextEdit [5]
      Left = 186
      Top = 250
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 12
      Height = 21
      Width = 521
    end
    object cbbJC: TcxComboBox [6]
      Left = 87
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 86
    end
    object edthphm: TcxTextEdit [7]
      Left = 191
      Top = 36
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 86
    end
    object cbbHPZL: TcxComboBox [8]
      Left = 343
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 118
    end
    object tmBegin: TcxTimeEdit [9]
      Left = 87
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 86
    end
    object tmEnd: TcxTimeEdit [10]
      Left = 191
      Top = 92
      AutoSize = False
      EditValue = 0.999988425925926d
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 86
    end
    object edtBZ: TcxMemo [11]
      Left = 87
      Top = 120
      Lines.Strings = (
        'cxMemo1')
      Style.HotTrack = False
      TabOrder = 10
      Height = 100
      Width = 635
    end
    object cboBKLX: TcxComboBox [12]
      Left = 527
      Top = 36
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 195
    end
    object edtSJ: TcxTextEdit [13]
      Left = 343
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 379
    end
    object chk1: TcxCheckBox [14]
      Left = 243
      Top = 372
      Caption = #26159#21542#32487#32493#28155#21152
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 15
      Transparent = True
    end
    object edtclpp1: TcxTextEdit [15]
      Left = 87
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 190
    end
    object cbbCllx: TcxComboBox [16]
      Left = 343
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 118
    end
    object cbbCsys: TcxComboBox [17]
      Left = 527
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 195
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = #24067#25511#37319#38598
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Text = #22270#29255#39044#35272
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Index = 4
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Index = 1
    end
    inherited dxLayoutItem4: TdxLayoutItem
      Index = 2
    end
    inherited dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Index = 3
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #25764#38144#21407#22240
      Control = cbbCXYJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 82
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      Control = edtCXYJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #23457#25209#24847#35265
      Control = cbbSPYJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 82
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      AlignVert = avTop
      Control = edtSPYJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #21495#29260#21495#30721'*'
      Control = cbbJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      AlignVert = avClient
      CaptionOptions.Text = ' '
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 86
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      CaptionOptions.Text = #21495#29260#31181#31867'*'
      Control = cbbHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 118
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahLeft
      AlignVert = avTop
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
      CaptionOptions.Text = #30003#35831#21407#22240
      Control = edtBZ
      ControlOptions.OriginalHeight = 100
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxlytcrtdgrp1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #24067#25511#31867#22411'*'
      Control = cboBKLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 118
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup8
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #30701#20449#25163#26426
      Control = edtSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 118
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = chk1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 94
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #20013#25991#21697#29260'*'
      Control = edtclpp1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 190
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36710#36742#31867#22411'*'
      Control = cbbCllx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 118
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = #36710#36523#39068#33394'*'
      Control = cbbCsys
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 188
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = '*.jpg'
    Filter = '*.jpg|*.jpg'
    Left = 384
    Top = 104
  end
end
