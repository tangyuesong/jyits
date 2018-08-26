inherited FrameAddSms: TFrameAddSms
  Width = 332
  Height = 118
  Align = alNone
  ExplicitWidth = 332
  ExplicitHeight = 118
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 332
    Height = 118
    ExplicitWidth = 359
    ExplicitHeight = 105
    object cxTextEdit1: TcxTextEdit [0]
      Left = 61
      Top = 36
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 243
    end
    object cxButton2: TcxButton [1]
      Left = 147
      Top = 64
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object cxButton1: TcxButton [2]
      Left = 229
      Top = 64
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 2
      OnClick = cxButton1Click
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21517#31216':'
      Control = cxTextEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahRight
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
