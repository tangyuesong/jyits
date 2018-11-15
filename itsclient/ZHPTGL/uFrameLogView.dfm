inherited FrameLogView: TFrameLogView
  inherited dxLayoutControl2: TdxLayoutControl
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 826
      Height = 202
      TabOrder = 6
      ExplicitTop = 45
      ExplicitWidth = 826
      ExplicitHeight = 202
    end
    inherited cbbPagesize: TcxComboBox
      Top = 254
      TabOrder = 7
      ExplicitTop = 254
    end
    inherited btnFirstPage: TcxButton
      Top = 254
      TabOrder = 8
      ExplicitTop = 254
    end
    inherited btnPriorPage: TcxButton
      Top = 254
      TabOrder = 9
      ExplicitTop = 254
    end
    inherited edtPageIndex: TcxTextEdit
      Top = 254
      TabOrder = 10
      ExplicitTop = 254
    end
    inherited btnnextPage: TcxButton
      Top = 254
      TabOrder = 11
      ExplicitTop = 254
    end
    inherited btnLastPage: TcxButton
      Top = 254
      TabOrder = 12
      ExplicitTop = 254
    end
    object DTKSSJ: TcxDateEdit [7]
      Left = -358
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 103
    end
    object DTJSSJ: TcxDateEdit [8]
      Left = -230
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 103
    end
    object cmbResult: TcxComboBox [9]
      Left = -90
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        ''
        #25104#21151
        #22833#36133)
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 79
    end
    object edtYhbh: TcxTextEdit [10]
      Left = 26
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 3
      Height = 21
      Width = 103
    end
    object edtRequest: TcxTextEdit [11]
      Left = 166
      Top = 13
      AutoSize = False
      Style.HotTrack = False
      TabOrder = 4
      Height = 21
      Width = 190
    end
    object Button1: TButton [12]
      Left = 363
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 5
      OnClick = Button1Click
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
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
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #32467#26524
      Control = cmbResult
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 79
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #29992#25143
      Control = edtYhbh
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 103
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #35831#27714
      Control = edtRequest
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 190
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = Button1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
  end
end
