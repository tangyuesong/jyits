inherited fLock: TfLock
  inherited dxLayoutControl2: TdxLayoutControl
    object btnSave: TcxButton [0]
      Left = 281
      Top = 13
      Width = 75
      Height = 25
      Caption = #19978#20256
      TabOrder = 2
      OnClick = btnSaveClick
    end
    object btnStop: TcxButton [1]
      Left = 363
      Top = 13
      Width = 75
      Height = 25
      Caption = #20572#27490
      TabOrder = 3
      OnClick = btnStopClick
    end
    inherited cxGrid1: TcxGrid
      Top = 45
      Height = 219
      TabOrder = 4
      ExplicitTop = 45
      ExplicitHeight = 219
      inherited GridView: TcxGridDBTableView
        OptionsView.ScrollBars = ssVertical
        OptionsView.FooterAutoHeight = False
        OptionsView.FooterMultiSummaries = False
      end
    end
    object pb: TcxProgressBar [3]
      Left = 91
      Top = 13
      Properties.PeakValue = 100.000000000000000000
      TabOrder = 1
      Width = 183
    end
    object pb1: TcxProgressBar [4]
      Left = 13
      Top = 13
      Properties.PeakValue = 100.000000000000000000
      TabOrder = 0
      Width = 71
    end
    inherited cbbPagesize: TcxComboBox
      TabOrder = 5
    end
    inherited btnFirstPage: TcxButton
      TabOrder = 6
    end
    inherited btnPriorPage: TcxButton
      TabOrder = 7
    end
    inherited edtPageIndex: TcxTextEdit
      TabOrder = 8
    end
    inherited btnnextPage: TcxButton
      TabOrder = 9
    end
    inherited btnLastPage: TcxButton
      TabOrder = 10
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      Control = pb
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 767
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnSave
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnStop
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      AlignHorz = ahClient
      Control = pb1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 300
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 472
    Top = 112
  end
end
