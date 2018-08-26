inherited FrameTJJCCJ: TFrameTJJCCJ
  Width = 851
  Height = 361
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 851
    Height = 361
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 825
      Height = 250
      TabOrder = 6
      ExplicitTop = 45
      ExplicitWidth = 825
      ExplicitHeight = 250
    end
    object rbYear: TcxRadioButton [1]
      Left = 13
      Top = 17
      Width = 50
      Height = 17
      Caption = #24180
      TabOrder = 0
      OnClick = BtnClick
      Transparent = True
    end
    object RBmonth: TcxRadioButton [2]
      Left = 70
      Top = 17
      Width = 50
      Height = 17
      Caption = #26376
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = BtnClick
      Transparent = True
    end
    object RBDate: TcxRadioButton [3]
      Left = 127
      Top = 17
      Width = 50
      Height = 17
      Caption = #26085
      TabOrder = 2
      OnClick = BtnClick
      Transparent = True
    end
    inherited cbbPagesize: TcxComboBox
      Top = 302
      TabOrder = 7
      ExplicitTop = 302
    end
    inherited btnFirstPage: TcxButton
      Top = 302
      TabOrder = 8
      ExplicitTop = 302
    end
    inherited btnPriorPage: TcxButton
      Top = 302
      TabOrder = 9
      ExplicitTop = 302
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 302
      TabOrder = 10
      ExplicitTop = 302
    end
    inherited btnnextPage: TcxButton
      Top = 302
      TabOrder = 11
      ExplicitTop = 302
    end
    inherited btnLastPage: TcxButton
      Top = 302
      TabOrder = 12
      ExplicitTop = 302
    end
    object dtBegin: TcxDateEdit [10]
      Left = 238
      Top = 13
      AutoSize = False
      EditValue = 43282d
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ShowToday = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 3
      Height = 25
      Width = 92
    end
    object dtEnd: TcxDateEdit [11]
      Left = 348
      Top = 13
      AutoSize = False
      EditValue = 43282d
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.ShowToday = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 4
      Height = 25
      Width = 92
    end
    object btnOK: TcxButton [12]
      Left = 447
      Top = 13
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 5
      OnClick = btnOKClick
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      AlignHorz = ahLeft
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avCenter
      CaptionOptions.Text = 'cxRadioButton1'
      CaptionOptions.Visible = False
      Control = rbYear
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avCenter
      CaptionOptions.Text = 'cxRadioButton2'
      CaptionOptions.Visible = False
      Control = RBmonth
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avCenter
      CaptionOptions.Text = 'cxRadioButton3'
      CaptionOptions.Visible = False
      Control = RBDate
      ControlOptions.AutoColor = True
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 50
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl2Group_Root
      CaptionOptions.Text = #27880#65306#29616#22330#24320#20855#25991#20070' 6'#20998#65307#25509#21463#22788#29702' 3'#20998#65307#24050#22788#32602' 2'#20998#65307#25945#32946#21518#25918#34892' 1'#20998#65307#23244#30097#36710#23457#25209' 1'#20998
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = #32479#35745#26102#38388
      Control = dtBegin
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 92
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignVert = avClient
      CaptionOptions.Text = '-'
      Control = dtEnd
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 92
      ControlOptions.ShowBorder = False
      Index = 4
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
      Index = 5
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 208
    Top = 136
  end
end
