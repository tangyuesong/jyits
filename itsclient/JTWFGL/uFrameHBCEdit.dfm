inherited FrameHBCEdit: TFrameHBCEdit
  Width = 420
  Height = 320
  ExplicitWidth = 420
  ExplicitHeight = 320
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 420
    Height = 320
    CustomizeFormTabbedView = True
    ExplicitWidth = 420
    ExplicitHeight = 320
    inherited btnSave: TcxButton
      Left = 128
      Top = 271
      TabOrder = 14
      ExplicitLeft = 128
      ExplicitTop = 271
    end
    inherited btnExit: TcxButton
      Left = 216
      Top = 271
      TabOrder = 15
      ExplicitLeft = 216
      ExplicitTop = 271
    end
    object edtFDJH: TcxTextEdit [2]
      Left = 74
      Top = 116
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 127
    end
    object edtDJRQ: TcxTextEdit [3]
      Left = 74
      Top = 144
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 127
    end
    object edtSJHM: TcxTextEdit [4]
      Left = 262
      Top = 200
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 12
      Height = 21
      Width = 138
    end
    object edtCLPP: TcxTextEdit [5]
      Left = 74
      Top = 88
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 127
    end
    object edtCLXH: TcxTextEdit [6]
      Left = 262
      Top = 88
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 138
    end
    object edtCLSBDM: TcxTextEdit [7]
      Left = 262
      Top = 116
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 138
    end
    object edtYXQX: TcxTextEdit [8]
      Left = 262
      Top = 144
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 138
    end
    object edtHBDJ: TcxTextEdit [9]
      Left = 262
      Top = 172
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 138
    end
    object edtBFQX: TcxTextEdit [10]
      Left = 74
      Top = 172
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 127
    end
    object edtSYR: TcxTextEdit [11]
      Left = 74
      Top = 200
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 127
    end
    object edtZSDZ: TcxTextEdit [12]
      Left = 74
      Top = 230
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 326
    end
    object cbbSF: TcxComboBox [13]
      Left = 74
      Top = 47
      AutoSize = False
      Properties.Items.Strings = (
        #31908)
      Style.HotTrack = False
      TabOrder = 0
      Text = #31908
      Height = 21
      Width = 65
    end
    object edtHPHM: TcxTextEdit [14]
      Left = 146
      Top = 47
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      OnKeyDown = edtHPHMKeyDown
      Height = 21
      Width = 55
    end
    object cbbHPZL: TcxComboBox [15]
      Left = 262
      Top = 47
      AutoSize = False
      Properties.Items.Strings = (
        '01:'#22823#22411#27773#36710
        '02:'#23567#22411#27773#36710)
      Style.HotTrack = False
      TabOrder = 7
      Text = '01:'#22823#22411#27773#36710
      Height = 21
      Width = 138
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.AlignHorz = taCenter
      CaptionOptions.Text = #40644#26631#36710
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Index = 3
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Index = 2
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #21457#21160#26426#21495
      Control = edtFDJH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #30331#35760#26085#26399
      Control = edtDJRQ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #25163#26426#21495#30721
      Control = edtSJHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
    object dxLayoutSeparatorItem3: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36710#36742#21697#29260
      Control = edtCLPP
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #36710#36742#22411#21495
      Control = edtCLXH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #36710' '#26550' '#21495
      Control = edtCLSBDM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #26377#25928#26399#38480
      Control = edtYXQX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #29615#20445#31561#32423
      Control = edtHBDJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #25253#24223#26399#38480
      Control = edtBFQX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #25152' '#26377' '#20154
      Control = edtSYR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #20303#25152#22320#22336
      Control = edtZSDZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cbbSF
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 65
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup7
      AlignHorz = ahClient
      Control = edtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 55
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cbbHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 130
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
