inherited FrameDeviceEdit: TFrameDeviceEdit
  Width = 760
  Height = 636
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 760
    Height = 636
    CustomizeFormTabbedView = True
    object Btn1: TcxButton [0]
      Left = 415
      Top = 600
      Width = 75
      Height = 25
      Caption = #25342#21462#32463#32428#24230
      TabOrder = 40
      OnClick = Btn1Click
    end
    object BtnSave: TcxButton [1]
      Left = 497
      Top = 600
      Width = 75
      Height = 25
      Caption = #20445#23384
      OptionsImage.ImageIndex = 1582
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 41
      OnClick = BtnSaveClick
    end
    object BtnExit: TcxButton [2]
      Left = 579
      Top = 600
      Width = 75
      Height = 25
      Caption = #36820#22238
      OptionsImage.ImageIndex = 232
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 42
      OnClick = BtnExitClick
    end
    object EdtLHY_SBBH: TcxTextEdit [3]
      Left = 410
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 305
    end
    object cbbLDMC: TcxComboBox [4]
      Left = 410
      Top = 232
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 123
    end
    object EdtWHRY: TcxTextEdit [5]
      Left = 410
      Top = 260
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 123
    end
    object EdtSBWD: TcxTextEdit [6]
      Left = 410
      Top = 288
      AutoSize = False
      Properties.OnEditValueChanged = EdtSBWDPropertiesEditValueChanged
      Style.HotTrack = False
      TabOrder = 15
      Height = 21
      Width = 123
    end
    object EdtLHY_WFDD: TcxTextEdit [7]
      Left = 410
      Top = 316
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 17
      Height = 21
      Width = 123
    end
    object EdtLHY_DDMS: TcxTextEdit [8]
      Left = 410
      Top = 344
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 19
      Height = 21
      Width = 123
    end
    object EdtLHY_XZQH: TcxTextEdit [9]
      Left = 410
      Top = 372
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 21
      Height = 21
      Width = 123
    end
    object EdtJDJG: TcxTextEdit [10]
      Left = 410
      Top = 428
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 25
      Height = 21
      Width = 123
    end
    object EdtQSSBBH: TcxTextEdit [11]
      Left = 410
      Top = 456
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 27
      Height = 21
      Width = 123
    end
    object EDTXZSD: TcxTextEdit [12]
      Left = 410
      Top = 484
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 29
      Height = 21
      Width = 123
    end
    object EdtIP: TcxTextEdit [13]
      Left = 592
      Top = 512
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 32
      Height = 21
      Width = 123
    end
    object EdtFXMC: TcxTextEdit [14]
      Left = 592
      Top = 176
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 121
    end
    object EdtSBCJ: TcxTextEdit [15]
      Left = 594
      Top = 232
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 12
      Height = 21
      Width = 121
    end
    object EdtLXFS: TcxTextEdit [16]
      Left = 594
      Top = 260
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 121
    end
    object EdtSBJD: TcxTextEdit [17]
      Left = 594
      Top = 288
      AutoSize = False
      Properties.OnEditValueChanged = EdtSBWDPropertiesEditValueChanged
      Style.HotTrack = False
      TabOrder = 16
      Height = 21
      Width = 121
    end
    object EdtLHY_LDDM: TcxTextEdit [18]
      Left = 594
      Top = 316
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 18
      Height = 21
      Width = 121
    end
    object EdtLHY_CJFS: TcxTextEdit [19]
      Left = 594
      Top = 372
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 22
      Height = 21
      Width = 121
    end
    object EdtJDBH: TcxTextEdit [20]
      Left = 594
      Top = 428
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 26
      Height = 21
      Width = 121
    end
    object EDTWFXW: TcxTextEdit [21]
      Left = 594
      Top = 456
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 28
      Height = 21
      Width = 121
    end
    object EDTDCXZSD: TcxTextEdit [22]
      Left = 594
      Top = 484
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 30
      Height = 21
      Width = 121
    end
    object EdtTPGS: TcxTextEdit [23]
      Left = 410
      Top = 512
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 31
      Height = 21
      Width = 121
    end
    object chkDCXXZP: TcxCheckBox [24]
      Left = 459
      Top = 540
      Caption = #22823#36710#38480#34892#25235#25293
      Style.HotTrack = False
      TabOrder = 34
      Transparent = True
    end
    object chkxxzp: TcxCheckBox [25]
      Left = 354
      Top = 540
      Caption = #38383#31105#34892#25235#25293
      Style.HotTrack = False
      TabOrder = 33
      Transparent = True
    end
    object Chromium1: TChromium [26]
      Left = 13
      Top = 13
      Width = 319
      Height = 627
      TabOrder = 0
      Options.AcceleratedPaintingDisabled = False
      Options.AcceleratedFiltersDisabled = False
      Options.AcceleratedPluginsDisabled = False
    end
    object DTQYQS: TcxDateEdit [27]
      Left = 410
      Top = 400
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 23
      Height = 21
      Width = 121
    end
    object DTJDYXQ: TcxDateEdit [28]
      Left = 592
      Top = 400
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 24
      Height = 21
      Width = 121
    end
    object chkTPXZ: TcxCheckBox [29]
      Left = 564
      Top = 540
      Caption = #22270#29255#19979#36733
      Style.HotTrack = False
      TabOrder = 35
      Transparent = True
    end
    object chkaqdsb: TcxCheckBox [30]
      Left = 354
      Top = 572
      Caption = #23433#20840#24102#35782#21035
      Style.HotTrack = False
      TabOrder = 37
      Transparent = True
    end
    object chkysxzp: TcxCheckBox [31]
      Left = 468
      Top = 572
      Caption = #21387#21452#23454#32447#25235#25293
      Style.HotTrack = False
      TabOrder = 38
      Transparent = True
    end
    object EdtFXBH: TcxTextEdit [32]
      Left = 410
      Top = 176
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 121
    end
    object chkxysb: TcxCheckBox [33]
      Left = 643
      Top = 540
      Caption = #20108#27425#35782#21035
      Style.HotTrack = False
      TabOrder = 36
      Transparent = True
    end
    object chkSCJCPT: TcxCheckBox [34]
      Left = 571
      Top = 572
      Caption = #21521#20844#23433#37096#19978#20256#21345#21475#25968#25454
      Style.HotTrack = False
      TabOrder = 39
      Transparent = True
    end
    object cbbSBLX: TcxComboBox [35]
      Left = 594
      Top = 344
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 20
      Height = 21
      Width = 121
    end
    object EdtLKMC: TcxTextEdit [36]
      Left = 592
      Top = 148
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 123
    end
    object cbbCZDW: TcxComboBox [37]
      Left = 410
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 305
    end
    object EdtLKBH: TcxTextEdit [38]
      Left = 410
      Top = 148
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 121
    end
    object EdtSbbh: TcxTextEdit [39]
      Left = 410
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 305
    end
    object EdtJCBKBABH: TcxComboBox [40]
      Left = 592
      Top = 120
      AutoSize = False
      Properties.Items.Strings = (
        '1: '#19978#34892
        '2: '#19979#34892)
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 121
    end
    object EdtJCPTBABH: TcxTextEdit [41]
      Left = 410
      Top = 120
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 121
    end
    object edtSBDDMC: TcxTextEdit [42]
      Left = 410
      Top = 204
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 305
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      CaptionOptions.Visible = False
      LayoutDirection = ldHorizontal
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Index = 1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 2
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup2
      AlignHorz = ahCenter
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 3
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = Btn1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnExit
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = '61'#36829#27861#21495
      Control = EdtLHY_SBBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxlytcrtdgrp3
      AlignHorz = ahClient
      CaptionOptions.Text = #36335#27573#21517#31216
      Control = cbbLDMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxlytcrtdgrp4
      AlignHorz = ahClient
      CaptionOptions.Text = #32500#25252#20154#21592
      Control = EdtWHRY
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem18: TdxLayoutItem
      Parent = dxlytcrtdgrp5
      AlignHorz = ahClient
      CaptionOptions.Text = #35774#22791#32428#24230
      Control = EdtSBWD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxlytcrtdgrp6
      AlignHorz = ahClient
      CaptionOptions.Text = #36829#27861#22320#28857
      Control = EdtLHY_WFDD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxlytcrtdgrp7
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #22320#28857#31859#25968
      Control = EdtLHY_DDMS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem24: TdxLayoutItem
      Parent = dxlytcrtdgrp8
      AlignHorz = ahClient
      CaptionOptions.Text = #34892#25919#21306#22495
      Control = EdtLHY_XZQH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem28: TdxLayoutItem
      Parent = dxlytcrtdgrp10
      AlignHorz = ahClient
      CaptionOptions.Text = #26816#23450#26426#26500
      Control = EdtJDJG
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem30: TdxLayoutItem
      Parent = dxlytcrtdgrp11
      AlignHorz = ahClient
      CaptionOptions.Text = #23545#24212#35774#22791
      Control = EdtQSSBBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem32: TdxLayoutItem
      Parent = dxlytcrtdgrp12
      AlignHorz = ahClient
      CaptionOptions.Text = #23567#36710#38480#36895
      Control = EDTXZSD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem35: TdxLayoutItem
      Parent = dxlytcrtdgrp13
      AlignHorz = ahClient
      CaptionOptions.Text = 'IP'#22320#22336
      Control = EdtIP
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxlytcrtdgrp2
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #26041#21521#21517#31216
      Control = EdtFXMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 3
      AutoCreated = True
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxlytcrtdgrp3
      CaptionOptions.Text = #35774#22791#21378#21830
      Control = EdtSBCJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp3: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 5
      AutoCreated = True
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxlytcrtdgrp4
      CaptionOptions.Text = #32852#31995#26041#24335
      Control = EdtLXFS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp4: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 6
      AutoCreated = True
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxlytcrtdgrp5
      CaptionOptions.Text = #35774#22791#32463#24230
      Control = EdtSBJD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp5: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 7
      AutoCreated = True
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxlytcrtdgrp6
      CaptionOptions.Text = #36335#27573#20195#30721
      Control = EdtLHY_LDDM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp6: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 8
      AutoCreated = True
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = dxlytcrtdgrp8
      CaptionOptions.Text = #37319#38598#26041#24335
      Control = EdtLHY_CJFS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp8: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 10
      AutoCreated = True
    end
    object dxlytcrtdgrp9: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 11
      AutoCreated = True
    end
    object dxLayoutItem29: TdxLayoutItem
      Parent = dxlytcrtdgrp10
      CaptionOptions.Text = #26816#23450#32534#21495
      Control = EdtJDBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp10: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 12
      AutoCreated = True
    end
    object dxLayoutItem31: TdxLayoutItem
      Parent = dxlytcrtdgrp11
      CaptionOptions.Text = #36829#27861#34892#20026
      Control = EDTWFXW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp11: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 13
      AutoCreated = True
    end
    object dxLayoutItem33: TdxLayoutItem
      Parent = dxlytcrtdgrp12
      CaptionOptions.Text = #22823#36710#38480#36895
      Control = EDTDCXZSD
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp12: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 14
      AutoCreated = True
    end
    object dxLayoutItem34: TdxLayoutItem
      Parent = dxlytcrtdgrp13
      CaptionOptions.Text = #22270#29255#26684#24335
      Control = EdtTPGS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxlytcrtdgrp13: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      LayoutDirection = ldHorizontal
      Index = 15
      AutoCreated = True
    end
    object dxLayoutItem42: TdxLayoutItem
      Parent = dxlytcrtdgrp14
      AlignHorz = ahClient
      CaptionOptions.Text = 'cxCheckBox7'
      CaptionOptions.Visible = False
      Control = chkDCXXZP
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 98
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem40: TdxLayoutItem
      Parent = dxlytcrtdgrp14
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxCheckBox5'
      CaptionOptions.Visible = False
      Control = chkxxzp
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 98
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxlytcrtdgrp14: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup5
      LayoutDirection = ldHorizontal
      Index = 0
      AutoCreated = True
    end
    object dxLayoutItem43: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'Chromium1'
      CaptionOptions.Visible = False
      Control = Chromium1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 41
      ControlOptions.OriginalWidth = 100
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxlytcrtdgrp9
      CaptionOptions.Text = #21551#29992#26085#26399
      Control = DTQYQS
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem44: TdxLayoutItem
      Parent = dxlytcrtdgrp9
      CaptionOptions.Text = #26377#25928#26085#26399
      Control = DTJDYXQ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem39: TdxLayoutItem
      Parent = dxlytcrtdgrp14
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'cxCheckBox4'
      CaptionOptions.Visible = False
      Control = chkTPXZ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 72
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem37: TdxLayoutItem
      Parent = dxlytcrtdgrp15
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'cxCheckBox2'
      CaptionOptions.Visible = False
      Control = chkaqdsb
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 98
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxlytcrtdgrp15: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup5
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutItem38: TdxLayoutItem
      Parent = dxlytcrtdgrp15
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'cxCheckBox3'
      CaptionOptions.Visible = False
      Control = chkysxzp
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 96
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxlytcrtdgrp2
      CaptionOptions.Text = #26041#21521#32534#21495
      Control = EdtFXBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem41: TdxLayoutItem
      Parent = dxlytcrtdgrp14
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'cxCheckBox6'
      CaptionOptions.Visible = False
      Control = chkxysb
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 72
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem36: TdxLayoutItem
      Parent = dxlytcrtdgrp15
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = 'cxCheckBox1'
      CaptionOptions.Visible = False
      Control = chkSCJCPT
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 144
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxlytcrtdgrp7
      CaptionOptions.Text = #35774#22791#31867#22411
      Control = cbbSBLX
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxlytcrtdgrp7: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 9
      AutoCreated = True
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #36335#21475#21517#31216
      Control = EdtLKMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #25191#27861#37096#38376
      Control = cbbCZDW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #36335#21475#32534#21495
      Control = EdtLKBH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup4
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 2
      AutoCreated = True
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791#32534#21495
      Control = EdtSbbh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 80
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #32521#26597#26041#21521
      Control = EdtJCBKBABH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #32521#26597#32534#21495
      Control = EdtJCPTBABH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = #22320#28857#21517#31216
      Control = edtSBDDMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 305
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 208
    Top = 136
  end
end
