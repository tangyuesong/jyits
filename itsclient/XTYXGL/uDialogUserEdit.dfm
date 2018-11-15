inherited fDialogUserEdit: TfDialogUserEdit
  Width = 409
  Height = 527
  AutoSize = False
  Visible = False
  ExplicitWidth = 409
  ExplicitHeight = 527
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 409
    Height = 527
    Align = alClient
    ShowDesignSelectors = False
    HighlightRoot = False
    ExplicitWidth = 409
    ExplicitHeight = 527
    inherited btnSave: TcxButton
      Left = 123
      Top = 474
      TabOrder = 16
      ExplicitLeft = 123
      ExplicitTop = 474
    end
    inherited btnExit: TcxButton
      Left = 211
      Top = 474
      TabOrder = 17
      ExplicitLeft = 211
      ExplicitTop = 474
    end
    object edtYhbh: TcxTextEdit [2]
      Left = 94
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 287
    end
    object edtYhxm: TcxTextEdit [3]
      Left = 94
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 287
    end
    object edtYhmm: TcxTextEdit [4]
      Left = 94
      Top = 120
      AutoSize = False
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      Style.HotTrack = False
      TabOrder = 3
      Text = '88888888'
      Height = 21
      Width = 287
    end
    object edtSfzh: TcxTextEdit [5]
      Left = 94
      Top = 176
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 287
    end
    object edtSjhm: TcxTextEdit [6]
      Left = 94
      Top = 204
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 287
    end
    object cbbYhzw: TcxComboBox [7]
      Left = 94
      Top = 148
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 287
    end
    object edtMac: TcxTextEdit [8]
      Left = 94
      Top = 232
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 287
    end
    object edtQsip: TcxTextEdit [9]
      Left = 10000
      Top = 10000
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 18
      Visible = False
      Height = 21
      Width = 121
    end
    object cbbSH: TcxComboBox [10]
      Left = 94
      Top = 344
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        #26080
        #22797#26680
        #23457#26680)
      Style.HotTrack = False
      TabOrder = 12
      Text = #26080
      Height = 21
      Width = 287
    end
    object edtJsip: TcxTextEdit [11]
      Left = 10000
      Top = 10000
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 19
      Visible = False
      Height = 21
      Width = 121
    end
    object dtValidDate: TcxDateEdit [12]
      Left = 94
      Top = 260
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 287
    end
    object dtPasswordValidDate: TcxDateEdit [13]
      Left = 94
      Top = 288
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 287
    end
    object dtLoginTimeBegin: TcxTimeEdit [14]
      Left = 94
      Top = 316
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 164
    end
    object dtLoginTimeEnd: TcxTimeEdit [15]
      Left = 276
      Top = 316
      AutoSize = False
      EditValue = 0.999988425925926d
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 105
    end
    object cbbDwdm: TcxComboBox [16]
      Left = 94
      Top = 36
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 287
    end
    object cbManage: TcxCheckBox [17]
      Left = 28
      Top = 400
      Caption = #31649#29702#21592
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = ''
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 14
      Transparent = True
    end
    object cbMM: TcxCheckBox [18]
      Left = 95
      Top = 400
      Caption = #24674#22797#23494#30721
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = ''
      StyleDisabled.LookAndFeel.SkinName = ''
      StyleFocused.LookAndFeel.SkinName = ''
      StyleHot.LookAndFeel.SkinName = ''
      TabOrder = 15
      Transparent = True
    end
    object cbbRyll: TcxComboBox [19]
      Left = 94
      Top = 372
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #20132#35686
        #27665#35686
        #21327#35686)
      Style.HotTrack = False
      TabOrder = 13
      Text = #20132#35686
      Height = 21
      Width = 287
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #29992#25143#20449#24687
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #29992#25143#32534#21495
      Control = edtYhbh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #29992#25143#22995#21517
      Control = edtYhxm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #29992#25143#23494#30721
      Visible = False
      Control = edtYhmm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36523#20221#35777#21495
      Control = edtSfzh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #25163#26426#21495#30721
      Control = edtSjhm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #29992#25143#32844#21153
      Control = cbbYhzw
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'MAC'#22320#22336
      Control = edtMac
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = 'IP'#27573
      Control = edtQsip
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 11
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      CaptionOptions.Text = #24405#20837#26680#26597
      Control = cbbSH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 67
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avClient
      CaptionOptions.Text = '-'
      Control = edtJsip
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Index = -1
      AutoCreated = True
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #29992#25143#26377#25928#26399
      Control = dtValidDate
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 114
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #23494#30721#26377#25928#26399
      Control = dtPasswordValidDate
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup4
      AlignHorz = ahClient
      CaptionOptions.Text = #30331#24405#26102#38388
      Control = dtLoginTimeBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup4
      AlignVert = avBottom
      CaptionOptions.Text = '-'
      Control = dtLoginTimeEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 105
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 10
      AutoCreated = True
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21333#20301#20195#30721
      Control = cbbDwdm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup3
      LayoutDirection = ldHorizontal
      Index = 13
      AutoCreated = True
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'cxCheckBox2'
      CaptionOptions.Visible = False
      Control = cbManage
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 60
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Visible = False
      Control = cbMM
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 72
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #20154#21592#31867#22411
      Control = cbbRyll
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 287
      ControlOptions.ShowBorder = False
      Index = 12
    end
  end
end
