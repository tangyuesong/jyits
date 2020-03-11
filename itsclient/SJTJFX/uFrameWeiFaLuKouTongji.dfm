inherited FrameWeiFaLuKouTongji: TFrameWeiFaLuKouTongji
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 721
      Height = 195
      TabOrder = 5
      ExplicitTop = 45
      ExplicitWidth = 721
      ExplicitHeight = 195
    end
    inherited cbbPagesize: TcxComboBox
      Top = 247
      TabOrder = 6
      ExplicitTop = 247
    end
    inherited btnFirstPage: TcxButton
      Top = 247
      TabOrder = 7
      ExplicitTop = 247
    end
    inherited btnPriorPage: TcxButton
      Top = 247
      TabOrder = 8
      ExplicitTop = 247
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 247
      TabOrder = 9
      ExplicitTop = 247
    end
    inherited btnnextPage: TcxButton
      Top = 247
      TabOrder = 10
      ExplicitTop = 247
    end
    inherited btnLastPage: TcxButton
      Top = 247
      TabOrder = 11
      ExplicitTop = 247
    end
    object dtBegin: TcxDateEdit [7]
      Left = 67
      Top = 13
      AutoSize = False
      EditValue = 43282d
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ShowToday = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 25
      Width = 110
    end
    object dtEnd: TcxDateEdit [8]
      Left = 195
      Top = 13
      AutoSize = False
      EditValue = 43282d
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ShowToday = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 25
      Width = 110
    end
    object btnOK: TcxButton [9]
      Left = 577
      Top = 13
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 3
      OnClick = btnOKClick
    end
    object cxButton1: TcxButton [10]
      Left = 659
      Top = 13
      Width = 75
      Height = 25
      Caption = #23548#20986
      TabOrder = 4
      OnClick = cxButton1Click
    end
    object cboWFXW: TcxComboBox [11]
      Left = 366
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 25
      Width = 204
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      AlignHorz = ahLeft
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = #32479#35745#26102#38388
      Control = dtBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = '-'
      Control = dtEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 110
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = btnOK
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = #36829#27861#34892#20026
      Control = cboWFXW
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 204
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object Timer1: TTimer
    Interval = 1
    Left = 208
    Top = 136
  end
end
