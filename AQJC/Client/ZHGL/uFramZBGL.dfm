inherited FrameZBGL: TFrameZBGL
  Width = 782
  inherited dxLayoutControl2: TdxLayoutControl
    Width = 782
    inherited cxGrid1: TcxGrid
      Top = 45
      Width = 811
      Height = 202
      TabOrder = 6
      ExplicitTop = 45
      ExplicitWidth = 811
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
    object cxDateEdit1: TcxDateEdit [7]
      Left = 70
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 0
      Height = 21
      Width = 121
    end
    object cxDateEdit2: TcxDateEdit [8]
      Left = 216
      Top = 13
      AutoSize = False
      Properties.View = cavClassic
      Style.HotTrack = False
      TabOrder = 1
      Height = 21
      Width = 121
    end
    object cxButton1: TcxButton [9]
      Left = 585
      Top = 13
      Width = 75
      Height = 25
      Caption = #26597#35810
      TabOrder = 3
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton [10]
      Left = 667
      Top = 13
      Width = 75
      Height = 25
      Caption = #29677#27425
      TabOrder = 4
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton [11]
      Left = 749
      Top = 13
      Width = 75
      Height = 25
      Caption = #29983#25104#20540#29677
      TabOrder = 5
      OnClick = cxButton3Click
    end
    object cbbDWMC: TcxComboBox [12]
      Left = 398
      Top = 13
      AutoSize = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.HotTrack = False
      TabOrder = 2
      Height = 21
      Width = 180
    end
    inherited dxLayoutGroup2: TdxLayoutGroup
      LayoutDirection = ldHorizontal
    end
    inherited dxLayoutGroupPage: TdxLayoutGroup
      Visible = False
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #26102#38388#33539#22260':'
      Control = cxDateEdit1
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #33267
      Control = cxDateEdit2
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton1'
      CaptionOptions.Visible = False
      Control = cxButton1
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton2'
      CaptionOptions.Visible = False
      Control = cxButton2
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = 'cxButton3'
      CaptionOptions.Visible = False
      Control = cxButton3
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup2
      CaptionOptions.Text = #21333#20301#21517#31216
      Control = cbbDWMC
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 180
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
end
