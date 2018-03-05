object FrameBlackCheck: TFrameBlackCheck
  Left = 0
  Top = 0
  Width = 1116
  Height = 638
  TabOrder = 0
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1116
    Height = 638
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DM.dxLayoutSkinLookAndFeel1
    object btnDelete: TcxButton
      Left = 842
      Top = 598
      Width = 75
      Height = 30
      Caption = #21024#38500'(&D)'
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = cxImageList1
      TabOrder = 24
      OnClick = btnDeleteClick
    end
    object btnSave: TcxButton
      Left = 923
      Top = 598
      Width = 75
      Height = 30
      Caption = #24067#25511'(&S)'
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = cxImageList1
      TabOrder = 25
      OnClick = cxButton2Click
    end
    object edthphm: TcxTextEdit
      Left = 892
      Top = 316
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      Properties.CharCase = ecUpperCase
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 6
      OnKeyPress = edthphmKeyPress
      Height = 21
      Width = 70
    end
    object cbbsf: TcxComboBox
      Left = 811
      Top = 316
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 75
    end
    object cbbhpzl: TcxComboBox
      Left = 968
      Top = 316
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 120
    end
    object edtsyr: TcxTextEdit
      Left = 811
      Top = 343
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 278
    end
    object edtclpp1: TcxTextEdit
      Left = 811
      Top = 370
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 9
      Height = 21
      Width = 103
    end
    object edtclpp2: TcxTextEdit
      Left = 986
      Top = 370
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 13
      Height = 21
      Width = 103
    end
    object edtclxh: TcxTextEdit
      Left = 811
      Top = 397
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 10
      Height = 21
      Width = 103
    end
    object edtccdjrq: TcxTextEdit
      Left = 986
      Top = 424
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 15
      Height = 21
      Width = 103
    end
    object edtyxqz: TcxTextEdit
      Left = 811
      Top = 451
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      Style.TextColor = clWindowText
      TabOrder = 12
      Height = 21
      Width = 103
    end
    object edtqzbfqz: TcxTextEdit
      Left = 986
      Top = 451
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 16
      Height = 21
      Width = 103
    end
    object mmozsxxdz: TcxMemo
      Left = 811
      Top = 478
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 17
      Height = 21
      Width = 278
    end
    object edtsyxz: TcxTextEdit
      Left = 811
      Top = 505
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 18
      Height = 21
      Width = 64
    end
    object edtfdjh: TcxTextEdit
      Left = 941
      Top = 505
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 21
      Height = 21
      Width = 148
    end
    object edthbbj: TcxTextEdit
      Left = 811
      Top = 532
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 19
      Height = 21
      Width = 64
    end
    object edtclsbdh: TcxTextEdit
      Left = 941
      Top = 532
      AutoSize = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style.HotTrack = False
      TabOrder = 22
      Height = 21
      Width = 148
    end
    object edtbxzzrq: TcxTextEdit
      Left = 811
      Top = 559
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 20
      Height = 21
      Width = 64
    end
    object edtfzjg: TcxTextEdit
      Left = 941
      Top = 559
      AutoSize = False
      ParentFont = False
      Style.HotTrack = False
      TabOrder = 23
      Height = 21
      Width = 148
    end
    object cxGrid1: TcxGrid
      Left = 752
      Top = -129
      Width = 337
      Height = 133
      TabOrder = 1
      object tvDev: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.InfoPanel.Visible = True
        DataController.DataSource = DataSource1
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ScrollBars = ssVertical
        OptionsView.ColumnAutoWidth = True
        OptionsView.FooterAutoHeight = True
        OptionsView.FooterMultiSummaries = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 25
        object tvDevColumn2: TcxGridDBColumn
          Caption = #21495#29260#21495#30721
          DataBinding.FieldName = 'HPHM'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 100
        end
        object tvDevColumn3: TcxGridDBColumn
          Caption = #21495#29260#31181#31867
          DataBinding.FieldName = 'HPZL'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 83
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = tvDev
      end
    end
    object imgviopic: TImageEnVect
      Left = 11
      Top = -128
      Width = 727
      Height = 755
      Background = clWhite
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      ZoomFilter = rfFastLinear
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 0
      OnMouseMove = imgviopicMouseMove
      OnMouseUp = imgviopicMouseUp
    end
    object img1: TImageEnView
      Left = 753
      Top = 11
      Width = 335
      Height = 260
      Background = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = False
      ScrollBars = ssNone
      AutoFit = True
      WallPaperStyle = iewoTile
      EnableInteractionHints = True
      TabOrder = 2
    end
    object edtBkzl: TcxTextEdit
      Left = 1022
      Top = 289
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 67
    end
    object cbbBklx: TcxComboBox
      Left = 811
      Top = 289
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 152
    end
    object cbbCllx: TcxComboBox
      Left = 986
      Top = 397
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 14
      Height = 21
      Width = 103
    end
    object cbbCsys: TcxComboBox
      Left = 811
      Top = 424
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 11
      Height = 21
      Width = 103
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object lgCenter: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object lgRight: TdxLayoutGroup
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahRight
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutSplitterItem2: TdxLayoutSplitterItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahRight
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
    object lgInfo: TdxLayoutGroup
      Parent = lgRight
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object liButton: TdxLayoutGroup
      Parent = lgRight
      AlignHorz = ahCenter
      AlignVert = avBottom
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = liButton
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnDelete
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = liButton
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 30
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = lgInfo
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #36710#29260#21495#30721
      Control = cbbsf
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = lgInfo
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup3
      Control = edthphm
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 70
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup3
      Control = cbbhpzl
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 120
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = lgInfo
      CaptionOptions.Text = #25152'  '#26377'  '#20154
      Control = edtsyr
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 200
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = lgInfo
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutGroup6: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      SizeOptions.AssignedValues = [sovSizableHorz]
      SizeOptions.SizableHorz = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup7: TdxLayoutGroup
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 2
    end
    object dxLayoutSplitterItem3: TdxLayoutSplitterItem
      Parent = dxLayoutGroup5
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
    object dxLayoutItem19: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahLeft
      CaptionOptions.Text = #20013#25991#21697#29260'*'
      Control = edtclpp1
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem20: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahLeft
      CaptionOptions.Text = #36710#36742#22411#21495
      Control = edtclxh
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahLeft
      CaptionOptions.Text = #26377#25928#26399#38480
      Control = edtyxqz
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem23: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #33521#25991#21697#29260
      Control = edtclpp2
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem25: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #30331#35760#26102#38388
      Control = edtccdjrq
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem26: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #25253#24223#26399#38480
      Control = edtqzbfqz
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutGroup8: TdxLayoutGroup
      Parent = lgInfo
      CaptionOptions.Text = #26356#22810
      ButtonOptions.Buttons = <>
      ButtonOptions.ShowExpandButton = True
      ItemIndex = 1
      ShowBorder = False
      Index = 5
    end
    object dxLayoutItem28: TdxLayoutItem
      Parent = dxLayoutGroup8
      CaptionOptions.Text = #24120#20303#22320#22336
      Control = mmozsxxdz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 90
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup9: TdxLayoutGroup
      Parent = dxLayoutGroup8
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup10: TdxLayoutGroup
      Parent = dxLayoutGroup9
      AlignHorz = ahLeft
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem31: TdxLayoutItem
      Parent = dxLayoutGroup10
      AlignHorz = ahLeft
      CaptionOptions.Text = #20351#29992#24615#36136
      Control = edtsyxz
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem32: TdxLayoutItem
      Parent = dxLayoutGroup10
      CaptionOptions.Text = #29615#20445#26631#35760
      Control = edthbbj
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem33: TdxLayoutItem
      Parent = dxLayoutGroup10
      CaptionOptions.Text = #20445#38505#26399#38480
      Control = edtbxzzrq
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutSplitterItem4: TdxLayoutSplitterItem
      Parent = dxLayoutGroup9
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Splitter'
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      Index = 1
    end
    object dxLayoutGroup11: TdxLayoutGroup
      Parent = dxLayoutGroup9
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      ItemIndex = 2
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem35: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = #21457#21160#26426#21495
      Control = edtfdjh
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem36: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = #36710#26550#21495#30721
      Control = edtclsbdh
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem37: TdxLayoutItem
      Parent = dxLayoutGroup11
      CaptionOptions.Text = #21457#35777#26426#20851
      Control = edtfzjg
      ControlOptions.MinHeight = 17
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 64
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = lgCenter
      AlignHorz = ahClient
      AlignVert = avClient
      Control = imgviopic
      ControlOptions.OriginalHeight = 767
      ControlOptions.OriginalWidth = 678
      Index = 0
    end
    object lgImage: TdxLayoutGroup
      Parent = lgRight
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem38: TdxLayoutItem
      Parent = lgImage
      Control = img1
      ControlOptions.OriginalHeight = 260
      ControlOptions.OriginalWidth = 255
      Index = 0
    end
    object lgGrid: TdxLayoutGroup
      Parent = lgRight
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object liVioTb: TdxLayoutItem
      Parent = lgGrid
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxGrid1
      ControlOptions.OriginalHeight = 133
      ControlOptions.OriginalWidth = 330
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = lgRight
      AlignVert = avBottom
      CaptionOptions.Text = 'Separator'
      Index = 3
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #24067#25511#31181#31867
      Control = edtBkzl
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 67
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #24067#25511#31867#22411
      Control = cbbBklx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = lgInfo
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup7
      CaptionOptions.Text = #36710#36742#31867#22411'*'
      Control = cbbCllx
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup6
      AlignHorz = ahLeft
      CaptionOptions.Text = #36710#36523#39068#33394'*'
      Control = cbbCsys
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object cxImageList1: TcxImageList
    FormatVersion = 1
    DesignInfo = 17826144
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000002000000070000000C0000001000000012000000110000
          000E000000080000000200000000000000000000000000000000000000000000
          000100000004000101120D2A1D79184E36C6216B4BFF216B4BFF216C4BFF1A53
          3AD20F2F21840001011500000005000000010000000000000000000000000000
          0005050F0A351C5B40DC24805CFF29AC7EFF2CC592FF2DC894FF2DC693FF2AAE
          80FF258560FF1A563DD405110C3D00000007000000010000000000000003040E
          0A31206548ED299D74FF2FC896FF2EC996FF56D4ACFF68DAB5FF3BCD9DFF30C9
          96FF32CA99FF2BA479FF227050F805110C3D00000005000000000000000A1A57
          3DD02EA57CFF33CA99FF2EC896FF4CD2A8FF20835CFF00673BFF45BE96FF31CB
          99FF31CB98FF34CC9CFF31AD83FF1B5C41D300010113000000020B23185E2E8A
          66FF3BCD9EFF30CA97FF4BD3A9FF349571FF87AF9DFFB1CFC1FF238A60FF45D3
          A8FF36CF9FFF33CD9BFF3ED0A3FF319470FF0F32237F00000007184D37B63DB3
          8CFF39CD9FFF4BD5A9FF43A382FF699782FFF8F1EEFFF9F3EEFF357F5DFF56C4
          A1FF43D5A8FF3ED3A4FF3CD1A4FF41BC95FF1B5C43CD0000000B1C6446DF4BCA
          A4FF44D2A8FF4FB392FF4E826AFFF0E9E6FFC0C3B5FFEFE3DDFFCEDDD4FF1B75
          4FFF60DCB8FF48D8ACFF47D6AAFF51D4ACFF247A58F80000000E217050F266D9
          B8FF46D3A8FF0B6741FFD2D2CBFF6A8F77FF116B43FF73967EFFF1E8E3FF72A2
          8BFF46A685FF5EDFBAFF4CD9AFFF6BE2C2FF278460FF020604191E684ADC78D9
          BEFF52DAB1FF3DBA92FF096941FF2F9C76FF57DEB8FF2D9973FF73967EFFF0EA
          E7FF4F886CFF5ABB9AFF5BDEB9FF7FE2C7FF27835FF80000000C19523BAB77C8
          B0FF62E0BCFF56DDB7FF59DFBAFF5CE1BDFF5EE2BEFF5FE4C1FF288C67FF698E
          76FFE6E1DCFF176B47FF5FD8B4FF83D5BDFF1E674CC60000000909201747439C
          7BFF95ECD6FF5ADFBAFF5EE2BDFF61E4BFFF64E6C1FF67E6C5FF67E8C7FF39A1
          7EFF1F6D4AFF288B64FF98EFD9FF4DAC8CFF1036286D00000004000000041C5F
          46B578C6ADFF9AEED9FF65E5C0FF64E7C3FF69E7C6FF6BE8C8FF6CE9C9FF6BEA
          C9FF5ED6B6FF97EDD7FF86D3BBFF237759D20102010C0000000100000001030A
          0718247B5BDA70C1A8FFB5F2E3FF98F0DAFF85EDD4FF75EBCEFF88EFD6FF9CF2
          DDFFBAF4E7FF78CDB3FF2A906DEA0615102E0000000200000000000000000000
          0001030A07171E694FB844AB87FF85D2BBFFA8E6D6FFC5F4EBFFABE9D8FF89D8
          C1FF4BB692FF237F60CB05130E27000000030000000000000000000000000000
          000000000001000000030A241B411B60489D258464CF2C9D77EE258867CF1F71
          56B00E3226560000000600000002000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000C05031A46110852AB190C76E31D0E89FF1C0E89FF190C
          76E4120852AD06031B4D0000000E000000030000000000000000000000000000
          000301010519130A55A9211593FF2225AEFF2430C2FF2535CBFF2535CCFF2430
          C3FF2225AFFF211594FF140B58B20101051E0000000400000000000000020101
          03151C1270CD2522A6FF2D3DCCFF394BD3FF3445D1FF2939CDFF2839CDFF3344
          D0FF394AD4FF2D3CCDFF2523A8FF1C1270D20101051D00000003000000091912
          5BA72A27AAFF2F41D0FF3541C7FF2726ABFF3137BCFF384AD3FF384BD3FF3137
          BCFF2726ABFF3540C7FF2E40D0FF2927ACFF1A115EB10000000D08061C3D3129
          A2FD2C3CCCFF3842C6FF5F5DBDFFEDEDF8FF8B89CEFF3337B9FF3437B9FF8B89
          CEFFEDEDF8FF5F5DBDFF3741C6FF2B3ACDFF3028A4FF0907204A1E185F9F373B
          BCFF3042D0FF2621A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
          EDFFF3E9E2FFECE6EBFF2621A5FF2E3FCFFF343ABEFF201A66B0312A92E03542
          CBFF3446D1FF2C2FB5FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
          E2FFEADAD1FF7F6FACFF2B2EB5FF3144D0FF3040CBFF312A95E53E37AEFA3648
          D0FF374AD3FF3A4ED5FF3234B4FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
          E5FF897DB8FF3233B4FF384BD3FF3547D2FF3446D1FF3E37AEFA453FB4FA4557
          D7FF3B50D5FF4C5FDAFF4343B7FF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
          E8FF9087C5FF4242B7FF495DD8FF394CD4FF3F52D4FF443FB3FA403DA1DC5967
          DAFF5B6EDDFF4F4DBAFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
          EAFFFAF5F2FF8F89CAFF4E4DB9FF576ADCFF5765D9FF403EA4E12E2D70987C85
          DDFF8798E8FF291D9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
          D8FFF4ECE7FFE5D9DCFF291D9BFF8494E7FF7A81DDFF33317BAC111125356768
          D0FC9EACEDFF686FCEFF5646A1FFCCB6BCFF7A68A8FF4C4AB6FF4D4BB7FF7A68
          A8FFCBB5BCFF5646A1FF666DCCFF9BAAEEFF696CD0FD1212273F000000043B3B
          79977D84DFFFA5B6F1FF6D74D0FF2D219BFF5151B9FF8EA2ECFF8EA1ECFF5252
          BBFF2D219BFF6B72D0FFA2B3F0FF8086E0FF404183A700000008000000010303
          050C4E509DBC8087E2FFAEBDF3FFA3B6F1FF9DAFF0FF95A9EEFF95A8EEFF9BAD
          EFFFA2B3F0FFACBCF3FF838AE3FF4F52A0C10303051100000002000000000000
          000100000005323464797378D9F8929CEAFFA1AEEFFFB0BFF3FFB0BFF4FFA2AE
          EFFF939DE9FF7479DAF83234647D000000080000000200000000000000000000
          000000000000000000031213232D40437D935D61B5D07378DFFC7378DFFC5D61
          B5D040437D951212223000000004000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000800000010000000100000
          0008000000010000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000006301D125F8A4C2DED854526ED2814
          0B60000000070000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000D9F6A49EAD8A471FFD3985FFF8345
          27EA0000000E0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000CAC7F5EECF5D9AEFFDEB285FF8D50
          30EC0000000D0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000532271F50A28368D29E7D61D22F23
          1A51000000050000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000600000011000000140000
          000A000000020000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000670503AA999532EFF4528
          187A000000070000000100000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000079F795AD7E5BF92FFAF72
          4AF724150D490000000800000002000000000000000000000000000000000000
          0000000000000000000100000004000000060000000868534089D6AD86FFF1D0
          9FFFB4774BFF693D24AE0D080520000000020000000000000000000000000000
          000000000000000000034C301E7A7B4526D0522F1A8F0A09071A9A6745E0ECD2
          AAFFF6D39CFFD8A470FF75452ABD000000060000000000000000000000000000
          00000000000000000005B6855FF7E8D4B2FFAF7A53FF2D1C1154745C489EC59B
          76FFF8E7BCFFF3CC95FFA0623BF7000000070000000000000000000000000000
          000000000000000000039C7D5EC9EFDDBFFFCAA682FF7E5E45B2917C61B4C197
          70FFF9ECC4FFE8CCA4FF845435C7000000050000000000000000000000000000
          000000000000000000012B241D38CFAF8CF7E8D2B3FFCBA888FFBF9674FFF0E1
          C5FFDDBF9EFFAF7D58F01F140D34000000010000000000000000000000000000
          0000000000000000000000000001231E182D877158A5C3A07DEED9BA96FFBA99
          77E570533B9A17100A2500000002000000000000000000000000000000000000
          0000000000000000000000000000000000010000000100000002000000030000
          0002000000020000000100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000020000000800000011000000110000
          0008000000020000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000007291F1B607D5E53ED77574DED2319
          1663000000080000000000000000000000000000000000000000000000000000
          00000000000000000000000000010000000F85685CEAD1C2BBFFB2998CFF7556
          4CEB000000120000000100000000000000000000000000000000000000000000
          00000000000000000000000000020F0C0B2CA28376FFDACCC6FFB69E93FF8D6B
          5FFF0C0908300000000200000000000000000000000000000000000000000000
          00000000000000000000000000043026225FB3998CFFD9CCC6FFB69E93FF9979
          6CFF281E1B630000000600000000000000000000000000000000000000000000
          0000000000000000000000000007114069921681DAFF1695E9FF0976DFFF1480
          D9FF0D3C66960000000A00000000000000000000000000000000000000000000
          000000000000000000010000000E1D67A8D51E94E5FF26A2ECFF1284E3FF1D93
          E4FF1761A3D80000001300000003000000000000000000000000000000000000
          0000000000010000000714446E912E9BE1FF2EADEEFF26A8EDFF26A8EDFF2DAC
          EEFF2C9AE1FF104676A40000000D000000010000000000000000000000000000
          0000000000030B21354A3397DDFF4AC8F4FF38C0F2FF38C0F2FF38C0F2FF38C0
          F2FF48C7F3FF3097DBFF0A2B486D000000060000000000000000000000000000
          000000000005246AA5C859CBF1FF4FD8F7FF60DEF9FF4ED8F7FF4ED8F7FF60DE
          F9FF4FD8F7FF56C8EFFF185E9DCC0000000B0000000000000000000000000000
          0000000000052E82CDF173E2F7FF52DDF7FF77E5FAFF8AEBFBFF89EBFBFF78E6
          F9FF51DCF7FF75E4F8FF1F7BCAFA0000000C0000000000000000000000000000
          0000000000043185CEF179DAF5FF51CFF4FF71D8F5FF8BDFF7FF8BDFF7FF72D9
          F5FF50CEF3FF7ADDF7FF217DCBFA0000000B0000000000000000000000000000
          000000000003296EA9C66DC7F0FF7BD1F4FFBBE7F9FFBAE7F9FFBAE7F9FFBAE7
          F9FF7AD0F4FF69C3EEFF1D62A1CA000000080000000000000000000000000000
          0000000000010E243743489FE0FD9FD9F6FFE5F4FCFFE4F3FCFFE3F3FCFFE5F4
          FCFF9FD9F6FF459CDEFF0C2A435B000000030000000000000000000000000000
          000000000000000000011B45697B499FE2FFB0D9F5FFE9F5FDFFE9F5FCFFB0D9
          F4FF4299DEFF16466F8B00000005000000010000000000000000000000000000
          00000000000000000000000000010E24374226649AB33080C6E52E7FC4E52261
          98B40C2236450000000300000001000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
          82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
          59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
          45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
          44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
          D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
          3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
          3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
          5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFDEAF75FFDEAF75FFDEB074FFDDAF
          75FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFDFB279FFE0B379FFE0B27AFFE0B2
          79FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFE1B67EFFE2B67FFFE2B77FFFE2B7
          7FFFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFE8C494FFE8C594FFE8C495FFE8C4
          95FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFB0794AFFAB7245FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF5EEE9FFFAF6F3FFFAF7F3FFFBF7F4FFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE6D9D2FFE7DBD4FFE9DED7FFEAE0D9FFEAE0DAFFEBE1
          DBFFEBE0DBFFEEE5E1FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFA56B3FFFA56B3FFFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFF1D7ABFFF1D8ADFFF1D8ADFFF1D8
          ADFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFF3DCB3FFF3DEB4FFF3DEB4FFF3DE
          B4FFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFF4E1B9FFF5E3BBFFF5E2BBFFF5E2
          BBFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000020000000B00000019000000260000002F0000002F0000
          00260000001A0000000C00000002000000000000000000000000000000000000
          0000000000040000001A02041F6A040849B9040B6AE5060B80F905097CF90306
          62E6010340BB0001196D0000001C000000050000000000000000000000000000
          00040000001F04073E9F070F7EEF080F91FF070D8CFF050B89FF040985FF0308
          81FF02067EFF010467F1010231A4000000220000000500000000000000020000
          00170509409C0A1392FA0A1396FF6066B9FFADAFD9FFE6E7F3FFE6E7F3FFACAE
          D5FF5E60ADFF03067DFF020574FB010332A30000001B00000002000000090305
          2161091384EC0B159CFF8489CBFFFFFFFFFFD3D3D3FF6E6E6EFF3B3A3BFF7B7B
          7BFFF5F5F5FF8183BFFF03077FFF030569F000011A6A0000000B00000012070D
          53AC0C17A1FF6269C0FFFFFFFFFFDDDDDCFF4D4D4DFF424141FF3B3A3BFF3535
          35FF8E8E8EFFFFFFFFFF5E61AEFF040881FF020442B600000018000000190A14
          7DDA0D17A3FFAFB2DFFFDFDFDFFF616060FF505051FF454545FF3F3F3FFF3B3B
          3BFF595959FFFFFFFFFFACAED6FF040A85FF040865E1000000210000001C0E18
          9DF50D18A4FFE7E8F6FFAAA9A9FFA5A5A5FF5C5C5CFF4A4A4AFF454545FF4241
          41FF656565FFFFFFFFFFE6E7F3FF060B89FF060C81F700000027000000190E19
          9EF40E19A6FFE7E8F6FFFFFFFFFFFFFFFFFF6B6B6BFF7F7F7FFF5E5E5EFF7F7F
          80FF7F7F7FFFFFFFFFFFE7E7F4FF070D8DFF070D84F700000024000000120C15
          81D30F1AA9FFAFB3E1FFFFFFFFFFFFFFFFFF717272FF909090FF747474FF9090
          90FFA9AAA9FFFFFFFFFFAEB0DBFF071091FF060C6EDB0000001B0000000A080F
          57990F1CABFF656DC7FFFFFFFFFFFFFFFFFF7D7E7EFF979697FF878787FF9999
          99FFC9C9C9FFFFFFFFFF6268BBFF091196FF05094BA500000010000000040306
          24480D1891E0101DAAFF878DD4FFFFFFFFFFF7F7F6FFA4A4A4FFA7A7A7FFCACA
          CAFFF8F8F8FF858ACDFF0C159AFF081081E50204205400000006000000000000
          0008070C47790F1CA5F4101DABFF656DC7FFB0B3E2FFE3E4F1FFE7E8F6FFAFB3
          E0FF646AC2FF0D179FFF0B1496F6050840850000000D00000001000000000000
          000100000008070C48760D1992DD0F1CACFF0E1BABFF0F1AA8FF0E19A6FF0D19
          A5FF0D18A4FF0A1489E00509427F0000000E0000000200000000000000000000
          000000000001000000050306243F080E588D0C1683C90E1AA0F00E199EF00B15
          80CB070D55920305224600000009000000020000000000000000000000000000
          0000000000000000000000000002000000040000000600000009000000090000
          0008000000060000000300000000000000000000000000000000}
      end>
  end
  object tbVio: TFDMemTable
    BeforeDelete = tbVioBeforeDelete
    AfterDelete = tbVioAfterDelete
    AfterScroll = tbVioAfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 328
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = tbVio
    Left = 376
    Top = 128
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 56
    Top = 32
  end
  object Timer2: TTimer
    Interval = 1
    OnTimer = Timer2Timer
    Left = 96
    Top = 32
  end
end
