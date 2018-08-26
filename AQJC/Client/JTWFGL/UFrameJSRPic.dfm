inherited FrameJSRPic: TFrameJSRPic
  Width = 834
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 834
    object cxImage1: TcxImage [0]
      Left = 28
      Top = 36
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 154
      Width = 455
    end
    object cxImage2: TcxImage [1]
      Left = 490
      Top = 36
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 154
      Width = 454
    end
    object edtSfzhm: TcxTextEdit [2]
      Left = 82
      Top = 235
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 197
    end
    object edtXm: TcxTextEdit [3]
      Left = 316
      Top = 235
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 127
    end
    object edtLxdz: TcxTextEdit [4]
      Left = 580
      Top = 235
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 5
      Height = 21
      Width = 282
    end
    object btnexit1: TcxButton [5]
      Left = 869
      Top = 235
      Width = 75
      Height = 25
      Caption = #36820#22238
      OptionsImage.ImageIndex = 232
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 6
      OnClick = btnexit1Click
    end
    object edtXb: TcxTextEdit [6]
      Left = 480
      Top = 235
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 39
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      Index = 1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxImage1
      ControlOptions.OriginalHeight = 100
      ControlOptions.OriginalWidth = 140
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup4
      AlignHorz = ahClient
      AlignVert = avClient
      Control = cxImage2
      ControlOptions.OriginalHeight = 100
      ControlOptions.OriginalWidth = 140
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #36829#27861#34892#20026
      Control = edtSfzhm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 197
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #22995#21517
      Control = edtXm
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 127
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #32852#31995#22320#22336
      Control = edtLxdz
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 282
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnexit1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #24615#21035
      Control = edtXb
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 39
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
