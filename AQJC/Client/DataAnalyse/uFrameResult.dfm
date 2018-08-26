inherited FrameResult: TFrameResult
  Width = 455
  Height = 329
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 455
    Height = 329
    inherited cxGrid1: TcxGrid
      Left = 45
      Width = 397
      Height = 263
      TabOrder = 1
      ExplicitLeft = 45
      ExplicitWidth = 397
      ExplicitHeight = 263
    end
    inherited cbbPagesize: TcxComboBox
      Top = 295
      TabOrder = 2
      ExplicitTop = 295
    end
    inherited btnFirstPage: TcxButton
      Top = 295
      TabOrder = 3
      ExplicitTop = 295
    end
    inherited btnPriorPage: TcxButton
      Top = 295
      TabOrder = 4
      ExplicitTop = 295
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 295
      TabOrder = 5
      ExplicitTop = 295
    end
    inherited btnnextPage: TcxButton
      Top = 295
      TabOrder = 6
      ExplicitTop = 295
    end
    inherited btnLastPage: TcxButton
      Top = 295
      TabOrder = 7
      ExplicitTop = 295
    end
    object cxButton1: TcxButton [7]
      Left = 13
      Top = 25
      Width = 25
      Height = 25
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = DM.ilBarSmall
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      OnClick = cxButton1Click
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      Visible = False
    end
    inherited dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutGroup1: TdxLayoutGroup
      Parent = dxLayoutControl2Group_Root
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup3: TdxLayoutGroup
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 25
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
end
