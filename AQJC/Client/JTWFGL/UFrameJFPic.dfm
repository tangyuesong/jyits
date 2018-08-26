inherited FrameJFPic: TFrameJFPic
  Width = 738
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 738
    object cxImage1: TcxImage [0]
      Left = 28
      Top = 36
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 0
      Height = 171
      Width = 338
    end
    object cxImage2: TcxImage [1]
      Left = 373
      Top = 36
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 1
      Height = 171
      Width = 337
    end
    object edtwfxw: TcxTextEdit [2]
      Left = 82
      Top = 252
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 230
    end
    object edtfkje: TcxTextEdit [3]
      Left = 349
      Top = 252
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 121
    end
    object edtjf: TcxTextEdit [4]
      Left = 507
      Top = 252
      AutoSize = False
      Properties.ReadOnly = True
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 121
    end
    object btnexit1: TcxButton [5]
      Left = 635
      Top = 252
      Width = 75
      Height = 25
      Caption = #36820#22238
      OptionsImage.ImageIndex = 232
      OptionsImage.Images = DM.ilBarSmall
      TabOrder = 5
      OnClick = btnexit1Click
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
      AlignHorz = ahClient
      CaptionOptions.Text = #36829#27861#34892#20026
      Control = edtwfxw
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #32602#27454
      Control = edtfkje
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #35760#20998
      Control = edtjf
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnexit1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
