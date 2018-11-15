inherited FrameLogTotal: TFrameLogTotal
  Width = 848
  Height = 441
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 848
    Height = 441
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 822
      Height = 355
      TabOrder = 4
      ExplicitTop = 45
      ExplicitWidth = 822
      ExplicitHeight = 355
    end
    inherited cbbPagesize: TcxComboBox
      Top = 407
      TabOrder = 5
      ExplicitTop = 407
    end
    inherited btnFirstPage: TcxButton
      Top = 407
      TabOrder = 6
      ExplicitTop = 407
    end
    inherited btnPriorPage: TcxButton
      Top = 407
      TabOrder = 7
      ExplicitTop = 407
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 407
      TabOrder = 8
      ExplicitTop = 407
    end
    inherited btnnextPage: TcxButton
      Top = 407
      TabOrder = 9
      ExplicitTop = 407
    end
    inherited btnLastPage: TcxButton
      Top = 407
      TabOrder = 10
      ExplicitTop = 407
    end
    object DTKSSJ: TcxDateEdit [7]
      Left = 43
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 103
    end
    object DTJSSJ: TcxDateEdit [8]
      Left = 171
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 103
    end
    object edtYhbh: TcxTextEdit [9]
      Left = 311
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 103
    end
    object Button1: TButton [10]
      Left = 421
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = Button1Click
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26102#38388
      Control = DTKSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = DTJSSJ
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #29992#25143
      Control = edtYhbh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = Button1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
end
