inherited FrameFeedback: TFrameFeedback
  Width = 561
  Height = 520
  ExplicitWidth = 561
  ExplicitHeight = 520
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 561
    Height = 520
    CustomizeFormTabbedView = True
    ExplicitWidth = 561
    ExplicitHeight = 520
    inherited btnSave: TcxButton
      Left = 190
      Top = 617
      TabOrder = 18
      OnClick = btnSaveClick
      ExplicitLeft = 190
      ExplicitTop = 617
    end
    inherited btnExit: TcxButton
      Left = 278
      Top = 617
      TabOrder = 19
      ExplicitLeft = 278
      ExplicitTop = 617
    end
    object cboLJJG: TcxComboBox [2]
      Left = 106
      Top = 156
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '0 '#26410#25318#25130#21040
        '1 '#24050#25318#25130#21040)
      Properties.OnChange = cboLJJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 4
      Height = 25
      Width = 410
    end
    object cboLJYY: TcxComboBox [3]
      Left = 106
      Top = 188
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '01 '#26410#21457#29616#36710#36742
        '02 '#36710#36742#26410#20572#25110#24378#34892#38383#21345
        '03 '#36710#36742#25481#22836#25110#32469#34892
        '09 '#20854#20182)
      Properties.OnChange = cboLJJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 5
      Height = 25
      Width = 410
    end
    object cboXYC: TcxComboBox [4]
      Left = 106
      Top = 220
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '0 '#21542
        '1 '#26159)
      Properties.OnChange = cboLJJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 6
      Height = 25
      Width = 410
    end
    object edtCZMJ: TcxComboBox [5]
      Left = 106
      Top = 540
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 16
      Height = 25
      Width = 410
    end
    object edtYJBM: TcxTextEdit [6]
      Left = 106
      Top = 412
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 12
      Height = 25
      Width = 410
    end
    object edtCZDW: TcxComboBox [7]
      Left = 106
      Top = 508
      AutoSize = False
      Properties.OnChange = edtCZDWPropertiesChange
      Style.HotTrack = False
      TabOrder = 15
      Height = 25
      Width = 410
    end
    object cboWCHYY: TcxComboBox [8]
      Left = 106
      Top = 252
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '01 '#24067#25511#20449#24687#26377#35823
        '02 '#21495#29260#35782#21035#38169#35823
        '03 '#36829#27861#35760#24405#38169#35823
        '04 '#21407#36710
        '05 '#36710#36742#22522#26412#20449#24687#26410#26356#26032
        '06 '#20869#37096#36710#36742
        '07 '#36710#36742#24050#24180#26816
        '08 '#36829#27861#24050#22788#29702
        '09 '#36710#36742#21697#29260#35782#21035#38169#35823
        '10 '#35782#21035#19982#30331#35760#21697#29260#26410#23545#24212
        '11 '#25509#39539#36710#36742
        '12 '#21345#21475#26410#26657#26102
        '13 '#39550#39542#20154#39550#39542#35777#27491#24120
        '14 '#38750#36710#20027#26412#20154#39550#39542
        '15 '#26816#26597#26080#24322#24120
        '99 '#20854#20182)
      Style.HotTrack = False
      TabOrder = 7
      Height = 25
      Width = 410
    end
    object cboCZJG: TcxCheckComboBox [9]
      Left = 106
      Top = 284
      AutoSize = False
      Properties.Items = <>
      Properties.OnChange = cboLJJGPropertiesChange
      Style.HotTrack = False
      TabOrder = 8
      Height = 25
      Width = 410
    end
    object cboWSLB: TcxComboBox [10]
      Left = 106
      Top = 316
      AutoSize = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '1 '#31616#26131#31243#24207#22788#32602#20915#23450#20070
        '3 '#24378#21046#25514#26045#20973#35777
        '6 '#36829#27861#22788#29702#36890#30693#20070)
      Style.HotTrack = False
      TabOrder = 9
      Height = 25
      Width = 410
    end
    object edtYJLX: TcxTextEdit [11]
      Left = 106
      Top = 36
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 25
      Width = 410
    end
    object edtCZSJ: TcxTextEdit [12]
      Left = 106
      Top = 572
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 17
      Height = 25
      Width = 410
    end
    object edtGCDD: TcxTextEdit [13]
      Left = 106
      Top = 100
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 410
    end
    object edtGCSJ: TcxTextEdit [14]
      Left = 106
      Top = 128
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 410
    end
    object edtHPHM: TcxTextEdit [15]
      Left = 106
      Top = 68
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 25
      Width = 410
    end
    object edtWSBH: TcxTextEdit [16]
      Left = 106
      Top = 348
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 10
      Height = 25
      Width = 410
    end
    object edtJYW: TcxTextEdit [17]
      Left = 106
      Top = 380
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 11
      Height = 25
      Width = 410
    end
    object edtLXR: TcxTextEdit [18]
      Left = 106
      Top = 444
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 13
      Height = 25
      Width = 410
    end
    object edtLXDH: TcxTextEdit [19]
      Left = 106
      Top = 476
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 14
      Height = 25
      Width = 410
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #21453#39304
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object liLJJG: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #25318#25130#32467#26524
      Control = cboLJJG
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object liLJYY: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #26410#25318#25130#21040#21407#22240
      Control = cboLJYY
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object liXYC: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #26159#21542#23244#30097#36710#36742
      Control = cboXYC
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #22788#32622#20154#21592
      Control = edtCZMJ
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 12
    end
    object liYJBM: TdxLayoutItem
      Parent = lgYJ
      CaptionOptions.Text = #31227#20132#37096#38376
      Control = edtYJBM
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 443
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #22788#32622#37096#38376
      Control = edtCZDW
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 11
    end
    object liWCHYY: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #38750#23244#30097#36710#21407#22240
      Control = cboWCHYY
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 426
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object liCZJG: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #22788#32622#32467#26524
      Control = cboCZJG
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object liWSLB: TdxLayoutItem
      Parent = lgWS
      CaptionOptions.Text = #25991#20070#31867#21035
      Control = cboWSLB
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 443
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #39044#35686#31867#22411
      Control = edtYJLX
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #22788#32622#26102#38388
      Control = edtCZSJ
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 13
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36807#36710#22320#28857
      Control = edtGCDD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 296
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36807#36710#26102#38388
      Control = edtGCSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 296
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #21495#29260#21495#30721'      '
      Control = edtHPHM
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lgWS: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 9
    end
    object liWSBH: TdxLayoutItem
      Parent = lgWS
      CaptionOptions.Text = #25991#20070#32534#21495
      Control = edtWSBH
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = lgWS
      CaptionOptions.Text = #25991#20070#26657#39564#20301
      Control = edtJYW
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object lgYJ: TdxLayoutGroup
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 10
    end
    object liLXR: TdxLayoutItem
      Parent = lgYJ
      CaptionOptions.Text = #32852#31995#20154
      Control = edtLXR
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 443
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liLXDH: TdxLayoutItem
      Parent = lgYJ
      CaptionOptions.Text = #32852#31995#30005#35805
      Control = edtLXDH
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 443
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
