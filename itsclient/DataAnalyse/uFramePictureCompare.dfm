inherited FramePictureCompare: TFramePictureCompare
  Width = 835
  Height = 305
  Align = alClient
  ExplicitWidth = 451
  ExplicitHeight = 305
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 835
    Height = 305
    Align = alClient
    AutoSize = True
    ExplicitWidth = 451
    ExplicitHeight = 305
    inherited btnSave: TcxButton
      Left = 336
      Top = 267
      Caption = #24067#25511
      TabOrder = 2
      OnClick = btnSaveClick
      ExplicitLeft = 336
      ExplicitTop = 267
    end
    inherited btnExit: TcxButton
      Left = 424
      Top = 267
      Caption = #36820#22238
      TabOrder = 3
      ExplicitLeft = 424
      ExplicitTop = 267
    end
    object cxImage1: TcxImage [2]
      Left = 13
      Top = 13
      Style.HotTrack = False
      TabOrder = 0
      Height = 234
      Width = 444
    end
    object cxImage2: TcxImage [3]
      Left = 464
      Top = 13
      Style.HotTrack = False
      TabOrder = 1
      Height = 234
      Width = 358
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahClient
      CaptionOptions.Text = #31614#25910
      ShowBorder = False
    end
    inherited dxLayoutGroup3: TdxLayoutGroup
      CaptionOptions.Visible = False
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroup4: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.AlignHorz = taCenter
      CaptionOptions.Text = 'cxImage1'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clBottom
      Control = cxImage1
      ControlOptions.OriginalHeight = 400
      ControlOptions.OriginalWidth = 444
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.AlignHorz = taCenter
      CaptionOptions.Text = 'fdsa'
      CaptionOptions.Visible = False
      CaptionOptions.Layout = clBottom
      Control = cxImage2
      ControlOptions.OriginalHeight = 400
      ControlOptions.OriginalWidth = 400
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
