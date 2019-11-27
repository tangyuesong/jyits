inherited FrameBugEdit: TFrameBugEdit
  Width = 1130
  Height = 656
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 1130
    Height = 656
    CustomizeFormTabbedView = True
    object BtnSave: TcxButton [0]
      Left = 486
      Top = 603
      Width = 75
      Height = 25
      Caption = #20445#23384
      OptionsImage.ImageIndex = 1582
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 4
      OnClick = BtnSaveClick
    end
    object BtnExit: TcxButton [1]
      Left = 568
      Top = 603
      Width = 75
      Height = 25
      Caption = #36820#22238
      OptionsImage.ImageIndex = 232
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = BtnExitClick
    end
    object cboCategery: TcxComboBox [2]
      Left = 82
      Top = 36
      AutoSize = False
      Properties.Items.Strings = (
        #20845#21512#19968#31995#32479
        #29436#34523#31995#32479
        #38598#25104#24179#21488
        'PDA'
        #30828#20214
        #32593#32476)
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 167
    end
    object edtTitle: TcxTextEdit [3]
      Left = 286
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 816
    end
    object memMS: TcxMemo [4]
      Left = 82
      Top = 64
      Style.HotTrack = False
      TabOrder = 2
      Height = 97
      Width = 1020
    end
    object edtBZR: TcxTextEdit [5]
      Left = 82
      Top = 485
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 6
      Height = 21
      Width = 408
    end
    object edtBZSJ: TcxTextEdit [6]
      Left = 763
      Top = 485
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 8
      Height = 21
      Width = 151
    end
    object cboStatus: TcxComboBox [7]
      Left = 951
      Top = 485
      AutoSize = False
      Properties.Items.Strings = (
        '0: '#26410#22788#29702
        '1: '#22788#29702#20013
        '2: '#24050#22788#29702
        '3: '#26080#25928)
      Style.HotTrack = False
      TabOrder = 9
      Text = '0: '#26410#22788#29702
      Height = 21
      Width = 151
    end
    object edtLXDH: TcxTextEdit [8]
      Left = 551
      Top = 485
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 7
      Height = 21
      Width = 151
    end
    object memHFNR: TcxMemo [9]
      Left = 82
      Top = 513
      Style.HotTrack = False
      TabOrder = 10
      Height = 83
      Width = 1020
    end
    object cxScrollBox1: TcxScrollBox [10]
      Left = 82
      Top = 168
      Width = 1020
      Height = 310
      TabOrder = 3
      object cxImage1: TcxImage
        Left = 0
        Top = 0
        Align = alLeft
        Properties.Caption = #27983#35272#8230#8230
        Properties.PopupMenuLayout.MenuItems = []
        TabOrder = 0
        OnClick = cxImage1Click
        ExplicitLeft = -6
        ExplicitTop = -2
        Height = 308
        Width = 217
      end
      object cxImage2: TcxImage
        Left = 217
        Top = 0
        Align = alLeft
        Properties.Caption = #27983#35272#8230#8230
        Properties.PopupMenuLayout.MenuItems = []
        TabOrder = 1
        OnClick = cxImage1Click
        ExplicitLeft = 203
        ExplicitTop = 30
        Height = 308
        Width = 217
      end
      object cxImage3: TcxImage
        Left = 434
        Top = 0
        Align = alLeft
        Properties.Caption = #27983#35272#8230#8230
        Properties.PopupMenuLayout.MenuItems = []
        TabOrder = 2
        OnClick = cxImage1Click
        ExplicitLeft = 424
        ExplicitTop = 2
        ExplicitHeight = 159
        Height = 308
        Width = 217
      end
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      CaptionOptions.Visible = False
      LayoutDirection = ldHorizontal
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Index = 0
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
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup6
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = BtnExit
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem22: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #31867#22411
      Control = cboCategery
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 167
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #26631#39064
      Control = edtTitle
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 80
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #38382#39064#25551#36848
      Control = memMS
      ControlOptions.OriginalHeight = 97
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = #20445#38556#20154
      Control = edtBZR
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 271
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = #25253#38556#26102#38388
      Control = edtBZSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 151
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup2
      LayoutDirection = ldHorizontal
      Index = 4
      AutoCreated = True
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = #29366#24577
      Control = cboStatus
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 151
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avBottom
      CaptionOptions.Text = #32852#31995#30005#35805
      Control = edtLXDH
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 151
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object liHFNR: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #22238#22797#20869#23481
      Control = memHFNR
      ControlOptions.OriginalHeight = 83
      ControlOptions.OriginalWidth = 965
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = #38382#39064#22270#29255
      Control = cxScrollBox1
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 161
      ControlOptions.OriginalWidth = 625
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 360
    Top = 352
  end
end
