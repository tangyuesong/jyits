inherited FrameSign: TFrameSign
  Width = 400
  Height = 390
  ExplicitWidth = 400
  ExplicitHeight = 390
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 400
    Height = 390
    ExplicitWidth = 400
    ExplicitHeight = 390
    inherited btnSave: TcxButton
      Left = 118
      Top = 337
      TabOrder = 9
      OnClick = btnSaveClick
      ExplicitLeft = 118
      ExplicitTop = 337
    end
    inherited btnExit: TcxButton
      Left = 206
      Top = 337
      TabOrder = 10
      ExplicitLeft = 206
      ExplicitTop = 337
    end
    object cboQSJG: TcxComboBox [2]
      Left = 106
      Top = 156
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '1 '#26377#25928
        '0 '#26080#25928)
      Properties.OnChange = cboQSJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 4
      Height = 25
      Width = 266
    end
    object cboSFLJ: TcxComboBox [3]
      Left = 106
      Top = 188
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '0 '#21542
        '1 '#26159)
      Style.HotTrack = False
      TabOrder = 5
      Height = 25
      Width = 266
    end
    object edtCZSJ: TcxTextEdit [4]
      Left = 106
      Top = 284
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 25
      Width = 266
    end
    object edtCZMJ: TcxComboBox [5]
      Left = 106
      Top = 252
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 25
      Width = 266
    end
    object edtCZDW: TcxComboBox [6]
      Left = 106
      Top = 220
      AutoSize = False
      Properties.OnChange = edtCZDWPropertiesChange
      Style.HotTrack = False
      TabOrder = 6
      Height = 25
      Width = 266
    end
    object edtHPHM: TcxTextEdit [7]
      Left = 106
      Top = 68
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 25
      Width = 266
    end
    object edtYJLX: TcxTextEdit [8]
      Left = 106
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 25
      Width = 266
    end
    object edtGCSJ: TcxTextEdit [9]
      Left = 106
      Top = 128
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Text = 'cxTextEdit1'
      Height = 21
      Width = 266
    end
    object edtGCDD: TcxTextEdit [10]
      Left = 106
      Top = 100
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Text = 'cxTextEdit1'
      Height = 21
      Width = 266
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #31614#25910
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #31614#25910#32467#26524
      Control = cboQSJG
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object liSFLJ: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #26159#21542#20986#35686
      Control = cboSFLJ
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #31614#25910#26102#38388
      Control = edtCZSJ
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #31614#25910#20154#21592
      Control = edtCZMJ
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #31614#25910#21333#20301
      Control = edtCZDW
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object liHPHM: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #21495#29260#21495#30721'      '
      Control = edtHPHM
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liYJLX: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = #39044#35686#31867#22411
      Control = edtYJLX
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 282
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36807#36710#26102#38388
      Control = edtGCSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = edtGCDD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
