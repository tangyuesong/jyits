object FrameZFZ: TFrameZFZ
  Left = 0
  Top = 0
  Width = 1005
  Height = 648
  TabOrder = 0
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1005
    Height = 648
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DM.dxLayoutSkinLookAndFeel1
    CustomizeFormTabbedView = True
    object cboJC: TcxComboBox
      Left = 227
      Top = 10
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 66
    end
    object edthphm: TcxTextEdit
      Left = 299
      Top = 10
      AutoSize = False
      Properties.CharCase = ecUpperCase
      Style.HotTrack = False
      TabOrder = 1
      OnKeyPress = edthphmKeyPress
      Height = 21
      Width = 82
    end
    object cboHPZL: TcxComboBox
      Left = 452
      Top = 10
      AutoSize = False
      Properties.OnCloseUp = cboHPZLPropertiesCloseUp
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 153
    end
    object cboJCCLLX: TcxComboBox
      Left = 688
      Top = 10
      AutoSize = False
      Properties.Items.Strings = (
        '01:'#22823#20013#22411#23458#36710
        '02:'#21361#38505#21697#36816#36755#36710
        '03:'#26657#36710
        '04:'#36135#36710
        '05:'#23567#24494#38754#21253#36710
        '07:'#33829#36716#38750#23458#36710
        '99:'#20854#20182)
      Properties.OnChange = cboJCCLLXPropertiesChange
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 153
    end
    object edtSYXZ: TcxTextEdit
      Left = 452
      Top = 37
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 153
    end
    object edtCLPP: TcxTextEdit
      Left = 688
      Top = 37
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 153
    end
    object edtWFCS: TcxTextEdit
      Left = 452
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 7
      Text = '-'
      Height = 21
      Width = 153
    end
    object edtCLZT: TcxTextEdit
      Left = 688
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 153
    end
    object cbYQWBF: TcxCheckBox
      Left = 452
      Top = 91
      Caption = #26159
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 8
    end
    object edtCLLX: TcxTextEdit
      Left = 227
      Top = 37
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 154
    end
    object edtDJRQ: TcxTextEdit
      Left = 227
      Top = 64
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 154
    end
    object cbYQWNJ: TcxCheckBox
      Left = 227
      Top = 91
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
      TabOrder = 4
    end
    object cbWFWCL: TcxCheckBox
      Left = 688
      Top = 91
      Caption = #26159
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 12
    end
    object txtDriverJSZH: TcxComboBox
      Left = 227
      Top = 353
      AutoSize = False
      Properties.OnCloseUp = txtDriverJSZHPropertiesCloseUp
      Style.HotTrack = False
      TabOrder = 24
      OnKeyPress = txtDriverJSZHKeyPress
      Height = 21
      Width = 154
    end
    object txtDriverXM: TcxTextEdit
      Left = 452
      Top = 353
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 28
      Height = 21
      Width = 154
    end
    object txtDriverLXDH: TcxTextEdit
      Left = 689
      Top = 353
      AutoSize = False
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 32
      Height = 21
      Width = 154
    end
    object txtDriverFZJG: TcxTextEdit
      Left = 227
      Top = 380
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 25
      Height = 21
      Width = 154
    end
    object txtDriverJZZT: TcxTextEdit
      Left = 452
      Top = 380
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 29
      Height = 21
      Width = 154
    end
    object txtDriverLZRQ: TcxTextEdit
      Left = 689
      Top = 380
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 33
      Height = 21
      Width = 154
    end
    object txtDriverZJCX: TcxTextEdit
      Left = 227
      Top = 432
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 27
      Height = 21
      Width = 154
    end
    object txtDriverLXDZ: TcxTextEdit
      Left = 452
      Top = 432
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 31
      Height = 21
      Width = 154
    end
    object cbDriverCF: TcxCheckBox
      Left = 227
      Top = 407
      Caption = #26159
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 26
    end
    object cbDriverYQWSY: TcxCheckBox
      Left = 452
      Top = 407
      Caption = #26159
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 30
    end
    object cbDriverYQWHZ: TcxCheckBox
      Left = 689
      Top = 407
      Caption = #26159
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 34
    end
    object txtFJSJSZH: TcxComboBox
      Left = 227
      Top = 471
      AutoSize = False
      Properties.OnCloseUp = txtFJSJSZHPropertiesCloseUp
      Style.HotTrack = False
      TabOrder = 35
      OnKeyPress = txtFJSJSZHKeyPress
      Height = 21
      Width = 154
    end
    object txtFJSXM: TcxTextEdit
      Left = 452
      Top = 471
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 39
      Height = 21
      Width = 154
    end
    object txtFJSLXDH: TcxTextEdit
      Left = 689
      Top = 471
      AutoSize = False
      Properties.ReadOnly = False
      Style.HotTrack = False
      TabOrder = 43
      Height = 21
      Width = 154
    end
    object txtFJSFZJG: TcxTextEdit
      Left = 227
      Top = 498
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 36
      Height = 21
      Width = 154
    end
    object txtFJSJZZT: TcxTextEdit
      Left = 452
      Top = 498
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 40
      Height = 21
      Width = 154
    end
    object txtFJSLZRQ: TcxTextEdit
      Left = 689
      Top = 498
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 44
      Height = 21
      Width = 154
    end
    object txtFJSZJCX: TcxTextEdit
      Left = 227
      Top = 550
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 38
      Height = 21
      Width = 154
    end
    object txtFJSLXDZ: TcxTextEdit
      Left = 452
      Top = 550
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 42
      Height = 21
      Width = 154
    end
    object cbFJSCF: TcxCheckBox
      Left = 227
      Top = 525
      Caption = #26159
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 37
    end
    object cbFJSYQWSY: TcxCheckBox
      Left = 452
      Top = 525
      Caption = #26159
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 41
    end
    object cbFJSYQWHZ: TcxCheckBox
      Left = 689
      Top = 525
      Caption = #26159
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 45
    end
    object edtMS: TcxMemo
      Left = 227
      Top = 275
      Style.HotTrack = False
      TabOrder = 23
      Height = 60
      Width = 616
    end
    object cxButton1: TcxButton
      Left = 384
      Top = 589
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 46
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 465
      Top = 589
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 47
      OnClick = cxButton2Click
    end
    object edtSFD: TcxComboBox
      Left = 227
      Top = 128
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 154
    end
    object edtMDD: TcxComboBox
      Left = 452
      Top = 128
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 153
    end
    object edtZFZMC: TcxComboBox
      Left = 688
      Top = 128
      AutoSize = False
      Properties.OnChange = edtZFZMCPropertiesChange
      Style.HotTrack = False
      TabOrder = 15
      Height = 21
      Width = 155
    end
    object cbSFYFJ: TcxCheckBox
      Left = 227
      Top = 155
      AutoSize = False
      Caption = #26377
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      Properties.OnChange = cbSFYFJPropertiesChange
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
      TabOrder = 16
      Height = 19
      Width = 154
    end
    object cboGPS: TcxComboBox
      Left = 452
      Top = 155
      AutoSize = False
      Properties.Items.Strings = (
        #27491#24120
        #26410#24320#21551
        #26410#37197#22791)
      Style.HotTrack = False
      TabOrder = 17
      Height = 21
      Width = 154
    end
    object cboJCR: TcxComboBox
      Left = 689
      Top = 155
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 18
      Height = 21
      Width = 154
    end
    object edtJCSJ: TcxDateEdit
      Left = 689
      Top = 182
      AutoSize = False
      Properties.Kind = ckDateTime
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 21
      Height = 21
      Width = 154
    end
    object edtHZ: TcxTextEdit
      Left = 227
      Top = 182
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 19
      Height = 21
      Width = 154
    end
    object edtSZ: TcxTextEdit
      Left = 452
      Top = 182
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 20
      Height = 21
      Width = 154
    end
    object cxButton3: TcxButton
      Left = 546
      Top = 589
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 48
      OnClick = cxButton3Click
    end
    object clbJCNR: TcxCheckListBox
      Left = 227
      Top = 209
      Width = 616
      Height = 60
      Columns = 4
      Items = <
        item
          Text = #30130#21171#39550#39542
        end
        item
          Text = #23433#20840#35774#22791#19981#21512#26684
        end
        item
          Text = #36718#32974#33457#32441#19981#21512#26684
        end
        item
          Text = #31995#23433#20840#24102
        end>
      Style.LookAndFeel.SkinName = 'Office2013White'
      StyleDisabled.LookAndFeel.SkinName = 'Office2013White'
      StyleFocused.LookAndFeel.SkinName = 'Office2013White'
      StyleHot.LookAndFeel.SkinName = 'Office2013White'
      TabOrder = 22
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
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahCenter
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
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
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = lgVeh
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = lgVeh
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
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
      CaptionOptions.Text = #21495#29260#21495#30721
      Control = cboJC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 66
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      Control = edthphm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 82
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #21495#29260#31181#31867
      Control = cboHPZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 153
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #26816#26597#36710#36742#31867#22411
      Control = cboJCCLLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 153
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignVert = avClient
      CaptionOptions.Text = #20351#29992#24615#36136
      Control = edtSYXZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #36710#36742#21697#29260
      Control = edtCLPP
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahClient
      CaptionOptions.Text = #36829#27861#27425#25968
      Control = edtWFCS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #36710#36742#29366#24577
      Control = edtCLZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = #36926#26399#26410#25253#24223
      Control = cbYQWBF
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 88
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem29: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36710#36742#31867#22411
      Control = edtCLLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      CaptionOptions.Text = #30331#35760#26085#26399
      Control = edtDJRQ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = #36926#26399#26410#26816#39564
      Control = cbYQWNJ
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 88
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #36829#27861#26410#22788#29702
      Control = cbWFWCL
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 88
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lgDrivera: TdxLayoutGroup
      Parent = lgDriver
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lgDriver1: TdxLayoutGroup
      Parent = lgDrivera
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgDriver2: TdxLayoutGroup
      Parent = lgDrivera
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object lgDriver3: TdxLayoutGroup
      Parent = lgDrivera
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object lgDriver11: TdxLayoutGroup
      Parent = lgDriver1
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object liDriver1: TdxLayoutItem
      Parent = lgDriver11
      CaptionOptions.Text = #20027#39550#39542#35777#21495
      Control = txtDriverJSZH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liDriver3: TdxLayoutItem
      Parent = lgDriver2
      CaptionOptions.Text = #22995#21517
      Control = txtDriverXM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liDriver5: TdxLayoutItem
      Parent = lgDriver3
      CaptionOptions.Text = #32852#31995#30005#35805
      Control = txtDriverLXDH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liDriver4: TdxLayoutItem
      Parent = lgDriver2
      CaptionOptions.Text = #39550#29031#29366#24577
      Control = txtDriverJZZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liDriver12: TdxLayoutItem
      Parent = lgDriver3
      CaptionOptions.Text = #39046#35777#26085#26399
      Control = txtDriverLZRQ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liDriver6: TdxLayoutItem
      Parent = lgDriver2
      CaptionOptions.Text = #36926#26399#26410#23457#39564
      Control = cbDriverYQWSY
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 36
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liDriver7: TdxLayoutItem
      Parent = lgDriver3
      CaptionOptions.Text = #36926#26399#26410#25442#35777'    '
      Control = cbDriverYQWHZ
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 36
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liDriver10: TdxLayoutItem
      Parent = lgDriver2
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #32852#31995#22320#22336
      Control = txtDriverLXDZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object liDriver8: TdxLayoutItem
      Parent = lgDriver1
      CaptionOptions.Text = #21457#35777#26426#20851
      Control = txtDriverFZJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liDriver13: TdxLayoutItem
      Parent = lgDriver1
      CaptionOptions.Text = #26159#21542#36229#20998
      Control = cbDriverCF
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 36
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liDriver9: TdxLayoutItem
      Parent = lgDriver1
      CaptionOptions.Text = #20934#39550#36710#22411
      Control = txtDriverZJCX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lgFJSa: TdxLayoutGroup
      Parent = lgFJS
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object lgFJS1: TdxLayoutGroup
      Parent = lgFJSa
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgFJS2: TdxLayoutGroup
      Parent = lgFJSa
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object lgFJS3: TdxLayoutGroup
      Parent = lgFJSa
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object lgFJS11: TdxLayoutGroup
      Parent = lgFJS1
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object liFJS1: TdxLayoutItem
      Parent = lgFJS11
      CaptionOptions.Text = #21103#39550#39542#35777#21495
      Control = txtFJSJSZH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liFJS3: TdxLayoutItem
      Parent = lgFJS2
      CaptionOptions.Text = #22995#21517
      Control = txtFJSXM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liFJS5: TdxLayoutItem
      Parent = lgFJS3
      CaptionOptions.Text = #32852#31995#30005#35805
      Control = txtFJSLXDH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liFJS4: TdxLayoutItem
      Parent = lgFJS2
      CaptionOptions.Text = #39550#29031#29366#24577
      Control = txtFJSJZZT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liFJS12: TdxLayoutItem
      Parent = lgFJS3
      CaptionOptions.Text = #39046#35777#26085#26399
      Control = txtFJSLZRQ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liFJS6: TdxLayoutItem
      Parent = lgFJS2
      CaptionOptions.Text = #36926#26399#26410#23457#39564
      Control = cbFJSYQWSY
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 36
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liFJS7: TdxLayoutItem
      Parent = lgFJS3
      CaptionOptions.Text = #36926#26399#26410#25442#35777
      Control = cbFJSYQWHZ
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 36
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liFJS10: TdxLayoutItem
      Parent = lgFJS2
      CaptionOptions.Text = #32852#31995#22320#22336
      Control = txtFJSLXDZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object liFJS8: TdxLayoutItem
      Parent = lgFJS1
      CaptionOptions.Text = #21457#35777#26426#20851
      Control = txtFJSFZJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liFJS13: TdxLayoutItem
      Parent = lgFJS1
      CaptionOptions.Text = #26159#21542#36229#20998
      Control = cbFJSCF
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 36
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liFJS9: TdxLayoutItem
      Parent = lgFJS1
      CaptionOptions.Text = #20934#39550#36710#22411
      Control = txtFJSZJCX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lgBaseInfo: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Padding.AssignedValues = [lpavBottom]
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = lgBaseInfo
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = lgBaseInfo
      CaptionOptions.Text = #24773#20917#25551#36848
      Control = edtMS
      ControlOptions.OriginalHeight = 60
      ControlOptions.OriginalWidth = 614
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object lgFJS: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 3
    end
    object dxLayoutSeparatorItem3: TdxLayoutSeparatorItem
      Parent = lgFJS
      CaptionOptions.Text = 'Separator'
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = lgBaseInfo
      CaptionOptions.Text = 'Separator'
      Index = 0
    end
    object lgDriver: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutSeparatorItem2: TdxLayoutSeparatorItem
      Parent = lgDriver
      CaptionOptions.Text = 'Separator'
      Index = 0
    end
    object dxLayoutSeparatorItem4: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'Separator'
      Index = 0
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup13
      AlignVert = avTop
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = dxLayoutGroup13
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #22987#21457#22320
      Control = edtSFD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup14
      CaptionOptions.Text = #30446#30340#22320
      Control = edtMDD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 153
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutGroup14
      AlignHorz = ahClient
      CaptionOptions.Text = #25191#27861#31449
      Control = edtZFZMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = #21103#39550#39542#21592
      Control = cbSFYFJ
      ControlOptions.OriginalHeight = 19
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = 'GPS'#24773#20917
      Control = cboGPS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 4
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
    object dxLayoutGroup14: TdxLayoutGroup
      Parent = lgBaseInfo
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = #26816#26597#20154#21592
      Control = cboJCR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = lgBaseInfo
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxLayoutGroup9
      CaptionOptions.Text = #26816#26597#26102#38388
      Control = edtJCSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object liHZ: TdxLayoutItem
      Parent = dxLayoutGroup9
      CaptionOptions.Text = #26680#36733
      Control = edtHZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object liSZ: TdxLayoutItem
      Parent = dxLayoutGroup9
      CaptionOptions.Text = #23454#36733
      Control = edtSZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 154
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liBack: TdxLayoutItem
      Parent = dxLayoutGroup13
      AlignVert = avClient
      CaptionOptions.Visible = False
      Visible = False
      Control = cxButton3
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = lgBaseInfo
      CaptionOptions.Text = #26816#26597#20869#23481
      Control = clbJCNR
      ControlOptions.OriginalHeight = 60
      ControlOptions.OriginalWidth = 614
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object liMessage: TdxLayoutItem
      Parent = dxLayoutGroup4
      Index = 5
    end
  end
end
