inherited dxDialogBaseFrame: TdxDialogBaseFrame
  Width = 610
  Height = 504
  Align = alNone
  AutoSize = True
  ExplicitWidth = 610
  ExplicitHeight = 504
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 610
    Height = 504
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alNone
    ExplicitWidth = 610
    ExplicitHeight = 504
    object btnSave: TcxButton [0]
      Left = 223
      Top = 451
      Width = 81
      Height = 25
      Caption = #30830#23450
      OptionsImage.ImageIndex = 56
      TabOrder = 0
    end
    object btnExit: TcxButton [1]
      Left = 311
      Top = 451
      Width = 75
      Height = 25
      Caption = #21462#28040
      OptionsImage.ImageIndex = 57
      TabOrder = 1
      OnClick = btnExitClick
    end
    inherited dxLayoutControl2Group_Root: TdxLayoutGroup
      CaptionOptions.Visible = False
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      Index = 0
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup1
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup2: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 2
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 81
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup4: TdxLayoutGroup
      Parent = dxLayoutGroup2
      AlignHorz = ahCenter
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup4
      CaptionOptions.Visible = False
      Control = btnExit
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutSeparatorItem1: TdxLayoutSeparatorItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'Separator'
      Index = 1
    end
  end
end
