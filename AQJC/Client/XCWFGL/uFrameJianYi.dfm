object FrameJianYi: TFrameJianYi
  Left = 0
  Top = 0
  Width = 1005
  Height = 605
  TabOrder = 0
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1005
    Height = 605
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DM.dxLayoutSkinLookAndFeel1
    object txtJDSBH1: TcxTextEdit
      Left = 208
      Top = 10
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 0
      Text = '445100'
      Height = 21
      Width = 82
    end
    object txtJDSBH2: TcxTextEdit
      Left = 296
      Top = 10
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 110
    end
    object txtJYW: TcxTextEdit
      Left = 453
      Top = 10
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 37
    end
    object cboZQMJ: TcxComboBox
      Left = 574
      Top = 10
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 283
    end
    object cboJSZZL1: TcxComboBox
      Left = 208
      Top = 53
      AutoSize = False
      Properties.Items.Strings = (
        '4:'#20844#23433#39550#39542#35777
        '5:'#27494#35686#39550#39542#35777
        '6:'#37096#38431#39550#39542#35777
        '7:'#20892#26426#39550#39542#35777)
      Style.HotTrack = False
      TabOrder = 4
      Text = '4:'#20844#23433#39550#39542#35777
      Height = 21
      Width = 154
    end
    object cboJSZZL2: TcxComboBox
      Left = 368
      Top = 53
      AutoSize = False
      Properties.Items.Strings = (
        'A:'#23621#27665#36523#20221#35777
        'C:'#20891#23448#35777
        'D:'#22763#20853#35777
        'E:'#20891#23448#31163#36864#20241#35777#11
        'F:'#22659#22806#20154#21592#36523#20221#35777#26126
        'G:'#22806#20132#20154#21592#36523#20221#35777#26126
        'I:'#22806#22269#20154#27704#20037#23621#30041#36523#20221#35777#26126)
      Style.HotTrack = False
      TabOrder = 5
      Text = 'A:'#23621#27665#36523#20221#35777
      Height = 21
      Width = 121
    end
    object txtDSR: TcxTextEdit
      Left = 208
      Top = 107
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 281
    end
    object txtLXDH: TcxTextEdit
      Left = 208
      Top = 134
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 281
    end
    object cboCLLX: TcxComboBox
      Left = 208
      Top = 204
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 281
    end
    object cboSYXZ: TcxComboBox
      Left = 208
      Top = 231
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 281
    end
    object txtWFSJ: TcxDateEdit
      Left = 208
      Top = 274
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 12
      Height = 21
      Width = 281
    end
    object txtDLDM1: TcxTextEdit
      Left = 208
      Top = 301
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 73
    end
    object cboDLDM2: TcxComboBox
      Left = 287
      Top = 301
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 202
    end
    object txtWFDZ: TcxTextEdit
      Left = 208
      Top = 328
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 15
      Height = 21
      Width = 281
    end
    object cboSGLX: TcxComboBox
      Left = 208
      Top = 355
      AutoSize = False
      Properties.Items.Strings = (
        '0:'#26080
        '1:'#27515#20129#20107#25925
        '2:'#20260#20154#20107#25925
        '3:'#36130#20135#25439#22833#20107#25925
        '4:'#31616#26131#31243#24207#20107#25925)
      Style.HotTrack = False
      TabOrder = 16
      Height = 21
      Width = 281
    end
    object txtWFDM: TcxTextEdit
      Left = 208
      Top = 398
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 17
      OnKeyPress = txtWFDMKeyPress
      Height = 21
      Width = 281
    end
    object lblFKJE: TcxLabel
      Left = 208
      Top = 425
      Style.HotTrack = False
    end
    object txtZJHM: TcxTextEdit
      Left = 576
      Top = 53
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 19
      OnKeyPress = txtZJHMKeyPress
      Height = 21
      Width = 281
    end
    object txtDABH: TcxTextEdit
      Left = 576
      Top = 80
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 20
      Height = 21
      Width = 281
    end
    object txtZJCX: TcxTextEdit
      Left = 576
      Top = 107
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 21
      Height = 21
      Width = 281
    end
    object txtLXDZ: TcxTextEdit
      Left = 576
      Top = 134
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 22
      Height = 21
      Width = 281
    end
    object cboCLFL: TcxComboBox
      Left = 576
      Top = 204
      AutoSize = False
      Properties.Items.Strings = (
        '2:'#26080#29260#26080#35777#26426#21160#36710
        '3:'#20844#23433#29260#35777#26426#21160#36710
        '4:'#27494#35686#29260#35777#26426#21160#36710
        '5:'#37096#38431#29260#35777#26426#21160#36710
        '6:'#20892#26426#29260#35777#26426#21160#36710)
      Style.HotTrack = False
      TabOrder = 24
      Text = '3:'#20844#23433#29260#35777#26426#21160#36710
      Height = 21
      Width = 281
    end
    object txtSYR: TcxTextEdit
      Left = 576
      Top = 231
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 25
      Height = 21
      Width = 281
    end
    object cboXZQH: TcxComboBox
      Left = 576
      Top = 274
      AutoSize = False
      Properties.Items.Strings = (
        '445100:'#28526#24030#24066
        '445101:'#24066#36758#21306
        '445102:'#28248#26725#21306
        '445103:'#26725#19996#21306
        '445104:'#26539#28330#21306
        '445121:'#28526#23433#21306
        '445122:'#39286#24179#21439
        '445191:'#39640#36895#19968#22823#38431
        '445192:'#39640#36895#20108#22823#38431)
      Style.HotTrack = False
      TabOrder = 26
      Height = 21
      Width = 281
    end
    object txtLK1: TcxTextEdit
      Left = 576
      Top = 301
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 27
      Height = 21
      Width = 62
    end
    object cboLK2: TcxComboBox
      Left = 644
      Top = 301
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 28
      Height = 21
      Width = 121
    end
    object txtLK3: TcxTextEdit
      Left = 800
      Top = 301
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 29
      Height = 21
      Width = 57
    end
    object txtDLLX: TcxTextEdit
      Left = 576
      Top = 328
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 30
      Height = 21
      Width = 281
    end
    object txtCLSJ: TcxDateEdit
      Left = 576
      Top = 355
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 31
      Height = 21
      Width = 281
    end
    object lblWFJF: TcxLabel
      Left = 576
      Top = 398
      Style.HotTrack = False
    end
    object cbJG: TcxRadioButton
      Left = 576
      Top = 421
      Width = 49
      Height = 19
      Caption = #35686#21578
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 33
      OnClick = cbJGClick
      ParentBackground = False
    end
    object cbFK: TcxRadioButton
      Left = 651
      Top = 421
      Width = 58
      Height = 19
      Caption = #32602#27454
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 34
      OnClick = cbJGClick
      ParentBackground = False
    end
    object lblWFNR: TcxLabel
      Left = 208
      Top = 448
      Style.HotTrack = False
    end
    object ckbZXRY: TcxCheckBox
      Left = 208
      Top = 471
      AutoSize = False
      Caption = #26159
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 36
      Height = 19
      Width = 73
    end
    object txtSFZM: TcxTextEdit
      Left = 414
      Top = 471
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 37
      Height = 21
      Width = 189
    end
    object txtXM: TcxTextEdit
      Left = 683
      Top = 471
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 38
      Height = 21
      Width = 174
    end
    object rbBFK: TcxRadioButton
      Left = 208
      Top = 514
      Width = 73
      Height = 17
      Caption = #19981#32602#27454
      TabOrder = 39
      GroupIndex = 1
    end
    object rbXCJK: TcxRadioButton
      Left = 307
      Top = 514
      Width = 75
      Height = 17
      Caption = #24403#22330#32564#27454
      TabOrder = 40
      GroupIndex = 1
    end
    object rbYHJK: TcxRadioButton
      Left = 408
      Top = 514
      Width = 82
      Height = 17
      Caption = #38134#34892#32564#27454
      Checked = True
      TabOrder = 41
      TabStop = True
      GroupIndex = 1
    end
    object cboJSJQ: TcxComboBox
      Left = 684
      Top = 514
      AutoSize = False
      Properties.Items.Strings = (
        '00:'#19981#25298#25910#19981#25298#31614
        '01:'#19981#25298#25910#20294#25298#31614
        '10:'#25298#25910#20294#19981#25298#31614
        '11:'#25298#25910#24182#25298#31614)
      Style.HotTrack = False
      TabOrder = 42
      Text = '00:'#19981#25298#25910#19981#25298#31614
      Height = 21
      Width = 173
    end
    object txtBZ: TcxMemo
      Left = 208
      Top = 541
      Style.HotTrack = False
      TabOrder = 43
      Height = 60
      Width = 649
    end
    object btnSave: TcxButton
      Left = 375
      Top = 619
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 44
      OnClick = btnSaveClick
    end
    object btnCancel: TcxButton
      Left = 456
      Top = 619
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 45
      OnClick = btnCancelClick
    end
    object btnBack: TcxButton
      Left = 537
      Top = 619
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 46
      OnClick = btnBackClick
    end
    object txtFZJG: TcxTextEdit
      Left = 208
      Top = 80
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 6
      Text = #31908'U'
      Height = 21
      Width = 281
    end
    object cboHPZL: TcxComboBox
      Left = 208
      Top = 177
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 281
    end
    object txtHPHM: TcxTextEdit
      Left = 576
      Top = 177
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 23
      Text = #31908'U'
      OnKeyPress = txtHPHMKeyPress
      Height = 21
      Width = 281
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahCenter
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgVeh: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Padding.AssignedValues = [lpavBottom]
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = lgVeh
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #20915#23450#20070#32534#21495
      Control = txtJDSBH1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 82
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      Control = txtJDSBH2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #26657#39564#20301
      Control = txtJYW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 37
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = lgVeh
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #25191#21220#27665#35686
      Offsets.Left = 25
      Control = cboZQMJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 153
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'Separator'
      Offsets.Bottom = 5
      Offsets.Top = 5
      Index = 1
    end
    object lgBaseInfo: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Padding.AssignedValues = [lpavBottom]
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup14: TdxLayoutGroup
      Parent = lgBaseInfo
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup14
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #39550#35777#31181#31867
      Control = cboJSZZL1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup6
      Control = cboJSZZL2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #24403#20107#20154
      Control = txtDSR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #32852#31995#30005#35805
      Control = txtLXDH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #36710#36742#31867#22411
      Control = cboCLLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #20351#29992#24615#36136
      Control = cboSYXZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #36829#27861#26102#38388
      Control = txtWFSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = dxLayoutGroup14
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 10
    end
    object dxLayoutItem27: TdxLayoutItem
      Parent = dxLayoutGroup9
      CaptionOptions.Text = #36947#36335#20195#30721
      Control = txtDLDM1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      Control = cboDLDM2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem28: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #36829#27861#22320#28857
      Control = txtWFDZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 11
    end
    object dxLayoutItem29: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #20107#25925#31867#22411
      Control = cboSGLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 12
    end
    object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = 'Separator'
      Offsets.Bottom = 5
      Offsets.Top = 5
      Index = 13
    end
    object dxLayoutItem37: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #36829#27861#20195#30721
      Control = txtWFDM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 14
    end
    object dxLayoutItem41: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #32602#27454#37329#39069
      Control = lblFKJE
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 28
      ControlOptions.ShowBorder = False
      Index = 15
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = lgBaseInfo
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #35777#20214#21495#30721
      Control = txtZJHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #26723#26696#32534#21495
      Control = txtDABH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #20934#39550#36710#22411
      Control = txtZJCX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #32852#31995#22320#22336
      Control = txtLXDZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #36710#36742#20998#31867
      Control = cboCLFL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem30: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #26426#21160#36710#25152#26377#20154
      Control = txtSYR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem31: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #34892#25919#21306#21010
      Control = cboXZQH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutGroup10: TdxLayoutGroup
      Parent = dxLayoutGroup11
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 10
    end
    object dxLayoutItem32: TdxLayoutItem
      Parent = dxLayoutGroup10
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #36335#21475'/'#20844#37324
      Control = txtLK1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 62
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem33: TdxLayoutItem
      Parent = dxLayoutGroup10
      Control = cboLK2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem34: TdxLayoutItem
      Parent = dxLayoutGroup10
      AlignHorz = ahClient
      CaptionOptions.Text = #31859#25968
      Control = txtLK3
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 57
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem35: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #36947#36335#31867#22411'/'#31561#32423
      Control = txtDLLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 281
      ControlOptions.ShowBorder = False
      Index = 11
    end
    object dxLayoutItem36: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #20107#25925#22788#29702#26102#38388
      Control = txtCLSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 12
    end
    object dxLayoutSeparatorItem3: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = 'Separator'
      Offsets.Bottom = 5
      Offsets.Top = 5
      Index = 13
    end
    object dxLayoutItem39: TdxLayoutItem
      Parent = dxLayoutGroup11
      AlignHorz = ahClient
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #36829#27861#35760#20998
      Control = lblWFJF
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 46
      ControlOptions.ShowBorder = False
      Index = 14
    end
    object dxLayoutGroup15: TdxLayoutGroup
      Parent = dxLayoutGroup11
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 15
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup15
      AlignHorz = ahLeft
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #22788#32602#32467#26524
      Control = cbJG
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 49
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem40: TdxLayoutItem
      Parent = dxLayoutGroup15
      CaptionOptions.Text = #32602#27454
      CaptionOptions.Visible = False
      Offsets.Left = 20
      Control = cbFK
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 58
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem38: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #36829#27861#20869#23481
      Control = lblWFNR
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 52
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup16: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutItem42: TdxLayoutItem
      Parent = dxLayoutGroup16
      CaptionOptions.Text = #26159#21542#33258#23398#20154#21592
      Control = ckbZXRY
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem44: TdxLayoutItem
      Parent = dxLayoutGroup16
      CaptionOptions.Text = #36523#20221#35777#26126#21495#30721
      Offsets.Left = 50
      Control = txtSFZM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 189
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem43: TdxLayoutItem
      Parent = dxLayoutGroup16
      AlignHorz = ahClient
      CaptionOptions.Text = '       '#22995#21517
      Offsets.Left = 24
      Control = txtXM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 173
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup18: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 6
    end
    object dxLayoutGroup17: TdxLayoutGroup
      Parent = dxLayoutGroup18
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem46: TdxLayoutItem
      Parent = dxLayoutGroup17
      CaptionOptions.Text = #20132#27454#26041#24335
      Control = rbBFK
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 73
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem48: TdxLayoutItem
      Parent = dxLayoutGroup17
      CaptionOptions.Visible = False
      Offsets.Left = 20
      Control = rbXCJK
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem47: TdxLayoutItem
      Parent = dxLayoutGroup17
      CaptionOptions.Text = #38134#34892#32564#27454
      CaptionOptions.Visible = False
      Offsets.Left = 20
      Control = rbYHJK
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 82
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutEmptySpaceItem1: TdxLayoutEmptySpaceItem
      Parent = dxLayoutGroup18
      CaptionOptions.Text = 'Empty Space Item'
      SizeOptions.Height = 10
      SizeOptions.Width = 95
      Index = 1
    end
    object dxLayoutItem49: TdxLayoutItem
      Parent = dxLayoutGroup18
      AlignHorz = ahClient
      CaptionOptions.Text = #25298#25910#25298#31614
      Offsets.Left = 34
      Control = cboJSJQ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 172
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #22791#27880
      Control = txtBZ
      ControlOptions.OriginalHeight = 60
      ControlOptions.OriginalWidth = 614
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 8
    end
    object dxLayoutSeparatorItem4: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Separator'
      Index = 0
    end
    object dxLayoutGroup12: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup13: TdxLayoutGroup
      Parent = dxLayoutGroup12
      AlignHorz = ahCenter
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup13
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = dxLayoutGroup13
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liBack: TdxLayoutItem
      Parent = dxLayoutGroup13
      CaptionOptions.Visible = False
      Visible = False
      Control = btnBack
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liMessage: TdxLayoutItem
      Parent = dxLayoutGroup4
      Index = 9
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #21457#35777#26426#20851
      Control = txtFZJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cboHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.AlignHorz = taRightJustify
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = txtHPHM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutSeparatorItem5: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = 'Separator'
      Offsets.Bottom = 5
      Offsets.Top = 5
      Index = 4
    end
    object dxLayoutSeparatorItem6: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = 'Separator'
      Offsets.Bottom = 5
      Offsets.Top = 5
      Index = 4
    end
    object dxLayoutSeparatorItem7: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = 'Separator'
      Offsets.Bottom = 5
      Offsets.Top = 5
      Index = 8
    end
    object dxLayoutSeparatorItem8: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = 'Separator'
      Offsets.Bottom = 5
      Offsets.Top = 5
      Index = 8
    end
    object dxLayoutSeparatorItem9: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'Separator'
      Offsets.Bottom = 5
      Offsets.Top = 5
      Index = 5
    end
  end
end
