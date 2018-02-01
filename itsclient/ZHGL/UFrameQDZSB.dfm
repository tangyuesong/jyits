inherited FrameQDZSB: TFrameQDZSB
  Height = 481
  ExplicitHeight = 481
  inherited dxLayoutControl2: TdxLayoutControl
    Height = 481
    CustomizeFormTabbedView = True
    ExplicitHeight = 481
    inherited btnSave: TcxButton
      Top = 428
      TabOrder = 7
      OnClick = btnSaveClick
      ExplicitTop = 428
    end
    inherited btnExit: TcxButton
      Top = 428
      TabOrder = 8
      ExplicitTop = 428
    end
    object EdtSBMC: TcxTextEdit [2]
      Left = 82
      Top = 92
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 500
    end
    object MmoBZ: TcxMemo [3]
      Left = 82
      Top = 120
      Lines.Strings = (
        '')
      Style.HotTrack = False
      TabOrder = 3
      Height = 107
      Width = 500
    end
    object EdtSBZL: TcxComboBox [4]
      Left = 82
      Top = 36
      AutoSize = False
      Properties.OnCloseUp = EdtSBZLPropertiesCloseUp
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 500
    end
    object Img3: TImageEnView [5]
      Left = 403
      Top = 235
      Width = 178
      Height = 172
      Background = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 6
    end
    object Img2: TImageEnView [6]
      Left = 216
      Top = 235
      Width = 178
      Height = 172
      Background = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 5
    end
    object Img1: TImageEnView [7]
      Left = 29
      Top = 235
      Width = 178
      Height = 172
      Background = clBtnFace
      Ctl3D = False
      ParentCtl3D = False
      BorderStyle = bsNone
      LegacyBitmap = True
      AutoFit = True
      EnableInteractionHints = True
      TabOrder = 4
      OnClick = Img1Click
    end
    object EdtSBDM: TcxTextEdit [8]
      Left = 82
      Top = 64
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 500
    end
    inherited dxLayoutGroup1: TdxLayoutGroup
      CaptionOptions.Text = #21149#23548#31449#35774#22791#31649#29702
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #35774#22791#21517#31216
      Control = EdtSBMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignVert = avClient
      CaptionOptions.Text = #35774#22791#22791#27880
      Control = MmoBZ
      ControlOptions.OriginalHeight = 53
      ControlOptions.OriginalWidth = 185
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #35774#22791#31181#31867
      Control = EdtSBZL
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 40
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutGroup5: TdxLayoutGroup
      Parent = dxLayoutGroup3
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 4
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'ImageEnView1'
      CaptionOptions.Visible = False
      Control = Img3
      ControlOptions.OriginalHeight = 103
      ControlOptions.OriginalWidth = 105
      Index = 2
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup5
      CaptionOptions.Text = 'ImageEnView2'
      CaptionOptions.Visible = False
      Control = Img1
      ControlOptions.OriginalHeight = 172
      ControlOptions.OriginalWidth = 178
      Index = 0
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup5
      AlignHorz = ahClient
      AlignVert = avClient
      CaptionOptions.Text = 'ImageEnView3'
      CaptionOptions.Visible = False
      Control = Img2
      ControlOptions.OriginalHeight = 103
      ControlOptions.OriginalWidth = 105
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup3
      CaptionOptions.Text = #35774#22791#32534#21495
      Control = EdtSBDM
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = '*.jpg'
    Filter = '*.jpg'
    Left = 320
    Top = 40
  end
end
