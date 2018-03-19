inherited FramePictureCompare: TFramePictureCompare
  Width = 833
  Height = 473
  Align = alClient
  ExplicitWidth = 833
  ExplicitHeight = 473
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 833
    Height = 473
    Align = alClient
    AutoSize = True
    ExplicitWidth = 833
    ExplicitHeight = 473
    inherited btnSave: TcxButton
      Left = 335
      Top = 435
      Caption = #35270#39057
      TabOrder = 2
      OnClick = btnSaveClick
      ExplicitLeft = 335
      ExplicitTop = 435
    end
    inherited btnExit: TcxButton
      Left = 423
      Top = 435
      Caption = #36820#22238
      TabOrder = 3
      ExplicitLeft = 423
      ExplicitTop = 435
    end
    object cxImage1: TcxImage [2]
      Left = 13
      Top = 13
      Style.HotTrack = False
      TabOrder = 0
      Height = 402
      Width = 444
    end
    object cxImage2: TcxImage [3]
      Left = 464
      Top = 13
      Style.HotTrack = False
      TabOrder = 1
      Height = 402
      Width = 356
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
    inherited dxLayoutItem3: TdxLayoutItem
      Visible = False
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
